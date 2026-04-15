error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/icache.scala:local5
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/icache.scala
empty definition using pc, found symbol in pc: local5
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/mainPipe/io/data_read/req/idx.
	 -chisel3/mainPipe/io/data_read/req/idx#
	 -chisel3/mainPipe/io/data_read/req/idx().
	 -chisel3/util/mainPipe/io/data_read/req/idx.
	 -chisel3/util/mainPipe/io/data_read/req/idx#
	 -chisel3/util/mainPipe/io/data_read/req/idx().
	 -mainPipe/io/data_read/req/idx.
	 -mainPipe/io/data_read/req/idx#
	 -mainPipe/io/data_read/req/idx().
	 -scala/Predef.mainPipe.io.data_read.req.idx.
	 -scala/Predef.mainPipe.io.data_read.req.idx#
	 -scala/Predef.mainPipe.io.data_read.req.idx().
offset: 2266
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/icache.scala
text:
```scala


import chisel3._
import chisel3.util._

import config.Parameters
import config.NSModule
 
class ICache(implicit p: Parameters) extends NSModule {
  
  
  val io = IO(new Bundle {
    // CPU接口
    val cpu_if = new Bundle {
      val req_addr  = Input(UInt(32.W))
      val req_valid = Input(Bool())
      val req_kill  = Input(Bool())
      
      val resp_instrs = Output(Vec(fetchWidth, UInt(32.W)))
      val resp_addr   = Output(UInt(32.W))
      val resp_valid  = Output(Bool())
      val resp_miss   = Output(Bool())
    }
    
    // AXI3 Master接口
    val axi_master = new AXI3MasterIO
    
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())
  })
  
  // === 子模块实例化 ===
  
  val mainPipe = Module(new ICacheMainPipe)
  val missUnit = Module(new ICacheMissUnit)
  val metaArray = Module(new ICacheMetaArray)
  val dataArray = Module(new ICacheDataArray)
  val replacer = Module(new ICacheReplacer)
  
  
  // === 连接CPU接口 ===
  
  mainPipe.io.cpu_req.addr   := io.cpu_if.req_addr
  mainPipe.io.cpu_req.valid  := io.cpu_if.req_valid
  mainPipe.io.cpu_req.kill   := io.cpu_if.req_kill
  mainPipe.io.flush          := io.flush
  mainPipe.io.stall          := io.stall

  
  
  io.cpu_if.resp_instrs := mainPipe.io.cpu_resp.instrs
  io.cpu_if.resp_addr   := mainPipe.io.cpu_resp.addr
  io.cpu_if.resp_valid  := mainPipe.io.cpu_resp.valid
  io.cpu_if.resp_miss   := mainPipe.io.cpu_resp.miss
  
  // === 连接MainPipe和MetaArray ===
  
  // Meta读取
  metaArray.io.read.valid := mainPipe.io.meta_read.req.valid
  metaArray.io.read.idx   := mainPipe.io.meta_read.req.idx
  mainPipe.io.meta_read.resp.data := metaArray.io.read.data
  
  // Meta写入 (来自MissUnit)
  metaArray.io.write.valid := missUnit.io.meta_write.valid
  metaArray.io.write.idx   := missUnit.io.meta_write.idx
  metaArray.io.write.way   := missUnit.io.meta_write.way
  metaArray.io.write.tag   := missUnit.io.meta_write.tag
  metaArray.io.write.data  := missUnit.io.meta_write.data
  
  // Meta Flush
  metaArray.io.flush.valid := mainPipe.io.meta_flush.valid
  metaArray.io.flush.idx   := mainPipe.io.meta_flush.idx
  
  // === 连接MainPipe和DataArray ===
  
  // Data读取
  dataArray.io.read.valid := mainPipe.io.data_read.req.valid
  dataArray.io.read.idx   := mainPipe.io.data_read.req.i@@dx
  mainPipe.io.data_read.resp.data := dataArray.io.read.data
  
  // Data写入 (来自MissUnit)
  dataArray.io.write.valid := missUnit.io.data_write.valid
  dataArray.io.write.idx   := missUnit.io.data_write.idx
  dataArray.io.write.way   := missUnit.io.data_write.way
  dataArray.io.write.data  := missUnit.io.data_write.data
  
  // Data Flush
  dataArray.io.flush.valid := mainPipe.io.data_flush.valid
  dataArray.io.flush.idx   := mainPipe.io.data_flush.idx
  
  // === 连接Miss处理 ===
  
  missUnit.io.req.valid := mainPipe.io.miss_req.valid
  missUnit.io.req.bits := mainPipe.io.miss_req.bits
  mainPipe.io.miss_req.ready := missUnit.io.req.ready
  
  mainPipe.io.miss_resp.valid := missUnit.io.resp.valid
  mainPipe.io.miss_resp.bits := missUnit.io.resp.bits
  
  // === 连接Replacer ===
  
  replacer.io.touch.valid := mainPipe.io.replacer_touch.valid
  replacer.io.touch.idx   := mainPipe.io.replacer_touch.idx
  replacer.io.touch.way   := mainPipe.io.replacer_touch.way
  
  replacer.io.victim.req := mainPipe.io.replacer_victim.req
  replacer.io.victim.idx := mainPipe.io.replacer_victim.idx
  mainPipe.io.replacer_victim.resp := replacer.io.victim.resp
  
  replacer.io.flush.valid := mainPipe.io.replacer_flush.valid
  replacer.io.flush.idx   := mainPipe.io.replacer_flush.idx
  
  // === 连接AXI3接口 ===
  
  // AR通道
  io.axi_master.ar.data.arid    := missUnit.io.axi.ar_out.arid
  io.axi_master.ar.data.araddr  := missUnit.io.axi.ar_out.araddr
  io.axi_master.ar.data.arlen   := missUnit.io.axi.ar_out.arlen
  io.axi_master.ar.data.arsize  := missUnit.io.axi.ar_out.arsize
  io.axi_master.ar.data.arburst := missUnit.io.axi.ar_out.arburst
  io.axi_master.ar.data.arlock  := missUnit.io.axi.ar_out.arlock
  io.axi_master.ar.data.arcache := missUnit.io.axi.ar_out.arcache
  io.axi_master.ar.data.arprot  := missUnit.io.axi.ar_out.arprot
  io.axi_master.ar.data.arvalid := missUnit.io.axi.ar_out.arvalid
  
  missUnit.io.axi.ar_ready := io.axi_master.ar.arready
  
  // R通道
  missUnit.io.axi.r_in.rid    := io.axi_master.r.data.rid
  missUnit.io.axi.r_in.rdata  := io.axi_master.r.data.rdata
  missUnit.io.axi.r_in.rresp  := io.axi_master.r.data.rresp
  missUnit.io.axi.r_in.rlast  := io.axi_master.r.data.rlast
  missUnit.io.axi.r_in.rvalid := io.axi_master.r.data.rvalid
  
  io.axi_master.r.rready := missUnit.io.axi.r_ready
  
  // 写通道 (ICache是只读的，全部无效化)
  io.axi_master.aw.data.awid    := 0.U
  io.axi_master.aw.data.awaddr  := 0.U
  io.axi_master.aw.data.awlen   := 0.U
  io.axi_master.aw.data.awsize  := 0.U
  io.axi_master.aw.data.awburst := 0.U
  io.axi_master.aw.data.awlock  := 0.U
  io.axi_master.aw.data.awcache := 0.U
  io.axi_master.aw.data.awprot  := 0.U
  io.axi_master.aw.data.awvalid := false.B
  
  io.axi_master.w.data.wid    := 0.U
  io.axi_master.w.data.wdata  := 0.U
  io.axi_master.w.data.wstrb  := 0.U
  io.axi_master.w.data.wlast  := false.B
  io.axi_master.w.data.wvalid := false.B
  
  io.axi_master.b.bready := true.B
  
  println("ICache instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, BlockBytes: $blockBytes")
  println(s"  FetchWidth: $fetchWidth, MSHR: $nMSHR, Replacer: $replacer")
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: local5