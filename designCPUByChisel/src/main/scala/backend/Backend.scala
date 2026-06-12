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
  val out      = Vec(IssueQueueIdx.NUM, Decoupled(new DispatchedInst))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class Backend(implicit p: Parameters) extends NSModule {
  val io = IO(new BackendIO)
 
  val ctrlBlock = Module(new CtrlBlock)
 
  ctrlBlock.io.in    <> io.in
  ctrlBlock.io.out   <> io.out
  ctrlBlock.io.flush := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  io.redirect := ctrlBlock.io.redirect
}