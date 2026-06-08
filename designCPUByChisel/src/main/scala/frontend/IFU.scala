package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.icache._
 
class IFU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 前后端后端重定向输入
    val redirect = Flipped(new RedirectIO)
    val frontendRedirect = Input(new FrontendRedirect)

    
    // BPU接口
    val predictReq   = Output(new BpuPredictReq)
    val predictFire  = Output(Bool())   // 预测结果被实际使用(请求成功发射到ICache)
    val predictResp  = Input(new BpuPredictResp)
    // ICache接口
    val icache_req = new Bundle {
      val addr  = Output(UInt(32.W))
      val valid = Output(Bool())
      val ready = Input(Bool())
      val flush  = Output(Bool())
    }

    val bpuInfoQueuEnq   = DecoupledIO( new bpuInfoBundle )

  })
  // ==================== PC生成单元 ====================
  val pcReg    = RegInit(0x1C000000.U(32.W))
  val pcValid  = RegInit(false.B)
 
  // ==================== 计算下一个PC ====================
  val blockOffset   = pcReg(blockOffBits - 1, 0)
  val bytesInLine   = blockBytes.U - blockOffset
  val instsInLine   = bytesInLine >> 2
  val crossLine     = instsInLine < fetchWidth.U
  val seqPC         = Mux(crossLine,
                          Cat(pcReg(31, blockOffBits) + 1.U, 0.U(blockOffBits.W)),
                          pcReg + (fetchWidth * 4).U)
  val fallThroughPC = seqPC
 
  // ==================== 发起BPU的预测请求 ====================
  io.predictReq.pc := pcReg
  // ==================== 接收预测的结果 ====================
  val bpuTaken  = io.predictResp.taken
  val bpuTarget = io.predictResp.target
  val bpuMeta   = io.predictResp.meta
 
  // 前端重定向
  val frontendRedirect =  io.frontendRedirect
  // 后端重定向
  val backendRedirectValid  = io.redirect.valid
  val backendRedirectTarget = io.redirect.target
 
  // 下一拍PC选择 (优先级: 后端redirect > 前端redirect > BPU预测 > 顺序)
  val nextPC = Mux(  backendRedirectValid   ,  backendRedirectTarget   ,
               Mux(  frontendRedirect.valid ,  frontendRedirect.target ,
               Mux(  bpuTaken               ,  bpuTarget               ,
                                               seqPC                   )))
 
  // pcReg将要进入Icache条件
  val pc_fire = (io.icache_req.ready && io.bpuInfoQueuEnq.ready )&& !backendRedirectValid &&
                !frontendRedirect.valid
 
  // 通知BPU预测结果被使用
  // RAS相关
  io.predictFire := pc_fire
  
  val pcRegRedirect = backendRedirectValid || frontendRedirect.valid
  // 更新PC
  // 什么时候pc可以变了？
  // 1.当当前pc被icahe成功接收之后
  // 2.当重定向来了之后，流水线最尖端的位置是没有flush的
  //   所以重定向来了之后强制变pc
  when(pc_fire || pcRegRedirect) {
    pcReg := nextPC
  }
 
  // ==================== ICache请求 ====================
  io.icache_req.addr  := pcReg
  io.icache_req.valid := !backendRedirectValid &&
                         !frontendRedirect.valid //当重定向来了之后，不给Cache发当前请求
  io.icache_req.flush  := backendRedirectValid || frontendRedirect.valid
 
  
  val currentPredInfo = Wire(new bpuInfoBundle)
  currentPredInfo.pc          := pcReg
  currentPredInfo.fallThrough := fallThroughPC
  currentPredInfo.taken       := bpuTaken
  currentPredInfo.target      := bpuTarget
  currentPredInfo.takenOffset := io.predictResp.takenOffset
  currentPredInfo.meta        := bpuMeta
  // ==================== bpuInfoQueue请求 ====================
  io.bpuInfoQueuEnq.valid := pc_fire
  io.bpuInfoQueuEnq.bits  := currentPredInfo

}