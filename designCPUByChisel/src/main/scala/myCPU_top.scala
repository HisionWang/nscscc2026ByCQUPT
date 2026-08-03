package nscscc
 
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import nscscc.config.NSModule
import nscscc.config.NSRawModule
import nscscc.config.NSBundle
import nscscc.config.Parameters
 
import nscscc.axi._
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
  // ---- 复位同步：打一拍 ----
  val sync_reset = Wire(Bool())
  withClockAndReset(aclk, ~aresetn) {   // 这个寄存器本身用原始异步复位
    val rst_d1 = RegInit(true.B)        // 复位时保持1（复位有效）
    rst_d1 := false.B                    // 复位释放后，下一拍拉低
    sync_reset := rst_d1
  }

 
  withClockAndReset(aclk, sync_reset ) {

  val frontend = Module(new Frontend)
  val backend = Module(new Backend)
  val memory = Module(new MemoryBlock)
  val mmu = Module(new Mmu)
  val llbit = Wire(Bool())

  memory.io.redirectInfo <> backend.io.redirectInfo
  backend.io.storeQueueEmpty := memory.io.storeQueueEmpty
  
  frontend.io.out <> backend.io.in
  frontend.io.redirectInfo <> backend.io.redirectInfo
  frontend.io.invalidateICache := backend.io.commitToCsr.ibar


  diffDontTouch(backend.io.lsEnq)
  backend.io.lsEnq <> memory.io.lsEnq

  diffDontTouch(backend.io.toMemResult(0)) //load+store的地址
  diffDontTouch(backend.io.toMemResult(1)) //store的数据
  // 1.后端传给Memory的数据信息OK
  backend.io.toMemResult(1) <> memory.io.fromExeResult
  // 2.后端传给memory的地址信息处理
  val memaddrtrans = Module(new MemAddrTrans) 
  
  memaddrtrans.io.llbit := llbit
  memaddrtrans.io.in <> backend.io.toMemResult(0)
  memory.io.fromExeMmuResult <> memaddrtrans.io.out
  memaddrtrans.io.mmuReq <> mmu.io.fromMem
  memaddrtrans.io.mmuResp <> mmu.io.toMem


  memory.io.toWbResult <> backend.io.fromMemResult

  
  for (i <- 0 until CommitWidth) {
    memory.io.robCommit(i).valid := backend.io.commitToSq.valid(i)
    memory.io.robCommit(i).sqIdx := backend.io.commitToSq.bits(i).sqIdx.value
  }


  memory.io.redirect.valid := false.B
  memory.io.redirect.bits.robIdx.value := 0.U
  memory.io.redirect.bits.robIdx.flag := true.B
  
  backend.io.flush := false.B


    // laji
  frontend.io.redirect.valid  := false.B
  frontend.io.redirect.target := 0.U
  frontend.io.redirect.rtype  := 0.U
  // 后端BPU更新

  frontend.io.bpuUpdateBr        <> backend.io.bpuUpdate

  diffDontTouch(frontend.io.out)

 
  // ---------- MMU / TLB ----------
  frontend.io.mmu.toMmu <> mmu.io.fromIcache
  frontend.io.mmu.fromMmu <> mmu.io.toIcache

  //frontend.io.mmu.toMmu <> simMMU.io.mmu.toMmu
  //frontend.io.mmu.fromMmu <> simMMU.io.mmu.fromMmu

  //mmu.io <> 0.U.asTypeOf(new MmuIoBundle)
 
  // ---------- CSR ----------
  val csr = Module(new CsrFile)
  llbit := csr.io.llbit
  csr.io.timerInfo <> backend.io.timerInfo
  csr.io.irqBus <> intrpt
  csr.io.rReq <> backend.io.csrReq
  csr.io.rResp <> backend.io.csrResp

  backend.io.extInt :=  csr.io.hasIrq

  csr.io.wReq.wen := backend.io.commitToCsr.csrWen
  csr.io.wReq.addr := backend.io.commitToCsr.csrWaddr
  csr.io.wReq.data := backend.io.commitToCsr.csrWdata
  csr.io.llbitSet := backend.io.commitToCsr.llbitSet
  csr.io.llbitClear := backend.io.commitToCsr.llbitClear
  
  csr.io.excpEvent <> backend.io.excpEvent
  csr.io.excpInfo <> backend.io.excpInfo
  csr.io.redirectAddr <> backend.io.redirectAddrFromCsr

  mmu.io.tlb.instr := backend.io.tlbInstr
  backend.io.tlbFillIdx := mmu.io.tlb.fillIdx
  mmu.io.tlb.csr := csr.io.toTlb
  csr.io.tlbCmd := mmu.io.tlb.cmd
  csr.io.fromTlb := mmu.io.tlb.read
  backend.io.currentPlv := csr.io.priv.plv

  mmu.io.fromCsr.plv := csr.io.priv.plv
  mmu.io.fromCsr.pgda := csr.io.tlbCtrl.pgda
  mmu.io.fromCsr.dmw0 := csr.io.tlbCtrl.dmw0
  mmu.io.fromCsr.dmw1 := csr.io.tlbCtrl.dmw1

  mmu.io.fromCsr.datm := csr.io.cacheCtrl.datm
  mmu.io.fromCsr.datf := csr.io.cacheCtrl.datf

  mmu.io.fromCsr.asid := csr.io.toTlb.asid

  mmu.io.fromIcacheFlush := backend.io.redirectInfo.valid && backend.io.redirectInfo.bits.doRedirect

  //Rob的重定向才去做两者的flush
  //实际上这里是根本不需要去做刷掉的，因为LSQ中自然会刷
  //但有很必要是因为，如果某次rob redirct改变了地址映射方式（恰好在mmu中的state 由sdie —> busy这个时期映射方式改变）
  //就可能会导致mmu的状态机堵住
  //于是mmu必然需要刷新机制回到idle
  //既然mmu需要刷新机制，那memaddrtrans也还是需要刷新，不然就阻塞了
  //而Rob发出的redirct信号一定是可以刷这里的
  mmu.io.fromMemFlush := backend.io.redirectInfo.valid && backend.io.redirectInfo.bits.doRedirect && backend.io.redirectInfo.bits.fromRob
  memaddrtrans.io.flush := backend.io.redirectInfo.valid && backend.io.redirectInfo.bits.doRedirect && backend.io.redirectInfo.bits.fromRob

  // ---------- AXI3 Crossbar ----------
  val axi_crossbar = Module(new AXI3Crossbar2to1)
 
  // ================================================================
  // AXI3 Crossbar 连接
  // ================================================================
  axi_crossbar.io.in_icache   <> frontend.io.axi_master
  axi_crossbar.io.in_dcache   <> memory.io.axi
 
  // Crossbar → 顶层AXI3接口
  // AR通道
  arid    := axi_crossbar.io.out.ar.data.arid
  araddr  := axi_crossbar.io.out.ar.data.araddr
  arlen   := axi_crossbar.io.out.ar.data.arlen
  arsize  := axi_crossbar.io.out.ar.data.arsize
  arburst := 1.U //axi_crossbar.io.out.ar.data.arburst
  arlock  := 0.U //axi_crossbar.io.out.ar.data.arlock
  arcache := 0.U //axi_crossbar.io.out.ar.data.arcache
  arprot  := 0.U //axi_crossbar.io.out.ar.data.arprot
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
  awburst := 1.U //axi_crossbar.io.out.aw.data.awburst
  awlock  := 0.U //axi_crossbar.io.out.aw.data.awlock
  awcache := 0.U //axi_crossbar.io.out.aw.data.awcache
  awprot  := 0.U //axi_crossbar.io.out.aw.data.awprot
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
  //  val dbgFirstValid = frontend.io.out(0).fire
  //  when(dbgFirstValid) {
  //    debug0_wb_pc       := frontend.io.out(0).bits.pc
  //    debug0_wb_inst     := frontend.io.out(0).bits.instr(31, 0)
  //    debug0_wb_rf_wen   := false.B    // 后端实现后连接写回使能
  //    debug0_wb_rf_wnum  := 0.U
  //    debug0_wb_rf_wdata := 0.U
  //    ws_valid           := true.B
  //  }.otherwise {
  //    ws_valid := false.B
  //  }
 
  // ================================================================
  // Difftest 协同仿真
  // ================================================================
  if (EnableDifftest) {
    val difftest = Module(new DifftestInCore)
    val difftestInfo = Wire(new CoreDifftestBundle)

    difftestInfo.commit := backend.difftest.get.commit
    difftestInfo.regs   := backend.difftest.get.regs
    difftestInfo.csr    := csr.difftest.get
    difftest.io := difftestInfo

    val legacyCommit = backend.difftest.get.commit(0)
    ws_valid           := legacyCommit.valid
    debug0_wb_pc       := legacyCommit.pc(31, 0)
    debug0_wb_rf_wen   := legacyCommit.valid && legacyCommit.rfWen
    debug0_wb_rf_wnum  := legacyCommit.wdest
    debug0_wb_rf_wdata := legacyCommit.wdata(31, 0)
    debug0_wb_inst     := legacyCommit.instr
    rf_rdata           := backend.difftest.get.regs(reg_num)
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
