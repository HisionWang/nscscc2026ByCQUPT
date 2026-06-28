package nscscc.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
 
class DCacheMshrEntry(implicit p: Parameters) extends NSModule {
  val burstBeats = blockBytes / (XLEN / 8) // 64/4 = 16
 
  val io = IO(new Bundle {
    val id = Input(UInt(log2Ceil(nMshrEntries).W))
 
    // 从流水线接收请求
    val req = Flipped(Decoupled(new MshrRequest))
 
    // AXI 通道
    val ar = Decoupled(new AXI3ARData)
    val r  = Flipped(Decoupled(new AXI3RData))
    val aw = Decoupled(new AXI3AWData)
    val w  = Decoupled(new AXI3WData)
    val b  = Flipped(Decoupled(new AXI3BData))
 
    // 向 DCache 输出
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
 
    // 状态输出
    val busy           = Output(Bool())
    val isWriteback    = Output(Bool())
    val setIdx         = Output(UInt(idxBits.W))
    val blockOthers    = Output(Bool()) // 正在写回，阻塞其他 MSHR
    val canAcceptReq   = Output(Bool())
 
    // Flush
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
 
  // === Flush 检测 ===
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
    state   := MuxLookup(io.req.bits.reqType, s_idle, Seq(
      MshrReqType.refillLoad  -> Mux(io.req.bits.victimDirty, s_wb_aw, s_refill_ar),
      MshrReqType.refillStore -> Mux(io.req.bits.victimDirty, s_wb_aw, s_refill_ar),
      MshrReqType.writeback   -> s_wb_aw,
      MshrReqType.uncacheRead -> s_uc_ar,
      MshrReqType.uncacheWrite -> s_uc_aw
    ))
  }
 
  // === AXI AR 通道 ===
  val refillAddr = Cat(reqReg.paddr(31, blockOffBits), 0.U(blockOffBits.W))
  io.ar.valid := state === s_refill_ar || state === s_uc_ar
  io.ar.bits.arid    := io.id
  io.ar.bits.araddr  := Mux(state === s_uc_ar, reqReg.paddr, refillAddr)
  io.ar.bits.arlen   := Mux(state === s_uc_ar, 0.U, (burstBeats - 1).U)
  io.ar.bits.arsize  := 2.U  // 4 bytes
  io.ar.bits.arburst := Mux(state === s_uc_ar, 0.U, 1.U) // FIXED / INCR
  io.ar.bits.arlock  := 0.U
  io.ar.bits.arcache := 0.U
  io.ar.bits.arprot  := 0.U
 
  when(state === s_refill_ar && io.ar.fire) { state := s_refill_r }
  when(state === s_uc_ar && io.ar.fire)     { state := s_uc_r }
 
  // === AXI R 通道 ===
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
 
  // === AXI AW 通道（写回 / Uncache 写） ===
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
 
  when(state === s_wb_aw && io.aw.fire) { state := s_wb_w; beatCnt := 0.U }
  when(state === s_uc_aw && io.aw.fire) { state := s_uc_w; beatCnt := 0.U }
 
  // === AXI W 通道 ===
  io.w.valid := state === s_wb_w || state === s_uc_w
 
  val wbDataVec = VecInit((0 until burstBeats).map(i => reqReg.victimData(i * XLEN + XLEN - 1, i * XLEN)))
  val ucWdata = reqReg.storeData
  val ucWstrb = MuxLookup(reqReg.lsuOp, 0xF.U(4.W), Seq(
    LsuOp.stb -> 1.U(4.W),
    LsuOp.sth -> 3.U(4.W),
    LsuOp.stw -> 0xF.U(4.W)
  ))
 
  io.w.bits.wid   := io.id
  io.w.bits.wdata := Mux(state === s_uc_w, ucWdata, wbDataVec(beatCnt))
  io.w.bits.wstrb := Mux(state === s_uc_w, ucWstrb, 0xF.U(4.W))
  io.w.bits.wlast := Mux(state === s_uc_w, true.B, beatCnt === (burstBeats - 1).U)
 
  when((state === s_wb_w || state === s_uc_w) && io.w.fire) {
    beatCnt := beatCnt + 1.U
    when(io.w.bits.wlast) {
      state := Mux(state === s_uc_w, s_uc_b, s_wb_b)
      beatCnt := 0.U
    }
  }
 
  // === AXI B 通道 ===
  io.b.ready := state === s_wb_b || state === s_uc_b
 
  when(state === s_wb_b && io.b.fire) {
    // 写回完成，接下来执行 refill
    state := Mux(reqReg.reqType === MshrReqType.writeback, s_idle, s_refill_ar)
  }
 
  when(state === s_uc_b && io.b.fire) {
    state := s_send_resp
  }
 
  // === 写入 Cache Array ===
  val setIdx = reqReg.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val ptag   = reqReg.paddr(31, blockOffBits + idxBits)
 
  // 合并 store 数据到 refill 数据
  val refillLine = Cat(refillBuf.reverse)
  val storeByteOff = reqReg.paddr(blockOffBits - 1, 0)
  val storeWordOff = reqReg.paddr(blockOffBits - 1, 2)
  val mergedLine = Wire(UInt((blockBytes * 8).W))
  mergedLine := refillLine
  when(reqReg.reqType === MshrReqType.refillStore) {
    val bitOff = Cat(storeWordOff, 0.U(5.W))
    val mask = ((1.U(XLEN.W)) << XLEN) - 1.U
    // 按字写入
    for (w <- 0 until blockBytes / 4) {
      when(storeWordOff === w.U) {
        val lo = w * XLEN
        mergedLine(lo + XLEN - 1, lo) := reqReg.storeData
      }
    }
  }
 
  io.arrayWrite.valid := state === s_write_array && !flushed
  io.arrayWrite.idx   := setIdx
  io.arrayWrite.way   := reqReg.victimWay
  io.arrayWrite.tag   := ptag
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
  // 提取 load 数据
  val loadWordOff = reqReg.paddr(blockOffBits - 1, 2)
  val loadRawWord = Wire(UInt(XLEN.W))
  loadRawWord := 0.U
  for (w <- 0 until blockBytes / 4) {
    when(loadWordOff === w.U) {
      loadRawWord := refillBuf(w)
    }
  }
 
  val loadByteOff = reqReg.paddr(1, 0)
  val loadShifted = MuxLookup(loadByteOff, loadRawWord, Seq(
    0.U -> loadRawWord,
    1.U -> Cat(0.U(8.W), loadRawWord(31, 8)),
    2.U -> Cat(0.U(16.W), loadRawWord(31, 16)),
    3.U -> Cat(0.U(24.W), loadRawWord(31, 24))
  ))
 
  val isLoad = reqReg.reqType === MshrReqType.refillLoad || reqReg.reqType === MshrReqType.uncacheRead
  val isStore = reqReg.reqType === MshrReqType.refillStore || reqReg.reqType === MshrReqType.uncacheWrite
 
  io.loadResp.valid  := state === s_send_resp && isLoad && !flushed
  io.loadResp.bits.lqIdx := reqReg.lqIdx
  io.loadResp.bits.data  := Mux(reqReg.reqType === MshrReqType.uncacheRead, refillBuf(0), loadShifted)
 
  io.storeAck.valid  := state === s_send_resp && isStore && !flushed
  io.storeAck.bits.sqIdx := reqReg.sqIdx
 
  when(state === s_send_resp) {
    when(flushed || io.loadResp.fire || io.storeAck.fire) {
      state := s_idle
      flushed := false.B
    }
  }
 
  // idle 时清零输出
  when(state === s_idle) {
    io.arrayWrite.valid := false.B
    io.replacerTouch.valid := false.B
    io.loadResp.valid  := false.B
    io.storeAck.valid  := false.B
  }
}
 
// ================================================================
// MSHR 顶层模块
// ================================================================
class DCacheMSHR(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 从流水线接收请求
    val req = Flipped(Decoupled(new MshrRequest))
 
    // AXI
    val axi = new AXI3MasterIO
 
    // 向 DCache 输出
    val loadResp    = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val storeAck    = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
    val arrayWrite  = Output(new Bundle {
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
 
    // 状态
    val hasWriteback = Output(Bool())
    val mshrWriting  = Output(Bool()) // MSHR 正在写 array
    val full         = Output(Bool())
 
    // Flush
    val redirect = Input(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  val entries = Seq.tabulate(nMshrEntries)(i => Module(new DCacheMshrEntry))
 
  // === 请求分配 ===
  val freeMask = VecInit(entries.map(_.io.canAcceptReq)).asUInt
  val hasFree  = freeMask.orR
  val allocIdx = PriorityEncoder(freeMask)
 
  // 检查是否有写回正在进行
  val anyWriteback = VecInit(entries.map(_.io.blockOthers)).asUInt.orR
  io.hasWriteback := anyWriteback
 
  // 如果有写回正在进行，不分配新请求（阻塞其他 MSHR 操作）
  val canAlloc = hasFree && !anyWriteback
 
  // 同时检查同一 set 是否已有 MSHR 在处理
  val reqSetIdx = io.req.bits.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val setConflict = VecInit(entries.map(e => e.io.busy && e.io.setIdx === reqSetIdx)).asUInt.orR
 
  io.req.ready := canAlloc && !setConflict
  io.full      := !hasFree
 
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.id       := i.U
    entry.io.redirect := io.redirect
 
    // 请求分配
    entry.io.req.valid := io.req.valid && canAlloc && !setConflict && allocIdx === i.U
    entry.io.req.bits  := io.req.bits
  }
 
  // === AXI AR 仲裁 ===
  // 写回优先，然后 refill，然后 uncache read
  val arCandidates = VecInit(entries.map(e => e.io.ar.valid))
  val arSelect     = PriorityEncoder(arCandidates)
  val arValid      = arCandidates.asUInt.orR
 
  io.axi.ar.data <> entries(arSelect).io.ar.bits
  io.axi.ar.arvalid := arValid
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.r.ready := false.B
    when(i.U === arSelect) {
      entry.io.r.ready := io.axi.r.rready
    }
  }
 
  // === AXI R 路由 ===
  val rId = io.axi.r.data.rid(log2Ceil(nMshrEntries) - 1, 0)
  for ((entry, i) <- entries.zipWithIndex) {
    when(i.U === rId) {
      entry.io.r.valid := io.axi.r.data.rvalid
    }
  }
  io.axi.r.rready := entries(rId).io.r.ready
 
  // === AXI AW 仲裁 ===
  val awCandidates = VecInit(entries.map(e => e.io.aw.valid))
  val awSelect     = PriorityEncoder(awCandidates)
  val awValid      = awCandidates.asUInt.orR
 
  io.axi.aw.data <> entries(awSelect).io.aw.bits
  io.axi.aw.awready := false.B
  for ((entry, i) <- entries.zipWithIndex) {
    when(i.U === awSelect) {
      io.axi.aw.awready := entry.io.aw.ready
    }
  }
 
  // === AXI W 路由 ===
  val wCandidates = VecInit(entries.map(e => e.io.w.valid))
  val wSelect     = PriorityEncoder(wCandidates)
 
  io.axi.w.data <> entries(wSelect).io.w.bits
  io.axi.w.wready := false.B
  for ((entry, i) <- entries.zipWithIndex) {
    when(i.U === wSelect) {
      io.axi.w.wready := entry.io.w.ready
    }
  }
 
  // === AXI B 路由 ===
  val bId = io.axi.b.data.bid(log2Ceil(nMshrEntries) - 1, 0)
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.b.valid := false.B
    entry.io.b.bits  := io.axi.b.data
    when(i.U === bId) {
      entry.io.b.valid := io.axi.b.data.bvalid
    }
  }
  io.axi.b.bready := entries(bId).io.b.ready
 
  // === 响应仲裁 ===
  // Load Resp: 流水线 hit 优先在 DCache 顶层处理，这里只处理 MSHR 的
  val loadRespCandidates = VecInit(entries.map(_.io.loadResp.valid))
  val loadRespSelect     = PriorityEncoder(loadRespCandidates)
  io.loadResp.valid := loadRespCandidates.asUInt.orR
  io.loadResp.bits  := entries(loadRespSelect).io.loadResp.bits
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.loadResp.ready := i.U === loadRespSelect && io.loadResp.ready
  }
 
  // Store Ack
  val storeAckCandidates = VecInit(entries.map(_.io.storeAck.valid))
  val storeAckSelect     = PriorityEncoder(storeAckCandidates)
  io.storeAck.valid := storeAckCandidates.asUInt.orR
  io.storeAck.bits  := entries(storeAckSelect).io.storeAck.bits
  for ((entry, i) <- entries.zipWithIndex) {
    entry.io.storeAck.ready := i.U === storeAckSelect && io.storeAck.ready
  }
 
  // === Array Write 仲裁 ===
  val awCandidates2 = VecInit(entries.map(_.io.arrayWrite.valid))
  val awSelect2     = PriorityEncoder(awCandidates2)
  io.arrayWrite := entries(awSelect2).io.arrayWrite
  io.mshrWriting := awCandidates2.asUInt.orR
 
  // === Replacer Touch 仲裁 ===
  val rtCandidates = VecInit(entries.map(_.io.replacerTouch.valid))
  val rtSelect     = PriorityEncoder(rtCandidates)
  io.replacerTouch := entries(rtSelect).io.replacerTouch
 
  // AXI 默认信号
  io.axi.ar.arready := entries(arSelect).io.ar.ready
  io.axi.aw.awready := Mux(awValid, entries(awSelect).io.aw.ready, false.B)
  io.axi.w.wready   := Mux(wCandidates.asUInt.orR, entries(wSelect).io.w.ready, false.B)
  io.axi.b.bready   := Mux(io.axi.b.data.bvalid, entries(bId).io.b.ready, false.B)
}