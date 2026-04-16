error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala:_empty_/AXI3Crossbar4to1#ar_arbiter.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol _empty_/AXI3Crossbar4to1#ar_arbiter.
empty definition using fallback
non-local guesses:

offset: 938
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSBundle
import config.Parameters

// 4转1 AXI3转接桥
class AXI3Crossbar4to1(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // === 修复1：正确方向定义 ===
    // 4个输入：Crossbar作为Slave，接收来自Master的请求
    val in_icache   = Flipped(new AXI3MasterIO)  // 从设备接口
    val in_dcache   = Flipped(new AXI3MasterIO)
    val in_uncache1 = Flipped(new AXI3MasterIO)
    val in_uncache2 = Flipped(new AXI3MasterIO)
    
    // 1个输出：Crossbar作为Master，向Slave发起请求
    val out         = new AXI3MasterIO           // 主设备接口
  })
  
  // === AR通道仲裁 (Round-Robin) ===
  
  // 提取各master的AR请求
  val ar_icache_valid   = io.in_icache.ar.data.arvalid
  val ar_dcache_valid   = io.in_dcache.ar.data.arvalid
  val ar_uncache1_valid = io.in_uncache1.ar.data.arvalid
  val ar_uncache2_valid = io.in_uncache2.ar.data.arvalid
  
  // AR通道仲裁器
  val ar_arbiter@@ = Module(new Arbiter(new AXI3ARData, 4))
  
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
  io.out.ar.data.arvalid := ar_arbiter.io.out.valid
  
  // 分发arready回各master
  io.in_icache.ar.arready   := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 0.U
  io.in_dcache.ar.arready   := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 1.U
  io.in_uncache1.ar.arready := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 2.U
  io.in_uncache2.ar.arready := ar_arbiter.io.out.ready && ar_arbiter.io.chosen === 3.U
  
  // === R通道路由 (基于ID) ===
  
  // 提取ID用于路由
  val r_id_route = io.out.r.data.rid(3, 2)  // 使用ID的高2位路由
  
  // === 修复2：R通道完全初始化 ===
  // 为所有R通道信号提供默认值
  
  // 1. 首先为所有R通道信号设置默认值
  io.in_icache.r.data.rvalid   := false.B
  io.in_dcache.r.data.rvalid   := false.B
  io.in_uncache1.r.data.rvalid := false.B
  io.in_uncache2.r.data.rvalid := false.B
  
  // 2. 设置默认的R通道数据（防止出现VOID）
  io.in_icache.r.data.rid    := 0.U
  io.in_dcache.r.data.rid    := 0.U
  io.in_uncache1.r.data.rid  := 0.U
  io.in_uncache2.r.data.rid  := 0.U
  
  io.in_icache.r.data.rdata  := 0.U
  io.in_dcache.r.data.rdata  := 0.U
  io.in_uncache1.r.data.rdata := 0.U
  io.in_uncache2.r.data.rdata := 0.U
  
  io.in_icache.r.data.rresp  := 0.U
  io.in_dcache.r.data.rresp  := 0.U
  io.in_uncache1.r.data.rresp := 0.U
  io.in_uncache2.r.data.rresp := 0.U
  
  io.in_icache.r.data.rlast  := false.B
  io.in_dcache.r.data.rlast  := false.B
  io.in_uncache1.r.data.rlast := false.B
  io.in_uncache2.r.data.rlast := false.B
  
  // 3. 路由R通道数据
  when(io.out.r.data.rvalid) {
    switch(r_id_route) {
      is(0.U) { 
        io.in_icache.r.data := io.out.r.data
      }
      is(1.U) { 
        io.in_dcache.r.data := io.out.r.data
      }
      is(2.U) { 
        io.in_uncache1.r.data := io.out.r.data
      }
      is(3.U) { 
        io.in_uncache2.r.data := io.out.r.data
      }
    }
  }
  
  // 4. R通道rready汇聚
  io.out.r.rready := Mux1H(
    Seq(
      (r_id_route === 0.U) -> io.in_icache.r.rready,
      (r_id_route === 1.U) -> io.in_dcache.r.rready,
      (r_id_route === 2.U) -> io.in_uncache1.r.rready,
      (r_id_route === 3.U) -> io.in_uncache2.r.rready
    )
  )
  
  // === AW通道仲裁 ===
  
  val aw_arbiter = Module(new Arbiter(new AXI3AWData, 4))
  
  // 连接各master到仲裁器输入
  aw_arbiter.io.in(0).valid := io.in_icache.aw.data.awvalid
  aw_arbiter.io.in(0).bits  := io.in_icache.aw.data
  aw_arbiter.io.in(1).valid := io.in_dcache.aw.data.awvalid
  aw_arbiter.io.in(1).bits  := io.in_dcache.aw.data
  aw_arbiter.io.in(2).valid := io.in_uncache1.aw.data.awvalid
  aw_arbiter.io.in(2).bits  := io.in_uncache1.aw.data
  aw_arbiter.io.in(3).valid := io.in_uncache2.aw.data.awvalid
  aw_arbiter.io.in(3).bits  := io.in_uncache2.aw.data
  
  // 连接仲裁器输出到slave
  io.out.aw.data <> aw_arbiter.io.out.bits
  io.out.aw.data.awvalid := aw_arbiter.io.out.valid
  
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
  }.elsewhen(io.out.w.data.wlast && io.out.w.data.wvalid && io.out.w.wready) {
    aw_master_valid := false.B
  }
  
  // === 修复3：W通道完全初始化 ===
  // 为W通道设置默认值
  
  // 1. 设置默认的W通道输出
  io.out.w.data.wid    := 0.U
  io.out.w.data.wdata  := 0.U
  io.out.w.data.wstrb  := 0.U
  io.out.w.data.wlast  := false.B
  io.out.w.data.wvalid := false.B
  
  // 2. 设置默认的wready
  io.in_icache.w.wready   := false.B
  io.in_dcache.w.wready   := false.B
  io.in_uncache1.w.wready := false.B
  io.in_uncache2.w.wready := false.B
  
  // 3. 路由W通道数据
  when(aw_master_valid) {
    switch(aw_master_idx) {
      is(0.U) {
        io.out.w.data := io.in_icache.w.data
        io.in_icache.w.wready := io.out.w.wready
      }
      is(1.U) {
        io.out.w.data := io.in_dcache.w.data
        io.in_dcache.w.wready := io.out.w.wready
      }
      is(2.U) {
        io.out.w.data := io.in_uncache1.w.data
        io.in_uncache1.w.wready := io.out.w.wready
      }
      is(3.U) {
        io.out.w.data := io.in_uncache2.w.data
        io.in_uncache2.w.wready := io.out.w.wready
      }
    }
  }
  
  // === B通道路由 (基于ID) ===
  
  val b_id_route = io.out.b.data.bid(3, 2)
  
  // === 修复4：B通道完全初始化 ===
  // 为所有B通道信号提供默认值
  
  // 1. 首先为所有B通道信号设置默认值
  io.in_icache.b.data.bvalid   := false.B
  io.in_dcache.b.data.bvalid   := false.B
  io.in_uncache1.b.data.bvalid := false.B
  io.in_uncache2.b.data.bvalid := false.B
  
  // 2. 设置默认的B通道数据
  io.in_icache.b.data.bid    := 0.U
  io.in_dcache.b.data.bid    := 0.U
  io.in_uncache1.b.data.bid  := 0.U
  io.in_uncache2.b.data.bid  := 0.U
  
  io.in_icache.b.data.bresp  := 0.U
  io.in_dcache.b.data.bresp  := 0.U
  io.in_uncache1.b.data.bresp := 0.U
  io.in_uncache2.b.data.bresp := 0.U
  
  // 3. 路由B通道数据
  when(io.out.b.data.bvalid) {
    switch(b_id_route) {
      is(0.U) { 
        io.in_icache.b.data := io.out.b.data
      }
      is(1.U) { 
        io.in_dcache.b.data := io.out.b.data
      }
      is(2.U) { 
        io.in_uncache1.b.data := io.out.b.data
      }
      is(3.U) { 
        io.in_uncache2.b.data := io.out.b.data
      }
    }
  }
  
  // 4. B通道bready汇聚
  io.out.b.bready := Mux1H(
    Seq(
      (b_id_route === 0.U) -> io.in_icache.b.bready,
      (b_id_route === 1.U) -> io.in_dcache.b.bready,
      (b_id_route === 2.U) -> io.in_uncache1.b.bready,
      (b_id_route === 3.U) -> io.in_uncache2.b.bready
    )
  )
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 