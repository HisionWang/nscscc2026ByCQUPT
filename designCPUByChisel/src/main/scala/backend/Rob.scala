package nscscc.backend.rob
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
import nscscc.backend.redirect._
 
// ═══════════════════════════════════════════════════════════════
//  ROB 内部表项
// ═══════════════════════════════════════════════════════════════
class RobEntryInner(implicit p: Parameters) extends NSBundle {
  val pc          = UInt(XLEN.W)
  val inst        = UInt(XLEN.W)
  val fuType      = UInt(FuType.width.W)
  val pdst        = UInt(PhyRegIdxWidth.W)
  val oldPdst     = UInt(PhyRegIdxWidth.W)
  val ldst        = UInt(5.W)
  val rfWen       = Bool()
  val rfdata      = UInt(XLEN.W)
  val memRead     = Bool()
  val memWrite    = Bool()
  val memVaddr    = UInt(XLEN.W)
  val memPaddr    = UInt(XLEN.W)
  val storeData   = UInt(XLEN.W)
  val sqIdx       = new SqPtr(SqSize)
  val csrWen      = Bool()
  val csrOp       = UInt(CsrOp.width.W)
  val csrWaddr    = UInt(csrAddrLen.W)
  val csrWdata    = UInt(XLEN.W)
  val isPriv      = Bool()
  val excp        = new ExceptionBundle
  val robIdx      = new RobPtr(RobSize)
  val writtenBack = Bool()
  val valid       = Bool()
  val needsRollback = Bool()   // 标记需要回滚的指令（回滚时需要返还pdst）
}
 
class RobCommitIO(implicit p: Parameters) extends NSBundle {
  val valid        = Vec(CommitWidth, Output(Bool()))
  val bits         = Vec(CommitWidth, Output(new RobEntryInner))
  val isWalk       = Output(Bool())
  val isExcpCommit = Vec(CommitWidth, Output(Bool()))
}
 
class RobCommitToSq(implicit p: Parameters) extends NSBundle {
  val valid = Vec(CommitWidth, Output(Bool()))
  val bits  = Vec(CommitWidth, Output(new RobEntryInner))
}
 
class RobCommitToCsr(implicit p: Parameters) extends NSBundle {
  val csrWen   = Bool()
  val csrWaddr = UInt(csrAddrLen.W)
  val csrWdata = UInt(XLEN.W)
}

class ArchCommitInfo(implicit p: Parameters) extends NSBundle {
  val valid   = Bool()
  val isWalk  = Bool()
  val ldst    = UInt(5.W)
  val pdst    = UInt(PhyRegIdxWidth.W)
  val oldPdst = UInt(PhyRegIdxWidth.W)
  val rfWen   = Bool()
}

 
// ═══════════════════════════════════════════════════════════════
//  重排序缓冲区（ROB）
//
//  【提交策略】
//    · 正常指令：commit + archCommit（更新架构RAT + 释放oldPdst）
//    · 异常指令：不提交，留在ROB，回滚时返还pdst
//    · CSR写指令：commit + archCommit，触发重定向，后续指令回滚
//    · CSR写之后的指令：不提交，回滚时返还pdst
//
//  【BRU重定向冲刷】
//    香山风格：redirectBegin/redirectEnd 范围清除
//
//  【ROB回滚】
//    先归还dispatch未入队的pdst，再从enqPtr向deqPtr逐条扫描归还
// ================================================================
class ROB(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    val flush            = Input(Bool())
    val enq              = new RobEnqIO
    val commit           = new RobCommitIO
    val commitToSq       = new RobCommitToSq
    val commitToCsr      = new RobCommitToCsr
    val writeback        = Input(Vec(WbBusWidth, Valid(new RobWriteback)))
 
    // 架构提交（给 Rename/FreeList）
    val archCommit       = Vec(CommitWidth, Output(new ArchCommitInfo))
 
    // ROB 发起的重定向请求
    val robRedirect      = Output(new RobRedirectReq)
 
    // 统一重定向输入
    val redirectInfo     = Flipped(ValidIO(new redirectInfoToModule))
 
    // 回滚控制
    val robPause         = Input(Bool())
    val robNeedRollback  = Input(Bool())
    val robRollbackTarget = Input(new RobPtr(RobSize))
    val robRollbackDone  = Output(Bool())
  })
 
  // ================================================================
  //  0. 指针类型与辅助
  // ================================================================
  class RobPtrInner extends CircularQueuePtr[RobPtrInner](RobSize)
 
  def decPtr(ptr: RobPtrInner): RobPtrInner = {
    val next = Wire(new RobPtrInner)
    when(ptr.value === 0.U) {
      next.value := (RobSize - 1).U
      next.flag  := !ptr.flag
    }.otherwise {
      next.value := ptr.value - 1.U
      next.flag  := ptr.flag
    }
    next
  }
 
  def ptrEq(a: RobPtrInner, b: RobPtrInner): Bool =
    a.value === b.value && a.flag === b.flag
 
  def isInRange(idx: UInt, begin: UInt, end: UInt): Bool =
    Mux(end > begin,
      idx >= begin && idx < end,
      idx >= begin || idx < end
    )
 
  // ================================================================
  //  1. 存储体 + 头尾指针
  // ================================================================
  val entries = Reg(Vec(RobSize, new RobEntryInner))
  dontTouch(entries)
 
  val deqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val enqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  val empty = ptrEq(deqPtr, enqPtr)
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
  val count = enqPtr.distanceTo(deqPtr)
 
  // ================================================================
  //  2. 入队逻辑
  // ================================================================
  val enqValidCount = PopCount(io.enq.valids)
  io.enq.canEnq := !full && (count +& enqValidCount <= RobSize.U)
 
  val enqPrefixSum = Wire(Vec(CtrlBlockWidth + 1, UInt(log2Ceil(RobSize).W)))
  enqPrefixSum(0) := 0.U
  for (j <- 0 until CtrlBlockWidth)
    enqPrefixSum(j + 1) := enqPrefixSum(j) + io.enq.valid(j).asUInt
 
  for (i <- 0 until CtrlBlockWidth) {
    val writeIdx = (enqPtr.value + enqPrefixSum(i))(log2Ceil(RobSize) - 1, 0)
    when(io.enq.valid(i) && io.enq.canEnq) {
      entries(writeIdx).pc           := io.enq.bits(i).pc
      entries(writeIdx).inst         := io.enq.bits(i).inst
      entries(writeIdx).pdst         := io.enq.bits(i).pdst
      entries(writeIdx).oldPdst      := io.enq.bits(i).oldPdst
      entries(writeIdx).ldst         := io.enq.bits(i).ldst
      entries(writeIdx).rfWen        := io.enq.bits(i).rfWen
      entries(writeIdx).memRead      := io.enq.bits(i).memRead
      entries(writeIdx).memWrite     := io.enq.bits(i).memWrite
      entries(writeIdx).memVaddr     := 0.U
      entries(writeIdx).memPaddr     := 0.U
      entries(writeIdx).storeData    := 0.U
      entries(writeIdx).csrWen       := io.enq.bits(i).csrWen
      entries(writeIdx).csrWaddr     := io.enq.bits(i).csrWaddr
      entries(writeIdx).csrOp        := io.enq.bits(i).csrOp
      entries(writeIdx).isPriv       := io.enq.bits(i).isPriv
      entries(writeIdx).fuType       := io.enq.bits(i).fuType
      entries(writeIdx).excp         := io.enq.bits(i).excp
      entries(writeIdx).writtenBack  := false.B
      entries(writeIdx).valid        := true.B
      entries(writeIdx).needsRollback := false.B
      entries(writeIdx).robIdx.value := writeIdx
      entries(writeIdx).robIdx.flag  := enqPtr.flag ^
        (enqPtr.value +& enqPrefixSum(i) >= RobSize.U)
    }
  }
 
  when(io.enq.canEnq && enqValidCount.orR && io.enq.valid(0)) {
    enqPtr := enqPtr + enqValidCount
  }
 
  // ================================================================
  //  3. 写回逻辑
  // ================================================================
  for (wb <- io.writeback) {
    when(wb.valid) {
      val idx = wb.bits.robIdx.value
      entries(idx).writtenBack := true.B
      entries(idx).rfdata      := wb.bits.rfdata
      entries(idx).sqIdx       := wb.bits.sqIdx
      when(wb.bits.memValid) {
        entries(idx).memRead    := wb.bits.isMemRead
        entries(idx).memWrite   := wb.bits.isMemWrite
        entries(idx).memVaddr   := wb.bits.memVaddr
        entries(idx).memPaddr   := wb.bits.memPaddr
        entries(idx).storeData  := wb.bits.memStoreData
      }
      entries(idx).csrWdata := wb.bits.csrWdata
      when(wb.bits.excp.hasException) {
        entries(idx).excp := wb.bits.excp
      }
    }
  }
 
  // ================================================================
  //  4. 提交逻辑
  //
  //  扫描 CommitWidth 条：
  //    · 正常指令：commitValids=true
  //    · 异常指令：不提交，触发 robRedirect，停止扫描
  //    · CSR写指令：提交，触发 robRedirect，停止后续提交
  //    · robPause 期间不提交
  // ================================================================
  val commitCandidates = Wire(Vec(CommitWidth, new RobEntryInner))
  val commitValids     = Wire(Vec(CommitWidth, Bool()))
 
  io.commitToCsr.csrWen   := false.B
  io.commitToCsr.csrWaddr := 0.U
  io.commitToCsr.csrWdata := 0.U
 
  io.robRedirect.valid := false.B
  io.robRedirect  := 0.U.asTypeOf(new RobRedirectReq)
 
  var prevCanCommit = true.B
  var foundExcp     = false.B
  var foundCsrWrite = false.B
 
  for (i <- 0 until CommitWidth) {
    val idx       = (deqPtr.value + i.U)(log2Ceil(RobSize) - 1, 0)
    val entry     = entries(idx)
    val thisReady = entry.valid && entry.writtenBack
    val hasExcp   = entry.excp.hasException
    val isCsrW    = entry.csrWen && !hasExcp
 
    val canConsider = prevCanCommit && thisReady && !io.robPause
 
    // 异常槽：第一条异常指令
    val isExcpSlot = canConsider && hasExcp && !foundExcp
    // CSR写槽：第一条CSR写指令
    val isCsrSlot  = canConsider && isCsrW && !foundCsrWrite && !foundExcp
 
    // 正常提交：非异常、非已遇CSR写/异常
    commitValids(i)      := canConsider && !hasExcp && !foundExcp && !foundCsrWrite
    commitCandidates(i)  := entry
    commitCandidates(i).valid        := DontCare
    commitCandidates(i).writtenBack  := DontCare
    commitCandidates(i).needsRollback := DontCare
 
    // ── 异常处理 ──
    when(isExcpSlot) {
      foundExcp := true.B
      io.robRedirect.valid             := true.B
      io.robRedirect.isException  := true.B
      io.robRedirect.robIdx       := entry.robIdx
      io.robRedirect.excp      := entry.excp
      io.robRedirect.pc           := entry.pc
    }
 
    // ── CSR写处理 ──
    when(isCsrSlot) {
      foundCsrWrite := true.B
      io.robRedirect.valid             := true.B
      io.robRedirect.isException  := false.B
      io.robRedirect.robIdx       := entry.robIdx
      io.robRedirect.excp     := 0.U.asTypeOf(new ExceptionBundle)
      io.robRedirect.pc           := entry.pc
      io.commitToCsr.csrWen   := true.B
      io.commitToCsr.csrWaddr := entry.csrWaddr
      io.commitToCsr.csrWdata := entry.csrWdata
    }
 
    prevCanCommit = prevCanCommit && thisReady
  }
 
  // ── 提交输出 ──
  for (i <- 0 until CommitWidth) {
    io.commit.valid(i)        := commitValids(i)
    io.commit.bits(i)         := commitCandidates(i)
    io.commit.isExcpCommit(i) := false.B
    io.commitToSq.valid(i)    := commitValids(i) && commitCandidates(i).memWrite
    io.commitToSq.bits(i)     := commitCandidates(i)
  }
  io.commit.isWalk := false.B
 
  // ── 正常 archCommit ──
  for (i <- 0 until CommitWidth) {
    io.archCommit(i).valid   := commitValids(i) && commitCandidates(i).rfWen &&
                                commitCandidates(i).ldst =/= 0.U
    io.archCommit(i).isWalk  := false.B
    io.archCommit(i).ldst    := commitCandidates(i).ldst
    io.archCommit(i).pdst    := commitCandidates(i).pdst
    io.archCommit(i).oldPdst := commitCandidates(i).oldPdst
    io.archCommit(i).rfWen   := commitValids(i) && commitCandidates(i).rfWen
  }
 
  // ── 提交后清除表项 + 前进 deqPtr ──
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
  //  5. BRU 重定向冲刷（香山风格：redirectBegin / redirectEnd）
  // ================================================================
  val redirectValidReg = RegInit(false.B)
  val redirectBegin    = Reg(UInt(log2Ceil(RobSize).W))
  val redirectEnd      = Reg(UInt(log2Ceil(RobSize).W))
  val redirectFlushSelf = RegInit(false.B)
 
  val bruArrived   = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect &&
                     io.redirectInfo.bits.fromBru && !isRollingBack
  val bruRobIdx    = io.redirectInfo.bits.robIdx
  val bruFlushSelf = io.redirectInfo.bits.flushSelf
 
  when(bruArrived) {
    redirectValidReg  := true.B
    redirectBegin     := bruRobIdx.value
    redirectEnd       := enqPtr.value
    redirectFlushSelf := bruFlushSelf
    // 恢复 enqPtr
    enqPtr := Mux(bruFlushSelf, bruRobIdx, bruRobIdx + 1.U)
  }
 
  // ================================================================
  //  6. 回滚逻辑
  //
  //  两个阶段：
  //    rb_disp: 归还 dispatch 未入队的 pdst
  //    rb_rob  : 从 enqPtr 向 deqPtr 逐条扫描归还 pdst
  // ================================================================
  val rb_idle :: rb_disp :: rb_rob :: Nil = Enum(3)
  val rollbackState = RegInit(rb_idle)
  val isRollingBack = rollbackState =/= rb_idle
 
  // ── 锁存 dispatch 入队数据（异常/CSR写检测周期锁存）──
  val latchCanEnq   = Reg(Bool())
  val latchEnqValid = Reg(Vec(CtrlBlockWidth, Bool()))
  val latchEnqPdst  = Reg(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val latchEnqRfWen = Reg(Vec(CtrlBlockWidth, Bool()))
 
  when(io.robRedirect.valid) {
    latchCanEnq := io.enq.canEnq
    for (i <- 0 until CtrlBlockWidth) {
      latchEnqValid(i) := io.enq.valid(i) && !io.enq.canEnq &&
                          io.enq.bits(i).rfWen && io.enq.bits(i).ldst =/= 0.U
      latchEnqPdst(i)  := io.enq.bits(i).pdst
      latchEnqRfWen(i) := io.enq.bits(i).rfWen
    }
  }
 
  // ── dispatch 回滚索引 ──
  val dispIdx = RegInit(0.U(log2Ceil(CtrlBlockWidth + 1).W))
 
  // ── ROB 回滚指针 ──
  val rollbackPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  // ── 设置 needsRollback 标志 ──
  val rollbackBeginVal = Reg(UInt(log2Ceil(RobSize).W))
  val rollbackEndVal   = Reg(UInt(log2Ceil(RobSize).W))
  val rollbackRangeSet = RegInit(false.B)
 
  // ── 启动回滚 ──
  when(io.robNeedRollback && !isRollingBack) {
    rollbackBeginVal := deqPtr.value
    rollbackEndVal   := enqPtr.value
    rollbackRangeSet := true.B
    // 设置 needsRollback 标志
    for (i <- 0 until RobSize) {
      when(entries(i).valid && isInRange(i.U, deqPtr.value, enqPtr.value)) {
        entries(i).needsRollback := true.B
      }
    }
    // 判断是否需要 dispatch 回滚
    when(latchCanEnq || !latchEnqValid.asUInt.orR ) {
      // canEnq=true：所有dispatch条目已入队，无需单独归还
      // 或没有有效的dispatch条目
      rollbackState := rb_rob
      rollbackPtr   := decPtr(enqPtr)
    }.otherwise {
      rollbackState := rb_disp
      dispIdx       := 0.U
    }
  }
 
  // ── dispatch 回滚阶段 ──
  when(rollbackState === rb_disp) {
    when(dispIdx >= CtrlBlockWidth.U) {
      rollbackState := rb_rob
      rollbackPtr   := decPtr(enqPtr)
    }.otherwise {
      dispIdx := dispIdx + 1.U
    }
  }
 
  // ── ROB 回滚阶段 ──
  val rollbackAtDeq = ptrEq(rollbackPtr, deqPtr)
  val robIsEmpty    = ptrEq(enqPtr, deqPtr)
 
  when(rollbackState === rb_rob) {
    when(rollbackAtDeq) {
      // 到达 deqPtr，处理该条目后完成
      rollbackState   := rb_idle
      rollbackRangeSet := false.B
      enqPtr           := deqPtr
    }.otherwise {
      rollbackPtr := decPtr(rollbackPtr)
    }
  }
 
  // ── 回滚完成信号 ──
  io.robRollbackDone := (io.robNeedRollback && !isRollingBack && robIsEmpty) ||
                        (rollbackState === rb_rob && rollbackAtDeq) ||
                        (rollbackState === rb_disp && dispIdx >= CtrlBlockWidth.U && robIsEmpty &&
                         !VecInit((0 until RobSize).map(i => entries(i).valid && entries(i).needsRollback)).asUInt.orR)
 
  // 简化：当 rollbackState 回到 rb_idle 时表示完成
  // 需要一个寄存器来延迟一拍发出 done
  val rollbackDoneReg = RegInit(false.B)
  rollbackDoneReg := isRollingBack && (
    (rollbackState === rb_rob && rollbackAtDeq) ||
    (io.robNeedRollback && !isRollingBack && robIsEmpty)
  )
  io.robRollbackDone := rollbackDoneReg
 
  // ── 回滚期间的 archCommit 输出 ──
  val rollbackEntry     = entries(rollbackPtr.value)
  val rollbackNeedFree  = rollbackEntry.valid && rollbackEntry.needsRollback &&
                          rollbackEntry.rfWen && rollbackEntry.ldst =/= 0.U
  val dispNeedFree      = latchEnqValid(dispIdx)
 
  // 回滚时清除表项和标志
  when(rollbackState === rb_rob && !rollbackAtDeq && rollbackEntry.valid) {
    entries(rollbackPtr.value).valid        := false.B
    entries(rollbackPtr.value).needsRollback := false.B
  }
  when(rollbackState === rb_rob && rollbackAtDeq && rollbackEntry.valid && rollbackEntry.needsRollback) {
    entries(rollbackPtr.value).valid        := false.B
    entries(rollbackPtr.value).needsRollback := false.B
  }
 
  // ================================================================
  //  7. 回滚期间的 archCommit 覆盖
  //     正常提交被 robPause 阻断，archCommit 由回滚逻辑驱动
  // ================================================================
  when(isRollingBack) {
    for (i <- 1 until CommitWidth) {
      io.archCommit(i).valid := false.B
      io.archCommit(i).isWalk := true.B
    }
    // slot 0 由回滚逻辑驱动
    when(rollbackState === rb_disp && dispIdx < CtrlBlockWidth.U && dispNeedFree) {
      io.archCommit(0).valid   := true.B
      io.archCommit(0).isWalk  := true.B
      io.archCommit(0).pdst    := latchEnqPdst(dispIdx)
      io.archCommit(0).ldst    := 0.U
      io.archCommit(0).oldPdst := 0.U
      io.archCommit(0).rfWen   := true.B
    }.elsewhen(rollbackState === rb_rob && rollbackNeedFree) {
      io.archCommit(0).valid   := true.B
      io.archCommit(0).isWalk  := true.B
      io.archCommit(0).pdst    := rollbackEntry.pdst
      io.archCommit(0).ldst    := 0.U
      io.archCommit(0).oldPdst := 0.U
      io.archCommit(0).rfWen   := true.B
    }.otherwise {
      io.archCommit(0).valid  := false.B
      io.archCommit(0).isWalk := true.B
    }
    // 回滚期间阻断 commit 输出
    for (i <- 0 until CommitWidth) {
      io.commit.valid(i)        := false.B
      io.commit.isExcpCommit(i) := false.B
      io.commitToSq.valid(i)    := false.B
    }
    io.commit.isWalk := true.B
    io.commitToCsr.csrWen := false.B
  }
 
  // ================================================================
  //  8. 每个 entry 的 valid 位更新
  //     优先级：flush > enq > commit > redirect flush > rollback clear
  // ================================================================
  for (i <- 0 until RobSize) {
    val enqHit = VecInit(
      (0 until CtrlBlockWidth).map(j => {
        val allocPtr = (enqPtr.value + enqPrefixSum(j))(log2Ceil(RobSize) - 1, 0)
        io.enq.valid(j) && io.enq.canEnq && allocPtr === i.U
      })
    ).asUInt.orR && !bruArrived
 
    val commitHit = commitValids.zipWithIndex.map { case (v, j) =>
      v && ((deqPtr.value + j.U)(log2Ceil(RobSize) - 1, 0) === i.U)
    }.reduce(_ || _)
 
    val inFlushRange = redirectValidReg && (
      Mux(redirectEnd > redirectBegin,
        i.U > redirectBegin && i.U < redirectEnd,
        i.U > redirectBegin || i.U < redirectEnd
      )
    )
    val flushSelfHit = redirectValidReg && redirectFlushSelf && i.U === redirectBegin
    val redirectFlushHit = inFlushRange || flushSelfHit
 
    when(io.flush) {
      entries(i).valid := false.B
    }.elsewhen(enqHit) {
      entries(i).valid := true.B
    }.elsewhen(commitHit) {
      entries(i).valid := false.B
    }.elsewhen(redirectFlushHit) {
      entries(i).valid := false.B
    }
    // rollback 的清除在上面 rollbackState 逻辑中处理
  }
 
  // ── redirectValidReg 清除 ──
  when(redirectValidReg) {
    redirectValidReg := false.B
  }
 
  // ================================================================
  //  9. 全局冲刷
  // ================================================================
  when(io.flush) {
    for (i <- 0 until RobSize) {
      entries(i).valid := false.B
      entries(i).needsRollback := false.B
    }
    deqPtr.value := 0.U; deqPtr.flag := false.B
    enqPtr.value := 0.U; enqPtr.flag := false.B
    redirectValidReg  := false.B
    rollbackState     := rb_idle
    rollbackRangeSet  := false.B
    rollbackDoneReg   := false.B
  }
}