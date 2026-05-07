
import chisel3._
import ICacheBunble._
import chisel3.util._
import config.Parameters
import config.NSModule
import Frontend._

class IFU(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    
    val redirect = Flipped( new RedirectIO )


    
    val icache_req = new Bundle {
      val addr  = Output(UInt(32.W))
      val ready  = Input(Bool())

      val valid = Output(Bool())
      val kill  = Output(Bool())
    }
    
    val icache_resp = Flipped(Decoupled(new IcacheResp))

    val out = DecoupledIO(new PredecodeResp)

    
    // 到后端的输出
    //val fetch_packet = Decoupled(new Bundle {
    //  val instrs = Output(Vec(fetchWidth, UInt(32.W)))
    //  val pc     = Output(UInt(32.W))
    //})
  
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())

    // 启动地址
    val start_pc = Input(UInt(32.W))
    val start_valid = Input(Bool())

})

  //io.icache_resp.ready := true.B

  


  
  // PC生成器
  val pc_reg = RegInit(0x1C000000.U(32.W))  // LoongArch32R默认起始地址
  val pc_valid = RegInit(false.B)

  val npc = Wire(UInt(32.W))
  val snpc = pc_reg + (fetchWidth * 4).U
  
  npc := Mux(io.redirect.valid, io.redirect.target, 
              snpc//Mux(bpuValid, pnpc, snpc)
            )

  
  // 启动PC
  when(io.start_valid) {
    pc_reg := io.start_pc
    pc_valid := true.B
  }
  when(io.icache_req.ready && pc_valid) {
    pc_reg := snpc
  }
  
  
  // 连接ICache
  io.icache_req.valid := io.icache_req.ready && pc_valid
  io.icache_req.addr := pc_reg
  io.icache_req.kill := false.B


  val predecoder = Module(new Predecoder)
  predecoder.io.in <> io.icache_resp
  predecoder.io.flush <> io.flush
  io.out <> predecoder.io.out

}