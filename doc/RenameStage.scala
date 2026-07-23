package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.backend.rob._
import nscscc.backend.dispatch._
import nscscc.util.CircularQueuePtr
 
class RenameStage(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ── 来自译码级 ──
    val in      = Vec(CtrlBlockWidth, Flipped(Decoupled(new DecodedInst)))
    val ratRead = Vec(CtrlBlockWidth, Flipped(new RATReadIO))
    // ── 向 Dispatch 输出 ──
    val out     = Vec(CtrlBlockWidth, Decoupled(new RenamedInst))
    // ── ROB 提交回传 ──
    val archCommit       = Vec(CommitWidth, Input(new ArchCommitInfo))
    // ── ★ 新增：ROB 容量信息 ──
    val robFreeSpace     = Input(UInt(log2Ceil(RobSize + 1).W))   // ROB剩余可入队容量
    val inFlightToRob    = Input(UInt(log2Ceil(CtrlBlockWidth * 2 + 1).W))  // 在途指令数(分发级+Buffer)
    // ── ★ 新增：分发级/Buffer 刷新归还端口 ──
    val dispatchFlushDealloc = Vec(CtrlBlockWidth, Flipped(Valid(UInt(PhyRegIdxWidth.W))))
    val bufferFlushDealloc   = Vec(CtrlBlockWidth, Flipped(Valid(UInt(PhyRegIdxWidth.W))))
    // ── 重定向 ──
    val redirectInfo    = Flipped ( ValidIO( new redirectInfoToModule ))
    val stall = Input(Bool())
    // ── 全局冲刷 ──
    val flush   = Input(Bool())
  })
  val difftest = if (EnableDifftest) Some(IO(Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))) else None
 
  val resolve = Wire(Valid(new SnapshotResolveInfo))
 
  //快照的释放
  resolve.valid := io.redirectInfo.valid && io.redirectInfo.bits.fromBru
  resolve.bits.snptId := io.redirectInfo.bits.snptId
  resolve.bits.isMispredict := io.redirectInfo.bits.doRedirect
 
  // ================================================================
  //  子模块实例化
  // ================================================================
  val rat             = Module(new RenameTable)
  val freeList        = Module(new FreeList)
  val snapshotManager = Module(new SnapshotManager)
  snapshotManager.io.resolveAllSs := io.redirectInfo.valid && io.redirectInfo.bits.doRedirect && io.redirectInfo.bits.fromRob
 
  if (EnableDifftest) {
    difftest.get := rat.difftest.get
  }
 
  // ================================================================
  //  Phase 1: 流水级寄存器
  // ================================================================
  val stgValid  = RegInit(false.B)
  val laneValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(0.U.asTypeOf(new DecodedInst))))
   
  val outReadyAll = (0 until CtrlBlockWidth).map(i =>
    !laneValid(i) || io.out(i).ready
  ).reduce(_ && _)
 
  val needAllocVec = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && stgData(i).rdValid && stgData(i).rd =/= 0.U
  ))
 
  // ================================================================
  //  ★ 【新增】ROB 容量仲裁
  // ================================================================
  // 计算当前重命名级需要分配的ROB条目数
  val needRobAllocCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i)  // 每条有效指令都需要一个ROB条目
  )))
 
  // 判断ROB是否能接收：剩余空间 - 在途指令数 >= 当前需要分配数
  // robFreeSpace 由 ROB 提供（ROB.count的补数或直接提供）
  // inFlightToRob = dispatchNeedRobCount + bufferValidCount
  val canRobAccept = (io.robFreeSpace - io.inFlightToRob) >= needRobAllocCount
  dontTouch(io.inFlightToRob)
  dontTouch(io.robFreeSpace)
  dontTouch(needRobAllocCount)
 
  // ================================================================
  //  【修改】发射条件：增加 ROB 容量检查
  // ================================================================
  val canFireThisCycle = freeList.io.canAlloc && snapshotManager.io.allocOk && canRobAccept
 
  val outFire = stgValid && outReadyAll && canFireThisCycle && !io.stall
 
  val stgReady = !stgValid || outFire
  val inValid = io.in.map(_.valid).reduce(_ || _)
  val inFire  = inValid && stgReady
   
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := stgReady
  }
 
  val doFlush = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  when(doFlush) {
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) { laneValid(i) := false.B }
  }.elsewhen(inFire) {
    stgValid := true.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := io.in(i).valid
      stgData(i)   := io.in(i).bits
    }
  }.elsewhen(outFire) {
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) { laneValid(i) := false.B }
  }
 
  // ================================================================
  //  快照需求判断
  // ================================================================
  val needSs = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && ( (stgData(i).ctrl.isBranch && !stgData(i).pdInfo.isJal) || stgData(i).pdInfo.isJalr)
  ))
 
  val doNeedSs = VecInit((0 until CtrlBlockWidth).map(i =>
    needSs(i) && outFire  && !doFlush
  ))
 
  // ================================================================
  //  SnapshotManager 连接
  // ================================================================
  snapshotManager.io.doAllocReqs := doNeedSs
  snapshotManager.io.allocReqs := needSs
  snapshotManager.io.resolve  := resolve
 
  // ================================================================
  //  Phase 2: 组合逻辑 —— 重命名核心
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    rat.io.readPorts(i).addr               := io.ratRead(i).rs1
    rat.io.readPorts(i).hold               := io.ratRead(i).hold1
    rat.io.readPorts(CtrlBlockWidth + i).addr   := io.ratRead(i).rs2
    rat.io.readPorts(CtrlBlockWidth + i).hold   := io.ratRead(i).hold2
    rat.io.readPorts(2 * CtrlBlockWidth + i).addr :=
      Mux(stgValid, stgData(i).rd, io.in(i).bits.rd)
    rat.io.readPorts(2 * CtrlBlockWidth + i).hold := false.B
  }
 
  // FreeList 分配请求
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.allocReqs(i) := needAllocVec(i)
  }
  freeList.io.doAlloc := outFire && !doFlush
 
  // ★ 新增：分发级/Buffer 刷新归还端口连接到 FreeList
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.urgentDealloc(i).valid := io.dispatchFlushDealloc(i).valid
    freeList.io.urgentDealloc(i).bits  := io.dispatchFlushDealloc(i).bits
  }
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.urgentDealloc(CtrlBlockWidth + i).valid := io.bufferFlushDealloc(i).valid
    freeList.io.urgentDealloc(CtrlBlockWidth + i).bits  := io.bufferFlushDealloc(i).bits
  }
 
  val specWritePorts = Wire(Vec(CtrlBlockWidth, new RatWritePort))
  for (i <- 0 until CtrlBlockWidth) {
    specWritePorts(i).wen  := outFire && needAllocVec(i)
    specWritePorts(i).addr := stgData(i).rd
    specWritePorts(i).data := freeList.io.allocPdest(i).bits
  }
  rat.io.specWritePorts := specWritePorts
 
  // 架构表写端口
  for (i <- 0 until CommitWidth) {
    rat.io.archWritePorts(i).wen  := io.archCommit(i).valid && io.archCommit(i).rfWen && !io.archCommit(i).isWalk
    rat.io.archWritePorts(i).addr := io.archCommit(i).ldst
    rat.io.archWritePorts(i).data := io.archCommit(i).pdst
  }
 
  // ================================================================
  //  RAT 重定向与快照接口连接
  // ================================================================
  rat.io.redirect      := doFlush
  rat.io.doRecover     := snapshotManager.io.doRecover
  rat.io.recoverId     := snapshotManager.io.recoverId
  rat.io.snptSave      := snapshotManager.io.allocIds
  rat.io.snptInvalidate := snapshotManager.io.invalidateSlots
 
  // ================================================================
  //  FreeList 快照接口连接
  // ================================================================
  freeList.io.snptSave       := snapshotManager.io.allocIds
  freeList.io.doRecover      := snapshotManager.io.doRecover
  freeList.io.recoverId      := snapshotManager.io.recoverId
  freeList.io.snptInvalidate := snapshotManager.io.invalidateSlots
 
  // FreeList 释放端口（archCommit）
  for (i <- 0 until CommitWidth) {
    rat.io.archReadPorts(i).laddr    := io.archCommit(i).ldst
    freeList.io.deallocReqs(i).valid := io.archCommit(i).valid && io.archCommit(i).rfWen
    freeList.io.deallocReqs(i).bits  := Mux( io.archCommit(i).isWalk , io.archCommit(i).pdst, rat.io.archReadPorts(i).pdata)
  }
 
  // ================================================================
  //  RAT 旁路与读结果
  // ================================================================
  val prs1Raw    = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(i).data))
  val prs2Raw    = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(CtrlBlockWidth + i).data))
  val oldPdstRaw = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(2 * CtrlBlockWidth + i).data))
 
  // ================================================================
  //  旁路：同拍内 younger 指令读 older 指令的 pdest
  // ================================================================
  val prs1Bypass = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val prs2Bypass = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val oldPdstBypass = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
 
  for (i <- 0 until CtrlBlockWidth) {
    prs1Bypass(i) := prs1Raw(i)
    prs2Bypass(i) := prs2Raw(i)
    oldPdstBypass(i) := oldPdstRaw(i)
    for (j <- 0 until i) {
      when(outFire && needAllocVec(j) && stgData(j).rd === stgData(i).rs1 && stgData(i).rs1 =/= 0.U) {
        prs1Bypass(i) := freeList.io.allocPdest(j).bits
      }
      when(outFire && needAllocVec(j) && stgData(j).rd === stgData(i).rs2 && stgData(i).rs2 =/= 0.U) {
        prs2Bypass(i) := freeList.io.allocPdest(j).bits
      }
    }
    when(outFire && needAllocVec(i) && stgData(i).rd =/= 0.U) {
      oldPdstBypass(i) := oldPdstRaw(i)
    }
  }
 
  // ================================================================
  //  输出：构造 RenamedInst
  // ================================================================
  // ── robIdx 分配 ──
  // ★ 修改：robIdx 由重命名级自己维护，不再依赖 ROB 的 enqPtr
  // 重命名级维护一个虚拟 enqPtr，保证与 ROB 的 enqPtr 同步
  val virtualEnqPtr = RegInit({ val p = Wire(new RobPtr(RobSize)); p.value := 0.U; p.flag := false.B; p })
 
  // 当 outFire 时推进 virtualEnqPtr
  val outFireCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i => outFire && laneValid(i))))
  when(outFire) {
    virtualEnqPtr := virtualEnqPtr + outFireCount
  }
  // 重定向时重置 virtualEnqPtr
  when(doFlush) {
    virtualEnqPtr := virtualEnqPtr  // 快照恢复会处理RAT，robIdx需要从快照恢复
    // 实际上应该从 redirectInfo 获取正确的 robIdx 起点
    // 如果是 BRU 误预测：virtualEnqPtr = redirectRobIdx + 1
    // 如果是异常：virtualEnqPtr = rollbackTarget + 1（回滚完成后）
    when(io.redirectInfo.valid && io.redirectInfo.bits.fromBru) {
      virtualEnqPtr := io.redirectInfo.bits.robIdx + 1.U
    }
  }
 
  val robIdxPrefixSum = Wire(Vec(CtrlBlockWidth + 1, UInt(log2Ceil(RobSize).W)))
  val robIdxFlagPrefixSum = Wire(Vec(CtrlBlockWidth + 1, Bool()))
  robIdxPrefixSum(0) := virtualEnqPtr.value
  robIdxFlagPrefixSum(0) := virtualEnqPtr.flag
  for (i <- 0 until CtrlBlockWidth) {
    val thisValid = outFire && laneValid(i)
    val prevOffset = robIdxPrefixSum(i) - virtualEnqPtr.value +& thisValid.asUInt
    robIdxPrefixSum(i + 1) := (virtualEnqPtr.value + prevOffset)(log2Ceil(RobSize) - 1, 0)
    robIdxFlagPrefixSum(i + 1) := virtualEnqPtr.flag ^ (virtualEnqPtr.value +& prevOffset >= RobSize.U)
  }
 
  for (i <- 0 until CtrlBlockWidth) {
    val out = io.out(i)
    out.valid := laneValid(i) && outFire
    out.bits.pc          := stgData(i).pc
    out.bits.inst        := stgData(i).inst
    out.bits.ctrl        := stgData(i).ctrl
    out.bits.excp        := stgData(i).excp
    out.bits.imm         := stgData(i).imm
    out.bits.csrAddress  := stgData(i).csrAddress
    out.bits.pdInfo      := stgData(i).pdInfo
    out.bits.bpuInfo     := stgData(i).bpuInfo
    out.bits.ldst        := stgData(i).rd
    out.bits.lrs1        := stgData(i).rs1
    out.bits.lrs2        := stgData(i).rs2
    out.bits.pdst        := freeList.io.allocPdest(i).bits
    out.bits.prs1        := prs1Bypass(i)
    out.bits.prs2        := prs2Bypass(i)
    out.bits.oldPdst     := oldPdstBypass(i)
    out.bits.rs1Valid    := stgData(i).rs1Valid
    out.bits.rs2Valid    := stgData(i).rs2Valid
    out.bits.rdValid     := stgData(i).rdValid
 
    // ★ robIdx 从 virtualEnqPtr 计算
    out.bits.robIdx.value := robIdxPrefixSum(i)
    out.bits.robIdx.flag  := robIdxFlagPrefixSum(i)
 
    out.bits.snptId := snapshotManager.io.allocIds(i)
  }
}