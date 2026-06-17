package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  分发流水级（DispatchStage）—— 5 IQ 版本
 * ═══════════════════════════════════════════════════════════════
 *
 *  队列划分：
 *    Q1: ALU + CSR      (1 入队端口)
 *    Q2: ALU + DIV      (1 入队端口)
 *    Q3: ALU + MUL + JMP (1 入队端口)
 *    Q4: LOAD + STA     (1 入队端口，与原先相同)
 *    Q5: STD            (1 入队端口，与原先相同)
 *
 *  路由策略：
 *    ① 专属指令优先分配（CSR→Q1, DIV→Q2, MUL/JMP→Q3）
 *    ② ALU 指令填充剩余空闲端口（Q1→Q2→Q3 顺序）
 *    ③ Store 的 Sta 和 Std 必须成对分发
 *    ④ 每类指令超额时截断，留在下周期继续
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
    val lsEnq   = new LsEnqIO
    val robEnq  = Flipped(new RobEnqIO)
    val flush   = Input(Bool())
    val redirect = Input(new RedirectInfo)
  })
 
  val busyTable = Module(new BusyTable)
 
  // ================================================================
  //  流水级寄存器
  // ================================================================
  val laneValid   = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val robWritten  = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val lsqWritten  = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val iqSent      = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData     = Reg(Vec(CtrlBlockWidth, new RenamedInst))
  val stgLqIdx    = Reg(Vec(CtrlBlockWidth, UInt(log2Ceil(LqSize).W)))
  val stgSqIdx    = Reg(Vec(CtrlBlockWidth, UInt(log2Ceil(SqSize).W)))
 
  // ── 需求掩码 ──
  // 分出几组掩码
  // 1.目前还需要Rob的通路有哪些
  val needRob = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && !robWritten(i)))


  //2.需要Load/Store Q 的通路有哪些
  val isMemLane = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && stgData(i).ctrl.fuType === FuType.lsu))
  val needLsq = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && !lsqWritten(i) && isMemLane(i)))

  //3.需要Iq的通路有哪些
  val needIq = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && !iqSent(i)))
  

  // 以上的三类请求
  // Rob和SLQ 都会在一个周期内完成
  // 只有IQ的请求有可能涉及到多个周期
  // * 所以说IQ是木桶的短板
  // 直接看所有的通路是否还需要IQ
  // 以判断在此流水级的微操作是否都已经完成使命
  val stgValid = needIq.asUInt.orR
    
  // ================================================================
  //  Part One 开始处理 IQ 相关的分配
  // ================================================================
 
  // ================================================================
  //  一、先对需要iq的每一条通路进行指令的分类（基于 needIq）
  // ================================================================
  // 1.哪些通路需要ALU
  val isAluLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.alu))
  // 2.哪些通路需要CSR
  val isCsrLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && (stgData(i).ctrl.fuType === FuType.csr || stgData(i).ctrl.isPriv)))
  // 3.哪些通路需要除法
  val isDivLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.div))
  // 4.哪些通路需要乘法
  val isMulLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.mul))
  // 5.哪些通路需要Jump运算单元
  val isJmpLane   = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.bru))
  // 6.哪些通路是Load
  val isLoadLane  = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memRead))
  // 7.哪些通路是Store
  val isStoreLane = VecInit((0 until CtrlBlockWidth).map(i =>
    needIq(i) && stgData(i).ctrl.fuType === FuType.lsu && stgData(i).ctrl.memWrite))
 
  // ================================================================
  //  二、计算IQ 可用性（来自反馈信号）
  // ================================================================
  val q1Avail = io.iqFeedback.q1FreeEntries > 0.U
  val q2Avail = io.iqFeedback.q2FreeEntries > 0.U
  val q3Avail = io.iqFeedback.q3FreeEntries > 0.U
  val q4Avail = io.iqFeedback.q4FreeEntries > 0.U
  val q5Avail = io.iqFeedback.q5FreeEntries > 0.U
 
  // ================================================================
  //  截断工具函数，只选择固定数量的掩码出来
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
 
  // ================================================================
  //  Phase 1: 计算除ALU和访存指令外的——专属指令路由
  //    CSR → Q1（只能去 Q1）
  //    DIV → Q2（只能去 Q2）
  //    MUL/JMP → Q3（只能去 Q3，两者竞争 1 个端口）
  // ================================================================
  // 1.选择出一条 [当前周期可以往后发送的一条Csr指令]
  val csrToQ1 = truncateMask(
    VecInit((0 until CtrlBlockWidth).map(i => isCsrLane(i) && q1Avail)), 1)
  
  // 2.选择出一条 [当前周期可以往后发送的一条Div指令]
  val divToQ2 = truncateMask(
    VecInit( (0 until CtrlBlockWidth).map(i => isDivLane(i) && q2Avail)), 1)
  
  // 3.选择出一条 [当前周期可以往后发送的一条Mul/Jump指令]
  val isMulOrJmpLane = VecInit((0 until CtrlBlockWidth).map(i =>
    (isMulLane(i) || isJmpLane(i)) && q3Avail))
  val mulJmpToQ3 = truncateMask(isMulOrJmpLane, 1)
  
  //    综合以上的结果
  // ── 已被专属指令占用的 lane 位掩码 ──
  var consumedMask = csrToQ1.asUInt | divToQ2.asUInt | mulJmpToQ3.asUInt
  
  // ── 各 IQ 专属指令占用后是否还有空位 ──
  val q1FreeAfterExclusive = !csrToQ1.asUInt.orR && q1Avail
  val q2FreeAfterExclusive = !divToQ2.asUInt.orR && q2Avail
  val q3FreeAfterExclusive = !mulJmpToQ3.asUInt.orR && q3Avail
 
// ================================================================
//  Phase 2: ALU 动态负载均衡分配
//
//  策略：按 IQ 空闲条目数降序分配 ALU，空闲越多越优先
//  约束：每个 IQ 只有 1 个端口，专属指令占用后不能再收 ALU
//
//  步骤：
//    1.计算各 IQ 对 ALU 的可用优先级（freeEntries，不可用则为 0）
//    2.三轮排序确定 rank0/rank1/rank2（降序，同值按 Q1>Q2>Q3）
//    3.按排序结果逐轮分配：rank0 的 IQ 得到第一条 ALU，以此类推
// ================================================================
 
// ── 各 IQ 对 ALU 的可用性 ──
//  端口被专属指令占用 → 该 IQ 不能再收 ALU
val q1CanAcceptAlu = q1FreeAfterExclusive
val q2CanAcceptAlu = q2FreeAfterExclusive
val q3CanAcceptAlu = q3FreeAfterExclusive
 
//  优先级 = freeEntries（可用于 ALU 时）或 0（不可用）
val q1AluPriority = Mux(q1CanAcceptAlu, io.iqFeedback.q1FreeEntries, 0.U(IQ1Width.W))
val q2AluPriority = Mux(q2CanAcceptAlu, io.iqFeedback.q2FreeEntries, 0.U(IQ2Width.W))
val q3AluPriority = Mux(q3CanAcceptAlu, io.iqFeedback.q3FreeEntries, 0.U(IQ3Width.W))
 
// ── 三轮排序：rank0 = 最空闲, rank1 = 次空闲, rank2 = 最忙 ──
//  同值时按 Q1 > Q2 > Q3 消歧（>= 保证小索引优先）
 
// rank0: 三个 IQ 中 priority 最大的
val rank0OH = Wire(Vec(3, Bool()))  // one-hot: (Q1, Q2, Q3)
rank0OH(0) := (q1AluPriority >= q2AluPriority) && (q1AluPriority >= q3AluPriority)
rank0OH(1) := !rank0OH(0) && (q2AluPriority >= q3AluPriority)
rank0OH(2) := !rank0OH(0) && !rank0OH(1)

// rank1: 去掉 rank0 后，剩余两个中 priority 更大的
val exclRank0 = VecInit(Seq(q1AluPriority, q2AluPriority, q3AluPriority).zip(rank0OH).map {
  case (p, oh) => Mux(oh, 0.U, p)
})
val rank1OH = Wire(Vec(3, Bool()))
rank1OH(0) := !rank0OH(0) && (exclRank0(0) >= exclRank0(1)) && (exclRank0(0) >= exclRank0(2))
rank1OH(1) := !rank0OH(1) && !rank1OH(0) && (exclRank0(1) >= exclRank0(2))
rank1OH(2) := !rank0OH(2) && !rank1OH(0) && !rank1OH(1)
 
// rank2: 剩余的那一个
val rank2OH = Wire(Vec(3, Bool()))
rank2OH(0) := !rank0OH(0) && !rank1OH(0)
rank2OH(1) := !rank0OH(1) && !rank1OH(1)
rank2OH(2) := !rank0OH(2) && !rank1OH(2)

// 上面处理好优先级之后
// 还要检验是否可以接收ALU指令
// 每个 rank 对应的 IQ 是否有 ALU 容量（priority > 0）

// 1.最空闲的那个IQ是否可以接收ALU指令
val rank0HasCap = Mux(rank0OH(0), q1CanAcceptAlu,
                  Mux(rank0OH(1), q2CanAcceptAlu, q3CanAcceptAlu))
// 2.次空闲的那个IQ是否可以接收ALU指令
val rank1HasCap = Mux(rank1OH(0), q1CanAcceptAlu,
                  Mux(rank1OH(1), q2CanAcceptAlu, q3CanAcceptAlu))
// 3.最忙碌的那个IQ是否可以接收ALU指令
val rank2HasCap = Mux(rank2OH(0), q1CanAcceptAlu,
                  Mux(rank2OH(1), q2CanAcceptAlu, q3CanAcceptAlu))

// ── 逐轮分配 ALU ──
 
// Round 1: 操作对象是：优先级最高的那个端口
val aluCandR1 = VecInit((0 until CtrlBlockWidth).map(i =>
  isAluLane(i) && !consumedMask(i)))
val aluRound1 = truncateMask(aluCandR1, 1)
val aluRound1Valid = aluRound1.asUInt.orR && rank0HasCap //最闲的那个是否成功分配到ALU指令
val aluRound1ToQ1 = aluRound1Valid && rank0OH(0)
val aluRound1ToQ2 = aluRound1Valid && rank0OH(1)
val aluRound1ToQ3 = aluRound1Valid && rank0OH(2)
 
consumedMask = consumedMask | Mux(aluRound1Valid, aluRound1.asUInt, 0.U)
 
// Round 2: 操作对象是：优先级次高的那个端口
val aluCandR2 = VecInit((0 until CtrlBlockWidth).map(i =>
  isAluLane(i) && !consumedMask(i)))
val aluRound2 = truncateMask(aluCandR2, 1)
val aluRound2Valid = aluRound2.asUInt.orR && rank1HasCap //次闲的那个是否成功分配到ALU指令
val aluRound2ToQ1 = aluRound2Valid && rank1OH(0)
val aluRound2ToQ2 = aluRound2Valid && rank1OH(1)
val aluRound2ToQ3 = aluRound2Valid && rank1OH(2)
 
consumedMask = consumedMask | Mux(aluRound2Valid, aluRound2.asUInt, 0.U)
 
// Round 3: 操作对象是：最忙碌的那个端口
val aluCandR3 = VecInit((0 until CtrlBlockWidth).map(i =>
  isAluLane(i) && !consumedMask(i)))
val aluRound3 = truncateMask(aluCandR3, 1)
val aluRound3Valid = aluRound3.asUInt.orR && rank2HasCap //最忙的那个是否成功分配到ALU指令
val aluRound3ToQ1 = aluRound3Valid && rank2OH(0)
val aluRound3ToQ2 = aluRound3Valid && rank2OH(1)
val aluRound3ToQ3 = aluRound3Valid && rank2OH(2)
 
consumedMask = consumedMask | Mux(aluRound3Valid, aluRound3.asUInt, 0.U)
 
// ── 合并：各 IQ 最终分配 = 专属 + ALU ──
//  每条 lane 最多在一轮中被选中，所以不会重复
val aluToQ1 = VecInit((0 until CtrlBlockWidth).map(i =>
  (aluRound1(i) && aluRound1ToQ1) || (aluRound2(i) && aluRound2ToQ1) || (aluRound3(i) && aluRound3ToQ1)))
val aluToQ2 = VecInit((0 until CtrlBlockWidth).map(i =>
  (aluRound1(i) && aluRound1ToQ2) || (aluRound2(i) && aluRound2ToQ2) || (aluRound3(i) && aluRound3ToQ2)))
val aluToQ3 = VecInit((0 until CtrlBlockWidth).map(i =>
  (aluRound1(i) && aluRound1ToQ3) || (aluRound2(i) && aluRound2ToQ3) || (aluRound3(i) && aluRound3ToQ3)))
 
val q1Final = VecInit((0 until CtrlBlockWidth).map(i => csrToQ1(i) || aluToQ1(i)))
val q2Final = VecInit((0 until CtrlBlockWidth).map(i => divToQ2(i) || aluToQ2(i)))
val q3Final = VecInit((0 until CtrlBlockWidth).map(i => mulJmpToQ3(i) || aluToQ3(i)))
 
  // ================================================================
  //  Q4/Q5 路由（LOADSTA 和 STD，与原先逻辑相同）
  //    Q4: Load 或 Store-Addr（1 端口）
  //    Q5: Store-Data（1 端口）
  //    约束：Store 的 Sta 和 Std 必须成对分发
  //    Store 只有在 Q4 和 Q5 都可用时才能成为候选
  // ================================================================
  val q4Cand = VecInit((0 until CtrlBlockWidth).map(i =>
    (isLoadLane(i) || (isStoreLane(i) && q5Avail)) && q4Avail ))

  val q4Selected = truncateMask(q4Cand, 1)
  dontTouch(q4Selected)
 
  // Q4 选中的是 Store 吗？
  // Q5: Std 仅在对应 Store 的 Sta 被选中时才发
  val q5Selected = VecInit((0 until CtrlBlockWidth).map(i =>
    q4Selected(i) && isStoreLane(i)))

  dontTouch(q5Selected)
 
  // ================================================================
  //  IQ 分发掩码 & 目标队列
  // ================================================================
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
  //  资源就绪检查
  // ================================================================
 
  // ── IQ 容量（路由已考虑可用性，此处做安全冗余检查） ──
  val q1WillSend = q1Final.asUInt.orR
  val q2WillSend = q2Final.asUInt.orR
  val q3WillSend = q3Final.asUInt.orR
  val q4WillSend = q4Selected.asUInt.orR
  val q5WillSend = q5Selected.asUInt.orR
 
  val iqReady = (q1WillSend <= io.iqFeedback.q1FreeEntries) &&
                (q2WillSend <= io.iqFeedback.q2FreeEntries) &&
                (q3WillSend <= io.iqFeedback.q3FreeEntries) &&
                (q4WillSend <= io.iqFeedback.q4FreeEntries) &&
                (q5WillSend <= io.iqFeedback.q5FreeEntries)

  dontTouch(iqReady)
 
  // ── ROB 批量容量 ──
  val anyNeedRob = needRob.asUInt.orR
  val robBatchReady = !anyNeedRob || io.robEnq.canEnq

  // ── LSQ 批量容量 ──
  val anyNeedLsq = needLsq.asUInt.orR
  val needLsqLoadCount  = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    needLsq(i) && stgData(i).ctrl.memRead)))
  val needLsqStoreCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    needLsq(i) && stgData(i).ctrl.memWrite)))
  val lsqBatchReady = (needLsqLoadCount === 0.U  || !io.lsEnq.lqFull) &&
                      (needLsqStoreCount === 0.U || !io.lsEnq.sqFull)
  
  // ── 本周期是否有 lane 可分发到 IQ ──
  val hasIqDispatch = iqDispatchMask.zip(needIq).map { case (d, n) => d && n }.reduce(_ || _)

  // ── 发射条件 ──             隐含有iqready的信息
  val dispatchFire = stgValid && hasIqDispatch && (robBatchReady || !anyNeedRob) && ( lsqBatchReady || !anyNeedLsq )//&& iqReady

  val AllWillFire = VecInit((0 until CtrlBlockWidth).map(i => (needIq(i) && iqDispatchMask(i)) || !needIq(i)  )).reduce(_ && _)
  // VecInit((0 until CtrlBlockWidth).map(i =>
  //  !laneValid(i) || iqSent(i) || (needIq(i) && iqDispatchMask(i))
  // )).reduce(_ && _)

  val canAcceptNew = !stgValid || ( dispatchFire && AllWillFire )
 
  // ── 接收新数据 ──
  val inValid = io.in.map(_.valid).reduce(_ || _)
  val inFire  = inValid && canAcceptNew
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := canAcceptNew // && io.in(0).bits.pc =/= 0x1c0100c0.U
  }
 
  // ================================================================
  //  状态转移
  // ================================================================
  when(io.flush || io.redirect.valid) {
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i)  := false.B
      robWritten(i) := false.B
      lsqWritten(i) := false.B
      iqSent(i)     := false.B
    }
  }.elsewhen(inFire) {
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i)  := io.in(i).valid
      robWritten(i) := false.B
      lsqWritten(i) := false.B
      iqSent(i)     := false.B
      stgData(i)    := io.in(i).bits
      stgLqIdx(i)   := 0.U
      stgSqIdx(i)   := 0.U
    }
  }.elsewhen(dispatchFire) {
    for (i <- 0 until CtrlBlockWidth) {
      when(needRob(i)) { robWritten(i) := true.B }
      when(needLsq(i)) { lsqWritten(i) := true.B }
      when(iqDispatchMask(i) && needIq(i)) { iqSent(i) := true.B }
    }
  }
 
  // ================================================================
  //  LQ / SQ 指针生成
  // ================================================================
  val lqHeadPtr = RegInit(UInt(log2Ceil(LqSize).W), 0.U)
  val sqHeadPtr = RegInit(UInt(log2Ceil(SqSize).W), 0.U)
 
  when(dispatchFire && anyNeedLsq) {
    lqHeadPtr := lqHeadPtr + needLsqLoadCount
    sqHeadPtr := sqHeadPtr + needLsqStoreCount
  }
  when(io.flush || io.redirect.valid) {
    lqHeadPtr := 0.U
    sqHeadPtr := 0.U
  }
 
  val lqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(LqSize).W)))
  val sqIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(SqSize).W)))
  var lqOffset  = 0.U(log2Ceil(LqSize).W)
  var sqOffset  = 0.U(log2Ceil(SqSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    lqIndices(i) := lqHeadPtr + lqOffset
    sqIndices(i) := sqHeadPtr + sqOffset
    lqOffset = lqOffset + (needLsq(i) && stgData(i).ctrl.memRead).asUInt
    sqOffset = sqOffset + (needLsq(i) && stgData(i).ctrl.memWrite).asUInt
  }
 
  when(dispatchFire) {
    for (i <- 0 until CtrlBlockWidth) {
      when(needLsq(i)) {
        stgLqIdx(i) := lqIndices(i)
        stgSqIdx(i) := sqIndices(i)
      }
    }
  }
 
  val effLqIdx = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(LqSize).W)))
  val effSqIdx = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(SqSize).W)))
  for (i <- 0 until CtrlBlockWidth) {
    effLqIdx(i) := Mux(needLsq(i), lqIndices(i), stgLqIdx(i))
    effSqIdx(i) := Mux(needLsq(i), sqIndices(i), stgSqIdx(i))
  }
 
  // ================================================================
  //  BusyTable 查询
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.readReq(i * 2)     := stgData(i).prs1
    busyTable.io.readReq(i * 2 + 1) := stgData(i).prs2
  }
  for (i <- 0 until CtrlBlockWidth) {
    busyTable.io.allocReq(i).valid := dispatchFire && needRob(i) &&
                                      stgData(i).rdValid && stgData(i).ldst =/= 0.U
    busyTable.io.allocReq(i).bits  := stgData(i).pdst
  }
  for (i <- 0 until WbBusWidth) {
    busyTable.io.wbReq(i).valid := false.B
    busyTable.io.wbReq(i).bits  := 0.U
  }
 
  val prs1BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2)))
  val prs2BusyRaw = VecInit((0 until CtrlBlockWidth).map(i => busyTable.io.readResp(i * 2 + 1)))
 
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
    u.issueQueue := laneTargetQ(i)
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
    u.lqIdx      := effLqIdx(i)
    u.issueQueue := IssueQueueId.Q4.U
    u
  }
 
  def makeStaUop(i: Int): DispatchedInst = {
    val u = makeBaseUop(i)
    u.sqIdx      := effSqIdx(i)
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
    u.sqIdx      := effSqIdx(i)
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
  //  IQ 端口分配（每个 IQ 1 个端口，Mux1H 选择）
  // ================================================================
  io.q1IQEnq(0).valid := false.B;  io.q1IQEnq(0).bits := DontCare
  io.q2IQEnq(0).valid := false.B;  io.q2IQEnq(0).bits := DontCare
  io.q3IQEnq(0).valid := false.B;  io.q3IQEnq(0).bits := DontCare
  io.q4IQEnq(0).valid := false.B;  io.q4IQEnq(0).bits := DontCare
  io.q5IQEnq(0).valid := false.B;  io.q5IQEnq(0).bits := DontCare
 
  // ── Q1 (ALU + CSR) ──
  val q1Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q1.U
    u
  })
  when(q1Final.asUInt.orR && dispatchFire) {
    io.q1IQEnq(0).valid := true.B
    io.q1IQEnq(0).bits  := Mux1H(q1Final, q1Uops)
  }
 
  // ── Q2 (ALU + DIV) ──
  val q2Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q2.U
    u
  })
  when(q2Final.asUInt.orR && dispatchFire) {
    io.q2IQEnq(0).valid := true.B
    io.q2IQEnq(0).bits  := Mux1H(q2Final, q2Uops)
  }
 
  // ── Q3 (ALU + MUL + JMP) ──
  val q3Uops = (0 until CtrlBlockWidth).map(i => {
    val u = Wire(new DispatchedInst)
    u := makeBaseUop(i)
    u.issueQueue := IssueQueueId.Q3.U
    u
  })
  when(q3Final.asUInt.orR && dispatchFire) {
    io.q3IQEnq(0).valid := true.B
    io.q3IQEnq(0).bits  := Mux1H(q3Final, q3Uops)
  }
 
  // ── Q4 (LOAD + STA) ──
  //  Load → LoadUop, Store → StaUop
  val q4Uops = (0 until CtrlBlockWidth).map(i =>
    Mux(isStoreLane(i), makeStaUop(i), makeLoadUop(i))
  )
  when(q4Selected.asUInt.orR && dispatchFire) {
    io.q4IQEnq(0).valid := true.B
    io.q4IQEnq(0).bits  := Mux1H(q4Selected, q4Uops)
  }
 
  // ── Q5 (STD) ──
  val q5Uops = (0 until CtrlBlockWidth).map(i => makeStdUop(i))
  when(q5Selected.asUInt.orR && dispatchFire) {
    io.q5IQEnq(0).valid := true.B
    io.q5IQEnq(0).bits  := Mux1H(q5Selected, q5Uops)
  }
 
  // ================================================================
  //  LSQ 批量写入
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    io.lsEnq.req(i).valid        := dispatchFire && needLsq(i)
    io.lsEnq.req(i).bits.robIdx  := stgData(i).robIdx
    io.lsEnq.req(i).bits.isLoad  := stgData(i).ctrl.memRead
    io.lsEnq.req(i).bits.isStore := stgData(i).ctrl.memWrite
    io.lsEnq.req(i).bits.sqIdx   := sqIndices(i)
    io.lsEnq.req(i).bits.lqIdx   := lqIndices(i)
  }
 
  // ================================================================
  //  ROB 批量写入
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    io.robEnq.valid(i)  := dispatchFire && needRob(i)
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
    io.robEnq.bits(i).fuType   := stgData(i).ctrl.fuType
    io.robEnq.bits(i).excpVec  := stgData(i).excpVec
    io.robEnq.bits(i).robIdx   := stgData(i).robIdx
  }
}