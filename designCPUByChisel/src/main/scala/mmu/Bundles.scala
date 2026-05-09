package nscscc.core.mmu

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
  val vppn    = UInt(vppnLen.W)
  val vaBit12 = Bool()
  val asid    = UInt(asidLen.W)
}
 
class TlbSearchResp(implicit p: Parameters) extends NSBundle {
  val found = Bool()
  val index = UInt(tlbIdxLen.W)
  val ppn   = UInt(ppnLen.W)
  val ps    = UInt(psLen.W)
  val plv   = UInt(plvLen.W)
  val mat   = UInt(matLen.W)
  val d     = Bool()
  val v     = Bool()
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
 
