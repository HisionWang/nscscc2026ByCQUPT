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
 
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class Backend(implicit p: Parameters) extends NSModule with HasCoreParameters {
  val io = IO(new BackendIO)
 
  // ══════════════════════════════════════════════════════════════
  //  模块实例化
  // ══════════════════════════════════════════════════════════════
  val ctrlBlock   = Module(new CtrlBlock)
  val scheduler   = Module(new Scheduler)
  val regRead     = Module(new RegisterRead)
  val regFile     = Module(new RegFile)
 
  // 3 个执行单元：
  //   eu0: Q1 → ALU + CSR
  //   eu1: Q2 → ALU + DIV
  //   eu2: Q3 → ALU + MUL + BRU
  val exeUnits = Seq(
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasCsr = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasDiv = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasBru = true, hasMul = true)))
  )
  val numExeUnits = exeUnits.length  // 3
 
  val writeback = Module(new Writeback(numExeUnits))
 
  // ══════════════════════════════════════════════════════════════
  //  前端指令输入
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.in     <> io.in
  ctrlBlock.io.flush  := io.flush
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
    eu.io.req <> regRead.io.exeReqs(ch)
  }
 
  // Q4, Q5 暂不接收（LSU 未实现）
  regRead.io.exeReqs(3).ready := false.B
  regRead.io.exeReqs(4).ready := false.B
 
  // ══════════════════════════════════════════════════════════════
  //  ExeUnits → Writeback：执行结果
  // ══════════════════════════════════════════════════════════════
  for (i <- 0 until numExeUnits) {
    writeback.io.exeResults(i) := exeUnits(i).io.result
  }
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → RegFile：写端口
  // ══════════════════════════════════════════════════════════════
  writeback.io.rfWritePorts <> regFile.io.writePorts
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → Scheduler：唤醒广播
  // ══════════════════════════════════════════════════════════════
  scheduler.io.wakeupPorts <> writeback.io.wakeupPorts
 
  // ══════════════════════════════════════════════════════════════
  //  重定向 / 冲刷
  // ══════════════════════════════════════════════════════════════
  // 优先级：Writeback 产生的重定向 > CtrlBlock 产生的重定向
  val wbRedirect = writeback.io.redirect
  val ctrlRedirect = ctrlBlock.io.redirect
  val finalRedirect = Mux(wbRedirect.valid, wbRedirect.bits, ctrlRedirect)
 
  io.redirect := finalRedirect
 
  scheduler.io.redirect.valid      := wbRedirect.valid || ctrlRedirect.valid
  scheduler.io.redirect.robIdx := finalRedirect.robIdx
  scheduler.io.flushPipeline       := io.flush
 
  regRead.io.redirect.valid      := wbRedirect.valid || ctrlRedirect.valid
  regRead.io.redirect.robIdx := finalRedirect.robIdx
  regRead.io.flushPipeline       := io.flush
 
  // ══════════════════════════════════════════════════════════════
  //  ROB 提交：暂不实现，dontTouch 保留可见性
  // ══════════════════════════════════════════════════════════════
  dontTouch(writeback.io.commitResults)
 
  // ══════════════════════════════════════════════════════════════
  //  LSQ：当前未实现
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.lsEnq.lqFull := false.B
  ctrlBlock.io.lsEnq.sqFull := false.B
  dontTouch(ctrlBlock.io.lsEnq.req)
}