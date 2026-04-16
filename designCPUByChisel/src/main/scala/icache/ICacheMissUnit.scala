import chisel3._
import chisel3.util._

import config.Parameters
import config.NSModule

class ICacheMissUnit(implicit p: Parameters) extends NSModule {

  
  val io = IO(new Bundle {
    // 请求接口
    val req = new Bundle {
      val valid = Input  (Bool())
      val ready = Output (Bool())
      val bits  = Input (new Bundle {
        val addr       = UInt(32.W)
        val idx        = UInt(idxBits.W)
        val tag        = UInt(tagBits.W)
        val victim_way = UInt(wayBits.W)
      })
    }
    
    // 响应接口
    val resp = Output(new Bundle {
      val valid = Bool()
      val bits  = new Bundle {
        val data = UInt((blockBytes * 8).W)
        val idx  = UInt(idxBits.W)
        val tag  = UInt(tagBits.W)
      }
    })
    
    val meta_write = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val tag   = UInt(tagBits.W)
      val data  = Vec(nWays, new Bundle {
        val valid = Bool()
        val tag   = UInt(tagBits.W)
      })
    })
    
    val data_write = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
      val data  = UInt((blockBytes * 8).W)
    })
    
    // AXI3接口
    val axi = new Bundle {
      val ar_out = Output(new AXI3ARData)
      val ar_ready = Input(Bool())
      val r_in = Input(new AXI3RData)
      val r_ready = Output(Bool())
    }
  })
  
  // === 状态机 ===
  val s_IDLE :: s_ADDR :: s_DATA :: s_WRITE :: s_RESP :: Nil = Enum(5)
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
  
  // === 修复1：为所有输出信号设置默认值 ===
  // 这是解决 "Reference io is not fully initialized" 错误的关键
  
  // 1. req.ready 默认值
  io.req.ready := false.B
  
  // 2. resp 默认值
  io.resp.valid := false.B
  io.resp.bits.data := 0.U
  io.resp.bits.idx := 0.U
  io.resp.bits.tag := 0.U
  
  // 3. meta_write 默认值
  io.meta_write.valid := false.B
  io.meta_write.idx := 0.U
  io.meta_write.way := 0.U
  io.meta_write.tag := 0.U
  for (i <- 0 until nWays) {
    io.meta_write.data(i).valid := false.B
    io.meta_write.data(i).tag := 0.U
  }
  
  // 4. data_write 默认值
  io.data_write.valid := false.B
  io.data_write.idx := 0.U
  io.data_write.way := 0.U
  io.data_write.data := 0.U
  
  // 5. AXI3 AR通道默认值
  io.axi.ar_out.arid    := 0.U
  io.axi.ar_out.araddr  := 0.U
  io.axi.ar_out.arlen   := 0.U
  io.axi.ar_out.arsize  := 0.U
  io.axi.ar_out.arburst := 0.U
  io.axi.ar_out.arlock  := 0.U
  io.axi.ar_out.arcache := 0.U
  io.axi.ar_out.arprot  := 0.U
  io.axi.ar_out.arvalid := false.B
  
  // 6. AXI3 R通道默认值
  io.axi.r_ready := false.B
  
  // === 状态机逻辑 ===
  switch(state) {
    is(s_IDLE) {
      // IDLE状态：等待请求
      io.req.ready := true.B
      
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
      // ADDR状态：发送AXI3读地址
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
      // DATA状态：接收AXI3读数据
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
      // WRITE状态：写入缓存阵列
      
      // 1. 写入Meta Array
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
      
      // 2. 写入Data Array
      io.data_write.valid := true.B
      io.data_write.idx := req_idx
      io.data_write.way := req_victim_way
      io.data_write.data := data_buffer.asUInt
      
      state := s_RESP
    }
    
    is(s_RESP) {
      // RESP状态：响应CPU
      io.resp.valid := true.B
      io.resp.bits.data := data_buffer.asUInt
      io.resp.bits.idx := req_idx
      io.resp.bits.tag := req_tag
      
      // 返回IDLE状态
      state := s_IDLE
      req_valid := false.B
      
      // 清空缓冲区
      for (i <- 0 until blockBytes/4) {
        data_buffer(i) := 0.U
      }
    }
  }
}