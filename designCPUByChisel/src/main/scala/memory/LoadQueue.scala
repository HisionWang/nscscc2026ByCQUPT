package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
 
class SqForwardEntry(implicit p: Parameters) extends NSBundle {
  val valid       = Bool()
  val addrValid   = Bool()
  val dataValid   = Bool()
  val robIdx      = new RobPtr(RobSize)
  val paddr       = UInt(XLEN.W)
  val data        = UInt(XLEN.W)
  val lsuOp       = UInt(LsuOp.width.W)
  val cacheable   = Bool()
  val alreadyFlush = Bool()
}
 
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
    val forwarded   = Bool()
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
    val redirectInfo = Flipped(ValidIO(new redirectInfoToModule))
 
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
      val valid = Input(Bool())
      val idx   = Input(UInt(log2Ceil(LqSize).W))
      val vaddr = Input(UInt(XLEN.W))
      val paddr = Input(UInt(XLEN.W))
      val cacheable = Input(Bool())
      val excp  = Input(new ExceptionBundle)
    }
 
    val sqForward = Input(Vec(SqSize, new SqForwardEntry))
 
    val dcacheReq = Decoupled(new Bundle {
      val lqIdx  = UInt(log2Ceil(LqSize).W)
      val robIdx = new RobPtr(RobSize)
      val paddr  = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp  = UInt(LsuOp.width.W)
    })
 
    val dcacheResp = Flipped(Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    }))
 
    val outResult = Decoupled(new ExeResult)
 
    val hasEntries = Output(UInt(log2Ceil(LqSize + 1).W))
    val enqPtr     = Output(UInt(log2Ceil(LqSize).W))
  })
 
  // ================================================================
  //  存储体 + 指针
  // ================================================================
  val entries = RegInit(VecInit(Seq.fill(LqSize)(0.U.asTypeOf(new LqEntry))))
  dontTouch(entries)
 
  val enqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val deqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
 
  val count = enqPtr.distanceTo(deqPtr)
  io.hasEntries := count
  io.enqPtr     := enqPtr.value
 
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
    entries(idx).forwarded   := false.B
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
  //  2. 重定向 + SQ 同拍冲刷安全检查
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
 
  val sqIsNewer = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val sq = io.sqForward(i)
    sqIsNewer(i) := sq.robIdx.isAfter(redirectRobIdx) && doRedirect && sq.valid
  }
 
  // ================================================================
  //  3. 地址写入
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
  //  辅助函数
  // ================================================================
  def getByteMask(paddr: UInt, lsuOp: UInt): UInt = {
    val byteOff = paddr(1, 0)
    MuxLookup(lsuOp, 0.U(4.W), Seq(
      LsuOp.stb  -> (1.U(4.W) << byteOff),
      LsuOp.sth  -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W)),
      LsuOp.stw  -> 0xf.U(4.W),
      LsuOp.ldb  -> (1.U(4.W) << byteOff),
      LsuOp.ldh  -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W)),
      LsuOp.ldw  -> 0xf.U(4.W),
      LsuOp.ldbu -> (1.U(4.W) << byteOff),
      LsuOp.ldhu -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W))
    ))
  }
 
  def extractForwardData(storeData: UInt, storePaddr: UInt, storeLsuOp: UInt,
                         loadPaddr: UInt, loadLsuOp: UInt): UInt = {
    val storeByteOff = storePaddr(1, 0)
 
    val byteAtPos0 = Cat(0.U(24.W), storeData(7, 0))
    val byteAtPos1 = Cat(0.U(16.W), storeData(7, 0), 0.U(8.W))
    val byteAtPos2 = Cat(0.U(8.W), storeData(7, 0), 0.U(16.W))
    val byteAtPos3 = Cat(storeData(7, 0), 0.U(24.W))
    val shiftedStb = MuxLookup(storeByteOff, byteAtPos0, Seq(
      0.U -> byteAtPos0, 1.U -> byteAtPos1, 2.U -> byteAtPos2, 3.U -> byteAtPos3
    ))
 
    val hwordAtLow  = Cat(0.U(16.W), storeData(15, 0))
    val hwordAtHigh = Cat(storeData(15, 0), 0.U(16.W))
    val shiftedSth  = Mux(storePaddr(1), hwordAtHigh, hwordAtLow)
 
    val shiftedStw = storeData
 
    val alignedWord = MuxLookup(storeLsuOp, storeData, Seq(
      LsuOp.stb -> shiftedStb,
      LsuOp.sth -> shiftedSth,
      LsuOp.stw -> shiftedStw
    ))
 
    val loadByteOff = loadPaddr(1, 0)
 
    val byteData = MuxLookup(loadByteOff, alignedWord(7, 0), Seq(
      0.U -> alignedWord(7, 0),
      1.U -> alignedWord(15, 8),
      2.U -> alignedWord(23, 16),
      3.U -> alignedWord(31, 24)
    ))
 
    val halfData = Mux(loadPaddr(1), alignedWord(31, 16), alignedWord(15, 0))
 
    MuxLookup(loadLsuOp, alignedWord, Seq(
      LsuOp.ldw  -> alignedWord,
      LsuOp.ldh  -> Cat(Fill(16, halfData(15)), halfData),
      LsuOp.ldhu -> Cat(0.U(16.W), halfData),
      LsuOp.ldb  -> Cat(Fill(24, byteData(7)), byteData),
      LsuOp.ldbu -> Cat(0.U(24.W), byteData)
    ))
  }
 
  // ================================================================
  //  4. 发射决策
  //
  //  ★★★ 双轨策略 ★★★
  //
  //  Cacheable load: 地址比对 + 前递（新逻辑）
  //    - 无冲突 → 直接发 DCache
  //    - 有冲突 + 可前递 → 从 SQ 前递数据
  //    - 有冲突 + 不可前递 → 等待
  //
  //  Uncacheable load: 保守排序（旧逻辑）
  //    - 必须等 SQ 中所有比它更老的 store 执行结束（提交+写入+出队）
  //    - 原因：外设写地址和读地址可能不同，不能用地址比对投机
  //    - 等价于原始的 sqEmpty || !robIdxFull.isAfter(sqOldestRobIdx)
  // ================================================================
 
  // ── 扫描发射候选 ──
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
  val issueNotFlushed   = !isNewer(issueIdx)
 
  // ================================================================
  //  4A. Cacheable load: 地址比对 + 前递
  // ================================================================
  val loadByteMask = getByteMask(issueEntry.paddr, issueEntry.lsuOp)
 
  val olderStoreVec    = Wire(Vec(SqSize, Bool()))
  val addrConflictVec  = Wire(Vec(SqSize, Bool()))
  val canForwardVec    = Wire(Vec(SqSize, Bool()))
  val addrUnknownVec   = Wire(Vec(SqSize, Bool()))
 
  for (i <- 0 until SqSize) {
    val sq = io.sqForward(i)
 
    // 比 load 更老的、地址已知的、未被冲刷的活跃 store
    olderStoreVec(i) := sq.valid && sq.addrValid && !sq.alreadyFlush && !sqIsNewer(i) &&
                        issueEntry.robIdxFull.isAfter(sq.robIdx)
 
    val sameWord       = sq.paddr(31, 2) === issueEntry.paddr(31, 2)
    val storeByteMask  = getByteMask(sq.paddr, sq.lsuOp)
    val overlap        = loadByteMask & storeByteMask
 
    addrConflictVec(i) := olderStoreVec(i) && sameWord && overlap.orR
 
    // ★ 前递：仅 cacheable load + cacheable store
    canForwardVec(i) := addrConflictVec(i) && sq.dataValid && (overlap === loadByteMask) &&
                        sq.cacheable   // ★ 只从 cacheable store 前递
 
    // ★ 未知地址阻塞：
    //    cacheable load → 只等 cacheable 未知 store（uncache 地址区域不同，不可能冲突）
    //    uncache load → 不走此路径，走 4B 保守逻辑
    addrUnknownVec(i) := sq.valid && !sq.addrValid && !sq.alreadyFlush && !sqIsNewer(i) &&
                         issueEntry.robIdxFull.isAfter(sq.robIdx) &&
                         sq.cacheable   // ★ 仅 cacheable 的未知 store 阻塞 cacheable load
  }
 
  val hasOlderStore   = olderStoreVec.reduce(_ || _) || addrUnknownVec.reduce(_ || _)
  val hasAddrConflict = addrConflictVec.reduce(_ || _)
  val anyAddrUnknown  = addrUnknownVec.reduce(_ || _)
 
  // ── 找最年轻冲突 store ──
  val isYoungestConflict = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    var noYoungerConflict = true.B
    for (j <- 0 until SqSize) {
      if (j != i) {
        noYoungerConflict = noYoungerConflict &&
          !(addrConflictVec(j) && io.sqForward(j).robIdx.isAfter(io.sqForward(i).robIdx))
      }
    }
    isYoungestConflict(i) := addrConflictVec(i) && noYoungerConflict
  }
 
  val youngestConflictDataValid = Mux1H(isYoungestConflict, io.sqForward.map(_.dataValid))
  val youngestConflictLsuOp     = Mux1H(isYoungestConflict, io.sqForward.map(_.lsuOp))
  val youngestConflictPaddr     = Mux1H(isYoungestConflict, io.sqForward.map(_.paddr))
  val youngestConflictData      = Mux1H(isYoungestConflict, io.sqForward.map(_.data))
 
  val youngestStoreByteMask = getByteMask(youngestConflictPaddr, youngestConflictLsuOp)
  val youngestCoversLoad    = (youngestStoreByteMask & loadByteMask) === loadByteMask
 
  val forwardData = extractForwardData(
    youngestConflictData, youngestConflictPaddr, youngestConflictLsuOp,
    issueEntry.paddr, issueEntry.lsuOp
  )
 
  // Cacheable load: 无冲突发 DCache / 有冲突可前递 / 否则等待
  val cacheable_noConflict = !hasOlderStore || (!hasAddrConflict && !anyAddrUnknown)
  val cacheable_canForward = hasAddrConflict && youngestConflictDataValid && youngestCoversLoad && !anyAddrUnknown
 
  // ================================================================
  //  4B. Uncacheable load: 保守排序（与原始逻辑一致）
  //      必须等 SQ 中所有比它更老的 store 执行结束
  //      等价于原始的 sqEmpty || !robIdxFull.isAfter(sqOldestRobIdx)
  // ================================================================
 
  // 从 sqForward 广播中计算"是否有比 load 更老的、活跃的、未被冲刷的 store"
  // 这等价于原始设计中扫描 SQ 寻找 oldestRobIdx 的逻辑
  val olderActiveStoreForUncache = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val sq = io.sqForward(i)
    // ★ 不区分 cacheable/uncacheable：外设写可能影响任何读地址
    // ★ 不区分 addrValid/addrUnknown：未知地址的 store 也必须等它算完
    olderActiveStoreForUncache(i) := sq.valid && !sq.alreadyFlush && !sqIsNewer(i) &&
                                     issueEntry.robIdxFull.isAfter(sq.robIdx)
  }
  val noOlderActiveStoreForUncache = !olderActiveStoreForUncache.reduce(_ || _)
 
  // ================================================================
  //  4C. 最终发射决策：双轨合并
  // ================================================================
  val canIssueDcache = hasIssueCandidate && issueNotFlushed && Mux(issueEntry.cacheable,
    cacheable_noConflict,           // cacheable: 地址比对，无冲突可发 DCache
    noOlderActiveStoreForUncache    // uncache: 保守排序，所有更老 store 执行完才可发 DCache
  )
 
  val canForward = hasIssueCandidate && issueNotFlushed && issueEntry.cacheable && cacheable_canForward
 
  // ── DCache 请求 ──
  io.dcacheReq.valid       := canIssueDcache
  io.dcacheReq.bits.lqIdx  := issueIdx
  io.dcacheReq.bits.paddr  := issueEntry.paddr
  io.dcacheReq.bits.cacheable := issueEntry.cacheable
  io.dcacheReq.bits.lsuOp  := issueEntry.lsuOp
  io.dcacheReq.bits.robIdx := issueEntry.robIdxFull
 
  when(io.dcacheReq.fire) {
    entries(issueIdx).issued := true.B
  }
 
  // ── SQ 前递写入（仅 cacheable load + cacheable store） ──
  when(canForward) {
    entries(issueIdx).issued    := true.B
    entries(issueIdx).dataValid := true.B
    entries(issueIdx).forwarded := true.B
    entries(issueIdx).data      := forwardData
  }
 
  // ================================================================
  //  5. 接收 DCache 响应
  // ================================================================
  io.dcacheResp.ready := true.B
  when(io.dcacheResp.fire) {
    val idx = io.dcacheResp.bits.lqIdx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dcacheResp.bits.data
  }
 
  // ================================================================
  //  6. 写回（排除 alreadyFlush）
  // ================================================================
  val wbCandidates = Wire(Vec(LqSize, Bool()))
  for (i <- 0 until LqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(LqSize) - 1, 0)
    val e = entries(idx)
    wbCandidates(i) := e.valid && (e.dataValid || e.excp.hasException) && !e.writtenBack && !e.alreadyFlush
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
  io.outResult.bits.csrWen  := DontCare
  io.outResult.bits.csrWaddr:= DontCare
  io.outResult.bits.csrWdata:= DontCare
  io.outResult.bits.csrTimer:= DontCare
 
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
 
  wbUop.pdInfo := DontCare
  wbUop.bpuInfo := DontCare
  wbUop.snptId := DontCare
 
  when(io.outResult.fire) {
    entries(wbIdx).writtenBack := true.B
  }
 
  // ================================================================
  //  7. 出队
  // ================================================================
  val canDeq = entries(deqPtr.value).valid &&
    (entries(deqPtr.value).writtenBack || entries(deqPtr.value).alreadyFlush)
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}