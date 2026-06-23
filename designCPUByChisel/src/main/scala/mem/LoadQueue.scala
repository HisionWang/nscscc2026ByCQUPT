package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  Load Queue（LQ）
 * ═══════════════════════════════════════════════════════════════
 *
 *  环形队列，单端口入队，单端口地址写回。
 *  参考 ROB 的 CircularQueuePtr 管理方式。
 *
 *  【入队】      Dispatch 驱动，每周期最多 1 条 Load
 *  【地址写回】  Load 执行单元完成后按 lqIdx 写入虚拟地址
 *  【提交/重定向】预留接口，暂不实现
 * ═══════════════════════════════════════════════════════════════
 */
class LoadQueue(implicit p: Parameters) extends NSModule {
 
  // ── 内部指针类型 ──
  class LqPtrInner extends CircularQueuePtr[LqPtrInner](LqSize)
 
  // ── 内部表项 ──
  class LqEntry(implicit p: Parameters) extends NSBundle {
    val robIdx    = UInt(log2Ceil(RobSize).W)   // ROB 索引（value 部分）
    val sqIdx     = UInt(log2Ceil(SqSize).W)    // 交叉引用：此 Load 之前最新的 SQ 位置
    val valid     = Bool()                       // 表项有效
    val addrValid = Bool()                       // 地址已就绪
    val vaddr     = UInt(XLEN.W)                 // 虚拟地址
    val pc        = UInt(XLEN.W)                 // PC（调试 / 异常用）
    val pdst      = UInt(PhyRegIdxWidth.W)       // 物理目的寄存器（写回用）
    val committed = Bool()                       // 已提交（预留）
  }
 
  val io = IO(new Bundle {
    // ── 入队（来自 Dispatch） ──
    val enqValid  = Input(Bool())
    val enqRobIdx = Input(UInt(log2Ceil(RobSize).W))
    val enqSqIdx  = Input(UInt(log2Ceil(SqSize).W))
    val enqPc     = Input(UInt(XLEN.W))
    val enqPdst   = Input(UInt(PhyRegIdxWidth.W))
 
    // ── 地址写回（来自 Load 执行单元） ──
    val addrWriteValid = Input(Bool())
    val addrWriteIdx   = Input(UInt(log2Ceil(LqSize).W))
    val addrWriteVaddr = Input(UInt(XLEN.W))
 
    // ── 状态 ──
    val full   = Output(Bool())
    val empty  = Output(Bool())
    val enqPtr = Output(UInt(log2Ceil(LqSize).W))
 
    // ── 提交接口（预留） ──
    val commitValid  = Output(Bool())
    val commitRobIdx = Output(UInt(log2Ceil(RobSize).W))
    val commitReady  = Input(Bool())
 
    // ── 重定向接口（预留） ──
    val redirectValid  = Input(Bool())
    val redirectRobIdx = Input(UInt(log2Ceil(RobSize).W))
  })
 
  // ================================================================
  //  存储体 + 头尾指针
  // ================================================================
  val entries = Reg(Vec(LqSize, new LqEntry))
  dontTouch(entries)
 
  val enqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val deqPtr = RegInit({
    val p = Wire(new LqPtrInner); p.value := 0.U; p.flag := false.B; p
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
  //
  //  单端口：每周期最多入队 1 条 Load
  //  写入位置 = enqPtr.value，写入后 enqPtr 前进 1 步
  // ================================================================
  val enqFire = io.enqValid && !full
 
  when(enqFire) {
    val idx = enqPtr.value
    entries(idx).robIdx    := io.enqRobIdx
    entries(idx).sqIdx     := io.enqSqIdx
    entries(idx).valid     := true.B
    entries(idx).addrValid := false.B
    entries(idx).vaddr     := 0.U
    entries(idx).pc        := io.enqPc
    entries(idx).pdst      := io.enqPdst
    entries(idx).committed := false.B
 
    enqPtr := enqPtr + 1.U
  }
 
  // ================================================================
  //  地址写回逻辑（Load 执行单元写入）
  //
  //  写回在源码中位于入队之后，若同周期同表项，
  //  Chisel last-connect 语义保证写回优先（正确行为：
  //  地址已就绪不该被入队的 false.B 覆盖）。
  // ================================================================
  when(io.addrWriteValid) {
    val idx = io.addrWriteIdx
    entries(idx).addrValid := true.B
    entries(idx).vaddr     := io.addrWriteVaddr
  }
 
  // ================================================================
  //  预留接口
  // ================================================================
  io.commitValid  := false.B
  io.commitRobIdx := DontCare
}