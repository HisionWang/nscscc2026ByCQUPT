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
    val out          = Vec(issueWidth, Decoupled(new CtrlFlowIO))
    val backendReady = Input(Vec(issueWidth, Bool()))
 
    // ========== 后端到前端的反馈 ==========
    val redirect       = Flipped(new RedirectIO)

    val bpuUpdateBr    = Input(new BpuUpdateReq)
 
    // ========== AXI3 总线 (ICache访存) ==========
    val axi_master = new AXI3MasterIO
 
    // ========== 控制 ==========
    val flush  = Input(Bool())
    val stall  = Input(Bool())
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
  icache.io.flush := ifu.io.icache_req.flush //Icache 的清零信号
  ifu.io.icache_req.ready := icache.io.cpu_req.ready
 
  // 响应
  ifu.io.icache_resp <> icache.io.icache_resp
 
  // ==================== IFU → IBuffer ====================
  // IFU输出(PredecodeResp) → IBuffer输入
  ibuffer.io.in <> ifu.io.out
 
  // ==================== IBuffer → 后端 ====================
  for (i <- 0 until issueWidth) {
    io.out(i) <> ibuffer.io.out(i)
  }
  ibuffer.io.backendReady := io.backendReady
 
  // ==================== 后端反馈 → IFU ====================
  ifu.io.redirect       <> io.redirect

  ifu.io.bpuUpdateBr    := io.bpuUpdateBr
 
  // ==================== IBuffer flush ====================
  // 前端redirect: 不清空IBuffer (错误指令入队前已截断)
  // 后端redirect: 延迟一拍清空IBuffer
  ibuffer.io.flush := io.redirect.valid
 
  // ==================== 控制 ====================
  ifu.io.flush  := io.flush
  ifu.io.stall  := io.stall
 
  // ==================== AXI3 总线 ====================
  io.axi_master <> icache.io.axi_master
}