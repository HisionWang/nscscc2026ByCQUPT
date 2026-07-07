package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._

// ================================================================
//  MSHR 顶层：包含 Primary × 2 + Secondary × 4 + 仲裁逻辑
// ================================================================
class DCacheMSHRFile(implicit p: Parameters) extends NSModule {
  val nPrim  = 2
  val nSec   = 4
  val primIdBits = 1
 
  val io = IO(new Bundle {
    // 流水线 S2 miss 请求
    val req = Flipped(Decoupled(new MissReq))
 
    // MSHR 探针（流水线 S1 使用）
    val probeBlockAddr     = Input(UInt((tagBits + idxBits).W))
    val probeSetIdx        = Input(UInt(idxBits.W))
    val probeHitWay        = Input(UInt(wayBits.W))
    val probeBlockMatch    = Output(Bool())     // 同 block 有活跃 primary
    val probeVictimConflict = Output(Bool())    // hit way 是某 primary 的 victim
    val hasStore           = Output(Bool())     // 二级表项中有 store
    val hasStoreEntering   = Output(Bool())     // 同周期有 store 进入
 
    // Replay
    val replay = Decoupled(new ReplayReq)
 
    // Array 访问
    val arrayReadReq       = Output(Valid(UInt(idxBits.W)))
    val arrayReadResp      = Input(new DCacheArrayReadData)
    val arrayReadRespValid = Input(Bool())
    val arrayWrite         = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val dirty = Bool()
      val data  = UInt((blockBytes * 8).W)
      val wen   = Bool()
    })
    val metaWrite = Output(new Bundle {
      val valid     = Bool()
      val idx       = UInt(idxBits.W)
      val way       = UInt(wayBits.W)
      val metaValid = Bool()
      val dirty     = Bool()
      val tag       = UInt(tagBits.W)
    })
    val replacerTouch = Output(Valid(new Bundle {
      val idx = UInt(idxBits.W)
      val way = UInt(wayBits.W)
    }))
 
    val mshrAccessing = Output(Bool())  // replace_find + invalidate
    val mshrWriting   = Output(Bool())  // refill_write
 
    // Uncache 响应
    val uncacheLoadResp = Decoupled(new Bundle {
      val lqIdx = UInt(log2Ceil(LqSize).W)
      val data  = UInt(XLEN.W)
    })
    val uncacheStoreAck = Decoupled(new Bundle {
      val sqIdx = UInt(log2Ceil(SqSize).W)
    })
 
    // AXI
    val axi = new AXI3MasterIO
 
    // Redirect
    val redirect = Input(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
 
    val full = Output(Bool())
  })
 
  // ===== 实例化 =====
  val primaries   = Seq.tabulate(nPrim)(i => Module(new PrimaryMSHREntry))
  val secondaries = Seq.tabulate(nSec)(i => Module(new SecondaryMSHREntry))
 
  // ===== MSHR 探针 =====
  // Block 匹配：有 primary 正在处理同一 block
  val blockMatchVec = primaries.map(p => p.io.busy && p.io.blockAddr === io.probeBlockAddr)
  io.probeBlockMatch := VecInit(blockMatchVec).asUInt.orR
 
  // Victim 冲突：hit way 等于某 primary 的 victim way（同 set）
  val victimConflictVec = primaries.map(p =>
    p.io.busy && p.io.setIdx === io.probeSetIdx && p.io.mshrVictimWay === io.probeHitWay
  )
  io.probeVictimConflict := VecInit(victimConflictVec).asUInt.orR
 
  // ===== Store 排序 =====
  val secHasStore = VecInit(secondaries.map(s => s.io.busy && s.io.isStore)).asUInt.orR
  io.hasStore := RegNext(secHasStore)
 
  // ===== 请求分配逻辑（MissArbiter） =====
  val reqBlockAddr = io.req.bits.paddr(31, blockOffBits)
  val reqSetIdx    = io.req.bits.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val reqIsStore   = io.req.bits.isStore
  val reqIsUncache = !io.req.bits.cacheable
 
  // 查找匹配的 primary（同 block）
  val matchPrimId = PriorityMux(blockMatchVec.zipWithIndex.map { case (m, i) => m -> i.U })
  val isFirstMiss = !VecInit(blockMatchVec).asUInt.orR
 
  // 空闲 primary
  val freePrimMask = VecInit(primaries.map(_.io.canAccept)).asUInt
  val hasFreePrim  = freePrimMask.orR
  val allocPrimId  = PriorityEncoder(freePrimMask)
 
  // 空闲 secondary
  val freeSecMask = VecInit(secondaries.map(s => !s.io.busy)).asUInt
  val hasFreeSec  = freeSecMask.orR
  val allocSecIdx = PriorityEncoder(freeSecMask)
 
  // Set 冲突：有 primary 正在处理同 set（但不同 block）
  val setConflictVec = primaries.map(p =>
    p.io.busy && p.io.setIdx === reqSetIdx && p.io.blockAddr =/= reqBlockAddr
  )
  val setConflict = VecInit(setConflictVec).asUInt.orR
 
  // Store 排序：MSHR 中已有 store 时拒绝新 store
  val storeBlocked = io.hasStore && reqIsStore
 
  // 同周期 store 进入转发
  val storeEntering = io.req.valid && reqIsStore && !reqIsUncache
  io.hasStoreEntering := storeEntering
 
  // 分配条件
  // - 首次 miss：需要空闲 primary + 空闲 secondary
  // - 非首次 miss（合并）：只需空闲 secondary
  // - Uncache：只需空闲 primary
  val canAllocFirst    = hasFreePrim && hasFreeSec && !setConflict && !storeBlocked
  val canAllocMerge    = hasFreeSec && !storeBlocked
  val canAllocUncache  = hasFreePrim && !storeBlocked
 
  val canAlloc = Mux(reqIsUncache, canAllocUncache,
                Mux(isFirstMiss, canAllocFirst, canAllocMerge))
 
  io.req.ready := canAlloc
  io.full := !hasFreeSec && (!hasFreePrim || !isFirstMiss)
 
  // ===== Primary 连接 =====
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.id       := i.U
    prim.io.redirect := io.redirect
 
    // 请求：仅首次 miss 或 uncache 分配 primary
    val allocThisPrim = isFirstMiss && allocPrimId === i.U
    val allocUncacheThis = reqIsUncache && allocPrimId === i.U
    prim.io.req.valid := io.req.valid && (allocThisPrim || allocUncacheThis) && canAlloc
    prim.io.req.bits.paddr     := io.req.bits.paddr
    prim.io.req.bits.victimWay := io.req.bits.victimWay
    prim.io.req.bits.reqType   := Mux(reqIsUncache,
      Mux(io.req.bits.isLoad, MshrReqType.uncacheRead, MshrReqType.uncacheWrite),
      Mux(io.req.bits.isLoad, MshrReqType.refillLoad, MshrReqType.refillStore)
    )
 
    // Array 读取
    prim.io.arrayReadResp      := io.arrayReadResp
    prim.io.arrayReadRespValid := io.arrayReadRespValid
    prim.io.victimWayIn        := prim.io.mshrVictimWay
 
    // Uncache 响应信息
    prim.io.uncacheLqIdx     := io.req.bits.lqIdx
    prim.io.uncacheSqIdx     := io.req.bits.sqIdx
    prim.io.uncacheStoreData := io.req.bits.storeData
    prim.io.uncacheLsuOp     := io.req.bits.lsuOp
  }
 
  // ===== Secondary 连接 =====
  for ((sec, j) <- secondaries.zipWithIndex) {
    sec.io.redirect := io.redirect
 
    // 请求：所有 miss（包括首次 miss 也分配一个 secondary）
    val allocThisSec = allocSecIdx === j.U
    val needSec = !reqIsUncache  // uncache 不需要 secondary
    sec.io.req.valid := io.req.valid && allocThisSec && canAlloc && needSec
    sec.io.req.bits.replayReq.paddr     := io.req.bits.paddr
    sec.io.req.bits.replayReq.lqIdx     := io.req.bits.lqIdx
    sec.io.req.bits.replayReq.sqIdx     := io.req.bits.sqIdx
    sec.io.req.bits.replayReq.robIdx    := io.req.bits.robIdx
    sec.io.req.bits.replayReq.lsuOp     := io.req.bits.lsuOp
    sec.io.req.bits.replayReq.storeData := io.req.bits.storeData
    sec.io.req.bits.replayReq.isLoad    := io.req.bits.isLoad
    sec.io.req.bits.replayReq.isStore   := io.req.bits.isStore
    sec.io.req.bits.primaryId := Mux(isFirstMiss, allocPrimId, matchPrimId)
 
    // 唤醒
    val fetchDoneVec = primaries.map(p => p.io.fetchDone && p.io.fetchDoneBlockAddr === sec.io.blockAddr)
    sec.io.wakeup.valid     := VecInit(fetchDoneVec).asUInt.orR
    sec.io.wakeup.bits      := PriorityMux(fetchDoneVec.zipWithIndex.map { case (v, i) => v -> i.U })
 
    // 快速唤醒：分配同周期 primary 完成
    val fastDoneVec = primaries.map(p =>
      p.io.fetchDone && p.io.fetchDoneBlockAddr === io.req.bits.paddr(31, blockOffBits)
    )
    sec.io.fastWakeup.valid := VecInit(fastDoneVec).asUInt.orR
    sec.io.fastWakeup.bits  := PriorityMux(fastDoneVec.zipWithIndex.map { case (v, i) => v -> i.U })
  }
 
  // ===== AXI AR 仲裁 =====
  val arValids = VecInit(primaries.map(_.io.ar.valid))
  val arSelOH  = PriorityMux(arValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nPrim) })
  val arHasValid = arValids.asUInt.orR
 
  io.axi.ar.data.arid    := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arid))
  io.axi.ar.data.araddr  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.araddr))
  io.axi.ar.data.arlen   := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arlen))
  io.axi.ar.data.arsize  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arsize))
  io.axi.ar.data.arburst := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arburst))
  io.axi.ar.data.arlock  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arlock))
  io.axi.ar.data.arcache := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arcache))
  io.axi.ar.data.arprot  := Mux1H(arSelOH, primaries.map(_.io.ar.bits.arprot))
  io.axi.ar.data.arvalid := arHasValid
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.ar.ready := io.axi.ar.arready && arSelOH(i)
  }
 
  // ===== AXI R 路由（按 ID） =====
  val rId   = io.axi.r.data.rid(0)
  val rIdOH = UIntToOH(rId, nPrim)
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.r.valid := io.axi.r.data.rvalid && rIdOH(i)
    prim.io.r.bits  := io.axi.r.data
  }
  io.axi.r.rready := Mux1H(rIdOH, primaries.map(_.io.r.ready))
 
  // ===== AXI AW 仲裁 =====
  val awValids = VecInit(primaries.map(_.io.aw.valid))
  val awSelOH  = PriorityMux(awValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nPrim) })
  val awHasValid = awValids.asUInt.orR
 
  io.axi.aw.data.awid    := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awid))
  io.axi.aw.data.awaddr  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awaddr))
  io.axi.aw.data.awlen   := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awlen))
  io.axi.aw.data.awsize  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awsize))
  io.axi.aw.data.awburst := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awburst))
  io.axi.aw.data.awlock  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awlock))
  io.axi.aw.data.awcache := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awcache))
  io.axi.aw.data.awprot  := Mux1H(awSelOH, primaries.map(_.io.aw.bits.awprot))
  io.axi.aw.data.awvalid := awHasValid
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.aw.ready := io.axi.aw.awready && awSelOH(i)
  }
 
  // ===== AXI W 仲裁 =====
  val wValids = VecInit(primaries.map(_.io.w.valid))
  val wSelOH  = PriorityMux(wValids.zipWithIndex.map { case (v, i) => v -> UIntToOH(i.U, nPrim) })
  val wHasValid = wValids.asUInt.orR
 
  io.axi.w.data.wid    := Mux1H(wSelOH, primaries.map(_.io.w.bits.wid))
  io.axi.w.data.wdata  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wdata))
  io.axi.w.data.wstrb  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wstrb))
  io.axi.w.data.wlast  := Mux1H(wSelOH, primaries.map(_.io.w.bits.wlast))
  io.axi.w.data.wvalid := wHasValid
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
 
  // ===== Replay 仲裁 =====
  val replayValids = VecInit(secondaries.map(_.io.replay.valid))
  val replaySelOH = PriorityMux(replayValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nSec)
  })
  val replayHasValid = replayValids.asUInt.orR
 
  io.replay.valid := replayHasValid
  io.replay.bits  := Mux1H(replaySelOH, secondaries.map(_.io.replay.bits))
  for ((sec, i) <- secondaries.zipWithIndex) {
    sec.io.replay.ready := io.replay.ready && replaySelOH(i)
  }
 
  // ===== Array Read 仲裁 =====
  // 同一时间最多一个 primary 在 replace_find
  val primReadValids = VecInit(primaries.map(_.io.arrayReadReq.valid))
  val primReadSelOH  = PriorityMux(primReadValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  io.arrayReadReq.valid := 	primReadValids.asUInt.orR
  io.arrayReadReq.bits  := Mux1H(primReadSelOH, primaries.map(_.io.arrayReadReq.bits))
 
  // Array Read Response：路由到对应 primary
  // 用 Reg 记录是哪个 primary 发起的读
  val readPrimId = RegInit(0.U(1.W))
  when(	primReadValids.asUInt.orR) {
    readPrimId := OHToUInt(primReadSelOH)
  }
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.arrayReadResp      := io.arrayReadResp
    prim.io.arrayReadRespValid := io.arrayReadRespValid && readPrimId === i.U
  }
 
  // ===== Array Write 仲裁 =====
  // 同一时间最多一个 primary 在 refill_write
  val primWriteValids = VecInit(primaries.map(p => p.io.arrayWrite.valid))
  val primWriteSelOH  = PriorityMux(primWriteValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  val primWriteHasValid = primWriteValids.asUInt.orR
 
  io.arrayWrite.valid := primWriteHasValid
  io.arrayWrite.idx   := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.idx))
  io.arrayWrite.way   := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.way))
  io.arrayWrite.tag   := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.tag))
  io.arrayWrite.dirty := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.dirty))
  io.arrayWrite.data  := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.data))
  io.arrayWrite.wen   := Mux1H(primWriteSelOH, primaries.map(_.io.arrayWrite.wen))
 
  // ===== Meta Write 仲裁 =====
  val primMetaValids = VecInit(primaries.map(p => p.io.metaWrite.valid))
  val primMetaSelOH  = PriorityMux(primMetaValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  io.metaWrite.valid     := 	primMetaValids.asUInt.orR
  io.metaWrite.idx       := Mux1H(primMetaSelOH, primaries.map(_.io.metaWrite.idx))
  io.metaWrite.way       := Mux1H(primMetaSelOH, primaries.map(_.io.metaWrite.way))
  io.metaWrite.metaValid := Mux1H(primMetaSelOH, primaries.map(_.io.metaWrite.metaValid))
  io.metaWrite.dirty     := Mux1H(primMetaSelOH, primaries.map(_.io.metaWrite.dirty))
  io.metaWrite.tag       := Mux1H(primMetaSelOH, primaries.map(_.io.metaWrite.tag))
 
  // ===== Replacer Touch =====
  val primTouchValids = VecInit(primaries.map(_.io.replacerTouch.valid))
  val primTouchSelOH  = PriorityMux(primTouchValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  io.replacerTouch.valid := 	primTouchValids.asUInt.orR
  io.replacerTouch.bits.idx := Mux1H(primTouchSelOH, primaries.map(_.io.replacerTouch.bits.idx))
  io.replacerTouch.bits.way := Mux1H(primTouchSelOH, primaries.map(_.io.replacerTouch.bits.way))
 
  // ===== 状态输出 =====
  io.mshrAccessing := VecInit(primaries.map(_.io.accessingArray)).asUInt.orR
  io.mshrWriting   := VecInit(primaries.map(_.io.writingArray)).asUInt.orR
 
  // ===== Uncache 响应仲裁 =====
  val ucLoadValids = VecInit(primaries.map(_.io.uncacheLoadResp.valid))
  val ucLoadSelOH  = PriorityMux(ucLoadValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  io.uncacheLoadResp.valid := ucLoadValids.asUInt.orR
  io.uncacheLoadResp.bits.lqIdx := Mux1H(ucLoadSelOH, primaries.map(_.io.uncacheLoadResp.bits.lqIdx))
  io.uncacheLoadResp.bits.data  := Mux1H(ucLoadSelOH, primaries.map(_.io.uncacheLoadResp.bits.data))
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.uncacheLoadResp.ready := io.uncacheLoadResp.ready && ucLoadSelOH(i)
  }
 
  val ucStoreValids = VecInit(primaries.map(_.io.uncacheStoreAck.valid))
  val ucStoreSelOH  = PriorityMux(ucStoreValids.zipWithIndex.map {
    case (v, i) => v -> UIntToOH(i.U, nPrim)
  })
  io.uncacheStoreAck.valid := ucStoreValids.asUInt.orR
  io.uncacheStoreAck.bits.sqIdx := Mux1H(ucStoreSelOH, primaries.map(_.io.uncacheStoreAck.bits.sqIdx))
  for ((prim, i) <- primaries.zipWithIndex) {
    prim.io.uncacheStoreAck.ready := io.uncacheStoreAck.ready && ucStoreSelOH(i)
  }
}