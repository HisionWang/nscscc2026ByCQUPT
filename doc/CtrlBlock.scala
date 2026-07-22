// CtrlBlock.scala 关键变更部分
 
class CtrlBlock(implicit p: Parameters) extends NSModule {
  val io = IO(new CtrlBlockIO)
  val difftest = if (EnableDifftest) Some(IO(Output(new CtrlBlockDifftestBundle))) else None
 
  val doFlush = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  
  val decodeStage = Module(new DecodeStage)
  val renameStage = Module(new RenameStage)
  val redirectController = Module(new RedirectController)
  val dispatchStage = Module(new DispatchStage)
  val rob = Module(new ROB)
  
  // ★ 新增：DispatchRobBuffer
  val dispatchRobBuffer = Module(new DispatchRobBuffer)
 
  // ... (redirectController连线保持不变)
 
  decodeStage.io.in    <> io.in
  decodeStage.io.extInt := io.extInt
  decodeStage.io.flush  := doFlush                  
 
  // ================================================================
  //  重命名级 - ★ 新增连线
  // ================================================================
  renameStage.io.in      <> decodeStage.io.out
  renameStage.io.ratRead <> decodeStage.io.ratRead
  renameStage.io.flush    := doFlush
  renameStage.io.redirectInfo := io.redirectInfo
  renameStage.io.stall := redirectController.io.robRedirectPause
  
  // ★ 新增：ROB容量信息连线
  renameStage.io.robFreeSpace := rob.io.robFreeSpace
  // inFlightToRob = dispatchNeedRobCount + bufferValidCount
  renameStage.io.inFlightToRob := dispatchStage.io.dispatchNeedRobCount +& dispatchRobBuffer.io.validCount
  
  // ★ 新增：分发级/Buffer刷新归还端口连线
  renameStage.io.dispatchFlushDealloc <> dispatchStage.io.dispatchFlushDealloc
  renameStage.io.bufferFlushDealloc   <> dispatchRobBuffer.io.bufferFlushDealloc
 
  if (EnableDifftest) {
    difftest.get.archState := renameStage.difftest.get
  }
 
  // ================================================================
  //  分发级 - ★ 修改连线
  // ================================================================
  dispatchStage.io.in       <> renameStage.io.out
  dispatchStage.io.flush    := doFlush
  dispatchStage.io.redirectInfo := io.redirectInfo
  dispatchStage.io.stall := redirectController.io.robRedirectPause
  
  // IQ端口连线保持不变
  dispatchStage.io.q1IQEnq     <> io.q1IQEnq
  dispatchStage.io.q2IQEnq     <> io.q2IQEnq
  dispatchStage.io.q3IQEnq     <> io.q3IQEnq
  dispatchStage.io.q4IQEnq     <> io.q4IQEnq
  dispatchStage.io.q5IQEnq     <> io.q5IQEnq
  dispatchStage.io.iqFeedback <> io.iqFeedback
  dispatchStage.io.lsEnq <> io.lsEnq
  
  // ★ 修改：分发级的 robEnq 现在连接到 DispatchRobBuffer（而非直接连到ROB）
  dispatchStage.io.robEnq <> dispatchRobBuffer.io.enq
  
  // ================================================================
  //  ★ 新增：DispatchRobBuffer 连线
  // ================================================================
  // Buffer → ROB
  dispatchRobBuffer.io.deq <> rob.io.enq
  
  // Buffer 控制
  dispatchRobBuffer.io.flush       := doFlush  // 误预测重定向：全刷Buffer
  dispatchRobBuffer.io.pause       := redirectController.io.robRedirectPause  // 异常回滚：暂停Buffer
  dispatchRobBuffer.io.redirectInfo := io.redirectInfo
  
  // ================================================================
  //  ROB - ★ 新增连线
  // ================================================================
  rob.io.redirectInfo := io.redirectInfo
  rob.io.robPause := redirectController.io.robRedirectPause
  redirectController.io.robRedirect := rob.io.robRedirect
  rob.io.robNeedRollback := redirectController.io.robNeedRollback
  rob.io.robRollbackTarget := redirectController.io.robRollbackTarget
  redirectController.io.robRollbackDone := rob.io.robRollbackDone
  
  // ★ 新增：ROB接收Buffer内容信息（回滚时遍历Buffer）
  rob.io.bufferValid  := dispatchRobBuffer.io.bufValidOut  // 需要在Buffer模块中新增此输出
  rob.io.bufferPdst   := dispatchRobBuffer.io.bufPdstOut   // 需要在Buffer模块中新增此输出
  rob.io.bufferRfWen  := dispatchRobBuffer.io.bufRfWenOut  // 需要在Buffer模块中新增此输出
  rob.io.bufferLdst   := dispatchRobBuffer.io.bufLdstOut   // 需要在Buffer模块中新增此输出
  
  // ROB提交连线保持不变
  renameStage.io.archCommit <> rob.io.archCommit
  io.commitToSq := rob.io.commitToSq
  io.commitToCsr := rob.io.commitToCsr
 
  // ... (difftest连线保持不变)
}


// 需要在 DispatchRobBuffer 中新增以下输出端口（供ROB回滚使用）：
// 
// // 在 DispatchRobBuffer 的 IO 中新增：
// val bufValidOut = Output(Vec(CtrlBlockWidth, Bool()))   // Buffer当前有效位
// val bufPdstOut  = Output(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))  // Buffer当前pdest
// val bufRfWenOut = Output(Vec(CtrlBlockWidth, Bool()))   // Buffer当前rfWen
// val bufLdstOut  = Output(Vec(CtrlBlockWidth, UInt(5.W))) // Buffer当前ldst
//  
// // 连线：
// io.bufValidOut  := bufValid
// io.bufPdstOut   := VecInit((0 until CtrlBlockWidth).map(i => bufData(i).pdst))
// io.bufRfWenOut  := VecInit((0 until CtrlBlockWidth).map(i => bufData(i).rfWen))
// io.bufLdstOut   := VecInit((0 until CtrlBlockWidth).map(i => bufData(i).ldst))