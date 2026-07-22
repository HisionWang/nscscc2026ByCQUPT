// ================================================================
//  Dispatch→ROB 流水线寄存器 IO
// ================================================================
class DispatchRobBufferIO(implicit p: Parameters) extends NSBundle {
  // ── 从 DispatchStage 接收 ──
  val enq = Flipped(new RobEnqIO)
  // ── 向 ROB 发送 ──
  val deq = new RobEnqIO
  // ── 状态反馈 ──
  val validCount = Output(UInt(log2Ceil(CtrlBlockWidth + 1).W))  // Buffer 中有效指令数
  // ── 控制 ──
  val flush       = Input(Bool())   // 误预测重定向：全刷
  val pause       = Input(Bool())   // 异常回滚暂停
  val redirectInfo = Flipped(ValidIO(new redirectInfoToModule))
}
 
// ================================================================
//  分发级刷新归还端口（直接通至 FreeList）
// ================================================================
class DispatchFlushDeallocIO(implicit p: Parameters) extends NSBundle {
  val dispatchFlush = Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W)))  // 分发级刷新归还
  val bufferFlush   = Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W)))  // Buffer刷新归还
}


//同时修改 RobEnqIO，为 Buffer 的 deq 端口增加 canEnq 的含义调整（Buffer侧不需要再检测canEnq，因为重命名级已保证；但ROB侧仍需输出canEnq供重命名级参考）：

class RobEnqIO(implicit p: Parameters) extends NSBundle {
  val valid  = Vec(CtrlBlockWidth, Input(Bool()))      // 每条指令是否有效（来自上一级）
  val valids = Vec(CtrlBlockWidth, Input(Bool()))      // 原始有效性（用于ROB内部计数）
  val bits   = Vec(CtrlBlockWidth, Input(new RobEntryInner))
  val canEnq = Output(Bool())   // ROB是否能容纳本批指令（供重命名级参考）
  val full   = Output(Bool())
}
//RobEnqIO 保持不变，因为 ROB 侧的接口不需要改变。

