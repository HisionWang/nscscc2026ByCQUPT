package nscscc.mmu

import chisel3._
import chisel3.util._

import nscscc.backend.decode.{InvtlbOp, TlbOp}
import nscscc.config._
import nscscc.csr._

class Tlb(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val search = Vec(nrSearchPort, new TlbSearchPort)

    val instr   = Input(Valid(new TlbInstr))
    val csr     = Input(new CsrToTlb)
    val cmd     = Output(new TlbCmd)
    val read    = Output(new TlbToCsr)
    val fillIdx = Output(UInt(tlbIdxLen.W))
    val flush   = Output(Bool())
  })

  val entries = RegInit(VecInit(Seq.fill(nrTlb)(0.U.asTypeOf(new TlbEntry))))
  val csr = RegNext(io.csr)

  val isSearch = io.instr.bits.cmd === TlbOp.search
  val isRead   = io.instr.bits.cmd === TlbOp.read
  val isWrite  = io.instr.bits.cmd === TlbOp.write
  val isFill   = io.instr.bits.cmd === TlbOp.fill
  val isInv    = io.instr.bits.cmd === TlbOp.invalidate
  val changeTlb = isWrite || isFill || isInv

  io.flush := io.instr.valid && changeTlb

  // nrSearchPort个并行流水线
  for (idx <- 0 until nrSearchPort) {
    val req   = io.search(idx).req
    val resp  = io.search(idx).resp
    val flush = io.search(idx).flush || io.flush

    val s1Valid = RegInit(false.B)
    val s1Req   = RegInit(0.U.asTypeOf(new TlbSearchReq))
    val s1Found = RegInit(false.B)
    val s1Index = RegInit(0.U(tlbIdxLen.W))
    
    val s2Valid = RegInit(false.B)
    val s2Resp  = RegInit(0.U.asTypeOf(new TlbSearchResp))

    val s2Ready = !s2Valid || resp.ready
    val s1Ready = !s1Valid || s2Ready

    req.ready := !flush && s1Ready

    // lookup
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

  }

  val searchMatches = VecInit(entries.map { entry =>
    val vppn = csr.tlbehi(XLEN - 1, 13)
    val vppnHit = Mux(entry.ps,
      entry.vppn(vppnLen - 1, vppnLen - 10) ===
        vppn(vppnLen - 1, vppnLen - 10),
      entry.vppn === vppn
    )
    entry.e && (entry.g || entry.asid === csr.asid) && vppnHit
  })

  io.cmd := 0.U.asTypeOf(new TlbCmd)
  io.cmd.srchVld := io.instr.valid && isSearch
  io.cmd.srchHit := searchMatches.asUInt.orR
  io.cmd.srchIdx := PriorityEncoder(searchMatches)
  io.cmd.tlbrd   := io.instr.valid && isRead

  val readEntry = entries(csr.tlbidx(tlbIdxLen - 1, 0))
  io.read.tlbidx := Cat(
    !readEntry.e, 0.U(1.W), Mux(readEntry.ps, 21.U, 12.U),
    0.U(19.W), csr.tlbidx(tlbIdxLen - 1, 0)
  )
  io.read.tlbehi := Cat(readEntry.vppn, 0.U(13.W))
  io.read.tlbeho0 := Cat(
    0.U(4.W), readEntry.ppn0, 0.U(1.W), readEntry.g,
    readEntry.mat0, readEntry.plv0, readEntry.d0, readEntry.v0
  )
  io.read.tlbeho1 := Cat(
    0.U(4.W), readEntry.ppn1, 0.U(1.W), readEntry.g,
    readEntry.mat1, readEntry.plv1, readEntry.d1, readEntry.v1
  )
  io.read.asid := Cat(0.U((XLEN - asidLen).W), readEntry.asid)

  val fillIdx = RegInit(0.U(tlbIdxLen.W))
  io.fillIdx := fillIdx

  when(io.instr.valid && (isWrite || isFill)) {
    val index = Mux(isWrite, csr.tlbidx(tlbIdxLen - 1, 0), fillIdx)
    val entry = entries(index)

    entry.e     := csr.ecode === "h3f".U || !csr.tlbidx(31)
    entry.vppn  := csr.tlbehi(XLEN - 1, 13)
    entry.asid  := csr.asid
    entry.g     := csr.tlbelo0(6) && csr.tlbelo1(6)
    entry.ps    := csr.tlbidx(29, 24) =/= 12.U
    entry.ppn0  := csr.tlbelo0(27, 8)
    entry.plv0  := csr.tlbelo0(3, 2)
    entry.mat0  := csr.tlbelo0(5, 4)
    entry.d0    := csr.tlbelo0(1)
    entry.v0    := csr.tlbelo0(0)
    entry.ppn1  := csr.tlbelo1(27, 8)
    entry.plv1  := csr.tlbelo1(3, 2)
    entry.mat1  := csr.tlbelo1(5, 4)
    entry.d1    := csr.tlbelo1(1)
    entry.v1    := csr.tlbelo1(0)

    when(isFill) {
      fillIdx := fillIdx + 1.U
    }
  }

  when(io.instr.valid && isInv) {
    val invVppn = io.instr.bits.rk(XLEN - 1, 13)
    for (entry <- entries) {
      val vppnHit = Mux(entry.ps,
        entry.vppn(vppnLen - 1, vppnLen - 10) ===
          invVppn(vppnLen - 1, vppnLen - 10),
        entry.vppn === invVppn
      )
      val asidHit = entry.asid === io.instr.bits.rj
      val clear = MuxLookup(io.instr.bits.op, false.B)(Seq(
        InvtlbOp.all          -> true.B,
        InvtlbOp.allAlt       -> true.B,
        InvtlbOp.glb          -> entry.g,
        InvtlbOp.nonGlb       -> !entry.g,
        InvtlbOp.nonGlbAsid   -> (!entry.g && asidHit),
        InvtlbOp.nonGlbAsidVa -> (!entry.g && asidHit && vppnHit),
        InvtlbOp.glbOrAsidVa  -> ((entry.g || asidHit) && vppnHit)
      ))
      when(clear) {
        entry.e := false.B
      }
    }
  }
}
