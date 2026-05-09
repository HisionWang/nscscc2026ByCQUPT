package nscscc.core.mmu

import chisel3._
import chisel3.util._

import nscscc.config._

class Tlb(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val search = Vec(nrSearchPort, new Bundle {
      val req  = Flipped(Valid(new TlbSearchReq))
      val resp = Valid(new TlbSearchResp)
    })
    val invtlb = Flipped(Valid(new InvtlbReq))
    val write  = Flipped(Valid(new TlbWriteReq))
    val rIndex = Input(UInt(tlbIdxLen.W))
    val rResp  = Output(new TlbReadResp)
  })
 
  val entries = RegInit(VecInit(Seq.fill(nrTlb)(0.U.asTypeOf(new TlbEntry))))
 
  for (idx <- 0 until nrSearchPort) {
    val req = io.search(idx).req
 
    val match_ = VecInit(entries.map { e =>
      val vppnHit = Mux(e.ps,
        e.vppn(vppnLen - 1, vppnLen - 10) === req.bits.vppn(vppnLen - 1, vppnLen - 10),
        e.vppn === req.bits.vppn)
      val asidHit = (e.asid === req.bits.asid) || e.g
      e.e && vppnHit && asidHit
    })
    val sel     = OHToUInt(match_)
    val hitE    = entries(sel)
    val oddPage = Mux(hitE.ps, req.bits.vppn(8), req.bits.vaBit12)
 
    val resp = io.search(idx).resp
    resp.valid      := req.valid
    resp.bits.found := match_.asUInt.orR
    resp.bits.index := sel
    resp.bits.ps    := Mux(hitE.ps, 21.U, 12.U)
    resp.bits.ppn   := Mux(oddPage, hitE.ppn1, hitE.ppn0)
    resp.bits.v     := Mux(oddPage, hitE.v1,   hitE.v0)
    resp.bits.d     := Mux(oddPage, hitE.d1,   hitE.d0)
    resp.bits.mat   := Mux(oddPage, hitE.mat1, hitE.mat0)
    resp.bits.plv   := Mux(oddPage, hitE.plv1, hitE.plv0)
  }
 
  when (io.write.valid) {
    val w = io.write.bits
    val e = entries(w.index)
    e.vppn  := w.vppn
    e.asid  := w.asid
    e.g     := w.g
    e.ps := w.ps =/= 12.U
    e.ppn0  := w.ppn0; e.plv0 := w.plv0; e.mat0 := w.mat0
    e.d0    := w.d0;   e.v0   := w.v0
    e.ppn1  := w.ppn1; e.plv1 := w.plv1; e.mat1 := w.mat1
    e.d1    := w.d1;   e.v1   := w.v1
  }
 
  for (i <- 0 until nrTlb) {
    when (io.write.valid && io.write.bits.index === i.U) {
      entries(i).e := io.write.bits.e
    } .elsewhen (io.invtlb.valid) {
      val op  = io.invtlb.bits.op
      val ent = entries(i)
      val vppnHit = Mux(ent.ps,
        ent.vppn(vppnLen - 1, vppnLen - 10) === io.invtlb.bits.vpn(vppnLen - 1, vppnLen - 10),
        ent.vppn === io.invtlb.bits.vpn)
      val asidHit = ent.asid === io.invtlb.bits.asid
      val clr = MuxLookup(op, false.B)(Seq(
        0.U -> true.B,
        1.U -> true.B,
        2.U -> ent.g,
        3.U -> !ent.g,
        4.U -> (!ent.g && asidHit),
        5.U -> (!ent.g && asidHit && vppnHit),
        6.U -> ((ent.g || asidHit) && vppnHit)
      ))
      when (clr) { entries(i).e := false.B }
    }
  }
 
  val r = entries(io.rIndex)
  io.rResp.e    := r.e
  io.rResp.vppn := r.vppn
  io.rResp.asid := r.asid
  io.rResp.g    := r.g
  io.rResp.ps   := Mux(r.ps, 21.U, 12.U)
  io.rResp.ppn0 := r.ppn0; io.rResp.plv0 := r.plv0; io.rResp.mat0 := r.mat0
  io.rResp.d0   := r.d0;   io.rResp.v0   := r.v0
  io.rResp.ppn1 := r.ppn1; io.rResp.plv1 := r.plv1; io.rResp.mat1 := r.mat1
  io.rResp.d1   := r.d1;   io.rResp.v1   := r.v1
}
 
