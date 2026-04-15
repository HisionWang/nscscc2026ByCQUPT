error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMissUnit.scala:chisel3/package.Bool.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMissUnit.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol chisel3/package.Bool.
empty definition using fallback
non-local guesses:

offset: 280
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMissUnit.scala
text:
```scala

import chisel3._
import chisel3.util._

import config.Parameters
import config.NSModule

class ICacheMissUnit(implicit p: Parameters) extends NSModule {
  
  
  val io = IO(new Bundle {
    // 请求接口
    val req = new Bundle {
      val valid = Bool()
      val ready = Output Bool@@()
      val bits  = new Bundle {
        val addr       = UInt(32.W)
        val idx        = UInt(idxBits.W)
        val tag        = UInt(tagBits.W)
        val victim_way = UInt(wayBits.W)
      }
    }
    
    // 响应接口
    val resp = new Bundle {
      val valid = Bool()
      val bits  = new Bundle {
        val data = UInt((blockBytes * 8).W)
        val idx  = UInt(idxBits.W)
        val tag  = UInt(tagBits.W)
      }
    }
    
    // SRAM写接口
    val meta_write = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val data  = Vec(nWays, new Bundle {
        val valid = Bool()
        val tag   = UInt(tagBits.W)
      })
    }
    
    val data_write = new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val data  = UInt((blockBytes * 8).W)
    }
    
    // AXI3接口
    val axi = new Bundle {
      val ar_out = Output(new AXI3ARData)
      val ar_ready = Input(Bool())
      val r_in = Input(new AXI3RData)
      val r_ready = Output(Bool())
    }
  })
  
  // === 状态机 ===
  val s_IDLE :: s_ADDR :: s_DATA :: s_WRITE :: Nil = Enum(4)
  val state = RegInit(s_IDLE)
  
  // === 请求缓存 ===
  val req_valid = RegInit(false.B)
  val req_addr  = Reg(UInt(32.W))
  val req_idx   = Reg(UInt(idxBits.W))
  val req_tag   = Reg(UInt(tagBits.W))
  val req_victim_way = Reg(UInt(wayBits.W))
  
  // === 数据缓存 ===
  val data_buffer = Reg(Vec(blockBytes / 4, UInt(32.W)))  // 32位传输
  val data_count  = Reg(UInt(log2Ceil(blockBytes / 4 + 1).W))
  
  // === 默认输出 ===
  io.req.ready := state === s_IDLE
  io.resp.valid := false.B
  io.meta_write.valid := false.B
  io.data_write.valid := false.B
  
  // AXI3 AR通道默认值
  io.axi.ar_out.arid    := 0.U
  io.axi.ar_out.araddr  := 0.U
  io.axi.ar_out.arlen   := 0.U
  io.axi.ar_out.arsize  := 0.U
  io.axi.ar_out.arburst := 0.U
  io.axi.ar_out.arlock  := 0.U
  io.axi.ar_out.arcache := 0.U
  io.axi.ar_out.arprot  := 0.U
  io.axi.ar_out.arvalid := false.B
  io.axi.r_ready := false.B
  
  // === 状态机逻辑 ===
  switch(state) {
    is(s_IDLE) {
      when(io.req.valid) {
        req_valid := true.B
        req_addr  := io.req.bits.addr
        req_idx   := io.req.bits.idx
        req_tag   := io.req.bits.tag
        req_victim_way := io.req.bits.victim_way
        
        state := s_ADDR
      }
    }
    
    is(s_ADDR) {
      // 发送AXI3读地址
      io.axi.ar_out.arid    := 0.U  // ICache使用ID=0
      io.axi.ar_out.araddr  := req_addr
      io.axi.ar_out.arlen   := ((blockBytes / 4) - 1).U  // 32位传输
      io.axi.ar_out.arsize  := 2.U  // 4字节传输
      io.axi.ar_out.arburst := 1.U  // INCR
      io.axi.ar_out.arlock  := 0.U
      io.axi.ar_out.arcache := 0.U
      io.axi.ar_out.arprot  := 0.U
      io.axi.ar_out.arvalid := true.B
      
      when(io.axi.ar_ready) {
        state := s_DATA
        data_count := 0.U
      }
    }
    
    is(s_DATA) {
      // 接收AXI3读数据
      io.axi.r_ready := true.B
      
      when(io.axi.r_in.rvalid) {
        data_buffer(data_count) := io.axi.r_in.rdata
        data_count := data_count + 1.U
        
        when(io.axi.r_in.rlast) {
          state := s_WRITE
        }
      }
    }
    
    is(s_WRITE) {
      // 写入Meta Array
      io.meta_write.valid := true.B
      io.meta_write.idx := req_idx
      io.meta_write.way := req_victim_way
      io.meta_write.tag := req_tag
      
      for (i <- 0 until nWays) {
        when(i.U === req_victim_way) {
          io.meta_write.data(i).valid := true.B
          io.meta_write.data(i).tag   := req_tag
        }.otherwise {
          io.meta_write.data(i).valid := false.B
          io.meta_write.data(i).tag   := 0.U
        }
      }
      
      // 写入Data Array
      io.data_write.valid := true.B
      io.data_write.idx := req_idx
      io.data_write.way := req_victim_way
      io.data_write.data := data_buffer.asUInt
      
      state := s_IDLE
      req_valid := false.B
    }
  }
  
  // === 响应处理 ===
  io.resp.valid := state === s_IDLE && req_valid
  io.resp.bits.data := data_buffer.asUInt
  io.resp.bits.idx := req_idx
  io.resp.bits.tag := req_tag
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 