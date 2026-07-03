package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 * 重命名映射表（RenameTable / RAT）
 * ═══════════════════════════════════════════════════════════════
 */
class RenameTable(implicit p: Parameters) extends NSModule {
 
  // 读端口数量：每路指令需要 rs1 + rs2 + rd（stale_pdst）共 3 个读端口
  val nReadPorts = CtrlBlockWidth * 3
 
  val io = IO(new Bundle {
    val redirect       = Input(Bool())
 
    // ── 读端口（T0 地址到达，T1 数据输出） —— 针对推测用的草稿表 ──
    // 排布：[0..CtrlBlockWidth-1] = rs1
    //       [CtrlBlockWidth..2*CtrlBlockWidth-1] = rs2
    //       [2*CtrlBlockWidth..3*CtrlBlockWidth-1] = rd(stale_pdst)
    val readPorts      = Vec(nReadPorts, new RatReadPort)
 
    // ── 草稿表写端口（T0 到达，T1 写入） ──
    val specWritePorts = Vec(CtrlBlockWidth, Input(new RatWritePort))
 
    // ── 架构表写端口（提交时当拍写入） ──
    val archWritePorts = Vec(CommitWidth, Input(new RatWritePort))
    val debugArchState = Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W)))
 
    // ── 新增：架构表读端口（纯组合逻辑直出，用于外部追踪或系统回滚） ──
    // 数量通常与系统的提交宽度对齐，或根据调试需求设置
    val archReadPorts  = Vec(CommitWidth, new Bundle {
      val laddr = Input(UInt(log2Ceil(IntLogicRegs).W))  // 输入逻辑寄存器号
      val pdata = Output(UInt(PhyRegIdxWidth.W))         // 输出物理寄存器号
    })
 
    // ── 快照控制 ──
    val snptRemaining = Output(UInt(log2Ceil(SnapshotNum + 1).W))
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
  io.debugArchState := archTable
 
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
  val t1Raddr = io.readPorts.map(p => RegEnable(p.addr, !p.hold))
 
  // 用 T1 读地址从 spec_table 同步读（T1 拍）
  val t1RdataByT1Raddr = VecInit(t1Raddr.map(addr => specTable(addr)))
 
  // ================================================================
  //  3. 快照管理（环形队列，SnapshotNum 个槽位）
  // ================================================================
  val snapshots  = Reg(Vec(SnapshotNum, Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))
  val snptValids = RegInit(VecInit.fill(SnapshotNum)(false.B))
  val snptEnqPtr = RegInit(0.U(log2Ceil(SnapshotNum).W))
  val snptDeqPtr = RegInit(0.U(log2Ceil(SnapshotNum).W))
 
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


   
  // 在快照管理逻辑中新增计算：
  // 环形队列剩余空间 = SnapshotNum - (enqPtr - deqPtr) mod SnapshotNum - 1
  // 简化：计数有效快照数量，用总数减去
  val snptCount = PopCount(snptValids)
  io.snptRemaining := (SnapshotNum.U - snptCount)
 
  // ================================================================
  //  4. 草稿表写入逻辑（T1 执行）
  // ================================================================
  val t1WSpecAddrOH = t1WSpec.map(w =>
    Mux(w.wen, UIntToOH(w.addr, IntLogicRegs), 0.U)
  )
 
  val t2Redirect   = RegNext(t1Redirect, false.B)
  val t2SnptSelect = RegNext(RegNext(io.snptSelect, 0.U), 0.U)
  
  for ((next, i) <- specTableNext.zipWithIndex) {
    val matchVec = t1WSpecAddrOH.map(oh => oh(i))
    val matchData   = PriorityMux(matchVec.reverse, t1WSpec.map(_.data).reverse)
    val anyMatch = VecInit(matchVec).asUInt.orR
 
    next := Mux(
      t2Redirect,
      Mux(snptValids(t2SnptSelect), snapshots(t2SnptSelect)(i), archTable(i)),
      Mux(anyMatch, matchData, specTable(i))
    )
  }
  specTable := specTableNext
 
  // ================================================================
  //  5. 架构表写入与旁路读取
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
 
// ── 修正后的组合逻辑实现 ──
  // 为了防止同周期读写冲突，并严格遵守多发射指令的程序语义顺序：
  // 读端口只允许从语义上更靠前（索引更小）的写端口旁路数据。
  for ((port, rIdx) <- io.archReadPorts.zipWithIndex) {
    
    // 1. 过滤出在当前读指令之前的所有写端口（wIdx < rIdx）
    // （假设：索引 0 为当前发射组中最老的指令。如果是相反的端序，请改为 wIdx > rIdx）
    val earlierWritePorts = io.archWritePorts.zipWithIndex.filter { case (_, wIdx) => wIdx < rIdx }
    
    if (earlierWritePorts.nonEmpty) {
      // 2. 提取这些较老写端口的命中情况和数据
      val archBypassHits = earlierWritePorts.map { case (w, _) => w.wen && (w.addr === port.laddr) }
      val archBypassDatas = earlierWritePorts.map { case (w, _) => w.data }
      
      // 3. 利用 PriorityMux 和 reverse 选出最近的一次写入
      // reverse 使得离当前指令最近的写端口（最大的 wIdx）排在最前面优先匹配
      val archBypassData = PriorityMux(archBypassHits.reverse, archBypassDatas.reverse)
      val anyArchHit     = VecInit(archBypassHits).asUInt.orR
  
      // 4. 最终组合直出：有旁路命中则用旁路，否则读表
      port.pdata := Mux(anyArchHit, archBypassData, archTable(port.laddr))
    } else {
      // 如果当前是第一条指令 (rIdx == 0)，前面没有任何写指令，直接读表即可
      port.pdata := archTable(port.laddr)
    }
  }
 
  // ================================================================
  //  6. 读端口输出 + T0→T1 跨周期旁路
  // ================================================================
  for ((r, i) <- io.readPorts.zipWithIndex) {
    val t0Bypass = io.specWritePorts.map(w => w.wen && (w.addr === r.addr))
 
    val t1Bypass = RegNext(
      Mux(io.redirect, 0.U.asTypeOf(VecInit(t0Bypass)), VecInit(t0Bypass))
    )
 
    val bypassData = PriorityMux(t1Bypass.reverse, t1WSpec.map(_.data).reverse)
 
    r.data := Mux(t1Bypass.asUInt.orR, bypassData, t1RdataByT1Raddr(i))
  }
}