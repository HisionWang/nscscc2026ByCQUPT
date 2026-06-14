package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.rename._
import nscscc.backend.dispatch._
 
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class Backend(implicit p: Parameters) extends NSModule {
  val io = IO(new BackendIO)
 
  val ctrlBlock = Module(new CtrlBlock)
 
  // ── 前端指令输入 ──
  ctrlBlock.io.in    <> io.in
  ctrlBlock.io.flush := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  // ── 重定向 ──
  io.redirect := ctrlBlock.io.redirect
 
  // ── IQ 入队端口：暂不外传，dontTouch 保留调试可见性 ──
  dontTouch(ctrlBlock.io.aluIQEnq)
  dontTouch(ctrlBlock.io.bruIQEnq)
  dontTouch(ctrlBlock.io.mulDivIQEnq)
  dontTouch(ctrlBlock.io.loadStaIQEnq)
  dontTouch(ctrlBlock.io.stdIQEnq)
 
  // ── IQ 反馈：当前所有队列默认可接收最大端口数 ──
  ctrlBlock.io.iqFeedback.aluCanAccept     := IQEnqPorts.ALU.U
  ctrlBlock.io.iqFeedback.bruCanAccept     := IQEnqPorts.BRU.U
  ctrlBlock.io.iqFeedback.mulDivCanAccept  := IQEnqPorts.MULDIV.U
  ctrlBlock.io.iqFeedback.loadStaCanAccept := IQEnqPorts.LOADSTA.U
  ctrlBlock.io.iqFeedback.stdCanAccept     := IQEnqPorts.STD.U
 
  // ── LSQ：当前未实现，LQ/SQ 默认不满 ──
  ctrlBlock.io.lsEnq.lqFull := false.B
  ctrlBlock.io.lsEnq.sqFull := false.B
  dontTouch(ctrlBlock.io.lsEnq.req)
}