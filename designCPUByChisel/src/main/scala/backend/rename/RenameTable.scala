package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  重命名映射表（RenameTable / RAT）
 * ═══════════════════════════════════════════════════════════════
 *
 *  【双表结构】
 *    spec_table（草稿表）：推测执行中的逻辑→物理映射
 *    arch_table（架构表）：已提交的确定映射，仅在提交时更新
 *
 *  【T0/T1 两拍读写时序】（严格对齐香山实现）
 *
 *    T0（译码级组合输出阶段）：
 *      · 读地址 r.addr 到达（来自 DecodeStage.io.ratRead）
 *      · 写端口 specWritePorts 也在 T0 到达（由 RenameStage 计算）
 *      · 本周期不做任何寄存器写入
 *
 *    T1（重命名级寄存器阶段）：
 *      · T0 的写端口打一拍后（t1_wSpec）真正写入 spec_table
 *      · T0 的读地址打一拍后（t1_raddr）用于同步读 spec_table
 *      · 旁路：t1_bypass 检查 T0 的写是否命中 T0 的读地址
 *              若命中，读结果用 t1_wSpec 的数据覆盖（高索引优先）
 *
 *  【快照机制】
 *    spec_table 快照：用环形队列管理，条件分支时 enq，提交时 deq
 *    误预测时用选中快照覆盖 spec_table
 * ═══════════════════════════════════════════════════════════════
 */
class RenameTable(implicit p: Parameters) extends NSModule {
 
  // 读端口数量：每路指令需要 rs1 + rs2 + rd（stale_pdst）共 3 个读端口
  val nReadPorts = CtrlBlockWidth * 3
 
  val io = IO(new Bundle {
    val redirect       = Input(Bool())
 
    // ── 读端口（T0 地址到达，T1 数据输出） ──
    // 排布：[0..CtrlBlockWidth-1] = rs1
    //       [CtrlBlockWidth..2*CtrlBlockWidth-1] = rs2
    //       [2*CtrlBlockWidth..3*CtrlBlockWidth-1] = rd(stale_pdst)
    val readPorts      = Vec(nReadPorts, new RatReadPort)
 
    // ── 草稿表写端口（T0 到达，T1 写入） ──
    val specWritePorts = Vec(CtrlBlockWidth, Input(new RatWritePort))
 
    // ── 架构表写端口（提交时当拍写入） ──
    val archWritePorts = Vec(CommitWidth, Input(new RatWritePort))
 
    // ── 快照控制 ──
    val snptEnq      = Input(Bool())
    val snptDeq      = Input(Bool())
    val snptRedirect = Input(Bool())
    val snptSelect   = Input(UInt(log2Ceil(SnapshotNum).W))
  })
  
  // ================================================================
  //  1. 双表初始化：逻辑寄存器 i 初始映射到物理寄存器 i
  // ================================================================
  val tableInit = VecInit.tabulate(IntLogicRegs)(_.U(PhyRegIdxWidth.W))
 
  val specTable     = RegInit(tableInit)
  val specTableNext = WireInit(specTable)
 
  val archTable     = RegInit(tableInit)
  val archTableNext = WireInit(archTable)
 
  // ================================================================
  //  2. T0→T1 打拍
  // ================================================================
 
  // 重定向信号打一拍（T1 可见）
  val t1Redirect = RegNext(io.redirect, false.B)
 
  // T0 写端口打一拍：重定向时清零（丢弃错误路径上的推测写）
  val t1WSpec = RegNext(
    Mux(io.redirect, 0.U.asTypeOf(io.specWritePorts), io.specWritePorts)
  )
 
  // T0 读地址打一拍（与 T1 的写数据对齐）
  //val t1Raddr = io.readPorts.map(r => RegNext(r.addr))
  val t1Raddr = io.readPorts.map(p => RegEnable(p.addr, !p.hold))
 
  // 用 T1 读地址从 spec_table 同步读（T1 拍）
  val t1RdataByT1Raddr = VecInit(t1Raddr.map(addr => specTable(addr)))
 
  // ================================================================
  //  3. 快照管理（环形队列，SnapshotNum 个槽位）
  //  参考香山 SnapshotGenerator 实现
  // ================================================================
  val snapshots  = Reg(Vec(SnapshotNum, Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))
  val snptValids = RegInit(VecInit.fill(SnapshotNum)(false.B))
  val snptEnqPtr = RegInit(0.U(log2Ceil(SnapshotNum).W))
  val snptDeqPtr = RegInit(0.U(log2Ceil(SnapshotNum).W))
 
  // 快照满判断（环形队列：enq+1 == deq 为满）
  val snptFull = (snptEnqPtr + 1.U) === snptDeqPtr
 
  // 快照入队（T1 执行，保存当前 spec_table）
  val t1SnptEnq = RegNext(io.snptEnq && !snptFull, false.B)
  val t1EnqPtr  = RegNext(snptEnqPtr)
  when(t1SnptEnq && !t1Redirect) {
    snapshots(t1EnqPtr)  := specTable
    snptValids(t1EnqPtr) := true.B
    snptEnqPtr           := t1EnqPtr + 1.U
  }
 
  // 快照出队（分支正确提交）
  val t1SnptDeq = RegNext(io.snptDeq, false.B)
  when(t1SnptDeq && !t1Redirect) {
    snptValids(snptDeqPtr) := false.B
    snptDeqPtr             := snptDeqPtr + 1.U
  }
 
  // ================================================================
  //  4. 草稿表写入逻辑（T1 执行）
  //
  //  写优先级：多个写端口写同一逻辑寄存器时，索引大的优先
  //  恢复逻辑（T2 时刻，即 RegNext(t1Redirect)）：
  //    · 若有可用快照（snptSelect 指向的槽位有效）→ 用快照恢复
  //    · 否则 → 用架构表恢复
  // ================================================================
  val t1WSpecAddrOH = t1WSpec.map(w =>
    Mux(w.wen, UIntToOH(w.addr, IntLogicRegs), 0.U)
  )
 
  // T2 时刻的恢复决策
  val t2Redirect   = RegNext(t1Redirect, false.B)
  val t2SnptSelect = RegNext(RegNext(io.snptSelect, 0.U), 0.U)
  
  //下面的操作对象就是每一个RAT的表项了
  // i即表示第i各表项
  for ((next, i) <- specTableNext.zipWithIndex) {
    val matchVec = t1WSpecAddrOH.map(oh => oh(i))
    // 高索引优先（reverse + PriorityMux = 取最后一个命中）
    // 选择写的数据
    val matchData   = PriorityMux(matchVec.reverse, t1WSpec.map(_.data).reverse)
    val anyMatch = VecInit(matchVec).asUInt.orR
 
    next := Mux(
      t2Redirect,
      // ── 恢复：优先用快照，否则用架构表 ──
      Mux(snptValids(t2SnptSelect), snapshots(t2SnptSelect)(i), archTable(i)),
      // ── 正常写入 ──
      Mux(anyMatch, matchData, specTable(i))
    )
  }
  specTable := specTableNext
 
  // ================================================================
  //  5. 架构表写入（提交时当拍写入，高索引优先）
  // ================================================================
  val archWriteAddrOH = io.archWritePorts.map(w =>
    Mux(w.wen, UIntToOH(w.addr, IntLogicRegs), 0.U)
  )

  for ((next, i) <- archTableNext.zipWithIndex) {
    val matchVec = archWriteAddrOH.map(oh => oh(i))
    val matchData   = PriorityMux(matchVec.reverse, io.archWritePorts.map(_.data).reverse)
    val anyMatch = VecInit(matchVec).asUInt.orR
 
    next := Mux(anyMatch, matchData, archTable(i))
    
  }
  archTable := archTableNext
 
  // ================================================================
  //  6. 读端口输出 + T0→T1 跨周期旁路[这个注释写得非常好]
  //
  //  旁路必要性：因为延迟写了一拍，所以要设置这样一个旁路检测
  //    T0 指令 j [in rename] 写 RAT[r5]=p30（specWritePort(j)）
  //    T0 指令 i [in decode] 读 RAT[r5]（readPort）
  //    T0 的写到 T2 才写入 spec_table，
  //    所以指令i在 T1 [in rename]读出的是旧值
  //    → t1_bypass 在 T1 用 t1_wSpec 的写数据覆盖读结果
  //
  //  注意：同周期级内旁路（j < i 的通道间依赖）在 RenameStage 中
  //        进一步处理，本模块只处理跨周期（T0→T1）旁路。
  // ================================================================
  for ((r, i) <- io.readPorts.zipWithIndex) {
    // T0：检查每个草稿写端口是否命中当前读地址
    val t0Bypass = io.specWritePorts.map(w => w.wen && (w.addr === r.addr))
    //val t0Bypass = io.specWritePorts.map(w => w.wen && Mux(r.hold, w.addr === t1Raddr(i), w.addr === r.addr))
 
    // T1：旁路命中标志打一拍（重定向时清零）
    val t1Bypass = RegNext(
      Mux(io.redirect,
        0.U.asTypeOf(VecInit(t0Bypass)),
        VecInit(t0Bypass))
    )
 
    // T1：从命中的写端口取优先级最高的数据（高索引优先）
    val bypassData = PriorityMux(t1Bypass.reverse, t1WSpec.map(_.data).reverse)
 
    // 最终读结果
    r.data := Mux(t1Bypass.asUInt.orR, bypassData, t1RdataByT1Raddr(i))
  }
}