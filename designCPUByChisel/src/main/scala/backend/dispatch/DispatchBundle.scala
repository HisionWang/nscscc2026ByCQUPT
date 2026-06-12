package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.frontend.PredecodeInfo
 
// ================================================================
//  发射队列索引（每个队列独立编号）
// ================================================================
object IssueQueueIdx {
  val ALU    = 0
  val BRU    = 1
  val MULDIV = 2
  val LSU    = 3
  val NUM    = 4
 
  val width  = log2Ceil(NUM)
}
 
// ================================================================
//  Dispatch 输出的已分发指令（发给各 Issue Queue）
// ================================================================
class DispatchedInst(implicit p: Parameters) extends NSBundle {
  // ── 来自 RenamedInst 的全部字段 ──
  val pc         = UInt(XLEN.W)
  val inst       = UInt(XLEN.W)
  val ctrl       = new DecodeCtrl
  val excpVec    = UInt(ExceptionCode.width.W)
  val imm        = UInt(XLEN.W)
  val csrAddress = UInt(csrAddrLen.W)
  val pdInfo     = new PredecodeInfo
 
  val ldst = UInt(5.W)
  val lrs1 = UInt(5.W)
  val lrs2 = UInt(5.W)
 
  val pdst     = UInt(PhyRegIdxWidth.W)
  val prs1     = UInt(PhyRegIdxWidth.W)
  val prs2     = UInt(PhyRegIdxWidth.W)
  val oldPdst  = UInt(PhyRegIdxWidth.W)
 
  val rs1Valid = Bool()
  val rs2Valid = Bool()
  val rdValid  = Bool()
 
  val robIdx   = UInt(log2Ceil(RobSize).W)
 
  // ── Dispatch 新增字段 ──
  val robIdxFull = UInt((log2Ceil(RobSize) + 1).W)  // 含 flag 的完整 ROB 指针
 
  val lqIdx    = UInt(log2Ceil(LqSize).W)   // Load Queue 指针
  val sqIdx    = UInt(log2Ceil(SqSize).W)   // Store Queue 指针
 
  val issueQueue = UInt(IssueQueueIdx.width.W)  // 分发目标队列编号
 
  val prs1Busy = Bool()  // 源 1 是否就绪
  val prs2Busy = Bool()  // 源 2 是否就绪
}
 
// ================================================================
//  Issue Queue 反馈信号（IQ → Dispatch：队列是否有空位）
// ================================================================
class IssueQueueFeedback(implicit p: Parameters) extends NSBundle {
  val canAccept = Vec(IssueQueueIdx.NUM, Bool())  // 各队列能否接收
}
 
// ================================================================
//  BusyTable IO
// ================================================================
class BusyTableIO(implicit p: Parameters) extends NSBundle {
  // ── 读：查询物理寄存器是否忙 ──
  val readReq  = Input(Vec(CtrlBlockWidth * 2, UInt(PhyRegIdxWidth.W)))  // 各路 rs1+rs2
  val readResp = Output(Vec(CtrlBlockWidth * 2, Bool()))                 // true=忙
 
  // ── 写：分配时置忙 ──
  val allocReq = Input(Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W))))
 
  // ── 写：写回时清忙 ──
  val wbReq    = Input(Vec(WbBusWidth, Valid(UInt(PhyRegIdxWidth.W))))
}
 
// ================================================================
//  ROB 入队 IO
// ================================================================
class RobEnqIO(implicit p: Parameters) extends NSBundle {
  val valid = Vec(CtrlBlockWidth, Input(Bool()))
  val valids = Vec(CtrlBlockWidth, Input(Bool()))
  val bits  = Vec(CtrlBlockWidth, Input(new RobEntry))
  val canEnq = Output(Bool())  // ROB 是否能容纳本批指令
}
 
// ================================================================
//  ROB 表项
// ================================================================
class RobEntry(implicit p: Parameters) extends NSBundle {
  val pc       = UInt(XLEN.W)
  val inst     = UInt(XLEN.W)
  val pdst     = UInt(PhyRegIdxWidth.W)
  val oldPdst  = UInt(PhyRegIdxWidth.W)
  val ldst     = UInt(5.W)
  val rfWen    = Bool()
  val memRead  = Bool()
  val memWrite = Bool()
  val csrWen   = Bool()
  val excpVec  = UInt(ExceptionCode.width.W)
  val fuType   = UInt(FuType.width.W)
  val robIdx   = UInt(log2Ceil(RobSize).W)
}
 
// ================================================================
//  ROB 提交 IO
// ================================================================
class RobCommitIO(implicit p: Parameters) extends NSBundle {
  val valid     = Vec(CommitWidth, Output(Bool()))
  val bits      = Vec(CommitWidth, Output(new RobCommitEntry))
  val isWalk    = Output(Bool())
}
 
class RobCommitEntry(implicit p: Parameters) extends NSBundle {
  val pdst     = UInt(PhyRegIdxWidth.W)
  val oldPdst  = UInt(PhyRegIdxWidth.W)
  val ldst     = UInt(5.W)
  val rfWen    = Bool()
}
 
// ================================================================
//  ROB 重定向 IO
// ================================================================
class RobRedirectIO(implicit p: Parameters) extends NSBundle {
  val valid    = Output(Bool())
  val robIdx   = Output(UInt(log2Ceil(RobSize).W))
  val flushSelf = Output(Bool())
  val pc       = Output(UInt(XLEN.W))
  val excpVec  = Output(UInt(ExceptionCode.width.W))
  val isEbreak = Output(Bool())
}
 
// ================================================================
//  ROB 完整 IO
// ================================================================
class RobIO(implicit p: Parameters) extends NSBundle {
  val enq     = new RobEnqIO
  val commit  = new RobCommitIO
  val redirect = new RobRedirectIO
  val flush   = Input(Bool())
  val writeback = Input(Vec(WbBusWidth, Valid(new RobWriteback)))  // 执行单元写回
}
 
class RobWriteback(implicit p: Parameters) extends NSBundle {
  val robIdx  = UInt(log2Ceil(RobSize).W)
  val excpVec = UInt(ExceptionCode.width.W)
  val isBypass = Bool()  // 异常/误预测标记
}
 
// ================================================================
//  Dispatch 级 IO
// ================================================================
// 在 DispatchBundle.scala 的 DispatchStageIO 中添加
class DispatchStageIO(implicit p: Parameters) extends NSBundle {
  val in         = Vec(CtrlBlockWidth, Flipped(Decoupled(new RenamedInst)))
  val out        = Vec(IssueQueueIdx.NUM, Decoupled(new DispatchedInst))
  val iqFeedback = Input(new IssueQueueFeedback)
  val robEnq     = Flipped(new RobEnqIO)          // ← 新增：ROB 入队端口
  val flush      = Input(Bool())
  val redirect   = Input(new RedirectInfo)
}