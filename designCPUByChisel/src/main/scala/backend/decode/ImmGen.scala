package nscscc.backend

import chisel3._
import chisel3.util._

object ImmGen {
  def apply(inst: UInt, immType: UInt): UInt = {
    val si12 = Cat(Fill(20, inst(21)), inst(21, 10))
    val ui12 = Cat(0.U(20.W), inst(21, 10))
    val ui5  = Cat(0.U(27.W), inst(14, 10))
    val si16 = Cat(Fill(14, inst(25)), inst(25, 10), 0.U(2.W))
    val si20 = Cat(inst(24, 5), 0.U(12.W))
    val si26 = Cat(Fill(4, inst(9)), inst(9, 0), inst(25, 10), 0.U(2.W))

    MuxLookup(immType, 0.U(32.W))(Seq(
      ImmType.si12 -> si12,
      ImmType.ui12 -> ui12,
      ImmType.ui5  -> ui5,
      ImmType.si16 -> si16,
      ImmType.si20 -> si20,
      ImmType.si26 -> si26
    ))
  }
}
