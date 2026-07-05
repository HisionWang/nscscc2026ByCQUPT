// designCPUByChisel/src/main/scala/backend/rename/RenameTable.scala
package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  重命名映射表（RenameTable / RAT）—— 重构版
 * ═══════════════════════════════════════════════════════════════
 *
 *  【关键改动】
 *  1. 快照保存使用 scanLeft 计算每条指令的精确中间状态
 *  2. 恢复从 2 周期缩短为 1 周期（直接覆盖 specTable）
 *  3. 快照管理由外部 SnapshotManager 统一控制
 *
 *  【快照保存时序分析】
 *    RAT 写入有 1 级流水延迟：
 *      specWritePorts(T0) → t1WSpec(T1) → specTable(T2)
 *
 *    保存快照时必须包含三级写入效果：
 *      (a) specTable 中已提交的写入（2+ 周期前）
 *      (b) t1WSpec 中待提交的写入（1 周期前）
 *      (c) specWritePorts(0..i) 当前周期的写入
 *
 *    基础状态 baseState = apply(specTable, t1WSpec)  ← 包含 + t1WSpec = specTableNext
 *    中间状态 remapStates = scanLeft(baseState, specWritePorts)
 *    指令 i 的快照 = remapStates(i+1)
 *      = 包含 在指令 i 之前所有写入 + 指令 i 自身写入 的精确状态
 */
class RenameTable(implicit p: Parameters) extends NSModule {
 
  val nReadPorts = CtrlBlockWidth * 3
 
  val io = IO(new Bundle {
    // ── 重定向 ──
    val redirect       = Input(Bool())
 
    // ── 快照恢复（来自 SnapshotManager）──
    val doRecover      = Input(Bool())
    val recoverId      = Input(UInt(log2Ceil(SnapshotNum).W))
 
    // ── 读端口（T0 地址，T1 数据）──
    val readPorts      = Vec(nReadPorts, new RatReadPort)
 
    // ── 草稿表写端口 ──
    val specWritePorts = Vec(CtrlBlockWidth, Input(new RatWritePort))
 
    // ── 架构表写端口 ──
    val archWritePorts = Vec(CommitWidth, Input(new RatWritePort))
 
    // ── 新增：架构表读端口（纯组合逻辑直出，用于外部追踪或系统回滚） ──
    // 数量通常与系统的提交宽度对齐，或根据调试需求设置
    val archReadPorts  = Vec(CommitWidth, new Bundle {
      val laddr = Input(UInt(log2Ceil(IntLogicRegs).W))
      val pdata = Output(UInt(PhyRegIdxWidth.W))
    })
 
    // ── 快照保存（来自 SnapshotManager 分配结果）──
    val snptSave       = Input(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
 
    // ── 快照无效化（来自 SnapshotManager）──
    val snptInvalidate = Input(Vec(SnapshotNum, Bool()))
  })
  val difftest = if (EnableDifftest) Some(IO(Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))) else None

  // ================================================================
  //  1. 双表初始化：逻辑寄存器 i 初始映射到物理寄存器 i
  // ================================================================
  val tableInit = VecInit.tabulate(IntLogicRegs)(_.U(PhyRegIdxWidth.W))
 
  val specTable     = RegInit(tableInit)
  val archTable     = RegInit(tableInit)
  val archTableNext = WireInit(archTable)
  if (EnableDifftest) {
    difftest.get := archTable
  }
 
  // ================================================================
  //  2. 快照存储
  // ================================================================
  val snapshots  = Reg(Vec(SnapshotNum, Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))
  val snptValids = RegInit(VecInit.fill(SnapshotNum)(false.B))
 
  // ================================================================
  //  3. T0→T1 打拍（读管线不变）
  // ================================================================
  // 重定向时 t1WSpec 清零：阻止错误路径的写入被提交
  val t1WSpec = RegNext(
    Mux(io.redirect, 0.U.asTypeOf(io.specWritePorts), io.specWritePorts)
  )
  val t1Raddr = io.readPorts.map(p => RegEnable(p.addr, !p.hold))
  val t1RdataByT1Raddr = VecInit(t1Raddr.map(addr => specTable(addr)))
 
  // ================================================================
  //  4. 计算基础状态 baseState = specTable + t1WSpec 写入效果
  //    这是"当前周期 specWritePorts 写入前"的最新推测状态
  //    等价于原代码中的 specTableNext
  // ================================================================
  val t1WSpecAddrOH = t1WSpec.map(w =>
    Mux(w.wen, UIntToOH(w.addr, IntLogicRegs), 0.U)
  )
 
  val baseState = Wire(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W)))
  for (i <- 0 until IntLogicRegs) {
    val matchVec  = t1WSpecAddrOH.map(oh => oh(i))
    val matchData = PriorityMux(matchVec.reverse, t1WSpec.map(_.data).reverse)
    val anyMatch  = VecInit(matchVec).asUInt.orR
    baseState(i) := Mux(anyMatch, matchData, specTable(i))
  }
 
  // ================================================================
  //  5. scanLeft 计算中间状态（iFuCore MapTable 核心算法）
  //
  //  remapStates(0)   = baseState（不含当前周期任何写入）
  //  remapStates(k+1) = baseState + specWritePorts(0..k) 的写入效果
  //
  //  这样每条指令都能精确保存"自己写入后"的状态快照：
  //    指令 0 的快照 = remapStates(1) = baseState + 指令0写入
  //    指令 2 的快照 = remapStates(3) = baseState + 指令0+1+2写入
  //
  //  关键：不同位置的分支指令，其快照会因为中间指令的
  //  写入效果不同而不同，这正是我们需要的！
  // ================================================================
  val remapStates = io.specWritePorts.scanLeft(baseState) { case (table, wPort) =>
    VecInit(table.zipWithIndex.map { case (preg, lreg) =>
      if (lreg == 0) 0.U(PhyRegIdxWidth.W)
      else Mux(wPort.wen && wPort.addr === lreg.U, wPort.data, preg)
    })
  }
 
  // ================================================================
  //  6. 快照保存：为每条需要快照的通道写入精确定位的状态
  //    通道 i 的快照 = remapStates(i+1)
  //    包含：specTable + t1WSpec + specWritePorts(0..i) 的全部写入
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    when(io.snptSave(i).valid) {
      snapshots(io.snptSave(i).bits) := remapStates(i + 1)
    }
  }
 
  // ================================================================
  //  7. 快照有效位更新
  //    保存时置 true，无效化时置 false
  //    无效化优先级高于保存（同槽位不会同时发生两者，但防御性编程）
  // ================================================================
  for (i <- 0 until SnapshotNum) {
    val nextValid = WireInit(snptValids(i))
 
    // 保存：置 true
    for (j <- 0 until CtrlBlockWidth) {
      when(io.snptSave(j).valid && io.snptSave(j).bits === i.U) {
        nextValid := true.B
      }
    }
 
    // 无效化：置 false（优先级更高）
    when(io.snptInvalidate(i)) {
      nextValid := false.B
    }
 
    snptValids(i) := nextValid
  }
 
  // ================================================================
  //  8. 草稿表更新（1 周期恢复！）
  //
  //  原方案：redirect → t1Redirect → t2Redirect → specTable 恢复（3 周期）
  //  新方案：redirect 当周期直接覆盖 specTable（1 周期）
  //
  //  正确性分析：
  //    - 误预测恢复：specTable ← snapshots(recoverId)
  //      快照已包含 t1WSpec + specWritePorts(0..i) 的效果
  //      恢复后，t1WSpec 被清零（下一周期），不会重复写入
  //    - 异常恢复（无快照）：specTable ← archTable
  //    - 正常：specTable ← baseState（含 t1WSpec 写入）
  // ================================================================
  when(io.redirect) {
    when(io.doRecover && snptValids(io.recoverId)) {
      // 误预测：从快照恢复
      specTable := snapshots(io.recoverId)
    }.otherwise {
      // 异常/中断：回退到架构表
      specTable := archTable
    }
  }.otherwise {
    // 正常更新
    specTable := baseState
  }
 
  // ================================================================
  //  9. 架构表写入与旁路读取（不变）
  // ================================================================
  val archWriteAddrOH = io.archWritePorts.map(w =>
    Mux(w.wen, UIntToOH(w.addr, IntLogicRegs), 0.U)
  )
 
  for ((next, i) <- archTableNext.zipWithIndex) {
    val matchVec  = archWriteAddrOH.map(oh => oh(i))
    val matchData = PriorityMux(matchVec.reverse, io.archWritePorts.map(_.data).reverse)
    val anyMatch  = VecInit(matchVec).asUInt.orR
    next := Mux(anyMatch, matchData, archTable(i))
  }
  archTable := archTableNext
 
  // 架构表读端口 + 旁路（不变）
  for ((port, rIdx) <- io.archReadPorts.zipWithIndex) {
    val earlierWritePorts = io.archWritePorts.zipWithIndex.filter { case (_, wIdx) => wIdx < rIdx }
    if (earlierWritePorts.nonEmpty) {
      val archBypassHits  = earlierWritePorts.map { case (w, _) => w.wen && (w.addr === port.laddr) }
      val archBypassDatas = earlierWritePorts.map { case (w, _) => w.data }
      val archBypassData  = PriorityMux(archBypassHits.reverse, archBypassDatas.reverse)
      val anyArchHit      = VecInit(archBypassHits).asUInt.orR
      port.pdata := Mux(anyArchHit, archBypassData, archTable(port.laddr))
    } else {
      port.pdata := archTable(port.laddr)
    }
  }
 
  // ================================================================
  //  10. 读端口输出 + T0→T1 跨周期旁路（修改重定向处理）
  // ================================================================
  for ((r, i) <- io.readPorts.zipWithIndex) {
    val t0Bypass = io.specWritePorts.map(w => w.wen && (w.addr === r.addr))
    // 重定向时旁路清零，防止错误路径的旁路数据污染正确路径
    val t1Bypass = RegNext(
      Mux(io.redirect, 0.U.asTypeOf(VecInit(t0Bypass)), VecInit(t0Bypass))
    )
    val bypassData = PriorityMux(t1Bypass.reverse, t1WSpec.map(_.data).reverse)
    r.data := Mux(t1Bypass.asUInt.orR, bypassData, t1RdataByT1Raddr(i))
  }
}
