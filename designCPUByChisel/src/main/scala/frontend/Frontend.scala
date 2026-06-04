package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.icache._
import nscscc.axi._
 
class Frontend(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // ========== 到后端的指令输出 ==========
    val out          = Vec(CtrlBlockWidth, Decoupled(new CtrlFlowIO))
 
    // ========== 后端到前端的反馈 ==========
    val redirect       = Flipped(new RedirectIO)
    val bpuUpdateBr    = Input(new BpuUpdateReq)
 
    // ========== AXI3 总线 (ICache访存) ==========
    val axi_master = new AXI3MasterIO
  })
 
  io.out.foreach(_.bits := DontCare)
 
  // ==================== 子模块实例化 ====================
  val ifu      = Module(new IFU)
  val icache   = Module(new ICache) //it's OK
  val ibuffer  = Module(new IBF)
 
  // ==================== IFU ↔ ICache ====================
  // 请求
  icache.io.cpu_req.valid := ifu.io.icache_req.valid
  icache.io.cpu_req.bits.addr := ifu.io.icache_req.addr
  ifu.io.icache_req.ready := icache.io.cpu_req.ready
  icache.io.redirect := ifu.io.icache_req.flush

  // 响应
  ifu.io.icache_resp <> icache.io.icache_resp
 
  // ==================== IFU → IBuffer ====================
  // IFU输出(PredecodeResp) → IBuffer输入
  ibuffer.io.in <> ifu.io.out
 
  // ==================== IBuffer → 后端 ====================
  io.out <> ibuffer.io.out
  
 
  // ==================== 后端反馈 → IFU ====================
  ifu.io.redirect       <> io.redirect

  ifu.io.bpuUpdateBr    := io.bpuUpdateBr
 
  // ==================== IBuffer flush ====================
  // 前端redirect: 不清空IBuffer (错误指令入队前已截断)
  // 后端redirect: 延迟一拍清空IBuffer
  ibuffer.io.flush := io.redirect.valid
 
  // ==================== AXI3 总线 ====================
  io.axi_master <> icache.io.axi_master
}