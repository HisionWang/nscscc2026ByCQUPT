package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
import nscscc.icache.ICacheReplacer
 
class DCache(implicit p: Parameters) extends NSModule {
  val burstBeats = blockBytes / (XLEN / 8)
 
  // 反饥饿开关（改为 false 可关闭）
  val enableAntiStarvation = true
  val storeStarvationThreshold = 8
 
  val io = IO(new Bundle {
    // ── LQ → DCache Load 请求 ──
    val loadReq = Flipped(Decoupled(new Bundle {
      val lqIdx    = UInt(log2Ceil(LqSize).W)
      val robIdx   = new RobPtr(RobSize)
      val paddr    = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp    = UInt(LsuOp.width.W)
    }))
 
    // ── DCache → LQ Load 响应 ──
    val loadResp = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
 
    // ── SQ → DCache Store 请求 ──
    val storeReq = Flipped(Decoupled(new Bundle {
      val paddr = UInt(XLEN.W)
      val data  = UInt(XLEN.W)
      val lsuOp = UInt(LsuOp.width.W)
      val sqIdx = UInt(log2Ceil(SqSize).W)
    }))
 
    // ── DCache → SQ Store 完成确认 ──
    val storeAck = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
 
    // ── AXI Master ──
    val axi = new AXI3MasterIO
 
    // ── 重定向 ──
    val redirect = Flipped(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  // ================================================================
  //  子模块实例化
  // ================================================================
  val array    = Module(new DCacheArray)
  val replacer = Module(new ICacheReplacer)
  val mshr     = Module(new DCacheMSHR)
 
  // ================================================================
  //  Load / Store 仲裁
  // ================================================================
  val storeWaitCnt = RegInit(0.U(8.W))
  val storeStarving = if (enableAntiStarvation) storeWaitCnt >= storeStarvationThreshold.U else false.B
 
  when(io.storeReq.valid && !io.loadReq.valid) {
    storeWaitCnt := 0.U
  }.elsewhen(io.storeReq.valid && io.loadReq.valid && !storeStarving) {
    storeWaitCnt := storeWaitCnt + 1.U
  }.otherwise {
    storeWaitCnt := 0.U
  }
 
  // 仲裁结果：load 优先，store 饿死时反转
  val loadSelected  = io.loadReq.valid && (!io.storeReq.valid || !storeStarving)
  val storeSelected = io.storeReq.valid && (!io.loadReq.valid || storeStarving)
 
  // ================================================================
  //  流水线寄存器
  // ================================================================
 
  // ── Stage 0 → Stage 1 传递的数据 ──
  val s1_valid      = RegInit(false.B)
  val s1_paddr      = Reg(UInt(XLEN.W))
  val s1_isLoad     = Reg(Bool())
  val s1_lqIdx      = Reg(UInt(log2Ceil(LqSize).W))
  val s1_sqIdx      = Reg(UInt(log2Ceil(SqSize).W))
  val s1_robIdx     = Reg(new RobPtr(RobSize))
  val s1_lsuOp      = Reg(UInt(LsuOp.width.W))
  val s1_cacheable  = Reg(Bool())
  val s1_storeData  = Reg(UInt(XLEN.W))
  val s1_arrayData  = Reg(new DCacheArrayReadData)
 
  // ── Stage 1 → Stage 2 传递的数据 ──
  val s2_valid      = RegInit(false.B)
  val s2_paddr      = Reg(UInt(XLEN.W))
  val s2_isLoad     = Reg(Bool())
  val s2_lqIdx      = Reg(UInt(log2Ceil(LqSize).W))
  val s2_sqIdx      = Reg(UInt(log2Ceil(SqSize).W))
  val s2_robIdx     = Reg(new RobPtr(RobSize))
  val s2_lsuOp      = Reg(UInt(LsuOp.width.W))
  val s2_cacheable  = Reg(Bool())
  val s2_storeData  = Reg(UInt(XLEN.W))
  val s2_hit        = Reg(Bool())
  val s2_hitWay     = Reg(UInt(wayBits.W))
  val s2_victimWay  = Reg(UInt(wayBits.W))
  val s2_victimDirty = Reg(Bool())
  val s2_victimTag  = Reg(UInt(tagBits.W))
  val s2_victimData = Reg(UInt((blockBytes * 8).W))
  val s2_arrayData  = Reg(new DCacheArrayReadData)
  val s2_isUncache  = Reg(Bool())
 
  // ================================================================
  //  Flush 逻辑
  // ================================================================
  def shouldFlush(robIdx: RobPtr): Bool = {
    io.redirect.valid && robIdx.isAfter(io.redirect.bits.robIdx)
  }
 
  val s1_flush = s1_valid && s1_isLoad && shouldFlush(s1_robIdx)
  val s2_flush = s2_valid && s2_isLoad && shouldFlush(s2_robIdx)
 
  // ================================================================
  //  Stage 0: 接收请求 + 读 Array
  // ================================================================
  val s2_ready = Wire(Bool())
  val s1_ready = Wire(Bool())
  val s0_ready = Wire(Bool())
 
  val s0_canGo = s1_ready
  s0_ready := !s1_valid || s1_ready
 
  // MSHR 写 array 时阻塞 s0（避免读出陈旧数据）
  val s0_blocked = mshr.io.mshrWriting
 
  val s0_loadFire  = loadSelected && s0_ready && !s0_blocked && !s2_flush
  val s0_storeFire = storeSelected && s0_ready && !s0_blocked && !s2_flush
  val s0_fire = s0_loadFire || s0_storeFire
 
  io.loadReq.ready  := s0_ready && !s0_blocked && loadSelected && !storeStarving
  io.storeReq.ready := s0_ready && !s0_blocked && storeSelected
 
  // 读 Array
  val s0_paddr = Mux(loadSelected, io.loadReq.bits.paddr, io.storeReq.bits.paddr)
  val s0_setIdx = s0_paddr(blockOffBits + idxBits - 1, blockOffBits)
 
  array.io.read.valid := s0_fire && Mux(loadSelected, io.loadReq.bits.cacheable, true.B)
  array.io.read.idx   := s0_setIdx
 
  // 读 Replacer
  replacer.io.victim.req := s0_fire
  replacer.io.victim.idx := s0_setIdx
 
  // s0 → s1
  when(s1_flush) {
    s1_valid := false.B
  }.elsewhen(s0_fire) {
    s1_valid     := true.B
    s1_paddr     := s0_paddr
    s1_isLoad    := s0_loadFire
    s1_lqIdx     := Mux(s0_loadFire, io.loadReq.bits.lqIdx, 0.U)
    s1_sqIdx     := Mux(s0_storeFire, io.storeReq.bits.sqIdx, 0.U)
    s1_robIdx    := Mux(s0_loadFire, io.loadReq.bits.robIdx, 0.U.asTypeOf(new RobPtr(RobSize)))
    s1_lsuOp     := Mux(s0_loadFire, io.loadReq.bits.lsuOp, io.storeReq.bits.lsuOp)
    s1_cacheable := Mux(s0_loadFire, io.loadReq.bits.cacheable, false.B)
    s1_storeData := Mux(s0_storeFire, io.storeReq.bits.data, 0.U)
  }.elsewhen(s1_ready) {
    s1_valid := false.B
  }
 
  // ================================================================
  //  Stage 1: Tag 比较
  // ================================================================
  val s1_setIdx = s1_paddr(blockOffBits + idxBits - 1, blockOffBits)
  val s1_ptag   = s1_paddr(31, blockOffBits + idxBits)
  val s1_isUncache = !s1_cacheable
 
  // 接收 array 读数据
  when(array.io.read.validOut) {
    s1_arrayData := array.io.read.resp
  }
 
  // Tag 比较
  val s1_tagHits = Wire(Vec(nWays, Bool()))
  for (i <- 0 until nWays) {
    s1_tagHits(i) := s1_arrayData.ways(i).valid && s1_arrayData.ways(i).tag === s1_ptag
  }
  val s1_hit    = s1_tagHits.asUInt.orR && s1_cacheable
  val s1_hitWay = OHToUInt(s1_tagHits)
  val s1_victimWay = replacer.io.victim.resp
 
  val s1_canGo = s2_ready && array.io.read.validOut
  s1_ready := !s1_valid || s1_canGo
 
  // s1 → s2
  when(s2_flush) {
    s2_valid := false.B
  }.elsewhen(s1_valid && s1_canGo && !s1_flush) {
    s2_valid       := true.B
    s2_paddr       := s1_paddr
    s2_isLoad      := s1_isLoad
    s2_lqIdx       := s1_lqIdx
    s2_sqIdx       := s1_sqIdx
    s2_robIdx      := s1_robIdx
    s2_lsuOp       := s1_lsuOp
    s2_cacheable   := s1_cacheable
    s2_storeData   := s1_storeData
    s2_hit         := s1_hit
    s2_hitWay      := s1_hitWay
    s2_victimWay   := s1_victimWay
    s2_victimDirty := s1_arrayData.ways(s1_victimWay).dirty
    s2_victimTag   := s1_arrayData.ways(s1_victimWay).tag
    s2_victimData  := s1_arrayData.ways(s1_victimWay).data
    s2_arrayData   := s1_arrayData
    s2_isUncache   := s1_isUncache
  }.elsewhen(s2_ready) {
    s2_valid := false.B
  }
 
  // ================================================================
  //  Stage 2: 执行动作
  // ================================================================
  val s2_setIdx = s2_paddr(blockOffBits + idxBits - 1, blockOffBits)
  val s2_ptag   = s2_paddr(31, blockOffBits + idxBits)
  val s2_miss   = s2_valid && s2_cacheable && !s2_hit && !s2_isUncache
 
  // ---- Load Hit: 提取数据 ----
  val s2_cacheLineData = s2_arrayData.ways(s2_hitWay).data
  val s2_wordOff = s2_paddr(blockOffBits - 1, 2)
  val s2_rawWord = Wire(UInt(XLEN.W))
  s2_rawWord := 0.U
  for (w <- 0 until blockBytes / 4) {
    when(s2_wordOff === w.U) {
      s2_rawWord := s2_cacheLineData(w * XLEN + XLEN - 1, w * XLEN)
    }
  }
 
  val s2_byteOff = s2_paddr(1, 0)
  val s2_shiftedData = MuxLookup(s2_byteOff, s2_rawWord, Seq(
    0.U -> s2_rawWord,
    1.U -> Cat(0.U(8.W), s2_rawWord(31, 8)),
    2.U -> Cat(0.U(16.W), s2_rawWord(31, 16)),
    3.U -> Cat(0.U(24.W), s2_rawWord(31, 24))
  ))
 
  // Pipeline load hit response
  val pipeLoadHitValid = s2_valid && s2_isLoad && s2_hit && !s2_flush
  val pipeLoadResp = Wire(Decoupled(new Bundle {
    val lqIdx = UInt(log2Ceil(LqSize).W)
    val data  = UInt(XLEN.W)
  }))
  pipeLoadResp.valid     := pipeLoadHitValid
  pipeLoadResp.bits.lqIdx := s2_lqIdx
  pipeLoadResp.bits.data  := s2_shiftedData
 
  // ---- Store Hit: 合并数据写入 ----
  val pipeStoreHitValid = s2_valid && !s2_isLoad && s2_hit && !s2_isUncache
  val s2_mergedWords = Wire(Vec(blockBytes / 4, UInt(XLEN.W)))
  for (w <- 0 until blockBytes / 4) {
    s2_mergedWords(w) := s2_cacheLineData(w * XLEN + XLEN - 1, w * XLEN)
  }
  for (w <- 0 until blockBytes / 4) {
    when(s2_wordOff === w.U) {
      s2_mergedWords(w) := s2_storeData
    }
  }
  val s2_mergedLine = Cat(s2_mergedWords.reverse)
 
  // Pipeline store ack
  val pipeStoreAck = Wire(Decoupled(new Bundle {
    val sqIdx = UInt(log2Ceil(SqSize).W)
  }))
  pipeStoreAck.valid      := pipeStoreHitValid
  pipeStoreAck.bits.sqIdx := s2_sqIdx
 
  // ---- Miss / Uncache: 发往 MSHR ----
  val s2_needMshr = s2_valid && (s2_miss || s2_isUncache)
  val mshrReq = Wire(new MshrRequest)
  mshrReq.paddr       := s2_paddr
  mshrReq.lqIdx       := s2_lqIdx
  mshrReq.sqIdx       := s2_sqIdx
  mshrReq.robIdx      := s2_robIdx
  mshrReq.lsuOp       := s2_lsuOp
  mshrReq.storeData   := s2_storeData
  mshrReq.victimWay   := s2_victimWay
  mshrReq.victimDirty := s2_victimDirty && s2_miss // 只在 cacheable miss 时需要写回
  mshrReq.victimTag   := s2_victimTag
  mshrReq.victimData  := s2_victimData
  mshrReq.cacheable   := s2_cacheable
 
  mshrReq.reqType := MuxLookup(Cat(s2_isUncache, s2_isLoad), MshrReqType.refillLoad, Seq(
    Cat(true.B, true.B)  -> MshrReqType.uncacheRead,
    Cat(true.B, false.B) -> MshrReqType.uncacheWrite,
    Cat(false.B, true.B) -> MshrReqType.refillLoad,
    Cat(false.B, false.B) -> MshrReqType.refillStore
  ))
 
  mshr.io.req.valid := s2_needMshr && !s2_flush
  mshr.io.req.bits  := mshrReq
  mshr.io.redirect  := io.redirect
 
  // ---- Miss 时标记 victim 无效 ----
  array.io.metaWrite.valid     := s2_miss && !s2_isUncache && mshr.io.req.ready
  array.io.metaWrite.idx       := s2_setIdx
  array.io.metaWrite.way       := s2_victimWay
  array.io.metaWrite.metaValid := false.B
  array.io.metaWrite.dirty     := false.B
  array.io.metaWrite.tag       := 0.U
 
  // ---- Store Hit 写 Array ----
  array.io.write.valid := pipeStoreHitValid && pipeStoreAck.fire
  array.io.write.idx   := s2_setIdx
  array.io.write.way   := s2_hitWay
  array.io.write.tag   := s2_ptag
  array.io.write.dirty := true.B
  array.io.write.data  := s2_mergedLine
  array.io.write.wen   := true.B
 
  // ---- Replacer Touch（hit 时更新） ----
  replacer.io.touch.valid := (pipeLoadHitValid && pipeLoadResp.fire) || 
                              (pipeStoreHitValid && pipeStoreAck.fire)
  replacer.io.touch.idx   := s2_setIdx
  replacer.io.touch.way   := Mux(pipeLoadHitValid, s2_hitWay, s2_hitWay)
 
  replacer.io.flush.valid := false.B
  replacer.io.flush.idx   := 0.U
 
  // ---- s2 ready 判断 ----
  val s2_loadHitDone  = pipeLoadHitValid && pipeLoadResp.fire
  val s2_storeHitDone = pipeStoreHitValid && pipeStoreAck.fire
  val s2_mshrAccepted = s2_needMshr && mshr.io.req.fire
  val s2_flushed      = s2_flush
 
  s2_ready := s2_loadHitDone || s2_storeHitDone || s2_mshrAccepted || s2_flushed || !s2_valid
 
  when(s2_flush) {
    s2_valid := false.B
  }
 
  // ================================================================
  //  响应仲裁：Pipeline hit vs MSHR refill
  // ================================================================
  // Load Response
//  val arbLoadResp = Arbiter(pipeLoadResp, mshr.io.loadResp)
//  io.loadResp <> arbLoadResp
// 
//  // Store Ack
//  val arbStoreAck = Arbiter(pipeStoreAck, mshr.io.storeAck)
//  io.storeAck <> arbStoreAck

  // ── Load Response 仲裁：Pipeline hit 优先，MSHR 其次 ──
  // ── Load Response 仲裁 ──
  io.loadResp.valid           := pipeLoadResp.valid || mshr.io.loadResp.valid
  io.loadResp.bits.lqIdx      := Mux(pipeLoadResp.valid, pipeLoadResp.bits.lqIdx, mshr.io.loadResp.bits.lqIdx)
  io.loadResp.bits.data       := Mux(pipeLoadResp.valid, pipeLoadResp.bits.data, mshr.io.loadResp.bits.data)
  pipeLoadResp.ready          := io.loadResp.ready
  mshr.io.loadResp.ready      := io.loadResp.ready && !pipeLoadResp.valid
   
  // ── Store Ack 仲裁 ──
  io.storeAck.valid           := pipeStoreAck.valid || mshr.io.storeAck.valid
  io.storeAck.bits.sqIdx      := Mux(pipeStoreAck.valid, pipeStoreAck.bits.sqIdx, mshr.io.storeAck.bits.sqIdx)
  pipeStoreAck.ready          := io.storeAck.ready
  mshr.io.storeAck.ready      := io.storeAck.ready && !pipeStoreAck.valid
 
  // ================================================================
  //  MSHR → Array 写入
  // ================================================================
  // MSHR 写 array 时，需要与 pipeline store hit 仲裁
  // MSHR 优先
  val mshrArrayWrite = mshr.io.arrayWrite
  when(mshrArrayWrite.valid) {
    array.io.write.valid := true.B
    array.io.write.idx   := mshrArrayWrite.idx
    array.io.write.way   := mshrArrayWrite.way
    array.io.write.tag   := mshrArrayWrite.tag
    array.io.write.dirty := mshrArrayWrite.dirty
    array.io.write.data  := mshrArrayWrite.data
    array.io.write.wen   := mshrArrayWrite.wen
  }
 
  // MSHR Replacer Touch
  when(mshr.io.replacerTouch.valid) {
    replacer.io.touch.valid := true.B
    replacer.io.touch.idx   := mshr.io.replacerTouch.idx
    replacer.io.touch.way   := mshr.io.replacerTouch.way
  }
 
  // ================================================================
  //  AXI 连接
  // ================================================================
  io.axi <> mshr.io.axi
 
  // ================================================================
  //  调试
  // ================================================================
  dontTouch(s2_valid)
  dontTouch(s2_hit)
  dontTouch(s2_miss)
}