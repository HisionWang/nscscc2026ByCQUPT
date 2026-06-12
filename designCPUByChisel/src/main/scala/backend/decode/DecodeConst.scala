package nscscc.backend.decode

import chisel3._

object ExceptionCode {
  val width = 10

  val INT  = 0  // 外部中断
  val PIL  = 1  // 取指TLB缺失
  val PIS  = 2  // 取指页表项无效
  val PIF  = 3  // 取指特权级违例
  val PME  = 4  // 取指页表项修改
  val PPI  = 5  // TLB特权级异常
  val SYS  = 6  // Syscall
  val BRK  = 7  // Break
  val ADEF = 8  // 取指地址非对齐
  val INE  = 9  // 无效指令
}

object FuType {
  val width = 4
  val none   = 0.U(width.W)
  val alu    = 1.U(width.W)
  val bru    = 2.U(width.W)
  val lsu    = 3.U(width.W)
  val csr    = 4.U(width.W)
  val mulDiv = 5.U(width.W)
  val priv   = 6.U(width.W)
}

object SrcType {
  val width = 3
  val none = 0.U(width.W)
  val reg  = 1.U(width.W)
  val pc   = 2.U(width.W)
  val imm  = 3.U(width.W)
  val zero = 4.U(width.W)
}

object ImmType {
  val width = 4
  val none = 0.U(width.W)
  val si12 = 1.U(width.W)
  val ui12 = 2.U(width.W)
  val ui5  = 3.U(width.W)
  val si16 = 4.U(width.W)
  val si20 = 5.U(width.W)
  val si26 = 6.U(width.W)
}

object AluOp {
  val width = 5
  val add   = 0.U(width.W)
  val sub   = 1.U(width.W)
  val slt   = 2.U(width.W)
  val sltu  = 3.U(width.W)
  val and   = 4.U(width.W)
  val or    = 5.U(width.W)
  val xor   = 6.U(width.W)
  val nor   = 7.U(width.W)
  val sll   = 8.U(width.W)
  val srl   = 9.U(width.W)
  val sra   = 10.U(width.W)
  val pass2 = 11.U(width.W)
}

object BruOp {
  val width = 4
  val none = 0.U(width.W)
  val jirl = 1.U(width.W)
  val b    = 2.U(width.W)
  val bl   = 3.U(width.W)
  val beq  = 4.U(width.W)
  val bne  = 5.U(width.W)
  val blt  = 6.U(width.W)
  val bge  = 7.U(width.W)
  val bltu = 8.U(width.W)
  val bgeu = 9.U(width.W)
}

object LsuOp {
  val width = 4
  val none = 0.U(width.W)
  val ldb  = 1.U(width.W)
  val ldh  = 2.U(width.W)
  val ldw  = 3.U(width.W)
  val stb  = 4.U(width.W)
  val sth  = 5.U(width.W)
  val stw  = 6.U(width.W)
  val ldbu = 7.U(width.W)
  val ldhu = 8.U(width.W)
}

object CsrOp {
  val width = 3
  val none   = 0.U(width.W)
  val read   = 1.U(width.W)
  val write  = 2.U(width.W)
  val xchg   = 3.U(width.W)
}

object MulDivOp {
  val width = 4
  val none  = 0.U(width.W)
  val mul   = 1.U(width.W)
  val mulh  = 2.U(width.W)
  val mulhu = 3.U(width.W)
  val div   = 4.U(width.W)
  val mod   = 5.U(width.W)
  val divu  = 6.U(width.W)
  val modu  = 7.U(width.W)
}
