package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
 
class LoadQueue(implicit p: Parameters) extends NSModule {
 
  // ── 内部环形指针 ──
  class LqPtrInner extends CircularQueuePtr[LqPtrInner](LqSize)
 
  // ── 内部表项 ──
  class LqEntry(implicit p: Parameters) extends NSBundle {
    val robIdxFull  = new RobPtr(RobSize)
    val sqIdx       = UInt(log2Ceil(SqSize).W)
    val valid       = Bool()
    val addrValid   = Bool()   // 执行单元已写入虚拟地址
    val issued      = Bool()   // 已向 DCache 发出请求
    val dataValid   = Bool()   // DCache 已返回数据/异常
    val writtenBack = Bool()   // 已向后端写回
    val vaddr       = UInt(XLEN.W)
    val paddr       = UInt(XLEN.W)
    val cacheable       = Bool()
    val data        = UInt(XLEN.W)
    val excpVec     = UInt(ExceptionCode.width.W)
    val lsuOp       = UInt(LsuOp.width.W)
    val pc          = UInt(XLEN.W)
    val pdst        = UInt(PhyRegIdxWidth.W)
    val rfWen       = Bool()
    val fuType      = UInt(FuType.width.W)
  }
 
  val io = IO(new Bundle {
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
      val paddr = Input( UInt(XLEN.W))
      val cacheable       = Input( Bool())
      val excpVec     = Input( UInt(ExceptionCode.width.W))
    }
 
    // ── SQ 排序信息 ──
    val sqOldestRobIdx = Input(new RobPtr(RobSize))
    val sqEmpty        = Input(Bool())
 
    // ── DCache Load 请求 ──
    val dcacheReq = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val robIdx = new RobPtr(RobSize)
      //val vaddr = UInt(XLEN.W)
      val paddr       = UInt(XLEN.W)
      val cacheable       = Bool()
      val lsuOp        = UInt(LsuOp.width.W)

    })
 
    // ── DCache Load 响应（乱序返回，携带 lqIdx） ──
    val dcacheResp = Flipped(Decoupled(new Bundle {
      val lqIdx   = UInt(log2Ceil(LqSize).W)
      val data    = UInt(XLEN.W)

    }))
 
    // ── 后端写回 ──
    val outResult = Decoupled(new ExeResult)
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(LqSize).W))
  })
 
  // ================================================================
  //  存储体 + 指针
  // ================================================================
  val entries = Reg(Vec(LqSize, new LqEntry))
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
    entries(idx).writtenBack := false.B
    entries(idx).vaddr       := 0.U
    entries(idx).paddr       := 0.U
    entries(idx).cacheable    := false.B
    entries(idx).data        := 0.U
    entries(idx).excpVec     := 0.U
    entries(idx).lsuOp       := io.enq.lsuOp
    entries(idx).pc          := io.enq.pc
    entries(idx).pdst        := io.enq.pdst
    entries(idx).rfWen       := io.enq.rfWen
    entries(idx).fuType      := io.enq.fuType
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  2. 地址写入（执行单元 → LQ）
  // ================================================================
  when(io.addrWrite.valid) {
    val idx = io.addrWrite.idx
    entries(idx).addrValid := true.B
    entries(idx).vaddr     := io.addrWrite.vaddr
    entries(idx).paddr     := io.addrWrite.paddr
    entries(idx).excpVec   := io.addrWrite.excpVec
    entries(idx).cacheable   := io.addrWrite.cacheable
  }
 
  // ================================================================
  //  3. 向 DCache 发出 Load 请求
  //     扫描从 deqPtr 开始最老的 addrValid && !issued 表项
  //     且必须比 SQ 中最老的 Store 更老（或 SQ 为空）
  // ================================================================
  val issueCandidates = Wire(Vec(LqSize, Bool()))
  for (i <- 0 until LqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(LqSize) - 1, 0)
    val e = entries(idx)
    issueCandidates(i) := e.valid && e.addrValid && (!e.issued && !e.excpVec.orR)
  }
 
  val hasIssueCandidate = issueCandidates.reduce(_ || _)
  val issueOffset       = PriorityEncoder(issueCandidates)
  val issueIdx          = (deqPtr.value + issueOffset)(log2Ceil(LqSize) - 1, 0)
  val issueEntry        = entries(issueIdx)
 
  // 排序检查：该 Load 必须不晚于 SQ 中最老的 Store
  val orderingOk = io.sqEmpty || !issueEntry.robIdxFull.isAfter(io.sqOldestRobIdx)
 
  io.dcacheReq.valid       := hasIssueCandidate && orderingOk
  io.dcacheReq.bits.lqIdx  := issueIdx
  io.dcacheReq.bits.paddr  := issueEntry.paddr
  io.dcacheReq.bits.cacheable  := issueEntry.cacheable
  io.dcacheReq.bits.lsuOp  := issueEntry.lsuOp
  io.dcacheReq.bits.robIdx  := issueEntry.robIdxFull
 
  when(io.dcacheReq.fire) {
    entries(issueIdx).issued := true.B
  }
 
  // ================================================================
  //  4. 接收 DCache 响应（乱序，用 lqIdx 索引）
  // ================================================================
  io.dcacheResp.ready := true.B
  when(io.dcacheResp.fire) {
    val idx = io.dcacheResp.bits.lqIdx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dcacheResp.bits.data
    // entries(idx).paddr     := io.dcacheResp.bits.paddr
    // entries(idx).excpVec   := io.dcacheResp.bits.excpVec
  }
 
  // ================================================================
  //  5. 向后端写回
  //     扫描从 deqPtr 开始最老的 dataValid && !writtenBack 表项
  // ================================================================
  val wbCandidates = Wire(Vec(LqSize, Bool()))
  for (i <- 0 until LqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(LqSize) - 1, 0)
    val e = entries(idx)
    wbCandidates(i) := e.valid && ( e.dataValid || e.excpVec.orR )&& !e.writtenBack
  }
 
  val hasWbCandidate = wbCandidates.reduce(_ || _)
  val wbOffset       = PriorityEncoder(wbCandidates)
  val wbIdx          = (deqPtr.value + wbOffset)(log2Ceil(LqSize) - 1, 0)
  val wbEntry        = entries(wbIdx)
 
  // 按 lsuOp 做符号/零扩展
  // val loadData = MuxLookup(wbEntry.lsuOp, wbEntry.data, Seq(
  //   LsuOp.ldb  -> SignExt(wbEntry.data(7, 0), XLEN),
  //   LsuOp.ldh  -> SignExt(wbEntry.data(15, 0), XLEN),
  //   LsuOp.ldw  -> wbEntry.data,
  //   LsuOp.ldbu -> ZeroExt(wbEntry.data(7, 0), XLEN),
  //   LsuOp.ldhu -> ZeroExt(wbEntry.data(15, 0), XLEN)
  // ))
 
  // 构造 ExeResult
  io.outResult.valid                := hasWbCandidate
  io.outResult.bits.data            := wbEntry.data //loadData
  io.outResult.bits.redirect.valid  := wbEntry.excpVec.orR
  io.outResult.bits.redirect.bits.valid     := wbEntry.excpVec.orR
  io.outResult.bits.redirect.bits.robIdx    := wbEntry.robIdxFull
  //io.outResult.bits.redirect.bits.flushSelf := true.B
 
  // 构造 DispatchedInst（必要字段严格按层级，非必要置零）
  val wbUop = io.outResult.bits.uop
  wbUop.pc         := wbEntry.pc
  wbUop.inst       := 0.U
  wbUop.excpVec    := wbEntry.excpVec
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
 
  // pdInfo 置零
  wbUop.pdInfo := DontCare
 
  when(io.outResult.fire) {
    entries(wbIdx).writtenBack := true.B
  }
 
  // ================================================================
  //  6. 出队：deqPtr 处已写回的表项可释放
  // ================================================================
  val canDeq = entries(deqPtr.value).valid && entries(deqPtr.value).writtenBack
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}