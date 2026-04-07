import chisel3._
import chisel3.util._

// --------------------------
// 被动类型（Passive Type）：纯数据结构，无方向标注
// --------------------------
// AXI3 AR通道数据（纯数据，无方向）

class AXI3ARData extends Bundle {
  val arid    = UInt(4.W)
  val araddr  = UInt(32.W)
  val arlen   = UInt(8.W)
  val arsize  = UInt(3.W)
  val arburst = UInt(2.W)
  val arlock  = UInt(2.W)
  val arcache = UInt(4.W)
  val arprot  = UInt(3.W)
  val arvalid = Bool()
}

// AXI3 AW通道数据（纯数据，无方向）
class AXI3AWData extends Bundle {
  val awid    = UInt(4.W)
  val awaddr  = UInt(32.W)
  val awlen   = UInt(8.W)
  val awsize  = UInt(3.W)
  val awburst = UInt(2.W)
  val awlock  = UInt(2.W)
  val awcache = UInt(4.W)
  val awprot  = UInt(3.W)
  val awvalid = Bool()
}

// AXI3 W通道数据（纯数据，无方向）
class AXI3WData extends Bundle {
  val wid    = UInt(4.W)
  val wdata  = UInt(32.W)
  val wstrb  = UInt(4.W)
  val wlast  = Bool()
  val wvalid = Bool()
}

// AXI3 R通道数据（纯数据，无方向）
class AXI3RData extends Bundle {
  val rid    = UInt(4.W)
  val rdata  = UInt(32.W)
  val rresp  = UInt(2.W)
  val rlast  = Bool()
  val rvalid = Bool()
}

// AXI3 B通道数据（纯数据，无方向）
class AXI3BData extends Bundle {
  val bid    = UInt(4.W)
  val bresp  = UInt(2.W)
  val bvalid = Bool()
}

// --------------------------
// IO类型：带方向标注的接口
// --------------------------
// AXI3 AR通道IO
class AXI3ARChannel extends Bundle {
  // Master输出信号
  val out = Output(new AXI3ARData)
  // Master输入信号
  val arready = Input(Bool())
}

// AXI3 AW通道IO
class AXI3AWChannel extends Bundle {
  // Master输出信号
  val out = Output(new AXI3AWData)
  // Master输入信号
  val awready = Input(Bool())
}

// AXI3 W通道IO
class AXI3WChannel extends Bundle {
  // Master输出信号
  val out = Output(new AXI3WData)
  // Master输入信号
  val wready = Input(Bool())
}

// AXI3 R通道IO
class AXI3RChannel extends Bundle {
  // Master输入信号
  val in = Input(new AXI3RData)
  // Master输出信号
  val rready = Output(Bool())
}

// AXI3 B通道IO
class AXI3BChannel extends Bundle {
  // Master输入信号
  val in = Input(new AXI3BData)
  // Master输出信号
  val bready = Output(Bool())
}

// AXI3 Master完整IO接口
class AXI3MasterIO extends Bundle {
  val ar = new AXI3ARChannel
  val aw = new AXI3AWChannel
  val w  = new AXI3WChannel
  val r  = new AXI3RChannel
  val b  = new AXI3BChannel
}