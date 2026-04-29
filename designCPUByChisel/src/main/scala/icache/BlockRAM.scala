import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
import config.NSBundle

// SimpleBlockRAM 模块（与Xilinx Block Memory IP核兼容）
class SimpleBlockRAM(
  val depth: Int = 1024,
  val width: Int = 32,
  val readLatency: Int = 2
) extends Module {
  val addrWidth = log2Ceil(depth)
  
  val io = IO(new Bundle {
    // 写入端口
    val wr_en    = Input(Bool())
    val wr_addr  = Input(UInt(addrWidth.W))
    val wr_data  = Input(UInt(width.W))
    
    // 读取端口
    val rd_en    = Input(Bool())
    val rd_addr  = Input(UInt(addrWidth.W))
    val rd_data  = Output(UInt(width.W))
    val rd_valid = Output(Bool())  // 数据有效信号
  })
  
  // 真正的双端口块RAM
  val mem = SyncReadMem(depth, UInt(width.W))
  
  // 读取流水线寄存器
  val rdPipeline = Reg(Vec(readLatency, Bool()))
  val dataPipeline = Reg(Vec(readLatency, UInt(width.W)))
  
  // 读取逻辑
  when(io.rd_en) {
    dataPipeline(0) := mem.read(io.rd_addr)
  }.otherwise {
    dataPipeline(0) := 0.U
  }
  rdPipeline(0) := io.rd_en
  
  // 流水线传递
  for (i <- 1 until readLatency) {
    dataPipeline(i) := dataPipeline(i-1)
    rdPipeline(i) := rdPipeline(i-1)
  }
  
  // 输出
  io.rd_data := dataPipeline(readLatency-1)
  io.rd_valid := rdPipeline(readLatency-1)
  
  // 写入逻辑
  when(io.wr_en) {
    mem.write(io.wr_addr, io.wr_data)
  }
}