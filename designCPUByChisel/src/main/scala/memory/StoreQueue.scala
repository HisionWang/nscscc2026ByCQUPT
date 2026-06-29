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
    //val paddrValid   = Bool()    // MMU 已返回物理地址/异常
    //val mmuIssued    = Bool()    // 已向 MMU 发出请求
    val committed    = Bool()    // ROB 已提交
    val writtenBack  = Bool()    // 已向后端写回
    val Memwritten  = Bool()    // 已向后端写回
    val dcacheIssued = Bool()    // 已向 DCache 发出写请求
    val vaddr        = UInt(XLEN.W)
    val paddr        = UInt(XLEN.W)
    val data         = UInt(XLEN.W)
    val excpVec      = UInt(ExceptionCode.width.W)
    val cacheable    = Bool()    // MMU 返回的可缓存标志
    val lsuOp        = UInt(LsuOp.width.W)
    val pc           = UInt(XLEN.W)
    val pdst         = UInt(PhyRegIdxWidth.W)
    val rfWen        = Bool()
    val fuType       = UInt(FuType.width.W)
  }
 
  val io = IO(new Bundle {
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
      val excpVec      = Input(UInt(ExceptionCode.width.W))
      val cacheable    = Input(Bool() )   // MMU 返回的可缓存标志
      
    }
 
    // ── 数据写入（来自 STD 执行单元） ──
    val dataWrite = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(log2Ceil(SqSize).W))
      val data  = Input(UInt(XLEN.W))
    }
 
 
    val robCommit = Vec(CommitWidth ,new Bundle {
      val valid = Input(Bool())
      val sqIdx = Input(UInt(log2Ceil(SqSize).W))
    })

    // ── DCache Store 写请求 ──
    val dcacheReq = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
      val paddr = UInt(XLEN.W)
      //val cacheable = Bool()
      val data  = UInt(XLEN.W)
      val lsuOp        = UInt(LsuOp.width.W)
    })

    val storeAck = Flipped(Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    }))
 
    // ── 后端写回 ──
    val outResult = Decoupled(new ExeResult)
 
    // ── 输出给 LQ 的排序信息 ──
    val oldestRobIdx = Output(new RobPtr(RobSize))
    val sqEmpty      = Output(Bool())
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(SqSize).W))
  })
  
 
  // ================================================================
  //  存储体 + 指针
  // ================================================================
  val entries = Reg(Vec(SqSize, new SqEntry))
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
  io.sqEmpty := empty
 
  // ── oldestRobIdx ──
  val oldestValid = entries(deqPtr.value).valid
  val oldestRob   = entries(deqPtr.value).robIdxFull
  io.oldestRobIdx := Mux(oldestValid, oldestRob, {
    val p = Wire(new RobPtr(RobSize)); p.value := 0.U; p.flag := false.B; p
  })
 
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
    //entries(idx).paddrValid   := false.B
    //entries(idx).mmuIssued    := false.B
    entries(idx).committed    := false.B
    entries(idx).writtenBack  := false.B
    entries(idx).Memwritten  := false.B
    entries(idx).dcacheIssued := false.B
    entries(idx).vaddr        := 0.U
    entries(idx).paddr        := 0.U
    entries(idx).data         := 0.U
    entries(idx).excpVec      := 0.U
    entries(idx).cacheable    := false.B
    entries(idx).lsuOp        := io.enq.lsuOp
    entries(idx).pc           := io.enq.pc
    entries(idx).pdst         := io.enq.pdst
    entries(idx).rfWen        := io.enq.rfWen
    entries(idx).fuType       := io.enq.fuType
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  2. STA 地址写入
  // ================================================================
  when(io.addrWrite.valid) {
    val idx = io.addrWrite.idx
    entries(idx).addrValid := true.B
    entries(idx).vaddr     := io.addrWrite.vaddr
    entries(idx).paddr     := io.addrWrite.paddr
    entries(idx).excpVec     := io.addrWrite.excpVec
    entries(idx).cacheable     := io.addrWrite.cacheable
  }
 
  // ================================================================
  //  3. STD 数据写入
  // ================================================================
  when(io.dataWrite.valid) {
    val idx = io.dataWrite.idx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dataWrite.data
  }
 

 
  // ================================================================
  //  6. 向后端写回
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
  io.outResult.bits.redirect.valid  := wbEntry.excpVec.orR
  io.outResult.bits.redirect.bits.valid     := wbEntry.excpVec.orR
  io.outResult.bits.redirect.bits.robIdx    := wbEntry.robIdxFull
  //io.outResult.bits.redirect.bits.flushSelf := true.B
 
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
 
  when(io.outResult.fire) {
    entries(wbIdx).writtenBack := true.B
  }
 
  // ================================================================
  //  7. 接收 ROB 提交，标记 committed
  // ================================================================
  for(i <- 0 until CommitWidth){

    when(io.robCommit(i).valid) {
      val idx = io.robCommit(i).sqIdx
      entries(idx).committed := true.B
    }

  }

 
  // ================================================================
  //  8. 向 DCache 发出 Store 写请求
  //     条件：committed + 无异常 + !dcacheIssued
  // ================================================================
  val dcacheCandidates = Wire(Vec(SqSize, Bool()))
  for (i <- 0 until SqSize) {
    val idx = (deqPtr.value + i.U)(log2Ceil(SqSize) - 1, 0)
    val e = entries(idx)
    dcacheCandidates(i) := e.valid && e.committed && !e.excpVec.orR && !e.dcacheIssued
  }
 
  val hasDcacheCandidate = dcacheCandidates.reduce(_ || _)
  val dcacheOffset       = PriorityEncoder(dcacheCandidates)
  val dcacheIdx          = (deqPtr.value + dcacheOffset)(log2Ceil(SqSize) - 1, 0)
  val dcacheEntry        = entries(dcacheIdx)
 
//  val storeMask = MuxLookup(dcacheEntry.lsuOp, 0.U((XLEN / 8).W), Seq(
//    LsuOp.stb -> (1.U((XLEN / 8).W) << dcacheEntry.paddr(log2Ceil(XLEN / 8) - 1, 0)),
//    LsuOp.sth -> (3.U((XLEN / 8).W) << Cat(dcacheEntry.paddr(log2Ceil(XLEN / 8) - 1), 0.U(1.W))),
//    LsuOp.stw -> ((1.U << (XLEN / 8)) - 1.U)
//  ))
 
  io.dcacheReq.valid      := hasDcacheCandidate
  io.dcacheReq.bits.paddr := dcacheEntry.paddr
  io.dcacheReq.bits.data  := dcacheEntry.data
  io.dcacheReq.bits.lsuOp  := dcacheEntry.lsuOp
  io.dcacheReq.bits.sqIdx  := dcacheIdx
 
  when(io.dcacheReq.fire) {
    entries(dcacheIdx).dcacheIssued := true.B
  }
  io.storeAck.ready := true.B
  when(io.storeAck.valid) {
      val idx = io.storeAck.bits.sqIdx
      entries(idx).Memwritten := true.B
  }
 
  // ================================================================
  //  9. 出队
  // ================================================================
  val canDeqNormal = entries(deqPtr.value).valid && ( entries(deqPtr.value).Memwritten ) //|| entries(deqPtr.value).excpVec.orR )
  val canDeqExcp   = entries(deqPtr.value).valid && entries(deqPtr.value).writtenBack &&
                     entries(deqPtr.value).excpVec.orR
  val canDeq = canDeqNormal || canDeqExcp
 
  when(canDeq) {
    entries(deqPtr.value).valid := false.B
    deqPtr := deqPtr + 1.U
  }
}