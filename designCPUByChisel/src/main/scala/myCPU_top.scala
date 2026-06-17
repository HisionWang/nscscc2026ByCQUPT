package nscscc
 
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import nscscc.config.NSModule
import nscscc.config.NSRawModule
import nscscc.config.NSBundle
import nscscc.config.Parameters
 
import nscscc.axi._
import nscscc.icache._
import nscscc.frontend._
import nscscc.mmu._
import nscscc.csr._
import nscscc.difftest._
import nscscc.backend.Backend
 
class core_top(implicit p: Parameters) extends NSRawModule {
  // ========== 时钟与复位 ==========
  val aclk    = IO(Input(Clock()))
  val aresetn = IO(Input(Bool()))
 
  // ========== 中断输入 ==========
  val intrpt = IO(Input(UInt(8.W)))
 
  // ========== AXI3 AR通道 ==========
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
 
  // ========== AXI3 R通道 ==========
  val rid    = IO(Input(UInt(4.W)))
  val rdata  = IO(Input(UInt(32.W)))
  val rresp  = IO(Input(UInt(2.W)))
  val rlast  = IO(Input(Bool()))
  val rvalid = IO(Input(Bool()))
  val rready = IO(Output(Bool()))
 
  // ========== AXI3 AW通道 ==========
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
 
  // ========== AXI3 W通道 ==========
  val wid    = IO(Output(UInt(4.W)))
  val wdata  = IO(Output(UInt(32.W)))
  val wstrb  = IO(Output(UInt(4.W)))
  val wlast  = IO(Output(Bool()))
  val wvalid = IO(Output(Bool()))
  val wready = IO(Input(Bool()))
 
  // ========== AXI3 B通道 ==========
  val bid    = IO(Input(UInt(4.W)))
  val bresp  = IO(Input(UInt(2.W)))
  val bvalid = IO(Input(Bool()))
  val bready = IO(Output(Bool()))
 
  // ========== 调试接口 ==========
  val break_point       = IO(Input(Bool()))
  val infor_flag        = IO(Input(Bool()))
  val reg_num           = IO(Input(UInt(5.W)))
  val ws_valid          = IO(Output(Bool()))
  val rf_rdata          = IO(Output(UInt(32.W)))
  val debug0_wb_pc      = IO(Output(UInt(32.W)))
  val debug0_wb_rf_wen  = IO(Output(Bool()))
  val debug0_wb_rf_wnum = IO(Output(UInt(5.W)))
  val debug0_wb_rf_wdata= IO(Output(UInt(32.W)))
  val debug0_wb_inst    = IO(Output(UInt(32.W)))
 
  // ========== 输出信号初始值 ==========
  debug0_wb_pc       := 0.U
  debug0_wb_rf_wen   := false.B
  debug0_wb_rf_wnum  := 0.U
  debug0_wb_rf_wdata := 0.U
  debug0_wb_inst     := 0.U
  ws_valid           := false.B
  rf_rdata           := 0.U
 
  withClockAndReset(aclk, ~aresetn) {
 
  // ================================================================
  // 模块实例化
  // ================================================================
 
    // ================================================================
  // 前端 ↔ 后端 接口连接
  // ================================================================
 

  val frontend = Module(new Frontend)
  val backend = Module(new Backend)

  frontend.io.out <> backend.io.in
  backend.io.flush := false.B
  backend.io.extInt := intrpt =/= 0.U
  //dontTouch(backend.io.out)


  //for (i <- 0 until 4) {
  //  backend.io.out(i).ready := true.B
  //}

    // 后端重定向: 暂无后端, 置为无效
  frontend.io.redirect.valid  := false.B
  frontend.io.redirect.target := 0.U
  frontend.io.redirect.rtype  := 0.U
  // 后端BPU更新: 暂无后端, 置为无效
  frontend.io.bpuUpdateBr.valid  := false.B
  frontend.io.bpuUpdateBr        := DontCare

  dontTouch(frontend.io.out)

 
  // ---------- MMU / TLB ----------
  val mmu = Module(new Mmu)
  //val simMMU = Module(new SimpleMMU)

  frontend.io.mmu.toMmu <> mmu.io.fromIcache
  frontend.io.mmu.fromMmu <> mmu.io.toIcache

  //frontend.io.mmu.toMmu <> simMMU.io.mmu.toMmu
  //frontend.io.mmu.fromMmu <> simMMU.io.mmu.fromMmu

  //mmu.io <> 0.U.asTypeOf(new MmuIoBundle)
 
  // ---------- CSR ----------
  val csr = Module(new CsrFile)
  csr.io.irqBus <> intrpt
  csr.io.rReq <> 0.U.asTypeOf(new CsrFileReadReq)
  csr.io.wReq <> 0.U.asTypeOf(new CsrFileWriteReq)
  csr.io.excpEvent <> 0.U.asTypeOf(new ExcpEvent)
  csr.io.excpInfo <> 0.U.asTypeOf(new ExcpInfo)

  csr.io.tlbCmd :=  0.U.asTypeOf(new TlbCmd)
  csr.io.fromTlb := 0.U.asTypeOf(new TlbToCsr)

  mmu.io.fromCsr.plv := csr.io.priv.plv
  mmu.io.fromCsr.pgda := csr.io.tlbCtrl.pgda
  mmu.io.fromCsr.dmw0 := csr.io.tlbCtrl.dmw0
  mmu.io.fromCsr.dmw1 := csr.io.tlbCtrl.dmw1

  mmu.io.fromCsr.datm := csr.io.cacheCtrl.datm
  mmu.io.fromCsr.datf := csr.io.cacheCtrl.datf

  mmu.io.fromCsr.asid := csr.io.toTlb.asid

  mmu.io.fromIcacheFlush := false.B

  mmu.io.maint <> 0.U.asTypeOf(new MmuMaintPort)


  
 
  // ---------- DCache / Uncache (黑盒占位) ----------
  val dcache   = Module(new cache_BlackBox)
  val uncache1 = Module(new cache_BlackBox)
  val uncache2 = Module(new cache_BlackBox)
 
  dcache.io.cpu_if.req_addr  := 0.U
  dcache.io.cpu_if.req_valid := false.B
  uncache1.io.cpu_if.req_addr  := 0.U
  uncache1.io.cpu_if.req_valid := false.B
  uncache2.io.cpu_if.req_addr  := 0.U
  uncache2.io.cpu_if.req_valid := false.B
 
  // ---------- AXI3 Crossbar ----------
  val axi_crossbar = Module(new AXI3Crossbar4to1)
 


 
  // ================================================================
  // MMU / TLB 连接
  // ================================================================
  // ICache内部已有SimpleMMU, 此处Mmu模块作为独立的TLB查表单元
  // 后续需要将ICache内部的SimpleMMU替换为此外部TLB连接
 
  // MMU请求: 来自前端ICache的虚拟地址转换
  // 注意: 当前ICache内部使用SimpleMMU, 此处MMU作为独立模块预留
  // 待ICache改造为外部MMU接口后, 连接如下:
  //   frontend.icache内部MMU请求 → mmu.io.tlb_req
  //   mmu.io.tlb_resp → frontend.icache内部MMU响应
 
  // MMU默认输入(暂不连接ICache, 等ICache接口改造)
  // mmu.io.fromIcache.valid := false.B
  // mmu.io.fromIcache.bits.vaddr := 0.U
 
  // MMU与CSR的交互
  // CSR提供: 页表基址(PGD), ASID, 直接映射窗口(DMW), DA模式等
//  mmu.io.csr_pgdl     := csr.io.csr_pgdl
//  mmu.io.csr_pgdh     := csr.io.csr_pgdh
//  mmu.io.csr_asid     := csr.io.csr_asid
//  mmu.io.csr_crmd_da  := csr.io.csr_crmd_da
//  mmu.io.csr_crmd_pg  := csr.io.csr_crmd_pg
//  mmu.io.csr_dmw0     := csr.io.csr_dmw0
//  mmu.io.csr_dmw1     := csr.io.csr_dmw1
 
  // TLB重填异常 → CSR
  // 当MMU发生TLB缺失时, 需要触发异常进入OS处理TLB重填
  // 后续连接到异常处理逻辑
 
  // ================================================================
  // CSR 连接
  // ================================================================
  // CSR时钟复位
//  csr.io.clk    := aclk
//  csr.io.reset  := ~aresetn
// 
//  // CSR中断输入
//  csr.io.intrpt := intrpt
// 
//  // CSR读写接口: 暂无后端执行级, 置为无效
//  csr.io.csr_raddr := 0.U
//  csr.io.csr_rdata <> DontCare
//  csr.io.csr_wen   := false.B
//  csr.io.csr_waddr := 0.U
//  csr.io.csr_wdata := 0.U
// 
//  // CSR异常相关输入: 暂无后端
//  csr.io.excp_flush  := false.B
//  csr.io.ertn_flush  := false.B
//  csr.io.excp_ecode  := 0.U
//  csr.io.excp_vaddr  := 0.U
//  csr.io.excp_paddr  := 0.U
//  csr.io.tlbfill_en  := false.B
//  csr.io.rand_index  := 0.U
 
  // ================================================================
  // AXI3 Crossbar 连接
  // ================================================================
  // 前端ICache → Crossbar端口0
  axi_crossbar.io.in_icache   <> frontend.io.axi_master
 
  // DCache → Crossbar端口1 (黑盒占位)
  axi_crossbar.io.in_dcache   <> dcache.io.axi_master
 
  // Uncache1 → Crossbar端口2 (黑盒占位)
  axi_crossbar.io.in_uncache1 <> uncache1.io.axi_master
 
  // Uncache2 → Crossbar端口3 (黑盒占位)
  axi_crossbar.io.in_uncache2 <> uncache2.io.axi_master
 
  // Crossbar → 顶层AXI3接口
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
 
  // ================================================================
  // 调试信号
  // ================================================================
  // 从前端IBuffer取第一条有效指令作为调试输出
  val dbgFirstValid = frontend.io.out(0).fire
  when(dbgFirstValid) {
    debug0_wb_pc       := frontend.io.out(0).bits.pc
    debug0_wb_inst     := frontend.io.out(0).bits.instr(31, 0)
    debug0_wb_rf_wen   := false.B    // 后端实现后连接写回使能
    debug0_wb_rf_wnum  := 0.U
    debug0_wb_rf_wdata := 0.U
    ws_valid           := true.B
  }.otherwise {
    ws_valid := false.B
  }
 
  // 调试: 寄存器读数据 (暂无寄存器堆)
  rf_rdata := 0.U
 
  // ================================================================
  // Difftest 协同仿真
  // ================================================================
  val cycleCount = RegInit(0.U(64.W))
  cycleCount := cycleCount + 1.U
 
  val difftest = Module(new DifftestInCore)
 
  // 指令有效: 前端输出第一条指令握手成功
  difftest.io.inst_valid_diff   := cycleCount === 8888.U
  difftest.io.cnt_inst_diff     := cycleCount === 188.U
  difftest.io.timer_64_diff     := cycleCount
 
  // Load/Store (暂无后端)
  difftest.io.inst_ld_en_diff   := false.B
  difftest.io.ld_paddr_diff     := 0.U
  difftest.io.ld_vaddr_diff     := 0.U
  difftest.io.inst_st_en_diff   := false.B
  difftest.io.st_paddr_diff     := 0.U
  difftest.io.st_vaddr_diff     := 0.U
  difftest.io.st_data_diff      := 0.U
 
  // CSR (从CSR模块读出)
  difftest.io.csr_rstat_en_diff := false.B
  difftest.io.csr_data_diff     := 0.U
 
  // 写回调试
  difftest.io.debug0_wb_rf_wen  := false.B
  difftest.io.debug0_wb_rf_wnum := 0.U
  difftest.io.debug0_wb_rf_wdata:= 0.U
  difftest.io.debug0_wb_pc      := 0.U //frontend.io.out(0).bits.pc
  difftest.io.debug0_wb_inst    := 0.U //frontend.io.out(0).bits.instr(31, 0)
 
  // 异常相关
  difftest.io.excp_flush   := false.B
  difftest.io.ertn_flush   := false.B
  difftest.io.ws_csr_ecode := 0.U
  difftest.io.tlbfill_en   := false.B
  difftest.io.rand_index   := 0.U
 
  // CSR快照 (从CSR模块读出)
  difftest.io.csr_estat_diff_0      := 0.U
  difftest.io.csr_crmd_diff_0       := 0.U
  difftest.io.csr_prmd_diff_0       := 0.U
  difftest.io.csr_ectl_diff_0       := 0.U
  difftest.io.csr_era_diff_0        := 0.U
  difftest.io.csr_badv_diff_0       := 0.U
  difftest.io.csr_eentry_diff_0     := 0.U
  difftest.io.csr_tlbidx_diff_0     := 0.U
  difftest.io.csr_tlbehi_diff_0     := 0.U
  difftest.io.csr_tlbelo0_diff_0    := 0.U
  difftest.io.csr_tlbelo1_diff_0    := 0.U
  difftest.io.csr_asid_diff_0       := 0.U
  difftest.io.csr_pgdl_diff_0       := 0.U
  difftest.io.csr_pgdh_diff_0       := 0.U
  difftest.io.csr_save0_diff_0      := 0.U
  difftest.io.csr_save1_diff_0      := 0.U
  difftest.io.csr_save2_diff_0      := 0.U
  difftest.io.csr_save3_diff_0      := 0.U
  difftest.io.csr_tid_diff_0        := 0.U
  difftest.io.csr_tcfg_diff_0       := 0.U
  difftest.io.csr_tval_diff_0       := 0.U
  difftest.io.csr_ticlr_diff_0      := 0.U
  difftest.io.csr_llbctl_diff_0     := 0.U
  difftest.io.csr_tlbrentry_diff_0  := 0.U
  difftest.io.csr_dmw0_diff_0       := 0.U
  difftest.io.csr_dmw1_diff_0       := 0.U
 
  // 寄存器堆 (暂无, 置0)
  for (i <- 0 until 32) {
    difftest.io.regs(i) := 0.U
  }
 
  // ========== 信号防优化 ==========
  dontTouch(break_point)
  dontTouch(infor_flag)
  dontTouch(reg_num)
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
 
  } // end withClockAndReset
}
 
// ================================================================
// Verilog 生成入口
// ================================================================
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
      "--target-dir", targetDirPath,
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