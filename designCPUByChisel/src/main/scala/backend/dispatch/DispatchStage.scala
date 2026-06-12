package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  分发流水级（DispatchStage）
 * ═══════════════════════════════════════════════════════════════
 *
 *  职责：
 *    1. 将 RenamedInst 写入 ROB
 *    2. 为访存指令生成 LQ/SQ 指针
 *    3. 查询 BusyTable（源寄存器是否就绪）
 *    4. 计算分发目标发射队列
 *    5. 向对应 Issue Queue 输出
 *
 *  流水级风格：严格对齐 DecodeStage 的同进同出模式
 * ═══════════════════════════════════════════════════════════════
 */
class DispatchStage(implicit p: Parameters) extends NSModule {
  val io = IO(new DispatchStageIO)
 
  // ================================================================
  //  子模块实例化
  // ================================================================
  val busyTable = Module(new BusyTable)
 
  // ================================================================
  //  Phase 1: 流水级寄存器（同进同出，对齐 DecodeStage 风格）
  // ================================================================
  val stgValid  = RegInit(false.B)
  val laneValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData   = Reg(Vec(CtrlBlockWidth, new RenamedInst))

  val targetQueue = Wire(Vec(CtrlBlockWidth, UInt(IssueQueueIdx.width.W)))
  val outReadyAll = (0 until CtrlBlockWidth).map(i =>
    !laneValid(i) || io.out(targetQueue(i)).ready
  ).reduce(_ && _)

  // 简化：所有 IQ 都 ready 才算 ready
  val allIqReady = io.iqFeedback.canAccept.foldLeft(true.B)(_ && _)
  //val outFire = stgValid && allIqReady
    // OB 有空间才能 fire
  val robCanEnq = io.robEnq.canEnq
  val outFire = stgValid && allIqReady && robCanEnq
 
  val stgReady = !stgValid || outFire
  val inValid  = io.in.map(_.valid).reduce(_ || _)
  val inFire   = inValid && stgReady
 
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := stgReady
  }
 
  when(io.flush || io.redirect.valid) {
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) { laneValid(i) := false.B }
  }.elsewhen(inFire) {
    stgValid := true.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := io.in(i).valid
      stgData(i)   := io.in(i).bits
    }
  }.elsewhen(outFire) {
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) { laneValid(i) := false.B }
  }
 
  // ================================================================
  //  Phase 2: 组合逻辑
  // ================================================================
 
  // ── 2-1. 计算每条指令的目标 Issue Queue ──
  
  for (i <- 0 until CtrlBlockWidth) {
    targetQueue(i) := MuxLookup(stgData(i).ctrl.fuType, IssueQueueIdx.ALU.U, Seq(
      FuType.alu     -> IssueQueueIdx.ALU.U,
      FuType.bru     -> IssueQueueIdx.BRU.U,
      FuType.csr     -> IssueQueueIdx.BRU.U,
      FuType.mulDiv  -> IssueQueueIdx.MULDIV.U,
      FuType.lsu     -> IssueQueueIdx.LSU.U,
    ))
  }
 
  // ── 2-2. BusyTable 查询 ──
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.readReq(i * 2)     := stgData(i).prs1
    busyTable.io.readReq(i * 2 + 1) := stgData(i).prs2
  }
 
  // 分配置忙：需要写回的指令的 pdst 置忙
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.allocReq(i).valid := outFire && laneValid(i) && stgData(i).rdValid
    busyTable.io.allocReq(i).bits  := stgData(i).pdst
  }
 
  // 写回清忙：来自执行单元（当前置为无效）
  for (i <- 0 until WbBusWidth) {
    busyTable.io.wbReq(i).valid := false.B
    busyTable.io.wbReq(i).bits  := 0.U
  }
 
  // ── 2-3. LQ/SQ 指针生成 ──
  val lqHeadPtr = RegInit(0.U(log2Ceil(LqSize).W))
  val sqHeadPtr = RegInit(0.U(log2Ceil(SqSize).W))
 
  val lqAllocCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && stgData(i).ctrl.memRead)))
  val sqAllocCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && stgData(i).ctrl.memWrite)))
 
  when(outFire) {
    lqHeadPtr := lqHeadPtr + lqAllocCount
    sqHeadPtr := sqHeadPtr + sqAllocCount
  }
  when(io.flush || io.redirect.valid) {
    lqHeadPtr := 0.U
    sqHeadPtr := 0.U
  }
 
  // 为每条访存指令计算 LQ/SQ 索引
  val lqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(LqSize).W)))
  val sqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(SqSize).W)))
  var lqOffset  = 0.U(log2Ceil(LqSize).W)
  var sqOffset  = 0.U(log2Ceil(SqSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    lqIndices(i) := lqHeadPtr + lqOffset
    sqIndices(i) := sqHeadPtr + sqOffset
    lqOffset = lqOffset + (laneValid(i) && stgData(i).ctrl.memRead).asUInt
    sqOffset = sqOffset + (laneValid(i) && stgData(i).ctrl.memWrite).asUInt
  }
 
  // ── 2-4. 组装输出 ──
  // 输出按 Issue Queue 分组：io.out(qIdx) 对应第 qIdx 个队列
  // 同一周期最多一条指令发往某个队列（简化仲裁）
  for (q <- 0 until IssueQueueIdx.NUM) {
    io.out(q).valid := false.B
    io.out(q).bits  := DontCare
  }
 
  for (i <- 0 until CtrlBlockWidth) {
    val u = Wire(new DispatchedInst)
 
    // 直传字段
    u.pc         := stgData(i).pc
    u.inst       := stgData(i).inst
    u.ctrl       := stgData(i).ctrl
    u.excpVec    := stgData(i).excpVec
    u.imm        := stgData(i).imm
    u.csrAddress := stgData(i).csrAddress
    u.pdInfo     := stgData(i).pdInfo
    u.ldst       := stgData(i).ldst
    u.lrs1       := stgData(i).lrs1
    u.lrs2       := stgData(i).lrs2
    u.pdst       := stgData(i).pdst
    u.prs1       := stgData(i).prs1
    u.prs2       := stgData(i).prs2
    u.oldPdst    := stgData(i).oldPdst
    u.rs1Valid   := stgData(i).rs1Valid
    u.rs2Valid   := stgData(i).rs2Valid
    u.rdValid    := stgData(i).rdValid
    u.robIdx     := stgData(i).robIdx
 
    // Dispatch 新增字段
    u.robIdxFull := Cat(false.B, stgData(i).robIdx)  // flag 暂填 0
    u.lqIdx      := lqIndices(i)
    u.sqIdx      := sqIndices(i)
    u.issueQueue := targetQueue(i)
    u.prs1Busy   := Mux(stgData(i).rs1Valid && stgData(i).lrs1 =/= 0.U,
                        busyTable.io.readResp(i * 2), false.B)
    u.prs2Busy   := Mux(stgData(i).rs2Valid && stgData(i).lrs2 =/= 0.U,
                        busyTable.io.readResp(i * 2 + 1), false.B)
 
    // 发往对应 Issue Queue
    val qIdx = targetQueue(i)
    when(stgValid && laneValid(i) && allIqReady) {
      io.out(qIdx).valid := true.B
      io.out(qIdx).bits  := u
    }
  }

    // ── 2-5. ROB 入队请求 ──
  // 仅当本级 fire（整组发射）时才真正写入 ROB
  
  // 整组发射条件：下游 IQ 全 ready 且 ROB 有空间
  val dispatchFire = stgValid && allIqReady && robCanEnq
 
  // 用 dispatchFire 替代之前的 outFire（见下方 Phase 1 修正）
  // outFire 应依赖 robCanEnq
 
  for (i <- 0 until CtrlBlockWidth) {
    io.robEnq.valid(i) := dispatchFire && laneValid(i) && stgValid
    io.robEnq.valids(i)   := laneValid(i) && stgValid
    io.robEnq.bits(i).pc       := stgData(i).pc
    io.robEnq.bits(i).inst     := stgData(i).inst
    io.robEnq.bits(i).pdst     := stgData(i).pdst
    io.robEnq.bits(i).oldPdst  := stgData(i).oldPdst
    io.robEnq.bits(i).ldst     := stgData(i).ldst
    io.robEnq.bits(i).rfWen    := stgData(i).ctrl.rfWen
    io.robEnq.bits(i).memRead  := stgData(i).ctrl.memRead
    io.robEnq.bits(i).memWrite := stgData(i).ctrl.memWrite
    io.robEnq.bits(i).csrWen   := stgData(i).ctrl.csrWen
    io.robEnq.bits(i).fuType   := stgData(i).ctrl.fuType
    io.robEnq.bits(i).excpVec  := stgData(i).excpVec
    io.robEnq.bits(i).robIdx   := stgData(i).robIdx
  }


}