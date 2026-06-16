package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.rename._
import nscscc.backend.dispatch._
import nscscc.backend.issue._
 
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class Backend(implicit p: Parameters) extends NSModule {
  val io = IO(new BackendIO)
 
  val ctrlBlock = Module(new CtrlBlock)
  val scheduler = Module(new Scheduler)
 
  // ── 前端指令输入 ──
  ctrlBlock.io.in     <> io.in
  ctrlBlock.io.flush  := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  // ── 重定向 ──
  io.redirect := ctrlBlock.io.redirect
 
  // ── IQ 入队端口：CtrlBlock → Scheduler ──
  scheduler.io.q1IQEnq <> ctrlBlock.io.q1IQEnq(0)
  scheduler.io.q2IQEnq <> ctrlBlock.io.q2IQEnq(0)
  scheduler.io.q3IQEnq <> ctrlBlock.io.q3IQEnq(0)
  scheduler.io.q4IQEnq <> ctrlBlock.io.q4IQEnq(0)
  scheduler.io.q5IQEnq <> ctrlBlock.io.q5IQEnq(0)
 
  // ── IQ 反馈：Scheduler → CtrlBlock ──
  ctrlBlock.io.iqFeedback := scheduler.io.feedback
 
  // ── 重定向 / 冲刷：广播到 Scheduler ──
  scheduler.io.redirect.valid      := io.redirect.valid
  scheduler.io.redirect.robIdx     := io.redirect.robIdx
  scheduler.io.flushPipeline       := io.flush
 
  // ── 写回唤醒端口：执行单元未实现前，全部置无效 ──
  for (w <- 0 until IQNumWakeupPorts) {
    scheduler.io.wakeupPorts(w).valid := false.B
    scheduler.io.wakeupPorts(w).bits.pdst := 0.U
  }
 
  // ── 发射输出：读寄存器级未实现前，dontTouch 保留调试可见性 ──
  dontTouch(scheduler.io.q1Issue)
  dontTouch(scheduler.io.q2Issue)
  dontTouch(scheduler.io.q3Issue)
  dontTouch(scheduler.io.q4Issue)
  dontTouch(scheduler.io.q5Issue)
  scheduler.io.q1Issue.ready := true.B
  scheduler.io.q2Issue.ready := true.B
  scheduler.io.q3Issue.ready := true.B
  scheduler.io.q4Issue.ready := true.B
  scheduler.io.q5Issue.ready := true.B
 
  // ── LSQ：当前未实现，LQ/SQ 默认不满 ──
  ctrlBlock.io.lsEnq.lqFull := false.B
  ctrlBlock.io.lsEnq.sqFull := false.B
  dontTouch(ctrlBlock.io.lsEnq.req)
}