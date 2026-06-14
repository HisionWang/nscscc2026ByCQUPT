package nscscc.backend.dispatch
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.frontend.PredecodeInfo
 
// ================================================================
//  发射队列标识（5 个 Issue Queue）
// ================================================================
object IssueQueueId {
  val ALU     = 0
  val BRU     = 1   // BRU + CSR/Priv 共享
  val MULDIV  = 2
  val LOADSTA = 3   // Load + Store-Addr 共享
  val STD     = 4   // Store-Data 独占
  val NUM     = 5
  val width   = log2Ceil(NUM)
}
 
// ================================================================
//  每个 IQ 的入队端口数
//  ALU 最频繁需 2 端口；其余各 1 端口即可覆盖 4-wide 典型场景
//  若同周期某类指令超过端口数，同进同出机制会暂压一拍
// ================================================================
object IQEnqPorts {
  val ALU     = 2
  val BRU     = 1
  val MULDIV  = 1
  val LOADSTA = 2   // Load 和 Sta 竞争这 2 个端口
  val STD     = 1
  val TOTAL   = ALU + BRU + MULDIV + LOADSTA + STD  // 7
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
 
  val issueQueue = UInt(IssueQueueId.width.W)  // 分发目标队列编号
 
  val prs1Busy = Bool()  // 源 1 是否就绪
  val prs2Busy = Bool()  // 源 2 是否就绪
 
  // ── Store 分裂标记 ──
  val isSta    = Bool()   // Store-Addr 微操作
  val isStd    = Bool()   // Store-Data 微操作
}
 
// ================================================================
//  Issue Queue 反馈信号（IQ → Dispatch：本周期可接收几条）
// ================================================================
class IssueQueueFeedback(implicit p: Parameters) extends NSBundle {
  val aluCanAccept     = UInt((log2Ceil(IQEnqPorts.ALU + 1)).W)
  val bruCanAccept     = UInt((log2Ceil(IQEnqPorts.BRU + 1)).W)
  val mulDivCanAccept  = UInt((log2Ceil(IQEnqPorts.MULDIV + 1)).W)
  val loadStaCanAccept = UInt((log2Ceil(IQEnqPorts.LOADSTA + 1)).W)
  val stdCanAccept     = UInt((log2Ceil(IQEnqPorts.STD + 1)).W)
}
 
// ================================================================
//  LSQ 入队请求（仅分配条目，地址/数据后续由执行单元填入）
// ================================================================
class LsEnqEntry(implicit p: Parameters) extends NSBundle {
  val robIdx  = UInt(log2Ceil(RobSize).W)
  val isLoad  = Bool()
  val isStore = Bool()
  val sqIdx   = UInt(log2Ceil(SqSize).W)
  val lqIdx   = UInt(log2Ceil(LqSize).W)
}
 
class LsEnqIO(implicit p: Parameters) extends NSBundle {
  val req    = Vec(CtrlBlockWidth, Valid(new LsEnqEntry))
  val lqFull = Input(Bool())
  val sqFull = Input(Bool())
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
class DispatchStageIO(implicit p: Parameters) extends NSBundle {
  // ── 来自重命名级 ──
  val in           = Vec(CtrlBlockWidth, Flipped(Decoupled(new RenamedInst)))
 
  // ── 到各 Issue Queue（各自独立的入队端口） ──
  val aluIQEnq     = Vec(IQEnqPorts.ALU,     ValidIO(new DispatchedInst))
  val bruIQEnq     = Vec(IQEnqPorts.BRU,     ValidIO(new DispatchedInst))
  val mulDivIQEnq  = Vec(IQEnqPorts.MULDIV,  ValidIO(new DispatchedInst))
  val loadStaIQEnq = Vec(IQEnqPorts.LOADSTA, ValidIO(new DispatchedInst))
  val stdIQEnq     = Vec(IQEnqPorts.STD,     ValidIO(new DispatchedInst))
 
  // ── IQ 反馈（各 IQ 报告本周期可接收几条） ──
  val iqFeedback   = Input(new IssueQueueFeedback)
 
  // ── 到 LSQ（LQ + SQ 条目分配） ──
  val lsEnq        = new LsEnqIO
 
  // ── 到 ROB ──
  val robEnq       = Flipped(new RobEnqIO)
 
  // ── 冲刷与重定向 ──
  val flush        = Input(Bool())
  val redirect     = Input(new RedirectInfo)
}