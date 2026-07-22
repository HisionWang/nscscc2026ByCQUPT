package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.dispatch._
import nscscc.backend.rob._
import nscscc.backend.issue._
import nscscc.difftest._
import nscscc.backend.execute._
import nscscc.backend.redirect._
import nscscc.csr._

class CtrlBlockIO(implicit p: Parameters) extends NSBundle {
  // ── 来自前端 ──
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
 
  // ── 到各 Issue Queue ──
  val q1IQEnq  = Vec(IQEnqPorts.Q1, ValidIO(new DispatchedInst))
  val q2IQEnq  = Vec(IQEnqPorts.Q2, ValidIO(new DispatchedInst))
  val q3IQEnq  = Vec(IQEnqPorts.Q3, ValidIO(new DispatchedInst))
  val q4IQEnq  = Vec(IQEnqPorts.Q4, ValidIO(new DispatchedInst))
  val q5IQEnq  = Vec(IQEnqPorts.Q5, ValidIO(new DispatchedInst))
 
  // ── IQ 反馈 ──
  val iqFeedback = Input(new IssueQueueFeedback)
 
  // ── LSQ ──
  val lsEnq    = new LsEnqIO


  val writeback = Input(Vec(WbBusWidth, Valid(new RobWriteback)))  // 执行单元写回
 
  // ── ROB 提交 ──
  //val commit   = Output(Vec(CommitWidth, new RobCommitInfo))
  val commitToSq  = new RobCommitToSq
      val commitToCsr = new RobCommitToCsr

 
  // ── 重定向 ──
  val excpEedirect = Output(new RedirectInfo)
  // brMsRedirect   = Flipped (ValidIO( new brMispredictRedirect) )    // 误预测重定向
  // 错误预测信息
  val bruInfo    = Flipped( ValidIO( new redirectInfoFromBru ))    // 误预测重定向

  // 输出重定向
  val redirectInfo    = (ValidIO( new redirectInfoToModule )) 

  val excpEvent           = Output(new ExcpEvent)
  val excpInfo            = Output(new ExcpInfo)
  val redirectAddrFromCsr = Input(new RedirectEntry)
  


 
  // ── 冲刷与外部中断 ──
  //val flush    = Input(Bool())
  val extInt   = Input(Bool())

  val wakeupPorts   = Input(Vec(IQNumWakeupPorts, Valid(new IssueWakeup)))
}
 
class CtrlBlock(implicit p: Parameters) extends NSModule {
  val io = IO(new CtrlBlockIO)
  val difftest = if (EnableDifftest) Some(IO(Output(new CtrlBlockDifftestBundle))) else None



  val doFlush = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  // ================================================================
  //  译码级
// ================================================================
  val decodeStage = Module(new DecodeStage)
  val renameStage = Module(new RenameStage)
  val redirectController = Module(new RedirectController)
  val dispatchStage = Module(new DispatchStage)
  val disp2Rob = Module(new DispatchRobBuffer)
  val rob = Module(new ROB)

  redirectController.io.excpEvent <> io.excpEvent
  redirectController.io.excpInfo <> io.excpInfo
  redirectController.io.redirectAddrFromCsr <> io.redirectAddrFromCsr

  io.redirectInfo := redirectController.io.redirectInfo

  redirectController.io.bruRedirect := io.bruInfo
  redirectController.io.eentry     := 0.U
  redirectController.io.tlbrentry  := 0.U

  decodeStage.io.in    <> io.in
  decodeStage.io.extInt := io.extInt
  decodeStage.io.flush  := doFlush                  
 
  // ================================================================
  //  重命名级
  // ================================================================

  renameStage.io.in      <> decodeStage.io.out
  renameStage.io.ratRead <> decodeStage.io.ratRead
  renameStage.io.flush    := doFlush
  renameStage.io.robFreeSpace := rob.io.robFreeSpace
  renameStage.io.inFlightToRename := disp2Rob.io.inFlightToRename
  renameStage.io.redirectInfo := io.redirectInfo

  renameStage.io.stall := redirectController.io.robRedirectPause
  

  if (EnableDifftest) {
    difftest.get.archState := renameStage.difftest.get
  }
 
  // ================================================================
  //  分发级
  // ================================================================
  
  dispatchStage.io.in       <> renameStage.io.out
  dispatchStage.io.flush    := doFlush
  dispatchStage.io.redirectInfo := io.redirectInfo
  dispatchStage.io.stall := redirectController.io.robRedirectPause
  // ── IQ 入队端口 ──
  dispatchStage.io.q1IQEnq     <> io.q1IQEnq
  dispatchStage.io.q2IQEnq     <> io.q2IQEnq
  dispatchStage.io.q3IQEnq     <> io.q3IQEnq
  dispatchStage.io.q4IQEnq     <> io.q4IQEnq
  dispatchStage.io.q5IQEnq     <> io.q5IQEnq
 
  // ── IQ 反馈 ──
  dispatchStage.io.iqFeedback <> io.iqFeedback
 
  // ── LSQ ──
  dispatchStage.io.lsEnq <> io.lsEnq

  // ================================================================
  //  Rob请求打一拍
  // ================================================================

  disp2Rob.io.enq <> dispatchStage.io.robEnq
  disp2Rob.io.flush := doFlush
  disp2Rob.io.pause := redirectController.io.robRedirectPause

 
  // ================================================================
  //  ROB
  // ================================================================
  //rob的重定向
  rob.io.redirectInfo :=  io.redirectInfo

  //rob接受暂停
  rob.io.robPause := redirectController.io.robRedirectPause

  //异常 、CSr相关重定向信号
  redirectController.io.robRedirect := rob.io.robRedirect

  //回滚控制
  rob.io.robNeedRollback := redirectController.io.robNeedRollback
  //回滚目标
  rob.io.robRollbackTarget := redirectController.io.robRollbackTarget
  //回滚响应
  redirectController.io.robRollbackDone := rob.io.robRollbackDone


 
  // ROB 提交信息 → 重命名级（释放旧物理寄存器 + 更新架构表）
  //for (i <- 0 until CommitWidth) {
  //  renameStage.io.commit(i).valid   := rob.io.commit.valid(i) && !rob.io.commit.isExcpCommit(i)
  //  renameStage.io.commit(i).pdst    := rob.io.commit.bits(i).pdst
  //  renameStage.io.commit(i).oldPdst := rob.io.commit.bits(i).oldPdst
  //  renameStage.io.commit(i).ldst    := rob.io.commit.bits(i).ldst
  //  renameStage.io.commit(i).rfWen   := rob.io.commit.bits(i).rfWen
  //  renameStage.io.commit(i).isWalk  := rob.io.commit.isWalk
  //}
  renameStage.io.archCommit <> rob.io.archCommit
 
  io.commitToSq := rob.io.commitToSq
  io.commitToCsr := rob.io.commitToCsr
  if (EnableDifftest) {
    for (i <- 0 until CommitWidth) {
      val robCommit = rob.io.commit.bits(i)
      val diffCommit = difftest.get.commit(i)
      val isCsrRead = robCommit.fuType === FuType.csr && robCommit.csrOp === CsrOp.read

      //ROB提交窗口中时包含着异常的，也就是在rob视角异常也会提交（用这种方式清除他），但肯定不会改架构
      diffCommit.valid      := rob.io.commit.valid(i) //&& !rob.io.commit.isExcpCommit(i)
      diffCommit.pc         := robCommit.pc
      diffCommit.instr      := robCommit.inst(31, 0)
      diffCommit.rfWen      := robCommit.rfWen
      diffCommit.wdest      := robCommit.ldst
      diffCommit.wdata      := robCommit.rfdata
      diffCommit.isCntInst  := DifftestUtils.isCntInst(robCommit.inst)
      diffCommit.csrRstat   := isCsrRead && robCommit.csrWaddr === csrAddr.estat.U
      diffCommit.csrData    := robCommit.rfdata
      diffCommit.csrTimer   := robCommit.csrTimer
      diffCommit.excpFlush  := robCommit.excp.hasException
      diffCommit.ertnFlush  := DifftestUtils.isErtn(robCommit.inst)
      diffCommit.csrEcode   := DifftestUtils.excpVecToEcode(robCommit.excp)
      diffCommit.tlbfillEn  := false.B
      diffCommit.randIndex  := 0.U
      diffCommit.trap       := DifftestUtils.isTrap(robCommit.inst)
      diffCommit.trapCode   := 0.U
      diffCommit.load.valid := robCommit.memRead
      diffCommit.load.paddr := robCommit.memPaddr
      diffCommit.load.vaddr := robCommit.memVaddr
      diffCommit.store.valid := robCommit.memWrite
      diffCommit.store.paddr := robCommit.memPaddr
      diffCommit.store.vaddr := robCommit.memVaddr
      diffCommit.store.data  := robCommit.storeData
    }
  }
 
  // ROB 重定向
  rob.io.flush := false.B//brMsFlush || io.excpEedirect.valid
  rob.io.redirectInfo := io.redirectInfo

  rob.io.writeback <> io.writeback
  dispatchStage.io.wakeupPorts <> io.wakeupPorts

 
  // ROB 入队连接（从 Dispatch 级发起）
  rob.io.enq <> disp2Rob.io.deq
  rob.io.enqFromDispatch <> disp2Rob.io.deqDisp2Rob
 
  // ================================================================
  //  重定向信号
  // ================================================================
  io.excpEedirect := 0.U.asTypeOf(new RedirectInfo)
}
