package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.config._

class Tlb(implicit p: Parameters) extends NSModule 
  with HasArchParameters
{
  val io = IO(new Bundle {
    val search = Vec(nrSearchPort, new Bundle {
      val req  = Flipped(Decoupled(new TlbSearchReq))
      val resp = Decoupled(new TlbSearchResp)
      val flush = Input(Bool())
    })
    val invtlb = Flipped(Decoupled(new InvtlbReq))
    val write  = Flipped(Decoupled(new TlbWriteReq))
    val rIndex = Input(UInt(tlbIdxLen.W))
    val rResp  = Output(new TlbReadResp)
  })

  val entries = RegInit(VecInit(Seq.fill(nrTlb)(0.U.asTypeOf(new TlbEntry))))

  val portBusy = Wire(Vec(nrSearchPort, Bool()))
  val pipeBusy = portBusy.asUInt.orR

  // tlb维护指令阻塞search请求
  val maintValid = io.write.valid || io.invtlb.valid
  val blockSearch = maintValid

  // 等待所有search event完成
  io.write.ready  := !pipeBusy
  io.invtlb.ready := !pipeBusy && !io.write.valid

  // nrSearchPort个并行流水线
  for (idx <- 0 until nrSearchPort) {
    val req   = io.search(idx).req
    val resp  = io.search(idx).resp
    val flush = io.search(idx).flush

    val s1Valid = RegInit(false.B)
    val s1Req   = Reg(new TlbSearchReq)
    val s1Found = Reg(Bool())
    val s1Index = Reg(UInt(tlbIdxLen.W))

    val s2Valid = RegInit(false.B)
    val s2Resp  = Reg(new TlbSearchResp)

    val s2Ready = !s2Valid || resp.ready
    val s1Ready = !s1Valid || s2Ready

    req.ready := !blockSearch && !flush && s1Ready

    // lookup
    // 感觉关键路径还是在stage1
    val matchVec = VecInit(entries.map { e =>
      val vppnHit = Mux(e.ps,
        e.vppn(vppnLen - 1, vppnLen - 10) === req.bits.vppn(vppnLen - 1, vppnLen - 10),
        e.vppn === req.bits.vppn
      )
      val asidHit = e.g || e.asid === req.bits.asid
      e.e && vppnHit && asidHit
    })

    // update
    when (flush) {
      s1Valid := false.B
      s2Valid := false.B
    } .otherwise {
      // stage1: catch req, lookup
      when (s1Ready) {
        s1Valid := req.fire
        when (req.fire) {
          s1Req   := req.bits
          s1Found := matchVec.asUInt.orR
          s1Index := PriorityEncoder(matchVec) // 可能存在重复命中
        }
      }

      // stage2: get entry
      when (s2Ready) {
        s2Valid := s1Valid
        when (s1Valid) {
          val hitE    = entries(s1Index)
          // 奇偶页判断
          val oddPage = Mux(hitE.ps, s1Req.vppn(8), s1Req.vaBit12)

          s2Resp.offset := s1Req.offset
          s2Resp.found  := s1Found
          s2Resp.index  := s1Index
          s2Resp.ps     := Mux(hitE.ps, 21.U, 12.U)
          s2Resp.ppn    := Mux(oddPage, hitE.ppn1, hitE.ppn0)
          s2Resp.v      := Mux(oddPage, hitE.v1,   hitE.v0)
          s2Resp.d      := Mux(oddPage, hitE.d1,   hitE.d0)
          s2Resp.mat    := Mux(oddPage, hitE.mat1, hitE.mat0)
          s2Resp.plv    := Mux(oddPage, hitE.plv1, hitE.plv0)
        }
      }
    }

    resp.valid := s2Valid
    resp.bits  := s2Resp

    portBusy(idx) := (s1Valid || s2Valid) && !flush
  }

  when (io.write.fire) {
    val w = io.write.bits
    val e = entries(w.index)

    e.e     := w.e
    e.vppn  := w.vppn
    e.asid  := w.asid
    e.g     := w.g
    e.ps    := w.ps =/= 12.U
    e.ppn0  := w.ppn0
    e.plv0  := w.plv0
    e.mat0  := w.mat0
    e.d0    := w.d0
    e.v0    := w.v0
    e.ppn1  := w.ppn1
    e.plv1  := w.plv1
    e.mat1  := w.mat1
    e.d1    := w.d1
    e.v1    := w.v1
  }

  when (io.invtlb.fire) {
    for (i <- 0 until nrTlb) {
      val ent = entries(i)
      val vppnHit = Mux(ent.ps,
        ent.vppn(vppnLen - 1, vppnLen - 10) === io.invtlb.bits.vpn(vppnLen - 1, vppnLen - 10),
        ent.vppn === io.invtlb.bits.vpn
      )
      val asidHit = ent.asid === io.invtlb.bits.asid
      val clr = MuxLookup(io.invtlb.bits.op, false.B)(Seq(
        0.U -> true.B,
        1.U -> true.B,
        2.U -> ent.g,
        3.U -> !ent.g,
        4.U -> (!ent.g && asidHit),
        5.U -> (!ent.g && asidHit && vppnHit),
        6.U -> ((ent.g || asidHit) && vppnHit)
      ))
      when (clr) {
        entries(i).e := false.B
      }
    }
  }

  val r = entries(io.rIndex)
  io.rResp.e    := r.e
  io.rResp.vppn := r.vppn
  io.rResp.asid := r.asid
  io.rResp.g    := r.g
  io.rResp.ps   := Mux(r.ps, 21.U, 12.U)
  io.rResp.ppn0 := r.ppn0
  io.rResp.plv0 := r.plv0
  io.rResp.mat0 := r.mat0
  io.rResp.d0   := r.d0
  io.rResp.v0   := r.v0
  io.rResp.ppn1 := r.ppn1
  io.rResp.plv1 := r.plv1
  io.rResp.mat1 := r.mat1
  io.rResp.d1   := r.d1
  io.rResp.v1   := r.v1
}

