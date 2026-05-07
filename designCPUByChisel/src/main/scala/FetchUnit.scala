
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
 
class FetchUnit(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    // 连接ICache
    val icache_req = new Bundle {
      val addr  = Output(UInt(32.W))
      val ready  = Input(Bool())

      val valid = Output(Bool())
      val kill  = Output(Bool())
    }
    
    val icache_resp = new Bundle {
      val instrs = Input(Vec(fetchWidth, UInt(32.W)))
      val addr   = Input(UInt(32.W))
      val valid  = Input(Bool())
      val miss   = Input(Bool())
    }
    
    // 到后端的输出
    val fetch_packet = Decoupled(new Bundle {
      val instrs = Output(Vec(fetchWidth, UInt(32.W)))
      val pc     = Output(UInt(32.W))
    })
    
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())
    
    // 启动地址
    val start_pc = Input(UInt(32.W))
    val start_valid = Input(Bool())
  })
  
  // PC生成器
  val pc_reg = RegInit(0x1C000000.U(32.W))  // LoongArch32R默认起始地址
  val pc_valid = RegInit(false.B)
  
  // 启动PC
  when(io.start_valid) {
    pc_reg := io.start_pc
    pc_valid := true.B
  }
  
  // 简单的线性PC递增 (没有分支预测)
  val fetch_state = RegInit(0.U(2.W))
  val s_IDLE :: s_FETCH :: s_WAIT :: Nil = Enum(3)
  
  // 连接ICache
  io.icache_req.valid := io.icache_req.ready && pc_valid
  io.icache_req.addr := pc_reg
  io.icache_req.kill := false.B
  
  when(io.icache_req.ready && pc_valid) {
    pc_reg := pc_reg + (fetchWidth * 4).U
  }
  
  // 状态机
  switch(fetch_state) {
    is(s_IDLE) {
      when(!io.stall && pc_valid) {
        fetch_state := s_FETCH
      }
    }
    is(s_FETCH) {
      when(io.icache_req.valid && !io.stall) {
        fetch_state := s_WAIT
      }
    }
    is(s_WAIT) {

      when(io.icache_resp.valid) {
        fetch_state := s_IDLE
        //pc_reg := pc_reg + 16.U
      }.elsewhen(io.flush) {
        fetch_state := s_IDLE
      }

    }
  }

  
  // 输出到后端
  io.fetch_packet.valid := io.icache_resp.valid && fetch_state === s_WAIT
  io.fetch_packet.bits.instrs := io.icache_resp.instrs
  io.fetch_packet.bits.pc := io.icache_resp.addr
  
  // Flush处理
  when(io.flush) {
    fetch_state := s_IDLE
    // 可以在这里重置PC到跳转目标
  }
}