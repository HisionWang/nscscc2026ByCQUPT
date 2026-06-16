package nscscc.backend.decode

import chisel3._
import chisel3.util._
import nscscc.config.{NSBundle, Parameters}
import nscscc.frontend.{PredecodeInfo, CtrlFlowIO}
import nscscc.mmu.{MmuTransError}

// 预译码信息
//class PredecodeInfo(implicit p: Parameters) extends NSBundle {
//  val valid      = Bool()
//  val isBr       = Bool()
//  val isJal      = Bool()
//  val isJalr     = Bool()
//  val isCall     = Bool()
//  val isRet      = Bool()
//  val jumpTarget = UInt(XLEN.W)
//}

// 前端传递的异常信息 (加入了 ADEF)
//class MmuTransError(implicit p: Parameters) extends NSBundle {
//  val excpTlbRefill = Bool()
//  val excpTlbPif    = Bool()
//  val excpTlbPpi    = Bool()
//  val excpAdef      = Bool() // 取指地址非对齐
//  
//  def getAnyError: Bool = excpTlbRefill || excpTlbPif || excpTlbPpi || excpAdef
//}

// 译码级的输入格式
//class CtrlFlowIO(implicit p: Parameters) extends NSBundle {
//  val instr     = Output(UInt(32.W))
//  val pc        = Output(UInt(XLEN.W))
//  val pdInfo    = new PredecodeInfo
//  val exception = new MmuTransError
//}

// 读RAT接口
class RATReadIO extends Bundle {
  val rs1      = UInt(5.W)
  val rs2      = UInt(5.W)
  val rs1Valid = Bool()
  val rs2Valid = Bool()
}

// 控制信号打平
class DecodeCtrl(implicit p: Parameters) extends NSBundle {
  val fuType   = UInt(FuType.width.W)
  val aluOp    = UInt(AluOp.width.W)
  val bruOp    = UInt(BruOp.width.W)
  val lsuOp    = UInt(LsuOp.width.W)
  val csrOp    = UInt(CsrOp.width.W)
  val mulOp    = UInt(MulOp.width.W)
  val divOp    = UInt(DivOp.width.W)
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
}

// 译码后发往后端的指令宏包
class DecodedInst(implicit p: Parameters) extends NSBundle {
  val pc         = UInt(XLEN.W)
  val inst       = UInt(XLEN.W)
  
  val rd         = UInt(5.W)
  val rj         = UInt(5.W)
  val rk         = UInt(5.W)
  val rs1Valid   = Bool()
  val rs2Valid   = Bool()
  val rdValid    = Bool()
  
  val csrAddress = UInt(csrAddrLen.W)
  val imm        = UInt(XLEN.W)
  
  val ctrl       = new DecodeCtrl
  val excpVec    = UInt(ExceptionCode.width.W)
  val pdInfo     = new PredecodeInfo
}


