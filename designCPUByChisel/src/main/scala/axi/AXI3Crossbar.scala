package nscscc.axi
 
import chisel3._
import chisel3.util._
import nscscc.config.NSModule
import nscscc.config.Parameters
 
/**
  * AXI3 2-to-1 Crossbar（ID 路由方式，支持乱序写）
  *
  * 将 icache 和 dcache 两个 Master 的 AXI3 请求汇聚到 1 个 Slave 输出。
  *
  * ID 编码规则（由 Parameters 定义）：
  *   - dcache: ID ∈ [0, nMshrEntries)                        例: 0, 1, 2, 3
  *   - icache: ID = icacheAxiMissId, icacheAxiNucacheId       例: 4, 5
  *
  * 路由策略：
  *   - 请求通道 (AR / AW / W)：Arbiter 轮询仲裁，ID 原样透传
  *   - 响应通道 (R / B)      ：依据 rid / bid 路由到对应 Master
  *
  * W 通道与 AW 通道独立仲裁，通过 WID 标识事务归属，天然支持乱序写。
  */
class AXI3Crossbar2to1(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val in_icache = Flipped(new AXI3MasterIO)   // 从 icache 接收请求
    val in_dcache = Flipped(new AXI3MasterIO)   // 从 dcache 接收请求
    val out       = new AXI3MasterIO            // 向外发出请求
  })
 
  // ── ID 路由判断 ─────────────────────────────────────────────
  // rid / bid >= nMshrEntries → icache，否则 → dcache
  private def toIcache(id: UInt): Bool = id >= nMshrEntries.U
 
  // ================================================================
  //  AR 通道：icache / dcache 轮询仲裁
  // ================================================================
  val arArb = Module(new Arbiter(new AXI3ARData, 2))
 
  // 请求接入仲裁器（0 = icache, 1 = dcache）
  arArb.io.in(0).valid := io.in_icache.ar.data.arvalid
  arArb.io.in(0).bits  := io.in_icache.ar.data
  arArb.io.in(1).valid := io.in_dcache.ar.data.arvalid
  arArb.io.in(1).bits  := io.in_dcache.ar.data
 
  // 仲裁器输出 → 外部 Slave
  io.out.ar.data <> arArb.io.out.bits
  io.out.ar.data.arvalid := arArb.io.out.valid
 
  // 外部 Slave 的 arready → 仲裁器 → 胜出的 Master
  arArb.io.out.ready := io.out.ar.arready
  io.in_icache.ar.arready := arArb.io.in(0).ready
  io.in_dcache.ar.arready := arArb.io.in(1).ready
 
  // ================================================================
  //  R 通道：基于 rid 路由响应
  // ================================================================
  val rToIcache = toIcache(io.out.r.data.rid)
 
  // rvalid 只传给 ID 对应的 Master
  io.in_icache.r.data.rvalid := io.out.r.data.rvalid &&  rToIcache
  io.in_dcache.r.data.rvalid := io.out.r.data.rvalid && !rToIcache
 
  // 数据字段透传（仅在 rvalid 为真时对端才采信，但始终赋值避免 latch）
  io.in_icache.r.data.rid   := io.out.r.data.rid
  io.in_icache.r.data.rdata := io.out.r.data.rdata
  io.in_icache.r.data.rresp := io.out.r.data.rresp
  io.in_icache.r.data.rlast := io.out.r.data.rlast
 
  io.in_dcache.r.data.rid   := io.out.r.data.rid
  io.in_dcache.r.data.rdata := io.out.r.data.rdata
  io.in_dcache.r.data.rresp := io.out.r.data.rresp
  io.in_dcache.r.data.rlast := io.out.r.data.rlast
 
  // rready：仅选中 Master 的 rready 传回 Slave
  io.out.r.rready := Mux(rToIcache, io.in_icache.r.rready, io.in_dcache.r.rready)
 
  // ================================================================
  //  AW 通道：icache / dcache 轮询仲裁
  // ================================================================
  val awArb = Module(new Arbiter(new AXI3AWData, 2))
 
  awArb.io.in(0).valid := io.in_icache.aw.data.awvalid
  awArb.io.in(0).bits  := io.in_icache.aw.data
  awArb.io.in(1).valid := io.in_dcache.aw.data.awvalid
  awArb.io.in(1).bits  := io.in_dcache.aw.data
 
  io.out.aw.data <> awArb.io.out.bits
  io.out.aw.data.awvalid := awArb.io.out.valid
 
  awArb.io.out.ready := io.out.aw.awready
  io.in_icache.aw.awready := awArb.io.in(0).ready
  io.in_dcache.aw.awready := awArb.io.in(1).ready
 
  // ================================================================
  //  W 通道：icache / dcache 轮询仲裁（ID 透传，支持乱序）
  //
  //  与 AW 独立仲裁。Master 在 W 数据中携带 WID 标识事务归属，
  //  Slave 依据 WID 将 W 数据与对应的 AW 事务匹配。
  //  不再需要 aw_master_idx 锁定机制。
  // ================================================================
  val wArb = Module(new Arbiter(new AXI3WData, 2))
 
  wArb.io.in(0).valid := io.in_icache.w.data.wvalid
  wArb.io.in(0).bits  := io.in_icache.w.data
  wArb.io.in(1).valid := io.in_dcache.w.data.wvalid
  wArb.io.in(1).bits  := io.in_dcache.w.data
 
  io.out.w.data <> wArb.io.out.bits
  io.out.w.data.wvalid := wArb.io.out.valid
 
  wArb.io.out.ready := io.out.w.wready
  io.in_icache.w.wready := wArb.io.in(0).ready
  io.in_dcache.w.wready := wArb.io.in(1).ready
 
  // ================================================================
  //  B 通道：基于 bid 路由响应
  // ================================================================
  val bToIcache = toIcache(io.out.b.data.bid)
 
  io.in_icache.b.data.bvalid := io.out.b.data.bvalid &&  bToIcache
  io.in_dcache.b.data.bvalid := io.out.b.data.bvalid && !bToIcache
 
  io.in_icache.b.data.bid   := io.out.b.data.bid
  io.in_icache.b.data.bresp := io.out.b.data.bresp
 
  io.in_dcache.b.data.bid   := io.out.b.data.bid
  io.in_dcache.b.data.bresp := io.out.b.data.bresp
 
  io.out.b.bready := Mux(bToIcache, io.in_icache.b.bready, io.in_dcache.b.bready)
}