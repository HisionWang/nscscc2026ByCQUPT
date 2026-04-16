error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala:debug0_wb_pc
file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala
empty definition using pc, found symbol in pc: debug0_wb_pc
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/difftest/io/debug0_wb_pc.
	 -chisel3/difftest/io/debug0_wb_pc#
	 -chisel3/difftest/io/debug0_wb_pc().
	 -chisel3/util/difftest/io/debug0_wb_pc.
	 -chisel3/util/difftest/io/debug0_wb_pc#
	 -chisel3/util/difftest/io/debug0_wb_pc().
	 -config/difftest/io/debug0_wb_pc.
	 -config/difftest/io/debug0_wb_pc#
	 -config/difftest/io/debug0_wb_pc().
	 -scala/sys/process/difftest/io/debug0_wb_pc.
	 -scala/sys/process/difftest/io/debug0_wb_pc#
	 -scala/sys/process/difftest/io/debug0_wb_pc().
	 -difftest/io/debug0_wb_pc.
	 -difftest/io/debug0_wb_pc#
	 -difftest/io/debug0_wb_pc().
	 -scala/Predef.difftest.io.debug0_wb_pc.
	 -scala/Predef.difftest.io.debug0_wb_pc#
	 -scala/Predef.difftest.io.debug0_wb_pc().
offset: 7185
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/myCPU_top.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSRawModule
import config.NSBundle
import config.Parameters  // 导入Parameters类型
// 代码全是AI写的，应该一坨，但是可以转成v成功
class core_top(implicit p: Parameters) extends NSRawModule {
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

  val break_point=             IO(Input(Bool())           )
  val infor_flag=              IO(Input(Bool())           )
  val reg_num=                 IO(Input(UInt(5.W))  )
  val ws_valid=                IO(Output(Bool())          )
  val rf_rdata=                IO(Output(UInt(32.W))  )

  val debug0_wb_pc =       IO(Output(UInt(32.W)))
  val debug0_wb_rf_wen =   IO(Output(Bool()))
  val debug0_wb_rf_wnum =  IO(Output(UInt(5.W)))
  val debug0_wb_rf_wdata = IO(Output(UInt(32.W)))
  val debug0_wb_inst =     IO(Output(UInt(32.W)))
      //debug


  // ========== 输入信号不优化 ==========
  dontTouch(break_point)
  dontTouch(infor_flag)
  dontTouch(reg_num)
  
  // ========== 输出信号直接赋初始值 ==========
  // 为所有输出信号提供确定的初始值
  debug0_wb_pc := 0.U(64.W)
  debug0_wb_rf_wen := false.B
  debug0_wb_rf_wnum := 0.U(5.W)
  debug0_wb_rf_wdata := 0.U(64.W)
  debug0_wb_inst := 0.U(32.W)
  ws_valid := false.B
  rf_rdata := 0.U(32.W)

  withClockAndReset(aclk, ~aresetn) {

  
  // --------------------------
  // 模块实例化
  // --------------------------


  // 预留扩展接口
  // 重点了解一下关于之里黑盒
  val dcache       = Module(new cache_BlackBox)
  val uncache1     = Module(new cache_BlackBox)
  val uncache2     = Module(new cache_BlackBox)
  dcache.io.cpu_if.req_addr  := 0.U
  dcache.io.cpu_if.req_valid := false.B

  uncache1.io.cpu_if.req_addr  := 0.U
  uncache1.io.cpu_if.req_valid := false.B

  uncache2.io.cpu_if.req_addr  := 0.U
  uncache2.io.cpu_if.req_valid := false.B


  val axi_crossbar = Module(new AXI3Crossbar4to1)
  val icache       = Module(new ICache)
  val fetch_unit = Module(new FetchUnit)

  // 连接前端和ICache
  fetch_unit.io.icache_req.addr  <> icache.io.cpu_if.req_addr
  fetch_unit.io.icache_req.valid <> icache.io.cpu_if.req_valid
  fetch_unit.io.icache_req.kill  <> icache.io.cpu_if.req_kill
  // --------------------------
  // 0. 与CPU最核心的接口，后续再实现优化
  // --------------------------
  icache.io.cpu_if.resp_instrs <> fetch_unit.io.icache_resp.instrs
  icache.io.cpu_if.resp_addr   <> fetch_unit.io.icache_resp.addr
  icache.io.cpu_if.resp_valid  <> fetch_unit.io.icache_resp.valid
  icache.io.cpu_if.resp_miss   <> fetch_unit.io.icache_resp.miss

  fetch_unit.io.start_pc := 0x1C000000.U
  fetch_unit.io.start_valid := true.B
  fetch_unit.io.flush := false.B
  fetch_unit.io.stall := false.B

  fetch_unit.io.fetch_packet.ready := true.B
  val pc = fetch_unit.io.fetch_packet.bits.pc
  val insts = fetch_unit.io.fetch_packet.bits.instrs
  val inst_valid = fetch_unit.io.fetch_packet.valid

  

  // 连接ICache控制信号
  icache.io.flush := false.B
  icache.io.stall := false.B




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
  arid    := axi_crossbar.io.out.ar.data.arid
  araddr  := axi_crossbar.io.out.ar.data.araddr
  arlen   := axi_crossbar.io.out.ar.data.arlen
  arsize  := axi_crossbar.io.out.ar.data.arsize
  arburst := axi_crossbar.io.out.ar.data.arburst
  arlock  := axi_crossbar.io.out.ar.data.arlock
  arcache := axi_crossbar.io.out.ar.data.arcache
  arprot  := axi_crossbar.io.out.ar.data.arprot
  arvalid := axi_crossbar.io.out.ar.data.arvalid
  axi_crossbar.io.out.ar.arready := arready

  // R通道
  val r_data = Wire(new AXI3RData)
  r_data.rid    := rid
  r_data.rdata  := rdata
  r_data.rresp  := rresp
  r_data.rlast  := rlast
  r_data.rvalid := rvalid
  axi_crossbar.io.out.r.data := r_data
  rready := axi_crossbar.io.out.r.rready

  // AW通道
  awid    := axi_crossbar.io.out.aw.data.awid
  awaddr  := axi_crossbar.io.out.aw.data.awaddr
  awlen   := axi_crossbar.io.out.aw.data.awlen
  awsize  := axi_crossbar.io.out.aw.data.awsize
  awburst := axi_crossbar.io.out.aw.data.awburst
  awlock  := axi_crossbar.io.out.aw.data.awlock
  awcache := axi_crossbar.io.out.aw.data.awcache
  awprot  := axi_crossbar.io.out.aw.data.awprot
  awvalid := axi_crossbar.io.out.aw.data.awvalid
  axi_crossbar.io.out.aw.awready := awready

  // W通道
  wid     := axi_crossbar.io.out.w.data.wid
  wdata   := axi_crossbar.io.out.w.data.wdata
  wstrb   := axi_crossbar.io.out.w.data.wstrb
  wlast   := axi_crossbar.io.out.w.data.wlast
  wvalid  := axi_crossbar.io.out.w.data.wvalid
  axi_crossbar.io.out.w.wready := wready

  // B通道
  val b_data = Wire(new AXI3BData)
  b_data.bid    := bid
  b_data.bresp  := bresp
  b_data.bvalid := bvalid
  axi_crossbar.io.out.b.data := b_data
  bready := axi_crossbar.io.out.b.bready




  val reg = RegInit(0.U(64.W))
  reg := reg + 1.U
  



  val difftest = Module(new DifftestInCore)
    // 将所有输入信号赋值为0
  
  difftest.io.inst_valid_diff := reg(6)
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
  difftest.io.debu@@g0_wb_pc := pc
  difftest.io.debug0_wb_inst := 0.U
  
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



  dontTouch(pc)
  dontTouch(insts)
  dontTouch(inst_valid)
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





  
}
import config._
import java.io.File
import scala.sys.process._

object myCPU_top extends App {

  val targetDirPath = "./../chiplab/IP/myCPU/Chisel"
  val targetDir = new File(targetDirPath)

  if (targetDir.exists() && targetDir.isDirectory) {
    def deleteRecursively(file: File): Unit = {
      if (file.isDirectory) {
        file.listFiles().foreach(deleteRecursively)
      }
      if (file.exists && !file.delete()) {
        throw new Exception(s"Exception DeleFail: ${file.getAbsolutePath}")
      }
    }
    deleteRecursively(targetDir)
  } 
  targetDir.mkdirs()

  implicit val config: Parameters = new Parameters(Map())

  emitVerilog(
    new core_top,
    Array( 
      //"--help",
      "--target-dir", targetDirPath, 
      //"--output-file", "mycpu_top",
      "--emit-modules", "verilog"
      )
  )

  val filesToDelete = List("core_top.anno.json", "core_top.fir")
  filesToDelete.foreach { filename =>
    val fileToDelete = new File(targetDir, filename)
    if (fileToDelete.exists()) {
      fileToDelete.delete()
    } 
  }

}


```


#### Short summary: 

empty definition using pc, found symbol in pc: debug0_wb_pc