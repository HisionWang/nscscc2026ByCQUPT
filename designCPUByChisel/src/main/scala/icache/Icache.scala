

import chisel3._
import chisel3.util._

import config.Parameters
import config.NSModule
 
class ICache(implicit p: Parameters) extends NSModule {
  
  
  val io = IO(new Bundle {
    // CPU接口
    val cpu_req = Flipped( Decoupled(new Bundle {
      val addr  = (UInt(32.W))   // 虚拟地址
    }))

    val cpu_resp = new Bundle {
      val valid  = Output(Bool())
      val instrs = Output(Vec(fetchWidth, UInt(32.W)))
      val instvalids = Output(Vec(fetchWidth, Bool()))

      val addr   = Output(UInt(32.W))  // 返回虚拟地址
      val miss   = Output(Bool())
      val uncached   = Output(Bool())
      val mmu_error   = Output(Bool())
   }

   val axi_master         = new AXI3MasterIO
    
  })
  
  // === 子模块实例化 ===
  
  val mainPipe = Module(new ICacheMainPipe)
  val array = Module(new ICacheArray)
  val replacer = Module(new ICacheReplacer)
  val simMMU = Module(new SimpleMMU)
  
  
  // === 连接CPU接口 ===
  
  mainPipe.io.cpu_req  <> io.cpu_req
  mainPipe.io.cpu_resp  <> io.cpu_resp
  mainPipe.io.axi  <> io.axi_master

  mainPipe.io.arrays_read  <> array.io.read
  mainPipe.io.array_write  <> array.io.write
  array.io.flush.valid := false.B
  array.io.flush.idx := 0.U
  //array OK

  mainPipe.io.victim_read  <> replacer.io.victim
  mainPipe.io.replacer_touch  <> replacer.io.touch
  mainPipe.io.mmu <> simMMU.io.mmu

  //simMMU OK
  //mainPipe OK

  replacer.io.flush.valid := false.B
  replacer.io.flush.idx := 0.U

  //replacer OK

  



  
  println("ICache instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, BlockBytes: $blockBytes")
  println(s"  FetchWidth: $fetchWidth, MSHR: $nMSHR, Replacer: $replacer")
}