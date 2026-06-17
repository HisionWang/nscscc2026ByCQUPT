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
 
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class Backend(implicit p: Parameters) extends NSModule with HasCoreParameters {
  val io = IO(new BackendIO)
 
  val ctrlBlock   = Module(new CtrlBlock)
  val scheduler   = Module(new Scheduler)
  val regRead     = Module(new RegisterRead)
  val regFile     = Module(new RegFile)
 
  // ══════════════════════════════════════════════════════════════
  //  前端指令输入
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.in     <> io.in
  ctrlBlock.io.flush  := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  // ══════════════════════════════════════════════════════════════
  //  重定向
  // ══════════════════════════════════════════════════════════════
  io.redirect := ctrlBlock.io.redirect
 
  // ══════════════════════════════════════════════════════════════
  //  CtrlBlock → Scheduler：IQ 入队端口
  // ══════════════════════════════════════════════════════════════
  scheduler.io.q1IQEnq <> ctrlBlock.io.q1IQEnq(0)
  scheduler.io.q2IQEnq <> ctrlBlock.io.q2IQEnq(0)
  scheduler.io.q3IQEnq <> ctrlBlock.io.q3IQEnq(0)
  scheduler.io.q4IQEnq <> ctrlBlock.io.q4IQEnq(0)
  scheduler.io.q5IQEnq <> ctrlBlock.io.q5IQEnq(0)
 
  // ══════════════════════════════════════════════════════════════
  //  Scheduler → CtrlBlock：IQ 反馈
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.iqFeedback := scheduler.io.feedback
 
  // ══════════════════════════════════════════════════════════════
  //  Scheduler → RegisterRead：发射输出
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
  //  RegFile 写端口：执行单元未实现前，全部置无效
  // ══════════════════════════════════════════════════════════════
  for (w <- 0 until intRegFileWritePorts) {
    regFile.io.writePorts(w).valid := false.B
    regFile.io.writePorts(w).addr  := 0.U
    regFile.io.writePorts(w).data  := 0.U
  }
 
  // ══════════════════════════════════════════════════════════════
  //  重定向 / 冲刷：广播到 Scheduler + RegisterRead
  // ══════════════════════════════════════════════════════════════
  scheduler.io.redirect.valid      := io.redirect.valid
  scheduler.io.redirect.robIdx := io.redirect.robIdx
  scheduler.io.flushPipeline       := io.flush
 
  regRead.io.redirect.valid      := io.redirect.valid
  regRead.io.redirect.robIdx := io.redirect.robIdx
  regRead.io.flushPipeline       := io.flush
 
  // ══════════════════════════════════════════════════════════════
  //  写回唤醒端口：执行单元未实现前，全部置无效
  // ══════════════════════════════════════════════════════════════
  for (w <- 0 until IQNumWakeupPorts) {
    scheduler.io.wakeupPorts(w).valid    := false.B
    scheduler.io.wakeupPorts(w).bits.pdst := 0.U
  }
 
  // ══════════════════════════════════════════════════════════════
  //  RegisterRead → 执行单元：执行单元未实现前，dontTouch 保留调试可见性
  // ══════════════════════════════════════════════════════════════
  for (ch <- 0 until IQNum) {
    regRead.io.exeReqs(ch).ready := false.B
    dontTouch(regRead.io.exeReqs(ch))
  }
 
  // ══════════════════════════════════════════════════════════════
  //  LSQ：当前未实现，LQ/SQ 默认不满
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.lsEnq.lqFull := false.B
  ctrlBlock.io.lsEnq.sqFull := false.B
  dontTouch(ctrlBlock.io.lsEnq.req)
}