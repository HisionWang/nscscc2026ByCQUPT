package nscscc.util

import chisel3._
import chisel3.util._

class SimpleBlockRAM(
  val depth: Int = 1024,
  val width: Int = 32,
  val readLatency: Int = 2,
  val initVals: Option[Seq[BigInt]] = None // 新增可选参数，默认是 None
) extends Module {
  val addrWidth = log2Ceil(depth)
  
  val io = IO(new Bundle {
    // ... 原本的 IO 定义保持不变 ...
    val wr_en    = Input(Bool())
    val wr_addr  = Input(UInt(addrWidth.W))
    val wr_data  = Input(UInt(width.W))
    val rd_en    = Input(Bool())
    val rd_addr  = Input(UInt(addrWidth.W))
    val rd_data  = Output(UInt(width.W))
    val rd_valid = Output(Bool())
  })
  
  // ==================== 初始化逻辑判断 ====================
  val mem = initVals match {
    case Some(vals) => 
      // 如果外部传了值，确保长度正确，并用这些值初始化
      require(vals.length == depth, "传入的初始化数组长度必须等于RAM深度")
      RegInit(VecInit(vals.map(v => v.U(width.W))))
      
    case None =>
      // 如果没传值，默认全 0 初始化
      RegInit(VecInit(Seq.fill(depth)(0.U(width.W))))
  }
  // =========================================================

  val rdPipeline = Reg(Vec(readLatency, Bool()))
  val dataPipeline = Reg(Vec(readLatency, UInt(width.W)))
  
  // ... 剩下的读取和写入逻辑保持不变 ...
  when(io.rd_en) {
    dataPipeline(0) := mem(io.rd_addr)
  }
  
  rdPipeline(0) := io.rd_en
  
  for (i <- 1 until readLatency) {
    dataPipeline(i) := dataPipeline(i-1)
    rdPipeline(i) := rdPipeline(i-1)
  }
  
  io.rd_data := dataPipeline(readLatency-1)
  io.rd_valid := rdPipeline(readLatency-1)
  
  when(io.wr_en) {
    mem(io.wr_addr) := io.wr_data
  }

}