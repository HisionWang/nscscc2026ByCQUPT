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
  val commit  = new RobCommitIO
 
  // ── 重定向 ──
  val redirect = Output(new RedirectInfo)
 
  // ── 冲刷与外部中断 ──
  val flush    = Input(Bool())
  val extInt   = Input(Bool())


  val debugArchState = Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W)))
  val wakeupPorts   = Input(Vec(IQNumWakeupPorts, Valid(new IssueWakeup)))
}
 
class CtrlBlock(implicit p: Parameters) extends NSModule {
  val io = IO(new CtrlBlockIO)
 
  // ================================================================
  //  译码级
  // ================================================================
  val decodeStage = Module(new DecodeStage)
  decodeStage.io.in    <> io.in
  decodeStage.io.extInt := io.extInt
  decodeStage.io.flush  := io.flush || io.redirect.valid
 
  // ================================================================
  //  重命名级
  // ================================================================
  val renameStage = Module(new RenameStage)
  renameStage.io.in      <> decodeStage.io.out
  renameStage.io.ratRead <> decodeStage.io.ratRead
  renameStage.io.redirect := io.redirect
  renameStage.io.flush    := io.flush

  io.debugArchState := renameStage.io.debugArchState
 
  // ================================================================
  //  分发级
  // ================================================================
  val dispatchStage = Module(new DispatchStage)
  dispatchStage.io.in       <> renameStage.io.out
  dispatchStage.io.flush    := io.flush
  dispatchStage.io.redirect := io.redirect
 
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
 

  io.commit   := rob.io.commit
 
  // ROB 重定向
  rob.io.flush := io.flush || io.redirect.valid

  rob.io.writeback <> io.writeback
  dispatchStage.io.wakeupPorts <> io.wakeupPorts

 
  // ROB 入队连接（从 Dispatch 级发起）
  rob.io.enq <> dispatchStage.io.robEnq
 
  // ================================================================
  //  重定向信号
  // ================================================================
  io.redirect := rob.io.redirect
}