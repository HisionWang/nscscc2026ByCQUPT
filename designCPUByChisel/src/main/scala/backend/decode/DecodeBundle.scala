package nscscc.backend.decode

import chisel3._
import chisel3.util._
import nscscc.config.{NSBundle, Parameters, ExceptionBundle}
import nscscc.frontend.{PredecodeInfo, CtrlFlowIO, bpuInfoBundle}
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
  val hold1 = Bool()
  val hold2 = Bool()
}

class CacopDecode extends Bundle {
  val valid     = Bool()
  val code      = UInt(CacopCode.width.W)
  val cacheType = UInt(CacopCode.cacheTypeWidth.W)
  val operation = UInt(CacopCode.operationWidth.W)
}

// 控制信号打平
class DecodeCtrl(implicit p: Parameters) extends NSBundle {
  val fuType   = UInt(FuType.width.W)
  val aluOp    = UInt(AluOp.width.W)
  val bruOp    = UInt(BruOp.width.W)
  val lsuOp    = UInt(LsuOp.width.W)
  val barOp    = UInt(BarOp.width.W)
  val csrOp    = UInt(CsrOp.width.W)
  val tlbOp    = UInt(TlbOp.width.W)
  val mulOp    = UInt(MulOp.width.W)
  val divOp    = UInt(DivOp.width.W)
  val src1Type = UInt(SrcType.width.W)
  val src2Type = UInt(SrcType.width.W)
  val immType  = UInt(ImmType.width.W)

  val rfWen    = Bool()
  val memRead  = Bool()
  val memWrite = Bool()
  //val rs2UseRd = Bool()
  val csrWen   = Bool()
  val isBranch = Bool()
  val isJump   = Bool()
  val isPriv   = Bool()
  val waitForward = Bool()
  val blockBackward = Bool()
  val flushOnCommit = Bool()
}

// 译码后发往后端的指令宏包
class DecodedInst(implicit p: Parameters) extends NSBundle {
  val pc         = UInt(XLEN.W)
  val inst       = UInt(XLEN.W)
  
  val rd         = UInt(5.W)
  val rj         = UInt(5.W)
  val rk         = UInt(5.W)

  val rs1         = UInt(5.W) //计算真正的源操作数，因为后面马上就得开始读取Rat表了
  val rs2         = UInt(5.W) //计算真正的源操作数，因为后面马上就得开始读取Rat表了
  val rs1Valid   = Bool()
  val rs2Valid   = Bool()
  val rdValid    = Bool()
  
  val csrAddress = UInt(csrAddrLen.W)
  val imm        = UInt(XLEN.W)
  val cacop      = new CacopDecode
  
  val ctrl       = new DecodeCtrl
  val excp       = new ExceptionBundle
  val pdInfo     = new PredecodeInfo
  val bpuInfo    = new bpuInfoBundle
}
