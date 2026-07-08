package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.regfile._
import nscscc.backend.issue._
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 * 分发流水级（DispatchStage）—— 5 IQ 版本 (LSQ 单端口发射优化版)
 * ═══════════════════════════════════════════════════════════════
 *
 * 优化说明：
 * 1. 彻底解决 LSQ 批量分配造成的指针脏读时序问题。
 * 2. LSQ 的请求接口改为单个（伴随 IQ4 的发射同步触发）。
 * 3. 只有当 LSQ 且 IQ 均有空位时，访存指令才被允许参与发射竞争。
 * 4. Ptr 状态在成功发射当拍自增 1，杜绝批量加法逻辑。
 * ═══════════════════════════════════════════════════════════════
 */
class DispatchStage(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new RenamedInst)))
    val q1IQEnq  = Vec(IQEnqPorts.Q1, ValidIO(new DispatchedInst))
    val q2IQEnq  = Vec(IQEnqPorts.Q2, ValidIO(new DispatchedInst))
    val q3IQEnq  = Vec(IQEnqPorts.Q3, ValidIO(new DispatchedInst))
    val q4IQEnq  = Vec(IQEnqPorts.Q4, ValidIO(new DispatchedInst))
    val q5IQEnq  = Vec(IQEnqPorts.Q5, ValidIO(new DispatchedInst))
    val iqFeedback = Input(new IssueQueueFeedback)
    
    // 注意：这里的 LsEnqIO 已经被视作单请求端口 (Valid(new LsEnqReq))
    val lsEnq   = new LsEnqIO 
    
    val robEnq  = Flipped(new RobEnqIO)
    val flush   = Input(Bool())
    //val redirect = Input(new RedirectInfo)

    val wakeupPorts   = Input(Vec(IQNumWakeupPorts, Valid(new IssueWakeup)))
  })
 
  val busyTable = Module(new BusyTable)
 
  // ================================================================
  //  引入具体的队列指针类型
  // ================================================================
  //class LqPtr extends CircularQueuePtr[LqPtr](LqSize)
  //class SqPtr extends CircularQueuePtr[SqPtr](SqSize)

  // ================================================================
  //  流水级寄存器 (已精简冗余的 LSQ 状态)
  // ================================================================
  val laneValid   = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val robWritten  = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val iqSent      = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData     = Reg(Vec(CtrlBlockWidth, new RenamedInst))
 
  // ── 需求掩码 ──
  val needRob = VecInit((0 until CtrlBlockWidth).map(i => laneValid(i) && !robWritten(i)))
  val needIq  = VecInit((0 until CtrlBlockWidth).map(i => laneValid(i) && !iqSent(i)))
  
  val stgValid = needIq.asUInt.orR
    
  // ================================================================
  //  一、指令分类（基于 needIq）
  // ================================================================
  val isAluLane   = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.alu))
  val isCsrLane   = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && (stgData(i).ctrl.fuType === FuType.csr || stgData(i).ctrl.isPriv)))
  val isDivLane   = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.div))
  val isMulLane   = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.mul))
  val isJmpLane   = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.bru))
  val isLoadLane  = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memRead))
  val isStoreLane = VecInit((0 until CtrlBlockWidth).map(i => needIq(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memWrite))
 
  // ================================================================
  //  二、计算IQ 可用性
  // ================================================================
  val q1Avail = io.iqFeedback.q1FreeEntries > 0.U
  val q2Avail = io.iqFeedback.q2FreeEntries > 0.U
  val q3Avail = io.iqFeedback.q3FreeEntries > 0.U
  val q4Avail = io.iqFeedback.q4FreeEntries > 0.U
  val q5Avail = io.iqFeedback.q5FreeEntries > 0.U
 
  def truncateMask(isMatch: Vec[Bool], maxPorts: Int): Vec[Bool] = {
    val result = Wire(Vec(CtrlBlockWidth, Bool()))
    var count = 0.U(log2Ceil(maxPorts + 1).W)
    for (i <- 0 until CtrlBlockWidth) {
      result(i) := isMatch(i) && (count < maxPorts.U)
      count = count + (isMatch(i) && result(i)).asUInt
    }
    result
  }
 
  // ================================================================
  //  Phase 1: 专属指令路由
  // ================================================================
  val csrToQ1 = truncateMask(VecInit((0 until CtrlBlockWidth).map(i => isCsrLane(i) && q1Avail)), 1)
  val divToQ2 = truncateMask(VecInit( (0 until CtrlBlockWidth).map(i => isDivLane(i) && q2Avail)), 1)
  val isMulOrJmpLane = VecInit((0 until CtrlBlockWidth).map(i => (isMulLane(i) || isJmpLane(i)) && q3Avail))
  val mulJmpToQ3 = truncateMask(isMulOrJmpLane, 1)
  
  var consumedMask = csrToQ1.asUInt | divToQ2.asUInt | mulJmpToQ3.asUInt
  
  val q1FreeAfterExclusive = !csrToQ1.asUInt.orR && q1Avail
  val q2FreeAfterExclusive = !divToQ2.asUInt.orR && q2Avail
  val q3FreeAfterExclusive = !mulJmpToQ3.asUInt.orR && q3Avail
 
  // ================================================================
  //  Phase 2: ALU 动态负载均衡分配
  // ================================================================
  val q1CanAcceptAlu = q1FreeAfterExclusive
  val q2CanAcceptAlu = q2FreeAfterExclusive
  val q3CanAcceptAlu = q3FreeAfterExclusive
 
  val q1AluPriority = Mux(q1CanAcceptAlu, io.iqFeedback.q1FreeEntries, 0.U(IQ1Width.W))
  val q2AluPriority = Mux(q2CanAcceptAlu, io.iqFeedback.q2FreeEntries, 0.U(IQ2Width.W))
  val q3AluPriority = Mux(q3CanAcceptAlu, io.iqFeedback.q3FreeEntries, 0.U(IQ3Width.W))
 
  val rank0OH = Wire(Vec(3, Bool()))
  rank0OH(0) := (q1AluPriority >= q2AluPriority) && (q1AluPriority >= q3AluPriority)
  rank0OH(1) := !rank0OH(0) && (q2AluPriority >= q3AluPriority)
  rank0OH(2) := !rank0OH(0) && !rank0OH(1)

  val exclRank0 = VecInit(Seq(q1AluPriority, q2AluPriority, q3AluPriority).zip(rank0OH).map {
    case (p, oh) => Mux(oh, 0.U, p)
  })
  val rank1OH = Wire(Vec(3, Bool()))
  rank1OH(0) := !rank0OH(0) && (exclRank0(0) >= exclRank0(1)) && (exclRank0(0) >= exclRank0(2))
  rank1OH(1) := !rank0OH(1) && !rank1OH(0) && (exclRank0(1) >= exclRank0(2))
  rank1OH(2) := !rank0OH(2) && !rank1OH(0) && !rank1OH(1)
 
  val rank2OH = Wire(Vec(3, Bool()))
  rank2OH(0) := !rank0OH(0) && !rank1OH(0)
  rank2OH(1) := !rank0OH(1) && !rank1OH(1)
  rank2OH(2) := !rank0OH(2) && !rank1OH(2)

  val rank0HasCap = Mux(rank0OH(0), q1CanAcceptAlu, Mux(rank0OH(1), q2CanAcceptAlu, q3CanAcceptAlu))
  val rank1HasCap = Mux(rank1OH(0), q1CanAcceptAlu, Mux(rank1OH(1), q2CanAcceptAlu, q3CanAcceptAlu))
  val rank2HasCap = Mux(rank2OH(0), q1CanAcceptAlu, Mux(rank2OH(1), q2CanAcceptAlu, q3CanAcceptAlu))

  val aluCandR1 = VecInit((0 until CtrlBlockWidth).map(i => isAluLane(i) && !consumedMask(i)))
  val aluRound1 = truncateMask(aluCandR1, 1)
  val aluRound1Valid = aluRound1.asUInt.orR && rank0HasCap
  val aluRound1ToQ1 = aluRound1Valid && rank0OH(0)
  val aluRound1ToQ2 = aluRound1Valid && rank0OH(1)
  val aluRound1ToQ3 = aluRound1Valid && rank0OH(2)
  consumedMask = consumedMask | Mux(aluRound1Valid, aluRound1.asUInt, 0.U)
 
  val aluCandR2 = VecInit((0 until CtrlBlockWidth).map(i => isAluLane(i) && !consumedMask(i)))
  val aluRound2 = truncateMask(aluCandR2, 1)
  val aluRound2Valid = aluRound2.asUInt.orR && rank1HasCap
  val aluRound2ToQ1 = aluRound2Valid && rank1OH(0)
  val aluRound2ToQ2 = aluRound2Valid && rank1OH(1)
  val aluRound2ToQ3 = aluRound2Valid && rank1OH(2)
  consumedMask = consumedMask | Mux(aluRound2Valid, aluRound2.asUInt, 0.U)
 
  val aluCandR3 = VecInit((0 until CtrlBlockWidth).map(i => isAluLane(i) && !consumedMask(i)))
  val aluRound3 = truncateMask(aluCandR3, 1)
  val aluRound3Valid = aluRound3.asUInt.orR && rank2HasCap
  val aluRound3ToQ1 = aluRound3Valid && rank2OH(0)
  val aluRound3ToQ2 = aluRound3Valid && rank2OH(1)
  val aluRound3ToQ3 = aluRound3Valid && rank2OH(2)
  consumedMask = consumedMask | Mux(aluRound3Valid, aluRound3.asUInt, 0.U)
 
  val aluToQ1 = VecInit((0 until CtrlBlockWidth).map(i => (aluRound1(i) && aluRound1ToQ1) || (aluRound2(i) && aluRound2ToQ1) || (aluRound3(i) && aluRound3ToQ1)))
  val aluToQ2 = VecInit((0 until CtrlBlockWidth).map(i => (aluRound1(i) && aluRound1ToQ2) || (aluRound2(i) && aluRound2ToQ2) || (aluRound3(i) && aluRound3ToQ2)))
  val aluToQ3 = VecInit((0 until CtrlBlockWidth).map(i => (aluRound1(i) && aluRound1ToQ3) || (aluRound2(i) && aluRound2ToQ3) || (aluRound3(i) && aluRound3ToQ3)))
 
  val q1Final = VecInit((0 until CtrlBlockWidth).map(i => csrToQ1(i) || aluToQ1(i)))
  val q2Final = VecInit((0 until CtrlBlockWidth).map(i => divToQ2(i) || aluToQ2(i)))
  val q3Final = VecInit((0 until CtrlBlockWidth).map(i => mulJmpToQ3(i) || aluToQ3(i)))
 
  // ================================================================
  //  Q4/Q5 路由 (结合了 LSQ 容量判断，只有 LSQ 能接住才允许发往 IQ)
  // ================================================================
  val q4Cand = VecInit((0 until CtrlBlockWidth).map(i => {
    val canLoad  = isLoadLane(i)  && !io.lsEnq.lqFull
    val canStore = isStoreLane(i) && !io.lsEnq.sqFull && q5Avail
    (canLoad || canStore) && q4Avail
  }))
  val q4Selected = truncateMask(q4Cand, 1)
  dontTouch(q4Selected)
 
  val q5Selected = VecInit((0 until CtrlBlockWidth).map(i => q4Selected(i) && isStoreLane(i)))
  dontTouch(q5Selected)
 
  val iqDispatchMask = VecInit((0 until CtrlBlockWidth).map(i =>
    q1Final(i) || q2Final(i) || q3Final(i) || q4Selected(i) || q5Selected(i)
  ))

  val laneTargetQ = Wire(Vec(CtrlBlockWidth, UInt(IssueQueueId.width.W)))
  for (i <- 0 until CtrlBlockWidth) {
    laneTargetQ(i) := MuxCase(IssueQueueId.Q1.U, Seq(
      q1Final(i)    -> IssueQueueId.Q1.U,
      q2Final(i)    -> IssueQueueId.Q2.U,
      q3Final(i)    -> IssueQueueId.Q3.U,
      q4Selected(i) -> IssueQueueId.Q4.U,
      q5Selected(i) -> IssueQueueId.Q5.U,
    ))
  }
 
  // ================================================================
  //  资源就绪与发射条件
  // ================================================================
  val anyNeedRob = needRob.asUInt.orR
  val robBatchReady = !anyNeedRob || io.robEnq.canEnq

  val hasIqDispatch = iqDispatchMask.zip(needIq).map { case (d, n) => d && n }.reduce(_ || _)

  // 由于 LSQ 检查已融入 q4Cand，此处不再需要 lsqBatchReady
  val dispatchFire = stgValid && hasIqDispatch && (robBatchReady || !anyNeedRob)

  val AllWillFire = VecInit((0 until CtrlBlockWidth).map(i => (needIq(i) && iqDispatchMask(i)) || !needIq(i)  )).reduce(_ && _)
  val canAcceptNew = !stgValid || ( dispatchFire && AllWillFire )
 
  val inValid = io.in.map(_.valid).reduce(_ || _)
  val inFire  = inValid && canAcceptNew
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := canAcceptNew 
  }
 
  // ================================================================
  //  状态转移
  // ================================================================
  val doFlush = io.flush
  when(doFlush) {
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i)  := false.B
      robWritten(i) := false.B
      iqSent(i)     := false.B
    }
  }.elsewhen(inFire) {
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i)  := io.in(i).valid
      robWritten(i) := false.B
      iqSent(i)     := false.B
      stgData(i)    := io.in(i).bits
    }
  }.elsewhen(dispatchFire) {
    for (i <- 0 until CtrlBlockWidth) {
      when(needRob(i)) { robWritten(i) := true.B }
      when(iqDispatchMask(i) && needIq(i)) { iqSent(i) := true.B }
    }
  }
 
  // ================================================================
  //  LQ / SQ 单点指针维护与 LSQ 请求生成 (核心变动)
  // ================================================================
  val lqHeadPtr = RegInit(0.U.asTypeOf(new LqPtr(LqSize)))
  val sqHeadPtr = RegInit(0.U.asTypeOf(new SqPtr(SqSize)))
 
  // 解析当前被选中发往 IQ4 的访存指令信息
  val memDispatchedThisCycle = dispatchFire && q4Selected.asUInt.orR && !doFlush
  val selectedIsLoad  = Mux1H(q4Selected, (0 until CtrlBlockWidth).map(i => stgData(i).ctrl.memRead))
  val selectedIsStore = Mux1H(q4Selected, (0 until CtrlBlockWidth).map(i => stgData(i).ctrl.memWrite))
  val selectedMemInst = Mux1H(q4Selected, stgData)

  // 当拍同步触发 LSQ 写入
  io.lsEnq.req.valid        := memDispatchedThisCycle //&& !doFlush
  io.lsEnq.req.bits.robIdx  := selectedMemInst.robIdx
  io.lsEnq.req.bits.isLoad  := selectedIsLoad
  io.lsEnq.req.bits.isStore := selectedIsStore
  io.lsEnq.req.bits.lqIdx   := lqHeadPtr
  io.lsEnq.req.bits.sqIdx   := sqHeadPtr
  io.lsEnq.toLsqData := selectedMemInst

  // 更新当前指针 (仅+1)
  when(memDispatchedThisCycle) {
    when(selectedIsLoad) {
      lqHeadPtr := lqHeadPtr + 1.U
    }
    when(selectedIsStore) {
      sqHeadPtr := sqHeadPtr + 1.U
    }
  }

 // when(io.flush) {
 //   lqHeadPtr := 0.U.asTypeOf(new LqPtr(LqSize))
 //   sqHeadPtr := 0.U.asTypeOf(new SqPtr(SqSize))
 // }
 
  // ================================================================
  //  BusyTable 读写与更新逻辑
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.readReq(i * 2)     := stgData(i).prs1
    busyTable.io.readReq(i * 2 + 1) := stgData(i).prs2
  }

  val allocValids = Wire(Vec(CtrlBlockWidth, Bool()))
  for (i <- 0 until CtrlBlockWidth) {
    allocValids(i) := dispatchFire && needRob(i) && stgData(i).rdValid && stgData(i).ldst =/= 0.U
    busyTable.io.allocReq(i).valid := allocValids(i)
    busyTable.io.allocReq(i).bits  := stgData(i).pdst
  }
  
  val wakeupPorts = io.wakeupPorts
  for (i <- 0 until WbBusWidth) {
    busyTable.io.wbReq(i).valid := wakeupPorts(i).valid
    busyTable.io.wbReq(i).bits  := wakeupPorts(i).bits.pdst
  }

  val prs1BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2)))
  val prs2BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2 + 1)))

  val prs1Busy = Wire(Vec(CtrlBlockWidth, Bool()))
  val prs2Busy = Wire(Vec(CtrlBlockWidth, Bool()))
  
  for (i <- 0 until CtrlBlockWidth) {
    val prs1WakeupHits = wakeupPorts.map(w => w.valid && (w.bits.pdst === stgData(i).prs1))
    val prs1WokenUp    = VecInit(prs1WakeupHits).asUInt.orR

    val prs2WakeupHits = wakeupPorts.map(w => w.valid && (w.bits.pdst === stgData(i).prs2))
    val prs2WokenUp    = VecInit(prs2WakeupHits).asUInt.orR

    val prs1AllocByOlder = if (i == 0) false.B else {
      VecInit((0 until i).map(j => allocValids(j) && (stgData(j).pdst === stgData(i).prs1))).asUInt.orR
    }
    val prs2AllocByOlder = if (i == 0) false.B else {
      VecInit((0 until i).map(j => allocValids(j) && (stgData(j).pdst === stgData(i).prs2))).asUInt.orR
    }

    prs1Busy(i) := prs1AllocByOlder || (prs1BusyRaw(i) && !prs1WokenUp)
    prs2Busy(i) := prs2AllocByOlder || (prs2BusyRaw(i) && !prs2WokenUp)
  }

  // ================================================================
  //  微操作构造
  // ================================================================
  def makeBaseUop(i: Int): DispatchedInst = {
    val u = Wire(new DispatchedInst)
    u.pc         := stgData(i).pc
    u.inst       := stgData(i).inst
    u.ctrl       := stgData(i).ctrl
    u.excpVec    := stgData(i).excpVec
    u.imm        := stgData(i).imm
    u.csrAddress := stgData(i).csrAddress
    u.pdInfo     := stgData(i).pdInfo
    u.bpuInfo     := stgData(i).bpuInfo
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
    u.robIdxFull := stgData(i).robIdx

    u.snptId := stgData(i).snptId
    
    // 初始化清零
    u.sqIdx      :=  0.U.asTypeOf(new LqPtr(SqSize))
    u.lqIdx      :=  0.U.asTypeOf(new LqPtr(LqSize))
    
    u.issueQueue := laneTargetQ(i)
    u.prs1Busy   := Mux(stgData(i).rs1Valid && stgData(i).lrs1 =/= 0.U, prs1Busy(i), false.B)
    u.prs2Busy   := Mux(stgData(i).rs2Valid && stgData(i).lrs2 =/= 0.U, prs2Busy(i), false.B)
    u.isSta      := false.B
    u.isStd      := false.B
    u
  }
 
  def makeLoadUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.lqIdx      := lqHeadPtr // 动态赋予当拍实时有效的 HeadPtr
    u.issueQueue := IssueQueueId.Q4.U
    u
  }
 
  def makeStaUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.sqIdx      := sqHeadPtr // 动态赋予当拍实时有效的 HeadPtr
    u.issueQueue := IssueQueueId.Q4.U
    u.isSta      := true.B
    u.rs2Valid   := false.B
    u.prs2Busy   := false.B
    u.rdValid    := false.B
    u.pdst       := 0.U
    u
  }
 
  def makeStdUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.sqIdx      := sqHeadPtr // 与 STA 指令共用同一个周期的 HeadPtr
    u.issueQueue := IssueQueueId.Q5.U
    u.isStd      := true.B
    u.rs1Valid   := false.B
    u.prs1Busy   := false.B
    u.imm        := 0.U
    u.rdValid    := false.B
    u.pdst       := 0.U
    u
  }
 
  // ================================================================
  //  IQ 端口分配
  // ================================================================
  io.q1IQEnq(0).valid := false.B;  io.q1IQEnq(0).bits := DontCare
  io.q2IQEnq(0).valid := false.B;  io.q2IQEnq(0).bits := DontCare
  io.q3IQEnq(0).valid := false.B;  io.q3IQEnq(0).bits := DontCare
  io.q4IQEnq(0).valid := false.B;  io.q4IQEnq(0).bits := DontCare
  io.q5IQEnq(0).valid := false.B;  io.q5IQEnq(0).bits := DontCare
 
  val q1Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q1.U
    u
  })
  when(q1Final.asUInt.orR && dispatchFire) {
    io.q1IQEnq(0).valid := true.B && !doFlush
    io.q1IQEnq(0).bits  := Mux1H(q1Final, q1Uops)
  }
 
  val q2Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q2.U
    u
  })
  when(q2Final.asUInt.orR && dispatchFire) {
    io.q2IQEnq(0).valid := true.B && !doFlush
    io.q2IQEnq(0).bits  := Mux1H(q2Final, q2Uops)
  }
 
  val q3Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q3.U
    u
  })
  when(q3Final.asUInt.orR && dispatchFire) {
    io.q3IQEnq(0).valid := true.B && !doFlush
    io.q3IQEnq(0).bits  := Mux1H(q3Final, q3Uops)
  }
 
  val q4Uops = (0 until CtrlBlockWidth).map(i => Mux(isStoreLane(i), makeStaUop(i), makeLoadUop(i)))
  when(q4Selected.asUInt.orR && dispatchFire) {
    io.q4IQEnq(0).valid := true.B  && !doFlush
    io.q4IQEnq(0).bits  := Mux1H(q4Selected, q4Uops)
  }
 
  val q5Uops = (0 until CtrlBlockWidth).map(i => makeStdUop(i))
  when(q5Selected.asUInt.orR && dispatchFire) {
    io.q5IQEnq(0).valid := true.B && !doFlush
    io.q5IQEnq(0).bits  := Mux1H(q5Selected, q5Uops)
  }
  dontTouch(io.q5IQEnq)
  dontTouch(io.q4IQEnq)
 
  // ================================================================
  //  ROB 批量写入 (ROB仍然维持进入流水级当拍进行一次性批量分发)
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    io.robEnq.valid(i)  := dispatchFire && needRob(i) && !doFlush
    io.robEnq.valids(i) := needRob(i)
    io.robEnq.bits(i).pc       := stgData(i).pc
    io.robEnq.bits(i).inst     := stgData(i).inst
    io.robEnq.bits(i).pdst     := stgData(i).pdst
    io.robEnq.bits(i).oldPdst  := stgData(i).oldPdst
    io.robEnq.bits(i).ldst     := stgData(i).ldst
    io.robEnq.bits(i).rfWen    := stgData(i).ctrl.rfWen
    io.robEnq.bits(i).memRead  := stgData(i).ctrl.memRead
    io.robEnq.bits(i).memWrite := stgData(i).ctrl.memWrite
    io.robEnq.bits(i).csrWen   := stgData(i).ctrl.csrWen
    io.robEnq.bits(i).csrOp    := stgData(i).ctrl.csrOp
    io.robEnq.bits(i).csrAddress := stgData(i).csrAddress
    io.robEnq.bits(i).isPriv   := stgData(i).ctrl.isPriv
    io.robEnq.bits(i).fuType   := stgData(i).ctrl.fuType
    io.robEnq.bits(i).excpVec  := stgData(i).excpVec
    io.robEnq.bits(i).robIdx   := stgData(i).robIdx
  }
}
