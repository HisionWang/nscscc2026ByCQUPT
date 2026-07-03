package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.rename._
import nscscc.backend.dispatch._
import nscscc.backend.issue._
import nscscc.backend.regfile._
import nscscc.backend.regread._
import nscscc.backend.execute._
import nscscc.backend.writeback._
import nscscc.mem._
 
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val brMsRedirect   =ValidIO( new brMispredictRedirect )    // 误预测重定向
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
  val lsEnq    = new LsEnqIO
  val toMemResult  = Vec(2, Decoupled(new ExeResult) )
  val fromMemResult  = Flipped (Vec(2, Decoupled(new ExeResult) ))
  val commitToSq  = new RobCommitToSq

  val debugCommit  = new RobCommitIO
  val debugLogicRegs = Output(Vec(IntLogicRegs, UInt(XLEN.W)))
}

class Backend(implicit p: Parameters) extends NSModule with HasCoreParameters {
  val io = IO(new BackendIO)
 
  // ══════════════════════════════════════════════════════════════
  //  模块实例化
  // ══════════════════════════════════════════════════════════════
  val ctrlBlock   = Module(new CtrlBlock)
  io.debugCommit <> ctrlBlock.io.debugCommit

  io.commitToSq <> ctrlBlock.io.commitToSq
  
  io.lsEnq <> ctrlBlock.io.lsEnq
  dontTouch(ctrlBlock.io.debugCommit)
  val scheduler   = Module(new Scheduler)
  val regRead     = Module(new RegisterRead)
  val regFile     = Module(new RegFile)
  // ══════════════════════════════════════════════════════════════
  //  全局调试信号连接：生成最终的逻辑寄存器架构状态
  // ══════════════════════════════════════════════════════════════
  val archState = ctrlBlock.io.debugArchState
  val phyState  = regFile.io.debugState

  // 遍历 32 个逻辑寄存器，用架构表的值作为物理寄存器堆的索引
  for (i <- 0 until IntLogicRegs) {
    io.debugLogicRegs(i) := phyState(archState(i))
  }
  dontTouch(io.debugLogicRegs)


 
  // 3 个执行单元：
  //   eu0: Q1 → ALU + CSR
  //   eu1: Q2 → ALU + DIV
  //   eu2: Q3 → ALU + MUL + BRU
  val exeUnits = Seq(
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasCsr = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasDiv = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasBru = true, hasMul = true))),

    Module(new ExeUnit(ExeUnitParams(hasMemAddr = true))),
    Module(new ExeUnit(ExeUnitParams(hasStd = true)))
  )
  val numExeUnits = exeUnits.length  // 3

  val brMsRedirectFromExe3 =  exeUnits(2).io.brMsRedirect
  dontTouch(brMsRedirectFromExe3)
  io.brMsRedirect <> brMsRedirectFromExe3
  ctrlBlock.io.brMsRedirect <> brMsRedirectFromExe3
 
  val writeback = Module(new Writeback(numExeUnits))
 
  // ══════════════════════════════════════════════════════════════
  //  前端指令输入
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.in     <> io.in
  //ctrlBlock.io.flush  := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  // ══════════════════════════════════════════════════════════════
  //  CtrlBlock → Scheduler：IQ 入队
  // ══════════════════════════════════════════════════════════════
  scheduler.io.q1IQEnq <> ctrlBlock.io.q1IQEnq(0)
  scheduler.io.q2IQEnq <> ctrlBlock.io.q2IQEnq(0)
  scheduler.io.q3IQEnq <> ctrlBlock.io.q3IQEnq(0)
  scheduler.io.q4IQEnq <> ctrlBlock.io.q4IQEnq(0)
  scheduler.io.q5IQEnq <> ctrlBlock.io.q5IQEnq(0)
 
  ctrlBlock.io.iqFeedback := scheduler.io.feedback
 
  // ══════════════════════════════════════════════════════════════
  //  Scheduler → RegisterRead：发射
  // ══════════════════════════════════════════════════════════════
  regRead.io.iqIssues(0) <> scheduler.io.q1Issue
  regRead.io.iqIssues(1) <> scheduler.io.q2Issue
  regRead.io.iqIssues(2) <> scheduler.io.q3Issue
  regRead.io.iqIssues(3) <> scheduler.io.q4Issue
  regRead.io.iqIssues(4) <> scheduler.io.q5Issue
 
  // ══════════════════════════════════════════════════════════════
  //  RegisterRead ↔ RegFile：读端口
  // ══════════════════════════════════════════════════════════════
  for (i <- 0 until intRegFileReadPorts) {
    regFile.io.readPorts(i).addr := regRead.io.rfReadAddrs(i)
    regRead.io.rfReadData(i)     := regFile.io.readPorts(i).data
  }
 
  // ══════════════════════════════════════════════════════════════
  //  RegisterRead → ExeUnits：执行请求
  //
  //  通道映射：
  //    ch0 (Q1: ALU+CSR)  → eu0
  //    ch1 (Q2: ALU+DIV)  → eu1
  //    ch2 (Q3: ALU+MUL+BRU) → eu2
  //    ch3 (Q4: LOAD+STA) → 暂不连接（LSU 未实现）
  //    ch4 (Q5: STD)      → 暂不连接（LSU 未实现）
  // ══════════════════════════════════════════════════════════════
  for ((eu, ch) <- exeUnits.zipWithIndex) {
    eu.io.inReq <> regRead.io.exeReqs(ch)
  }
 
  // Q4, Q5 暂不接收（LSU 未实现）
 // regRead.io.exeReqs(3).ready := false.B
 // regRead.io.exeReqs(4).ready := false.B
 
  // ══════════════════════════════════════════════════════════════
  //  ExeUnits → Writeback：执行结果
  // ══════════════════════════════════════════════════════════════
  //前几个执行单元的结果直接传
  for (i <- 0 until numExeUnits -  2) {
    writeback.io.InExeResults(i) <> exeUnits(i).io.outResult
  }
  //发往ISQ的数据
  exeUnits(3).io.outResult <> io.toMemResult(0)
  exeUnits(4).io.outResult <> io.toMemResult(1)
  dontTouch( exeUnits(3).io.outResult )
  dontTouch( exeUnits(4).io.outResult )
//  writeback.io.InExeResults(3).bits.uop <> 0.U.asTypeOf((new DispatchedInst))
//  writeback.io.InExeResults(3).bits.data <> 0.U
//  writeback.io.InExeResults(3).valid <> false.B
//  writeback.io.InExeResults(3).bits.redirect <> 0.U.asTypeOf(Valid(new RedirectInfo))
//
//  writeback.io.InExeResults(4).bits.uop <> 0.U.asTypeOf((new DispatchedInst))
//  writeback.io.InExeResults(4).bits.data <> 0.U
//  writeback.io.InExeResults(4).valid <> false.B
//  writeback.io.InExeResults(4).bits.redirect <> 0.U.asTypeOf(Valid(new RedirectInfo))
  io.fromMemResult(0) <> writeback.io.InExeResults(3)
  io.fromMemResult(1) <> writeback.io.InExeResults(4)

  
  /*
  class ExeResult(implicit p: Parameters) extends NSBundle {
     val uop      = new DispatchedInst
     val data     = UInt(XLEN.W)
     val redirect = Valid(new RedirectInfo)
  }
  */
  
  writeback.io.flush := io.flush
  exeUnits.foreach(_.io.flush := io.flush)
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → RegFile：写端口
  // ══════════════════════════════════════════════════════════════
  writeback.io.rfWritePorts <> regFile.io.writePorts
  dontTouch(writeback.io.rfWritePorts)
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → Scheduler：唤醒广播
  // ══════════════════════════════════════════════════════════════
  scheduler.io.wakeupPorts <> writeback.io.wakeupPorts
  ctrlBlock.io.wakeupPorts <> writeback.io.wakeupPorts
 
  // ═════════════════════════════════════════════════════════════
  //  重定向 / 冲刷
  // ══════════════════════════════════════════════════
  val wbRedirect = writeback.io.redirect
  val ctrlRedirect = ctrlBlock.io.excpEedirect
  val finalRedirect = Mux(wbRedirect.valid, wbRedirect.bits, ctrlRedirect)
 
  io.redirect := 0.U.asTypeOf(new RedirectInfo)//finalRedirect
 
  scheduler.io.redirect      := 0.U.asTypeOf(new RedirectInfo) //wbRedirect.valid || ctrlRedirect.valid
  //scheduler.io.redirect.robIdx := finalRedirect.robIdx
  scheduler.io.flushPipeline       := io.flush
 
  regRead.io.redirect      := 0.U.asTypeOf(new RedirectInfo) //wbRedirect.valid || ctrlRedirect.valid
  //regRead.io.redirect.robIdx := finalRedirect.robIdx
  regRead.io.flushPipeline       := io.flush
 
  // ══════════════════════════════════════════════════════════════
  //  ROB 提交：暂不实现，dontTouch 保留可见性
  // ══════════════════════════════════════════════════════════════
  dontTouch(writeback.io.toRObResults)
  ctrlBlock.io.writeback <> writeback.io.toRObResults


  dontTouch(ctrlBlock.io.lsEnq.req)
}