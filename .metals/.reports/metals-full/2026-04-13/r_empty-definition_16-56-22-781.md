error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala:config.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/config.
	 -chisel3/util/config.
	 -config.
	 -scala/Predef.config.
offset: 117
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/AXI3Crossbar.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSBundle
import @@config.Parameters  // 导入Parameters类型
// 4转1 AXI3转接桥（修复Mux被动类型错误）
class AXI3Crossbar4to1(implicit p: Parameters) extends NSModule {
  val io = IO(new NSBundle {
    // 4个输入AXI3 Master接口（CPU内部模块）
    val in_icache   = Flipped(new AXI3MasterIO)
    val in_dcache   = Flipped(new AXI3MasterIO)
    val in_uncache1 = Flipped(new AXI3MasterIO)
    val in_uncache2 = Flipped(new AXI3MasterIO)
    // 1个输出AXI3 Master接口（对外内存）
    val out         = new AXI3MasterIO
  })

  // --------------------------
  // 1. 仲裁优先级定义
  // --------------------------
  val prio_icache   = 3.U(2.W)
  val prio_dcache   = 2.U(2.W)
  val prio_uncache1 = 1.U(2.W)
  val prio_uncache2 = 0.U(2.W)

  // 各输入端口的请求有效信号（AR/AW通道）
  val req_valid = VecInit(
    io.in_icache.ar.out.arvalid || io.in_icache.aw.out.awvalid,
    io.in_dcache.ar.out.arvalid || io.in_dcache.aw.out.awvalid,
    io.in_uncache1.ar.out.arvalid || io.in_uncache1.aw.out.awvalid,
    io.in_uncache2.ar.out.arvalid || io.in_uncache2.aw.out.awvalid
  )
  val req_prio = VecInit(prio_icache, prio_dcache, prio_uncache1, prio_uncache2)

  // 仲裁选择：最高优先级的有效请求
  val sel_idx = PriorityMux(req_valid.zipWithIndex.map { case (v, i) => v -> i.U })

  // --------------------------
  // 2. AR通道仲裁（拆解为被动类型后Mux）
  // --------------------------
  // 提取各输入端口的AR数据（被动类型）
  val ar_data_icache   = io.in_icache.ar.out
  val ar_data_dcache   = io.in_dcache.ar.out
  val ar_data_uncache1 = io.in_uncache1.ar.out
  val ar_data_uncache2 = io.in_uncache2.ar.out

  // Mux被动类型数据（核心修复点）
  val ar_sel_data = MuxLookup(sel_idx, ar_data_icache)(Seq(
    0.U -> ar_data_icache,
    1.U -> ar_data_dcache,
    2.U -> ar_data_uncache1,
    3.U -> ar_data_uncache2
  ))

  // 输出AR信号：驱动out.ar.out
  io.out.ar.out := ar_sel_data
  // 输入ARready：仅选中的端口接收out.ar.arready
  io.in_icache.ar.arready   := Mux(sel_idx === 0.U, io.out.ar.arready, false.B)
  io.in_dcache.ar.arready   := Mux(sel_idx === 1.U, io.out.ar.arready, false.B)
  io.in_uncache1.ar.arready := Mux(sel_idx === 2.U, io.out.ar.arready, false.B)
  io.in_uncache2.ar.arready := Mux(sel_idx === 3.U, io.out.ar.arready, false.B)

  // --------------------------
  // 3. AW通道仲裁
  // --------------------------
  val aw_data_icache   = io.in_icache.aw.out
  val aw_data_dcache   = io.in_dcache.aw.out
  val aw_data_uncache1 = io.in_uncache1.aw.out
  val aw_data_uncache2 = io.in_uncache2.aw.out

  val aw_sel_data = MuxLookup(sel_idx, aw_data_icache)(Seq(
    0.U -> aw_data_icache,
    1.U -> aw_data_dcache,
    2.U -> aw_data_uncache1,
    3.U -> aw_data_uncache2
  ))

  io.out.aw.out := aw_sel_data
  io.in_icache.aw.awready   := Mux(sel_idx === 0.U, io.out.aw.awready, false.B)
  io.in_dcache.aw.awready   := Mux(sel_idx === 1.U, io.out.aw.awready, false.B)
  io.in_uncache1.aw.awready := Mux(sel_idx === 2.U, io.out.aw.awready, false.B)
  io.in_uncache2.aw.awready := Mux(sel_idx === 3.U, io.out.aw.awready, false.B)

  // --------------------------
  // 4. W通道仲裁
  // --------------------------
  val w_data_icache   = io.in_icache.w.out
  val w_data_dcache   = io.in_dcache.w.out
  val w_data_uncache1 = io.in_uncache1.w.out
  val w_data_uncache2 = io.in_uncache2.w.out

  val w_sel_data = MuxLookup(sel_idx, w_data_icache)(Seq(
    0.U -> w_data_icache,
    1.U -> w_data_dcache,
    2.U -> w_data_uncache1,
    3.U -> w_data_uncache2
  ))

  io.out.w.out := w_sel_data
  io.in_icache.w.wready   := Mux(sel_idx === 0.U, io.out.w.wready, false.B)
  io.in_dcache.w.wready   := Mux(sel_idx === 1.U, io.out.w.wready, false.B)
  io.in_uncache1.w.wready := Mux(sel_idx === 2.U, io.out.w.wready, false.B)
  io.in_uncache2.w.wready := Mux(sel_idx === 3.U, io.out.w.wready, false.B)

  // --------------------------
  // 5. R通道仲裁
  // --------------------------
  // 输出Rready：由选中的输入端口rready驱动
  io.out.r.rready := MuxLookup(sel_idx, io.in_icache.r.rready)(Seq(
    0.U -> io.in_icache.r.rready,
    1.U -> io.in_dcache.r.rready,
    2.U -> io.in_uncache1.r.rready,
    3.U -> io.in_uncache2.r.rready
  ))

  // 输入R信号：仅选中的端口接收out.r.in
  io.in_icache.r.in := Mux(sel_idx === 0.U, io.out.r.in, 0.U.asTypeOf(new AXI3RData))
  io.in_dcache.r.in := Mux(sel_idx === 1.U, io.out.r.in, 0.U.asTypeOf(new AXI3RData))
  io.in_uncache1.r.in := Mux(sel_idx === 2.U, io.out.r.in, 0.U.asTypeOf(new AXI3RData))
  io.in_uncache2.r.in := Mux(sel_idx === 3.U, io.out.r.in, 0.U.asTypeOf(new AXI3RData))

  // --------------------------
  // 6. B通道仲裁
  // --------------------------
  // 输出Bready：由选中的输入端口bready驱动
  io.out.b.bready := MuxLookup(sel_idx, io.in_icache.b.bready)(Seq(
    0.U -> io.in_icache.b.bready,
    1.U -> io.in_dcache.b.bready,
    2.U -> io.in_uncache1.b.bready,
    3.U -> io.in_uncache2.b.bready
  ))

  // 输入B信号：仅选中的端口接收out.b.in
  io.in_icache.b.in := Mux(sel_idx === 0.U, io.out.b.in, 0.U.asTypeOf(new AXI3BData))
  io.in_dcache.b.in := Mux(sel_idx === 1.U, io.out.b.in, 0.U.asTypeOf(new AXI3BData))
  io.in_uncache1.b.in := Mux(sel_idx === 2.U, io.out.b.in, 0.U.asTypeOf(new AXI3BData))
  io.in_uncache2.b.in := Mux(sel_idx === 3.U, io.out.b.in, 0.U.asTypeOf(new AXI3BData))

  // 防止信号优化
  dontTouch(io)
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 