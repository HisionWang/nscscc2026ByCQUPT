package nscscc.mem.L2cache

import chisel3._
import chisel3.util._
import nscscc.axi._
import nscscc.config._

object L2PortSource {
  def icache: Bool = false.B
  def dcache: Bool = true.B
}

object L2BridgeReadOwner {
  def mshr: UInt = 0.U(2.W)
  def uncache: UInt = 1.U(2.W)
}

object L2BridgeWriteOwner {
  def eviction: UInt = 0.U(2.W)
  def cleanLine: UInt = 1.U(2.W)
  def uncache: UInt = 2.U(2.W)
}

class L2LookupToken(implicit p: Parameters) extends NSBundle {
  val source = Bool()
  val id = UInt(1.W)
  val addr = UInt(XLEN.W)
  val isStb = Bool()
  val isUncacheProbe = Bool()
  val stbSlot = UInt(log2Ceil(l2IStbEntries + l2DStbEntries).W)
}

class L2LookupResult(implicit p: Parameters) extends NSBundle {
  val token = new L2LookupToken
  val hit = Bool()
  val way = UInt(l2WayBits.W)
  val oldValid = Bool()
  val oldDirty = Bool()
  val oldTag = UInt(l2TagBits.W)
  val oldData = UInt(l2LineBits.W)
}

class L2Cache(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val icache = Flipped(new L2NativeReadIO(1))
    val dcache = Flipped(new L2NativeMasterIO(1))
    val maintenance = Flipped(new L2MaintenanceMasterIO)
    val axi = new AXI3MasterIO
  })

  val array = Module(new L2CacheArray)
  val replacer = Module(new L2Replacer)
  val bridge = Module(new L2Bridge)
  io.axi <> bridge.io.axi

  // V1不接管现有CACOP路径。
  io.maintenance.req.ready := false.B
  io.maintenance.done.valid := false.B
  io.maintenance.done.bits.done := false.B

  // ICache request boundary: no combinational bypass into L2.
  val iReqEntryValid = RegInit(false.B)
  val iReqEntryBits = RegInit(0.U.asTypeOf(new L2ReadReq(1)))
  val iActive = RegInit(false.B)
  val iActiveMshr = RegInit(0.U(l2MshrIdBits.W))
  val iActiveHasMshr = RegInit(false.B)
  val iKilled = RegInit(false.B)

  val iLrbValid = RegInit(false.B)
  val iLrbBits = Reg(new L2ReadResp(1))
  val iLrbFromMshr = RegInit(false.B)
  val iLrbFromUncache = RegInit(false.B)
  val iLrbMshr = RegInit(0.U(l2MshrIdBits.W))

  val dLrbValid = RegInit(false.B)
  val dLrbBits = Reg(new L2ReadResp(1))
  val dLrbFromMshr = RegInit(false.B)
  val dLrbFromUncache = RegInit(false.B)
  val dLrbMshr = RegInit(0.U(l2MshrIdBits.W))

  io.icache.resp.valid := iLrbValid && !iKilled && !io.icache.cancel
  io.icache.resp.bits := iLrbBits
  io.dcache.read.resp.valid := dLrbValid
  io.dcache.read.resp.bits := dLrbBits

  val iLrbReady = !iLrbValid || io.icache.resp.ready
  val dLrbReady = !dLrbValid || io.dcache.read.resp.ready

  // 4个MSHR各自拥有一个16拍LFB。
  val mshrValid = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrSource = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrId = RegInit(VecInit(Seq.fill(l2MshrEntries)(0.U(1.W))))
  val mshrAddr = RegInit(VecInit(Seq.fill(l2MshrEntries)(0.U(XLEN.W))))
  val mshrWay = RegInit(VecInit(Seq.fill(l2MshrEntries)(0.U(l2WayBits.W))))
  val mshrWaitEb = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrReadIssued = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrRecvBeat = RegInit(VecInit(Seq.fill(l2MshrEntries)(0.U(l2BeatIdxBits.W))))
  val mshrSendBeat = RegInit(VecInit(Seq.fill(l2MshrEntries)(0.U(l2BeatIdxBits.W))))
  val mshrFillComplete = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrInstalled = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrResponseQueued = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val mshrResponseAck = RegInit(VecInit(Seq.fill(l2MshrEntries)(false.B)))
  val lfbWords = RegInit(VecInit(Seq.fill(l2MshrEntries)(
    VecInit(Seq.fill(l2BurstBeats)(0.U(XLEN.W)))
  )))
  val lfbBeatValid = RegInit(VecInit(Seq.fill(l2MshrEntries)(
    VecInit(Seq.fill(l2BurstBeats)(false.B))
  )))

  // 1项EB在DDR写响应到达前持续拥有脏victim。
  val ebValid = RegInit(false.B)
  val ebIssued = RegInit(false.B)
  val ebAddr = RegInit(0.U(XLEN.W))
  val ebData = RegInit(0.U(l2LineBits.W))
  val ebHasMshr = RegInit(false.B)
  val ebMshr = RegInit(0.U(l2MshrIdBits.W))
  val ebForUncache = RegInit(false.B)

  // 总计3项STB：第0项为未来I侧exclusive预留，后2项供DCache。
  val stbCount = l2IStbEntries + l2DStbEntries
  val stbSlotBits = log2Ceil(stbCount)
  val stbValid = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbAddr = RegInit(VecInit(Seq.fill(stbCount)(0.U(XLEN.W))))
  val stbData = RegInit(VecInit(Seq.fill(stbCount)(0.U(l2LineBits.W))))
  val stbKind = RegInit(VecInit(Seq.fill(stbCount)(L2WriteKind.putLine)))
  val stbId = RegInit(VecInit(Seq.fill(stbCount)(0.U(1.W))))
  val stbLookupIssued = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbInstalled = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbWriteIssued = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbDdrDone = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbDoneQueued = RegInit(VecInit(Seq.fill(stbCount)(false.B)))
  val stbDoneAck = RegInit(VecInit(Seq.fill(stbCount)(false.B)))

  val ucReadValid = RegInit(false.B)
  val ucReadIssued = RegInit(false.B)
  val ucReadSource = RegInit(false.B)
  val ucReadId = RegInit(0.U(1.W))
  val ucReadAddr = RegInit(0.U(XLEN.W))
  val ucReadSize = RegInit(0.U(3.W))
  val ucProbePending = RegInit(false.B)
  val ucProbeInFlight = RegInit(false.B)
  val ucCoherenceReady = RegInit(false.B)

  val ucWriteValid = RegInit(false.B)
  val ucWriteIssued = RegInit(false.B)
  val ucWriteBridgeDone = RegInit(false.B)
  val ucWriteDoneQueued = RegInit(false.B)
  val ucWriteId = RegInit(0.U(1.W))
  val ucWriteAddr = RegInit(0.U(XLEN.W))
  val ucWriteSize = RegInit(0.U(3.W))
  val ucWriteData = RegInit(0.U(l2LineBits.W))
  val ucWriteStrb = RegInit(0.U(l2BeatBytes.W))

  val dDoneValid = RegInit(false.B)
  val dDoneBits = Reg(new L2WriteDone(1))
  val dDoneIsStb = RegInit(false.B)
  val dDoneStbSlot = RegInit(0.U(stbSlotBits.W))
  val dDoneIsUncache = RegInit(false.B)
  io.dcache.write.done.valid := dDoneValid
  io.dcache.write.done.bits := dDoneBits

  val lookupSetBusy = RegInit(VecInit(Seq.fill(l2Sets)(false.B)))
  val lookupToken = Wire(new L2LookupToken)
  lookupToken := 0.U.asTypeOf(new L2LookupToken)
  val lookupTokenD1 = RegEnable(lookupToken, 0.U.asTypeOf(new L2LookupToken), array.io.read.req.fire)
  val lookupTokenD1Valid = RegNext(array.io.read.req.fire, false.B)
  val lookupTokenD2 = RegEnable(lookupTokenD1, 0.U.asTypeOf(new L2LookupToken), lookupTokenD1Valid)
  val lookupTokenD2Valid = RegNext(lookupTokenD1Valid, false.B)

  val resultQueue = Module(new Queue(new L2LookupResult, 4, pipe = true))
  val arrayValidMask = VecInit(array.io.read.resp.bits.ways.map(_.valid)).asUInt
  val arrayHitMask = VecInit(array.io.read.resp.bits.ways.map(way =>
    way.valid && way.tag === lookupTokenD2.addr(XLEN - 1, l2IdxBits + l2BlockOffBits)
  )).asUInt
  val arrayHit = arrayHitMask.orR
  val arrayHitWay = OHToUInt(arrayHitMask)
  replacer.io.lookup.set := array.io.read.resp.bits.set
  replacer.io.lookup.validMask := arrayValidMask
  val arrayChosenWay = Mux(arrayHit, arrayHitWay, replacer.io.victim)
  val arrayChosenOH = UIntToOH(arrayChosenWay, l2Ways)

  resultQueue.io.enq.valid := array.io.read.resp.valid && lookupTokenD2Valid
  resultQueue.io.enq.bits.token := lookupTokenD2
  resultQueue.io.enq.bits.hit := arrayHit
  resultQueue.io.enq.bits.way := arrayChosenWay
  resultQueue.io.enq.bits.oldValid := Mux1H(arrayChosenOH, array.io.read.resp.bits.ways.map(_.valid))
  resultQueue.io.enq.bits.oldDirty := Mux1H(arrayChosenOH, array.io.read.resp.bits.ways.map(_.dirty))
  resultQueue.io.enq.bits.oldTag := Mux1H(arrayChosenOH, array.io.read.resp.bits.ways.map(_.tag))
  resultQueue.io.enq.bits.oldData := Mux1H(arrayChosenOH, array.io.read.resp.bits.ways.map(_.data))

  val lookupOccupancy = resultQueue.io.count + lookupTokenD1Valid.asUInt + lookupTokenD2Valid.asUInt
  val lookupHasCredit = lookupOccupancy < 4.U

  val mshrFreeMask = VecInit(mshrValid.map(v => !v)).asUInt
  val hasFreeMshr = mshrFreeMask.orR
  val freeMshr = PriorityEncoder(mshrFreeMask)
  val mshrSetVec = VecInit((0 until l2MshrEntries).map(i =>
    mshrValid(i) && mshrAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits) ===
      resultQueue.io.deq.bits.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
  ))

  val fillVec = VecInit((0 until l2MshrEntries).map(i =>
    mshrValid(i) && mshrFillComplete(i) && !mshrInstalled(i)
  ))
  val hasFillInstall = fillVec.asUInt.orR
  val fillInstallMshr = PriorityEncoder(fillVec)

  val head = resultQueue.io.deq.bits
  val headBlock = head.token.addr(XLEN - 1, l2BlockOffBits)
  val headStbMatchVec = VecInit((0 until stbCount).map(i =>
    stbValid(i) && stbAddr(i)(XLEN - 1, l2BlockOffBits) === headBlock
  ))
  val headHasStbForward = headStbMatchVec.asUInt.orR && !head.token.isStb &&
    !head.token.isUncacheProbe
  val headStbForwardSlot = PriorityEncoder(headStbMatchVec)
  val headNeedsEb = !head.token.isUncacheProbe && !head.hit && head.oldValid && head.oldDirty

  val headPortReady = Mux(head.token.source === L2PortSource.dcache, dLrbReady, iLrbReady || iKilled)
  val headReadCanProcess = Mux(
    headHasStbForward || head.hit,
    headPortReady,
    hasFreeMshr && !mshrSetVec.asUInt.orR && (!headNeedsEb || !ebValid)
  )
  val headStbCanProcess = (!headNeedsEb || !ebValid)
  val resultCanProcess = resultQueue.io.deq.valid && !hasFillInstall &&
    // Probe misses and clean hits need no EB; dirty hits wait until the exact line can be transferred into EB.
    Mux(head.token.isUncacheProbe, !head.hit || !head.oldDirty || !ebValid,
      Mux(head.token.isStb, headStbCanProcess, headReadCanProcess))
  resultQueue.io.deq.ready := resultCanProcess

  val resultReadResponse = resultCanProcess && !head.token.isStb && !head.token.isUncacheProbe &&
    (headHasStbForward || head.hit)
  val resultToI = resultReadResponse && head.token.source === L2PortSource.icache && !iKilled && !io.icache.cancel
  val resultToD = resultReadResponse && head.token.source === L2PortSource.dcache
  val killedIResult = resultCanProcess && !head.token.isStb && !head.token.isUncacheProbe &&
    head.token.source === L2PortSource.icache && (iKilled || io.icache.cancel)
  val resultResponseData = Mux(headHasStbForward, stbData(headStbForwardSlot), head.oldData)

  // Array只有一个整行写口：fill安装优先，其次处理lookup结果。
  array.io.write.valid := false.B
  array.io.write.bits := 0.U.asTypeOf(new L2ArrayWriteReq)
  replacer.io.touch.valid := false.B
  replacer.io.touch.bits := 0.U.asTypeOf(new L2ReplacerTouch)

  when(hasFillInstall) {
    array.io.write.valid := true.B
    array.io.write.bits.set := mshrAddr(fillInstallMshr)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
    array.io.write.bits.way := mshrWay(fillInstallMshr)
    array.io.write.bits.valid := true.B
    array.io.write.bits.dirty := false.B
    array.io.write.bits.tag := mshrAddr(fillInstallMshr)(XLEN - 1, l2BlockOffBits + l2IdxBits)
    array.io.write.bits.data := lfbWords(fillInstallMshr).asUInt
    array.io.write.bits.dataWen := true.B
    replacer.io.touch.valid := true.B
    replacer.io.touch.bits.set := array.io.write.bits.set
    replacer.io.touch.bits.way := array.io.write.bits.way
  }.elsewhen(resultCanProcess && head.token.isStb) {
    val slot = head.token.stbSlot
    array.io.write.valid := true.B
    array.io.write.bits.set := stbAddr(slot)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
    array.io.write.bits.way := head.way
    array.io.write.bits.valid := true.B
    array.io.write.bits.dirty := stbKind(slot) === L2WriteKind.putLine
    array.io.write.bits.tag := stbAddr(slot)(XLEN - 1, l2BlockOffBits + l2IdxBits)
    array.io.write.bits.data := stbData(slot)
    array.io.write.bits.dataWen := true.B
    replacer.io.touch.valid := true.B
    replacer.io.touch.bits.set := array.io.write.bits.set
    replacer.io.touch.bits.way := head.way
  }.elsewhen(resultCanProcess && head.token.isUncacheProbe && head.hit) {
    array.io.write.valid := true.B
    array.io.write.bits.set := head.token.addr(
      l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
    array.io.write.bits.way := head.way
    array.io.write.bits.valid := false.B
    array.io.write.bits.dirty := false.B
    array.io.write.bits.tag := head.oldTag
    array.io.write.bits.data := 0.U
    array.io.write.bits.dataWen := false.B
  }.elsewhen(resultCanProcess && !head.token.isStb && !head.token.isUncacheProbe &&
    !head.hit && !headHasStbForward) {
    // miss分配MSHR时先令victim无效，way由该MSHR独占。
    array.io.write.valid := true.B
    array.io.write.bits.set := head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
    array.io.write.bits.way := head.way
    array.io.write.bits.valid := false.B
    array.io.write.bits.dirty := false.B
    array.io.write.bits.tag := head.oldTag
    array.io.write.bits.data := 0.U
    array.io.write.bits.dataWen := false.B
  }.elsewhen(resultReadResponse && !headHasStbForward) {
    replacer.io.touch.valid := true.B
    replacer.io.touch.bits.set := head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
    replacer.io.touch.bits.way := head.way
  }

  when(hasFillInstall) {
    mshrInstalled(fillInstallMshr) := true.B
  }

  when(resultCanProcess) {
    lookupSetBusy(head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)) := false.B
    when(head.token.isUncacheProbe) {
      ucProbeInFlight := false.B
      when(!head.hit) {
        ucCoherenceReady := true.B
      }.elsewhen(!head.oldDirty) {
        ucCoherenceReady := true.B
      }.otherwise {
        ebValid := true.B
        ebIssued := false.B
        ebAddr := Cat(head.oldTag,
          head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits),
          0.U(l2BlockOffBits.W))
        ebData := head.oldData
        ebHasMshr := false.B
        ebForUncache := true.B
        ucCoherenceReady := false.B
      }
    }.elsewhen(head.token.isStb) {
      val slot = head.token.stbSlot
      stbInstalled(slot) := true.B
      when(headNeedsEb) {
        ebValid := true.B
        ebIssued := false.B
        ebAddr := Cat(head.oldTag,
          head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits),
          0.U(l2BlockOffBits.W))
        ebData := head.oldData
        ebHasMshr := false.B
        ebForUncache := false.B
      }
      when(stbKind(slot) === L2WriteKind.putLine) {
        stbValid(slot) := false.B
      }
    }.elsewhen(!head.hit && !headHasStbForward) {
      val slot = freeMshr
      mshrValid(slot) := true.B
      mshrSource(slot) := head.token.source
      mshrId(slot) := head.token.id
      mshrAddr(slot) := Cat(head.token.addr(XLEN - 1, l2BlockOffBits), 0.U(l2BlockOffBits.W))
      mshrWay(slot) := head.way
      mshrWaitEb(slot) := headNeedsEb
      mshrReadIssued(slot) := false.B
      mshrRecvBeat(slot) := 0.U
      mshrSendBeat(slot) := 0.U
      mshrFillComplete(slot) := false.B
      mshrInstalled(slot) := false.B
      mshrResponseQueued(slot) := false.B
      mshrResponseAck(slot) := false.B
      when(head.token.source === L2PortSource.icache) {
        iActiveMshr := slot
        iActiveHasMshr := true.B
      }
      for (beat <- 0 until l2BurstBeats) {
        lfbBeatValid(slot)(beat) := false.B
      }
      when(headNeedsEb) {
        ebValid := true.B
        ebIssued := false.B
        ebAddr := Cat(head.oldTag,
          head.token.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits),
          0.U(l2BlockOffBits.W))
        ebData := head.oldData
        ebHasMshr := true.B
        ebMshr := slot
        ebForUncache := false.B
      }
    }
  }

  // Killed lookup hits/forwards have no lower transaction to drain.
  when(killedIResult && (head.hit || headHasStbForward)) {
    iActive := false.B
    iKilled := false.B
    iActiveHasMshr := false.B
  }

  // STB/lookup/active miss CAM在接收请求前完成。
  val iReqSet = iReqEntryBits.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
  val dReqSet = io.dcache.read.req.bits.addr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
  val iReqBlock = iReqEntryBits.addr(XLEN - 1, l2BlockOffBits)
  val dReqBlock = io.dcache.read.req.bits.addr(XLEN - 1, l2BlockOffBits)
  val iMshrConflict = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrAddr(i)(XLEN - 1, l2BlockOffBits) === iReqBlock)).asUInt.orR
  val dMshrConflict = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrAddr(i)(XLEN - 1, l2BlockOffBits) === dReqBlock)).asUInt.orR
  val iMshrSetConflict = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits) === iReqSet)).asUInt.orR
  val dMshrSetConflict = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits) === dReqSet)).asUInt.orR
  val iEbConflict = ebValid && ebAddr(XLEN - 1, l2BlockOffBits) === iReqBlock
  val dEbConflict = ebValid && ebAddr(XLEN - 1, l2BlockOffBits) === dReqBlock

  val allCacheWorkDrained = !mshrValid.asUInt.orR && !stbValid.asUInt.orR &&
    !ebValid && !lookupSetBusy.asUInt.orR && resultQueue.io.count === 0.U &&
    !lookupTokenD1Valid && !lookupTokenD2Valid && !iLrbValid && !dLrbValid &&
    !ucReadValid && !ucWriteValid && !dDoneValid

  val cacheLineWrite = io.dcache.write.req.bits.kind === L2WriteKind.putLine ||
    io.dcache.write.req.bits.kind === L2WriteKind.cleanLine
  val uncacheWrite = io.dcache.write.req.bits.kind === L2WriteKind.uncache
  // uncache一旦等待排空，就停止接收新的cacheable请求，避免被持续流量饿死。
  val uncacheBusy = ucReadValid || ucWriteValid
  val iUncacheReadWantsDrain = iReqEntryValid && iReqEntryBits.uncache
  val dUncacheReadWantsDrain = io.dcache.read.req.valid && io.dcache.read.req.bits.uncache
  val dUncacheWriteWantsDrain = io.dcache.write.req.valid && uncacheWrite
  val uncacheWantsDrain = iUncacheReadWantsDrain || dUncacheReadWantsDrain ||
    dUncacheWriteWantsDrain

  // 同拍多个uncache意向采用固定优先级：D写 > I读 > D读。
  val iUncacheCanHandle = iUncacheReadWantsDrain && allCacheWorkDrained &&
    !dUncacheWriteWantsDrain
  val dUncacheCanHandle = dUncacheReadWantsDrain && allCacheWorkDrained &&
    !dUncacheWriteWantsDrain && !iUncacheReadWantsDrain

  val iCacheEligible = !iReqEntryBits.uncache && lookupHasCredit &&
    !uncacheBusy && !uncacheWantsDrain && !lookupSetBusy(iReqSet) && !iMshrConflict && !iMshrSetConflict && !iEbConflict &&
    (!array.io.write.valid || array.io.write.bits.set =/= iReqSet)
  val dCacheEligible = !io.dcache.read.req.bits.uncache && lookupHasCredit &&
    !uncacheBusy && !uncacheWantsDrain && !lookupSetBusy(dReqSet) && !dMshrConflict && !dMshrSetConflict && !dEbConflict &&
    (!array.io.write.valid || array.io.write.bits.set =/= dReqSet)
  val iReadCanHandle = iReqEntryValid && !iActive && Mux(iReqEntryBits.uncache,
    iUncacheCanHandle, iCacheEligible) && !io.icache.cancel
  val dReadCanHandle = io.dcache.read.req.valid && Mux(io.dcache.read.req.bits.uncache,
    dUncacheCanHandle, dCacheEligible)

  val preferD = RegInit(false.B)

  val stbLookupVec = VecInit((0 until stbCount).map(i => stbValid(i) &&
    !stbLookupIssued(i) && !stbInstalled(i) &&
    !lookupSetBusy(stbAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)) &&
    !VecInit((0 until l2MshrEntries).map(m => mshrValid(m) &&
      mshrAddr(m)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits) ===
        stbAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits))).asUInt.orR &&
    (!array.io.write.valid || array.io.write.bits.set =/=
      stbAddr(i)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits))
  ))
  val hasStbLookup = stbLookupVec.asUInt.orR && lookupHasCredit
  val stbLookupSlot = PriorityEncoder(stbLookupVec)
  val preferStb = RegInit(false.B)
  val readWantsLookup = iReadCanHandle || dReadCanHandle
  val chooseStbLookup = hasStbLookup && (!readWantsLookup || preferStb)
  val chooseI = !chooseStbLookup && iReadCanHandle && (!dReadCanHandle || !preferD)
  val chooseD = !chooseStbLookup && dReadCanHandle && (!iReadCanHandle || preferD)
  val chosenUncache = (chooseI && iReqEntryBits.uncache) ||
    (chooseD && io.dcache.read.req.bits.uncache)
  val ucProbeOwnerAddr = Mux(ucReadValid, ucReadAddr, ucWriteAddr)
  val ucProbeAddr = Cat(ucProbeOwnerAddr(XLEN - 1, l2BlockOffBits),
    0.U(l2BlockOffBits.W))
  val ucProbeSet = ucProbeAddr(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits)
  val chooseUcProbe = ucProbePending && !ucProbeInFlight && lookupHasCredit &&
    !lookupSetBusy(ucProbeSet) && !array.io.write.valid

  array.io.read.req.valid := ((chooseI || chooseD) && !chosenUncache) || chooseStbLookup ||
    chooseUcProbe
  array.io.read.req.bits.set := Mux(chooseUcProbe, ucProbeSet, Mux(chooseStbLookup,
    stbAddr(stbLookupSlot)(l2BlockOffBits + l2IdxBits - 1, l2BlockOffBits),
    Mux(chooseD, dReqSet, iReqSet)))
  lookupToken.source := Mux(chooseUcProbe,
    Mux(ucReadValid, ucReadSource, L2PortSource.dcache),
    Mux(chooseD, L2PortSource.dcache, L2PortSource.icache))
  lookupToken.id := Mux(chooseUcProbe, Mux(ucReadValid, ucReadId, ucWriteId),
    Mux(chooseD, io.dcache.read.req.bits.id, iReqEntryBits.id))
  lookupToken.addr := Mux(chooseUcProbe, ucProbeAddr, Mux(chooseStbLookup,
    stbAddr(stbLookupSlot), Mux(chooseD, io.dcache.read.req.bits.addr, iReqEntryBits.addr)))
  lookupToken.isStb := chooseStbLookup
  lookupToken.isUncacheProbe := chooseUcProbe
  lookupToken.stbSlot := stbLookupSlot

  // Entry-only ready cuts the ICache -> L2 arbitration/CAM path.
  io.icache.req.ready := array.io.initDone && !iReqEntryValid && !io.icache.cancel
  io.dcache.read.req.ready := array.io.initDone && chooseD &&
    Mux(chosenUncache, true.B, array.io.read.req.ready)

  val iInternalAccept = chooseI && Mux(chosenUncache, true.B, array.io.read.req.fire)
  when(io.icache.req.fire) {
    iReqEntryBits := io.icache.req.bits
    iReqEntryValid := true.B
  }
  when(iInternalAccept) {
    iReqEntryValid := false.B
    iActive := true.B
    iKilled := false.B
    iActiveHasMshr := false.B
  }
  // Cancel wins over same-cycle capture, issue, and response.
  when(io.icache.cancel) {
    iReqEntryValid := false.B
    when(iActive || iInternalAccept) { iKilled := true.B }
    // A same-cycle killed lookup hit/forward has no lower transaction to drain.
    when(killedIResult && (head.hit || headHasStbForward)) {
      iActive := false.B
      iKilled := false.B
      iActiveHasMshr := false.B
    }
    when(iLrbValid) {
      when(iLrbFromUncache) {
        ucReadValid := false.B
        iActive := false.B
        iKilled := false.B
        iActiveHasMshr := false.B
      }.elsewhen(!iLrbFromMshr) {
        // A buffered hit/forward has no lower transaction left to drain.
        iActive := false.B
        iKilled := false.B
        iActiveHasMshr := false.B
      }.elsewhen(iLrbBits.last) {
        // The final MSHR response was queued already; acknowledge it internally.
        mshrResponseAck(iLrbMshr) := true.B
      }
    }
    iLrbValid := false.B
  }

  when(array.io.read.req.fire) {
    lookupSetBusy(array.io.read.req.bits.set) := true.B
    preferStb := !chooseStbLookup
    when(chooseStbLookup) {
      stbLookupIssued(stbLookupSlot) := true.B
    }
    when(chooseUcProbe) {
      ucProbePending := false.B
      ucProbeInFlight := true.B
    }
  }
  when(iInternalAccept || io.dcache.read.req.fire) {
    preferD := iInternalAccept
  }
  when(iInternalAccept && iReqEntryBits.uncache) {
    ucReadValid := true.B
    ucReadIssued := false.B
    ucReadSource := L2PortSource.icache
    ucReadId := iReqEntryBits.id
    ucReadAddr := iReqEntryBits.addr
    ucReadSize := iReqEntryBits.size
    ucProbePending := true.B
    ucProbeInFlight := false.B
    ucCoherenceReady := false.B
  }.elsewhen(io.dcache.read.req.fire && io.dcache.read.req.bits.uncache) {
    ucReadValid := true.B
    ucReadIssued := false.B
    ucReadSource := L2PortSource.dcache
    ucReadId := io.dcache.read.req.bits.id
    ucReadAddr := io.dcache.read.req.bits.addr
    ucReadSize := io.dcache.read.req.bits.size
    ucProbePending := true.B
    ucProbeInFlight := false.B
    ucCoherenceReady := false.B
  }

  // DCache整行写进入2项D-STB；uncache写只在所有cacheable工作排空后接收。
  val dStbFreeVec = VecInit((0 until stbCount).map(i =>
    if (i < l2IStbEntries) false.B else !stbValid(i)
  ))
  val hasDStbFree = dStbFreeVec.asUInt.orR
  val dStbFreeSlot = PriorityEncoder(dStbFreeVec)
  val writeReqBlock = io.dcache.write.req.bits.addr(XLEN - 1, l2BlockOffBits)
  val sameStbWrite = VecInit((0 until stbCount).map(i => stbValid(i) &&
    stbAddr(i)(XLEN - 1, l2BlockOffBits) === writeReqBlock)).asUInt.orR
  io.dcache.write.req.ready := array.io.initDone && Mux(cacheLineWrite,
    hasDStbFree && !sameStbWrite && !uncacheBusy && !uncacheWantsDrain,
    dUncacheWriteWantsDrain && allCacheWorkDrained)

  when(io.dcache.write.req.fire && cacheLineWrite) {
    val slot = dStbFreeSlot
    stbValid(slot) := true.B
    stbAddr(slot) := Cat(io.dcache.write.req.bits.addr(XLEN - 1, l2BlockOffBits),
      0.U(l2BlockOffBits.W))
    stbData(slot) := io.dcache.write.req.bits.data
    stbKind(slot) := io.dcache.write.req.bits.kind
    stbId(slot) := io.dcache.write.req.bits.id
    stbLookupIssued(slot) := false.B
    stbInstalled(slot) := false.B
    stbWriteIssued(slot) := false.B
    stbDdrDone(slot) := false.B
    stbDoneQueued(slot) := false.B
    stbDoneAck(slot) := false.B
  }.elsewhen(io.dcache.write.req.fire && uncacheWrite) {
    ucWriteValid := true.B
    ucWriteIssued := false.B
    ucWriteBridgeDone := false.B
    ucWriteDoneQueued := false.B
    ucWriteId := io.dcache.write.req.bits.id
    ucWriteAddr := io.dcache.write.req.bits.addr
    ucWriteSize := io.dcache.write.req.bits.size
    ucWriteData := io.dcache.write.req.bits.data
    ucWriteStrb := io.dcache.write.req.bits.strb
    ucProbePending := true.B
    ucProbeInFlight := false.B
    ucCoherenceReady := false.B
  }

  // Bridge写事务：EB优先，随后cleanLine，最后uncache写。
  val cleanWriteVec = VecInit((0 until stbCount).map(i => stbValid(i) &&
    stbKind(i) === L2WriteKind.cleanLine && !stbWriteIssued(i)))
  val hasCleanWrite = cleanWriteVec.asUInt.orR
  val cleanWriteSlot = PriorityEncoder(cleanWriteVec)
  val bridgeWriteQueue = Module(new Queue(new L2BridgeWriteCmd, 1,
    pipe = false, flow = false))
  bridge.io.client.write.req <> bridgeWriteQueue.io.deq
  bridgeWriteQueue.io.enq.valid := (ebValid && !ebIssued) || hasCleanWrite ||
    (ucWriteValid && !ucWriteIssued && ucCoherenceReady)
  bridgeWriteQueue.io.enq.bits := 0.U.asTypeOf(new L2BridgeWriteCmd)
  when(ebValid && !ebIssued) {
    bridgeWriteQueue.io.enq.bits.owner.source := L2BridgeWriteOwner.eviction
    bridgeWriteQueue.io.enq.bits.owner.slot := ebMshr
    bridgeWriteQueue.io.enq.bits.addr := ebAddr
    bridgeWriteQueue.io.enq.bits.isLine := true.B
    bridgeWriteQueue.io.enq.bits.size := 2.U
    bridgeWriteQueue.io.enq.bits.data := ebData
    bridgeWriteQueue.io.enq.bits.strb := Fill(l2BeatBytes, 1.U(1.W))
  }.elsewhen(hasCleanWrite) {
    bridgeWriteQueue.io.enq.bits.owner.source := L2BridgeWriteOwner.cleanLine
    bridgeWriteQueue.io.enq.bits.owner.slot := cleanWriteSlot
    bridgeWriteQueue.io.enq.bits.addr := stbAddr(cleanWriteSlot)
    bridgeWriteQueue.io.enq.bits.isLine := true.B
    bridgeWriteQueue.io.enq.bits.size := 2.U
    bridgeWriteQueue.io.enq.bits.data := stbData(cleanWriteSlot)
    bridgeWriteQueue.io.enq.bits.strb := Fill(l2BeatBytes, 1.U(1.W))
  }.otherwise {
    bridgeWriteQueue.io.enq.bits.owner.source := L2BridgeWriteOwner.uncache
    bridgeWriteQueue.io.enq.bits.owner.slot := 0.U
    bridgeWriteQueue.io.enq.bits.addr := ucWriteAddr
    bridgeWriteQueue.io.enq.bits.isLine := false.B
    bridgeWriteQueue.io.enq.bits.size := ucWriteSize
    bridgeWriteQueue.io.enq.bits.data := ucWriteData
    bridgeWriteQueue.io.enq.bits.strb := ucWriteStrb
  }
  when(bridgeWriteQueue.io.enq.fire) {
    when(bridgeWriteQueue.io.enq.bits.owner.source === L2BridgeWriteOwner.eviction) {
      ebIssued := true.B
    }.elsewhen(bridgeWriteQueue.io.enq.bits.owner.source === L2BridgeWriteOwner.cleanLine) {
      stbWriteIssued(bridgeWriteQueue.io.enq.bits.owner.slot) := true.B
    }.otherwise {
      ucWriteIssued := true.B
    }
  }

  bridge.io.client.write.done.ready := true.B
  when(bridge.io.client.write.done.fire) {
    when(bridge.io.client.write.done.bits.owner.source === L2BridgeWriteOwner.eviction) {
      when(ebForUncache) {
        ucCoherenceReady := true.B
      }
      ebValid := false.B
      ebIssued := false.B
      when(ebHasMshr) {
        mshrWaitEb(ebMshr) := false.B
      }
      ebHasMshr := false.B
      ebForUncache := false.B
    }.elsewhen(bridge.io.client.write.done.bits.owner.source === L2BridgeWriteOwner.cleanLine) {
      stbDdrDone(bridge.io.client.write.done.bits.owner.slot) := true.B
    }.otherwise {
      ucWriteBridgeDone := true.B
    }
  }

  // Bridge读事务：等待EB的MSHR不能发AR；uncache只会在排空后出现。
  val mshrReadVec = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    !mshrReadIssued(i) && !mshrWaitEb(i)))
  val hasMshrRead = mshrReadVec.asUInt.orR
  val bridgeReadMshr = PriorityEncoder(mshrReadVec)
  val bridgeReadQueue = Module(new Queue(new L2BridgeReadCmd, 1,
    pipe = false, flow = false))
  bridge.io.client.read.req <> bridgeReadQueue.io.deq
  bridgeReadQueue.io.enq.valid := hasMshrRead || (ucReadValid && !ucReadIssued && ucCoherenceReady)
  bridgeReadQueue.io.enq.bits := 0.U.asTypeOf(new L2BridgeReadCmd)
  when(hasMshrRead) {
    bridgeReadQueue.io.enq.bits.owner.source := L2BridgeReadOwner.mshr
    bridgeReadQueue.io.enq.bits.owner.slot := bridgeReadMshr
    bridgeReadQueue.io.enq.bits.addr := mshrAddr(bridgeReadMshr)
    bridgeReadQueue.io.enq.bits.isLine := true.B
    bridgeReadQueue.io.enq.bits.size := 2.U
  }.otherwise {
    bridgeReadQueue.io.enq.bits.owner.source := L2BridgeReadOwner.uncache
    bridgeReadQueue.io.enq.bits.owner.slot := 0.U
    bridgeReadQueue.io.enq.bits.addr := ucReadAddr
    bridgeReadQueue.io.enq.bits.isLine := false.B
    bridgeReadQueue.io.enq.bits.size := ucReadSize
  }
  when(bridgeReadQueue.io.enq.fire) {
    when(bridgeReadQueue.io.enq.bits.owner.source === L2BridgeReadOwner.mshr) {
      mshrReadIssued(bridgeReadQueue.io.enq.bits.owner.slot) := true.B
    }.otherwise {
      ucReadIssued := true.B
    }
  }

  val bridgeBeatIsMshr = bridge.io.client.read.beat.bits.owner.source === L2BridgeReadOwner.mshr
  val bridgeBeatIsUc = bridge.io.client.read.beat.bits.owner.source === L2BridgeReadOwner.uncache
  val ucBeatPortReady = Mux(ucReadSource === L2PortSource.dcache, dLrbReady, iLrbReady || iKilled || io.icache.cancel)
  val ucBeatBlockedByResult = Mux(ucReadSource === L2PortSource.dcache,
    resultToD, resultToI)
  bridge.io.client.read.beat.ready := Mux(bridgeBeatIsMshr, true.B,
    bridgeBeatIsUc && ucBeatPortReady && !ucBeatBlockedByResult)

  when(bridge.io.client.read.beat.fire && bridgeBeatIsMshr) {
    val slot = bridge.io.client.read.beat.bits.owner.slot
    val beat = mshrRecvBeat(slot)
    lfbWords(slot)(beat) := bridge.io.client.read.beat.bits.data
    lfbBeatValid(slot)(beat) := true.B
    when(bridge.io.client.read.beat.bits.last) {
      mshrRecvBeat(slot) := 0.U
      mshrFillComplete(slot) := true.B
    }.otherwise {
      mshrRecvBeat(slot) := beat + 1.U
    }
  }

  // 每个L1端口独立从LFB取已到达beat，DDR接收不依赖L1 ready。
  val iSendVec = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrSource(i) === L2PortSource.icache && !mshrResponseQueued(i) &&
    lfbBeatValid(i)(mshrSendBeat(i))))
  val dSendVec = VecInit((0 until l2MshrEntries).map(i => mshrValid(i) &&
    mshrSource(i) === L2PortSource.dcache && !mshrResponseQueued(i) &&
    lfbBeatValid(i)(mshrSendBeat(i))))
  val hasISend = iSendVec.asUInt.orR
  val hasDSend = dSendVec.asUInt.orR
  val iSendMshr = PriorityEncoder(iSendVec)
  val dSendMshr = PriorityEncoder(dSendVec)
  val iMshrLoad = !iKilled && !io.icache.cancel && !resultToI && hasISend && iLrbReady &&
    !(bridge.io.client.read.beat.valid && bridgeBeatIsUc && ucReadSource === L2PortSource.icache)
  val dMshrLoad = !resultToD && hasDSend && dLrbReady &&
    !(bridge.io.client.read.beat.valid && bridgeBeatIsUc && ucReadSource === L2PortSource.dcache)
  val ucBeatLoad = bridge.io.client.read.beat.fire && bridgeBeatIsUc
  val killedUcBeat = ucBeatLoad && ucReadSource === L2PortSource.icache && (iKilled || io.icache.cancel)
  val killedMshrCanAdvance = iKilled && iActiveHasMshr && mshrValid(iActiveMshr) &&
    mshrSource(iActiveMshr) === L2PortSource.icache && !mshrResponseQueued(iActiveMshr) &&
    lfbBeatValid(iActiveMshr)(mshrSendBeat(iActiveMshr))
  val killedMshrSlot = iActiveMshr
  val killedMshrBeat = mshrSendBeat(killedMshrSlot)

  // A killed I miss is consumed internally; DDR refill/install is retained in L2.
  when(killedMshrCanAdvance) {
    lfbBeatValid(killedMshrSlot)(killedMshrBeat) := false.B
    when(killedMshrBeat === (l2BurstBeats - 1).U) {
      mshrResponseQueued(killedMshrSlot) := true.B
      mshrResponseAck(killedMshrSlot) := true.B
    }.otherwise {
      mshrSendBeat(killedMshrSlot) := killedMshrBeat + 1.U
    }
  }
  when(killedUcBeat && bridge.io.client.read.beat.bits.last) {
    ucReadValid := false.B
    iActive := false.B
    iKilled := false.B
    iActiveHasMshr := false.B
  }

  when(io.icache.resp.fire) {
    iLrbValid := false.B
    when(iLrbFromMshr && iLrbBits.last) {
      mshrResponseAck(iLrbMshr) := true.B
    }
    when(iLrbFromUncache) {
      ucReadValid := false.B
    }
  }
  when(io.icache.resp.fire && iLrbBits.last) {
    iActive := false.B
    iKilled := false.B
    iActiveHasMshr := false.B
  }

  when(io.dcache.read.resp.fire) {
    dLrbValid := false.B
    when(dLrbFromMshr && dLrbBits.last) {
      mshrResponseAck(dLrbMshr) := true.B
    }
    when(dLrbFromUncache) {
      ucReadValid := false.B
    }
  }

  when(ucBeatLoad && ucReadSource === L2PortSource.icache && !iKilled && !io.icache.cancel) {
    iLrbValid := true.B
    iLrbBits.id := ucReadId
    iLrbBits.data := Cat(0.U((l2LineBits - XLEN).W), bridge.io.client.read.beat.bits.data)
    iLrbBits.fullLine := false.B
    iLrbBits.last := bridge.io.client.read.beat.bits.last
    iLrbFromMshr := false.B
    iLrbFromUncache := true.B
  }.elsewhen(resultReadResponse && head.token.source === L2PortSource.icache && !iKilled && !io.icache.cancel) {
    iLrbValid := true.B
    iLrbBits.id := head.token.id
    iLrbBits.data := resultResponseData
    iLrbBits.fullLine := true.B
    iLrbBits.last := true.B
    iLrbFromMshr := false.B
    iLrbFromUncache := false.B
  }.elsewhen(iMshrLoad) {
    val slot = iSendMshr
    val beat = mshrSendBeat(slot)
    iLrbValid := true.B
    iLrbBits.id := mshrId(slot)
    iLrbBits.data := Cat(0.U((l2LineBits - XLEN).W), lfbWords(slot)(beat))
    iLrbBits.fullLine := false.B
    iLrbBits.last := beat === (l2BurstBeats - 1).U
    iLrbFromMshr := true.B
    iLrbFromUncache := false.B
    iLrbMshr := slot
    when(beat === (l2BurstBeats - 1).U) {
      mshrResponseQueued(slot) := true.B
    }.otherwise {
      mshrSendBeat(slot) := beat + 1.U
    }
  }

  when(ucBeatLoad && ucReadSource === L2PortSource.dcache) {
    dLrbValid := true.B
    dLrbBits.id := ucReadId
    dLrbBits.data := Cat(0.U((l2LineBits - XLEN).W), bridge.io.client.read.beat.bits.data)
    dLrbBits.fullLine := false.B
    dLrbBits.last := bridge.io.client.read.beat.bits.last
    dLrbFromMshr := false.B
    dLrbFromUncache := true.B
  }.elsewhen(resultReadResponse && head.token.source === L2PortSource.dcache) {
    dLrbValid := true.B
    dLrbBits.id := head.token.id
    dLrbBits.data := resultResponseData
    dLrbBits.fullLine := true.B
    dLrbBits.last := true.B
    dLrbFromMshr := false.B
    dLrbFromUncache := false.B
  }.elsewhen(dMshrLoad) {
    val slot = dSendMshr
    val beat = mshrSendBeat(slot)
    dLrbValid := true.B
    dLrbBits.id := mshrId(slot)
    dLrbBits.data := Cat(0.U((l2LineBits - XLEN).W), lfbWords(slot)(beat))
    dLrbBits.fullLine := false.B
    dLrbBits.last := beat === (l2BurstBeats - 1).U
    dLrbFromMshr := true.B
    dLrbFromUncache := false.B
    dLrbMshr := slot
    when(beat === (l2BurstBeats - 1).U) {
      mshrResponseQueued(slot) := true.B
    }.otherwise {
      mshrSendBeat(slot) := beat + 1.U
    }
  }

  // cleanLine/uncache的完成必须进入独立done缓冲，不能复用请求ready。
  val cleanDoneVec = VecInit((0 until stbCount).map(i => stbValid(i) &&
    stbKind(i) === L2WriteKind.cleanLine && stbDdrDone(i) && !stbDoneQueued(i)))
  val hasCleanDone = cleanDoneVec.asUInt.orR
  val cleanDoneSlot = PriorityEncoder(cleanDoneVec)
  val doneBufferReady = !dDoneValid || io.dcache.write.done.ready
  when(io.dcache.write.done.fire) {
    dDoneValid := false.B
    when(dDoneIsStb) {
      stbDoneAck(dDoneStbSlot) := true.B
    }
    when(dDoneIsUncache) {
      ucWriteValid := false.B
      ucWriteBridgeDone := false.B
      ucWriteDoneQueued := false.B
    }
  }
  when(doneBufferReady && hasCleanDone) {
    dDoneValid := true.B
    dDoneBits.id := stbId(cleanDoneSlot)
    dDoneIsStb := true.B
    dDoneStbSlot := cleanDoneSlot
    dDoneIsUncache := false.B
    stbDoneQueued(cleanDoneSlot) := true.B
  }.elsewhen(doneBufferReady && ucWriteValid && ucWriteBridgeDone && !ucWriteDoneQueued) {
    dDoneValid := true.B
    dDoneBits.id := ucWriteId
    dDoneIsStb := false.B
    dDoneIsUncache := true.B
    ucWriteDoneQueued := true.B
  }

  for (i <- 0 until stbCount) {
    when(stbValid(i) && stbKind(i) === L2WriteKind.cleanLine &&
      stbInstalled(i) && stbDoneAck(i)) {
      stbValid(i) := false.B
    }
  }
  for (i <- 0 until l2MshrEntries) {
    when(mshrValid(i) && mshrInstalled(i) && mshrResponseAck(i)) {
      mshrValid(i) := false.B
      // Normal I misses release ownership on the accepted last response beat.
      // Only the exact cancelled owner may release it from MSHR cleanup.
      when(mshrSource(i) === L2PortSource.icache && iActive && iKilled &&
        iActiveHasMshr && iActiveMshr === i.U) {
        iActive := false.B
        iKilled := false.B
        iActiveHasMshr := false.B
      }
    }
  }
}
