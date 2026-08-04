package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.config._
import nscscc.backend.decode.LsuOp

class Mmu(implicit p: Parameters) extends NSModule {
  val io = IO(new MmuIoBundle)

  val tlb = Module(new Tlb)

  private def emptyError(): MmuTransError = 0.U.asTypeOf(new MmuTransError)
  private def emptyDataError(): DcacheMmuTransError =
    0.U.asTypeOf(new DcacheMmuTransError)

  private def hitDmw(dmw: UInt, vaddr: UInt, plv: UInt): Bool = {
    val plvHit = (plv === 0.U && dmw(0)) || (plv === 3.U && dmw(3))
    val segHit = dmw(31, 29) === vaddr(31, 29)
    plvHit && segHit
  }

  private def dmwPaddr(dmw: UInt, vaddr: UInt): UInt = {
    Cat(dmw(27, 25), vaddr(28, 0))
  }

  private def isCacheable(mat: UInt): Bool = mat === 1.U

  private def tlbPaddr(resp: TlbSearchResp): UInt = {
    Mux(resp.ps === 12.U,
      Cat(resp.ppn, resp.offset(11, 0)),// small page
      Cat(resp.ppn(ppnLen - 1, 10), resp.offset)// big page
    )
  }

  val isPaging = io.fromCsr.pgda === 2.U
  val isDirect = io.fromCsr.pgda === 1.U

  // iFetch Port
  val ifetchPort = {
    val sIdle :: sBusy :: Nil = Enum(2)

    // a mutex lock
    // req.fire - lock, resp.fire - unlock
    val state = RegInit(sIdle)

    val isIdle = state === sIdle
    val isBusy = state === sBusy

    val reqBuffer = RegInit(0.U.asTypeOf(new IcacheToMmu))
    val reqValid  = RegInit(false.B)

    val flush = io.fromIcacheFlush || tlb.io.flush

    when (flush) {
      state := sIdle
      reqValid := false.B
    }.otherwise {
      when (io.fromIcache.fire) {
        reqBuffer := io.fromIcache.bits
        reqValid  := true.B
        state := sBusy
      }.elsewhen(io.toIcache.fire) {
        reqValid  := false.B
        state := sIdle
      }
    }

    val reqVaddr = reqBuffer.vaddr
    val nextVaddr = io.fromIcache.bits.vaddr

    // DMW
    val dmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, reqVaddr, io.fromCsr.plv)
    val dmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, reqVaddr, io.fromCsr.plv)
    val dmwHit  = dmw0Hit || dmw1Hit

    val addrMisaligned = reqVaddr(1, 0) =/= 0.U

    val nextDmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, nextVaddr, io.fromCsr.plv)
    val nextDmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, nextVaddr, io.fromCsr.plv)
    val nextNeedTlb = isPaging && !(nextDmw0Hit || nextDmw1Hit)
    val nextAddrMisaligned = nextVaddr(1, 0) =/= 0.U
    val nextNeedSearch = nextNeedTlb && !nextAddrMisaligned

    val directResp = WireDefault(0.U.asTypeOf(new MmuToIcache))
    directResp.paddr := reqVaddr

    // TODO: uncomment
    directResp.cacheable := isDirect && isCacheable(io.fromCsr.datf)
    //directResp.cacheable := true.B
    directResp.error     := emptyError()
    directResp.error.excpAdef := addrMisaligned
    directResp.hasError  := directResp.error.asUInt.orR

    val dmwResp = WireDefault(0.U.asTypeOf(new MmuToIcache))
    dmwResp.paddr  := Mux(dmw0Hit, dmwPaddr(io.fromCsr.dmw0, reqVaddr),
                      Mux(dmw1Hit, dmwPaddr(io.fromCsr.dmw1, reqVaddr), 0.U(XLEN.W)))

    // TODO: uncomment
    dmwResp.cacheable := (dmw0Hit && isCacheable(io.fromCsr.dmw0(5, 4))) || (dmw1Hit && isCacheable(io.fromCsr.dmw1(5, 4)))
    //dmwResp.cacheable := true.B
    dmwResp.error     := emptyError()
    dmwResp.error.excpAdef := addrMisaligned
    dmwResp.hasError  := dmwResp.error.asUInt.orR

    val tlbReq  = tlb.io.search(0).req
    val tlbResp = tlb.io.search(0).resp

    // 保留单请求锁，但允许响应fire的同一拍接收下一条请求。
    val respFire     = io.toIcache.fire
    val canAcceptReq = (isIdle || respFire) && !flush

    tlbReq.valid        := canAcceptReq && io.fromIcache.valid && nextNeedSearch
    tlbReq.bits.vppn    := nextVaddr(31, 13)
    tlbReq.bits.vaBit12 := nextVaddr(12)
    tlbReq.bits.offset  := nextVaddr(21,  0)
    tlbReq.bits.asid    := io.fromCsr.asid

    io.fromIcache.ready := canAcceptReq && (!nextNeedSearch || tlbReq.ready)

    tlbResp.ready := isBusy && io.toIcache.ready && !flush
    tlb.io.search(0).flush := flush

    // Response
    /* TLB <> MMU <> ICACHE */
    io.toIcache.valid := isBusy && (addrMisaligned || isDirect || tlbResp.valid || dmwHit) && !flush
    val resp       = tlbResp.bits
    val tlbError   = WireDefault(emptyError())
    val tlbOut     = WireDefault(0.U.asTypeOf(new MmuToIcache))

    tlbError.excpTlbRefill := !resp.found
    tlbError.excpTlbPif    := resp.found && !resp.v
    tlbError.excpTlbPpi    := resp.found && resp.v && (io.fromCsr.plv > resp.plv)
    tlbError.excpAdef      := addrMisaligned

    tlbOut.paddr        := tlbPaddr(resp)
    tlbOut.cacheable    := isCacheable(resp.mat)
    tlbOut.error        := tlbError
    tlbOut.hasError     := tlbError.asUInt.orR

    io.toIcache.bits  := Mux(isDirect, directResp,
                         Mux(dmwHit, dmwResp, tlbOut))

    diffDontTouch(dmwHit)
    diffDontTouch(isPaging)
    diffDontTouch(isDirect)
    diffDontTouch(directResp)
    diffDontTouch(io.toIcache)
    diffDontTouch(io.fromIcache)
  }

  // Mem Port
  val memPort = {
    val sIdle :: sBusy :: Nil = Enum(2)

    val state = RegInit(sIdle)
    val isIdle = state === sIdle
    val isBusy = state === sBusy

    val reqBuffer = RegInit(0.U.asTypeOf(new SqToMmuReq))
    val reqValid  = RegInit(false.B)

    val flush = io.fromMemFlush || tlb.io.flush

    when (flush) {
      state := sIdle
      reqValid := false.B
    }.otherwise {
      when (io.fromMem.fire) {
        reqBuffer := io.fromMem.bits
        reqValid  := true.B
        state := sBusy
      }.elsewhen(io.toMem.fire) {
        reqValid  := false.B
        state := sIdle
      }
    }

    def memAddrMisaligned(vaddr: UInt, lsuOp: UInt): Bool = {
      val halfAccess = lsuOp === LsuOp.ldh || lsuOp === LsuOp.ldhu || lsuOp === LsuOp.sth
      val wordAccess = lsuOp === LsuOp.ldw || lsuOp === LsuOp.stw
      Mux(lsuOp === LsuOp.cacop, false.B,
        (halfAccess && vaddr(0)) || (wordAccess && (vaddr(1, 0) =/= 0.U)))
    }

    val reqVaddr = reqBuffer.vaddr
    val reqLsuOp = reqBuffer.lsuOp
    val nextVaddr = io.fromMem.bits.vaddr
    val nextLsuOp = io.fromMem.bits.lsuOp

    val dmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, reqVaddr, io.fromCsr.plv)
    val dmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, reqVaddr, io.fromCsr.plv)
    val dmwHit  = dmw0Hit || dmw1Hit

    val addrMisaligned = memAddrMisaligned(reqVaddr, reqLsuOp)

    val nextDmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, nextVaddr, io.fromCsr.plv)
    val nextDmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, nextVaddr, io.fromCsr.plv)
    val nextNeedTlb = isPaging && !(nextDmw0Hit || nextDmw1Hit)
    val nextAddrMisaligned = memAddrMisaligned(nextVaddr, nextLsuOp)
    val nextNeedSearch = nextNeedTlb && !nextAddrMisaligned

    val directResp = WireDefault(0.U.asTypeOf(new MmuToSqResp))
    directResp.paddr := reqVaddr
    // TODO: uncomment
    // 我肯定是改了的吧！！！！！！
    directResp.cacheable := isDirect && isCacheable(io.fromCsr.datm)
    //directResp.cacheable := true.B
    directResp.error     := emptyDataError()
    directResp.error.excpAle := addrMisaligned
    directResp.hasError  := directResp.error.asUInt.orR

    val dmwResp = WireDefault(0.U.asTypeOf(new MmuToSqResp))
    dmwResp.paddr := Mux(dmw0Hit, dmwPaddr(io.fromCsr.dmw0, reqVaddr),
                    Mux(dmw1Hit, dmwPaddr(io.fromCsr.dmw1, reqVaddr), 0.U(XLEN.W)))
    // TODO: uncomment
    dmwResp.cacheable := (dmw0Hit && isCacheable(io.fromCsr.dmw0(5, 4))) || (dmw1Hit && isCacheable(io.fromCsr.dmw1(5, 4)))
    //dmwResp.cacheable := true.B
    dmwResp.error     := emptyDataError()
    dmwResp.error.excpAle := addrMisaligned
    dmwResp.hasError  := dmwResp.error.asUInt.orR

    val tlbReq  = tlb.io.search(1).req
    val tlbResp = tlb.io.search(1).resp

    val respFire     = io.toMem.fire
    val canAcceptReq = (isIdle || respFire) && !flush

    tlbReq.valid        := canAcceptReq && io.fromMem.valid && nextNeedSearch
    tlbReq.bits.vppn    := nextVaddr(31, 13)
    tlbReq.bits.vaBit12 := nextVaddr(12)
    tlbReq.bits.offset  := nextVaddr(21, 0)
    tlbReq.bits.asid    := io.fromCsr.asid

    io.fromMem.ready := canAcceptReq && (!nextNeedSearch || tlbReq.ready)

    tlbResp.ready := isBusy && io.toMem.ready && !flush
    tlb.io.search(1).flush := flush

    io.toMem.valid := isBusy && (addrMisaligned || isDirect || tlbResp.valid || dmwHit) && !flush

    val resp     = tlbResp.bits
    val tlbError = WireDefault(emptyDataError())
    val tlbOut   = WireDefault(0.U.asTypeOf(new MmuToSqResp))

    val isStore = reqLsuOp === LsuOp.stb ||
      reqLsuOp === LsuOp.sth || reqLsuOp === LsuOp.stw
    val pageInvalid = resp.found && !resp.v
    val privilegeError = resp.found && resp.v &&
      (io.fromCsr.plv > resp.plv)

    tlbError.excpTlbRefill := !resp.found
    tlbError.excpTlbPil    := pageInvalid && !isStore
    tlbError.excpTlbPis    := pageInvalid && isStore
    tlbError.excpTlbPpi    := privilegeError
    tlbError.excpTlbPme    := resp.found && resp.v &&
      !privilegeError && isStore && !resp.d
    tlbError.excpAle       := addrMisaligned

    tlbOut.paddr     := tlbPaddr(resp)
    tlbOut.cacheable := isCacheable(resp.mat)
    tlbOut.error     := tlbError
    tlbOut.hasError  := tlbError.asUInt.orR

    io.toMem.bits := Mux(isDirect, directResp,
                     Mux(dmwHit, dmwResp, tlbOut))

    diffDontTouch(dmwHit)
    diffDontTouch(io.toMem)
    diffDontTouch(io.fromMem)
  }

  for (i <- 2 until nrSearchPort) {
    tlb.io.search(i).req.valid  := false.B
    tlb.io.search(i).req.bits   := DontCare
    tlb.io.search(i).resp.ready := true.B
    tlb.io.search(i).flush      := false.B
  }

  tlb.io.instr := io.tlb.instr
  tlb.io.csr   := io.tlb.csr
  io.tlb.cmd   := tlb.io.cmd
  io.tlb.read  := tlb.io.read
  io.tlb.fillIdx := tlb.io.fillIdx
}
