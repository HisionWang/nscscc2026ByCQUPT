// ═══════════════════════════════════════════════════════════════
//  ROB 修改部分（仅列出变更区域，其余保持原代码不变）
// ═══════════════════════════════════════════════════════════════
 
class ROB(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    val flush            = Input(Bool())
    val enq              = new RobEnqIO
    val commit           = new RobCommitIO
    val commitToSq       = new RobCommitToSq
    val commitToCsr      = new RobCommitToCsr
    val writeback        = Input(Vec(WbBusWidth, Valid(new RobWriteback)))
 
    val archCommit       = Vec(CommitWidth, Output(new ArchCommitInfo))
    val robRedirect      = Output(new RobRedirectReq)
    val redirectInfo     = Flipped(ValidIO(new redirectInfoToModule))
 
    val robPause         = Input(Bool())
    val robNeedRollback  = Input(Bool())
    val robRollbackTarget= Input(new RobPtr(RobSize))
    val robRollbackDone  = Output(Bool())
    
    // ★ 新增：ROB剩余可入队容量输出（供重命名级计算）
    val robFreeSpace     = Output(UInt(log2Ceil(RobSize + 1).W))
    
    // ★ 新增：Buffer内容输入（回滚时需要遍历Buffer的pdest）
    val bufferValid      = Input(Vec(CtrlBlockWidth, Bool()))
    val bufferPdst       = Input(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
    val bufferRfWen      = Input(Vec(CtrlBlockWidth, Bool()))
    val bufferLdst       = Input(Vec(CtrlBlockWidth, UInt(5.W)))
  })
 
  // ... (原有代码: RobPtrInner, decPtr, ptrEq, entries, deqPtr, enqPtr, full, count 保持不变)
 
  // ================================================================
  //  ★ 新增：robFreeSpace 输出
  // ================================================================
  // robFreeSpace = RobSize - count
  // 这表示ROB中当前剩余的可入队容量
  io.robFreeSpace := RobSize.U - count
 
  // ================================================================
  //  2. 入队逻辑 (Enqueue) - 保持原有逻辑
  // ================================================================
  val enqValidCount = PopCount(io.enq.valids)
  io.enq.canEnq := !full && (count +& enqValidCount <= RobSize.U)
  io.enq.full := count > RobSize.U - 6.U
 
  // ... (enqPrefixSum, enq写入逻辑保持不变)
 
  // ================================================================
  //  5. BRU 重定向冲刷 - 保持原有逻辑
  // ================================================================
  // ... (redirectValidReg, redirectBegin, redirectEnd, redirectFlushSelf 保持不变)
 
  // ================================================================
  //  ★ 6. ROB 回滚逻辑 (Rollback FSM) - 核心修改
  // ================================================================
  // 修改说明：
  // - rb_disp 阶段现在遍历 DispatchRobBuffer 中未能入队的指令
  //   （分发级的指令已经直接归还FreeList，不再需要通过ROB回滚）
  // - latchEnqValid/latchEnqPdst/latchEnqRfWen 锁存的是 Buffer 的内容
  //   而不是原来的 io.enq 内容
  
  val rb_idle :: rb_disp :: rb_rob :: Nil = Enum(3)
  val rollbackState = RegInit(rb_idle)
  val isRollingBack = rollbackState =/= rb_idle
  
  // ── 锁存 Buffer 中未能入队的指令信息 ──
  val latchCanEnq   = RegInit(true.B)
  val latchEnqValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val latchEnqPdst  = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(0.U(PhyRegIdxWidth.W))))
  val latchEnqRfWen = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val latchEnqLdst  = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(0.U(5.W))))
  
  when(io.robRedirect.valid) {
    latchCanEnq := io.enq.canEnq
    for (i <- 0 until CtrlBlockWidth) {
      // ★ 修改：锁存的是 Buffer 的内容（bufferValid/bufferPdst/bufferRfWen）
      // 而不是 io.enq 的内容
      // Buffer中未能入ROB的指令：bufferValid(i) && !io.enq.canEnq
      // 但实际上，由于重命名级保证了容量，Buffer中的指令一定能入ROB
      // 只有在回滚暂停期间Buffer中滞留的指令才需要处理
      latchEnqValid(i) := io.bufferValid(i) && !io.enq.canEnq && io.bufferRfWen(i) && io.bufferLdst(i) =/= 0.U
      latchEnqPdst(i)  := io.bufferPdst(i)
      latchEnqRfWen(i) := io.bufferRfWen(i)
      latchEnqLdst(i)  := io.bufferLdst(i)
    }
  }
  
  val dispIdx     = RegInit(0.U(log2Ceil(CtrlBlockWidth + 1).W))
  val rollbackPtr = RegInit({ val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p })
  val rollbackAtDeq = ptrEq(rollbackPtr, deqPtr)
  
  // ── 启动回滚与状态转移 ──
  when(io.robNeedRollback && rollbackState === rb_idle) {
    when(!latchCanEnq || !latchEnqValid.asUInt.orR) {
      rollbackState := rb_rob
      rollbackPtr   := Mux(ptrEq(enqPtr, deqPtr), deqPtr, decPtr(enqPtr))
    }.otherwise {
      rollbackState := rb_disp
      dispIdx       := 0.U
    }
  }
  
  switch(rollbackState) {
    is(rb_disp) {
      when(dispIdx >= CtrlBlockWidth.U) {
        rollbackState := rb_rob
        rollbackPtr   := Mux(ptrEq(enqPtr, deqPtr), deqPtr, decPtr(enqPtr))
      }.otherwise {
        dispIdx := dispIdx + 1.U
      }
    }
    is(rb_rob) {
      when(rollbackAtDeq) {
        rollbackState := rb_idle
        enqPtr        := deqPtr
      }.otherwise {
        rollbackPtr   := decPtr(rollbackPtr)
      }
    }
  }
 
  io.robRollbackDone := (rollbackState === rb_rob) && rollbackAtDeq
  
  // ── 覆盖输出：回滚时通过 ArchCommit 归还 Buffer 和 ROB 的物理寄存器 ──
  val rollbackEntry    = entries(rollbackPtr.value)
  val rollbackNeedFree = rollbackEntry.valid && rollbackEntry.rfWen && rollbackEntry.ldst =/= 0.U
  val dispNeedFree     = latchEnqValid(dispIdx)
  
  when(isRollingBack) {
    for (i <- 1 until CommitWidth) {
      io.archCommit(i).valid  := false.B
      io.archCommit(i).isWalk := true.B
    }
    
    // 第 0 槽位：rb_disp阶段归还Buffer的pdest，rb_rob阶段归还ROB entries的pdest
    when(rollbackState === rb_disp && dispIdx < CtrlBlockWidth.U && dispNeedFree) {
      io.archCommit(0).valid   := true.B
      io.archCommit(0).isWalk  := true.B
      io.archCommit(0).pdst    := latchEnqPdst(dispIdx)
      io.archCommit(0).ldst    := latchEnqLdst(dispIdx)
      io.archCommit(0).oldPdst := 0.U
      io.archCommit(0).rfWen   := latchEnqRfWen(dispIdx)
    }.elsewhen(rollbackState === rb_rob && rollbackNeedFree) {
      io.archCommit(0).valid   := true.B
      io.archCommit(0).isWalk  := true.B
      io.archCommit(0).pdst    := rollbackEntry.pdst
      io.archCommit(0).ldst    := 0.U
      io.archCommit(0).oldPdst := 0.U
      io.archCommit(0).rfWen   := true.B
    }.otherwise {
      io.archCommit(0).valid   := false.B
      io.archCommit(0).isWalk  := true.B
    }
  }
 
  // ... (剩余代码：commit逻辑、valid位控制、全局复位保持不变)
}