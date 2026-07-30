package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
import os.truncate
 
class LoadQueue(implicit p: Parameters) extends NSModule {
 
  class LqPtrInner extends CircularQueuePtr[LqPtrInner](LqSize)
 
  class LqEntry(implicit p: Parameters) extends NSBundle {
    val robIdxFull  = new RobPtr(RobSize)
    val sqIdx       = UInt(log2Ceil(SqSize).W)
    val valid       = Bool()
    val addrValid   = Bool()
    val alreadyFlush = Bool()
    val issued      = Bool()
    val dataValid   = Bool()
    val writtenBack = Bool()
    val vaddr       = UInt(XLEN.W)
    val paddr       = UInt(XLEN.W)
    val cacheable   = Bool()
    val data        = UInt(XLEN.W)
    val excp        = new ExceptionBundle
    val lsuOp       = UInt(LsuOp.width.W)
    val pc          = UInt(XLEN.W)
    val pdst        = UInt(PhyRegIdxWidth.W)
    val rfWen       = Bool()
    val fuType      = UInt(FuType.width.W)
  }
 
  val io = IO(new Bundle {
 
    val redirectInfo    = Flipped(ValidIO(new redirectInfoToModule))
 
    val enq = new Bundle {
      val valid  = Input(Bool())
      val robIdx = Input(new RobPtr(RobSize))
      val sqIdx  = Input(UInt(log2Ceil(SqSize).W))
      val pc     = Input(UInt(XLEN.W))
      val pdst   = Input(UInt(PhyRegIdxWidth.W))
      val rfWen  = Input(Bool())
      val lsuOp  = Input(UInt(LsuOp.width.W))
      val fuType = Input(UInt(FuType.width.W))
    }
 
    val addrWrite = new Bundle {
      val valid     = Input(Bool())
      val idx       = Input(UInt(log2Ceil(LqSize).W))
      val vaddr     = Input(UInt(XLEN.W))
      val paddr     = Input(UInt(XLEN.W))
      val cacheable = Input(Bool())
      val excp      = Input(new ExceptionBundle)
    }
 
    // ★ 新增：SQ 转发信息向量（替代原来的 sqOldestRobIdx + sqEmpty）
    val sqForwardInfo = Input(Vec(SqSize, new SqForwardInfoBundle))
 
    // 保留：用于 uncache load 的保守判断
    val sqOldestRobIdx = Input(new RobPtr(RobSize))
    val sqEmpty        = Input(Bool())
 
    val dcacheReq = Decoupled(new Bundle {
      val lqIdx     = UInt(log2Ceil(LqSize).W)
      val robIdx    = new RobPtr(RobSize)
      val paddr     = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp     = UInt(LsuOp.width.W)
    })
 
    val dcacheResp = Flipped(Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    }))
 
    val outResult = Decoupled(new ExeResult)
 
    val full          = Output(Bool())
    val empty         = Output(Bool())
    val enqPtr        = Output(UInt(log2Ceil(LqSize).W))
    val lqHasEntries  = Output(UInt(log2Ceil(LqSize + 1).W))
  })
 
  // ================================================================
  //  存储体 + 指针
  // ================================================================
  val entries = RegInit(VecInit(Seq.fill(LqSize)(0.U.asTypeOf(new LqEntry))))
  diffDontTouch(entries)
 
  val enqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val deqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
 
  io.full   := full
  io.empty  := empty
  io.enqPtr := enqPtr.value
  val count = enqPtr.distanceTo(deqPtr)
  io.lqHasEntries := count
 
  // ================================================================
  //  1. 入队
  // ================================================================
  val enqFire = io.enq.valid && !full
 
  when(enqFire) {
    val idx = enqPtr.value
    entries(idx).robIdxFull  := io.enq.robIdx
    entries(idx).sqIdx       := io.enq.sqIdx
    entries(idx).valid       := true.B
    entries(idx).addrValid   := false.B
    entries(idx).issued      := false.B
    entries(idx).dataValid   := false.B
    entries(idx).alreadyFlush := false.B
    entries(idx).writtenBack := false.B
    entries(idx).vaddr       := 0.U
    entries(idx).paddr       := 0.U
    entries(idx).cacheable   := false.B
    entries(idx).data        := 0.U
    entries(idx).excp        := 0.U.asTypeOf(new ExceptionBundle)
    entries(idx).lsuOp       := io.enq.lsuOp
    entries(idx).pc          := io.enq.pc
    entries(idx).pdst        := io.enq.pdst
    entries(idx).rfWen       := io.enq.rfWen
    entries(idx).fuType      := io.enq.fuType
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  重定向
  // ================================================================
  val doRedirect = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  val redirectRobIdx = io.redirectInfo.bits.robIdx
  val isNewer = Wire(Vec(LqSize, Bool()))
 
  for (i <- 0 until LqSize) {
    val e = entries(i)
    isNewer(i) := e.robIdxFull.isAfter(redirectRobIdx) && doRedirect && e.valid
    when(isNewer(i)) {
      e.alreadyFlush := true.B
    }
  }
 
  // ================================================================
  //  2. 地址写入
  // ================================================================
  when(io.addrWrite.valid) {
    val idx = io.addrWrite.idx
    entries(idx).addrValid := true.B
    entries(idx).vaddr     := io.addrWrite.vaddr
    entries(idx).paddr     := io.addrWrite.paddr
    entries(idx).excp      := io.addrWrite.excp
    entries(idx).cacheable := io.addrWrite.cacheable
  }
 
  // ================================================================
  //  3. 向 DCache 发出 Load 请求（★ 地址比对优化版 ★）
  //
  //  核心改变：不再依赖 sqOldestRobIdx 做粗粒度序号判断，
  //  而是将候选 load 的 paddr[31:2] 与 SQ 中所有更老 store
  //  逐项比对，仅真正地址冲突时才阻塞。
  //
  //  判定逻辑：
  //    Cacheable Load:
  //      - 有更老 store 且 addrValid=未知 → 等待（保守安全）
  //      - 有更老 store 且地址冲突 且 全部可转发(stw+dataValid) → 转发最年轻者
  //      - 有更老 store 且地址冲突 且 存在不可转发者 → 等待
  //      - 无冲突且无未知地址 → 直接发射 DCache
  //    Uncache Load:
  //      - 有更老 store → 等待
  //      - 无更老 store → 发射 DCache（坚决不转发）
  // ================================================================
 
  // ── 3a. 选择最老的、已就绪的 LQ 表项 ──
  val issueCandidates = Wire(Vec(LqSize, Bool()))
  for (i <- 0 until LqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(LqSize) - 1, 0)
    val e = entries(idx)
    issueCandidates(i) := e.valid && e.addrValid && !e.issued && !e.excp.hasException && !e.alreadyFlush
  }
 
  val hasIssueCandidate = issueCandidates.reduce(_ || _)
  val issueOffset       = PriorityEncoder(issueCandidates)
  val issueIdx          = (deqPtr.value + issueOffset)(log2Ceil(LqSize) - 1, 0)
  val issueEntry        = entries(issueIdx)
 
  // ── 3b. 地址比对：检查该 Load 与 SQ 中更老 store 的关系 ──
  //  以 word 为最小单位：忽略 paddr 低 2 位
  val loadPaddrWord = issueEntry.paddr(31, 2)
 
  // 对每个 SQ 表项，计算三类信号
  val sqConflict      = Wire(Vec(SqSize, Bool())) // 地址冲突（更老 + addrValid + 地址匹配）
  val sqForwardable   = Wire(Vec(SqSize, Bool())) // 可转发（冲突 + dataValid + stw）
  val sqUnknown       = Wire(Vec(SqSize, Bool())) // 未知地址（更老 + !addrValid）
  val sqOlderActive   = Wire(Vec(SqSize, Bool())) // 更老的活跃 store（用于 uncache 判断）
 
  for (i <- 0 until SqSize) {
    val sq = io.sqForwardInfo(i)
    // load 比 store 更新 → store 是更老的
    val isOlder   = issueEntry.robIdxFull.isAfter(sq.robIdxFull)
    // 活跃条件：有效 + 未冲刷 + 无异常
    val isActive  = sq.valid && !sq.alreadyFlush && !sq.hasException
    // 地址匹配：word 对齐比较，忽略低 2 位
    val addrMatch = sq.addrValid && (sq.paddr(31, 2) === loadPaddrWord)
 
    sqOlderActive(i) := isActive && isOlder
    sqConflict(i)    := isActive && isOlder && addrMatch
    sqForwardable(i) := sqConflict(i) && sq.dataValid && (sq.lsuOp === LsuOp.stw)
    sqUnknown(i)     := isActive && isOlder && !sq.addrValid
  }
 
  val hasConflict    = sqConflict.reduce(_ || _)
  val canForward    = sqForwardable.reduce(_ || _)
  val hasUnknown    = sqUnknown.reduce(_ || _)
  val hasOlderStore = sqOlderActive.reduce(_ || _)
 
  // 不可转发的冲突：存在冲突但非 stw 或无 dataValid
  val nonForwardableConflict = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    nonForwardableConflict(i) := sqConflict(i) && !sqForwardable(i)
  }
  val hasNonForwardableConflict = nonForwardableConflict.reduce(_ || _)
 
  // ── 3c. 找到最年轻的可转发 store（robIdx 最大的 forwardable） ──
  //  使用 O(n²) 逐项比较，对 SqSize=16 可接受
  val isYoungestForward = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    // 检查没有比 i 更年轻的 forwardable store
    val noYounger = Wire(Vec(SqSize, Bool()))
    for (j <- 0 until SqSize) {
      noYounger(j) := !(sqForwardable(j) &&
        io.sqForwardInfo(j).robIdxFull.isAfter(io.sqForwardInfo(i).robIdxFull))
    }
    isYoungestForward(i) := sqForwardable(i) && noYounger.reduce(_ && _)
  }
 
  val forwardIdx  = PriorityEncoder(isYoungestForward)
  val forwardData = io.sqForwardInfo(forwardIdx).data
 
  // ── 3d. 发射条件判定 ──
  val isUncache = !issueEntry.cacheable
 
  // Cacheable load：无未知地址 + 无不可转发冲突
  //   - !hasUnknown：所有更老 store 的地址都已知
  //   - !hasNonForwardableConflict：冲突的 store 都可转发
  //   若 hasConflict && canForward → 转发
  //   若 !hasConflict → 直接发 DCache
  val cacheableIssueOk = !hasUnknown && !hasNonForwardableConflict
 
  // Uncache load：无更老 store 时才可发射
  val uncacheIssueOk = !hasOlderStore
 
  val issueOk = Mux(isUncache, uncacheIssueOk, cacheableIssueOk)
 
  // 是否执行转发（仅 cacheable + 有冲突 + 可转发）
  val doForward = !isUncache && hasConflict && canForward && issueOk
 
  // 是否发射 DCache（无冲突 或 uncache 可发射）
  val doDcacheIssue = issueOk && !doForward
 
  // ── 3e. 输出 DCache 请求 ──
  io.dcacheReq.valid       := hasIssueCandidate && doDcacheIssue && !isNewer(issueIdx)
  io.dcacheReq.bits.lqIdx  := issueIdx
  io.dcacheReq.bits.paddr  := issueEntry.paddr
  io.dcacheReq.bits.cacheable := issueEntry.cacheable
  io.dcacheReq.bits.lsuOp  := issueEntry.lsuOp
  io.dcacheReq.bits.robIdx := issueEntry.robIdxFull
 
  when(io.dcacheReq.fire) {
    entries(issueIdx).issued := true.B
  }
 
  // ── 3f. 转发写入：直接标记 issued + dataValid ──
  when(hasIssueCandidate && doForward && !isNewer(issueIdx)) {
    entries(issueIdx).issued    := true.B
    entries(issueIdx).dataValid := true.B
    entries(issueIdx).data      := forwardData
  }
 
  // ================================================================
  //  4. 接收 DCache 响应
  // ================================================================
  io.dcacheResp.ready := true.B
  when(io.dcacheResp.fire) {
    val idx = io.dcacheResp.bits.lqIdx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dcacheResp.bits.data
  }
 
  // ================================================================
  //  5. 向后端写回
  // ================================================================
  val wbCandidates = Wire(Vec(LqSize, Bool()))
  for (i <- 0 until LqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(LqSize) - 1, 0)
    val e = entries(idx)
    wbCandidates(i) := e.valid && (e.dataValid || e.excp.hasException) && !e.writtenBack
  }
 
  val hasWbCandidate = wbCandidates.reduce(_ || _)
  val wbOffset       = PriorityEncoder(wbCandidates)
  val wbIdx          = (deqPtr.value + wbOffset)(log2Ceil(LqSize) - 1, 0)
  val wbEntry        = entries(wbIdx)
 
  io.outResult.valid                := hasWbCandidate
  io.outResult.bits.data            := wbEntry.data
  io.outResult.bits.memValid        := true.B
  io.outResult.bits.memRead         := true.B
  io.outResult.bits.memWrite        := false.B
  io.outResult.bits.memVaddr        := wbEntry.vaddr
  io.outResult.bits.memPaddr        := wbEntry.paddr
  io.outResult.bits.memStoreData    := 0.U
  io.outResult.bits.redirect.valid  := DontCare
  io.outResult.bits.redirect.bits.valid     := DontCare
  io.outResult.bits.redirect.bits.robIdx    := DontCare
  io.outResult.bits.csrWen   := DontCare
  io.outResult.bits.csrWaddr := DontCare
  io.outResult.bits.csrWdata := DontCare
  io.outResult.bits.csrTimer := DontCare
 
  val wbUop = io.outResult.bits.uop
  wbUop.pc         := wbEntry.pc
  wbUop.inst       := 0.U
  wbUop.excp       := wbEntry.excp
  wbUop.imm        := 0.U
  wbUop.csrAddress := 0.U
  wbUop.ldst       := 0.U
  wbUop.lrs1       := 0.U
  wbUop.lrs2       := 0.U
  wbUop.pdst       := wbEntry.pdst
  wbUop.prs1       := 0.U
  wbUop.prs2       := 0.U
  wbUop.oldPdst    := 0.U
  wbUop.rs1Valid   := false.B
  wbUop.rs2Valid   := false.B
  wbUop.rdValid    := wbEntry.rfWen
  wbUop.robIdx     := wbEntry.robIdxFull
  wbUop.robIdxFull := wbEntry.robIdxFull
  wbUop.issueQueue := 0.U
  wbUop.prs1Busy   := false.B
  wbUop.prs2Busy   := false.B
  wbUop.isSta      := false.B
  wbUop.isStd      := false.B
 
  val wbLqIdx = Wire(new SqPtr(SqSize))
  wbLqIdx.value := wbIdx
  wbLqIdx.flag  := false.B
  wbUop.lqIdx   := wbLqIdx
 
  val wbSqIdx = Wire(new LqPtr(LqSize))
  wbSqIdx.value := wbEntry.sqIdx
  wbSqIdx.flag  := false.B
  wbUop.sqIdx   := wbSqIdx
 
  wbUop.ctrl.fuType   := wbEntry.fuType
  wbUop.ctrl.lsuOp    := wbEntry.lsuOp
  wbUop.ctrl.rfWen    := wbEntry.rfWen
  wbUop.ctrl.memRead  := true.B
  wbUop.ctrl.memWrite := false.B
  wbUop.ctrl.aluOp    := 0.U
  wbUop.ctrl.bruOp    := 0.U
  wbUop.ctrl.csrOp    := 0.U
  wbUop.ctrl.mulOp    := 0.U
  wbUop.ctrl.divOp    := 0.U
  wbUop.ctrl.src1Type := 0.U
  wbUop.ctrl.src2Type := 0.U
  wbUop.ctrl.immType  := 0.U
  wbUop.ctrl.csrWen   := false.B
  wbUop.ctrl.isBranch := false.B
  wbUop.ctrl.isJump   := false.B
  wbUop.ctrl.isPriv   := false.B
 
  wbUop.pdInfo  := DontCare
  wbUop.bpuInfo := DontCare
  wbUop.snptId  := DontCare
 
  when(io.outResult.fire) {
    entries(wbIdx).writtenBack := true.B
  }
 
  // ================================================================
  //  6. 出队
  // ================================================================
  val canDeq = entries(deqPtr.value).valid && (entries(deqPtr.value).writtenBack || entries(deqPtr.value).alreadyFlush)
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}