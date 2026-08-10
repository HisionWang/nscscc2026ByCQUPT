package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.backend.rob._
import nscscc.util.CircularQueuePtr

// designCPUByChisel/src/main/scala/backend/rename/RenameStage.scala
// ===== 修改部分 =====
 
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
    val robCount     = Input(UInt(log2Ceil(RobSize + 1).W))   // ROB剩余可入队容量
    val inFlightToRename    = Input(UInt(log2Ceil(CtrlBlockWidth * 2 + 1).W))  // 在途指令数(分发级+Buffer)



    val redirectInfo    = Flipped ( ValidIO( new redirectInfoToModule ))
    val stall = Input(Bool())

    // ── 快照解析（来自后端 BRU）──        ← 新增

    // ── 全局冲刷 ──
    val flush   = Input(Bool())
  })
  val difftest = if (EnableDifftest) Some(IO(Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W))))) else None
 
  val resolve = Wire(Valid(new SnapshotResolveInfo))


  //快照的释放
  resolve.valid := io.redirectInfo.valid && io.redirectInfo.bits.fromBru //io.redirectInfo.bits.doRedirect
  resolve.bits.snptId := io.redirectInfo.bits.snptId
  resolve.bits.isMispredict := io.redirectInfo.bits.doRedirect

  // ================================================================
  //  ROB 指针类型（复用 CircularQueuePtr）在Bundles中使用
  // ================================================================
  //class RobPtr extends CircularQueuePtr[RobPtr](RobSize)
 
  // ================================================================
  //  子模块实例化
  // ================================================================
  val rat             = Module(new RenameTable)
  val freeList        = Module(new FreeList)
  val snapshotManager = Module(new SnapshotManager)   // ← 新增
  //异常情况释放所有的快照槽位
  snapshotManager.io.resolveAllSs := io.redirectInfo.valid && io.redirectInfo.bits.doRedirect && io.redirectInfo.bits.fromRob

 
  if (EnableDifftest) {
    difftest.get := rat.difftest.get
  }
  // ================================================================
  //  Phase 1: 流水级寄存器（不变）
  // ================================================================
  val stgValid  = RegInit(false.B)
  val laneValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(0.U.asTypeOf(new DecodedInst))))

  val laneWaitForward = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && stgData(i).ctrl.waitForward && stgValid
  ))
  val laneBlockBackward = VecInit((0 until CtrlBlockWidth).map(i =>
    laneValid(i) && stgData(i).ctrl.blockBackward && stgValid
  ))

  val hasSpecial = laneWaitForward.asUInt.orR || laneBlockBackward.asUInt.orR

 
  val outReadyAll = (0 until CtrlBlockWidth).map(i =>
    !laneValid(i) || io.out(i).ready
  ).reduce(_ && _)
 
  val needAllocVec = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && stgData(i).rdValid && stgData(i).rd =/= 0.U
  ))

  val needRobAllocCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i)  // 每条有效指令都需要一个ROB条目
  )))
 
  // 判断ROB是否能接收：剩余空间 - 在途指令数 >= 当前需要分配数
  // robFreeSpace 由 ROB 提供（ROB.count的补数或直接提供）
  // inFlightToRob = dispatchNeedRobCount + bufferValidCount
  val canRobAccept = ( RobSize.U >= needRobAllocCount +& io.inFlightToRename +& io.robCount ) && ( !hasSpecial || (hasSpecial && io.inFlightToRename +& io.robCount === 0.U))
 

 
  // ================================================================
  //  【修改】发射条件：增加快照容量检查
  // ================================================================
  val canFireThisCycle = freeList.io.canAlloc && snapshotManager.io.allocOk && canRobAccept && !io.stall// ← 修改
 
  val outFire = stgValid && outReadyAll && canFireThisCycle 


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
  //  【新增】快照需求判断
  //    条件分支（非 JAL）需要快照；JAL 已在预译码阶段正确处理
  // ================================================================
  val needSs = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && ( (stgData(i).ctrl.isBranch && !stgData(i).pdInfo.isJal) || stgData(i).pdInfo.isJalr)
  ))

  val doNeedSs = VecInit((0 until CtrlBlockWidth).map(i =>
    needSs(i) && outFire  && !doFlush
  ))

 
  // ================================================================
  //  【新增】SnapshotManager 连接
  // ================================================================
  snapshotManager.io.doAllocReqs := doNeedSs
  snapshotManager.io.allocReqs := needSs
  // 分支解析来自后端
  snapshotManager.io.resolve  := resolve
 
  // ================================================================
  //  Phase 2: 组合逻辑 —— 重命名核心
  // ================================================================
 
  // RAT 读端口连接（不变）
  for (i <- 0 until CtrlBlockWidth) {
    rat.io.readPorts(i).addr               := io.ratRead(i).rs1
    rat.io.readPorts(i).hold               := io.ratRead(i).hold1
    rat.io.readPorts(CtrlBlockWidth + i).addr   := io.ratRead(i).rs2
    rat.io.readPorts(CtrlBlockWidth + i).hold   := io.ratRead(i).hold2
    rat.io.readPorts(2 * CtrlBlockWidth + i).addr :=
      Mux(stgValid, stgData(i).rd, io.in(i).bits.rd)
    rat.io.readPorts(2 * CtrlBlockWidth + i).hold := false.B
  }
 
  // FreeList 分配请求（不变）
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.allocReqs(i) := needAllocVec(i)
  }
  freeList.io.doAlloc := outFire && !doFlush
 
  // specWritePorts（不变）
  val specWritePorts = Wire(Vec(CtrlBlockWidth, new RatWritePort))
  for (i <- 0 until CtrlBlockWidth) {
    specWritePorts(i).wen  := outFire && needAllocVec(i)
    specWritePorts(i).addr := stgData(i).rd
    specWritePorts(i).data := freeList.io.allocPdest(i).bits
  }
  rat.io.specWritePorts := specWritePorts
 
  // 架构表写端口（不变）
  for (i <- 0 until CommitWidth) {
    rat.io.archWritePorts(i).wen  := io.archCommit(i).valid && io.archCommit(i).rfWen && !io.archCommit(i).isWalk
    rat.io.archWritePorts(i).addr := io.archCommit(i).ldst
    rat.io.archWritePorts(i).data := io.archCommit(i).pdst
  }
 
  // ================================================================
  //  【修改】RAT 重定向与快照接口连接
  // ================================================================
  rat.io.redirect      := doFlush
  rat.io.doRecover     := snapshotManager.io.doRecover        // ← 新增
  rat.io.recoverId     := snapshotManager.io.recoverId        // ← 新增
  rat.io.snptSave      := snapshotManager.io.allocIds         // ← 修改：每条通道的快照保存
  rat.io.snptInvalidate := snapshotManager.io.invalidateSlots // ← 新增
 
  // ================================================================
  //  【修改】FreeList 快照接口连接
  // ================================================================
  freeList.io.snptSave       := snapshotManager.io.allocIds          // ← 修改
  freeList.io.doRecover      := snapshotManager.io.doRecover         // ← 修改
  freeList.io.recoverId      := snapshotManager.io.recoverId         // ← 修改
  freeList.io.snptInvalidate := snapshotManager.io.invalidateSlots   // ← 新增
  //freeList.io.flush          :=  io.flush
 
  // FreeList 释放端口（不变）
  for (i <- 0 until CommitWidth) {
    rat.io.archReadPorts(i).laddr    := io.archCommit(i).ldst
    freeList.io.deallocReqs(i).valid := io.archCommit(i).valid && io.archCommit(i).rfWen
    freeList.io.deallocReqs(i).bits  := Mux( io.archCommit(i).isWalk , io.archCommit(i).pdst, rat.io.archReadPorts(i).pdata)
  }
 
  // ================================================================
  //  RAT 旁路与读结果（不变）
  // ================================================================
  val prs1Raw    = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(i).data))
  val prs2Raw    = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(CtrlBlockWidth + i).data))
  val oldPdstRaw = VecInit((0 until CtrlBlockWidth).map(i => rat.io.readPorts(2 * CtrlBlockWidth + i).data))
 
  val prs1Final    = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val prs2Final    = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val oldPdstFinal = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
 
  for (i <- 0 until CtrlBlockWidth) {
    prs1Final(i)    := prs1Raw(i)
    prs2Final(i)    := prs2Raw(i)
    oldPdstFinal(i) := oldPdstRaw(i)
 
    for (j <- 0 until i) {
      val jHasAlloc = laneValid(j) && needAllocVec(j) && stgData(j).rd =/= 0.U
      val jPdst     = freeList.io.allocPdest(j).bits
      when(jHasAlloc && stgData(j).rd === stgData(i).rs1 && stgData(i).rs1Valid) {
        prs1Final(i) := jPdst
      }
      when(jHasAlloc && stgData(j).rd === stgData(i).rs2 && stgData(i).rs2Valid) {
        prs2Final(i) := jPdst
      }
      when(jHasAlloc && stgData(j).rd === stgData(i).rd) {
        oldPdstFinal(i) := jPdst
      }
    }
  }
 
  // ROB 指针分配（不变）
  val robIdxHead = RegInit({
    val ptr = Wire(new RobPtr(RobSize)); ptr.value := 0.U; ptr.flag := false.B; ptr
  })
  val validCount = PopCount(VecInit((0 until CtrlBlockWidth).map(i => stgValid && laneValid(i))))
  val robIdxHeadNext = Wire(new RobPtr(RobSize))
  robIdxHeadNext := robIdxHead
  when(doFlush) {
    //异常在ROb中的行为实际上是和普通的出队一样的操作的，所以这里的指针也应该是这样的变化
    robIdxHeadNext := io.redirectInfo.bits.robIdx + 1.U
    //when(io.redirectInfo.bits.flushSelf){
    //  robIdxHeadNext := io.redirectInfo.bits.robIdx
    //}.otherwise{
    //  robIdxHeadNext := io.redirectInfo.bits.robIdx + 1.U
    //}
    
    //robIdxHeadNext.flag  := false.B
  }.elsewhen(outFire) {
    robIdxHeadNext := robIdxHead + validCount
  }
  robIdxHead := robIdxHeadNext
 
  val robIndices = Wire(Vec(CtrlBlockWidth, new RobPtr(RobSize)))
  var robOffset  = 0.U(log2Ceil(RobSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    robIndices(i) := robIdxHead + robOffset
    robOffset = robOffset + laneValid(i).asUInt
  }
 
  // ================================================================
  //  【修改】组装输出：新增 snptId
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    val u = io.out(i).bits
 
    u.pc         := stgData(i).pc
    u.inst       := stgData(i).inst
    u.ctrl       := stgData(i).ctrl
    u.excp       := stgData(i).excp
    u.imm        := stgData(i).imm
    u.csrAddress := stgData(i).csrAddress
    u.cacop      := stgData(i).cacop
    u.pdInfo     := stgData(i).pdInfo
    u.bpuInfo    := stgData(i).bpuInfo
 
    u.ldst := stgData(i).rd
    u.lrs1 := stgData(i).rs1
    u.lrs2 := stgData(i).rs2
 
    u.prs1 := Mux(stgData(i).rs1 === 0.U || !stgData(i).rs1Valid, 0.U, prs1Final(i))
    u.prs2 := Mux(stgData(i).rs2 === 0.U || !stgData(i).rs2Valid, 0.U, prs2Final(i))
    u.pdst := Mux(needAllocVec(i), freeList.io.allocPdest(i).bits, 0.U)
    u.oldPdst := Mux(needAllocVec(i) && stgData(i).rd =/= 0.U, oldPdstFinal(i), 0.U)
 
    u.rs1Valid := stgData(i).rs1Valid
    u.rs2Valid := stgData(i).rs2Valid
    u.rdValid  := stgData(i).rdValid
 
    u.robIdx := robIndices(i)
 
    // 【新增】快照 ID：仅分支指令有效
    u.snptId := snapshotManager.io.allocIds(i)
 
    io.out(i).valid := stgValid && laneValid(i) && canFireThisCycle
  }
}
