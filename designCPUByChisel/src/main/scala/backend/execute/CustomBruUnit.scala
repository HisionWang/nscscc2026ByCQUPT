package nscscc.backend.execute

import chisel3._
import nscscc.backend.decode.BruOp
import nscscc.config.{NSModule, Parameters}

class CustomBruUnit(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val valid = Input(Bool())
    val op = Input(UInt(BruOp.width.W))
    val inst = Input(UInt(XLEN.W))
    val rs1 = Input(UInt(XLEN.W))
    val rs2 = Input(UInt(XLEN.W))
    val taken = Output(Bool())
  })

  io.taken := false.B
}
