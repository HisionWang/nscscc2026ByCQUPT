file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:
	 -chisel3/instr_offset/toInt.
	 -chisel3/instr_offset/toInt#
	 -chisel3/instr_offset/toInt().
	 -chisel3/util/instr_offset/toInt.
	 -chisel3/util/instr_offset/toInt#
	 -chisel3/util/instr_offset/toInt().
	 -instr_offset/toInt.
	 -instr_offset/toInt#
	 -instr_offset/toInt().
	 -scala/Predef.instr_offset.toInt.
	 -scala/Predef.instr_offset.toInt#
	 -scala/Predef.instr_offset.toInt().
offset: 4144
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
      val addr  = UInt(32.W)
      val valid = Bool()
      val kill  = Bool()
    }
    
    val cpu_resp = new Bundle {
      val instrs = Vec(fetchWidth, UInt(32.W))
      val addr   = UInt(32.W)
      val valid  = Bool()
      val miss   = Bool()
    }
    
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())
    
    // SRAM接口
    val meta_read = new Bundle {
      val req  = new Bundle { val valid = Bool(); val idx = UInt(idxBits.W) }
      val resp = Vec(nWays, new Bundle { val valid = Bool(); val tag = UInt(tagBits.W) })
    }
    
    val data_read = new Bundle {
      val req  = new Bundle { val valid = Bool(); val idx = UInt(idxBits.W) }
      val resp = Vec(nWays, UInt((blockBytes * 8).W))
    }
    
    // Miss处理
    val miss_req = new Bundle {
      val valid = Bool()
      val ready = Bool()
      val bits  = new Bundle {
        val addr = UInt(32.W)
        val idx  = UInt(idxBits.W)
        val tag  = UInt(tagBits.W)
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
    
    // 流水线状态输出 (用于调试)
    val s1_fire = Output(Bool())
    val s1_idx  = Output(UInt(idxBits.W))
  })
  
  // === 流水线阶段 ===
  
  // Stage 0: 接收请求
  val s0_valid = RegInit(false.B)
  val s0_addr  = Reg(UInt(32.W))
  val s0_idx   = s0_addr(blockOffBits + idxBits - 1, blockOffBits)
  val s0_tag   = s0_addr(31, blockOffBits + idxBits)
  
  when(io.flush || io.cpu_req.kill) {
    s0_valid := false.B
  }.elsewhen(io.cpu_req.valid && !io.stall) {
    s0_valid := true.B
    s0_addr  := io.cpu_req.addr
  }
  
  // Stage 1: Tag检查
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
  io.meta_read.req.idx  := s1_idx
  
  io.data_read.req.valid := s1_valid  
  io.data_read.req.idx  := s1_idx
  
  io.s1_fire := s1_fire
  io.s1_idx  := s1_idx
  
  // Stage 2: Hit/Miss判断与响应
  val s2_valid = RegInit(false.B)
  val s2_addr  = Reg(UInt(32.W))
  val s2_hit   = Reg(Bool())
  val s2_way   = Reg(UInt(wayBits.W))
  val s2_data  = Reg(UInt((blockBytes * 8).W))
  
  // Tag检查
  val tag_hits = Wire(Vec(nWays, Bool()))
  for (i <- 0 until nWays) {
    tag_hits(i) := io.meta_read.resp(i).valid && 
                   io.meta_read.resp(i).tag === s1_tag
  }
  val s1_hit = tag_hits.asUInt.orR
  val s1_hit_way = OHToUInt(tag_hits)
  
  when(io.flush) {
    s2_valid := false.B
  }.elsewhen(s1_fire) {
    s2_valid := true.B
    s2_addr  := s1_addr
    s2_hit   := s1_hit
    s2_way   := s1_hit_way
    s2_data  := io.data_read.resp(s1_hit_way)
  }
  
  // Miss处理
  io.miss_req.valid := s1_fire && !s1_hit && !io.miss_req.ready
  io.miss_req.bits.addr := s1_addr
  io.miss_req.bits.idx  := s1_idx
  io.miss_req.bits.tag  := s1_tag
  
  // 更新replacer
  io.replacer_touch.valid := s1_fire && s1_hit
  io.replacer_touch.idx  := s1_idx
  io.replacer_touch.way  := s1_hit_way
  
  // 响应CPU
  io.cpu_resp.valid := s2_valid && s2_hit
  io.cpu_resp.miss  := s2_valid && !s2_hit
  
  when(io.cpu_resp.valid) {
    io.cpu_resp.addr := s2_addr
    
    // 从cache line中提取指令
    val byte_offset = s2_addr(5, 2) // 4字节对齐
    for (i <- 0 until fetchWidth) {
      val instr_offset = (byte_offset + i.U) * 4.U
      io.cpu_resp.instrs(i) := s2_data( ( instr_offset.litVa@@lue.toInt + 4) * 8 - 1 , instr_offset.peekInt() * 8 )
    }
  }.otherwise {
    io.cpu_resp.addr := 0.U
    io.cpu_resp.instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
  }
  
  // Miss响应处理
  when(io.miss_resp.valid) {
    s2_valid := true.B
    s2_addr  := Cat(io.miss_resp.bits.tag, io.miss_resp.bits.idx, 0.U(blockOffBits.W))
    s2_hit   := true.B
    s2_data  := io.miss_resp.bits.data
  }
}


```


#### Short summary: 

empty definition using pc, found symbol in pc: 