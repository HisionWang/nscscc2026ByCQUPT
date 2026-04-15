file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/icache.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:
	 -chisel3/cacheParams.
	 -chisel3/util/cacheParams.
	 -cacheParams/cacheParams.
	 -cacheParams.
	 -scala/Predef.cacheParams.
offset: 383
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/icache.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSBundle
import config.Parameters  // 导入Parameters类型
// 迷你指令Cache（彻底修复初始化错误）
// ICache.scala
import config.Parameters
import config.NSRawModule
 
class ICache(implicit p: Parameters) extends NSModule {
  
  val cacheParams = p.getOrElse(ICacheKey, ICacheParams.default)
  import cac@@heParams._
  
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
  
  // === 连接MainPipe和SRAMs ===
  
  // Meta读取
  metaArray.io.read.valid := mainPipe.io.meta_read.req.valid
  metaArray.io.read.idx   := mainPipe.io.meta_read.req.idx
  mainPipe.io.meta_read.resp := metaArray.io.read.data
  
  // Data读取
  dataArray.io.read.valid := mainPipe.io.data_read.req.valid
  dataArray.io.read.idx   := mainPipe.io.data_read.req.idx
  mainPipe.io.data_read.resp := dataArray.io.read.data
  
  // === 连接Miss处理 ===
  
  missUnit.io.req.valid := mainPipe.io.miss_req.valid
  missUnit.io.req.bits := mainPipe.io.miss_req.bits
  mainPipe.io.miss_req.ready := missUnit.io.req.ready
  
  mainPipe.io.miss_resp.valid := missUnit.io.resp.valid
  mainPipe.io.miss_resp.bits := missUnit.io.resp.bits
  
  // Miss Unit访问SRAMs
  metaArray.io.write.valid := missUnit.io.meta_write.valid
  metaArray.io.write.idx   := missUnit.io.meta_write.idx
  metaArray.io.write.way   := missUnit.io.meta_write.way
  metaArray.io.write.tag   := missUnit.io.meta_write.tag
  
  dataArray.io.write.valid := missUnit.io.data_write.valid
  dataArray.io.write.idx   := missUnit.io.data_write.idx
  dataArray.io.write.way   := missUnit.io.data_write.way
  dataArray.io.write.data  := missUnit.io.data_write.data
  
  // Replacer连接
  replacer.io.touch.valid := mainPipe.io.replacer_touch.valid
  replacer.io.touch.idx   := mainPipe.io.replacer_touch.idx
  replacer.io.touch.way   := mainPipe.io.replacer_touch.way
  
  missUnit.io.victim.req := mainPipe.io.miss_req.valid && !mainPipe.io.miss_req.ready
  missUnit.io.victim.idx := mainPipe.io.miss_req.bits.idx
  mainPipe.io.miss_req.bits.victim_way := missUnit.io.victim.resp
  
  // === 连接AXI3接口 (适配新接口) ===
  
  // AR通道
  io.axi_master.ar.out.arid    := missUnit.io.axi.ar_out.arid
  io.axi_master.ar.out.araddr  := missUnit.io.axi.ar_out.araddr
  io.axi_master.ar.out.arlen   := missUnit.io.axi.ar_out.arlen
  io.axi_master.ar.out.arsize  := missUnit.io.axi.ar_out.arsize
  io.axi_master.ar.out.arburst := missUnit.io.axi.ar_out.arburst
  io.axi_master.ar.out.arlock  := missUnit.io.axi.ar_out.arlock
  io.axi_master.ar.out.arcache := missUnit.io.axi.ar_out.arcache
  io.axi_master.ar.out.arprot  := missUnit.io.axi.ar_out.arprot
  io.axi_master.ar.out.arvalid := missUnit.io.axi.ar_out.arvalid
  
  missUnit.io.axi.ar_ready := io.axi_master.ar.arready
  
  // R通道
  missUnit.io.axi.r_in.rid    := io.axi_master.r.in.rid
  missUnit.io.axi.r_in.rdata  := io.axi_master.r.in.rdata
  missUnit.io.axi.r_in.rresp  := io.axi_master.r.in.rresp
  missUnit.io.axi.r_in.rlast  := io.axi_master.r.in.rlast
  missUnit.io.axi.r_in.rvalid := io.axi_master.r.in.rvalid
  
  io.axi_master.r.rready := missUnit.io.axi.r_ready
  
  // 写通道 (ICache是只读的，全部无效化)
  io.axi_master.aw.out.arid    := 0.U
  io.axi_master.aw.out.araddr  := 0.U
  io.axi_master.aw.out.arlen   := 0.U
  io.axi_master.aw.out.arsize  := 0.U
  io.axi_master.aw.out.arburst := 0.U
  io.axi_master.aw.out.arlock  := 0.U
  io.axi_master.aw.out.arcache := 0.U
  io.axi_master.aw.out.arprot  := 0.U
  io.axi_master.aw.out.arvalid := false.B
  
  io.axi_master.w.out.wid    := 0.U
  io.axi_master.w.out.wdata  := 0.U
  io.axi_master.w.out.wstrb  := 0.U
  io.axi_master.w.out.wlast  := false.B
  io.axi_master.w.out.wvalid := false.B
  
  io.axi_master.b.bready := true.B
  
  println("ICache instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, BlockBytes: $blockBytes")
  println(s"  FetchWidth: $fetchWidth, MSHR: $nMSHR, Replacer: $replacer")
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 