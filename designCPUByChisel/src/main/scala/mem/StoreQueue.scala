package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode.LsuOp
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  Store Queue（SQ）
 * ═══════════════════════════════════════════════════════════════
 *
 *  环形队列，单端口入队，STA / STD 各一个写端口。
 *  STA 与 STD 可能在同一周期对同一表项写入，但它们写不同字段，互不冲突。
 *
 *  参考 ROB 的 CircularQueuePtr 管理方式。
 * ═══════════════════════════════════════════════════════════════
 */
class StoreQueue(implicit p: Parameters) extends NSModule {
 
  // ── 内部指针类型 ──
  class SqPtrInner extends CircularQueuePtr[SqPtrInner](SqSize)
 
  // ── 内部表项 ──
  class SqEntry(implicit p: Parameters) extends NSBundle {
    val robIdx    = UInt(log2Ceil(RobSize).W)
    val lqIdx     = UInt(log2Ceil(LqSize).W)    // 交叉引用：此 Store 之前最新的 LQ 位置
    val valid     = Bool()
    val addrValid = Bool()                       // STA 已完成
    val dataValid = Bool()                       // STD 已完成
    val vaddr     = UInt(XLEN.W)                 // 虚拟地址（STA 写入）
    val data      = UInt(XLEN.W)                 // 待写入数据（STD 写入）
    val lsuOp     = UInt(LsuOp.width.W)          // LSU 操作码（用于后续计算字节掩码）
    val pc        = UInt(XLEN.W)
    val committed = Bool()                       // 已提交（预留）
  }
 
  val io = IO(new Bundle {
    // ── 入队（来自 Dispatch） ──
    val enqValid  = Input(Bool())
    val enqRobIdx = Input(UInt(log2Ceil(RobSize).W))
    val enqLqIdx  = Input(UInt(log2Ceil(LqSize).W))
    val enqPc     = Input(UInt(XLEN.W))
    val enqPdst   = Input(UInt(PhyRegIdxWidth.W))
 
    // ── 地址写回（来自 STA 执行单元） ──
    val addrWriteValid = Input(Bool())
    val addrWriteIdx   = Input(UInt(log2Ceil(SqSize).W))
    val addrWriteVaddr = Input(UInt(XLEN.W))
    val addrWriteLsuOp = Input(UInt(LsuOp.width.W))
 
    // ── 数据写回（来自 STD 执行单元） ──
    val dataWriteValid = Input(Bool())
    val dataWriteIdx   = Input(UInt(log2Ceil(SqSize).W))
    val dataWriteData  = Input(UInt(XLEN.W))
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(SqSize).W))
 
    // ── 提交接口（预留） ──
    val commitValid  = Output(Bool())
    val commitRobIdx = Output(UInt(log2Ceil(RobSize).W))
    val commitVaddr  = Output(UInt(XLEN.W))
    val commitData   = Output(UInt(XLEN.W))
    val commitReady  = Input(Bool())
 
    // ── 重定向接口（预留） ──
    val redirectValid  = Input(Bool())
    val redirectRobIdx = Input(UInt(log2Ceil(RobSize).W))
  })
 
  // ================================================================
  //  存储体 + 头尾指针
  // ================================================================
  val entries = Reg(Vec(SqSize, new SqEntry))
  dontTouch(entries)
 
  val enqPtr = RegInit({
    val p = Wire(new SqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val deqPtr = RegInit({
    val p = Wire(new SqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
    dontTouch(enqPtr)
  dontTouch(deqPtr)
 
  // ================================================================
  //  空满判断
  // ================================================================
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
 
  io.full   := full
  io.empty  := empty
  io.enqPtr := enqPtr.value
 
  // ================================================================
  //  入队逻辑（Dispatch 写入）
  // ================================================================
  val enqFire = io.enqValid && !full
 
  when(enqFire) {
    val idx = enqPtr.value
    entries(idx).robIdx    := io.enqRobIdx
    entries(idx).lqIdx     := io.enqLqIdx
    entries(idx).valid     := true.B
    entries(idx).addrValid := false.B
    entries(idx).dataValid := false.B
    entries(idx).vaddr     := 0.U
    entries(idx).data      := 0.U
    entries(idx).lsuOp     := 0.U
    entries(idx).pc        := io.enqPc
    entries(idx).committed := false.B
 
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  STA 地址写回（与 STD 写不同字段，同周期不冲突）
  //
  //  写回在入队之后，last-connect 语义保证写回优先。
  // ================================================================
  when(io.addrWriteValid) {
    val idx = io.addrWriteIdx
    entries(idx).addrValid := true.B
    entries(idx).vaddr     := io.addrWriteVaddr
    entries(idx).lsuOp     := io.addrWriteLsuOp
  }
 
  // ================================================================
  //  STD 数据写回（与 STA 写不同字段，同周期不冲突）
  // ================================================================
  when(io.dataWriteValid) {
    val idx = io.dataWriteIdx
    entries(idx).dataValid := true.B
    entries(idx).data      := io.dataWriteData
  }
 
  // ================================================================
  //  预留接口
  // ================================================================
  io.commitValid  := false.B
  io.commitRobIdx := DontCare
  io.commitVaddr  := DontCare
  io.commitData   := DontCare
}