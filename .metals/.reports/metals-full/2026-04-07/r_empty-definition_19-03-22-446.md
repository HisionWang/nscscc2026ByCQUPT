error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala:Output.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 1860
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

    // 添加Difftest需要的调试接口
    val debug0_wb_pc =       Output(UInt(64.W))
    val debug0_wb_rf_wen =   Output(Bool())
    val debug0_wb_rf_wnum =  Output(UInt(5.W))
    val debug0_wb_rf_wdata = @@Output(UInt(64.W))
    val debug0_wb_inst =     Output(UInt(32.W))
        //debug
    break_point=             input           
    infor_flag=             input           
    reg_num=             input  [ 4:0]   
    ws_valid=             output          
    rf_rdata=             output [31:0]   



  withClockAndReset(aclk, aresetn) {

  
  // --------------------------
  // 模块实例化
  // --------------------------
  val axi_crossbar = Module(new AXI3Crossbar4to1) //AI写的，暂未检查正误

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








  val difftest = Module(new Difftest)
    // 将所有输入信号赋值为0
  difftest.io.inst_valid_diff := false.B
  difftest.io.cnt_inst_diff := false.B
  difftest.io.timer_64_diff := 0.U(64.W)
  difftest.io.inst_ld_en_diff := false.B
  difftest.io.ld_paddr_diff := 0.U(64.W)
  difftest.io.ld_vaddr_diff := 0.U(64.W)
  difftest.io.inst_st_en_diff := false.B
  difftest.io.st_paddr_diff := 0.U(64.W)
  difftest.io.st_vaddr_diff := 0.U(64.W)
  difftest.io.st_data_diff := 0.U(64.W)
  difftest.io.csr_rstat_en_diff := false.B
  difftest.io.csr_data_diff := 0.U(64.W)
  
  difftest.io.debug0_wb_rf_wen := false.B
  difftest.io.debug0_wb_rf_wnum := 0.U(5.W)
  difftest.io.debug0_wb_rf_wdata := 0.U(64.W)
  difftest.io.debug0_wb_pc := 0.U(64.W)
  difftest.io.debug0_wb_inst := 0.U(32.W)
  
  difftest.io.excp_flush := false.B
  difftest.io.ertn_flush := false.B
  difftest.io.ws_csr_ecode := 0.U(6.W)
  difftest.io.tlbfill_en := false.B
  difftest.io.rand_index := 0.U(5.W)
  
  difftest.io.csr_estat_diff_0 := 0.U(32.W)
  difftest.io.csr_crmd_diff_0 := 0.U(32.W)
  difftest.io.csr_prmd_diff_0 := 0.U(32.W)
  difftest.io.csr_ectl_diff_0 := 0.U(32.W)
  difftest.io.csr_era_diff_0 := 0.U(64.W)
  difftest.io.csr_badv_diff_0 := 0.U(64.W)
  difftest.io.csr_eentry_diff_0 := 0.U(64.W)
  difftest.io.csr_tlbidx_diff_0 := 0.U(32.W)
  difftest.io.csr_tlbehi_diff_0 := 0.U(64.W)
  difftest.io.csr_tlbelo0_diff_0 := 0.U(32.W)
  difftest.io.csr_tlbelo1_diff_0 := 0.U(32.W)
  difftest.io.csr_asid_diff_0 := 0.U(32.W)
  difftest.io.csr_pgdl_diff_0 := 0.U(64.W)
  difftest.io.csr_pgdh_diff_0 := 0.U(64.W)
  difftest.io.csr_save0_diff_0 := 0.U(64.W)
  difftest.io.csr_save1_diff_0 := 0.U(64.W)
  difftest.io.csr_save2_diff_0 := 0.U(64.W)
  difftest.io.csr_save3_diff_0 := 0.U(64.W)
  difftest.io.csr_tid_diff_0 := 0.U(64.W)
  difftest.io.csr_tcfg_diff_0 := 0.U(32.W)
  difftest.io.csr_tval_diff_0 := 0.U(64.W)
  difftest.io.csr_ticlr_diff_0 := 0.U(32.W)
  difftest.io.csr_llbctl_diff_0 := 0.U(32.W)
  difftest.io.csr_tlbrentry_diff_0 := 0.U(64.W)
  difftest.io.csr_dmw0_diff_0 := 0.U(32.W)
  difftest.io.csr_dmw1_diff_0 := 0.U(32.W)

  for (i <- 0 until 32) {
    difftest.io.regs(i) := 0.U(64.W)
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
    Array("--target-dir", "./../chiplab/IP/myCPU", "--output-file", "mycpu_top")
  )
}


```


#### Short summary: 

empty definition using pc, found symbol in pc: 