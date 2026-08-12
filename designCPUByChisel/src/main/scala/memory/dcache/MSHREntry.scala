package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
 
// ================================================================
//  Primary MSHR 表项：驱动 AXI 总线
// ================================================================
class MSHREntry(implicit p: Parameters) extends NSModule {
  val burstBeats = blockBytes / (XLEN / 8)
  val primIdWidth = log2Ceil(nMshrEntries max 1)
 
  val io = IO(new Bundle {
    val id = Input(UInt(primIdWidth.W))
 
    val req = Flipped(Decoupled(new Bundle {
      val paddr       = UInt(XLEN.W)
      val reqType     = UInt(MshrReqType.width.W)
      val victimWay   = UInt(wayBits.W)
      val victimDirty = Bool()
      val victimTag   = UInt(tagBits.W)
      val victimData  = UInt((blockBytes * 8).W)
      val storeData   = UInt(XLEN.W)
      val lsuOp       = UInt(LsuOp.width.W)
    }))
 
    val ar = Decoupled(new AXI3ARData)
    val r  = Flipped(Decoupled(new AXI3RData))
    val aw = Decoupled(new AXI3AWData)
    val w  = Decoupled(new AXI3WData)
    val b  = Flipped(Decoupled(new AXI3BData))
 
    val refillWriteReq = Output(Bool())
    val refillWriteAck = Input(Bool())
 
    val fetchDone          = Output(Bool())
    val fetchDoneBlockAddr = Output(UInt((tagBits + idxBits).W))
 
    val uncacheData = Output(UInt(XLEN.W))
    val refillData  = Output(UInt((blockBytes * 8).W))
    val refillTag   = Output(UInt(tagBits.W))
 
    val release = Input(Bool())
 
    val busy          = Output(Bool())
    val done          = Output(Bool())
    val blockAddr     = Output(UInt((tagBits + idxBits).W))
    val setIdx        = Output(UInt(idxBits.W))
    val mshrVictimWay = Output(UInt(wayBits.W))
    val canAccept     = Output(Bool())
    val isWriteback   = Output(Bool())
    val isUncache = Output(Bool())

  })

  //     0         1          2         3             4          5                 6              7        8         9          10         11      12          13
  val s_idle :: s_wb_aw :: s_wb_w :: s_wb_b :: s_refill_ar :: s_refill_r :: s_refill_write :: s_done :: s_uc_ar :: s_uc_r :: s_uc_aw :: s_uc_w :: s_uc_b :: s_uc_done :: Nil = Enum(14)
 
  val state = RegInit(s_idle)
 
  val reqPaddr       = RegInit(0.U(XLEN.W))
  val reqType        = RegInit(0.U(MshrReqType.width.W))
  io.isUncache := reqType =/= MshrReqType.cacheable
  val reqVictimWay   = RegInit(0.U(wayBits.W))
  val reqVictimDirty = RegInit(false.B)
  val reqVictimTag   = RegInit(0.U(tagBits.W))
  val reqVictimData  = RegInit(0.U((blockBytes * 8).W))
  val reqStoreData   = RegInit(0.U(XLEN.W))
  val reqLsuOp       = RegInit(0.U(LsuOp.width.W))
  val beatCnt        = RegInit(0.U(log2Ceil(burstBeats + 1).W))
  val refillBuf      = RegInit(VecInit(Seq.fill(burstBeats)(0.U(XLEN.W))))
  val ucDataReg      = RegInit(0.U(XLEN.W))
 
  val setIdx    = reqPaddr(blockOffBits + idxBits - 1, blockOffBits)
  val refillTag = reqPaddr(31, blockOffBits + idxBits)
 
  io.busy          := state =/= s_idle
  io.done          := state === s_done || state === s_uc_done
  io.blockAddr     := reqPaddr(31, blockOffBits)
  io.setIdx        := setIdx
  io.mshrVictimWay := reqVictimWay
  io.canAccept     := state === s_idle
  io.isWriteback   := state === s_wb_aw || state === s_wb_w || state === s_wb_b
  io.fetchDone          := state === s_done || state === s_uc_done
  io.fetchDoneBlockAddr := reqPaddr(31, blockOffBits)
  io.uncacheData   := ucDataReg
  io.refillWriteReq := state === s_refill_write
  io.refillData    := Cat(refillBuf.reverse)
  io.refillTag     := refillTag
 
  // ===== 接收请求 =====
  io.req.ready := state === s_idle
  when(io.req.fire) {
    reqPaddr       := io.req.bits.paddr
    reqType        := io.req.bits.reqType
    reqVictimWay   := io.req.bits.victimWay
    reqVictimDirty := io.req.bits.victimDirty
    reqVictimTag   := io.req.bits.victimTag
    reqVictimData  := io.req.bits.victimData
    reqStoreData   := io.req.bits.storeData
    reqLsuOp       := io.req.bits.lsuOp
    state := Mux(io.req.bits.reqType === MshrReqType.uncacheRead,  s_uc_ar,
            Mux(io.req.bits.reqType === MshrReqType.uncacheWrite, s_uc_aw,
            Mux(io.req.bits.victimDirty, s_wb_aw, s_refill_ar)))
  }
 
  // ===== AXI AW =====
  val wbAddr = Cat(reqVictimTag, setIdx, 0.U(blockOffBits.W))
  io.aw.valid := state === s_wb_aw || state === s_uc_aw
  io.aw.bits.awid    := io.id
  io.aw.bits.awaddr  := Mux(state === s_uc_aw, reqPaddr, wbAddr)
  io.aw.bits.awlen   := Mux(state === s_uc_aw, 0.U, (burstBeats - 1).U)
  io.aw.bits.awsize := Mux(state === s_uc_aw,
    MuxLookup(reqLsuOp, 2.U)(Seq(
      LsuOp.stb -> 0.U,   // 1 byte  → size=0
      LsuOp.sth -> 1.U,   // 2 bytes → size=1
      LsuOp.stw -> 2.U    // 4 bytes → size=2
    )),
    2.U  // writeback 始终 4B/beat
  )

  io.aw.bits.awburst := Mux(state === s_uc_aw, 0.U, 1.U)
  io.aw.bits.awlock  := 0.U
  io.aw.bits.awcache := 0.U
  io.aw.bits.awprot  := 0.U
  io.aw.bits.awvalid := io.aw.valid
  when(state === s_wb_aw && io.aw.fire) { state := s_wb_w; beatCnt := 0.U }
  when(state === s_uc_aw && io.aw.fire) { state := s_uc_w; beatCnt := 0.U }
 
  // ===== AXI W =====
  val wbDataVec = VecInit((0 until burstBeats).map(i =>
    reqVictimData(i * XLEN + XLEN - 1, i * XLEN)))
//  val ucWstrb = MuxLookup(reqLsuOp, 0xF.U(4.W))(Seq(
//    LsuOp.stb -> 1.U(4.W), LsuOp.sth -> 3.U(4.W), LsuOp.stw -> 0xF.U(4.W)
//  ))
  val byteOff = reqPaddr(1, 0)
  val ucWstrb = MuxLookup(reqLsuOp, 0xF.U(4.W))(Seq(
      LsuOp.stb -> UIntToOH(byteOff, 4),    // 地址0→0001, 1→0010, 2→0100, 3→1000
      LsuOp.sth -> Mux(byteOff(1),
                    "b1100".U(4.W),          // 地址2,3→写高半字
                    "b0011".U(4.W)),         // 地址0,1→写低半字
      LsuOp.stw -> 0xF.U(4.W)
  ))
  val ucWdata = MuxLookup(reqLsuOp, reqStoreData)(Seq(
    LsuOp.stb -> (reqStoreData(7, 0) << (byteOff * 8.U)),
    LsuOp.sth -> (reqStoreData(15, 0) << (Cat(byteOff(1), 0.U(1.W)) * 8.U)),
    LsuOp.stw -> reqStoreData
  ))


  io.w.valid := state === s_wb_w || state === s_uc_w
  io.w.bits.wid    := io.id
  io.w.bits.wdata  := Mux(state === s_uc_w, ucWdata, wbDataVec(beatCnt))
  io.w.bits.wstrb  := Mux(state === s_uc_w, ucWstrb, 0xF.U(4.W))
  io.w.bits.wlast  := Mux(state === s_uc_w, true.B, beatCnt === (burstBeats - 1).U)
  io.w.bits.wvalid := io.w.valid
  when((state === s_wb_w || state === s_uc_w) && io.w.fire) {
    beatCnt := beatCnt + 1.U
    when(io.w.bits.wlast) {
      state := Mux(state === s_uc_w, s_uc_b, s_wb_b); beatCnt := 0.U
    }
  }
 
  // ===== AXI B =====
  io.b.ready := state === s_wb_b || state === s_uc_b
  when(state === s_wb_b && io.b.fire)  { state := s_refill_ar }
  when(state === s_uc_b && io.b.fire)  { state := s_uc_done }
 
  // ===== AXI AR =====
  val refillAddr = Cat(reqPaddr(31, blockOffBits), 0.U(blockOffBits.W))
  io.ar.valid := state === s_refill_ar || state === s_uc_ar
  io.ar.bits.arid    := io.id
  io.ar.bits.araddr  := Mux(state === s_uc_ar, reqPaddr, refillAddr)
  io.ar.bits.arlen   := Mux(state === s_uc_ar, 0.U, (burstBeats - 1).U)
  //io.ar.bits.arsize  := 2.U
  io.ar.bits.arsize  := Mux(state === s_uc_ar,
    MuxLookup(reqLsuOp, 2.U)(Seq(
      LsuOp.ldb  -> 0.U,
      LsuOp.ldbu -> 0.U,
      LsuOp.ldh  -> 1.U,
      LsuOp.ldhu -> 1.U,
      LsuOp.ldw  -> 2.U
    )),
    2.U // Cache Refill 始终保持 4B/beat
  )
  io.ar.bits.arburst := Mux(state === s_uc_ar, 0.U, 1.U)
  io.ar.bits.arlock  := 0.U
  io.ar.bits.arcache := 0.U
  io.ar.bits.arprot  := 0.U
  io.ar.bits.arvalid := io.ar.valid
  when(state === s_refill_ar && io.ar.fire) { state := s_refill_r }
  when(state === s_uc_ar && io.ar.fire)     { state := s_uc_r }
 
  // ===== AXI R =====
  io.r.ready := state === s_refill_r || state === s_uc_r
  when(state === s_refill_r && io.r.fire) {
    refillBuf(beatCnt) := io.r.bits.rdata
    beatCnt := beatCnt + 1.U
    when(io.r.bits.rlast) { beatCnt := 0.U; state := s_refill_write }
  }
  when(state === s_uc_r && io.r.fire) { ucDataReg := io.r.bits.rdata; state := s_uc_done }
 
  // ===== Refill Write 等待 DCache 写 Array =====
  when(state === s_refill_write && io.refillWriteAck) { state := s_done }
 
  // ===== Done → 等待所有 LS 表项释放 =====
  when(state === s_done && io.release)    { state := s_idle }
  when(state === s_uc_done && io.release) { state := s_idle }
}
