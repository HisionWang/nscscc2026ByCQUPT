package nscscc.backend

import chisel3._
import nscscc.config.{NSBundle, Parameters}

class DecodeCtrl(implicit p: Parameters) extends NSBundle {
  val valid    = Bool()
  val fuType   = UInt(FuType.width.W)
  val aluOp    = UInt(AluOp.width.W)
  val bruOp    = UInt(BruOp.width.W)
  val lsuOp    = UInt(LsuOp.width.W)
  val csrOp    = UInt(CsrOp.width.W)
  val mulDivOp = UInt(MulDivOp.width.W)
  val src1Type = UInt(SrcType.width.W)
  val src2Type = UInt(SrcType.width.W)
  val immType  = UInt(ImmType.width.W)

  val rfWen    = Bool()
  val memRead  = Bool()
  val memWrite = Bool()
  val csrWen   = Bool()
  val isBranch = Bool()
  val isJump   = Bool()
  val isPriv   = Bool()
  val illegal  = Bool()
}

class DecodedInst(implicit p: Parameters) extends NSBundle {
  val pc      = UInt(XLEN.W)
  val inst    = UInt(XLEN.W)
  val valid   = Bool()
  val rd      = UInt(5.W)
  val rj      = UInt(5.W)
  val rk      = UInt(5.W)
  val csrAddress = UInt(csrAddrLen.W)
  val imm     = UInt(XLEN.W)
  val ctrl    = new DecodeCtrl
}
