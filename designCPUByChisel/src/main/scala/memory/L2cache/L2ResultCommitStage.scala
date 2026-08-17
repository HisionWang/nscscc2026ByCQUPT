package nscscc.mem.L2cache

import chisel3._
import chisel3.util._
import nscscc.config._

/**
  * Registers lookup resolution before it fans out into Array, MSHR, LRB, and
  * busy-slot commit control. The stage is elastic, so a committed result may
  * be replaced by the next result on the same edge without a throughput bubble.
  */
class L2ResultCommitStage(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new L2LookupResult))
    val out = Decoupled(new L2LookupResult)
    val pendingWriteValid = Input(Bool())
    val pendingWriteAddr = Input(UInt(XLEN.W))
    val pendingWriteData = Input(UInt(l2LineBits.W))
  })

  private def block(addr: UInt): UInt =
    addr(XLEN - 1, l2BlockOffBits)

  val resultValid = RegInit(false.B)
  val resultBits = RegInit(0.U.asTypeOf(new L2LookupResult))
  val advance = !resultValid || io.out.ready
  val pendingWriteMatch = io.pendingWriteValid &&
    block(io.pendingWriteAddr) === block(io.in.bits.token.addr)

  io.in.ready := advance
  when(advance) {
    resultValid := io.in.valid
    when(io.in.valid) {
      resultBits := io.in.bits
      resultBits.stbMatch := io.in.bits.stbMatch || pendingWriteMatch
      resultBits.stbForwarded :=
        io.in.bits.stbForwarded || pendingWriteMatch
      resultBits.oldData :=
        Mux(pendingWriteMatch, io.pendingWriteData, io.in.bits.oldData)
    }
  }

  io.out.valid := resultValid
  io.out.bits := resultBits
}
