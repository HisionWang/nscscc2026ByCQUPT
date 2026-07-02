package nscscc.backend.rob
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.decode._
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  重排序缓冲区（ROB）
 * ═══════════════════════════════════════════════════════════════
 *
 *  环形队列结构，每条指令按序入队、按序提交。
 *
 *  【入队】由 Dispatch 驱动，CtrlBlockWidth 路同时入队
 *  【提交】从头部按序提交 CommitWidth 条（无异常且已写回）
 *  【写回】执行单元完成后标记该条目已写回
 *  【重定向】误预测/异常时清空到指定位置
 *
 *  【每条表项存储】
 *    · 指令基本信息（pc、inst 等）
 *    · 物理寄存器映射（pdst、oldPdst、ldst、rfWen）
 *    · 状态位：writtenBack（是否已写回）、valid（是否有效）
 *    · 异常向量
 *
 *  【与 CircularQueue 的区别】
 *    CircularQueue 的 deq 是标准 FIFO 出队，但 ROB 的提交
 *    需要检查 writtenBack 和 excpVec，且重定向需要冲刷到
 *    任意位置。因此 ROB 自行管理存储体和指针。
 * ═══════════════════════════════════════════════════════════════
 */
 
// ROB 内部表项
class RobEntryInner(implicit p: Parameters) extends NSBundle {
  val pc          = UInt(XLEN.W)
  val inst        = UInt(XLEN.W)
  val pdst        = UInt(PhyRegIdxWidth.W)
  val oldPdst     = UInt(PhyRegIdxWidth.W)
  val ldst        = UInt(5.W)
  val rfWen       = Bool()
  val rfdata       = UInt(XLEN.W)
  val memRead     = Bool()
  val memWrite    = Bool()
  val sqIdx       = new SqPtr(SqSize)
  val csrWen      = Bool()
  val fuType      = UInt(FuType.width.W)
  val excpVec     = UInt(ExceptionCode.width.W)
  val writtenBack = Bool()    // 执行单元是否已写回
  val valid       = Bool()    // 该表项是否有效（含有效指令）
}
 
class ROB(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val flush   = Input(Bool())
    val enq     = new RobEnqIO
    val commit  = new RobCommitIO
    val commitToSq = new RobCommitToSq
    val redirect = new RobRedirectIO
    val writeback = Input(Vec(WbBusWidth, Valid(new RobWriteback)))  // 执行单元写回
  })


  // ================================================================
  //  1. 指针类型（复用 CircularQueuePtr）
  // ================================================================
  class RobPtrInner extends CircularQueuePtr[RobPtrInner](RobSize)
 
  // ================================================================
  //  2. 存储体 + 头尾指针
  // ================================================================
  val entries = Reg(Vec(RobSize, new RobEntryInner))
  dontTouch(entries)
 
  val deqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val enqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  // ================================================================
  //  3. 空满判断
  // ================================================================
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
 
  // 计算已占用条目数
  val count = enqPtr.distanceTo(deqPtr)
 
  // ================================================================
  //  4. 入队逻辑（Dispatch 写入）
  // ================================================================
  val enqValidCount = PopCount(io.enq.valids)
 
  // 能否入队：剩余空间 >= 入队数
  io.enq.canEnq := !full && (count +& enqValidCount <= RobSize.U)
 
  var enqOffset = 0.U(log2Ceil(RobSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    val writeIdx = (enqPtr.value + enqOffset)(log2Ceil(RobSize) - 1, 0)

    when(io.enq.valid(i) && io.enq.canEnq) {
      entries(writeIdx).pc          := io.enq.bits(i).pc
      entries(writeIdx).inst        := io.enq.bits(i).inst
      entries(writeIdx).pdst        := io.enq.bits(i).pdst
      entries(writeIdx).oldPdst     := io.enq.bits(i).oldPdst
      entries(writeIdx).ldst        := io.enq.bits(i).ldst
      entries(writeIdx).rfWen       := io.enq.bits(i).rfWen
      entries(writeIdx).memRead     := io.enq.bits(i).memRead
      entries(writeIdx).memWrite    := io.enq.bits(i).memWrite
      entries(writeIdx).csrWen      := io.enq.bits(i).csrWen
      entries(writeIdx).fuType      := io.enq.bits(i).fuType
      entries(writeIdx).excpVec     := io.enq.bits(i).excpVec
      entries(writeIdx).writtenBack := false.B
      entries(writeIdx).valid       := true.B
    }
   
    // 仅当前面的通道有效时才前进偏移
    enqOffset = enqOffset + io.enq.valid(i).asUInt
  }
 
  // 入队成功后尾指针前进
  when(io.enq.canEnq && enqValidCount.orR && io.enq.valid(0)) {
    enqPtr := enqPtr + enqValidCount
  }
 
  // ================================================================
  //  5. 写回逻辑（执行单元标记完成）
  // ================================================================
  for (wb <- io.writeback) {
    when(wb.valid) {
      entries(wb.bits.robIdx.value).writtenBack := true.B
      entries(wb.bits.robIdx.value).rfdata := wb.bits.rfdata
      entries(wb.bits.robIdx.value).memWrite := wb.bits.isMemWrite
      entries(wb.bits.robIdx.value).sqIdx := wb.bits.sqIdx
      // 如果有异常，更新异常向量
      when(wb.bits.excpVec.orR) {
        entries(wb.bits.robIdx.value).excpVec := wb.bits.excpVec
      }
    }
  }
 
  // ================================================================
  //  6. 提交逻辑（从头部按序提交已写回且无异常的指令）
  //
  //  扫描头部最多 CommitWidth 条：
  //    · valid && writtenBack && 无异常 → 正常提交
  //    · valid && writtenBack && 有异常 → 触发重定向，提交到该条目
  //    · !writtenBack 或 !valid → 停止提交
  // ================================================================
  val commitCandidates = Wire(Vec(CommitWidth, new RobCommitEntry))
  val commitValids     = Wire(Vec(CommitWidth, Bool()))
  var prevCanCommit = true.B   // Scala var，指向不同周期的 Chisel 值
  for (i <- 0 until CommitWidth) {
    val idx   = (deqPtr.value + i.U)(log2Ceil(RobSize) - 1, 0)
    val entry = entries(idx)
   
    val thisReady = entry.valid && entry.writtenBack
    val hasExcp   = entry.excpVec.orR
   
    // 本槽能正常提交：前序都能提交 + 本身就绪 + 无异常
    commitValids(i) := prevCanCommit && thisReady //&& !hasExcp
   
    commitCandidates(i).pdst    := entry.pdst
    commitCandidates(i).oldPdst := entry.oldPdst
    commitCandidates(i).ldst    := entry.ldst
    commitCandidates(i).rfWen   := entry.rfWen

    commitCandidates(i).pc       := entry.pc
    commitCandidates(i).inst       := entry.inst
    commitCandidates(i).wrdata   := entry.rfdata

    //SQ的
    commitCandidates(i).sqIdx   := entry.sqIdx
    commitCandidates(i).memWrite   := entry.memWrite
   
    // 累积条件：前序都能提交 && 本身就绪（异常也算就绪，但会停止后续）
    prevCanCommit = prevCanCommit && thisReady
  }
 
  // 输出提交信息
  for (i <- 0 until CommitWidth) {
    io.commit.valid(i) := commitValids(i)
    io.commit.bits(i)  := commitCandidates(i)

    io.commitToSq.valid(i) := commitCandidates(i).memWrite && commitValids(i)
    io.commitToSq.bits(i) := commitCandidates(i)
  }
  io.commit.isWalk := false.B
 
  // 提交成功后清除表项、前进头指针
  val commitCount = PopCount(commitValids)
  for (i <- 0 until CommitWidth) {
    val idx = (deqPtr.value + i.U)(log2Ceil(RobSize) - 1, 0)
    when(commitValids(i)) {
      entries(idx).valid := false.B
    }
  }
  when(commitCount.orR) {
    deqPtr := deqPtr + commitCount
  }
 
  // ================================================================
  //  7. 重定向输出（检测异常 + 写回标记异常）
  //
  //  扫描写回口：如果某条指令写回时带异常/误预测，
  //  立即发出重定向信号。
  //  这里只做异常重定向，分支误预测由 BRU 单独发出。
  // ================================================================
  io.redirect.valid    := false.B
  io.redirect.robIdx   := 0.U.asTypeOf(new RobPtr(RobSize))
  io.redirect.flushSelf := true.B
  io.redirect.pc       := 0.U
  io.redirect.excpVec  := 0.U
  io.redirect.isEbreak := false.B
 
  // 从写回口检测异常
  for (wb <- io.writeback) {
    when(wb.valid && wb.bits.excpVec.orR) {
      io.redirect.valid    := true.B
      io.redirect.robIdx   := wb.bits.robIdx
      io.redirect.flushSelf := true.B
      io.redirect.excpVec  := entries(wb.bits.robIdx.value).excpVec
      io.redirect.pc       := entries(wb.bits.robIdx.value).pc
    }
  }
 
  // ================================================================
  //  8. 冲刷逻辑（重定向时清空 ROB）
  //  将指定 robIdx 之后的所有条目置为无效
  //  并将 enqPtr/deqPtr 恢复
  // ================================================================
  when(io.flush) {
    for (i <- 0 until RobSize) {
      entries(i).valid := false.B
    }
    deqPtr.value := 0.U
    deqPtr.flag  := false.B
    enqPtr.value := 0.U
    enqPtr.flag  := false.B
  }
}