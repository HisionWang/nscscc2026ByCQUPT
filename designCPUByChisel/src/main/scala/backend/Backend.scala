package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.rename._
import nscscc.backend.dispatch._
import nscscc.backend.issue._
import nscscc.backend.regfile._
import nscscc.backend.regread._
import nscscc.backend.bypass._
import nscscc.backend.execute._
import nscscc.backend.writeback._
import nscscc.mem._
import nscscc.difftest._
import nscscc.csr._
import nscscc.backend.rob._
import nscscc.frontend.BpuUpdateReq
import nscscc.mmu._
class BackendIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val redirect = Output(new RedirectInfo)
  val redirectInfo    = ValidIO( new redirectInfoToModule )    // 误预测重定向

  val csrReq  = Output(new CsrFileReadReq)
  val csrResp = Input(new CsrFileReadResp)

  val flush    = Input(Bool())
  val extInt   = Input(Bool())
  val lsEnq    = new LsEnqIO
  val toMemResult  = Vec(2, Decoupled(new ExeResult) )
  val fromMemResult  = Flipped (Vec(2, Decoupled(new ExeResult) ))
  val commitToSq  = new RobCommitToSq
  val commitToCsr  = new RobCommitToCsr
  val tlbInstr     = Valid(new TlbInstr)
  val tlbFillIdx   = Input(UInt(tlbIdxLen.W))
  val currentPlv   = Input(UInt(plvLen.W))
  val storeQueueEmpty = Input(Bool())
  val ibarFenceReq = Output(Bool())
  val ibarFenceDone = Input(Bool())

  val excpEvent           = Output(new ExcpEvent)
  val excpInfo            = Output(new ExcpInfo)
  val redirectAddrFromCsr = Input(new RedirectEntry)
  val timerInfo =        Input(new TimerBundle)

  val bpuUpdate = Output(new BpuUpdateReq)                    // BPU 更新数据（始终发出）

}

class Backend(implicit p: Parameters) extends NSModule with HasCoreParameters {
  val io = IO(new BackendIO)
  val difftest = if (EnableDifftest) Some(IO(Output(new BackendDifftestBundle))) else None
 
  // ══════════════════════════════════════════════════════════════
  //  模块实例化
  // ══════════════════════════════════════════════════════════════
  val ctrlBlock   = Module(new CtrlBlock)
  io.excpEvent <> ctrlBlock.io.excpEvent
  io.excpInfo <> ctrlBlock.io.excpInfo
  io.redirectAddrFromCsr <> ctrlBlock.io.redirectAddrFromCsr
  

  io.commitToSq <> ctrlBlock.io.commitToSq
  io.commitToCsr <> ctrlBlock.io.commitToCsr
  ctrlBlock.io.currentPlv := io.currentPlv
  ctrlBlock.io.storeQueueEmpty := io.storeQueueEmpty
  io.ibarFenceReq := ctrlBlock.io.ibarFenceReq
  ctrlBlock.io.ibarFenceDone := io.ibarFenceDone

  io.lsEnq <> ctrlBlock.io.lsEnq
  val scheduler   = Module(new Scheduler)
  val regRead     = Module(new RegisterRead)
  val regFile     = Module(new RegFile)

  if (EnableDifftest) {
    val archState = ctrlBlock.difftest.get.archState
    val phyState  = regFile.difftest.get

    difftest.get.commit := ctrlBlock.difftest.get.commit
    for (i <- 0 until IntLogicRegs) {
      difftest.get.regs(i) := phyState(archState(i))
    }
  }

  val bypassNet = Module(new BypassNetwork)




 
  // 3 个执行单元：
  //   eu0: Q1 → ALU + CSR
  //   eu1: Q2 → ALU + DIV
  //   eu2: Q3 → ALU + MUL + BRU
  val exeUnits = Seq(
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasCsr = true, hasTlb = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasDiv = true))),
    Module(new ExeUnit(ExeUnitParams(hasAlu = true, hasBru = true, hasMul = true))),

    Module(new ExeUnit(ExeUnitParams(hasMemAddr = true))),
    Module(new ExeUnit(ExeUnitParams(hasStd = true)))
  )
  val numExeUnits = exeUnits.length  // 3
  exeUnits(0).io.csrRdata :=  io.csrResp.data
  io.csrReq.addr := exeUnits(0).io.csrRaddr
  exeUnits(1).io.csrRdata :=  DontCare
  exeUnits(2).io.csrRdata :=  DontCare
  exeUnits(3).io.csrRdata :=  DontCare
  exeUnits(4).io.csrRdata :=  DontCare

  exeUnits(0).io.timerInfo :=  io.timerInfo
  exeUnits(1).io.timerInfo :=  DontCare
  exeUnits(2).io.timerInfo :=  DontCare
  exeUnits(3).io.timerInfo :=  DontCare
  exeUnits(4).io.timerInfo :=  DontCare

  io.tlbInstr := exeUnits(0).io.tlbInstr
  exeUnits(0).io.tlbFillIdx := io.tlbFillIdx
  for (eu <- exeUnits) {
    eu.io.currentPlv := io.currentPlv
  }
  for (i <- 1 until exeUnits.length) {
    exeUnits(i).io.tlbFillIdx := 0.U
  }

  io.bpuUpdate := exeUnits(2).io.bpuUpdate
  val bruInfoFromExe3 =  exeUnits(2).io.bruInfo
  diffDontTouch(bruInfoFromExe3)

  ctrlBlock.io.bruInfo <> bruInfoFromExe3
  
  //ctrlBlock输出的重定向信息
  io.redirectInfo <> ctrlBlock.io.redirectInfo
  scheduler.io.redirectInfo <> ctrlBlock.io.redirectInfo
  regRead.io.redirectInfo <> ctrlBlock.io.redirectInfo
 
  val writeback = Module(new Writeback(numExeUnits))
 
  // ══════════════════════════════════════════════════════════════
  //  前端指令输入
  // ══════════════════════════════════════════════════════════════
  ctrlBlock.io.in     <> io.in
  //ctrlBlock.io.flush  := io.flush
  ctrlBlock.io.extInt := io.extInt
 
  // ══════════════════════════════════════════════════════════════
  //  CtrlBlock → Scheduler：IQ 入队
  // ══════════════════════════════════════════════════════════════
  scheduler.io.q1IQEnq <> ctrlBlock.io.q1IQEnq(0)
  scheduler.io.q2IQEnq <> ctrlBlock.io.q2IQEnq(0)
  scheduler.io.q3IQEnq <> ctrlBlock.io.q3IQEnq(0)
  scheduler.io.q4IQEnq <> ctrlBlock.io.q4IQEnq(0)
  scheduler.io.q5IQEnq <> ctrlBlock.io.q5IQEnq(0)
 
  ctrlBlock.io.iqFeedback := scheduler.io.feedback
 
  // ══════════════════════════════════════════════════════════════
  //  Scheduler → RegisterRead：发射
  // ══════════════════════════════════════════════════════════════
  regRead.io.iqIssues(0) <> scheduler.io.q1Issue
  regRead.io.iqIssues(1) <> scheduler.io.q2Issue
  regRead.io.iqIssues(2) <> scheduler.io.q3Issue
  regRead.io.iqIssues(3) <> scheduler.io.q4Issue
  regRead.io.iqIssues(4) <> scheduler.io.q5Issue
 
  // ══════════════════════════════════════════════════════════════
  //  RegisterRead ↔ RegFile：读端口
  // ══════════════════════════════════════════════════════════════
  for (i <- 0 until intRegFileReadPorts) {
    regFile.io.readPorts(i).addr := regRead.io.rfReadAddrs(i)
    regRead.io.rfReadData(i)     := regFile.io.readPorts(i).data
  }
 
  // ══════════════════════════════════════════════════════════════
  //  RegisterRead → bypassNet
  // ══════════════════════════════════════════════════════════════
    bypassNet.io.inReqs <> regRead.io.exeReqs


  // ══════════════════════════════════════════════════════════════
  //  bypassNet and ExeUnits
  // ══════════════════════════════════════════════════════════════
  for (i <- 0 until IQNum) {
    exeUnits(i).io.inReq <> bypassNet.io.outReqs(i)
  }
  for (i <- 0 until IQNum) {
    bypassNet.io.bypassResults(i).valid := exeUnits(i).io.outResult.valid &&
      (exeUnits(i).io.outResult.bits.uop.ctrl.fuType === FuType.alu ||
       exeUnits(i).io.outResult.bits.uop.ctrl.fuType === FuType.bru ||
       exeUnits(i).io.outResult.bits.uop.ctrl.fuType === FuType.csr)
    bypassNet.io.bypassResults(i).data  := exeUnits(i).io.outResult.bits.data
    bypassNet.io.bypassResults(i).pdst  := exeUnits(i).io.outResult.bits.uop.pdst
  }





 
  // ══════════════════════════════════════════════════════════════
  //  ExeUnits → Writeback：执行结果
  // ══════════════════════════════════════════════════════════════
  //前几个执行单元的结果直接传
  for (i <- 0 until numExeUnits -  2) {
    writeback.io.InExeResults(i) <> exeUnits(i).io.outResult
  }
  //发往ISQ的数据
  exeUnits(3).io.outResult <> io.toMemResult(0)
  exeUnits(4).io.outResult <> io.toMemResult(1)
  diffDontTouch( exeUnits(3).io.outResult )
  diffDontTouch( exeUnits(4).io.outResult )
//  writeback.io.InExeResults(3).bits.uop <> 0.U.asTypeOf((new DispatchedInst))
//  writeback.io.InExeResults(3).bits.data <> 0.U
//  writeback.io.InExeResults(3).valid <> false.B
//  writeback.io.InExeResults(3).bits.redirect <> 0.U.asTypeOf(Valid(new RedirectInfo))
//
//  writeback.io.InExeResults(4).bits.uop <> 0.U.asTypeOf((new DispatchedInst))
//  writeback.io.InExeResults(4).bits.data <> 0.U
//  writeback.io.InExeResults(4).valid <> false.B
//  writeback.io.InExeResults(4).bits.redirect <> 0.U.asTypeOf(Valid(new RedirectInfo))
  io.fromMemResult(0) <> writeback.io.InExeResults(3)
  io.fromMemResult(1) <> writeback.io.InExeResults(4)

  
  /*
  class ExeResult(implicit p: Parameters) extends NSBundle {
     val uop      = new DispatchedInst
     val data     = UInt(XLEN.W)
     val redirect = Valid(new RedirectInfo)
  }
  */
  
  writeback.io.flush := false.B
  //exeUnits.foreach(_.io.flush := bruInfoFromExe3.valid && bruInfoFromExe3.bits.//doRedirect)

  exeUnits.foreach(_.io.redirectInfo := ctrlBlock.io.redirectInfo)
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → RegFile：写端口
  // ══════════════════════════════════════════════════════════════
  writeback.io.rfWritePorts <> regFile.io.writePorts
  diffDontTouch(writeback.io.rfWritePorts)
 
  // ══════════════════════════════════════════════════════════════
  //  Writeback → Scheduler：唤醒广播
  // ══════════════════════════════════════════════════════════════
  scheduler.io.wakeupPorts <> writeback.io.wakeupPorts
  ctrlBlock.io.wakeupPorts <> writeback.io.wakeupPorts
 
  // ═════════════════════════════════════════════════════════════
  //  重定向 / 冲刷
  // ══════════════════════════════════════════════════
  val wbRedirect = writeback.io.redirect
  val ctrlRedirect = ctrlBlock.io.excpEedirect
  val finalRedirect = Mux(wbRedirect.valid, wbRedirect.bits, ctrlRedirect)
 
  io.redirect := 0.U.asTypeOf(new RedirectInfo)//finalRedirect
 
  scheduler.io.redirect      := 0.U.asTypeOf(new RedirectInfo) //wbRedirect.valid || ctrlRedirect.valid
  //scheduler.io.redirect.robIdx := finalRedirect.robIdx
  scheduler.io.flushPipeline       := false.B //o.flush
 
  // ══════════════════════════════════════════════════════════════
  //  ROB 提交：暂不实现，dontTouch 保留可见性
  // ══════════════════════════════════════════════════════════════
  diffDontTouch(writeback.io.toRObResults)
  ctrlBlock.io.writeback <> writeback.io.toRObResults


  diffDontTouch(ctrlBlock.io.lsEnq.req)
}
