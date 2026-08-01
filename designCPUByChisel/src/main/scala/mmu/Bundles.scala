package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.config._
import nscscc.backend.decode._
import nscscc.csr._

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

class TlbSearchPort(implicit p: Parameters) extends NSBundle {
  val req   = Flipped(Decoupled(new TlbSearchReq))
  val resp  = Decoupled(new TlbSearchResp)
  val flush = Input(Bool())
}

class TlbInstr(implicit p: Parameters) extends NSBundle {
  val cmd = UInt(TlbOp.width.W)
  val op  = UInt(InvtlbOp.width.W)
  val rj  = UInt(asidLen.W)
  val rk  = UInt(XLEN.W)
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
  val excpAle       = Bool()
  def getAnyError: Bool = excpTlbRefill || excpTlbPif || excpTlbPpi || excpAdef || excpAle
}

class DcacheMmuTransError(implicit p: Parameters) extends NSBundle {
  val excpTlbRefill = Bool()
  val excpTlbPil    = Bool()
  val excpTlbPis    = Bool()
  val excpTlbPme    = Bool()
  val excpTlbPpi    = Bool()
  val excpAdef      = Bool()
  val excpAle       = Bool()
  def getAnyError: Bool = excpTlbRefill || excpTlbPil || excpTlbPis ||
    excpTlbPme || excpTlbPpi || excpAdef || excpAle
}

class MmuToIcache(implicit p: Parameters) extends NSBundle {
  val paddr     = UInt(XLEN.W)
  val cacheable = Bool()
  val hasError  = Bool()
  val error     = new MmuTransError
}

class SqToMmuReq(implicit p: Parameters) extends NSBundle {
  //val lsuType = UInt(3.W)
  val vaddr = UInt(XLEN.W)
  val lsuOp = UInt(LsuOp.width.W)
  //val sqIdx = UInt(log2Ceil(SqSize).W)
}

class MmuToSqResp(implicit p: Parameters) extends NSBundle {
  val paddr     = UInt(XLEN.W)
  val cacheable = Bool()
  val hasError  = Bool()
  val error     = new DcacheMmuTransError
  //val excpVec     = UInt(ExceptionCode.width.W)
  //val sqIdx     = UInt(log2Ceil(SqSize).W)
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

class MmuTlbPort(implicit p: Parameters) extends NSBundle {
  val instr   = Flipped(Valid(new TlbInstr))
  val csr     = Input(new CsrToTlb)
  val cmd     = Output(new TlbCmd)
  val read    = Output(new TlbToCsr)
  val fillIdx = Output(UInt(tlbIdxLen.W))
}

class MmuIoBundle(implicit p: Parameters) extends NSBundle {
  val fromCsr = Input(new CsrToMmu)

  val fromIcache = Flipped(Decoupled(new IcacheToMmu))
  val toIcache   = Decoupled(new MmuToIcache)

  val fromIcacheFlush = Input(Bool())

  val fromMem = Flipped(Decoupled(new SqToMmuReq))
  val toMem   = Decoupled(new MmuToSqResp)
  val fromMemFlush = Input(Bool())

  val tlb = new MmuTlbPort
}
