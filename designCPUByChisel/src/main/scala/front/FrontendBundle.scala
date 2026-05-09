package nscscc.frontend

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle

class RedirectIO(implicit p: Parameters) extends NSBundle {
  val target = Output(UInt(32.W))
  val rtype = Output(UInt(1.W)) // 1: branch mispredict: only need to flush frontend  0: others: flush the whole pipeline
  val valid = Output(Bool())
}

class CtrlFlowIO(implicit p: Parameters) extends NSBundle {
  val instr = Output(UInt(64.W))
  val pc = Output(UInt(32.W))
  val pnpc = Output(UInt(32.W))
  val redirect = new RedirectIO
  val exceptionVec = Output(Vec(16, Bool()))
  val intrVec = Output(Vec(12, Bool()))
  val brIdx = Output(UInt(4.W))
  val isRVC = Output(Bool())
  val crossPageIPFFix = Output(Bool())
  val runahead_checkpoint_id = Output(UInt(64.W))
  val isBranch = Output(Bool())
}
