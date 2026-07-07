package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
 
// ================================================================
//  一级 MSHR 表项：驱动 AXI 事务
// ================================================================
class PrimaryMSHREntry(implicit p: Parameters) extends NSModule {
  val burstBeats = blockBytes / (XLEN / 8)
 
  val io = IO(new Bundle {
    val id = Input(UInt(1.W))
 
    // 请求接收
    val req = Flipped(Decoupled(new Bundle {
      val paddr     = UInt(XLEN.W)
      val victimWay = UInt(wayBits.W)
      val reqType   = UInt(MshrReqType.width.W)
    }))
 
    // AXI
    val ar = Decoupled(new AXI3ARData)
    val r  = Flipped(Decoupled(new AXI3RData))
    val aw = Decoupled(new AXI3AWData)
    val w  = Decoupled(new AXI3WData)
    val b  = Flipped(Decoupled(new AXI3BData))
 
    // Array 读取（replace_find）
    val arrayReadReq      = Output(Valid(UInt(idxBits.W)))
    val arrayReadResp     = Input(new DCacheArrayReadData)
    val arrayReadRespValid = Input(Bool())
    val victimWayIn        = Input(UInt(wayBits.W))
 
    // Array 写入（refill）
    val arrayWrite = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val dirty = Bool()
      val data  = UInt((blockBytes * 8).W)
      val wen   = Bool()
    })
 
    // Meta 写入（invalidate victim）
    val metaWrite = Output(new Bundle {
      val valid     = Bool()
      val idx       = UInt(idxBits.W)
      val way       = UInt(wayBits.W)
      val metaValid = Bool()
      val dirty     = Bool()
      val tag       = UInt(tagBits.W)
    })
 
    // Replacer touch（refill 时更新）
    val replacerTouch = Output(Valid(new Bundle {
      val idx = UInt(idxBits.W)
      val way = UInt(wayBits.W)
    }))
 
    // Uncache 响应
    val uncacheLqIdx      = Input(UInt(log2Ceil(LqSize).W))
    val uncacheSqIdx      = Input(UInt(log2Ceil(SqSize).W))
    val uncacheStoreData  = Input(UInt(XLEN.W))
    val uncacheLsuOp      = Input(UInt(LsuOp.width.W))
    val uncacheLoadResp   = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val uncacheStoreAck   = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
 
    // Fetch 完成 → 唤醒二级表项
    val fetchDone          = Output(Bool())
    val fetchDoneBlockAddr = Output(UInt((tagBits + idxBits).W))
    val fetchDoneWay       = Output(UInt(wayBits.W))
 
    // 状态
    val busy          = Output(Bool())
    val accessingArray = Output(Bool())  // replace_find + invalidate
    val writingArray   = Output(Bool())  // refill_write
    val blockAddr      = Output(UInt((tagBits + idxBits).W))
    val setIdx         = Output(UInt(idxBits.W))
    val mshrVictimWay  = Output(UInt(wayBits.W))
    
    val canAccept      = Output(Bool())
    val redirect       = Input(Valid(new Bundle {      // ← 添加这个
        val robIdx = new RobPtr(RobSize)
    }))

  })
 
  // ---------- 状态机 ----------
  val s_idle :: s_replace_find :: s_invalidate :: s_wb_aw :: s_wb_w :: s_wb_b :: s_refill_ar :: s_refill_r :: s_refill_write :: s_fetch_done :: s_delay0 :: s_delay1 :: s_delay2 :: s_uc_ar :: s_uc_r :: s_uc_aw :: s_uc_w :: s_uc_b :: s_uc_resp :: Nil = Enum(19)
 
  val state = RegInit(s_idle)
 
  // 请求寄存器
  val reqPaddr     = Reg(UInt(XLEN.W))
  val reqVictimWay = Reg(UInt(wayBits.W))
  val reqType      = Reg(UInt(MshrReqType.width.W))
  val isUncache    = Reg(Bool())
 
  // Victim 信息（从 array 读取后获得）
  val victimDirtyReg = Reg(Bool())
  val victimTagReg   = Reg(UInt(tagBits.W))
  val victimDataReg  = Reg(UInt((blockBytes * 8).W))
 
  // Refill 缓冲
  val beatCnt   = RegInit(0.U(log2Ceil(burstBeats + 1).W))
  val refillBuf = Reg(Vec(burstBeats, UInt(XLEN.W)))
 
  // Uncache 响应数据
  val ucRespData = Reg(UInt(XLEN.W))
 
  // ---------- 状态输出 ----------
  io.busy           := state =/= s_idle
  io.accessingArray := state === s_replace_find || state === s_invalidate
  io.writingArray   := state === s_refill_write
  io.blockAddr      := reqPaddr(31, blockOffBits)
  io.setIdx         := reqPaddr(blockOffBits + idxBits - 1, blockOffBits)
  io.mshrVictimWay  := reqVictimWay
  io.canAccept      := state === s_idle
 
  io.fetchDone          := state === s_fetch_done
  io.fetchDoneBlockAddr := reqPaddr(31, blockOffBits)
  io.fetchDoneWay       := reqVictimWay
 
  // ---------- 接收请求 ----------
  io.req.ready := state === s_idle
  when(io.req.fire) {
    reqPaddr     := io.req.bits.paddr
    reqVictimWay := io.req.bits.victimWay
    reqType      := io.req.bits.reqType
    isUncache    := io.req.bits.reqType === MshrReqType.uncacheRead ||
                    io.req.bits.reqType === MshrReqType.uncacheWrite
    state := Mux(io.req.bits.reqType === MshrReqType.uncacheRead,  s_uc_ar,
            Mux(io.req.bits.reqType === MshrReqType.uncacheWrite, s_uc_aw,
            s_replace_find))
  }
 
  // ========== Replace Find：从 Array 读取 victim 信息 ==========
  val setIdx = reqPaddr(blockOffBits + idxBits - 1, blockOffBits)
  io.arrayReadReq.valid := state === s_replace_find
  io.arrayReadReq.bits  := setIdx
 
  when(state === s_replace_find && io.arrayReadRespValid) {
    val vw = io.victimWayIn
    victimDirtyReg := io.arrayReadResp.ways(vw).dirty
    victimTagReg   := io.arrayReadResp.ways(vw).tag
    victimDataReg  := io.arrayReadResp.ways(vw).data
    state := s_invalidate
  }
 
  // ========== Invalidate：将 victim meta 置无效 ==========
  // 关键：在 MSHR 持有 array 访问权时完成，流水线被阻塞，不会产生竞态
  io.metaWrite.valid     := state === s_invalidate
  io.metaWrite.idx       := setIdx
  io.metaWrite.way       := reqVictimWay
  io.metaWrite.metaValid := false.B
  io.metaWrite.dirty     := false.B
  io.metaWrite.tag       := 0.U
 
  when(state === s_invalidate) {
    state := Mux(victimDirtyReg, s_wb_aw, s_refill_ar)
  }
 
  // ========== AXI Writeback ==========
  val wbAddr = Cat(victimTagReg, setIdx, 0.U(blockOffBits.W))
  io.aw.valid := state === s_wb_aw
  io.aw.bits.awid    := io.id
  io.aw.bits.awaddr  := wbAddr
  io.aw.bits.awlen   := (burstBeats - 1).U
  io.aw.bits.awsize  := 2.U
  io.aw.bits.awburst := 1.U
  io.aw.bits.awlock  := 0.U
  io.aw.bits.awcache := 0.U
  io.aw.bits.awprot  := 0.U
  io.aw.bits.awvalid := io.aw.valid
  when(state === s_wb_aw && io.aw.fire) { state := s_wb_w; beatCnt := 0.U }
 
  val wbDataVec = VecInit((0 until burstBeats).map(i => victimDataReg(i * XLEN + XLEN - 1, i * XLEN)))
  io.w.valid := state === s_wb_w
  io.w.bits.wid    := io.id
  io.w.bits.wdata  := wbDataVec(beatCnt)
  io.w.bits.wstrb  := 0xF.U(4.W)
  io.w.bits.wlast  := beatCnt === (burstBeats - 1).U
  io.w.bits.wvalid := io.w.valid
  when(state === s_wb_w && io.w.fire) {
    beatCnt := beatCnt + 1.U
    when(io.w.bits.wlast) { state := s_wb_b; beatCnt := 0.U }
  }
 
  io.b.ready := state === s_wb_b
  when(state === s_wb_b && io.b.fire) { state := s_refill_ar }
 
  // ========== AXI Refill ==========
  val refillAddr = Cat(reqPaddr(31, blockOffBits), 0.U(blockOffBits.W))
  io.ar.valid := state === s_refill_ar || state === s_uc_ar
  io.ar.bits.arid    := io.id
  io.ar.bits.araddr  := Mux(state === s_uc_ar, reqPaddr, refillAddr)
  io.ar.bits.arlen   := Mux(state === s_uc_ar, 0.U, (burstBeats - 1).U)
  io.ar.bits.arsize  := 2.U
  io.ar.bits.arburst := Mux(state === s_uc_ar, 0.U, 1.U)
  io.ar.bits.arlock  := 0.U
  io.ar.bits.arcache := 0.U
  io.ar.bits.arprot  := 0.U
  io.ar.bits.arvalid := io.ar.valid
 
  when(state === s_refill_ar && io.ar.fire) { state := s_refill_r }
  when(state === s_uc_ar && io.ar.fire)     { state := s_uc_r }
 
  io.r.ready := state === s_refill_r || state === s_uc_r
  when(state === s_refill_r && io.r.fire) {
    refillBuf(beatCnt) := io.r.bits.rdata
    beatCnt := beatCnt + 1.U
    when(io.r.bits.rlast) { beatCnt := 0.U; state := s_refill_write }
  }
  when(state === s_uc_r && io.r.fire) {
    ucRespData := io.r.bits.rdata
    state := s_uc_resp
  }
 
  // ========== Refill Write：写入 Array ==========
  val refillTag = reqPaddr(31, blockOffBits + idxBits)
  io.arrayWrite.valid := state === s_refill_write
  io.arrayWrite.idx   := setIdx
  io.arrayWrite.way   := reqVictimWay
  io.arrayWrite.tag   := refillTag
  io.arrayWrite.dirty := false.B   // 重填后干净；store replay 时再设脏
  io.arrayWrite.data  := Cat(refillBuf.reverse)
  io.arrayWrite.wen   := true.B
 
  io.replacerTouch.valid := state === s_refill_write
  io.replacerTouch.bits.idx := setIdx
  io.replacerTouch.bits.way := reqVictimWay
 
  when(state === s_refill_write) { state := s_fetch_done }
 
  // ========== Fetch Done → 延迟释放 ==========
  when(state === s_fetch_done) { state := s_delay0 }
  when(state === s_delay0)     { state := s_delay1 }
  when(state === s_delay1)     { state := s_delay2 }
  when(state === s_delay2)     { state := s_idle }
 
  // ========== Uncache Write ==========
  val ucWstrb = MuxLookup(reqType, 0xF.U(4.W))(Seq(
    MshrReqType.uncacheWrite -> MuxLookup(io.uncacheLsuOp, 0xF.U(4.W))(Seq(
      LsuOp.stb -> 1.U(4.W),
      LsuOp.sth -> 3.U(4.W),
      LsuOp.stw -> 0xF.U(4.W)
    ))
  ))
  io.aw.valid := state === s_uc_aw
  io.aw.bits.awid    := io.id
  io.aw.bits.awaddr  := reqPaddr
  io.aw.bits.awlen   := 0.U
  io.aw.bits.awsize  := 2.U
  io.aw.bits.awburst := 0.U
  io.aw.bits.awlock  := 0.U
  io.aw.bits.awcache := 0.U
  io.aw.bits.awprot  := 0.U
  io.aw.bits.awvalid := io.aw.valid
  when(state === s_uc_aw && io.aw.fire) { state := s_uc_w; beatCnt := 0.U }
 
  io.w.valid := state === s_uc_w
  io.w.bits.wid    := io.id
  io.w.bits.wdata  := io.uncacheStoreData
  io.w.bits.wstrb  := ucWstrb
  io.w.bits.wlast  := true.B
  io.w.bits.wvalid := io.w.valid
  when(state === s_uc_w && io.w.fire) { state := s_uc_b }
 
  io.b.ready := state === s_uc_b
  when(state === s_uc_b && io.b.fire) { state := s_uc_resp }
 
  // ========== Uncache 响应 ==========
  val isUncacheLoad = reqType === MshrReqType.uncacheRead
  io.uncacheLoadResp.valid  := state === s_uc_resp && isUncacheLoad
  io.uncacheLoadResp.bits.lqIdx := io.uncacheLqIdx
  io.uncacheLoadResp.bits.data  := ucRespData
 
  io.uncacheStoreAck.valid  := state === s_uc_resp && !isUncacheLoad
  io.uncacheStoreAck.bits.sqIdx := io.uncacheSqIdx
 
  when(state === s_uc_resp && (io.uncacheLoadResp.fire || io.uncacheStoreAck.fire)) {
    state := s_idle
  }
 
  // idle 时清零输出
  when(state === s_idle) {
    io.arrayWrite.valid := false.B
    io.arrayWrite.wen   := false.B
    io.metaWrite.valid  := false.B
    io.replacerTouch.valid := false.B
  }
}