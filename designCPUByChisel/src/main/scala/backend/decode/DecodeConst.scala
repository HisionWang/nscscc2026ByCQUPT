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
  val mul = 5.U(width.W)
  val div = 6.U(width.W)
  val priv   = 7.U(width.W)
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
  val si14 = 7.U(width.W)
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
  val llw  = 9.U(width.W)
  val scw  = 10.U(width.W)
}

object BarOp {
  val width = 2
  val none = 0.U(width.W)
  val dbar = 1.U(width.W)
  val ibar = 2.U(width.W)
}

object CacopCode {
  val width          = 5
  val cacheTypeWidth = 3
  val operationWidth = 2

  // code[2:0]: cache selected by the operation
  val iCache      = 0.U(cacheTypeWidth.W)
  val dCache      = 1.U(cacheTypeWidth.W)
  val sharedCache = 2.U(cacheTypeWidth.W)

  // code[4:3]: operation performed on the selected cache
  val storeTag                    = 0.U(operationWidth.W)
  val indexInvalidateOrWriteback  = 1.U(operationWidth.W)
  val hitInvalidateOrWriteback    = 2.U(operationWidth.W)
  val implementationDefined = 3.U(operationWidth.W)

  def cacheType(code: UInt): UInt = code(cacheTypeWidth - 1, 0)
  def operation(code: UInt): UInt = code(width - 1, cacheTypeWidth)
}

object CsrOp {
  val width = 3
  val none   = 0.U(width.W)
  val read   = 1.U(width.W)
  val write  = 2.U(width.W)
  val xchg   = 3.U(width.W)
  
  val rdcntvl  = 4.U(width.W)  // 新增
  val rdcntvh  = 5.U(width.W)  // 新增
  val rdcntid  = 6.U(width.W)  // 新增

  val cpucfg  = 7.U(width.W)   // ← 新增
}

object TlbOp {
  val width = 3
  val none       = 0.U(width.W)
  val search     = 1.U(width.W)
  val read       = 2.U(width.W)
  val write      = 3.U(width.W)
  val fill       = 4.U(width.W)
  val invalidate = 5.U(width.W)
}

object InvtlbOp {
  val width = 5

  val all                = "h00".U(width.W)
  val allAlt             = "h01".U(width.W)
  val glb          = "h02".U(width.W)
  val nonGlb       = "h03".U(width.W)
  val nonGlbAsid   = "h04".U(width.W)
  val nonGlbAsidVa = "h05".U(width.W)
  val glbOrAsidVa  = "h06".U(width.W)

  def isValid(op: UInt): Bool = op <= glbOrAsidVa

  def useAsid(op: UInt): Bool =
    op === nonGlbAsid || op === nonGlbAsidVa || op === glbOrAsidVa

  def useVaddr(op: UInt): Bool =
    op === nonGlbAsidVa || op === glbOrAsidVa

  def isLegal(op: UInt, rj: UInt, rk: UInt): Bool =
    isValid(op) && (useAsid(op) || rj === 0.U) &&
      (useVaddr(op) || rk === 0.U)
}

object MulOp {
  val width = 3
  val none  = 0.U(width.W)
  val mul   = 1.U(width.W)
  val mulh  = 2.U(width.W)
  val mulhu = 3.U(width.W)

}

object DivOp {
  val width = 3
  val none  = 0.U(width.W)
  val div   = 1.U(width.W)
  val mod   = 2.U(width.W)
  val divu  = 3.U(width.W)
  val modu  = 4.U(width.W)
}
