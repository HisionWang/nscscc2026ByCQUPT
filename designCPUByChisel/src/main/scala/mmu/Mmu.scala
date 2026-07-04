package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.config._

/* 只允许iFetch请求
 * pipeline暂时没加上去, 互斥请求, icache握手之后再实现
 * Search port相关变量没有做区分,
 * 暂时想不到什么把不同端口驱动代码分开的简单方法,
 * 添加新的端口会比较丑陋,需要重新命名
 */
class Mmu(implicit p: Parameters) extends NSModule {
  val io = IO(new MmuIoBundle)

  val tlb = Module(new Tlb)

  private def emptyError(): MmuTransError = 0.U.asTypeOf(new MmuTransError)

  private def hitDmw(dmw: UInt, vaddr: UInt, plv: UInt): Bool = {
    val plvHit = (plv === 0.U && dmw(0)) || (plv === 3.U && dmw(3))
    val segHit = dmw(31, 29) === vaddr(31, 29)
    plvHit && segHit
  }

  private def dmwPaddr(dmw: UInt, vaddr: UInt): UInt = {
    Cat(dmw(27, 25), vaddr(28, 0))
  }

  private def isCacheable(mat: UInt): Bool = mat === 1.U

  // a mutex lock
  // req.fire - lock, resp.fire - unlock
  val sIdle :: sBusy :: Nil = Enum(2)
  val state = RegInit(sIdle)

  val isIdle = state === sIdle
  val isBusy = state === sBusy

  val reqBuffer = RegInit(0.U.asTypeOf(new IcacheToMmu))
  val reqValid  = RegInit(false.B)

  when (io.fromIcacheFlush) {
    state := sIdle
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

  val reqVaddr   = Mux(isIdle, io.fromIcache.bits.vaddr, reqBuffer.vaddr)
  val inReqVaddr = io.fromIcache.bits.vaddr

  val isPaging = io.fromCsr.pgda === 2.U
  val isDirect = io.fromCsr.pgda === 1.U

  // DMW
  val dmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, reqVaddr, io.fromCsr.plv)
  val dmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, reqVaddr, io.fromCsr.plv)
  val dmwHit  = dmw0Hit || dmw1Hit
  val needTlb  = isPaging && !dmwHit // DMW miss

  val inDmw0Hit = isPaging && hitDmw(io.fromCsr.dmw0, inReqVaddr, io.fromCsr.plv)
  val inDmw1Hit = isPaging && hitDmw(io.fromCsr.dmw1, inReqVaddr, io.fromCsr.plv)
  val inNeedTlb = isPaging && !(inDmw0Hit || inDmw1Hit)

  val directResp = WireDefault(0.U.asTypeOf(new MmuToIcache))
  directResp.paddr := reqVaddr

  // TODO: uncomment
  //directResp.cacheable := isDirect && isCacheable(io.fromCsr.datf)
  directResp.cacheable := true.B
  directResp.error     := emptyError()
  directResp.hasError  := false.B

  val dmwResp = WireDefault(0.U.asTypeOf(new MmuToIcache))
  dmwResp.paddr  := Mux(dmw0Hit, dmwPaddr(io.fromCsr.dmw0, reqVaddr),
                    Mux(dmw1Hit, dmwPaddr(io.fromCsr.dmw1, reqVaddr), 0.U(XLEN.W)))

  // TODO: uncomment
  //dmwResp.cacheable := (dmw0Hit && isCacheable(io.fromCsr.dmw0(5, 4)))
  //                  || (dmw1Hit && isCacheable(io.fromCsr.dmw1(5, 4)))
  dmwResp.cacheable := true.B
  dmwResp.error     := emptyError()
  dmwResp.hasError  := false.B

  // iFetch Port
  val ifTlbReq  = tlb.io.search(0).req
  val ifTlbResp = tlb.io.search(0).resp

  // 保留单请求锁，但允许响应fire的同一拍接收下一条请求。
  val respFire     = io.toIcache.fire
  val canAcceptReq = (isIdle || respFire) && !io.fromIcacheFlush

  ifTlbReq.valid        := canAcceptReq && io.fromIcache.valid && inNeedTlb
  ifTlbReq.bits.vppn    := inReqVaddr(31, 13)
  ifTlbReq.bits.vaBit12 := inReqVaddr(12)
  ifTlbReq.bits.offset  := inReqVaddr(21,  0)
  ifTlbReq.bits.asid    := io.fromCsr.asid

  io.fromIcache.ready := canAcceptReq && (!inNeedTlb || ifTlbReq.ready)

  ifTlbResp.ready := isBusy && io.toIcache.ready && !io.fromIcacheFlush
  tlb.io.search(0).flush := io.fromIcacheFlush

  // Response
  /* TLB <> MMU <> ICACHE */
  io.toIcache.valid := isBusy && (isDirect || ifTlbResp.valid || dmwHit) && !io.fromIcacheFlush
  val resp       = ifTlbResp.bits
  val tlbError   = WireDefault(emptyError())
  val tlbOut     = WireDefault(0.U.asTypeOf(new MmuToIcache))

  tlbError.excpTlbRefill := !resp.found
  tlbError.excpTlbPif    := resp.found && !resp.v
  tlbError.excpTlbPpi    := resp.found && resp.v && (io.fromCsr.plv > resp.plv)

  tlbOut.paddr        := tlbPaddr(resp)
  // TODO: uncomment
  // tlbOut.cacheable     := isCacheable(resp.mat)
  tlbOut.cacheable    := true.B
  tlbOut.error        := tlbError
  tlbOut.hasError     := tlbError.asUInt.orR

  io.toIcache.bits  := Mux(isDirect, directResp,
                       Mux(dmwHit, dmwResp, tlbOut))

  dontTouch(dmwHit)
  dontTouch(isPaging)
  dontTouch(isDirect)
  dontTouch(directResp)
  dontTouch(io.toIcache)
  dontTouch(io.fromIcache)

  private def tlbPaddr(resp: TlbSearchResp): UInt = {
    Mux(resp.ps === 12.U,
      Cat(resp.ppn, resp.offset(11, 0)),// small page
      Cat(resp.ppn(ppnLen - 1, 10), resp.offset)// big page
    )
  }


  // TODO: connect other ports
  // Only use Port(0)
  for (i <- 1 until nrSearchPort) {
    tlb.io.search(i).req.valid  := false.B
    tlb.io.search(i).req.bits   := DontCare
    tlb.io.search(i).resp.ready := true.B
    tlb.io.search(i).flush      := false.B
  }

  // TODO: uncomment
  // tlb.io.invtlb := io.maint.fromInvtlb
  // tlb.io.write  := io.maint.fromWrite tlb.io.rIndex := io.maint.fromReadIndex
  // io.maint.toReadResp := tlb.io.rResp
  io.maint.fromWrite.ready  := false.B
  io.maint.fromInvtlb.ready := false.B
  io.maint.toReadResp := DontCare
  tlb.io.invtlb.valid := false.B
  tlb.io.invtlb.bits  := DontCare
  tlb.io.write.valid  := false.B
  tlb.io.write.bits   := DontCare
  tlb.io.rIndex <> DontCare
  tlb.io.rResp  <> DontCare
}
