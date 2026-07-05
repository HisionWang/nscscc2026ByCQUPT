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
import nscscc.mem._
 
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
  val memory = Module(new MemoryBlock)

  memory.io.bruInfo <> backend.io.bruInfo
  
  frontend.io.out <> backend.io.in
  frontend.io.bruInfo <> backend.io.bruInfo


  dontTouch(backend.io.lsEnq)
  backend.io.lsEnq <> memory.io.lsEnq
  //val simMMU = Module(new SimpleMMU)
  // simMMU.io.mmuReq <> memory.io.mmu.toMmu
  // simMMU.io.mmuResp <> memory.io.mmu.fromMmu

  dontTouch(backend.io.toMemResult(0)) //load+store的地址
  dontTouch(backend.io.toMemResult(1)) //store的数据
  // 1.后端传给Memory的数据信息OK
  backend.io.toMemResult(1) <> memory.io.fromExeResult
  // 2.后端传给memory的地址信息处理
  val memaddrtrans = Module(new MemAddrTrans) 
  memaddrtrans.io.flush := false.B
  memaddrtrans.io.in <> backend.io.toMemResult(0)
  memory.io.fromExeMmuResult <> memaddrtrans.io.out
  val simMMU = Module(new SimpleMMU)
  memaddrtrans.io.mmuReq <> simMMU.io.mmuReq
  memaddrtrans.io.mmuResp <> simMMU.io.mmuResp


  memory.io.toWbResult <> backend.io.fromMemResult

  
  for (i <- 0 until CommitWidth) {
    memory.io.robCommit(i).valid := backend.io.commitToSq.valid(i)
    memory.io.robCommit(i).sqIdx := backend.io.commitToSq.bits(i).sqIdx.value
  }


  memory.io.redirect.valid := false.B
  memory.io.redirect.bits.robIdx.value := 0.U
  memory.io.redirect.bits.robIdx.flag := true.B
  


  dontTouch(backend.io.debugLogicRegs)

  
  backend.io.flush := false.B
  backend.io.extInt := intrpt =/= 0.U




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
  //val dcache   = Module(new cache_BlackBox)
  val uncache1 = Module(new cache_BlackBox)
  val uncache2 = Module(new cache_BlackBox)
 
  //dcache.io.cpu_if.req_addr  := 0.U
  //dcache.io.cpu_if.req_valid := false.B
  uncache1.io.cpu_if.req_addr  := 0.U
  uncache1.io.cpu_if.req_valid := false.B
  uncache2.io.cpu_if.req_addr  := 0.U
  uncache2.io.cpu_if.req_valid := false.B
 
  // ---------- AXI3 Crossbar ----------
  val axi_crossbar = Module(new AXI3Crossbar4to1)
 
  // ================================================================
  // AXI3 Crossbar 连接
  // ================================================================
  // 前端ICache → Crossbar端口0
  axi_crossbar.io.in_icache   <> frontend.io.axi_master
 
  // DCache → Crossbar端口1 (黑盒占位)
  axi_crossbar.io.in_dcache   <> memory.io.axi
 
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
  // 不用那个仿la500的大模块了，太乱了他那个
  //val difftest = Module(new DifftestInCore)
   
  val debugCommit = RegNext (backend.io.debugCommit ) // 因为寄存器值要下一个周期生效，所以这里RegNext（la500也是这样）
  val debugReg =  backend.io.debugLogicRegs  // 

    // to思贤：下面的这些DifftestInstrCommit模块
    //     CommitWidth是多少宽度，这下面的模块就有几个 并用传入的index区分前后
    // 这里如果方便改的话也可以让我改CommitWidth的时候这里自动变，不用到这里手改注释掉后俩个
  val difftestInstrCommit0 = Module(new DifftestInstrCommit)

  difftestInstrCommit0.io.clock := aclk
  difftestInstrCommit0.io.coreid := 0.U
  difftestInstrCommit0.io.index := 0.U
  difftestInstrCommit0.io.valid := debugCommit.valid(0)
  difftestInstrCommit0.io.pc := debugCommit.bits(0).pc
  difftestInstrCommit0.io.instr := debugCommit.bits(0).inst
  difftestInstrCommit0.io.skip := false.B
  difftestInstrCommit0.io.is_TLBFILL := 0.U
  difftestInstrCommit0.io.TLBFILL_index := 0.U
  difftestInstrCommit0.io.is_CNTinst := 0.U
  difftestInstrCommit0.io.timer_64_value := 0.U
  difftestInstrCommit0.io.wen := debugCommit.bits(0).rfWen
  difftestInstrCommit0.io.wdest := debugCommit.bits(0).ldst
  difftestInstrCommit0.io.wdata := debugCommit.bits(0).wrdata
  difftestInstrCommit0.io.csr_rstat := 0.U
  difftestInstrCommit0.io.csr_data := 0.U
/*
  val difftestInstrCommit1 = Module(new DifftestInstrCommit)

  difftestInstrCommit1.io.clock := aclk
  difftestInstrCommit1.io.coreid := 0.U
  difftestInstrCommit1.io.index := 1.U
  difftestInstrCommit1.io.valid := debugCommit.valid(1)
  difftestInstrCommit1.io.pc := debugCommit.bits(1).pc
  difftestInstrCommit1.io.instr := debugCommit.bits(1).inst
  difftestInstrCommit1.io.skip := false.B
  difftestInstrCommit1.io.is_TLBFILL := 0.U
  difftestInstrCommit1.io.TLBFILL_index := 0.U
  difftestInstrCommit1.io.is_CNTinst := 0.U
  difftestInstrCommit1.io.timer_64_value := 0.U
  difftestInstrCommit1.io.wen := debugCommit.bits(1).rfWen
  difftestInstrCommit1.io.wdest := debugCommit.bits(1).ldst
  difftestInstrCommit1.io.wdata := debugCommit.bits(1).wrdata
  difftestInstrCommit1.io.csr_rstat := 0.U
  difftestInstrCommit1.io.csr_data := 0.U

  val difftestInstrCommit2 = Module(new DifftestInstrCommit)

  difftestInstrCommit2.io.clock := aclk
  difftestInstrCommit2.io.coreid := 0.U
  difftestInstrCommit2.io.index := 2.U
  difftestInstrCommit2.io.valid := debugCommit.valid(2)
  difftestInstrCommit2.io.pc := debugCommit.bits(2).pc
  difftestInstrCommit2.io.instr := debugCommit.bits(2).inst
  difftestInstrCommit2.io.skip := false.B
  difftestInstrCommit2.io.is_TLBFILL := 0.U
  difftestInstrCommit2.io.TLBFILL_index := 0.U
  difftestInstrCommit2.io.is_CNTinst := 0.U
  difftestInstrCommit2.io.timer_64_value := 0.U
  difftestInstrCommit2.io.wen := debugCommit.bits(2).rfWen
  difftestInstrCommit2.io.wdest := debugCommit.bits(2).ldst
  difftestInstrCommit2.io.wdata := debugCommit.bits(2).wrdata
  difftestInstrCommit2.io.csr_rstat := 0.U
  difftestInstrCommit2.io.csr_data := 0.U
*/


  val difftestGRegState = Module(new DifftestGRegState)
  difftestGRegState.io.clock := aclk
  difftestGRegState.io.coreid := 0.U
  difftestGRegState.io.gpr_0 := debugReg(0)
  difftestGRegState.io.gpr_1 := debugReg(1)
  difftestGRegState.io.gpr_2 := debugReg(2)
  difftestGRegState.io.gpr_3 := debugReg(3)
  difftestGRegState.io.gpr_4 := debugReg(4)
  difftestGRegState.io.gpr_5 := debugReg(5)
  difftestGRegState.io.gpr_6 := debugReg(6)
  difftestGRegState.io.gpr_7 := debugReg(7)
  difftestGRegState.io.gpr_8 := debugReg(8)
  difftestGRegState.io.gpr_9 := debugReg(9)
  difftestGRegState.io.gpr_10 := debugReg(10)
  difftestGRegState.io.gpr_11 := debugReg(11)
  difftestGRegState.io.gpr_12 := debugReg(12)
  difftestGRegState.io.gpr_13 := debugReg(13)
  difftestGRegState.io.gpr_14 := debugReg(14)
  difftestGRegState.io.gpr_15 := debugReg(15)
  difftestGRegState.io.gpr_16 := debugReg(16)
  difftestGRegState.io.gpr_17 := debugReg(17)
  difftestGRegState.io.gpr_18 := debugReg(18)
  difftestGRegState.io.gpr_19 := debugReg(19)
  difftestGRegState.io.gpr_20 := debugReg(20)
  difftestGRegState.io.gpr_21 := debugReg(21)
  difftestGRegState.io.gpr_22 := debugReg(22)
  difftestGRegState.io.gpr_23 := debugReg(23)
  difftestGRegState.io.gpr_24 := debugReg(24)
  difftestGRegState.io.gpr_25 := debugReg(25)
  difftestGRegState.io.gpr_26 := debugReg(26)
  difftestGRegState.io.gpr_27 := debugReg(27)
  difftestGRegState.io.gpr_28 := debugReg(28)
  difftestGRegState.io.gpr_29 := debugReg(29)
  difftestGRegState.io.gpr_30 := debugReg(30)
  difftestGRegState.io.gpr_31 := debugReg(31)

    val difftestCSRRegState = Module(new DifftestCSRRegState)
  difftestCSRRegState.io.clock := aclk
  difftestCSRRegState.io.coreid    := 0.U
  difftestCSRRegState.io.crmd      := 0.U
  difftestCSRRegState.io.prmd      := 0.U
  difftestCSRRegState.io.euen      := 0.U
  difftestCSRRegState.io.ecfg      := 0.U
  difftestCSRRegState.io.estat     := 0.U
  difftestCSRRegState.io.era       := 0.U
  difftestCSRRegState.io.badv      := 0.U
  difftestCSRRegState.io.eentry    := 0.U
  difftestCSRRegState.io.tlbidx    := 0.U
  difftestCSRRegState.io.tlbehi    := 0.U
  difftestCSRRegState.io.tlbelo0   := 0.U
  difftestCSRRegState.io.tlbelo1   := 0.U
  difftestCSRRegState.io.asid      := 0.U
  difftestCSRRegState.io.pgdl      := 0.U
  difftestCSRRegState.io.pgdh      := 0.U
  difftestCSRRegState.io.save0     := 0.U
  difftestCSRRegState.io.save1     := 0.U
  difftestCSRRegState.io.save2     := 0.U
  difftestCSRRegState.io.save3     := 0.U
  difftestCSRRegState.io.tid       := 0.U
  difftestCSRRegState.io.tcfg      := 0.U
  difftestCSRRegState.io.tval      := 0.U
  difftestCSRRegState.io.ticlr     := 0.U
  difftestCSRRegState.io.llbctl    := 0.U
  difftestCSRRegState.io.tlbrentry := 0.U
  difftestCSRRegState.io.dmw0      := 0.U
  difftestCSRRegState.io.dmw1      := 0.U

  // 指令有效: 前端输出第一条指令握手成功
  /*
  difftest.io.inst_valid_diff   := debugCommit.valid(0)
  difftest.io.cnt_inst_diff     := debugCommit.bits(0).inst
  difftest.io.timer_64_diff     := cycleCount
   // 写回调试
  difftest.io.debug0_wb_rf_wen  := debugCommit.bits(0).rfWen
  difftest.io.debug0_wb_rf_wnum := debugCommit.bits(0).ldst
  difftest.io.debug0_wb_rf_wdata:= debugCommit.bits(0).wrdata
  difftest.io.debug0_wb_pc      := debugCommit.bits(0).pc
  difftest.io.debug0_wb_inst    := debugCommit.bits(0).inst

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
    difftest.debugReg(i) := backend.io.debugLogicRegs(i)
  }
  */

  
 
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