error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala:_empty_/AXI3AWChannel#out.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/io/out/ar/out.
	 -chisel3/util/io/out/ar/out.
	 -io/out/ar/out.
	 -scala/Predef.io.out.ar.out.
offset: 1420
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSBundle
import config.Parameters  // 导入Parameters类型
// 4转1 AXI3转接桥（修复Mux被动类型错误）
// AXI3Crossbar.scala

import config.Parameters
 
 
class AXI3Crossbar4to1(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 4个Master输入
    val in_icache   = new AXI3SlaveIO
    val in_dcache   = new AXI3SlaveIO
    val in_uncache1 = new AXI3SlaveIO
    val in_uncache2 = new AXI3SlaveIO
    
    // 1个Slave输出
    val out = new AXI3MasterIO
  })
  
  // === AR通道仲裁 (Round-Robin) ===
  
  // 提取各master的AR请求
  val ar_icache_valid   = io.in_icache.ar.data.arvalid
  val ar_dcache_valid   = io.in_dcache.ar.data.arvalid
  val ar_uncache1_valid = io.in_uncache1.ar.data.arvalid
  val ar_uncache2_valid = io.in_uncache2.ar.data.arvalid
  
  // AR通道仲裁器
  val ar_arbiter = Module(new Arbiter(new AXI3ARData, 4))
  
  // 连接各master到仲裁器输入
  ar_arbiter.io.in(0).valid := ar_icache_valid
  ar_arbiter.io.in(0).bits  := io.in_icache.ar.data
  ar_arbiter.io.in(1).valid := ar_dcache_valid
  ar_arbiter.io.in(1).bits  := io.in_dcache.ar.data
  ar_arbiter.io.in(2).valid := ar_uncache1_valid
  ar_arbiter.io.in(2).bits  := io.in_uncache1.ar.data
  ar_arbiter.io.in(3).valid := ar_uncache2_valid
  ar_arbiter.io.in(3).bits  := io.in_uncache2.ar.data
  
  // 连接仲裁器输出到slave
  io.out.ar.data <> ar_arbiter.io.out.bits
  io.out.ar.ou@@t.arvalid := ar_arbiter.io.out.valid
  
  // 分发arready回各master
  io.in_icache.ar.arready   := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 0.U
  io.in_dcache.ar.arready   := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 1.U
  io.in_uncache1.ar.arready := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 2.U
  io.in_uncache2.ar.arready := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 3.U
  
  // === R通道路由 (基于ID) ===
  
  // 提取ID用于路由
  val r_id_route = io.out.r.in.rid(3, 2)  // 使用ID的高2位路由
  
  // R通道valid路由到对应的master
  io.in_icache.r.in.rvalid   := io.out.r.in.rvalid && r_id_route === 0.U
  io.in_dcache.r.in.rvalid   := io.out.r.in.rvalid && r_id_route === 1.U
  io.in_uncache1.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 2.U
  io.in_uncache2.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 3.U
  
  // R通道数据广播到所有master（每个master只看valid的）
  when(io.out.r.in.rvalid) {
    io.in_icache.r.in.rid   := io.out.r.in.rid
    io.in_icache.r.in.rdata  := io.out.r.in.rdata
    io.in_icache.r.in.rresp  := io.out.r.in.rresp
    io.in_icache.r.in.rlast  := io.out.r.in.rlast
    io.in_icache.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 0.U
    
    io.in_dcache.r.in.rid   := io.out.r.in.rid
    io.in_dcache.r.in.rdata  := io.out.r.in.rdata
    io.in_dcache.r.in.rresp  := io.out.r.in.rresp
    io.in_dcache.r.in.rlast  := io.out.r.in.rlast
    io.in_dcache.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 1.U
    
    io.in_uncache1.r.in.rid   := io.out.r.in.rid
    io.in_uncache1.r.in.rdata  := io.out.r.in.rdata
    io.in_uncache1.r.in.rresp  := io.out.r.in.rresp
    io.in_uncache1.r.in.rlast  := io.out.r.in.rlast
    io.in_uncache1.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 2.U
    
    io.in_uncache2.r.in.rid   := io.out.r.in.rid
    io.in_uncache2.r.in.rdata  := io.out.r.in.rdata
    io.in_uncache2.r.in.rresp  := io.out.r.in.rresp
    io.in_uncache2.r.in.rlast  := io.out.r.in.rlast
    io.in_uncache2.r.in.rvalid := io.out.r.in.rvalid && r_id_route === 3.U
  }
  
  // R通道rready汇聚
  io.out.r.rready := Mux1H(
    Seq(
      r_id_route === 0.U -> io.in_icache.r.rready,
      r_id_route === 1.U -> io.in_dcache.r.rready,
      r_id_route === 2.U -> io.in_uncache1.r.rready,
      r_id_route === 3.U -> io.in_uncache2.r.rready
    )
  )
  
  // === AW通道仲裁 ===
  
  val aw_arbiter = Module(new Arbiter(new AXI3AWData, 4))
  
  // 连接各master到仲裁器输入
  aw_arbiter.io.in(0).valid := io.in_icache.aw.out.awvalid
  aw_arbiter.io.in(0).bits  := io.in_icache.aw.out
  aw_arbiter.io.in(1).valid := io.in_dcache.aw.out.awvalid
  aw_arbiter.io.in(1).bits  := io.in_dcache.aw.out
  aw_arbiter.io.in(2).valid := io.in_uncache1.aw.out.awvalid
  aw_arbiter.io.in(2).bits  := io.in_uncache1.aw.out
  aw_arbiter.io.in(3).valid := io.in_uncache2.aw.out.awvalid
  aw_arbiter.io.in(3).bits  := io.in_uncache2.aw.out
  
  // 连接仲裁器输出到slave
  io.out.aw.out <> aw_arbiter.io.out.bits
  io.out.aw.out.awvalid := aw_arbiter.io.out.valid
  
  // 分发awready
  io.in_icache.aw.awready   := aw_arbiter.io.out.ready && aw_arbiter.io.chosen === 0.U
  io.in_dcache.aw.awready   := aw_arbiter.io.out.ready && aw_arbiter.io.chosen === 1.U
  io.in_uncache1.aw.awready := aw_arbiter.io.out.ready && aw_arbiter.io.chosen === 2.U
  io.in_uncache2.aw.awready := aw_arbiter.io.out.ready && aw_arbiter.io.chosen === 3.U
  
  // === W通道跟随AW ===
  
  // 记录当前AW的master，用于W通道路由
  val aw_master_valid = RegInit(false.B)
  val aw_master_idx = Reg(UInt(2.W))
  
  when(aw_arbiter.io.out.fire()) {
    aw_master_valid := true.B
    aw_master_idx := aw_arbiter.io.chosen
  }.elsewhen(io.out.w.in.wlast && io.out.w.wvalid && io.out.w.wready) {
    aw_master_valid := false.B
  }
  
  // W通道valid路由
  io.in_icache.w.in.valid   := aw_master_valid && aw_master_idx === 0.U
  io.in_dcache.w.in.valid   := aw_master_valid && aw_master_idx === 1.U
  io.in_uncache1.w.in.valid := aw_master_valid && aw_master_idx === 2.U
  io.in_uncache2.w.in.valid := aw_master_valid && aw_master_idx === 3.U
  
  // W通道数据广播
  when(aw_master_valid) {
    io.in_icache.w.in.wid   := io.out.w.in.wid
    io.in_icache.w.in.wdata  := io.out.w.in.wdata
    io.in_icache.w.in.wstrb  := io.out.w.in.wstrb
    io.in_icache.w.in.wlast  := io.out.w.in.wlast
    io.in_icache.w.in.wvalid := io.out.w.in.wvalid && aw_master_idx === 0.U
    
    io.in_dcache.w.in.wid   := io.out.w.in.wid
    io.in_dcache.w.in.wdata  := io.out.w.in.wdata
    io.in_dcache.w.in.wstrb  := io.out.w.in.wstrb
    io.in_dcache.w.in.wlast  := io.out.w.in.wlast
    io.in_dcache.w.in.wvalid := io.out.w.in.wvalid && aw_master_idx === 1.U
    
    io.in_uncache1.w.in.wid   := io.out.w.in.wid
    io.in_uncache1.w.in.wdata  := io.out.w.in.wdata
    io.in_uncache1.w.in.wstrb  := io.out.w.in.wstrb
    io.in_uncache1.w.in.wlast  := io.out.w.in.wlast
    io.in_uncache1.w.in.wvalid := io.out.w.in.wvalid && aw_master_idx === 2.U
    
    io.in_uncache2.w.in.wid   := io.out.w.in.wid
    io.in_uncache2.w.in.wdata  := io.out.w.in.wdata
    io.in_uncache2.w.in.wstrb  := io.out.w.in.wstrb
    io.in_uncache2.w.in.wlast  := io.out.w.in.wlast
    io.in_uncache2.w.in.wvalid := io.out.w.in.wvalid && aw_master_idx === 3.U
  }
  
  // W通道wready汇聚
  io.out.w.wready := Mux1H(
    Seq(
      aw_master_idx === 0.U -> io.in_icache.w.wready,
      aw_master_idx === 1.U -> io.in_dcache.w.wready,
      aw_master_idx === 2.U -> io.in_uncache1.w.wready,
      aw_master_idx === 3.U -> io.in_uncache2.w.wready
    )
  )
  
  // === B通道路由 (基于ID) ===
  
  val b_id_route = io.out.b.in.bid(3, 2)
  
  // B通道valid路由
  io.in_icache.b.in.valid   := io.out.b.in.bvalid && b_id_route === 0.U
  io.in_dcache.b.in.valid   := io.out.b.in.bvalid && b_id_route === 1.U
  io.in_uncache1.b.in.valid := io.out.b.in.bvalid && b_id_route === 2.U
  io.in_uncache2.b.in.valid := io.out.b.in.bvalid && b_id_route === 3.U
  
  // B通道数据广播
  when(io.out.b.in.bvalid) {
    io.in_icache.b.in.bid   := io.out.b.in.bid
    io.in_icache.b.in.bresp  := io.out.b.in.bresp
    io.in_icache.b.in.bvalid := io.out.b.in.bvalid && b_id_route === 0.U
    
    io.in_dcache.b.in.bid   := io.out.b.in.bid
    io.in_dcache.b.in.bresp  := io.out.b.in.bresp
    io.in_dcache.b.in.bvalid := io.out.b.in.bvalid && b_id_route === 1.U
    
    io.in_uncache1.b.in.bid   := io.out.b.in.bid
    io.in_uncache1.b.in.bresp  := io.out.b.in.bresp
    io.in_uncache1.b.in.bvalid := io.out.b.in.bvalid && b_id_route === 2.U
    
    io.in_uncache2.b.in.bid   := io.out.b.in.bid
    io.in_uncache2.b.in.bresp  := io.out.b.in.bresp
    io.in_uncache2.b.in.bvalid := io.out.b.in.bvalid && b_id_route === 3.U
  }
  
  // B通道bready汇聚
  io.out.b.bready := Mux1H(
    Seq(
      b_id_route === 0.U -> io.in_icache.b.bready,
      b_id_route === 1.U -> io.in_dcache.b.bready,
      b_id_route === 2.U -> io.in_uncache1.b.bready,
      b_id_route === 3.U -> io.in_uncache2.b.bready
    )
  )
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 