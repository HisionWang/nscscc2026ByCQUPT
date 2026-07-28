package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
 
// ── SQ → LQ 前递广播表项 ──
// StoreQueue 每周期将所有表项状态广播给 LoadQueue，
// 替代旧的 sqOldestRobIdx 单索引传递，打断 SQ→LQ 串行关键路径
class SqForwardEntry(implicit p: Parameters) extends NSBundle {
  val valid       = Bool()       // 该 SQ 表项有效
  val addrValid   = Bool()       // STA 已写入物理地址
  val dataValid   = Bool()       // STD 已写入数据
  val robIdx      = new RobPtr(RobSize)
  val paddr       = UInt(XLEN.W)
  val data        = UInt(XLEN.W) // store 数据（stb→data(7,0), sth→data(15,0), stw→data(31,0)）
  val lsuOp       = UInt(LsuOp.width.W)
  val alreadyFlush = Bool()      // 已被重定向冲刷
}
 
class LoadQueue(implicit p: Parameters) extends NSModule {
 
  // ── 内部环形指针 ──
  class LqPtrInner extends CircularQueuePtr[LqPtrInner](LqSize)
 
  // ── 内部表项 ──
  class LqEntry(implicit p: Parameters) extends NSBundle {
    val robIdxFull  = new RobPtr(RobSize)
    val sqIdx       = UInt(log2Ceil(SqSize).W)
    val valid       = Bool()
    val addrValid   = Bool()      // 执行单元已写入地址
    val alreadyFlush = Bool()
    val issued      = Bool()      // 已向 DCache 发出请求 或 已从 SQ 前递
    val dataValid   = Bool()      // DCache 已返回数据 或 SQ 前递数据已写入
    val writtenBack = Bool()      // 已向后端写回
    val forwarded   = Bool()      // 数据来自 SQ 前递（非 DCache）
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
 
    // ── 入队（来自 Dispatch） ──
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
 
    // ── 地址写入（来自执行单元地址通道） ──
    val addrWrite = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(log2Ceil(LqSize).W))
      val vaddr = Input(UInt(XLEN.W))
      val paddr = Input(UInt(XLEN.W))
      val cacheable = Input(Bool())
      val excp  = Input(new ExceptionBundle)
    }
 
    // ── SQ 前递广播（替代旧的 sqOldestRobIdx + sqEmpty） ──
    val sqForward = Input(Vec(SqSize, new SqForwardEntry))
 
    // ── DCache Load 请求 ──
    val dcacheReq = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val robIdx = new RobPtr(RobSize)
      val paddr  = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp = UInt(LsuOp.width.W)
    })
 
    // ── DCache Load 响应（乱序返回，携带 lqIdx） ──
    val dcacheResp = Flipped(Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    }))
 
    // ── 后端写回 ──
    val outResult = Decoupled(new ExeResult)
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(LqSize).W))
    val lqHasEntries = Output(UInt(log2Ceil(LqSize + 1).W))
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
  //  2. 重定向：清除比 redirect.robIdx 更新的 LQ 表项
  //     同时计算 SQ 表项是否在本拍被冲刷（用于前递安全检查）
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
 
  // SQ 表项同拍冲刷标记（组合逻辑）：排除正在被冲刷的 store 参与比对
  val sqIsNewer = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val sq = io.sqForward(i)
    sqIsNewer(i) := sq.robIdx.isAfter(redirectRobIdx) && doRedirect && sq.valid
  }
 
  // ================================================================
  //  3. 地址写入（执行单元 → LQ）
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
  //  辅助函数：字节掩码 & 前递数据提取
  // ================================================================
 
  /**
   * 计算 4-bit 字节掩码：在同一 word-aligned 地址块内，
   * 哪些 byte 被该 load/store 操作触及。
   * 用于精确的地址冲突检测和前递覆盖判断。
   *
   * stb/sth/stw: store 侧掩码
   * ldb/ldh/ldw/ldbu/ldhu: load 侧掩码
   */
  def getByteMask(paddr: UInt, lsuOp: UInt): UInt = {
    val byteOff = paddr(1, 0)
    MuxLookup(lsuOp, 0.U(4.W), Seq(
      LsuOp.stb  -> (1.U(4.W) << byteOff),        // 1 byte
      LsuOp.sth  -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W)), // 2 bytes, halfword-aligned
      LsuOp.stw  -> 0xf.U(4.W),                    // 4 bytes, word-aligned
      LsuOp.ldb  -> (1.U(4.W) << byteOff),
      LsuOp.ldh  -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W)),
      LsuOp.ldw  -> 0xf.U(4.W),
      LsuOp.ldbu -> (1.U(4.W) << byteOff),
      LsuOp.ldhu -> Mux(paddr(1), 0xc.U(4.W), 0x3.U(4.W))
    ))
  }
 
  /**
   * 从 SQ 前递数据中提取 Load 所需结果（含符号/零扩展）。
   *
   * SQ 中 store 数据的存储格式：
   *   stb → data(7,0)   = 目标 byte
   *   sth → data(15,0)  = 目标 halfword
   *   stw → data(31,0)  = 目标 word
   *
   * 步骤：
   *   1. 根据 store 的 paddr 偏移，将数据移到 word 内的正确位置
   *   2. 根据 load 的 paddr 偏移和 lsuOp，从对齐 word 中提取目标数据
   *   3. 符号/零扩展
   */
  def extractForwardData(storeData: UInt, storePaddr: UInt, storeLsuOp: UInt,
                         loadPaddr: UInt, loadLsuOp: UInt): UInt = {
 
    // ── Step 1: 将 store 数据移到其在 32-bit word 内的正确字节位置 ──
    val storeByteOff = storePaddr(1, 0)
 
    // stb: byte 移到对应偏移
    val byteAtPos0 = Cat(0.U(24.W), storeData(7, 0))
    val byteAtPos1 = Cat(0.U(16.W), storeData(7, 0), 0.U(8.W))
    val byteAtPos2 = Cat(0.U(8.W), storeData(7, 0), 0.U(16.W))
    val byteAtPos3 = Cat(storeData(7, 0), 0.U(24.W))
    val shiftedStb = MuxLookup(storeByteOff, byteAtPos0, Seq(
      0.U -> byteAtPos0, 1.U -> byteAtPos1, 2.U -> byteAtPos2, 3.U -> byteAtPos3
    ))
 
    // sth: halfword 移到对应偏移（LoongArch 要求半字对齐，paddr(1) 决定高低半字）
    val hwordAtLow  = Cat(0.U(16.W), storeData(15, 0))   // paddr(1)=0 → bits 15:0
    val hwordAtHigh = Cat(storeData(15, 0), 0.U(16.W))    // paddr(1)=1 → bits 31:16
    val shiftedSth  = Mux(storePaddr(1), hwordAtHigh, hwordAtLow)
 
    // stw: 无需移位
    val shiftedStw = storeData
 
    val alignedWord = MuxLookup(storeLsuOp, storeData, Seq(
      LsuOp.stb -> shiftedStb,
      LsuOp.sth -> shiftedSth,
      LsuOp.stw -> shiftedStw
    ))
 
    // ── Step 2: 从对齐 word 中提取 load 所需数据 ──
    val loadByteOff = loadPaddr(1, 0)
 
    val byteData = MuxLookup(loadByteOff, alignedWord(7, 0), Seq(
      0.U -> alignedWord(7, 0),
      1.U -> alignedWord(15, 8),
      2.U -> alignedWord(23, 16),
      3.U -> alignedWord(31, 24)
    ))
 
    val halfData = Mux(loadPaddr(1), alignedWord(31, 16), alignedWord(15, 0))
 
    // ── Step 3: 符号/零扩展 ──
    MuxLookup(loadLsuOp, alignedWord, Seq(
      LsuOp.ldw  -> alignedWord,
      LsuOp.ldh  -> Cat(Fill(16, halfData(15)), halfData),
      LsuOp.ldhu -> Cat(0.U(16.W), halfData),
      LsuOp.ldb  -> Cat(Fill(24, byteData(7)), byteData),
      LsuOp.ldbu -> Cat(0.U(24.W), byteData)
    ))
  }
 
  // ================================================================
  //  4. 向 DCache 发出 Load 请求 / SQ 前递（核心优化）
  //
  //  旧逻辑：orderingOk = sqEmpty || !issueEntry.robIdxFull.isAfter(sqOldestRobIdx)
  //           → 只要 SQ 中存在更老的 store，load 就被阻断
  //
  //  新逻辑：对 SQ 所有更老 store 做逐地址比对：
  //    A) 无更老 store           → 直接发 DCache
  //    B) 有更老 store 但无冲突  → 直接发 DCache
  //    C) 有冲突 + 可前递        → 从 SQ 前递数据，跳过 DCache
  //    D) 有冲突 + 不可前递      → 等待
  //    E) 有更老 store 地址未知  → 保守等待
  // ================================================================
 
  // ── 扫描发射候选：从 deqPtr 开始最老的 addrValid && !issued 表项 ──
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
 
  // ── Load 字节掩码 ──
  val loadByteMask = getByteMask(issueEntry.paddr, issueEntry.lsuOp)
 
  // ── 地址比对：对每个 SQ 表项判断 ──
  val olderStoreVec    = Wire(Vec(SqSize, Bool()))   // 比 load 更老且地址已知的活跃 store
  val addrConflictVec  = Wire(Vec(SqSize, Bool()))   // 与 load 有地址冲突
  val canForwardVec    = Wire(Vec(SqSize, Bool()))   // 可前递（冲突+数据就绪+完全覆盖 load 字节）
  val addrUnknownVec   = Wire(Vec(SqSize, Bool()))   // 更老但地址未知的 store
 
  for (i <- 0 until SqSize) {
    val sq = io.sqForward(i)
 
    // 比 load 更老（程序序更早）且未被冲刷的活跃 store
    // issueEntry.robIdxFull.isAfter(sq.robIdx) = true 意味着 load 在 sq 之后 → sq 更老
    olderStoreVec(i) := sq.valid && sq.addrValid && !sq.alreadyFlush && !sqIsNewer(i) &&
                        issueEntry.robIdxFull.isAfter(sq.robIdx)
 
    // 地址冲突：同一 word-aligned 地址 + 字节掩码有重叠
    val sameWord       = sq.paddr(31, 2) === issueEntry.paddr(31, 2)
    val storeByteMask  = getByteMask(sq.paddr, sq.lsuOp)
    val overlap        = loadByteMask & storeByteMask
 
    addrConflictVec(i) := olderStoreVec(i) && sameWord && overlap.orR
 
    // 可前递：冲突 + store 数据就绪 + store 字节完全覆盖 load 所需字节
    canForwardVec(i) := addrConflictVec(i) && sq.dataValid && (overlap === loadByteMask)
 
    // 更老但地址未知的 store（必须保守等待，无法判断是否冲突）
    addrUnknownVec(i) := sq.valid && !sq.addrValid && !sq.alreadyFlush && !sqIsNewer(i) &&
                         issueEntry.robIdxFull.isAfter(sq.robIdx)
  }
 
  val hasOlderStore   = olderStoreVec.reduce(_ || _) || addrUnknownVec.reduce(_ || _)
  val hasAddrConflict = addrConflictVec.reduce(_ || _)
  val hasForwardable  = canForwardVec.reduce(_ || _)
  val anyAddrUnknown  = addrUnknownVec.reduce(_ || _)
 
  // ── 找到最年轻的冲突 store（用于前递） ──
  //    在所有 addrConflict 的 SQ 表项中，robIdx 最大的那个
  //    因为最年轻 store 的值才是该地址的最终值
  val isYoungestConflict = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    // entry i 是最年轻冲突项 = 它有冲突 且 没有其他冲突项的 robIdx 比它更大
    var noYoungerConflict = true.B
    for (j <- 0 until SqSize) {
      if (j != i) {
        noYoungerConflict = noYoungerConflict &&
          !(addrConflictVec(j) && io.sqForward(j).robIdx.isAfter(io.sqForward(i).robIdx))
      }
    }
    isYoungestConflict(i) := addrConflictVec(i) && noYoungerConflict
  }
 
  // 从最年轻冲突 store 提取前递相关字段
  val youngestConflictDataValid = Mux1H(isYoungestConflict, io.sqForward.map(_.dataValid))
  val youngestConflictLsuOp     = Mux1H(isYoungestConflict, io.sqForward.map(_.lsuOp))
  val youngestConflictPaddr     = Mux1H(isYoungestConflict, io.sqForward.map(_.paddr))
  val youngestConflictData      = Mux1H(isYoungestConflict, io.sqForward.map(_.data))
 
  val youngestStoreByteMask = getByteMask(youngestConflictPaddr, youngestConflictLsuOp)
  val youngestCoversLoad    = (youngestStoreByteMask & loadByteMask) === loadByteMask
 
  // ── 前递数据提取 ──
  val forwardData = extractForwardData(
    youngestConflictData, youngestConflictPaddr, youngestConflictLsuOp,
    issueEntry.paddr, issueEntry.lsuOp
  )
 
  // ── 最终发射决策 ──
  //  A) 无更老 store 或 有更老 store 但全部地址已知且无冲突 → 发 DCache
  //  B) 有冲突且最年轻冲突 store 可前递 → 前递数据，跳过 DCache
  //  C) 其他 → 等待
  //
  //  注意：anyAddrUnknown 时必须等待，即使已知 store 无冲突，
  //        因为未知地址的 store 可能恰好冲突且比当前最年轻冲突 store 更年轻
  val noConflictIssue = hasIssueCandidate &&
    (!hasOlderStore || (!hasAddrConflict && !anyAddrUnknown))
 
  val forwardIssue = hasIssueCandidate && hasAddrConflict &&
    youngestConflictDataValid && youngestCoversLoad && !anyAddrUnknown
 
  // 重定向安全：被冲刷的 load 不应发射或前递
  val issueNotFlushed = !isNewer(issueIdx)
 
  val canIssueDcache = noConflictIssue && issueNotFlushed
  val canForward     = forwardIssue   && issueNotFlushed
 
  // ── DCache 请求（仅无冲突时发出） ──
  io.dcacheReq.valid       := canIssueDcache
  io.dcacheReq.bits.lqIdx  := issueIdx
  io.dcacheReq.bits.paddr  := issueEntry.paddr
  io.dcacheReq.bits.cacheable := issueEntry.cacheable
  io.dcacheReq.bits.lsuOp  := issueEntry.lsuOp
  io.dcacheReq.bits.robIdx := issueEntry.robIdxFull
 
  when(io.dcacheReq.fire) {
    entries(issueIdx).issued := true.B
  }
 
  // ── SQ 前递写入（有冲突且可前递时，跳过 DCache） ──
  when(canForward) {
    entries(issueIdx).issued    := true.B
    entries(issueIdx).dataValid := true.B
    entries(issueIdx).forwarded := true.B
    entries(issueIdx).data      := forwardData
  }
 
  // ================================================================
  //  5. 接收 DCache 响应（乱序，用 lqIdx 索引）
  //     前递的 load 不会产生 DCache 请求，因此不会有响应冲突
  // ================================================================
  io.dcacheResp.ready := true.B
  when(io.dcacheResp.fire) {
    val idx = io.dcacheResp.bits.lqIdx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dcacheResp.bits.data
  }
 
  // ================================================================
  //  6. 向后端写回
  //     扫描从 deqPtr 开始最老的 dataValid && !writtenBack 表项
  //     ★ 修复：排除 alreadyFlush 的表项，防止已冲刷 load 错误写回
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
 
  // 构造 ExeResult
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
 
  // 构造 DispatchedInst
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
 
  // lqIdx / sqIdx 严格按 DispatchedInst 定义的类型构造
  val wbLqIdx = Wire(new SqPtr(SqSize))
  wbLqIdx.value := wbIdx
  wbLqIdx.flag  := false.B
  wbUop.lqIdx   := wbLqIdx
 
  val wbSqIdx = Wire(new LqPtr(LqSize))
  wbSqIdx.value := wbEntry.sqIdx
  wbSqIdx.flag  := false.B
  wbUop.sqIdx   := wbSqIdx
 
  // DecodeCtrl
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
  //  7. 出队：deqPtr 处已写回或已冲刷的表项可释放
  // ================================================================
  val canDeq = entries(deqPtr.value).valid &&
    (entries(deqPtr.value).writtenBack || entries(deqPtr.value).alreadyFlush)
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}