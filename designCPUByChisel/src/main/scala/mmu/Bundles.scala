package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.config._

class TlbEntry(implicit p: Parameters) extends NSBundle {
  val e     = Bool()
  val ps    = Bool()
  val vppn  = UInt(vppnLen.W)
  val asid  = UInt(asidLen.W)
  val g     = Bool()
  val ppn0  = UInt(ppnLen.W)
  val plv0  = UInt(plvLen.W)
  val mat0  = UInt(matLen.W)
  val d0    = Bool()
  val v0    = Bool()
  val ppn1  = UInt(ppnLen.W)
  val plv1  = UInt(plvLen.W)
  val mat1  = UInt(matLen.W)
  val d1    = Bool()
  val v1    = Bool()
}

class TlbSearchReq(implicit p: Parameters) extends NSBundle {
  val vppn     = UInt(vppnLen.W)
  val vaBit12  = Bool()
  val offset   = UInt(22.W)
  val asid     = UInt(asidLen.W)
}

class TlbSearchResp(implicit p: Parameters) extends NSBundle {
  // 对应大页偏移
  val offset = UInt(22.W)
  val found  = Bool()
  val index  = UInt(tlbIdxLen.W)
  val ppn    = UInt(ppnLen.W)
  val ps     = UInt(psLen.W)
  val plv    = UInt(plvLen.W)
  val mat    = UInt(matLen.W)
  val d      = Bool()
  val v      = Bool()
}

class TlbWriteReq(implicit p: Parameters) extends NSBundle {
  val index = UInt(tlbIdxLen.W)
  val e     = Bool()
  val vppn  = UInt(vppnLen.W)
  val ps    = UInt(psLen.W)
  val asid  = UInt(asidLen.W)
  val g     = Bool()
  val ppn0  = UInt(ppnLen.W)
  val plv0  = UInt(plvLen.W)
  val mat0  = UInt(matLen.W)
  val d0    = Bool()
  val v0    = Bool()
  val ppn1  = UInt(ppnLen.W)
  val plv1  = UInt(plvLen.W)
  val mat1  = UInt(matLen.W)
  val d1    = Bool()
  val v1    = Bool()
}
 
class TlbReadResp(implicit p: Parameters) extends NSBundle {
  val e    = Bool()
  val vppn = UInt(vppnLen.W)
  val ps   = UInt(psLen.W)
  val asid = UInt(asidLen.W)
  val g    = Bool()
  val ppn0 = UInt(ppnLen.W)
  val plv0 = UInt(plvLen.W)
  val mat0 = UInt(matLen.W)
  val d0   = Bool()
  val v0   = Bool()
  val ppn1 = UInt(ppnLen.W)
  val plv1 = UInt(plvLen.W)
  val mat1 = UInt(matLen.W)
  val d1   = Bool()
  val v1   = Bool()
}

class InvtlbReq(implicit p: Parameters) extends NSBundle {
  val op   = UInt(invtlbOpLen.W)
  val asid = UInt(asidLen.W)
  val vpn  = UInt(vppnLen.W)
}

class IcacheToMmu(implicit p: Parameters) extends NSBundle {
  val vaddr = UInt(XLEN.W)
}

class MmuTransError(implicit p: Parameters) extends NSBundle {
  /* tlbRefill : refill
   * excpPif   : tlb hit but invalid
   * excpPpi   : unprivilege
   */
  val excpTlbRefill = Bool()
  val excpTlbPif    = Bool()
  val excpTlbPpi    = Bool()
  val excpAdef      = Bool()
  def getAnyError: Bool = excpTlbRefill || excpTlbPif || excpTlbPpi || excpAdef
}

class MmuToIcache(implicit p: Parameters) extends NSBundle {
  val paddr     = UInt(XLEN.W)
  val cacheable = Bool()
  val hasError  = Bool()
  val error     = new MmuTransError
}

class CsrToMmu(implicit p: Parameters) extends NSBundle {
  val plv  = UInt(plvLen.W)
  val pgda = UInt(2.W)
  val dmw0 = UInt(XLEN.W)
  val dmw1 = UInt(XLEN.W)
  val datm = UInt(matLen.W)
  val datf = UInt(matLen.W)
  val asid = UInt(asidLen.W)
}

class MmuMaintPort(implicit p: Parameters) extends NSBundle {
  val fromInvtlb = Flipped(Decoupled(new InvtlbReq))
  val fromWrite  = Flipped(Decoupled(new TlbWriteReq))

  // 不是维护指令, 先放这
  val fromReadIndex = Input(UInt(tlbIdxLen.W))
  val toReadResp    = Output(new TlbReadResp)
}

class MmuIoBundle(implicit p: Parameters) extends NSBundle {
  val fromCsr = Input(new CsrToMmu)

  val fromIcache = Flipped(Decoupled(new IcacheToMmu))
  val toIcache   = Decoupled(new MmuToIcache)

  val fromIcacheFlush = Input(Bool())

  val maint = new MmuMaintPort
}
