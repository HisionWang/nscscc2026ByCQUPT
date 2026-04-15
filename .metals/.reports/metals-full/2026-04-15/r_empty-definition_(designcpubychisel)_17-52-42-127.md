error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala:config/HasCoreParameters#idxBits.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol config/HasCoreParameters#idxBits.
empty definition using fallback
non-local guesses:

offset: 1458
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
text:
```scala

 
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
 
class ICacheMainPipe(implicit p: Parameters) extends NSModule {
  

  
  val io = IO(new Bundle {
    // CPU接口
    val cpu_req = new Bundle {
      val addr  = Input(UInt(32.W))
      val valid = Input(Bool())
      val kill  = Input(Bool())
    }
    
    val cpu_resp = new Bundle {
      val instrs = Output(Vec(fetchWidth, UInt(32.W)))
      val addr   = Output(UInt(32.W))
      val valid  = Output(Bool())
      val miss   = Output(Bool())
    }
    
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())
    
    // SRAM接口
    val meta_read = new Bundle {
      val req  = new Bundle { 
        val valid = Input(Bool())
        val idx   = Input(UInt(idxBits.W))
      }
      val resp = new Bundle {
        val data  = Vec(nWays, new Bundle {

          val valid = Input(Bool())
          val tag   = Input(UInt(tagBits.W))
        })
      }
    }
    
    val data_read = new Bundle {
      val req  = new Bundle { 

        val valid = Output(Bool())
        val idx   = Output(UInt(idxBits.W))
      }
      val resp = new Bundle {
        val data = Input(Vec(nWays, UInt((blockBytes * 8).W)))
      }
    }
    
    // Miss处理接口
    val miss_req = new Bundle {
      val valid = Output(Bool()
      val ready = Output(Bool()
      val bits  = Output(new Bundle {
        val addr       = UInt(32.W)
        val idx        = UInt(idx@@Bits.W)
        val tag        = UInt(tagBits.W)
        val victim_way = UInt(wayBits.W)
      }
    }
    
    val miss_resp = new Bundle {
      val valid = Bool()
      val bits  = new Bundle {
        val data = UInt((blockBytes * 8).W)
        val idx  = UInt(idxBits.W)
        val tag  = UInt(tagBits.W)
      }
    }
    
    // Replacer接口
    val replacer_touch = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
    }
    
    // Replacer victim接口
    val replacer_victim = new Bundle {
      val req  = Bool()
      val idx  = UInt(idxBits.W)
      val resp = UInt(wayBits.W)
    }
    
    // Flush SRAM接口
    val meta_flush = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    }
    
    val data_flush = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    }
    
    val replacer_flush = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    }
    
    // 状态输出
    val s1_fire = Output(Bool())
    val s1_idx  = Output(UInt(idxBits.W))
  })
  
  // === 流水线阶段定义 ===
  // Stage 0: 接收请求
  // Stage 1: Tag检查
  // Stage 2: Hit/Miss判断与响应
  
  // === Stage 0: 请求接收 ===
  val s0_valid = RegInit(false.B)
  val s0_addr  = Reg(UInt(32.W))
  val s0_idx   = Wire(UInt(idxBits.W))
  val s0_tag   = Wire(UInt(tagBits.W))
  
  s0_idx := io.cpu_req.addr(blockOffBits + idxBits - 1, blockOffBits)
  s0_tag := io.cpu_req.addr(31, blockOffBits + idxBits)
  
  val s0_fire = io.cpu_req.valid && !io.stall
  
  when(io.flush || io.cpu_req.kill) {
    s0_valid := false.B
  }.elsewhen(s0_fire) {
    s0_valid := true.B
    s0_addr  := io.cpu_req.addr
  }
  
  // === Stage 1: Tag检查 ===
  val s1_valid = RegInit(false.B)
  val s1_addr  = Reg(UInt(32.W))
  val s1_idx   = Reg(UInt(idxBits.W))
  val s1_tag   = Reg(UInt(tagBits.W))
  val s1_fire  = Wire(Bool())
  
  s1_fire := s1_valid && !io.flush && !io.stall
  
  when(io.flush) {
    s1_valid := false.B
  }.elsewhen(s0_valid && !io.stall) {
    s1_valid := true.B
    s1_addr  := s0_addr
    s1_idx   := s0_idx
    s1_tag   := s0_tag
  }
  
  // 连接SRAM读取
  io.meta_read.req.valid := s1_valid
  io.meta_read.req.idx   := s1_idx
  
  io.data_read.req.valid := s1_valid
  io.data_read.req.idx   := s1_idx
  
  // Stage 1输出
  io.s1_fire := s1_fire
  io.s1_idx  := s1_idx
  
  // === Stage 2: Hit/Miss判断 ===
  val s2_valid = RegInit(false.B)
  val s2_addr  = Reg(UInt(32.W))
  val s2_hit   = Reg(Bool())
  val s2_way   = Reg(UInt(wayBits.W))
  val s2_data  = Reg(UInt((blockBytes * 8).W))
  val s2_idx   = Reg(UInt(idxBits.W))
  val s2_tag   = Reg(UInt(tagBits.W))
  
  // Tag检查逻辑
  val tag_hits = Wire(Vec(nWays, Bool()))
  for (i <- 0 until nWays) {
    tag_hits(i) := io.meta_read.resp.data(i).valid && 
                   io.meta_read.resp.data(i).tag === s1_tag
  }
  val s1_hit = tag_hits.asUInt.orR
  val s1_hit_way = OHToUInt(tag_hits)
  
  val s1_data = io.data_read.resp.data(s1_hit_way)
  
  when(io.flush) {
    s2_valid := false.B
  }.elsewhen(s1_fire) {
    s2_valid := true.B
    s2_addr  := s1_addr
    s2_hit   := s1_hit
    s2_way   := s1_hit_way
    s2_data  := s1_data
    s2_idx   := s1_idx
    s2_tag   := s1_tag
  }
  
  // === Miss处理 ===
  io.miss_req.valid := s1_fire && !s1_hit
  io.miss_req.bits.addr := s1_addr
  io.miss_req.bits.idx  := s1_idx
  io.miss_req.bits.tag  := s1_tag
  io.miss_req.bits.victim_way := io.replacer_victim.resp
  
  // Replacer更新
  io.replacer_touch.valid := s1_fire && s1_hit
  io.replacer_touch.idx   := s1_idx
  io.replacer_touch.way   := s1_hit_way
  
  // Replacer victim请求
  io.replacer_victim.req := s1_fire && !s1_hit
  io.replacer_victim.idx := s1_idx
  
  // === 响应CPU ===
  io.cpu_resp.valid := s2_valid && s2_hit
  io.cpu_resp.miss  := s2_valid && !s2_hit
  
  when(io.cpu_resp.valid) {
    io.cpu_resp.addr := s2_addr
    
    // 从cache line中提取指令
    // LoongArch32R: 32位定长指令，4字节对齐
    val byte_offset = s2_addr(5, 2) // cache line内部偏移
    
    for (i <- 0 until fetchWidth) {
      // 计算每个指令在cache line中的位置
      val word_offset = (byte_offset + i.U) % (blockBytes/4).U
      val bit_offset = word_offset * 32.U
      
      val shifted = s2_data >> bit_offset
      io.cpu_resp.instrs(i) := shifted(31, 0)
    }

  }.otherwise {
    io.cpu_resp.addr := 0.U
    io.cpu_resp.instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
  }
  
  // === Miss响应处理 ===
  when(io.miss_resp.valid) {
    s2_valid := true.B
    s2_addr  := Cat(io.miss_resp.bits.tag, io.miss_resp.bits.idx, 0.U(blockOffBits.W))
    s2_hit   := true.B
    s2_data  := io.miss_resp.bits.data
    s2_idx   := io.miss_resp.bits.idx
    s2_tag   := io.miss_resp.bits.tag
  }
  
  // === Flush处理 ===
  when(io.flush) {
    // 发送flush信号到SRAMs和replacer
    io.meta_flush.valid := s1_valid
    io.meta_flush.idx   := s1_idx
    
    io.data_flush.valid := s1_valid
    io.data_flush.idx   := s1_idx
    
    io.replacer_flush.valid := s1_valid
    io.replacer_flush.idx   := s1_idx
  }.otherwise {
    io.meta_flush.valid := false.B
    io.meta_flush.idx   := 0.U
    
    io.data_flush.valid := false.B
    io.data_flush.idx   := 0.U
    
    io.replacer_flush.valid := false.B
    io.replacer_flush.idx   := 0.U
  }
  
  // === 性能计数器 ===
  val perf_hit = RegInit(0.U(32.W))
  val perf_miss = RegInit(0.U(32.W))
  
  when(s1_fire && s1_hit) {
    perf_hit := perf_hit + 1.U
  }
  when(s1_fire && !s1_hit) {
    perf_miss := perf_miss + 1.U
  }
  
  println("ICacheMainPipe instantiated:")
  println(s"  FetchWidth: $fetchWidth, PipelineStages: 3")
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 