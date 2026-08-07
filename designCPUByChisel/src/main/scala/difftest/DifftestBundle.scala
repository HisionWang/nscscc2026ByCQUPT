package nscscc.difftest

import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._

class DifftestLoadInfo(implicit p: Parameters) extends NSBundle {
  val valid = Bool()
  val paddr = UInt(XLEN.W)
  val vaddr = UInt(XLEN.W)
}

class DifftestStoreInfo(implicit p: Parameters) extends NSBundle {
  val valid = Bool()
  val paddr = UInt(XLEN.W)
  val vaddr = UInt(XLEN.W)
  val data  = UInt(XLEN.W)
}

class DifftestCommitInfo(implicit p: Parameters) extends NSBundle {
  val valid      = Bool()
  val pc         = UInt(XLEN.W)
  val instr      = UInt(32.W)
  val rfWen      = Bool()
  val wdest      = UInt(5.W)
  val wdata      = UInt(XLEN.W)
  val isCntInst  = Bool()
  val csrRstat   = Bool()
  val csrData    = UInt(XLEN.W)
  val csrTimer   = UInt(64.W)
  val excpFlush  = Bool()
  val ertnFlush  = Bool()
  val csrEcode   = UInt(6.W)
  val tlbfillEn  = Bool()
  val randIndex  = UInt(5.W)
  val trap       = Bool()
  val trapCode   = UInt(8.W)
  val load       = new DifftestLoadInfo
  val store      = new DifftestStoreInfo
}

class DifftestCSRState(implicit p: Parameters) extends NSBundle {
  val estat     = UInt(32.W)
  val crmd      = UInt(32.W)
  val prmd      = UInt(32.W)
  val ecfg      = UInt(32.W)
  val era       = UInt(64.W)
  val badv      = UInt(64.W)
  val eentry    = UInt(64.W)
  val tlbidx    = UInt(32.W)
  val tlbehi    = UInt(64.W)
  val tlbelo0   = UInt(32.W)
  val tlbelo1   = UInt(32.W)
  val asid      = UInt(32.W)
  val pgdl      = UInt(64.W)
  val pgdh      = UInt(64.W)
  val save0     = UInt(64.W)
  val save1     = UInt(64.W)
  val save2     = UInt(64.W)
  val save3     = UInt(64.W)
  val tid       = UInt(64.W)
  val tcfg      = UInt(32.W)
  val tval      = UInt(64.W)
  val ticlr     = UInt(32.W)
  val llbctl    = UInt(32.W)
  val tlbrentry = UInt(64.W)
  val dmw0      = UInt(32.W)
  val dmw1      = UInt(32.W)
  val timer64   = UInt(64.W)
}

class CtrlBlockDifftestBundle(implicit p: Parameters) extends NSBundle {
  val commit    = Vec(CommitWidth, new DifftestCommitInfo)
  val archState = Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))
}

class BackendDifftestBundle(implicit p: Parameters) extends NSBundle {
  val commit = Vec(CommitWidth, new DifftestCommitInfo)
  val regs   = Vec(IntLogicRegs, UInt(XLEN.W))
}

class CoreDifftestBundle(implicit p: Parameters) extends NSBundle {
  val commit = Vec(CommitWidth, new DifftestCommitInfo)
  val regs   = Vec(IntLogicRegs, UInt(XLEN.W))
  val csr    = new DifftestCSRState
}

object DifftestUtils {
  def isCntInst(inst: UInt): Bool = inst(31, 10) === "b0000000000000000011000".U(22.W) || inst(31, 10) === "b0000000000000000011001".U(22.W)
  def isErtn(inst: UInt): Bool = inst === "h06483800".U
  def isSyscall(inst: UInt): Bool = Instructions.SYSCALL === inst
  def isTrap(inst: UInt): Bool = inst === "h002b0000".U

//  def excpVecToEcode(excpVec: UInt): UInt = MuxCase(0.U(6.W), Seq(
//    excpVec(ExceptionCode.INT)  -> 0x00.U,
//    excpVec(ExceptionCode.PIL)  -> 0x01.U,
//    excpVec(ExceptionCode.PIS)  -> 0x02.U,
//    excpVec(ExceptionCode.PIF)  -> 0x03.U,
//    excpVec(ExceptionCode.PME)  -> 0x04.U,
//    excpVec(ExceptionCode.PPI)  -> 0x07.U,
//    excpVec(ExceptionCode.ADEF) -> 0x08.U,
//    excpVec(ExceptionCode.SYS)  -> 0x0b.U,
//    excpVec(ExceptionCode.BRK)  -> 0x0c.U,
//    excpVec(ExceptionCode.INE)  -> 0x0d.U
//  ))
  def excpVecToEcode(excp: ExceptionBundle): UInt = excp.ecode
}
