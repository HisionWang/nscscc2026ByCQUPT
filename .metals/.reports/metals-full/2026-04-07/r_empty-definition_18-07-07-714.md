error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala:
file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/AXI3Crossbar4to1#
	 -chisel3/util/AXI3Crossbar4to1#
	 -AXI3Crossbar4to1#
	 -scala/Predef.AXI3Crossbar4to1#
offset: 1823
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch

// 代码全是AI写的，应该一坨，但是可以转成v成功
class core_top extends RawModule {
    // 覆盖默认的时钟和复位信号的名称
  val aclk = IO(Input(Clock()))
  val aresetn = IO(Input(Bool()))

  // 中断输入
  val intrpt  = IO(Input(UInt(8.W)))

  // AXI3 AR通道
  val arid    = IO(Output(UInt(4.W)))
  val araddr  = IO(Output(UInt(32.W)))
  val arlen   = IO(Output(UInt(8.W)))
  val arsize  = IO(Output(UInt(3.W)))
  val arburst = IO(Output(UInt(2.W)))
  val arlock  = IO(Output(UInt(2.W)))
  val arcache = IO(Output(UInt(4.W)))
  val arprot  = IO(Output(UInt(3.W)))
  val arvalid = IO(Output(Bool()))
  val arready = IO(Input(Bool()))

  // AXI3 R通道
  val rid     = IO(Input(UInt(4.W)))
  val rdata   = IO(Input(UInt(32.W)))
  val rresp   = IO(Input(UInt(2.W)))
  val rlast   = IO(Input(Bool()))
  val rvalid  = IO(Input(Bool()))
  val rready  = IO(Output(Bool()))

  // AXI3 AW通道
  val awid    = IO(Output(UInt(4.W)))
  val awaddr  = IO(Output(UInt(32.W)))
  val awlen   = IO(Output(UInt(8.W)))
  val awsize  = IO(Output(UInt(3.W)))
  val awburst = IO(Output(UInt(2.W)))
  val awlock  = IO(Output(UInt(2.W)))
  val awcache = IO(Output(UInt(4.W)))
  val awprot  = IO(Output(UInt(3.W)))
  val awvalid = IO(Output(Bool()))
  val awready = IO(Input(Bool()))

  // AXI3 W通道
  val wid     = IO(Output(UInt(4.W)))
  val wdata   = IO(Output(UInt(32.W)))
  val wstrb   = IO(Output(UInt(4.W)))
  val wlast   = IO(Output(Bool()))
  val wvalid  = IO(Output(Bool()))
  val wready  = IO(Input(Bool()))

  // AXI3 B通道
  val bid     = IO(Input(UInt(4.W)))
  val bresp   = IO(Input(UInt(2.W)))
  val bvalid  = IO(Input(Bool()))
  val bready  = IO(Output(Bool()))



  withClockAndReset(aclk, aresetn) {

  
  // --------------------------
  // 模块实例化
  // --------------------------
  val axi_crossbar = Module(new AXI3Cr@@ossbar4to1) //AI写的，暂未检查正误

  val icache       = Module(new MiniICache)

  // 预留扩展接口
  // 重点了解一下关于之里黑盒
  val dcache       = Module(new dcache_BlackBox)//还是黑盒 后续 实现
  val uncache1     = Module(new uncache1_BlackBox)//还是黑盒 后续 实现
  val uncache2     = Module(new uncache2_BlackBox)//还是黑盒 后续 实现

  // --------------------------
  // 0. 与CPU最核心的接口，后续再实现优化
  // --------------------------

  icache.io.cpu_if.req_addr  := 0.U
  icache.io.cpu_if.req_valid := false.B

  dcache.io.cpu_if.req_addr  := 0.U
  dcache.io.cpu_if.req_valid := false.B

  uncache1.io.cpu_if.req_addr  := 0.U
  uncache1.io.cpu_if.req_valid := false.B

  uncache2.io.cpu_if.req_addr  := 0.U
  uncache2.io.cpu_if.req_valid := false.B


  // --------------------------
  // 接口连接
  // --------------------------
  // 1. 转接桥输入连接
  axi_crossbar.io.in_icache   <> icache.io.axi_master
  axi_crossbar.io.in_dcache   <> dcache.io.axi_master
  axi_crossbar.io.in_uncache1 <> uncache1.io.axi_master
  axi_crossbar.io.in_uncache2 <> uncache2.io.axi_master

  // 2. 转接桥输出 → 顶层AXI3接口
  // AR通道
  arid    := axi_crossbar.io.out.ar.out.arid
  araddr  := axi_crossbar.io.out.ar.out.araddr
  arlen   := axi_crossbar.io.out.ar.out.arlen
  arsize  := axi_crossbar.io.out.ar.out.arsize
  arburst := axi_crossbar.io.out.ar.out.arburst
  arlock  := axi_crossbar.io.out.ar.out.arlock
  arcache := axi_crossbar.io.out.ar.out.arcache
  arprot  := axi_crossbar.io.out.ar.out.arprot
  arvalid := axi_crossbar.io.out.ar.out.arvalid
  axi_crossbar.io.out.ar.arready := arready

  // R通道
  val r_data = Wire(new AXI3RData)
  r_data.rid    := rid
  r_data.rdata  := rdata
  r_data.rresp  := rresp
  r_data.rlast  := rlast
  r_data.rvalid := rvalid
  axi_crossbar.io.out.r.in := r_data
  rready := axi_crossbar.io.out.r.rready

  // AW通道
  awid    := axi_crossbar.io.out.aw.out.awid
  awaddr  := axi_crossbar.io.out.aw.out.awaddr
  awlen   := axi_crossbar.io.out.aw.out.awlen
  awsize  := axi_crossbar.io.out.aw.out.awsize
  awburst := axi_crossbar.io.out.aw.out.awburst
  awlock  := axi_crossbar.io.out.aw.out.awlock
  awcache := axi_crossbar.io.out.aw.out.awcache
  awprot  := axi_crossbar.io.out.aw.out.awprot
  awvalid := axi_crossbar.io.out.aw.out.awvalid
  axi_crossbar.io.out.aw.awready := awready

  // W通道
  wid     := axi_crossbar.io.out.w.out.wid
  wdata   := axi_crossbar.io.out.w.out.wdata
  wstrb   := axi_crossbar.io.out.w.out.wstrb
  wlast   := axi_crossbar.io.out.w.out.wlast
  wvalid  := axi_crossbar.io.out.w.out.wvalid
  axi_crossbar.io.out.w.wready := wready

  // B通道
  val b_data = Wire(new AXI3BData)
  b_data.bid    := bid
  b_data.bresp  := bresp
  b_data.bvalid := bvalid
  axi_crossbar.io.out.b.in := b_data
  bready := axi_crossbar.io.out.b.bready











  when(io.reset) {
      cmt_valid := false.B
      cmt_cnt_inst := false.B
      cmt_timer_64 := 0.U
      cmt_inst_ld_en := false.B
      cmt_ld_paddr := 0.U
      cmt_ld_vaddr := 0.U
      cmt_inst_st_en := false.B
      cmt_st_paddr := 0.U
      cmt_st_vaddr := 0.U
      cmt_st_data := 0.U
      cmt_csr_rstat_en := false.B
      cmt_csr_data := 0.U
      
      cmt_wen := false.B
      cmt_wdest := 0.U
      cmt_wdata := 0.U
      cmt_pc := 0.U
      cmt_inst := 0.U
      
      cmt_excp_flush := false.B
      cmt_ertn := false.B
      cmt_csr_ecode := 0.U
      cmt_tlbfill_en := false.B
      cmt_rand_index := 0.U
      
      trap := false.B
      trap_code := 0.U
      cycleCnt := 0.U
      instrCnt := 0.U
    }.elsewhen(!trap) {
      cmt_valid := io.inst_valid_diff
      cmt_cnt_inst := io.cnt_inst_diff
      cmt_timer_64 := io.timer_64_diff
      cmt_inst_ld_en := io.inst_ld_en_diff
      cmt_ld_paddr := io.ld_paddr_diff
      cmt_ld_vaddr := io.ld_vaddr_diff
      cmt_inst_st_en := io.inst_st_en_diff
      cmt_st_paddr := io.st_paddr_diff
      cmt_st_vaddr := io.st_vaddr_diff
      cmt_st_data := io.st_data_diff
      cmt_csr_rstat_en := io.csr_rstat_en_diff
      cmt_csr_data := io.csr_data_diff
      
      cmt_wen := io.debug0_wb_rf_wen
      cmt_wdest := Cat(0.U(3.W), io.debug0_wb_rf_wnum)
      cmt_wdata := io.debug0_wb_rf_wdata
      cmt_pc := io.debug0_wb_pc
      cmt_inst := io.debug0_wb_inst
      
      cmt_excp_flush := io.excp_flush
      cmt_ertn := io.ertn_flush
      cmt_csr_ecode := io.ws_csr_ecode
      cmt_tlbfill_en := io.tlbfill_en
      cmt_rand_index := io.rand_index
      
      trap := false.B
      trap_code := io.regs(10)(7, 0)
      cycleCnt := cycleCnt + 1.U
      instrCnt := instrCnt + io.inst_valid_diff
    }



  }



  // 防止顶层信号优化
  dontTouch(arid)
  dontTouch(araddr)
  dontTouch(rid)
  dontTouch(rdata)
  dontTouch(awid)
  dontTouch(awaddr)
  dontTouch(wid)
  dontTouch(wdata)
  dontTouch(bid)
  dontTouch(bresp)
}

// 生成Verilog入口
object myCPU_top extends App {
  emitVerilog(
    new core_top,
    Array("--target-dir", "./../chiplab/IP/myCPU", "--output-file", "myCPU_top")
  )
}


```


#### Short summary: 

empty definition using pc, found symbol in pc: 