package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
 
class DCacheMshrEntry(implicit p: Parameters) extends NSModule {
  val burstBeats = blockBytes / (XLEN / 8)
 
  val io = IO(new Bundle {
    val id = Input(UInt(log2Ceil(nMshrEntries).W))
 
    val req = Flipped(Decoupled(new MshrRequest))
 
    val ar = Decoupled(new AXI3ARData)
    val r  = Flipped(Decoupled(new AXI3RData))
    val aw = Decoupled(new AXI3AWData)
    val w  = Decoupled(new AXI3WData)
    val b  = Flipped(Decoupled(new AXI3BData))
 
    val loadResp  = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val storeAck  = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
    val arrayWrite = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val dirty = Bool()
      val data  = UInt((blockBytes * 8).W)
      val wen   = Bool()
    })
    val replacerTouch = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
    })
 
    val busy         = Output(Bool())
    val isWriteback  = Output(Bool())
    val setIdx       = Output(UInt(idxBits.W))
    val blockOthers  = Output(Bool())
    val canAcceptReq = Output(Bool())
 
    val redirect = Input(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  // === 状态机 ===
  val s_idle :: s_wb_aw :: s_wb_w :: s_wb_b :: s_refill_ar :: s_refill_r :: s_write_array :: s_send_resp :: s_uc_ar :: s_uc_r :: s_uc_aw :: s_uc_w :: s_uc_b :: Nil = Enum(13)
 
  val state = RegInit(s_idle)
 
  // === 请求信息寄存器 ===
  val reqReg     = Reg(new MshrRequest)
  val flushed    = RegInit(false.B)
  val beatCnt    = RegInit(0.U(log2Ceil(burstBeats + 1).W))
  val refillBuf  = Reg(Vec(burstBeats, UInt(XLEN.W)))
 
  // === 状态输出 ===
  io.busy        := state =/= s_idle
  io.isWriteback := state === s_wb_aw || state === s_wb_w || state === s_wb_b
  io.setIdx      := reqReg.paddr(blockOffBits + idxBits - 1, blockOffBits)
  io.blockOthers := io.isWriteback
  io.canAcceptReq := state === s_idle
 
  // === Flush ===
  when(io.redirect.valid && reqReg.cacheable &&
       (reqReg.reqType === MshrReqType.refillLoad || reqReg.reqType === MshrReqType.uncacheRead)) {
    when(reqReg.robIdx.isAfter(io.redirect.bits.robIdx)) {
      flushed := true.B
    }
  }
 
  // === 接收请求 ===
  io.req.ready := state === s_idle
  when(io.req.fire) {
    reqReg  := io.req.bits
    flushed := false.B
    beatCnt := 0.U
    state   := MuxLookup(io.req.bits.reqType, s_idle)( Seq(
      MshrReqType.refillLoad  -> Mux(io.req.bits.victimDirty, s_wb_aw, s_refill_ar),
      MshrReqType.refillStore -> Mux(io.req.bits.victimDirty, s_wb_aw, s_refill_ar),
      MshrReqType.writeback   -> s_wb_aw,
      MshrReqType.uncacheRead -> s_uc_ar,
      MshrReqType.uncacheWrite -> s_uc_aw
    ))
  }
 
  // === AXI AR ===
  val refillAddr = Cat(reqReg.paddr(31, blockOffBits), 0.U(blockOffBits.W))
  io.ar.valid := state === s_refill_ar || state === s_uc_ar
  io.ar.bits.arid    := io.id
  io.ar.bits.araddr  := Mux(state === s_uc_ar, reqReg.paddr, refillAddr)
  io.ar.bits.arlen   := Mux(state === s_uc_ar, 0.U, (burstBeats - 1).U)
  io.ar.bits.arsize  := 2.U
  io.ar.bits.arburst := Mux(state === s_uc_ar, 0.U, 1.U)
  io.ar.bits.arlock  := 0.U
  io.ar.bits.arcache := 0.U
  io.ar.bits.arprot  := 0.U

  io.ar.bits.arvalid := io.ar.valid
 
  when(state === s_refill_ar && io.ar.fire) { state := s_refill_r }
  when(state === s_uc_ar && io.ar.fire)     { state := s_uc_r }
 
  // === AXI R ===
  io.r.ready := state === s_refill_r || state === s_uc_r
 
  when(state === s_refill_r && io.r.fire) {
    refillBuf(beatCnt) := io.r.bits.rdata
    beatCnt := beatCnt + 1.U
    when(io.r.bits.rlast) {
      beatCnt := 0.U
      state := s_write_array
    }
  }
 
  when(state === s_uc_r && io.r.fire) {
    refillBuf(0) := io.r.bits.rdata
    state := s_send_resp
  }
 
  // === AXI AW ===
  val wbAddr = Cat(reqReg.victimTag, reqReg.paddr(blockOffBits + idxBits - 1, blockOffBits), 0.U(blockOffBits.W))
  io.aw.valid := state === s_wb_aw || state === s_uc_aw
  io.aw.bits.awid    := io.id
  io.aw.bits.awaddr  := Mux(state === s_uc_aw, reqReg.paddr, wbAddr)
  io.aw.bits.awlen   := Mux(state === s_uc_aw, 0.U, (burstBeats - 1).U)
  io.aw.bits.awsize  := 2.U
  io.aw.bits.awburst := Mux(state === s_uc_aw, 0.U, 1.U)
  io.aw.bits.awlock  := 0.U
  io.aw.bits.awcache := 0.U
  io.aw.bits.awprot  := 0.U
  io.aw.bits.awvalid := io.aw.valid
  when(state === s_wb_aw && io.aw.fire) { state := s_wb_w; beatCnt := 0.U }
  when(state === s_uc_aw && io.aw.fire) { state := s_uc_w; beatCnt := 0.U }
 
  // === AXI W ===
  val wbDataVec = VecInit((0 until burstBeats).map(i => reqReg.victimData(i * XLEN + XLEN - 1, i * XLEN)))
  val ucWdata = reqReg.storeData
  val ucWstrb = MuxLookup(reqReg.lsuOp, 0xF.U(4.W))( Seq(
    LsuOp.stb -> 1.U(4.W),
    LsuOp.sth -> 3.U(4.W),
    LsuOp.stw -> 0xF.U(4.W)
  ))
 
  io.w.valid := state === s_wb_w || state === s_uc_w
  io.w.bits.wid   := io.id
  io.w.bits.wdata := Mux(state === s_uc_w, ucWdata, wbDataVec(beatCnt))
  io.w.bits.wstrb := Mux(state === s_uc_w, ucWstrb, 0xF.U(4.W))
  io.w.bits.wlast := Mux(state === s_uc_w, true.B, beatCnt === (burstBeats - 1).U)
  io.w.bits.wvalid := io.w.valid
 
  when((state === s_wb_w || state === s_uc_w) && io.w.fire) {
    beatCnt := beatCnt + 1.U
    when(io.w.bits.wlast) {
      state := Mux(state === s_uc_w, s_uc_b, s_wb_b)
      beatCnt := 0.U
    }
  }
 
  // === AXI B ===
  io.b.ready := state === s_wb_b || state === s_uc_b
 
  when(state === s_wb_b && io.b.fire) {
    state := Mux(reqReg.reqType === MshrReqType.writeback, s_idle, s_refill_ar)
  }
 
  when(state === s_uc_b && io.b.fire) {
    state := s_send_resp
  }
 
  // === 写入 Cache Array ===
  val setIdx = reqReg.paddr(blockOffBits + idxBits - 1, blockOffBits)
 
  // 合并 store 到 refill 数据
  val storeWordOff = reqReg.paddr(blockOffBits - 1, 2)
  val refillWords = Wire(Vec(blockBytes / 4, UInt(XLEN.W)))
  for (w <- 0 until blockBytes / 4) {
    refillWords(w) := refillBuf(w)
  }
  when(reqReg.reqType === MshrReqType.refillStore) {
    for (w <- 0 until blockBytes / 4) {
      when(storeWordOff === w.U) {
        refillWords(w) := reqReg.storeData
      }
    }
  }
  val mergedLine = Cat(refillWords.reverse)
 
  io.arrayWrite.valid := state === s_write_array && !flushed
  io.arrayWrite.idx   := setIdx
  io.arrayWrite.way   := reqReg.victimWay
  io.arrayWrite.tag   := reqReg.paddr(31, blockOffBits + idxBits)
  io.arrayWrite.dirty := reqReg.reqType === MshrReqType.refillStore
  io.arrayWrite.data  := mergedLine
  io.arrayWrite.wen   := true.B
 
  io.replacerTouch.valid := state === s_write_array && !flushed
  io.replacerTouch.idx   := setIdx
  io.replacerTouch.way   := reqReg.victimWay
 
  when(state === s_write_array) {
    state := s_send_resp
  }
 
  // === 发送响应 ===
  val loadWordOff = reqReg.paddr(blockOffBits - 1, 2)
  val loadRawWord = Wire(UInt(XLEN.W))
  loadRawWord := 0.U
  for (w <- 0 until blockBytes / 4) {
    when(loadWordOff === w.U) {
      loadRawWord := refillBuf(w)
    }
  }
 
  val loadByteOff = reqReg.paddr(1, 0)
  val loadShifted = MuxLookup(loadByteOff, loadRawWord)( Seq(
    0.U -> loadRawWord,
    1.U -> Cat(0.U(8.W), loadRawWord(31, 8)),
    2.U -> Cat(0.U(16.W), loadRawWord(31, 16)),
    3.U -> Cat(0.U(24.W), loadRawWord(31, 24))
  ))
 
  val isLoad  = reqReg.reqType === MshrReqType.refillLoad || reqReg.reqType === MshrReqType.uncacheRead
  val isStore = reqReg.reqType === MshrReqType.refillStore || reqReg.reqType === MshrReqType.uncacheWrite
 
  io.loadResp.valid       := state === s_send_resp && isLoad && !flushed
  io.loadResp.bits.lqIdx  := reqReg.lqIdx
  io.loadResp.bits.data   := Mux(reqReg.reqType === MshrReqType.uncacheRead, refillBuf(0), loadShifted)
 
  io.storeAck.valid       := state === s_send_resp && isStore && !flushed
  io.storeAck.bits.sqIdx  := reqReg.sqIdx
 
  when(state === s_send_resp) {
    when(flushed || io.loadResp.fire || io.storeAck.fire) {
      state   := s_idle
      flushed := false.B
    }
  }
 
  when(state === s_idle) {
    io.arrayWrite.valid    := false.B
    io.replacerTouch.valid := false.B
    io.loadResp.valid      := false.B
    io.storeAck.valid      := false.B
  }
}
 
// ================================================================
// MSHR 顶层
// ================================================================
class DCacheMSHR(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val req = Flipped(Decoupled(new MshrRequest))
 
    val axi = new AXI3MasterIO
 
    val loadResp = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val storeAck = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
    val arrayWrite = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val dirty = Bool()
      val data  = UInt((blockBytes * 8).W)
      val wen   = Bool()
    })
    val replacerTouch = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
    })
 
    val hasWriteback = Output(Bool())
    val mshrWriting  = Output(Bool())
    val full         = Output(Bool())
 
    val redirect = Input(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  val entries = Seq.tabulate(nMshrEntries)(i => Module(new DCacheMshrEntry))
 
  // === 请求分配 ===
  val freeMask = VecInit(entries.map(_.io.canAcceptReq)).asUInt
  val hasFree  = freeMask.orR
  val allocIdx = PriorityEncoder(freeMask)
 
  val anyWriteback = VecInit(entries.map(_.io.blockOthers)).asUInt.orR
  io.hasWriteback := anyWriteback
 
  val reqSetIdx = io.req.bits.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val setConflict = VecInit(entries.map(e => e.io.busy && e.io.setIdx === reqSetIdx)).asUInt.orR
 
  val canAlloc = hasFree && !anyWriteback
  io.req.ready := canAlloc && !setConflict
  io.full      := !hasFree
 
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.id       := i.U
    entry.io.redirect := io.redirect
 
    entry.io.req.valid := io.req.valid && canAlloc && !setConflict && allocIdx === i.U
    entry.io.req.bits  := io.req.bits
  }
 
  // === AXI AR 仲裁 (OneHot) ===
  val arValids = VecInit(entries.map(_.io.ar.valid))
  val arSelectOH = PriorityMux(arValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val arHasValid = arValids.asUInt.orR
 
  io.axi.ar.data.arid    := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arid))
  io.axi.ar.data.araddr  := Mux1H(arSelectOH, entries.map(_.io.ar.bits.araddr))
  io.axi.ar.data.arlen   := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arlen))
  io.axi.ar.data.arsize  := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arsize))
  io.axi.ar.data.arburst := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arburst))
  io.axi.ar.data.arlock  := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arlock))
  io.axi.ar.data.arcache := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arcache))
  io.axi.ar.data.arprot  := Mux1H(arSelectOH, entries.map(_.io.ar.bits.arprot))
  io.axi.ar.data.arvalid := arHasValid
 
  val arReadyIn = io.axi.ar.arready
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.ar.ready := arReadyIn && arSelectOH(i)
  }
 
  // === AXI R 路由 ===
  val rId = io.axi.r.data.rid(log2Ceil(nMshrEntries) - 1, 0)
  val rIdOH = UIntToOH(rId, nMshrEntries)
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.r.valid := io.axi.r.data.rvalid && rIdOH(i)
    entry.io.r.bits  := io.axi.r.data
  }
  io.axi.r.rready := Mux1H(rIdOH, entries.map(_.io.r.ready))
 
  // === AXI AW 仲裁 ===
  val awValids = VecInit(entries.map(_.io.aw.valid))
  val awSelectOH = PriorityMux(awValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val awHasValid = awValids.asUInt.orR
 
  io.axi.aw.data.awid    := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awid))
  io.axi.aw.data.awaddr  := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awaddr))
  io.axi.aw.data.awlen   := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awlen))
  io.axi.aw.data.awsize  := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awsize))
  io.axi.aw.data.awburst := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awburst))
  io.axi.aw.data.awlock  := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awlock))
  io.axi.aw.data.awcache := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awcache))
  io.axi.aw.data.awprot  := Mux1H(awSelectOH, entries.map(_.io.aw.bits.awprot))
  io.axi.aw.data.awvalid := awHasValid
 
  val awReadyIn = io.axi.aw.awready
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.aw.ready := awReadyIn && awSelectOH(i)
  }
 
  // === AXI W 仲裁 ===
  val wValids = VecInit(entries.map(_.io.w.valid))
  val wSelectOH = PriorityMux(wValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val wHasValid = wValids.asUInt.orR
 
  io.axi.w.data.wid   := Mux1H(wSelectOH, entries.map(_.io.w.bits.wid))
  io.axi.w.data.wdata := Mux1H(wSelectOH, entries.map(_.io.w.bits.wdata))
  io.axi.w.data.wstrb := Mux1H(wSelectOH, entries.map(_.io.w.bits.wstrb))
  io.axi.w.data.wlast := Mux1H(wSelectOH, entries.map(_.io.w.bits.wlast))
  io.axi.w.data.wvalid := wHasValid
 
  val wReadyIn = io.axi.w.wready
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.w.ready := wReadyIn && wSelectOH(i)
  }
 
  // === AXI B 路由 ===
  val bId = io.axi.b.data.bid(log2Ceil(nMshrEntries) - 1, 0)
  val bIdOH = UIntToOH(bId, nMshrEntries)
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.b.valid := io.axi.b.data.bvalid && bIdOH(i)
    entry.io.b.bits  := io.axi.b.data
  }
  io.axi.b.bready := Mux1H(bIdOH, entries.map(_.io.b.ready))
 
  // === Load Resp 仲裁 ===
  val lrValids = VecInit(entries.map(_.io.loadResp.valid))
  val lrSelectOH = PriorityMux(lrValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val lrHasValid = lrValids.asUInt.orR
 
  io.loadResp.valid      := lrHasValid
  io.loadResp.bits.lqIdx := Mux1H(lrSelectOH, entries.map(_.io.loadResp.bits.lqIdx))
  io.loadResp.bits.data  := Mux1H(lrSelectOH, entries.map(_.io.loadResp.bits.data))
 
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.loadResp.ready := io.loadResp.ready && lrSelectOH(i)
  }
 
  // === Store Ack 仲裁 ===
  val saValids = VecInit(entries.map(_.io.storeAck.valid))
  val saSelectOH = PriorityMux(saValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val saHasValid = saValids.asUInt.orR
 
  io.storeAck.valid      := saHasValid
  io.storeAck.bits.sqIdx := Mux1H(saSelectOH, entries.map(_.io.storeAck.bits.sqIdx))
 
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.storeAck.ready := io.storeAck.ready && saSelectOH(i)
  }
 
  // === Array Write 仲裁 ===
  val awValids2 = VecInit(entries.map(_.io.arrayWrite.valid))
  val awSelectOH2 = PriorityMux(awValids2.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
  val awHasValid2 = awValids2.asUInt.orR
  io.mshrWriting := awHasValid2
 
  io.arrayWrite.valid := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.valid.asUInt)).orR
  io.arrayWrite.idx   := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.idx))
  io.arrayWrite.way   := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.way))
  io.arrayWrite.tag   := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.tag))
  io.arrayWrite.dirty := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.dirty))
  io.arrayWrite.data  := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.data))
  io.arrayWrite.wen   := Mux1H(awSelectOH2, entries.map(_.io.arrayWrite.wen))
 
  // === Replacer Touch 仲裁 ===
  val rtValids = VecInit(entries.map(_.io.replacerTouch.valid))
  val rtSelectOH = PriorityMux(rtValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nMshrEntries) })
 
  io.replacerTouch.valid := Mux1H(rtSelectOH, entries.map(_.io.replacerTouch.valid.asUInt)).orR
  io.replacerTouch.idx   := Mux1H(rtSelectOH, entries.map(_.io.replacerTouch.idx))
  io.replacerTouch.way   := Mux1H(rtSelectOH, entries.map(_.io.replacerTouch.way))
}