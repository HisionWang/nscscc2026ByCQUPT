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
 
  // ── 重定向 ──
  val excpEedirect = Output(new RedirectInfo)
  //val brMsRedirect   = Flipped (ValidIO( new brMispredictRedirect) )    // 误预测重定向
  val bruInfo    = Flipped (ValidIO( new redirectInfoFromBru ))    // 误预测重定向


 
  // ── 冲刷与外部中断 ──
  //val flush    = Input(Bool())
  val extInt   = Input(Bool())

  val wakeupPorts   = Input(Vec(IQNumWakeupPorts, Valid(new IssueWakeup)))
}
 
class CtrlBlock(implicit p: Parameters) extends NSModule {
  val io = IO(new CtrlBlockIO)
  val difftest = if (EnableDifftest) Some(IO(Output(new CtrlBlockDifftestBundle))) else None

  val brMsFlush = io.bruInfo.valid && io.bruInfo.bits.doRedirect
  // ================================================================
  //  译码级
  // ================================================================
  val decodeStage = Module(new DecodeStage)
  decodeStage.io.in    <> io.in
  decodeStage.io.extInt := io.extInt
  decodeStage.io.flush  := brMsFlush || io.excpEedirect.valid
 
  // ================================================================
  //  重命名级
  // ================================================================
  val renameStage = Module(new RenameStage)
  renameStage.io.in      <> decodeStage.io.out
  renameStage.io.ratRead <> decodeStage.io.ratRead
  renameStage.io.flush    := brMsFlush
  //renameStage.io.redirect := io.excpEedirect
  renameStage.io.bruInfo := io.bruInfo
  

  if (EnableDifftest) {
    difftest.get.archState := renameStage.difftest.get
  }
 
  // ================================================================
  //  分发级
  // ================================================================
  val dispatchStage = Module(new DispatchStage)
  dispatchStage.io.in       <> renameStage.io.out
  dispatchStage.io.flush    := brMsFlush
 
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
  //  ROB
  // ================================================================
  val rob = Module(new ROB)
 
  // ROB 提交信息 → 重命名级（释放旧物理寄存器 + 更新架构表）
  for (i <- 0 until CommitWidth) {
    renameStage.io.commit(i).valid   := rob.io.commit.valid(i)
    renameStage.io.commit(i).pdst    := rob.io.commit.bits(i).pdst
    renameStage.io.commit(i).oldPdst := rob.io.commit.bits(i).oldPdst
    renameStage.io.commit(i).ldst    := rob.io.commit.bits(i).ldst
    renameStage.io.commit(i).rfWen   := rob.io.commit.bits(i).rfWen
    renameStage.io.commit(i).isWalk  := rob.io.commit.isWalk
  }
 
  io.commitToSq := rob.io.commitToSq
  if (EnableDifftest) {
    for (i <- 0 until CommitWidth) {
      val robCommit = rob.io.commit.bits(i)
      val diffCommit = difftest.get.commit(i)
      val isCsrRead = robCommit.fuType === FuType.csr && robCommit.csrOp === CsrOp.read

      diffCommit.valid      := rob.io.commit.valid(i)
      diffCommit.pc         := robCommit.pc
      diffCommit.instr      := robCommit.inst(31, 0)
      diffCommit.rfWen      := robCommit.rfWen
      diffCommit.wdest      := robCommit.ldst
      diffCommit.wdata      := robCommit.wrdata
      diffCommit.isCntInst  := DifftestUtils.isCntInst(robCommit.inst)
      diffCommit.csrRstat   := isCsrRead && robCommit.csrAddress === csrAddr.estat.U
      diffCommit.csrData    := robCommit.wrdata
      diffCommit.excpFlush  := robCommit.excpVec.orR
      diffCommit.ertnFlush  := DifftestUtils.isErtn(robCommit.inst)
      diffCommit.csrEcode   := DifftestUtils.excpVecToEcode(robCommit.excpVec)
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
  rob.io.bruInfo := io.bruInfo

  rob.io.writeback <> io.writeback
  dispatchStage.io.wakeupPorts <> io.wakeupPorts

 
  // ROB 入队连接（从 Dispatch 级发起）
  rob.io.enq <> dispatchStage.io.robEnq
 
  // ================================================================
  //  重定向信号
  // ================================================================
  io.excpEedirect := rob.io.redirect
}
