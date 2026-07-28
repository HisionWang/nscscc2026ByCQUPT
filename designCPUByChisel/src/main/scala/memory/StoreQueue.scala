package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.mmu._
import nscscc.util.CircularQueuePtr
 
class StoreQueue(implicit p: Parameters) extends NSModule {
 
  // ── 内部环形指针 ──
  class SqPtrInner extends CircularQueuePtr[SqPtrInner](SqSize)
 
  // ── 内部表项 ──
  class SqEntry(implicit p: Parameters) extends NSBundle {
    val robIdxFull   = new RobPtr(RobSize)
    val lqIdx        = UInt(log2Ceil(LqSize).W)
    val valid        = Bool()
    val addrValid    = Bool()    // STA 已写入地址
    val dataValid    = Bool()    // STD 已写入数据
    val committed    = Bool()    // ROB 已提交
    val writtenBack  = Bool()    // 已向后端写回
    val Memwritten   = Bool()    // 已向 DCache 写入完成
    val alreadyFlush = Bool()
    val dcacheIssued = Bool()    // 已向 DCache 发出写请求
    val vaddr        = UInt(XLEN.W)
    val paddr        = UInt(XLEN.W)
    val data         = UInt(XLEN.W)
    val excp         = new ExceptionBundle
    val cacheable    = Bool()
    val lsuOp        = UInt(LsuOp.width.W)
    val pc           = UInt(XLEN.W)
    val pdst         = UInt(PhyRegIdxWidth.W)
    val rfWen        = Bool()
    val fuType       = UInt(FuType.width.W)
  }
 
  val io = IO(new Bundle {
 
    val redirectInfo    = Flipped(ValidIO(new redirectInfoToModule))
 
    // ── 入队（来自 Dispatch） ──
    val enq = new Bundle {
      val valid  = Input(Bool())
      val robIdx = Input(new RobPtr(RobSize))
      val lqIdx  = Input(UInt(log2Ceil(LqSize).W))
      val pc     = Input(UInt(XLEN.W))
      val pdst   = Input(UInt(PhyRegIdxWidth.W))
      val rfWen  = Input(Bool())
      val lsuOp  = Input(UInt(LsuOp.width.W))
      val fuType = Input(UInt(FuType.width.W))
    }
 
    // ── 地址写入（来自 STA 执行单元） ──
    val addrWrite = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(log2Ceil(SqSize).W))
      val vaddr = Input(UInt(XLEN.W))
      val paddr = Input(UInt(XLEN.W))
      val excp  = Input(new ExceptionBundle)
      val cacheable = Input(Bool())
    }
 
    // ── 数据写入（来自 STD 执行单元） ──
    val dataWrite = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(log2Ceil(SqSize).W))
      val data  = Input(UInt(XLEN.W))
    }
 
    val robCommit = Vec(CommitWidth, new Bundle {
      val valid = Input(Bool())
      val sqIdx = Input(UInt(log2Ceil(SqSize).W))
    })
 
    // ── DCache Store 写请求 ──
    val dcacheReq = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
      val paddr = UInt(XLEN.W)
      val cacheable = Bool()
      val data  = UInt(XLEN.W)
      val lsuOp = UInt(LsuOp.width.W)
    })
 
    val storeAck = Flipped(Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    }))
 
    // ── 后端写回 ──
    val outResult = Decoupled(new ExeResult)
 
    // ── SQ → LQ 前递广播（替代旧的 oldestRobIdx + sqEmpty） ──
    val sqForward = Output(Vec(SqSize, new SqForwardEntry))
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(SqSize).W))
    val sqHasEntries = Output(UInt(log2Ceil(SqSize + 1).W))
  })
 
  // ================================================================
  //  存储体 + 指针
  // ================================================================
  val entries = RegInit(VecInit(Seq.fill(SqSize)(0.U.asTypeOf(new SqEntry))))
  dontTouch(entries)
 
  val enqPtr = RegInit({
    val p = Wire(new SqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val deqPtr = RegInit({
    val p = Wire(new SqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
 
  io.full   := full
  io.empty  := empty
  io.enqPtr := enqPtr.value
    val count = enqPtr.distanceTo(deqPtr)   // 当前LQ占用数
  io.sqHasEntries := count
 
  // ================================================================
  //  SQ → LQ 前递广播：每周期将所有表项状态直连输出
  //  ★ 替代旧的 activeCandidates 扫描 + oldestRobIdx 计算
  //    纯组合逻辑（寄存器输出直连线），无优先编码器串行路径
  // ================================================================
  for (i <- 0 until SqSize) {
    val e = entries(i)
    io.sqForward(i).valid       := e.valid
    io.sqForward(i).addrValid   := e.addrValid
    io.sqForward(i).dataValid   := e.dataValid
    io.sqForward(i).robIdx      := e.robIdxFull
    io.sqForward(i).paddr       := e.paddr
    io.sqForward(i).data        := e.data
    io.sqForward(i).lsuOp       := e.lsuOp
    io.sqForward(i).alreadyFlush := e.alreadyFlush
  }
 
  // ================================================================
  //  1. 入队
  // ================================================================
  val enqFire = io.enq.valid && !full
 
  when(enqFire) {
    val idx = enqPtr.value
    entries(idx).robIdxFull   := io.enq.robIdx
    entries(idx).lqIdx        := io.enq.lqIdx
    entries(idx).valid        := true.B
    entries(idx).addrValid    := false.B
    entries(idx).dataValid    := false.B
    entries(idx).committed    := false.B
    entries(idx).alreadyFlush := false.B
    entries(idx).writtenBack  := false.B
    entries(idx).Memwritten   := false.B
    entries(idx).dcacheIssued := false.B
    entries(idx).vaddr        := 0.U
    entries(idx).paddr        := 0.U
    entries(idx).data         := 0.U
    entries(idx).excp         := 0.U.asTypeOf(new ExceptionBundle)
    entries(idx).cacheable    := false.B
    entries(idx).lsuOp        := io.enq.lsuOp
    entries(idx).pc           := io.enq.pc
    entries(idx).pdst         := io.enq.pdst
    entries(idx).rfWen        := io.enq.rfWen
    entries(idx).fuType       := io.enq.fuType
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  2. 重定向：清除比 redirect.robIdx 更新的 SQ 表项
  // ================================================================
  val doRedirect = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  val redirectRobIdx = io.redirectInfo.bits.robIdx
  when(doRedirect) {
    for (i <- 0 until SqSize) {
      val e = entries(i)
      when(e.valid && !e.committed) {
        val isNewer = e.robIdxFull.isAfter(redirectRobIdx)
        when(isNewer) {
          e.alreadyFlush := true.B
        }
      }
    }
  }
 
  // ================================================================
  //  3. STA 地址写入
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
  //  4. STD 数据写入
  // ================================================================
  when(io.dataWrite.valid) {
    val idx = io.dataWrite.idx
    entries(idx).dataValid := true.B
    entries(idx).data := MuxLookup(entries(idx).lsuOp, io.dataWrite.data)(Seq(
      LsuOp.stb -> Cat(0.U(24.W), io.dataWrite.data(7, 0)),
      LsuOp.sth -> Cat(0.U(16.W), io.dataWrite.data(15, 0)),
      LsuOp.stw -> io.dataWrite.data
    ))
  }
 
  // ================================================================
  //  5. 向后端写回
  //     条件：addrValid + dataValid + !writtenBack
  // ================================================================
  val wbCandidates = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(SqSize) - 1, 0)
    val e = entries(idx)
    wbCandidates(i) := e.valid && e.addrValid && e.dataValid && !e.writtenBack
  }
 
  val hasWbCandidate = wbCandidates.reduce(_ || _)
  val wbOffset       = PriorityEncoder(wbCandidates)
  val wbIdx          = (deqPtr.value + wbOffset)(log2Ceil(SqSize) - 1, 0)
  val wbEntry        = entries(wbIdx)
 
  io.outResult.valid                := hasWbCandidate
  io.outResult.bits.data            := 0.U
  io.outResult.bits.memValid        := true.B
  io.outResult.bits.memRead         := false.B
  io.outResult.bits.memWrite        := true.B
  io.outResult.bits.memVaddr        := wbEntry.vaddr
  io.outResult.bits.memPaddr        := wbEntry.paddr
 
  val storeByteOff = wbEntry.paddr(1, 0)
 
  io.outResult.bits.memStoreData    := Mux(wbEntry.lsuOp === LsuOp.stb,
                                            wbEntry.data << (storeByteOff * 8.U),
                                            wbEntry.data << (wbEntry.paddr(1) * 16.U))
 
  io.outResult.bits.redirect.valid  := DontCare
  io.outResult.bits.redirect.bits.valid     := DontCare
  io.outResult.bits.redirect.bits.robIdx    := wbEntry.robIdxFull
 
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
  wbUop.rdValid    := false.B
  wbUop.robIdx     := wbEntry.robIdxFull
  wbUop.robIdxFull := wbEntry.robIdxFull
  wbUop.issueQueue := 0.U
  wbUop.prs1Busy   := false.B
  wbUop.prs2Busy   := false.B
  wbUop.isSta      := false.B
  wbUop.isStd      := false.B
 
  val wbLqIdx = Wire(new SqPtr(SqSize))
  wbLqIdx.value := wbEntry.lqIdx
  wbLqIdx.flag  := false.B
  wbUop.lqIdx   := wbLqIdx
 
  val wbSqIdx = Wire(new LqPtr(LqSize))
  wbSqIdx.value := wbIdx
  wbSqIdx.flag  := false.B
  wbUop.sqIdx   := wbSqIdx
 
  wbUop.ctrl.fuType   := wbEntry.fuType
  wbUop.ctrl.lsuOp    := wbEntry.lsuOp
  wbUop.ctrl.rfWen    := false.B
  wbUop.ctrl.memRead  := false.B
  wbUop.ctrl.memWrite := true.B
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
  //  6. 接收 ROB 提交，标记 committed
  // ================================================================
  for (i <- 0 until CommitWidth) {
    when(io.robCommit(i).valid) {
      val idx = io.robCommit(i).sqIdx
      entries(idx).committed := true.B
    }
  }
 
  // ================================================================
  //  7. 向 DCache 发出 Store 写请求
  //     条件：committed + 无异常 + !dcacheIssued + !alreadyFlush
  // ================================================================
  val dcacheCandidates = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(SqSize) - 1, 0)
    val e = entries(idx)
    dcacheCandidates(i) := e.valid && e.committed && !e.excp.hasException && !e.dcacheIssued && !e.alreadyFlush
  }
 
  val hasDcacheCandidate = dcacheCandidates.reduce(_ || _)
  val dcacheOffset       = PriorityEncoder(dcacheCandidates)
  val dcacheIdx          = (deqPtr.value + dcacheOffset)(log2Ceil(SqSize) - 1, 0)
  val dcacheEntry        = entries(dcacheIdx)
 
  io.dcacheReq.valid      := hasDcacheCandidate
  io.dcacheReq.bits.paddr := dcacheEntry.paddr
  io.dcacheReq.bits.data  := dcacheEntry.data
  io.dcacheReq.bits.lsuOp := dcacheEntry.lsuOp
  io.dcacheReq.bits.cacheable := dcacheEntry.cacheable
  io.dcacheReq.bits.sqIdx := dcacheIdx
 
  when(io.dcacheReq.fire) {
    entries(dcacheIdx).dcacheIssued := true.B
  }
  io.storeAck.ready := true.B
  when(io.storeAck.valid) {
    val idx = io.storeAck.bits.sqIdx
    entries(idx).Memwritten := true.B
  }
 
  // ================================================================
  //  8. 出队
  // ================================================================
  val canDeqNormal = entries(deqPtr.value).valid &&
    (entries(deqPtr.value).Memwritten || entries(deqPtr.value).alreadyFlush)
  val canDeqExcp   = entries(deqPtr.value).valid && entries(deqPtr.value).writtenBack &&
                     entries(deqPtr.value).excp.hasException
  val canDeq = canDeqNormal || canDeqExcp
 
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}