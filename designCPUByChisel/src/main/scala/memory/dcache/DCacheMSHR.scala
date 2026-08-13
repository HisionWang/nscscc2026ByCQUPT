package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.axi._
 
// ================================================================
//  MSHR 顶层：2 Primary + 4 LoadStore
// ================================================================
class DCacheMSHRFile(implicit p: Parameters) extends NSModule {
  val nPrim = 2
  val nSec  = 4
 
  val io = IO(new Bundle {
    val missReq = Flipped(Decoupled(new Bundle {
      val paddr       = UInt(XLEN.W)
      val lqIdx       = UInt(log2Ceil(LqSize).W)
      val sqIdx       = UInt(log2Ceil(SqSize).W)
      val robIdx      = new RobPtr(RobSize)
      val lsuOp       = UInt(LsuOp.width.W)
      val storeData   = UInt(XLEN.W)
      val isLoad      = Bool()
      val isStore     = Bool()
      val cacheable   = Bool()
      val victimWay   = UInt(wayBitsD.W)
      val victimDirty = Bool()
      val victimTag   = UInt(tagBitsD.W)
      val victimData  = UInt((blockBytes * 8).W)
    }))
 
    val probeBlockAddr = Input(UInt((tagBitsD + idxBitsD).W))
    val probeMatch     = Output(Bool())
    val isFirstMiss    = Output(Bool())
    val matchPrimId    = Output(UInt(1.W))
 
    val hasStore = Output(Bool())
    val idle     = Output(Bool())
 
    val canAlloc        = Output(Bool())
    val refillWriteReq  = Output(Valid(new Bundle {
      val idx  = UInt(idxBitsD.W)
      val way  = UInt(wayBitsD.W)
      val tag  = UInt(tagBitsD.W)
      val data = UInt((blockBytes * 8).W)
    }))
    val refillWriteAck    = Input(Valid(UInt(1.W)))
    val refillWritePrimId = Output(UInt(1.W))
 
    val lsReady       = Output(Bool())
    val lsIdx         = Output(UInt(log2Ceil(nSec).W))
    val lsIsUncache   = Output(Bool())
    val lsUncacheData = Output(UInt(XLEN.W))
    val lsPaddr       = Output(UInt(XLEN.W))
    val lsLqIdx       = Output(UInt(log2Ceil(LqSize).W))
    val lsSqIdx       = Output(UInt(log2Ceil(SqSize).W))
    val lsRobIdx      = Output(new RobPtr(RobSize))
    val lsLsuOp       = Output(UInt(LsuOp.width.W))
    val lsStoreData   = Output(UInt(XLEN.W))
    val lsIsLoad      = Output(Bool())
    val lsIsStore     = Output(Bool())
    val lsAck         = Input(Valid(UInt(log2Ceil(nSec).W)))
 
    val axi = new AXI3MasterIO
    val redirectInfo    = Flipped(ValidIO(new redirectInfoToModule))
  })
 
  // ===== Primary 实例化 =====
  val primaries = Seq.tabulate(nPrim)(i => Module(new MSHREntry))
 
  // ===== LoadStore 表项 =====
  val lsValid     = RegInit(VecInit(Seq.fill(nSec)(false.B)))
  val lsReadyReg  = RegInit(VecInit(Seq.fill(nSec)(false.B)))
  val lsPaddr     = RegInit(VecInit(Seq.fill(nSec)(0.U(XLEN.W))))
  val lsLqIdx     = RegInit(VecInit(Seq.fill(nSec)(0.U(log2Ceil(LqSize).W))))
  val lsSqIdx     = RegInit(VecInit(Seq.fill(nSec)(0.U(log2Ceil(SqSize).W))))
  val lsRobIdx    = RegInit(VecInit(Seq.fill(nSec)(0.U.asTypeOf(new RobPtr(RobSize)))))
  val lsLsuOp     = RegInit(VecInit(Seq.fill(nSec)(0.U(LsuOp.width.W))))
  val lsStoreData = RegInit(VecInit(Seq.fill(nSec)(0.U(XLEN.W))))
  val lsIsLoad    = RegInit(VecInit(Seq.fill(nSec)(false.B)))
  val lsIsStore   = RegInit(VecInit(Seq.fill(nSec)(false.B)))
  val lsPrimaryId = RegInit(VecInit(Seq.fill(nSec)(0.U(1.W))))
  val lsIsUncache = RegInit(VecInit(Seq.fill(nSec)(false.B)))
  val lsFlushed   = RegInit(VecInit(Seq.fill(nSec)(false.B)))
 
  // ===== 探针 =====
  val reqIsUncache  = !io.missReq.bits.cacheable
 
  val blockMatchVec = primaries.map(p => p.io.busy && !p.io.isUncache && p.io.blockAddr === io.probeBlockAddr && !reqIsUncache)
  io.probeMatch  := VecInit(blockMatchVec).asUInt.orR
  io.isFirstMiss := !VecInit(blockMatchVec).asUInt.orR
  io.matchPrimId := PriorityMux(blockMatchVec.zipWithIndex.map { case (m, i) => m -> i.U })
 
  io.hasStore := VecInit((0 until nSec).map(i => lsValid(i) && lsIsStore(i) && !lsFlushed(i))).asUInt.orR
  io.idle := !VecInit(primaries.map(_.io.busy)).asUInt.orR && !lsValid.asUInt.orR
 
  // ===== 请求分配逻辑 =====
  val reqBlockAddr  = io.missReq.bits.paddr(31, blockOffBits)
  val reqSetIdx     = io.missReq.bits.paddr(blockOffBits + idxBitsD - 1, blockOffBits)
 
  val isFirstMissReq = !VecInit(blockMatchVec).asUInt.orR
  val matchPrimIdReq = PriorityMux(blockMatchVec.zipWithIndex.map { case (m, i) => m -> i.U })
 
  val freePrimMask = VecInit(primaries.map(_.io.canAccept)).asUInt
  val hasFreePrim  = freePrimMask.orR
  val allocPrimId  = PriorityEncoder(freePrimMask)
 
  val freeSecMask = VecInit((0 until nSec).map(i => !lsValid(i))).asUInt
  val hasFreeSec  = freeSecMask.orR
  val allocSecIdx = PriorityEncoder(freeSecMask)
 
  val setConflictVec = primaries.map(p =>
    p.io.busy && p.io.setIdx === reqSetIdx && p.io.blockAddr =/= reqBlockAddr
  )
  val setConflict = VecInit(setConflictVec).asUInt.orR
 
  val canAllocFirst  = hasFreePrim && hasFreeSec && !setConflict
  val canAllocMerge  = hasFreeSec
  // Uncache requests still need a secondary LS slot to carry completion
  // metadata back into the DCache replay path.
  val canAllocUncache = hasFreePrim && hasFreeSec
 
  val canAllocReq = Mux(reqIsUncache, canAllocUncache,
                    Mux(isFirstMissReq, canAllocFirst, canAllocMerge))
  io.canAlloc      := canAllocReq
  io.missReq.ready := canAllocReq
 
  // ===== Primary 连接 =====
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.id := i.U
 
    val lsAllDone = !VecInit((0 until nSec).map(j =>
      lsValid(j) && lsPrimaryId(j) === i.U && !lsFlushed(j)
    )).asUInt.orR
    prim.io.release := prim.io.done && lsAllDone
 
    prim.io.refillWriteAck := io.refillWriteAck.valid && io.refillWriteAck.bits === i.U
 
    val allocThisPrim = isFirstMissReq && allocPrimId === i.U
    val allocUncacheThis = reqIsUncache && allocPrimId === i.U
    prim.io.req.valid := io.missReq.fire && (allocThisPrim || allocUncacheThis)
    prim.io.req.bits.paddr       := io.missReq.bits.paddr
    prim.io.req.bits.reqType     := Mux(reqIsUncache,
      Mux(io.missReq.bits.isLoad, MshrReqType.uncacheRead, MshrReqType.uncacheWrite),
      MshrReqType.cacheable)
    prim.io.req.bits.victimWay   := io.missReq.bits.victimWay
    prim.io.req.bits.victimDirty := io.missReq.bits.victimDirty
    prim.io.req.bits.victimTag   := io.missReq.bits.victimTag
    prim.io.req.bits.victimData  := io.missReq.bits.victimData
    prim.io.req.bits.storeData   := io.missReq.bits.storeData
    prim.io.req.bits.lsuOp       := io.missReq.bits.lsuOp
  }
 
  // ===== LS 表项分配 =====
  when(io.missReq.fire) {
    val idx = allocSecIdx
    lsValid(idx)     := true.B
    lsReadyReg(idx)  := false.B
    lsPaddr(idx)     := io.missReq.bits.paddr
    lsLqIdx(idx)     := io.missReq.bits.lqIdx
    lsSqIdx(idx)     := io.missReq.bits.sqIdx
    lsRobIdx(idx)    := io.missReq.bits.robIdx
    lsLsuOp(idx)     := io.missReq.bits.lsuOp
    lsStoreData(idx) := io.missReq.bits.storeData
    lsIsLoad(idx)    := io.missReq.bits.isLoad
    lsIsStore(idx)   := io.missReq.bits.isStore
    lsIsUncache(idx) := reqIsUncache
    lsFlushed(idx)   := false.B
 
    val primId = Mux(isFirstMissReq, allocPrimId, matchPrimIdReq)
    lsPrimaryId(idx) := primId
 
    val fastDone = VecInit(primaries.zipWithIndex.map { case (p, pi) =>
      p.io.done && pi.U === primId
    }).asUInt.orR
    when(fastDone) { lsReadyReg(idx) := true.B }
  }
 
  // ===== Wakeup =====
  for (i <- 0 until nPrim) {
    val prevDone = RegNext(primaries(i).io.done, false.B)
    when(primaries(i).io.done && !prevDone) {
      for (j <- 0 until nSec) {
        when(lsValid(j) && lsPrimaryId(j) === i.U && !lsFlushed(j)) {
          lsReadyReg(j) := true.B
        }
      }
    }
  }
 
  // ===== Redirect =====
  when(io.redirectInfo.valid && io.redirectInfo.bits.doRedirect) {
    for (j <- 0 until nSec) {
      when(lsValid(j) && lsIsLoad(j) && !lsIsStore(j) && !lsFlushed(j)) {
        when(lsRobIdx(j).isAfter(io.redirectInfo.bits.robIdx)) {
          lsFlushed(j) := true.B
        }
      }
    }
  }
 
  // 释放 flushed 表项
  for (j <- 0 until nSec) {
    when(lsValid(j) && lsFlushed(j)) {
      lsValid(j)    := false.B
      lsReadyReg(j) := false.B
      lsFlushed(j)  := false.B
    }
  }
 
  // ===== LS Ack =====
  when(io.lsAck.valid) {
    val idx = io.lsAck.bits
    lsValid(idx)    := false.B
    lsReadyReg(idx) := false.B
  }
 
  // ===== LS Ready 选择（Store 优先） =====
  val readyStores = Wire(Vec(nSec, Bool()))
  val readyLoads  = Wire(Vec(nSec, Bool()))
  for (j <- 0 until nSec) {
    readyStores(j) := lsValid(j) && lsReadyReg(j) && lsIsStore(j) && !lsFlushed(j)
    readyLoads(j)  := lsValid(j) && lsReadyReg(j) && !lsIsStore(j) && !lsFlushed(j)
  }
  val hasReadyStore = readyStores.asUInt.orR
  val hasReadyLs    = VecInit((0 until nSec).map(j =>

//      val isFlushedByRedirect = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect &&
//  lsIsLoad(j) && !lsIsStore(j) && lsRobIdx(j).isAfter(io.redirectInfo.bits.robIdx)

    lsValid(j) && lsReadyReg(j) && !lsFlushed(j) && !(io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
    /* && lsIsLoad(j) && !lsIsStore(j) && lsRobIdx(j).isAfter(io.redirectInfo.bits.robIdx) */)


  )).asUInt.orR
  val selectedLsIdx = Mux(hasReadyStore, PriorityEncoder(readyStores), PriorityEncoder(readyLoads))
 
  io.lsReady       := hasReadyLs
  io.lsIdx         := selectedLsIdx
  io.lsIsUncache   := lsIsUncache(selectedLsIdx)
  io.lsUncacheData := VecInit(primaries.map(_.io.uncacheData))(lsPrimaryId(selectedLsIdx))
  io.lsPaddr       := lsPaddr(selectedLsIdx)
  io.lsLqIdx       := lsLqIdx(selectedLsIdx)
  io.lsSqIdx       := lsSqIdx(selectedLsIdx)
  io.lsRobIdx      := lsRobIdx(selectedLsIdx)
  io.lsLsuOp       := lsLsuOp(selectedLsIdx)
  io.lsStoreData   := lsStoreData(selectedLsIdx)
  io.lsIsLoad      := lsIsLoad(selectedLsIdx)
  io.lsIsStore     := lsIsStore(selectedLsIdx)
 
  // ===== Refill Write =====
  val refillWritePrimVec = VecInit(primaries.map(_.io.refillWriteReq))
  val hasRefillWrite     = refillWritePrimVec.asUInt.orR
  val refillWritePrimSel = PriorityEncoder(refillWritePrimVec)
 
  val primSetIdxVec    = VecInit(primaries.map(_.io.setIdx))
  val primVictimWayVec = VecInit(primaries.map(_.io.mshrVictimWay))
  val primRefillTagVec = VecInit(primaries.map(_.io.refillTag))
  val primRefillDataVec = VecInit(primaries.map(_.io.refillData))
 
  io.refillWriteReq.valid := hasRefillWrite
  io.refillWriteReq.bits.idx  := primSetIdxVec(refillWritePrimSel)
  io.refillWriteReq.bits.way  := primVictimWayVec(refillWritePrimSel)
  io.refillWriteReq.bits.tag  := primRefillTagVec(refillWritePrimSel)
  io.refillWriteReq.bits.data := primRefillDataVec(refillWritePrimSel)
  io.refillWritePrimId := refillWritePrimSel
 
  // ══════════════════════════════════════════════════════════════
  //  AXI AR 通道：锁定仲裁
  //
  //  一旦某个 Primary 获得通道权，锁定直到握手完成或该 Primary 撤下 valid。
  //  优先级：Primary0 > Primary1（与原 PriorityMux 一致）
  //  防止高优先级请求抢占正在等待 arready 的低优先级请求。
  // ══════════════════════════════════════════════════════════════
  val arLocked = RegInit(false.B)
  val arWinner = RegInit(0.U(1.W))   // 0=Primary0, 1=Primary1
 
  val arValids = VecInit(primaries.map(_.io.ar.valid))
  val arAnyValid = arValids.asUInt.orR
 
  // 当前选择：锁定时用寄存器，未锁定时按优先级仲裁（P0 > P1）
  val arSel = Mux(arLocked, arWinner,
               Mux(arValids(0), 0.U, Mux(arValids(1), 1.U, 0.U)))
  val arSelOH = UIntToOH(arSel, nPrim)
 
  // 输出 valid：选中 Primary 的 valid
  val arOutValid = arValids(arSel)
 
  // 握手检测
  val arHandshake = arOutValid && io.axi.ar.arready
 
  // 锁定管理
  when(!arLocked) {
    when(arAnyValid && !arHandshake) {
      arLocked := true.B
      arWinner := arSel
    }
  }.otherwise {
    when(arHandshake){ //} || !arOutValid) {
      arLocked := false.B
    }
  }
 
  // AR 通道输出路由
  io.axi.ar.data.arid    := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arid))
  io.axi.ar.data.araddr  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.araddr))
  io.axi.ar.data.arlen   := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arlen))
  io.axi.ar.data.arsize  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arsize))
  io.axi.ar.data.arburst := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arburst))
  io.axi.ar.data.arlock  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arlock))
  io.axi.ar.data.arcache := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arcache))
  io.axi.ar.data.arprot  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arprot))
  io.axi.ar.data.arvalid := arOutValid
 
  // arready 只传给胜者
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.ar.ready := io.axi.ar.arready && arSelOH(i)
  }
 
  // ===== AXI R 路由 =====
  val rId   = io.axi.r.data.rid(0)
  val rIdOH = UIntToOH(rId, nPrim)
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.r.valid := io.axi.r.data.rvalid && rIdOH(i)
    prim.io.r.bits  := io.axi.r.data
  }
  io.axi.r.rready := Mux1H(rIdOH, primaries.map(_.io.r.ready))
 
  // ══════════════════════════════════════════════════════════════
  //  AXI AW 通道：锁定仲裁（同 AR）
  // ══════════════════════════════════════════════════════════════
  val awLocked = RegInit(false.B)
  val awWinner = RegInit(0.U(1.W))
 
  val awValids = VecInit(primaries.map(_.io.aw.valid))
  val awAnyValid = awValids.asUInt.orR
 
  val awSel = Mux(awLocked, awWinner,
               Mux(awValids(0), 0.U, Mux(awValids(1), 1.U, 0.U)))
  val awSelOH = UIntToOH(awSel, nPrim)
 
  val awOutValid = awValids(awSel)
  val awHandshake = awOutValid && io.axi.aw.awready
 
  when(!awLocked) {
    when(awAnyValid && !awHandshake) {
      awLocked := true.B
      awWinner := awSel
    }
  }.otherwise {
    when(awHandshake) {// || !awOutValid) {
      awLocked := false.B
    }
  }
 
  io.axi.aw.data.awid    := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awid))
  io.axi.aw.data.awaddr  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awaddr))
  io.axi.aw.data.awlen   := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awlen))
  io.axi.aw.data.awsize  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awsize))
  io.axi.aw.data.awburst := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awburst))
  io.axi.aw.data.awlock  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awlock))
  io.axi.aw.data.awcache := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awcache))
  io.axi.aw.data.awprot  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awprot))
  io.axi.aw.data.awvalid := awOutValid
 
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.aw.ready := io.axi.aw.awready && awSelOH(i)
  }
 
  // ══════════════════════════════════════════════════════════════
  //  AXI W 通道：Burst 级锁定仲裁
  //
  //  W burst 必须连续输出，中途不可切换到其他 Primary。
  //  锁定持续到 wlast 握手完成或该 Primary 撤下 wvalid。
  // ══════════════════════════════════════════════════════════════
  val wLocked = RegInit(false.B)
  val wWinner = RegInit(0.U(1.W))
 
  val wValids = VecInit(primaries.map(_.io.w.valid))
  val wAnyValid = wValids.asUInt.orR
 
  val wSel = Mux(wLocked, wWinner,
              Mux(wValids(0), 0.U, Mux(wValids(1), 1.U, 0.U)))
  val wSelOH = UIntToOH(wSel, nPrim)
 
  val wOutValid = wValids(wSel)
  val wHandshake     = wOutValid && io.axi.w.wready
  val wLastHandshake = wHandshake && Mux1H(wSelOH, primaries.map(_.io.w.bits.wlast))
 
  when(!wLocked) {
    when(wAnyValid && !wLastHandshake) {
      wLocked := true.B
      wWinner := wSel
    }
  }.otherwise {
    when(wLastHandshake ){ //|| !wOutValid) {
      wLocked := false.B
    }
  }
 
  io.axi.w.data.wid    := Mux1H(wSelOH, primaries.map(_.io.w.bits.wid))
  io.axi.w.data.wdata  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wdata))
  io.axi.w.data.wstrb  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wstrb))
  io.axi.w.data.wlast  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wlast))
  io.axi.w.data.wvalid := wOutValid
 
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.w.ready := io.axi.w.wready && wSelOH(i)
  }
 
  // ===== AXI B 路由 =====
  val bId   = io.axi.b.data.bid(0)
  val bIdOH = UIntToOH(bId, nPrim)
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.b.valid := io.axi.b.data.bvalid && bIdOH(i)
    prim.io.b.bits  := io.axi.b.data
  }
  io.axi.b.bready := Mux1H(bIdOH, primaries.map(_.io.b.ready))
}
