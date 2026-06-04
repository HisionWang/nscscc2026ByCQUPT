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
    // 后端重定向
    val redirect = Flipped(new RedirectIO)

    // ICache接口
    val icache_req = new Bundle {
      val addr  = Output(UInt(32.W))
      val valid = Output(Bool())
      val ready = Input(Bool())
      val flush  = Output(Bool())
    }
    val icache_resp = Flipped(Decoupled(new IcacheResp))
 
    // 输出到IBuffer
    val out = Decoupled(new PredecodeResp)
 
    // 前端重定向信号(供IBuffer,ICache等使用)
    val frontend_redirect = Output(new FrontendRedirect)


    val bpuUpdateBr    = Input(new BpuUpdateReq)
  })
 
  // ==================== 子模块实例化 ====================
  val bpu       = Module(new BPU)
  val predecoder = Module(new Predecoder)
 
  // 预测信息队列(跟踪ICache流水线中的BPU预测)
  val bpuInfoQueue = Module(new FlushableQueue(new bpuInfoBundle, entries = 8))
 
  // ==================== PC生成单元 ====================
  val pcReg    = RegInit(0x1C000000.U(32.W))
  val pcValid  = RegInit(false.B)
 
  // 顺序下一个PC (考虑cache line边界)
  val blockOffset   = pcReg(blockOffBits - 1, 0)
  val bytesInLine   = blockBytes.U - blockOffset
  val instsInLine   = bytesInLine >> 2
  val crossLine     = instsInLine < fetchWidth.U
  val seqPC         = Mux(crossLine,
                          Cat(pcReg(31, blockOffBits) + 1.U, 0.U(blockOffBits.W)),
                          pcReg + (fetchWidth * 4).U)
  val fallThroughPC = seqPC
 
  // BPU预测
  bpu.io.predictReq.pc := pcReg
  val bpuTaken  = bpu.io.predictResp.taken
  val bpuTarget = bpu.io.predictResp.target
  val bpuMeta   = bpu.io.predictResp.meta
 
  // 前端重定向(来自预译码, 寄存一拍后生效)
  val frontendRedirectReg =  Wire(new FrontendRedirect) //Reg(new FrontendRedirect)
  frontendRedirectReg := io.frontend_redirect
 
  // 后端重定向
  val backendRedirectValid  = io.redirect.valid
  val backendRedirectTarget = io.redirect.target
 
  // 下一拍PC选择 (优先级: 后端redirect > 前端redirect > BPU预测 > 顺序)
  val nextPC = Mux(backendRedirectValid,                backendRedirectTarget,
               Mux(frontendRedirectReg.valid,           frontendRedirectReg.target,
               Mux(bpuTaken,                            bpuTarget,
                                                   seqPC)))
 
  // pcReg将要进入Icache条件
  val pc_fire = (io.icache_req.ready && bpuInfoQueue.io.enq.ready )&& !backendRedirectValid &&
                !frontendRedirectReg.valid
 
  // 通知BPU预测结果被使用
  // RAS相关
  bpu.io.predictFire := pc_fire
  
  val pcRegRedirect = backendRedirectValid || frontendRedirectReg.valid
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
                         !frontendRedirectReg.valid //当重定向来了之后，不给Cache发当前请求
  io.icache_req.flush  := backendRedirectValid || frontendRedirectReg.valid
 
  // ==================== BPU的预测信息根据这次PC一起入队 ====================
  val currentPredInfo = Wire(new bpuInfoBundle)
  currentPredInfo.pc          := pcReg
  currentPredInfo.fallThrough := fallThroughPC
  currentPredInfo.taken       := bpuTaken
  currentPredInfo.target      := bpuTarget
  currentPredInfo.takenOffset := bpu.io.predictResp.takenOffset
  currentPredInfo.meta        := bpuMeta
 
  bpuInfoQueue.io.enq.valid := pc_fire
  bpuInfoQueue.io.enq.bits  := currentPredInfo
  bpuInfoQueue.io.flush     := backendRedirectValid || frontendRedirectReg.valid
 
  // ==================== ICache响应 → 预译码 ====================
  // FIFO不为空
  val hasBpuInfo = bpuInfoQueue.io.deq.valid
 
  // 处理正常响应(有预测信息)
  val processResp = io.icache_resp.valid && hasBpuInfo
 
  // ICache响应ready: 有预测信息时取决于预译码, 无预测信息时直接接收丢弃
  io.icache_resp.ready := predecoder.io.icacheResp.ready
 
  // 预测信息出队
  // 1.Cache正确地返还了数据 
  // 2.预译码器时刻准备着
  bpuInfoQueue.io.deq.ready := processResp && predecoder.io.icacheResp.ready
 
  // 连接预译码输入
  predecoder.io.icacheResp <> io.icache_resp
  predecoder.io.bpuInfo      := bpuInfoQueue.io.deq.bits
  predecoder.io.bpuInfoValid := hasBpuInfo
  predecoder.io.flush         := backendRedirectValid || frontendRedirectReg.valid
 
  // 预译码输出
  io.out <> predecoder.io.out
 
  // ==================== 前端重定向 ====================
  // 预译码输出的frontendRedirect寄存一拍后影响PC选择
  // (已在上面通过frontendRedirectReg实现)
  // 当拍直接传递(用于ICache flush等)
  io.frontend_redirect.valid  := predecoder.io.out.bits.frontendRedirect.valid &&
                                  predecoder.io.out.valid
  io.frontend_redirect.target := predecoder.io.out.bits.frontendRedirect.target
 
  // ==================== BPU更新 ====================
  // 来自预译码的快速反馈
  bpu.io.update_pd := predecoder.io.out.bits.bpuUpdate
  // 只有当预译码输出有效时才更新
  bpu.io.update_pd.valid := predecoder.io.out.bits.bpuUpdate.valid &&
                             predecoder.io.out.fire
 
  // 来自后端的精确反馈(暂不连接, 由core_top提供)
  bpu.io.update_br          := io.bpuUpdateBr
 
  // RAS恢复(后端redirect时)
  bpu.io.rasRestore     := backendRedirectValid
  bpu.io.rasRestoreTop  := Mux(backendRedirectValid,
                                io.redirect.rtype,  // 复用rtype字段传递rasTop
                                0.U)
  // 注意: 这里简化了rasTop的传递, 实际应在RedirectIO中增加rasTop字段
  // 或者通过后端redirect的bpuMeta来恢复。当前用rtype字段暂存, 后续需修改。
 
  bpu.io.flush := backendRedirectValid
}