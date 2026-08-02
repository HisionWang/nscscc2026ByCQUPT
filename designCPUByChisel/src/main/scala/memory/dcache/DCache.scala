package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._
import nscscc.frontend.icache.CacheReplacer
 
import nscscc.backend.execute._
class DCache(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    val loadReq  = Flipped(Decoupled(new Bundle {
      val lqIdx     = UInt(log2Ceil(LqSize).W)
      val robIdx    = new RobPtr(RobSize)
      val paddr     = UInt(XLEN.W)
      val cacheable = Bool()
      val lsuOp     = UInt(LsuOp.width.W)
    }))
    val loadResp = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val storeReq = Flipped(Decoupled(new Bundle {
      val paddr     = UInt(XLEN.W)
      val data      = UInt(XLEN.W)
      val lsuOp     = UInt(LsuOp.width.W)
      val cacheable = Bool()
      val sqIdx     = UInt(log2Ceil(SqSize).W)
    }))
    val storeAck = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
    val axi      = new AXI3MasterIO

    val redirectInfo    = Flipped ( ValidIO( new redirectInfoToModule )   ) // 误预测重定向

  })
 
  // ================================================================
  //  子模块
  // ================================================================
  val array    = Module(new DCacheArray)
  val replacer = Module(new CacheReplacer)
  val mshr     = Module(new DCacheMSHRFile)
 
  // ================================================================
  //  状态机
  // ================================================================
    //   0----------1--------------2--------------3--------------4---------5-----------6------------7
  val s_idle :: s_tag_read :: s_load_resp :: s_store_write :: s_miss :: s_refill :: s_uc_load :: s_uc_store :: Nil = Enum(8)
  val state = RegInit(s_idle)
 
  // ================================================================
  //  请求锁存寄存器
  // ================================================================
  val curPaddr     = RegInit(0.U(XLEN.W))
  val curLqIdx     = RegInit(0.U(log2Ceil(LqSize).W))
  val curSqIdx     = RegInit(0.U(log2Ceil(SqSize).W))
  val curRobIdx    = RegInit(0.U.asTypeOf(new RobPtr(RobSize)))
  val curLsuOp     = RegInit(0.U(LsuOp.width.W))
  val curStoreData = RegInit(0.U(XLEN.W))
  val curIsLoad    = RegInit(false.B)
  val curIsStore   = RegInit(false.B)
  val curCacheable = RegInit(false.B)
  val curIsReplay  = RegInit(false.B)
  val curLsIdx     = RegInit(0.U(log2Ceil(4).W))
  val curArrayData = RegInit(0.U.asTypeOf(new DCacheArrayReadData))
  val curHitWay    = RegInit(0.U(wayBits.W))
  val curVictimWay = RegInit(0.U(wayBits.W))
  val curUcData    = RegInit(0.U(XLEN.W))


  // 新增：pending miss 专用寄存器
  val pendPaddr     = RegInit(0.U(XLEN.W))
  val pendLqIdx     = RegInit(0.U(log2Ceil(LqSize).W))
  val pendSqIdx     = RegInit(0.U(log2Ceil(SqSize).W))
  val pendRobIdx    = RegInit(0.U.asTypeOf(new RobPtr(RobSize)))
  val pendLsuOp     = RegInit(0.U(LsuOp.width.W))
  val pendStoreData = RegInit(0.U(XLEN.W))
  val pendIsLoad    = RegInit(false.B)
  val pendIsStore   = RegInit(false.B)
  val pendCacheable = RegInit(false.B)

 
  // pendingMiss：MSHR 无法接受时暂存请求，回 s_idle 让 MSHR 推进
  val pendingMiss = RegInit(false.B)
 
  // Refill 锁存
  val refillIdx    = RegInit(0.U(idxBits.W))
  val refillWay    = RegInit(0.U(wayBits.W))
  val refillTag    = RegInit(0.U(tagBits.W))
  val refillData   = RegInit(0.U((blockBytes * 8).W))
  val refillPrimId = RegInit(0.U(1.W))
 
  // ================================================================
  //  反饥饿仲裁
  // ================================================================
  val storeWaitCnt  = RegInit(0.U(8.W))
  val storeStarving = storeWaitCnt >= 8.U
  when(io.storeReq.valid && !io.loadReq.valid) {
    storeWaitCnt := 0.U
  }.elsewhen(io.storeReq.valid && io.loadReq.valid && !storeStarving) {
    storeWaitCnt := storeWaitCnt + 1.U
  }.otherwise {
    storeWaitCnt := 0.U
  }
  val loadSelected  = io.loadReq.valid && (!io.storeReq.valid || !storeStarving)
  val storeSelected = io.storeReq.valid && (!io.loadReq.valid || storeStarving)
  val lsuHasReq     = io.loadReq.valid || io.storeReq.valid
 
  // ================================================================
  //  Store 阻塞：MSHR 中有 store 时，禁止新 LSU 请求进入
  // ================================================================
  val storeBlocked = mshr.io.hasStore
 
  // ================================================================
  //  Flush 检测
  // ================================================================
  def shouldFlush(robIdx: RobPtr): Bool =
     robIdx.isAfter(io.redirectInfo.bits.robIdx) && io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
 
  // ================================================================
  //  Tag 比较与数据提取（纯组合逻辑，直接用 Array 读出数据）
  // ================================================================
  def doTagCompare(data: DCacheArrayReadData, paddr: UInt, cacheable: Bool) = {
    val ptag = paddr(31, blockOffBits + idxBits)
    val hits = Wire(Vec(nWays, Bool()))
    for (i <- 0 until nWays)
      hits(i) := data.ways(i).valid && data.ways(i).tag === ptag
    val hit    = hits.asUInt.orR && cacheable
    val hitWay = OHToUInt(hits)
    (hit, hitWay)
  }
 
def extractLoadData(data: DCacheArrayReadData, hitWay: UInt, paddr: UInt, lsuOp: UInt) = {
  val lineData = data.ways(hitWay).data
  val wordOff  = paddr(blockOffBits - 1, 2)
  val byteOff  = paddr(1, 0)
 
  // 1. 从 cache line 中选出目标字
  val rawWord = Wire(UInt(XLEN.W))
  rawWord := 0.U
  for (w <- 0 until blockBytes / 4)
    when(wordOff === w.U) { rawWord := lineData(w * XLEN + XLEN - 1, w * XLEN) }
 
  // 2. 从字中选出目标字节/半字
  val byteData = Wire(UInt(8.W))
  byteData := 0.U
  switch(byteOff) {
    is(0.U) { byteData := rawWord(7, 0) }
    is(1.U) { byteData := rawWord(15, 8) }
    is(2.U) { byteData := rawWord(23, 16) }
    is(3.U) { byteData := rawWord(31, 24) }
  }
 
  val halfData = Wire(UInt(16.W))
  halfData := 0.U
  switch( byteOff(1).asUInt ) {
    is(0.U) { halfData := rawWord(15, 0) }
    is(1.U) { halfData := rawWord(31, 16) }
  }
 
  // 3. 按 lsuOp 做符号/零扩展
  MuxLookup(lsuOp, rawWord, Seq(
    LsuOp.ldw  -> rawWord,
    LsuOp.ldh  -> Cat(Fill(16, halfData(15)), halfData),
    LsuOp.ldhu -> Cat(0.U(16.W), halfData),
    LsuOp.ldb  -> Cat(Fill(24, byteData(7)), byteData),
    LsuOp.ldbu -> Cat(0.U(24.W), byteData)
  ))

}


def extractUncacheLoadData(rawWord: UInt, paddr: UInt, lsuOp: UInt) = {
  val byteOff  = paddr(1, 0)
 
  val byteData = MuxLookup(byteOff, rawWord(7, 0), Seq(
    0.U -> rawWord(7, 0),
    1.U -> rawWord(15, 8),
    2.U -> rawWord(23, 16),
    3.U -> rawWord(31, 24)
  ))
 
  val halfData = Mux(byteOff(1), rawWord(31, 16), rawWord(15, 0))
 
  MuxLookup(lsuOp, rawWord, Seq(
    LsuOp.ldw  -> rawWord,
    LsuOp.ldh  -> Cat(Fill(16, halfData(15)), halfData),
    LsuOp.ldhu -> Cat(0.U(16.W), halfData),
    LsuOp.ldb  -> Cat(Fill(24, byteData(7)), byteData),
    LsuOp.ldbu -> Cat(0.U(24.W), byteData)
  ))
}


def mergeStoreLine(data: DCacheArrayReadData, hitWay: UInt,
                   paddr: UInt, storeData: UInt, lsuOp: UInt) = {
  val lineData = data.ways(hitWay).data
  val wordOff  = paddr(blockOffBits - 1, 2)
  val byteOff  = paddr(1, 0)
 
  // 1. 把所有字原样复制
  val merged = Wire(Vec(blockBytes / 4, UInt(XLEN.W)))
  for (w <- 0 until blockBytes / 4)
    merged(w) := lineData(w * XLEN + XLEN - 1, w * XLEN)
 
  // 2. 计算目标字应该写入的内容
  val targetWord = Wire(UInt(XLEN.W))
  targetWord := 0.U
  for (w <- 0 until blockBytes / 4)
      when(wordOff === w.U) { targetWord := lineData(w * XLEN + XLEN - 1, w * XLEN) }
 
  // 3. 根据 lsuOp 和 byteOff 构造字节使能，合并写入
  val newWord = Wire(UInt(XLEN.W))
 
  // 字节使能：4 bit，每 bit 对应 targetWord 的一个字节
  val byteEnable = MuxLookup(lsuOp, 0xF.U(4.W), Seq(
    LsuOp.stb -> UIntToOH(byteOff, 4),
    LsuOp.sth -> Mux(byteOff(1),
                 Cat(Fill(2, false.B), Fill(2, true.B)),  // byteOff=2,3 → byte2,3
                 Cat(Fill(2, false.B), Fill(2, true.B))),  // byteOff=0,1 → byte0,1
    LsuOp.stw -> 0xF.U(4.W)
  ))
 
  // 实际上 sb/sh 的 byteEnable 更直观地写：
  // sb: 只有 byteOff 对应的那一个字节
  // sh: byteOff(1) 决定高低半字，低半字或高半字
  // sw: 全部 4 字节
 
  val sbEnable = UIntToOH(byteOff, 4)  // 1-hot，哪一个是目标字节
  val shEnable = Mux(byteOff(1),
                     Cat(true.B, true.B, false.B, false.B),  // byte2,3
                     Cat(false.B, false.B, true.B, true.B))  // byte0,1
  val swEnable = Cat(true.B, true.B, true.B, true.B)
 
  val finalEnable = MuxLookup(lsuOp, swEnable, Seq(
    LsuOp.stb -> sbEnable,
    LsuOp.sth -> shEnable,
    LsuOp.stw -> swEnable
  ))
 
  // 4. 构造写入数据（storeData 低位有效，按 byteOff 移位到对应位置）
  val shiftedStoreData = MuxLookup(lsuOp, storeData, Seq(
    LsuOp.stb -> (storeData(7, 0) << (byteOff * 8.U)),
    LsuOp.sth -> (storeData(15, 0) << (Cat(byteOff(1), 0.U(1.W)) * 8.U)),
    LsuOp.stw -> storeData
  ))
 
  // 5. 按字节使能合并
  newWord := Cat(
    Mux(finalEnable(3), shiftedStoreData(31, 24), targetWord(31, 24)),
    Mux(finalEnable(2), shiftedStoreData(23, 16), targetWord(23, 16)),
    Mux(finalEnable(1), shiftedStoreData(15, 8),  targetWord(15, 8)),
    Mux(finalEnable(0), shiftedStoreData(7, 0),   targetWord(7, 0))
  )
 
  // 6. 替换目标字
  for (w <- 0 until blockBytes / 4)
    when(wordOff === w.U) { merged(w) := newWord }
 
  Cat(merged.reverse)
}

 
  // ================================================================
  //  s_idle 决策：优先级编码
  // ================================================================
  val idle_doRefill   = mshr.io.refillWriteReq.valid
  val idle_doUcLoad   = !idle_doRefill  && mshr.io.lsReady && mshr.io.lsIsUncache && mshr.io.lsIsLoad
  val idle_doUcStore  = !idle_doRefill  && !idle_doUcLoad && mshr.io.lsReady && mshr.io.lsIsUncache && mshr.io.lsIsStore
  val idle_doReplay   = !idle_doRefill  && !idle_doUcLoad && !idle_doUcStore && mshr.io.lsReady && !mshr.io.lsIsUncache
  val idle_doPending  = !idle_doRefill  && !idle_doUcLoad && !idle_doUcStore && !idle_doReplay && pendingMiss
  val idle_doLsu      = !idle_doRefill  && !idle_doUcLoad && !idle_doUcStore && !idle_doReplay && !idle_doPending &&
                        lsuHasReq && !storeBlocked
 
  // pendingMiss 重试时如果被 redirect 了，直接丢弃
  val pendingFlushed = pendingMiss && shouldFlush(pendRobIdx) && pendIsLoad && !pendIsStore
 
  // LSU 请求信息（组合信号）
  val lsuPaddr     = Mux(loadSelected, io.loadReq.bits.paddr, io.storeReq.bits.paddr)
  val lsuSetIdx    = lsuPaddr(blockOffBits + idxBits - 1, blockOffBits)
  val lsuIsUncache = Mux(loadSelected, !io.loadReq.bits.cacheable, !io.storeReq.bits.cacheable)
 
  // ================================================================
  //  s_tag_read 时的 tag 比较结果（直接用 array.io.read.resp）
  // ================================================================
  val (s1Hit, s1HitWay) = doTagCompare(array.io.read.resp, curPaddr, curCacheable)
  val s1VictimWay = replacer.io.victim.resp
 
  // ================================================================
  //  ============ 各信号合并赋值 ============
  // ================================================================
 
  // ---------- MSHR 连接 ----------
  mshr.io.redirectInfo := io.redirectInfo
  mshr.io.axi <> io.axi
 
  // probeBlockAddr：始终从寄存器驱动，无组合环
  mshr.io.probeBlockAddr := curPaddr(31, blockOffBits)
 
  // missReq：bits 始终从寄存器驱动（断环），valid 仅 s_miss
  mshr.io.missReq.valid       := state === s_miss && !shouldFlush(curRobIdx) 
  mshr.io.missReq.bits.paddr       := curPaddr
  mshr.io.missReq.bits.lqIdx       := curLqIdx
  mshr.io.missReq.bits.sqIdx       := curSqIdx
  mshr.io.missReq.bits.robIdx      := curRobIdx
  mshr.io.missReq.bits.lsuOp       := curLsuOp
  mshr.io.missReq.bits.storeData   := curStoreData
  mshr.io.missReq.bits.isLoad      := curIsLoad
  mshr.io.missReq.bits.isStore     := curIsStore
  mshr.io.missReq.bits.cacheable   := curCacheable
  mshr.io.missReq.bits.victimWay   := curVictimWay
  mshr.io.missReq.bits.victimDirty := curCacheable && curArrayData.ways(curVictimWay).dirty && curArrayData.ways(curVictimWay).valid
  mshr.io.missReq.bits.victimTag   := Mux(curCacheable, curArrayData.ways(curVictimWay).tag, 0.U)
  mshr.io.missReq.bits.victimData  := Mux(curCacheable, curArrayData.ways(curVictimWay).data, 0.U)
 
  // refillWriteAck：仅 s_refill 时有效
  mshr.io.refillWriteAck.valid := state === s_refill
  mshr.io.refillWriteAck.bits  := refillPrimId
 
  // lsAck：load_resp/store_write/uc_load/uc_store 完成 fire 时
  mshr.io.lsAck.valid := curIsReplay && ((state === s_load_resp  && io.loadResp.fire)  ||
                         (state === s_store_write && io.storeAck.fire)  ||
                         (state === s_uc_load     && io.loadResp.fire)  ||
                         (state === s_uc_store    && io.storeAck.fire))
  mshr.io.lsAck.bits  := curLsIdx
 
  // ---------- Array 读 ----------
  // s_idle → s_tag_read 时发起读，或 s_idle → s_replay（走 s_tag_read 复用）
  //array.io.read.valid := (state === s_idle && (idle_doPending && curCacheable ||
  //                       idle_doLsu && !lsuIsUncache || idle_doReplay))
  //array.io.read.idx   := Mux(idle_doReplay, mshr.io.lsPaddr(blockOffBits + idxBits - 1, blockOffBits),
  //                      Mux(idle_doPending, curPaddr(blockOffBits + idxBits - 1, blockOffBits), lsuSetIdx))
 array.io.read.valid := (state === s_idle && (idle_doPending && pendCacheable ||
                         idle_doLsu && !lsuIsUncache || idle_doReplay))
  array.io.read.idx   := Mux(idle_doReplay, mshr.io.lsPaddr(blockOffBits + idxBits - 1, blockOffBits),
                        Mux(idle_doPending, pendPaddr(blockOffBits + idxBits - 1, blockOffBits), lsuSetIdx))
  // ---------- Array 写 ----------
  // 条件：s_store_write（store hit 写合并数据）或 s_refill（MSHR 重填）
  val storeWriteActive = state === s_store_write && io.storeAck.fire
  val refillWriteActive = state === s_refill
 
  array.io.write.valid := storeWriteActive || refillWriteActive
  array.io.write.idx   := Mux(refillWriteActive, refillIdx, curPaddr(blockOffBits + idxBits - 1, blockOffBits))
  array.io.write.way   := Mux(refillWriteActive, refillWay, curHitWay)
  array.io.write.tag   := Mux(refillWriteActive, refillTag, curPaddr(31, blockOffBits + idxBits))
  array.io.write.dirty := Mux(refillWriteActive, false.B, true.B)
  array.io.write.data  := Mux(refillWriteActive, refillData,
                          mergeStoreLine(curArrayData, curHitWay, curPaddr, curStoreData, curLsuOp))
  array.io.write.wen   := true.B
 
  // ---------- Meta 写 ----------
  // 仅 s_miss 且首次 miss 且 cacheable 且 MSHR 接受时无效化 victim
  array.io.metaWrite.valid     := state === s_miss && mshr.io.isFirstMiss && curCacheable && mshr.io.missReq.fire
  array.io.metaWrite.idx       := curPaddr(blockOffBits + idxBits - 1, blockOffBits)
  array.io.metaWrite.way       := curVictimWay
  array.io.metaWrite.metaValid := false.B
  array.io.metaWrite.dirty     := false.B
  array.io.metaWrite.tag       := 0.U
 
  // ---------- Replacer ----------
  replacer.io.victim.req := array.io.read.valid && !idle_doReplay
  replacer.io.victim.idx := array.io.read.idx
 
  replacer.io.touch.valid := (state === s_load_resp  && io.loadResp.fire) ||
                             (state === s_store_write && io.storeAck.fire) ||
                             refillWriteActive
  replacer.io.touch.idx   := Mux(refillWriteActive, refillIdx,
                            curPaddr(blockOffBits + idxBits - 1, blockOffBits))
  replacer.io.touch.way   := Mux(refillWriteActive, refillWay, curHitWay)
 
  replacer.io.flush.valid := false.B
  replacer.io.flush.idx   := 0.U
 
  // ---------- LSU 接口 ----------
  // loadReq.ready：s_miss MSHR 接受 且 是 load 且 不是 replay
//  io.loadReq.ready  := state === s_idle && loadSelected  //state === s_miss && curIsLoad && !curIsReplay && mshr.io.missReq.fire
//  // storeReq.ready：s_miss MSHR 接受 且 是 store 且 不是 replay
//  io.storeReq.ready := state === s_idle && storeSelected  //( state === s_miss && curIsStore && !curIsReplay && mshr.io.missReq.fire )
  
  // loadReq.ready：load 命中返回时 / load miss MSHR 接受时
//io.loadReq.ready  := (state === s_load_resp && !curIsReplay) ||
//                     (state === s_miss && curIsLoad && !curIsReplay && mshr.io.missReq.fire)
// 
//// storeReq.ready：store 命中写完时 / store miss MSHR 接受时
//io.storeReq.ready := (state === s_store_write && !curIsReplay) ||
//                     (state === s_miss && curIsStore && !curIsReplay && mshr.io.missReq.fire)

  io.loadReq.ready  := state === s_idle && idle_doLsu && loadSelected
  io.storeReq.ready := state === s_idle && idle_doLsu && storeSelected


  // loadResp：s_load_resp 或 s_uc_load
  io.loadResp.valid := (state === s_load_resp || state === s_uc_load)
  io.loadResp.bits.lqIdx := curLqIdx
  io.loadResp.bits.data  := Mux(state === s_uc_load, 

    extractUncacheLoadData(curUcData, curPaddr, curLsuOp),
    extractLoadData(curArrayData, curHitWay, curPaddr, curLsuOp))
 
  // storeAck：s_store_write 或 s_uc_store
  io.storeAck.valid := (state === s_store_write || state === s_uc_store)
  io.storeAck.bits.sqIdx := curSqIdx
 
  // ================================================================
  //  ============ 状态转移 ============
  // ================================================================
  switch(state) {
    is(s_idle) {
      when(pendingFlushed) {
        pendingMiss := false.B
      }.elsewhen(idle_doRefill) {
        refillIdx    := mshr.io.refillWriteReq.bits.idx
        refillWay    := mshr.io.refillWriteReq.bits.way
        refillTag    := mshr.io.refillWriteReq.bits.tag
        refillData   := mshr.io.refillWriteReq.bits.data
        refillPrimId := mshr.io.refillWritePrimId
        state        := s_refill
      }.elsewhen(idle_doUcLoad) {
        curLqIdx    := mshr.io.lsLqIdx
        curLsIdx    := mshr.io.lsIdx
        curPaddr    := mshr.io.lsPaddr          // ← 补
        curLsuOp    := mshr.io.lsLsuOp   
        curIsReplay := true.B
        curUcData   := mshr.io.lsUncacheData
        state       := s_uc_load

      }.elsewhen(idle_doUcStore) {
        curSqIdx    := mshr.io.lsSqIdx
        curLsIdx    := mshr.io.lsIdx
        curIsReplay := true.B
        state       := s_uc_store
      }.elsewhen(idle_doReplay) {
        curPaddr     := mshr.io.lsPaddr
        curLqIdx     := mshr.io.lsLqIdx
        curSqIdx     := mshr.io.lsSqIdx
        curLsuOp     := mshr.io.lsLsuOp
        curStoreData := mshr.io.lsStoreData
        curIsLoad    := mshr.io.lsIsLoad
        curIsStore   := mshr.io.lsIsStore
        curCacheable := true.B
        curIsReplay  := true.B
        curLsIdx     := mshr.io.lsIdx
        state        := s_tag_read
      }.elsewhen(idle_doPending) {

        state := s_tag_read

        curPaddr     := pendPaddr
        curLqIdx     := pendLqIdx
        curSqIdx     := pendSqIdx
        curRobIdx    := pendRobIdx
        curLsuOp     := pendLsuOp
        curStoreData := pendStoreData
        curIsLoad    := pendIsLoad
        curIsStore   := pendIsStore
        curCacheable := pendCacheable
        curIsReplay  := false.B

      }.elsewhen(idle_doLsu) {
        // 接受新 LSU 请求
        curPaddr     := lsuPaddr
        curLqIdx     := Mux(loadSelected, io.loadReq.bits.lqIdx, 0.U)
        curSqIdx     := Mux(storeSelected, io.storeReq.bits.sqIdx, 0.U)
        curRobIdx    := Mux(loadSelected, io.loadReq.bits.robIdx, 0.U.asTypeOf(new RobPtr(RobSize)))
        curLsuOp     := Mux(loadSelected, io.loadReq.bits.lsuOp, io.storeReq.bits.lsuOp)
        curStoreData := Mux(storeSelected, io.storeReq.bits.data, 0.U)
        curIsLoad    := loadSelected
        curIsStore   := storeSelected
        curCacheable := !lsuIsUncache
        curIsReplay  := false.B
        pendingMiss  := false.B
        curLsIdx     := mshr.io.lsIdx
        state        := Mux(lsuIsUncache, s_miss, s_tag_read)
      }
    }
 
    is(s_tag_read) {
      // Array 数据在本周期可用（readLatency=1）
      curArrayData := array.io.read.resp
      curVictimWay := s1VictimWay
      when(shouldFlush(curRobIdx)  && curIsLoad && !curIsStore) {
        state := s_idle
        //如果这个load曾经是miss了的，也就是已经把保存在了pendingmiss中的话
        when(pendIsLoad && pendLqIdx === curLqIdx){
          pendingMiss  := false.B
        }
      }.elsewhen(!curCacheable) {
        state := s_miss
      }.elsewhen(s1Hit && curIsLoad) {
        curHitWay := s1HitWay
        state     := s_load_resp
      }.elsewhen(s1Hit && curIsStore ){
        curHitWay := s1HitWay
        state     := s_store_write
      }.otherwise {
        state := s_miss
      }
    }
 
    is(s_load_resp) {
      when(pendLqIdx === curLqIdx && pendIsLoad){
        pendingMiss     := false.B
      }
      when(io.loadResp.fire) { state := s_idle }
    }
    is(s_store_write) {
      when(pendSqIdx === curSqIdx && pendIsStore){
        pendingMiss     := false.B
      }
      when(io.storeAck.fire) { state := s_idle }
    }
 
    is(s_miss) {
      when(shouldFlush(curRobIdx) && curIsLoad && !curIsStore) {
        state := s_idle
        when(pendIsLoad && pendLqIdx === curLqIdx){
          pendingMiss  := false.B
        }
      }.elsewhen(mshr.io.missReq.fire) {
        pendingMiss := false.B
        state       := s_idle
      }.otherwise {
        pendingMiss     := true.B
        pendPaddr       := curPaddr
        pendLqIdx       := curLqIdx
        pendSqIdx       := curSqIdx
        pendRobIdx      := curRobIdx
        pendLsuOp       := curLsuOp
        pendStoreData   := curStoreData
        pendIsLoad      := curIsLoad
        pendIsStore     := curIsStore
        pendCacheable   := curCacheable

        state           := s_idle
      }
    }
 
    is(s_refill) {
      state := s_idle
    }
 
    is(s_uc_load) {
      when(pendLqIdx === curLqIdx && pendIsLoad){
        pendingMiss     := false.B
      }

      when(io.loadResp.fire) { state := s_idle }
    }
 
    is(s_uc_store) {
      when(pendSqIdx === curSqIdx && pendIsStore){
        pendingMiss     := false.B
      }

      when(io.storeAck.fire) { state := s_idle }
    }
  }
 
  // ================================================================
  //  调试
  // ================================================================
  diffDontTouch(state)
  diffDontTouch(pendingMiss)
}
