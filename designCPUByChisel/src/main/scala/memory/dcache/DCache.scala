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
 
  // 反饥饿
  val enableAntiStarvation = true
  val storeStarvationThreshold = 8
 
  val io = IO(new Bundle {
    val loadReq  = Flipped(Decoupled(new Bundle {
      val lqIdx    = UInt(log2Ceil(LqSize).W)
      val robIdx   = new RobPtr(RobSize)
      val paddr    = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp    = UInt(LsuOp.width.W)
    }))
    val loadResp = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val storeReq = Flipped(Decoupled(new Bundle {
      val paddr = UInt(XLEN.W)
      val data  = UInt(XLEN.W)
      val lsuOp = UInt(LsuOp.width.W)
      val cacheable = Bool()
      val sqIdx = UInt(log2Ceil(SqSize).W)
    }))
    val storeAck = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
    val axi      = new AXI3MasterIO
    val redirect = Flipped(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  // ================================================================
  //  子模块
  // ================================================================
  val array    = Module(new DCacheArray)
  val replacer = Module(new ICacheReplacer)
  val mshr     = Module(new DCacheMSHRFile)
 
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
 
  val loadSelected  = io.loadReq.valid && (!io.storeReq.valid || !storeStarving)
  val storeSelected = io.storeReq.valid && (!io.loadReq.valid || storeStarving)
 
  // ================================================================
  //  流水线寄存器
  // ================================================================
  // S0 → S1
  val s1_valid     = RegInit(false.B)
  val s1_paddr     = Reg(UInt(XLEN.W))
  val s1_isLoad    = Reg(Bool())
  val s1_isReplay  = Reg(Bool())   // 是否为 MSHR replay
  val s1_lqIdx     = Reg(UInt(log2Ceil(LqSize).W))
  val s1_sqIdx     = Reg(UInt(log2Ceil(SqSize).W))
  val s1_robIdx    = Reg(new RobPtr(RobSize))
  val s1_lsuOp     = Reg(UInt(LsuOp.width.W))
  val s1_cacheable = Reg(Bool())
  val s1_storeData = Reg(UInt(XLEN.W))
  val s1_arrayData = Reg(new DCacheArrayReadData)
 
  // S1 → S2
  val s2_valid      = RegInit(false.B)
  val s2_paddr      = Reg(UInt(XLEN.W))
  val s2_isLoad     = Reg(Bool())
  val s2_isReplay   = Reg(Bool())
  val s2_lqIdx      = Reg(UInt(log2Ceil(LqSize).W))
  val s2_sqIdx      = Reg(UInt(log2Ceil(SqSize).W))
  val s2_robIdx     = Reg(new RobPtr(RobSize))
  val s2_lsuOp      = Reg(UInt(LsuOp.width.W))
  val s2_cacheable  = Reg(Bool())
  val s2_storeData  = Reg(UInt(XLEN.W))
  val s2_hit        = Reg(Bool())
  val s2_hitWay     = Reg(UInt(wayBits.W))
  val s2_victimWay  = Reg(UInt(wayBits.W))
  val s2_arrayData  = Reg(new DCacheArrayReadData)
  val s2_isUncache  = Reg(Bool())
  val s2_mshrBlockMatch     = Reg(Bool())
  val s2_mshrVictimConflict = Reg(Bool())
 
  // ================================================================
  //  Flush 逻辑
  // ================================================================
  def shouldFlush(robIdx: RobPtr): Bool = {
    io.redirect.valid && robIdx.isAfter(io.redirect.bits.robIdx)
  }
 
  val s1_flush = s1_valid && !s1_isReplay && shouldFlush(s1_robIdx)
  val s2_flush = s2_valid && !s2_isReplay && shouldFlush(s2_robIdx)
 
  // ================================================================
  //  S0：接收请求 + 读 Array
  // ================================================================
  val s2_ready = Wire(Bool())
  val s1_ready = Wire(Bool())
  val s0_ready = Wire(Bool())
 
  s0_ready := !s1_valid || s1_ready
 
  // MSHR 访问 Array 时阻塞 S0
  val s0_blocked = mshr.io.mshrAccessing || mshr.io.mshrWriting
 
  // Replay 优先于 LSU
  val s0_replayValid = mshr.io.replay.valid
  val s0_replayFire  = s0_replayValid && s0_ready && !s0_blocked && !s2_flush
  val s0_lsuFire     = !s0_replayValid && (loadSelected || storeSelected) &&
                       s0_ready && !s0_blocked && !s2_flush
 
  io.loadReq.ready  := s0_ready && !s0_blocked && loadSelected && !s0_replayValid && !storeStarving
  io.storeReq.ready := s0_ready && !s0_blocked && storeSelected && !s0_replayValid
  mshr.io.replay.ready := s0_ready && !s0_blocked && !s2_flush && !(loadSelected || storeSelected)
 
  val s0_loadFire  = loadSelected && s0_lsuFire
  val s0_storeFire = storeSelected && s0_lsuFire
  val s0_fire = s0_lsuFire || s0_replayFire
 
  // 读 Array
  val s0_paddr = Mux(s0_replayFire, mshr.io.replay.bits.paddr,
                 Mux(loadSelected, io.loadReq.bits.paddr, io.storeReq.bits.paddr))
  val s0_setIdx = s0_paddr(blockOffBits + idxBits - 1, blockOffBits)
 
  array.io.read.valid := s0_fire
  array.io.read.idx   := s0_setIdx
 
  replacer.io.victim.req := s0_fire && !s0_replayFire
  replacer.io.victim.idx := s0_setIdx
 
  // S0 → S1
  when(s1_flush) {
    s1_valid := false.B
  }.elsewhen(s0_fire) {
    s1_valid     := true.B
    s1_paddr     := s0_paddr
    s1_isLoad    := Mux(s0_replayFire, mshr.io.replay.bits.isLoad, s0_loadFire)
    s1_isReplay  := s0_replayFire
    s1_lqIdx     := Mux(s0_replayFire, mshr.io.replay.bits.lqIdx,
                    Mux(s0_loadFire, io.loadReq.bits.lqIdx, 0.U))
    s1_sqIdx     := Mux(s0_replayFire, mshr.io.replay.bits.sqIdx,
                    Mux(s0_storeFire, io.storeReq.bits.sqIdx, 0.U))
    s1_robIdx    := Mux(s0_replayFire, mshr.io.replay.bits.robIdx,
                    Mux(s0_loadFire, io.loadReq.bits.robIdx, 0.U.asTypeOf(new RobPtr(RobSize))))
    s1_lsuOp     := Mux(s0_replayFire, mshr.io.replay.bits.lsuOp,
                    Mux(s0_loadFire, io.loadReq.bits.lsuOp, io.storeReq.bits.lsuOp))
    s1_cacheable := Mux(s0_replayFire, true.B,  // replay 必定 cacheable
                    Mux(s0_loadFire, io.loadReq.bits.cacheable, io.storeReq.bits.cacheable))
    s1_storeData := Mux(s0_replayFire, mshr.io.replay.bits.storeData,
                    Mux(s0_storeFire, io.storeReq.bits.data, 0.U))
  }.elsewhen(s1_ready) {
    s1_valid := false.B
  }
 
  // ================================================================
  //  S1：Tag 比较 + MSHR 探针
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
 
  // MSHR 探针
  val s1_blockAddr = s1_paddr(31, blockOffBits)
  mshr.io.probeBlockAddr := s1_blockAddr
  mshr.io.probeSetIdx    := s1_setIdx
  mshr.io.probeHitWay    := s1_hitWay
 
  val s1_mshrBlockMatch     = mshr.io.probeBlockMatch
  val s1_mshrVictimConflict = mshr.io.probeVictimConflict
 
  // ★ 关键：Store 即使 hit，若 MSHR 中有更老的 store，也视为 miss
  val s1_storeOrderingBlock = s1_hit && !s1_isLoad &&
    (mshr.io.hasStore || mshr.io.hasStoreEntering)
 
  // 最终 hit 判定
  // - Victim 冲突 → 视为 miss（不管 tag 是否匹配，因为该 way 即将被覆盖）
  // - Store 排序 → 视为 miss
  // - Replay → 必然 hit（数据已 fill）
  val s1_finalHit = Mux(s1_isReplay, true.B,
    s1_hit && !s1_mshrVictimConflict && !s1_storeOrderingBlock && !s1_isUncache)
 
  val s1_victimWay = replacer.io.victim.resp
 
  val s1_canGo = s2_ready
  s1_ready := !s1_valid || s1_canGo
 
  // S1 → S2
  when(s2_flush) {
    s2_valid := false.B
  }.elsewhen(s1_valid && s1_canGo && !s1_flush) {
    s2_valid      := true.B
    s2_paddr      := s1_paddr
    s2_isLoad     := s1_isLoad
    s2_isReplay   := s1_isReplay
    s2_lqIdx      := s1_lqIdx
    s2_sqIdx      := s1_sqIdx
    s2_robIdx     := s1_robIdx
    s2_lsuOp      := s1_lsuOp
    s2_cacheable  := s1_cacheable
    s2_storeData  := s1_storeData
    s2_hit        := s1_finalHit
    s2_hitWay     := Mux(s1_isReplay, OHToUInt(s1_tagHits), s1_hitWay)
    s2_victimWay  := s1_victimWay
    s2_arrayData  := s1_arrayData
    s2_isUncache  := s1_isUncache
    s2_mshrBlockMatch     := s1_mshrBlockMatch
    s2_mshrVictimConflict := s1_mshrVictimConflict
  }.elsewhen(s2_ready) {
    s2_valid := false.B
  }
 
  // ================================================================
  //  S2：执行动作
  // ================================================================
  val s2_setIdx = s2_paddr(blockOffBits + idxBits - 1, blockOffBits)
  val s2_ptag   = s2_paddr(31, blockOffBits + idxBits)
  val s2_miss   = s2_valid && s2_cacheable && !s2_hit && !s2_isUncache
 
  // ---- Load Hit / Replay Hit：提取数据 ----
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
 
  // Pipeline load hit/replay response
  val pipeLoadHitValid = s2_valid && s2_isLoad && s2_hit && !s2_flush
  val pipeLoadResp = Wire(Decoupled(new Bundle {
    val lqIdx = UInt(log2Ceil(LqSize).W)
    val data  = UInt(XLEN.W)
  }))
  pipeLoadResp.valid      := pipeLoadHitValid
  pipeLoadResp.bits.lqIdx := s2_lqIdx
  pipeLoadResp.bits.data  := s2_shiftedData
 
  // ---- Store Hit / Replay Hit：合并写入 ----
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
 
  val pipeStoreAck = Wire(Decoupled(new Bundle {
    val sqIdx = UInt(log2Ceil(SqSize).W)
  }))
  pipeStoreAck.valid      := pipeStoreHitValid
  pipeStoreAck.bits.sqIdx := s2_sqIdx
 
  // ---- Miss / Uncache：发往 MSHR ----
  val s2_needMshr = s2_valid && (s2_miss || s2_isUncache) && !s2_isReplay
  val mshrReq = Wire(new MissReq)
  mshrReq.paddr       := s2_paddr
  mshrReq.lqIdx       := s2_lqIdx
  mshrReq.sqIdx       := s2_sqIdx
  mshrReq.robIdx      := s2_robIdx
  mshrReq.lsuOp       := s2_lsuOp
  mshrReq.storeData   := s2_storeData
  mshrReq.victimWay   := s2_victimWay
  mshrReq.isLoad      := s2_isLoad
  mshrReq.isStore     := !s2_isLoad
  mshrReq.cacheable   := s2_cacheable
 
  mshr.io.req.valid := s2_needMshr && !s2_flush
  mshr.io.req.bits  := mshrReq
  mshr.io.redirect  := io.redirect
 
  // ---- S2 ready 判断 ----
  val s2_loadHitDone  = pipeLoadHitValid && pipeLoadResp.fire
  val s2_storeHitDone = pipeStoreHitValid && pipeStoreAck.fire
  val s2_mshrAccepted = s2_needMshr && mshr.io.req.fire
  val s2_flushed      = s2_flush
 
  s2_ready := s2_loadHitDone || s2_storeHitDone || s2_mshrAccepted || s2_flushed || !s2_valid
 
  when(s2_flush) { s2_valid := false.B }
 
  // ================================================================
  //  响应仲裁：Pipeline hit vs MSHR uncache
  // ================================================================
  // Pipeline hit 优先
  io.loadResp.valid       := pipeLoadResp.valid || mshr.io.uncacheLoadResp.valid
  io.loadResp.bits.lqIdx  := Mux(pipeLoadResp.valid, pipeLoadResp.bits.lqIdx, mshr.io.uncacheLoadResp.bits.lqIdx)
  io.loadResp.bits.data   := Mux(pipeLoadResp.valid, pipeLoadResp.bits.data, mshr.io.uncacheLoadResp.bits.data)
  pipeLoadResp.ready          := io.loadResp.ready
  mshr.io.uncacheLoadResp.ready := io.loadResp.ready && !pipeLoadResp.valid
 
  io.storeAck.valid       := pipeStoreAck.valid || mshr.io.uncacheStoreAck.valid
  io.storeAck.bits.sqIdx  := Mux(pipeStoreAck.valid, pipeStoreAck.bits.sqIdx, mshr.io.uncacheStoreAck.bits.sqIdx)
  pipeStoreAck.ready          := io.storeAck.ready
  mshr.io.uncacheStoreAck.ready := io.storeAck.ready && !pipeStoreAck.valid
 
  // ================================================================
  //  Array 写入仲裁：Pipeline store hit vs MSHR refill/metaWrite
  // ================================================================
  array.io.write.valid := false.B
  array.io.write.idx   := 0.U
  array.io.write.way   := 0.U
  array.io.write.tag   := 0.U
  array.io.write.dirty := 0.U
  array.io.write.data  := 0.U
  array.io.write.wen   := false.B
 
  array.io.metaWrite.valid     := false.B
  array.io.metaWrite.idx       := 0.U
  array.io.metaWrite.way       := 0.U
  array.io.metaWrite.metaValid := false.B
  array.io.metaWrite.dirty     := false.B
  array.io.metaWrite.tag       := 0.U
 
  // 优先级：MSHR metaWrite > MSHR refill write > Pipeline store hit
  when(mshr.io.metaWrite.valid) {
    array.io.metaWrite := mshr.io.metaWrite
  }.elsewhen(mshr.io.arrayWrite.valid) {
    array.io.write := mshr.io.arrayWrite
  }.elsewhen(pipeStoreHitValid && pipeStoreAck.fire) {
    array.io.write.valid := true.B
    array.io.write.idx   := s2_setIdx
    array.io.write.way   := s2_hitWay
    array.io.write.tag   := s2_ptag
    array.io.write.dirty := true.B
    array.io.write.data  := s2_mergedLine
    array.io.write.wen   := true.B
  }
 
  // ================================================================
  //  Replacer 更新
  // ================================================================
  replacer.io.flush.valid := false.B
  replacer.io.flush.idx   := 0.U
 
  when(pipeLoadHitValid && pipeLoadResp.fire) {
    replacer.io.touch.valid := true.B
    replacer.io.touch.idx   := s2_setIdx
    replacer.io.touch.way   := s2_hitWay
  }.elsewhen(pipeStoreHitValid && pipeStoreAck.fire) {
    replacer.io.touch.valid := true.B
    replacer.io.touch.idx   := s2_setIdx
    replacer.io.touch.way   := s2_hitWay
  }.elsewhen(mshr.io.replacerTouch.valid) {
    replacer.io.touch.valid := true.B
    replacer.io.touch.idx   := mshr.io.replacerTouch.bits.idx
    replacer.io.touch.way   := mshr.io.replacerTouch.bits.way
  }.otherwise {
    replacer.io.touch.valid := false.B
    replacer.io.touch.idx   := 0.U
    replacer.io.touch.way   := 0.U
  }
 
  // ================================================================
  //  MSHR Array 读取连接
  // ================================================================
  // 当 MSHR 在 replace_find 时，占用 array read port
  // 同时阻塞流水线 S0（通过 s0_blocked）
  when(mshr.io.arrayReadReq.valid) {
    array.io.read.valid := true.B
    array.io.read.idx   := mshr.io.arrayReadReq.bits
  }
  mshr.io.arrayReadResp      := array.io.read.resp
  mshr.io.arrayReadRespValid := array.io.read.validOut
 
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