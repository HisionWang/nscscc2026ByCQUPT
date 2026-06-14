package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._

class DispatchStage(implicit p: Parameters) extends NSModule {
  val io = IO(new DispatchStageIO)
 
  // ================================================================
  //  子模块
  // ================================================================
  val busyTable = Module(new BusyTable)
 
  // ================================================================
  //  Phase 1: 流水级寄存器
  // ================================================================
  val stgValid  = RegInit(false.B)
  val laneValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val iqSent    = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))   // ★ 独立信号：是否已送入 IQ
  val stgData   = Reg(Vec(CtrlBlockWidth, new RenamedInst))
 
  // ── 仍在等待发射的 lane ──
  val lanePending = VecInit((0 until CtrlBlockWidth).map(i => laneValid(i) && !iqSent(i)))
 
  // ── 所有 lane 是否都已处理完毕（无效 或 已发射） ──
  val allLanesDone = laneValid.zip(iqSent).map { case (v, s) => !v || s }.reduce(_ && _)
 
  // ── 指令分类（仅看 lanePending） ──
  val isAluLane    = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && stgData(i).ctrl.fuType === FuType.alu))
  val isBruLane    = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && stgData(i).ctrl.fuType === FuType.bru))
  val isCsrLane    = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && (stgData(i).ctrl.fuType === FuType.csr || stgData(i).ctrl.isPriv)))
  val isMulDivLane = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && stgData(i).ctrl.fuType === FuType.mulDiv))
  val isLoadLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memRead))
  val isStoreLane  = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memWrite))
 
  // BRU IQ 接收 BRU + CSR/Priv
  val isBruTargetLane = VecInit((0 until CtrlBlockWidth).map(i =>
    isBruLane(i) || isCsrLane(i)))
 
  // Load/Sta IQ 接收 Load + Store-Addr
  val isLoadStaLane = VecInit((0 until CtrlBlockWidth).map(i =>
    isLoadLane(i) || isStoreLane(i)))
 
  // Std IQ 只接收 Store-Data
  val isStdLane = isStoreLane
 
  // ================================================================
  //  截断逻辑
  // ================================================================
  def truncateMask(isMatch: Vec[Bool], maxPorts: Int): Vec[Bool] = {
    val result = Wire(Vec(CtrlBlockWidth, Bool()))
    var count = 0.U(log2Ceil(maxPorts + 1).W)
    for (i <- 0 until CtrlBlockWidth) {
      result(i) := isMatch(i) && (count < maxPorts.U)
      count = count + (isMatch(i) && result(i)).asUInt
    }
    result
  }
 
  val aluAccepted     = truncateMask(isAluLane,         IQEnqPorts.ALU)
  val bruAccepted     = truncateMask(isBruTargetLane,   IQEnqPorts.BRU)
  val mulDivAccepted  = truncateMask(isMulDivLane,      IQEnqPorts.MULDIV)
  val loadStaAccepted = truncateMask(isLoadStaLane,     IQEnqPorts.LOADSTA)
  val stdAccepted     = truncateMask(isStdLane,         IQEnqPorts.STD)
 
  // ── dispatchMask(i)=true 表示 lane i 本周期被接受发射 ──
  val dispatchMask = VecInit((0 until CtrlBlockWidth).map(i =>
    (isAluLane(i)       && aluAccepted(i))     ||
    (isBruTargetLane(i) && bruAccepted(i))     ||
    (isMulDivLane(i)    && mulDivAccepted(i))  ||
    (isLoadStaLane(i)   && loadStaAccepted(i)) ||
    (isStdLane(i)       && stdAccepted(i))
  ))
 
  // ── 统计各类实际发射数 ──
  val aluDispatchCount     = PopCount(VecInit((0 until CtrlBlockWidth).map(i => isAluLane(i)       && aluAccepted(i))))
  val bruDispatchCount     = PopCount(VecInit((0 until CtrlBlockWidth).map(i => isBruTargetLane(i) && bruAccepted(i))))
  val mulDivDispatchCount  = PopCount(VecInit((0 until CtrlBlockWidth).map(i => isMulDivLane(i)    && mulDivAccepted(i))))
  val loadStaDispatchCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i => isLoadStaLane(i)   && loadStaAccepted(i))))
  val stdDispatchCount     = PopCount(VecInit((0 until CtrlBlockWidth).map(i => isStdLane(i)       && stdAccepted(i))))
 
  // ── IQ 端口容量检查 ──
  val iqReady = aluDispatchCount     <= io.iqFeedback.aluCanAccept &&
                bruDispatchCount     <= io.iqFeedback.bruCanAccept &&
                mulDivDispatchCount  <= io.iqFeedback.mulDivCanAccept &&
                loadStaDispatchCount <= io.iqFeedback.loadStaCanAccept &&
                stdDispatchCount     <= io.iqFeedback.stdCanAccept
 
  // ── LSQ 容量检查 ──
  val hasLoad  = isLoadLane.asUInt.orR
  val hasStore = isStoreLane.asUInt.orR
  val lsqReady = (!hasLoad || !io.lsEnq.lqFull) &&
                 (!hasStore || !io.lsEnq.sqFull)
 
  // ── ROB 空间检查 ──
  val robReady = io.robEnq.canEnq
 
  // ── 本周期是否有任何 lane 被接受 ──
  val hasAccepted = dispatchMask.zip(lanePending).map { case (m, v) => m && v }.reduce(_ || _)
 
  // ── 发射条件 ──
  val dispatchFire = stgValid && hasAccepted && iqReady && lsqReady && robReady
 
  // ── 能否接收新数据：本级空闲 或 所有 lane 都已发射完毕 ──
  val canAcceptNew = !stgValid || allLanesDone
 
  val inValid = io.in.map(_.valid).reduce(_ || _)
  val inFire  = inValid && canAcceptNew
 
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := canAcceptNew
  }
 
  // ── 发射后仍待处理的 lane ──
  val willStillBePending = VecInit((0 until CtrlBlockWidth).map(i =>
    lanePending(i) && !dispatchMask(i)
  ))
 
  // ── 状态转移 ──
  when(io.flush || io.redirect.valid) {
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := false.B
      iqSent(i)    := false.B
    }
  }.elsewhen(inFire) {
    // 新数据整批进入
    stgValid := true.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := io.in(i).valid
      iqSent(i)    := false.B
      stgData(i)   := io.in(i).bits
    }
  }.elsewhen(dispatchFire) {
    // 仅标记已发射的 lane，不清除 laneValid
    for (i <- 0 until CtrlBlockWidth) {
      when(dispatchMask(i) && lanePending(i)) {
        iqSent(i) := true.B
      }
    }
    // 如果没有剩余待发射的 lane，标记空闲
    stgValid := willStillBePending.asUInt.orR
  }
 
  // ================================================================
  //  Phase 2: 组合逻辑
  // ================================================================
 
  // ================================================================
  //  2-1. LQ/SQ 指针生成
  //  仅被接受的 Load/Store 才消耗指针
  // ================================================================
  val lqHeadPtr = RegInit(UInt(log2Ceil(LqSize).W), 0.U)
  val sqHeadPtr = RegInit(UInt(log2Ceil(SqSize).W), 0.U)
 
  when(dispatchFire) {
    lqHeadPtr := lqHeadPtr + PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
      isLoadLane(i) && dispatchMask(i))))
    sqHeadPtr := sqHeadPtr + PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
      isStoreLane(i) && dispatchMask(i))))
  }
  when(io.flush || io.redirect.valid) {
    lqHeadPtr := 0.U
    sqHeadPtr := 0.U
  }
 
  // 为每条 lane 计算 LQ/SQ 索引（前缀和方式）
  val lqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(LqSize).W)))
  val sqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(SqSize).W)))
  var lqOffset  = 0.U(log2Ceil(LqSize).W)
  var sqOffset  = 0.U(log2Ceil(SqSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    lqIndices(i) := lqHeadPtr + lqOffset
    sqIndices(i) := sqHeadPtr + sqOffset
    lqOffset = lqOffset + (isLoadLane(i) && dispatchMask(i)).asUInt
    sqOffset = sqOffset + (isStoreLane(i) && dispatchMask(i)).asUInt
  }
 
  // ================================================================
  //  2-2. BusyTable 查询
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.readReq(i * 2)     := stgData(i).prs1
    busyTable.io.readReq(i * 2 + 1) := stgData(i).prs2
  }
 
  // 分配置忙：仅被接受且写回 PRF 的指令
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.allocReq(i).valid := dispatchFire && dispatchMask(i) &&
                                      lanePending(i) && stgData(i).rdValid && stgData(i).ldst =/= 0.U
    busyTable.io.allocReq(i).bits  := stgData(i).pdst
  }
 
  // 写回清忙：当前无执行单元，置无效
  for (i <- 0 until WbBusWidth) {
    busyTable.io.wbReq(i).valid := false.B
    busyTable.io.wbReq(i).bits  := 0.U
  }
 
  val prs1BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2)))
  val prs2BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2 + 1)))
 
  // ================================================================
  //  2-3. 构造微操作
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
    u.robIdxFull := Cat(false.B, stgData(i).robIdx)
    u.sqIdx      := 0.U
    u.lqIdx      := 0.U
    u.issueQueue := 0.U
    u.prs1Busy   := Mux(stgData(i).rs1Valid && stgData(i).lrs1 =/= 0.U,
                        prs1BusyRaw(i), false.B)
    u.prs2Busy   := Mux(stgData(i).rs2Valid && stgData(i).lrs2 =/= 0.U,
                        prs2BusyRaw(i), false.B)
    u.isSta      := false.B
    u.isStd      := false.B
    u
  }
 
  def makeLoadUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.lqIdx      := lqIndices(i)
    u.issueQueue := IssueQueueId.LOADSTA.U
    u
  }
 
  def makeStaUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.sqIdx      := sqIndices(i)
    u.issueQueue := IssueQueueId.LOADSTA.U
    u.isSta      := true.B
    u.rs2Valid   := false.B
    u.prs2Busy   := false.B
    u.rdValid    := false.B
    u.pdst       := 0.U
    u
  }
 
  def makeStdUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.sqIdx      := sqIndices(i)
    u.issueQueue := IssueQueueId.STD.U
    u.isStd      := true.B
    u.rs1Valid   := false.B
    u.prs1Busy   := false.B
    u.imm        := 0.U
    u.rdValid    := false.B
    u.pdst       := 0.U
    u
  }
 
  // ================================================================
  //  2-4. IQ 端口分配（前缀和 + Mux1H）
  // ================================================================
 
  // ── 默认所有 IQ 端口无效 ──
  for (p <- 0 until IQEnqPorts.ALU)     { io.aluIQEnq(p).valid := false.B;     io.aluIQEnq(p).bits := DontCare }
  for (p <- 0 until IQEnqPorts.BRU)     { io.bruIQEnq(p).valid := false.B;     io.bruIQEnq(p).bits := DontCare }
  for (p <- 0 until IQEnqPorts.MULDIV)  { io.mulDivIQEnq(p).valid := false.B;  io.mulDivIQEnq(p).bits := DontCare }
  for (p <- 0 until IQEnqPorts.LOADSTA) { io.loadStaIQEnq(p).valid := false.B; io.loadStaIQEnq(p).bits := DontCare }
  for (p <- 0 until IQEnqPorts.STD)     { io.stdIQEnq(p).valid := false.B;     io.stdIQEnq(p).bits := DontCare }
 
  // ── ALU IQ（2 端口） ──
  var aluPSum = 0.U(log2Ceil(IQEnqPorts.ALU + 1).W)
  val aluPrefixSum = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IQEnqPorts.ALU + 1).W)))
  for (i <- 0 until CtrlBlockWidth) {
    aluPrefixSum(i) := aluPSum
    aluPSum = aluPSum + (isAluLane(i) && aluAccepted(i)).asUInt
  }
  val aluUops = (0 until CtrlBlockWidth).map(i => makeBaseUop(i))
 
  for (p <- 0 until IQEnqPorts.ALU) {
    val matchOH = VecInit((0 until CtrlBlockWidth).map(i =>
      isAluLane(i) && aluAccepted(i) && aluPrefixSum(i) === p.U
    ))
    when(matchOH.asUInt.orR && dispatchFire) {
      io.aluIQEnq(p).valid := true.B
      io.aluIQEnq(p).bits  := Mux1H(matchOH, aluUops)
    }
  }
 
  // ── BRU IQ（1 端口，BRU + CSR/Priv） ──
  var bruPSum = 0.U(log2Ceil(IQEnqPorts.BRU + 1).W)
  val bruPrefixSum = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IQEnqPorts.BRU + 1).W)))
  for (i <- 0 until CtrlBlockWidth) {
    bruPrefixSum(i) := bruPSum
    bruPSum = bruPSum + (isBruTargetLane(i) && bruAccepted(i)).asUInt
  }
  val bruUops = (0 until CtrlBlockWidth).map(i => makeBaseUop(i))
 
  for (p <- 0 until IQEnqPorts.BRU) {
    val matchOH = VecInit((0 until CtrlBlockWidth).map(i =>
      isBruTargetLane(i) && bruAccepted(i) && bruPrefixSum(i) === p.U
    ))
    when(matchOH.asUInt.orR && dispatchFire) {
      io.bruIQEnq(p).valid := true.B
      io.bruIQEnq(p).bits  := Mux1H(matchOH, bruUops)
    }
  }
 
  // ── MULDIV IQ（1 端口） ──
  var mulDivPSum = 0.U(log2Ceil(IQEnqPorts.MULDIV + 1).W)
  val mulDivPrefixSum = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IQEnqPorts.MULDIV + 1).W)))
  for (i <- 0 until CtrlBlockWidth) {
    mulDivPrefixSum(i) := mulDivPSum
    mulDivPSum = mulDivPSum + (isMulDivLane(i) && mulDivAccepted(i)).asUInt
  }
  val mulDivUops = (0 until CtrlBlockWidth).map(i => makeBaseUop(i))
 
  for (p <- 0 until IQEnqPorts.MULDIV) {
    val matchOH = VecInit((0 until CtrlBlockWidth).map(i =>
      isMulDivLane(i) && mulDivAccepted(i) && mulDivPrefixSum(i) === p.U
    ))
    when(matchOH.asUInt.orR && dispatchFire) {
      io.mulDivIQEnq(p).valid := true.B
      io.mulDivIQEnq(p).bits  := Mux1H(matchOH, mulDivUops)
    }
  }
 
  // ── Load/Sta IQ（2 端口） ──
  var loadStaPSum = 0.U(log2Ceil(IQEnqPorts.LOADSTA + 1).W)
  val loadStaPrefixSum = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IQEnqPorts.LOADSTA + 1).W)))
  for (i <- 0 until CtrlBlockWidth) {
    loadStaPrefixSum(i) := loadStaPSum
    loadStaPSum = loadStaPSum + (isLoadStaLane(i) && loadStaAccepted(i)).asUInt
  }
  val loadStaUops = (0 until CtrlBlockWidth).map(i =>
    Mux(isStoreLane(i), makeStaUop(i), makeLoadUop(i))
  )
 
  for (p <- 0 until IQEnqPorts.LOADSTA) {
    val matchOH = VecInit((0 until CtrlBlockWidth).map(i =>
      isLoadStaLane(i) && loadStaAccepted(i) && loadStaPrefixSum(i) === p.U
    ))
    when(matchOH.asUInt.orR && dispatchFire) {
      io.loadStaIQEnq(p).valid := true.B
      io.loadStaIQEnq(p).bits  := Mux1H(matchOH, loadStaUops)
    }
  }
 
  // ── Std IQ（1 端口） ──
  var stdPSum = 0.U(log2Ceil(IQEnqPorts.STD + 1).W)
  val stdPrefixSum = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IQEnqPorts.STD + 1).W)))
  for (i <- 0 until CtrlBlockWidth) {
    stdPrefixSum(i) := stdPSum
    stdPSum = stdPSum + (isStdLane(i) && stdAccepted(i)).asUInt
  }
  val stdUops = (0 until CtrlBlockWidth).map(i => makeStdUop(i))
 
  for (p <- 0 until IQEnqPorts.STD) {
    val matchOH = VecInit((0 until CtrlBlockWidth).map(i =>
      isStdLane(i) && stdAccepted(i) && stdPrefixSum(i) === p.U
    ))
    when(matchOH.asUInt.orR && dispatchFire) {
      io.stdIQEnq(p).valid := true.B
      io.stdIQEnq(p).bits  := Mux1H(matchOH, stdUops)
    }
  }
 
  // ================================================================
  //  2-5. LSQ 请求
  //  仅被接受的 Load/Store 才分配 LSQ 条目
  // ================================================================
    val enqOK =RegInit(false.B) // RegNext(dispatchFire)
    when(inFire){
      enqOK := false.B
    }.elsewhen(dispatchFire){
      enqOK := true.B
    }
  for (i <- 0 until CtrlBlockWidth) {
    io.lsEnq.req(i).valid        := dispatchFire && !enqOK && laneValid(i) && stgValid &&
                                    (isLoadLane(i) || isStoreLane(i))
    io.lsEnq.req(i).bits.robIdx  := stgData(i).robIdx
    io.lsEnq.req(i).bits.isLoad  := isLoadLane(i)
    io.lsEnq.req(i).bits.isStore := isStoreLane(i)
    io.lsEnq.req(i).bits.sqIdx   := sqIndices(i)
    io.lsEnq.req(i).bits.lqIdx   := lqIndices(i)
  }
 
  // ================================================================
  //  2-6. ROB 入队
  //  仅被接受的 lane 才入队，Store 分裂但只占 1 个 ROB 表项
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    io.robEnq.valid(i)  := dispatchFire  && !enqOK && laneValid(i) && stgValid
    io.robEnq.valids(i) := laneValid(i) && stgValid
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