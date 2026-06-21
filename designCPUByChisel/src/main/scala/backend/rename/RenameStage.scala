package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  重命名流水级（RenameStage）
 * ═══════════════════════════════════════════════════════════════
 *
 *  【流水线位置】
 *    DecodeStage ──[ratRead]──▶ RenameStage ──▶ Dispatch
 *                                   │
 *                              RenameTable
 *                              FreeList
 *                              ROB 指针管理
 *
 *  ╔══════════════════════════════════════════════════════════╗
 *  ║  关键时序约定（必须严格遵守，否则会产生功能错误）         ║
 *  ║                                                          ║
 *  ║  T0（译码级 Phase 2 组合输出阶段）：                     ║
 *  ║    · io.ratRead[i].rs1/rs2 → RAT.readPorts[*].addr      ║
 *  ║    · specWritePorts（本级计算）→ RAT.specWritePorts      ║
 *  ║    · 以上均为组合信号，T0 结束时寄存到下一级             ║
 *  ║                                                          ║
 *  ║  T1（重命名级寄存器阶段，本级）：                        ║
 *  ║    · stgData 存有 T0 打入的 DecodedInst                  ║
 *  ║    · RAT 输出 readPorts[*].data（已含 T0→T1 旁路）       ║
 *  ║    · 本级做同周期级内旁路，最终确定 prs1/prs2/oldPdst  ║
 *  ║    · FreeList 输出 allocPdest（本级 pdst）                ║
 *  ║    · ROB 指针分配                                        ║
 *  ╚══════════════════════════════════════════════════════════╝
 *
 *  【阻塞时值保持（防止丢失）】
 *    当 outFire=false（下游不 ready 或 FreeList 不足）时：
 *    · stgData/laneValid 保持不变（当然，状态转移 else 分支不执行）
 *    · specWritePorts.wen 必须为 false（阻塞时不重复写 RAT）
 *    · freeList.doAlloc 为 false（不消耗预分配的候选寄存器）
 *    · ROB 指针不前进
 * ═══════════════════════════════════════════════════════════════
 */
class RenameStage(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ── 来自译码级 ──
    val in      = Vec(CtrlBlockWidth, Flipped(Decoupled(new DecodedInst)))
    // ── 译码级给出的 RAT 读请求（T0 组合信号，直接接入 RAT） ──
    val ratRead = Vec(CtrlBlockWidth, Flipped(new RATReadIO))
    // ── 向 Dispatch 输出 ──
    val out     = Vec(CtrlBlockWidth, Decoupled(new RenamedInst))
    // ── ROB 提交回传 ──
    val commit  = Input(Vec(CommitWidth, new RobCommitInfo))
    // ── 重定向 ──
    val redirect = Input(new RedirectInfo)
    // ── 全局冲刷 ──
    val flush   = Input(Bool())

    val debugArchState = Output(Vec(IntLogicRegs, UInt(PhyRegIdxWidth.W)))
  })
 
  // ================================================================
  //  ROB 指针类型（复用 CircularQueuePtr）在Bundles中使用
  // ================================================================
  //class RobPtr extends CircularQueuePtr[RobPtr](RobSize)
 
  // ================================================================
  //  子模块实例化
  // ================================================================
  val rat      = Module(new RenameTable)
  val freeList = Module(new FreeList)
 
  io.debugArchState := rat.io.debugArchState
  // ================================================================
  //  Phase 1: 流水级寄存器（严格对齐 DecodeStage 风格）
  //
  //  同进同出原则：
  //    一个 stgValid 标识"本级当前是否持有一个指令块"
  //    laneValid(i) 标识该块内第 i 路是否有有效指令
  //    stgData(i)   存储第 i 路的 DecodedInst
  // ================================================================
  val stgValid  = RegInit(false.B)
  val laneValid = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(false.B)))
  val stgData   = Reg(Vec(CtrlBlockWidth, new DecodedInst))
 
  // ── 1-1. 下游全部 ready 判断 ──
  // 对于每一路：如果该路为空，或下游已 ready，则该路不卡顿
  val outReadyAll = (0 until CtrlBlockWidth).map(i =>
    !laneValid(i) || io.out(i).ready
  ).reduce(_ && _)
 
  // ── 1-2. 需要 FreeList 分配的通道集合 ──
  // rdValid=true 且 rd≠0 的通道才需要分配新物理寄存器
  val needAllocVec = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && stgData(i).rdValid && stgData(i).rd =/= 0.U
  ))
 
  // ── 1-3. FreeList 能否满足本周期所有分配请求 ──
  val canFireThisCycle = freeList.io.canAlloc
 
  // ── 1-4. outFire：整组可以安全发射 ──
  val outFire = stgValid && outReadyAll && canFireThisCycle
 
  // ── 1-5. stgReady：本级可以接收新数据 ──
  val stgReady = !stgValid || outFire
 
  // ── 1-6. 输入判定 ──
  val inValid = io.in.map(_.valid).reduce(_ || _)
  val inFire  = inValid && stgReady
 
  // ── 1-7. 反压：严格同步给上游 ──
  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready := stgReady
  }
 
  // ── 1-8. 严格状态转移 ──
  val doFlush = io.flush || io.redirect.valid
 
  when(doFlush) {
    // 冲刷/重定向：清空本级
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := false.B
    }
  }.elsewhen(inFire) {
    // 接收新数据：打入寄存器
    stgValid := true.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := io.in(i).valid
      stgData(i)   := io.in(i).bits
    }
  }.elsewhen(outFire) {
    // 旧数据全部成功发射：清空
    stgValid := false.B
    for (i <- 0 until CtrlBlockWidth) {
      laneValid(i) := false.B
    }
  }
  // else：阻塞中，所有寄存器保持不变，数据不丢失
 
  // ================================================================
  //  Phase 2: 组合逻辑 —— 重命名核心
  // ================================================================
 
  // ================================================================
  //  2-1. 连接 RAT 读端口（T0 地址直接来自译码级 io.ratRead）
  //
  //  【时序说明】
  //  io.ratRead 是 DecodeStage.io.ratRead，其信号在译码级的
  //  Phase 2 组合阶段产生（stgData 的直接函数）。
  //  这些信号在 T0 就到达 RAT，RAT 在 T1 输出读数据。
  //  本级（重命名级）是 T1，stgData 也已经在 T1 稳定。
  //  因此 io.ratRead（T0 组合）和 stgData（T1 寄存器）
  //  对应同一批指令，时序上是连续的两拍。
  //
  //  读端口布局：
  //    [0 .. CtrlBlockWidth-1]           = rs1（rj）
  //    [CtrlBlockWidth .. 2*CBW-1]       = rs2（rk）
  //    [2*CtrlBlockWidth .. 3*CBW-1]     = rd（用于读 old_pdst）
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    // rs1 读端口：直接使用译码级给出的读地址 这是直接用到前面的译码传来的数据，无经过流水线
    rat.io.readPorts(i).addr               := io.ratRead(i).rs1
    rat.io.readPorts(i).hold               := io.ratRead(i).hold1
    // rs2 读端口
    rat.io.readPorts(CtrlBlockWidth + i).addr   := io.ratRead(i).rs2
    rat.io.readPorts(CtrlBlockWidth + i).hold   := io.ratRead(i).hold2
    // rd（old_pdst）读端口：读地址同样在 T0 由译码级给出
    // 这里使用 io.ratRead 的 rs1 字段作为 rd 的代理读地址
    // 注意：io.ratRead 没有 rd 字段，需要从 io.in 或 stgData 取
    // 由于 ratRead 是 T0 信号，rd 地址应从 T0 对应的译码输出中取
    // T0 的 rd = T1 的 stgData(i).rd（同一批指令，差一拍）
    // 这里使用一个小技巧：stgData 的 rd 在 T1 稳定，
    // 但 RAT 的读地址需要在 T0 就送入（打一拍后在 T1 读出）
    // → 对 old_pdst 读端口，其地址应该是 T0 的 rd，
    //   即上一级 io.in(i).bits.rd（T0 组合）
    // 为兼容设计，这里用 Mux：若本级正在持有数据（stgValid），
    // 则 old_pdst 的读地址用 stgData(i).rd（T1 寄存器值），
    // 实际上 RAT 在 T0 收到的是上一级的 rd，打一拍后 T1 读出
    rat.io.readPorts(2 * CtrlBlockWidth + i).addr :=
      Mux(stgValid, stgData(i).rd, io.in(i).bits.rd)
    rat.io.readPorts(2 * CtrlBlockWidth + i).hold := false.B
  }
 
  // ================================================================
  //  2-2. FreeList 分配请求
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.allocReqs(i) := needAllocVec(i)
  }
  // 仅在 outFire 时消耗候选（阻塞时不消耗，候选保持有效）
  freeList.io.doAlloc := outFire
 
  // ================================================================
  //  2-3. 计算 specWritePorts（草稿表写入）
  //
  //  【时序关键】
  //  specWritePorts 在 T0 送到 RAT，RAT 在 T1 真正写入草稿表。
  //  本模块在 T1 计算 specWritePorts（使用 stgData，T1 稳定），
  //  但这些信号连接到 RAT 的 specWritePorts 输入口，
  //  RAT 内部会把它们打一拍（t1_wSpec）后在 T1→T2 执行写入。
  //
  //  等等——这会导致写入延迟一拍！
  //
  //  【正确理解】：
  //  根据香山实现，specWritePorts 是在"当前级（重命名级）"产生的，
  //  对应的读地址也是"同一级（译码级组合输出）"产生的。
  //  两者都在 T0 到达 RAT，RAT 内部打一拍后在 T1 一起生效：
  //    T1 读出数据 + T1 旁路修正 = T1 的最终读结果
  //
  //  所以 specWritePorts 应该来自 T0（译码级组合），而非 T1（本级寄存器）。
  //  但 T0 时我们还没做 FreeList 分配（分配结果需要等 T1 的 stgData 稳定）。
  //
  //  【实际解决方案】（iFuCore 的做法）：
  //  FreeList 分配在 ren1（T0 的前一级）就完成，ren2（T1）直接用结果。
  //  即 FreeList 是流水式的：T0 时就把 T1 将要用的 pdst 算好放到缓存里。
  //  这正是 regIndices/regValids 缓存机制的意义：
  //    FreeList 每周期从位图中预先算好下一批候选，缓存好，
  //    T1 直接取缓存中的值，零延迟。
  //  因此 specWritePorts 可以在 T1 时用 FreeList 缓存中已经算好的 pdst。
  //
  //  【阻塞保持语义】
  //  当 outFire=false 时，wen 必须为 false，防止重复写入。
  // ================================================================
  val specWritePorts = Wire(Vec(CtrlBlockWidth, new RatWritePort))
  for (i <- 0 until CtrlBlockWidth) {
    // 只有在整组真正发射时才写 RAT（防止阻塞时 T1 的写被多次送入 RAT）
    specWritePorts(i).wen  := outFire && needAllocVec(i)
    specWritePorts(i).addr := stgData(i).rd
    specWritePorts(i).data := freeList.io.allocPdest(i).bits
  }
  rat.io.specWritePorts := specWritePorts
 
  // ================================================================
  //  2-4. 架构表写端口（ROB 提交时驱动）
  // ================================================================
  for (i <- 0 until CommitWidth) {
    rat.io.archWritePorts(i).wen  := io.commit(i).valid && io.commit(i).rfWen
    rat.io.archWritePorts(i).addr := io.commit(i).ldst
    rat.io.archWritePorts(i).data := io.commit(i).pdst
  }
 
  // ================================================================
  //  2-5. 重定向信号连接
  // ================================================================
  rat.io.redirect := io.redirect.valid
 
  // ================================================================
  //  2-6. FreeList 释放端口（ROB 提交时释放旧物理寄存器）
  // ================================================================
  for (i <- 0 until CommitWidth) {
    rat.io.archReadPorts(i).laddr    := io.commit(i).ldst
    freeList.io.deallocReqs(i).valid := io.commit(i).valid && io.commit(i).rfWen
    freeList.io.deallocReqs(i).bits  := rat.io.archReadPorts(i).pdata
  }
 

 
  // ================================================================
  //  2-8. 读取 RAT 结果 + 同周期级内旁路
  //
  //  【T0→T1 跨周期旁路】：已在 RenameTable 内部完成
  //
  //  【同周期级内旁路】：本级处理（iFuCore DoBypass 逻辑）
  //
  //  场景描述：
  //    通道 j（j < i）：rd=r5，分配了 pdst=p30
  //      → specWritePort(j) 将在下拍写 RAT[r5]=p30
  //    通道 i：rj=r5，RAT 读出旧值 p20
  //      → 通道 i 的 prs1 应使用 p30（通道 j 的新映射）
  //
  //  实现：遍历 j < i 的前序通道，若：
  //    needAllocVec(j) && stgData(j).rd == stgData(i).rj && rd≠0
  //  则 prs1(i) 覆盖为 freeList.io.allocPdest(j).bits
  //  多个 j 命中时，j 越大（越靠后）越优先（for 循环后覆盖前，天然实现）
  // ================================================================
 
  // RAT T1 输出的原始物理寄存器号
  val prs1Raw      = VecInit((0 until CtrlBlockWidth).map(i =>
    rat.io.readPorts(i).data))

  val prs2Raw      = VecInit((0 until CtrlBlockWidth).map(i =>
    rat.io.readPorts(CtrlBlockWidth + i).data))

  val oldPdstRaw = VecInit((0 until CtrlBlockWidth).map(i =>
    rat.io.readPorts(2 * CtrlBlockWidth + i).data))
 
  // 同周期旁路后的最终值
  val prs1Final      = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val prs2Final      = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
  val oldPdstFinal   = Wire(Vec(CtrlBlockWidth, UInt(PhyRegIdxWidth.W)))
 
  for (i <- 0 until CtrlBlockWidth) {
    // ── 默认值：使用 RAT 读出的值 ──
    prs1Final(i)      := prs1Raw(i)
    prs2Final(i)      := prs2Raw(i)
    oldPdstFinal(i) := oldPdstRaw(i)
 
    for (j <- 0 until i) {
      // 前序通道 j 分配了新 pdst 且目标寄存器非零
      val jHasAlloc = laneValid(j) && needAllocVec(j) && stgData(j).rd =/= 0.U
      dontTouch(jHasAlloc)
      val jPdst     = freeList.io.allocPdest(j).bits
 
      // rs1 旁路：j 写了 i 的 rs1
      when(jHasAlloc && stgData(j).rd === stgData(i).rj && stgData(i).rs1Valid) {
        prs1Final(i) := jPdst
      }
      // rs2 旁路：j 写了 i 的 rs2
      when(jHasAlloc && stgData(j).rd === stgData(i).rk && stgData(i).rs2Valid) {
        prs2Final(i) := jPdst
      }
      // oldPdst 旁路：j 写了 i 的 rd（同一逻辑寄存器被连续写）
      // 此时 i 的 oldPdst 应该是 j 的 pdst（而非更旧的 RAT 值）
      when(jHasAlloc && stgData(j).rd === stgData(i).rd) {
        oldPdstFinal(i) := jPdst
      }
    }
  }
 
  // ================================================================
  //  2-9. ROB 指针分配
  //
  //  使用 CircularQueuePtr 管理 ROB 头指针
  //  每周期为有效指令按通道顺序分配连续的 robIdx
  //
  //  重定向时：
  //    · flushSelf=true → robIdxHead 跳到误预测指令的 robIdx（重新执行它）
  //    · flushSelf=false → 跳到 robIdx+1（误预测指令自身保留在 ROB 中提交）
  // ================================================================
  val robIdxHead = RegInit({
    val ptr = Wire(new RobPtr(RobSize))
    ptr.value := 0.U
    ptr.flag  := false.B
    ptr
  })
 
  // 本周期有效指令数（需分配 ROB 条目）
  val validCount = PopCount(
    VecInit((0 until CtrlBlockWidth).map(i => stgValid && laneValid(i)))
  )
 
  // robIdxHead 下一拍值
  val robIdxHeadNext = Wire(new RobPtr(RobSize))
  robIdxHeadNext := robIdxHead   // 默认保持
 
  when(io.redirect.valid) {
    // 重定向：跳转到指定位置
    val targetValue = //Mux(
      //io.redirect.flushSelf,
      io.redirect.robIdx //,
      //io.redirect.robIdx + 1.U
   // )
    robIdxHeadNext.value := targetValue
    robIdxHeadNext.flag  := false.B
  }.elsewhen(outFire) {
    // 正常发射：head 前进 validCount 步（利用 CircularQueuePtr 的 + 运算）
    robIdxHeadNext := robIdxHead + validCount
  }
  robIdxHead := robIdxHeadNext
 
  // 为每条有效指令分配 robIdx（累积偏移）
  val robIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(RobSize).W)))
  var robOffset  = 0.U(log2Ceil(RobSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    val thisPtr = robIdxHead + robOffset
    robIndices(i) := thisPtr.value
    // 仅当该路有效时才前进偏移（无效路不占 ROB 条目）
    robOffset = robOffset + laneValid(i).asUInt
  }

    // ================================================================
  //  2-7. FreeList 重定向与分支快照
  // ================================================================
  freeList.io.flush        := io.flush
  freeList.io.brMispredict := io.redirect.valid
  freeList.io.brMispredTag := io.redirect.robIdx(log2Ceil(SnapshotNum) - 1, 0)
 
  // 分支标记：检测本周期是否有条件分支指令
  // brTag 由 ROB 分配，这里用 robIdx 的低位作为 brTag 索引
  for (i <- 0 until CtrlBlockWidth) {
    freeList.io.renBrTags(i).valid := outFire && laneValid(i) && stgData(i).ctrl.isBranch
    freeList.io.renBrTags(i).bits  :=
      (robIdxHead + i.U).value(log2Ceil(SnapshotNum) - 1, 0)
      // robIdxHead 在下方定义，此处引用
  }
 
  // ================================================================
  //  2-10. 快照管理（RAT 快照由 RAT 内部维护）
  //  本级只需在条件分支指令发射时通知 RAT 创建快照
  // ================================================================
  val hasBranch = VecInit((0 until CtrlBlockWidth).map(i =>
    stgValid && laneValid(i) && stgData(i).ctrl.isBranch
  )).asUInt.orR
 
  // 只有在真正发射（outFire）时才创建快照
  rat.io.snptEnq      := hasBranch && outFire
  // 分支正确提交时释放快照（由外部 ROB 提交逻辑驱动）
  rat.io.snptDeq      := false.B   // 外部接入
  rat.io.snptRedirect := io.redirect.valid
  rat.io.snptSelect   := io.redirect.robIdx(log2Ceil(SnapshotNum) - 1, 0)
 
  // ================================================================
  //  2-11. 组装输出
  // ================================================================
  for (i <- 0 until CtrlBlockWidth) {
    val u = io.out(i).bits
 
    // ── 直传字段 ──
    u.pc         := stgData(i).pc
    u.inst       := stgData(i).inst
    u.ctrl       := stgData(i).ctrl
    u.excpVec    := stgData(i).excpVec
    u.imm        := stgData(i).imm
    u.csrAddress := stgData(i).csrAddress
    u.pdInfo     := stgData(i).pdInfo
 
    // ── 逻辑寄存器号 ──
    u.ldst := stgData(i).rd
    u.lrs1 := stgData(i).rs1
    u.lrs2 := stgData(i).rs2
 
    // ── 物理寄存器号 ──
    // r0 固定映射 p0（值恒为 0），不需要读 RAT
    u.prs1 := Mux(stgData(i).rj === 0.U || !stgData(i).rs1Valid,
                  0.U, prs1Final(i))
    u.prs2 := Mux( (stgData(i).rk === 0.U && !stgData(i).ctrl.memWrite) || !stgData(i).rs2Valid,
                  0.U, prs2Final(i))
    u.pdst := Mux(needAllocVec(i), freeList.io.allocPdest(i).bits, 0.U)
    u.oldPdst := Mux(needAllocVec(i) && stgData(i).rd =/= 0.U,
                       oldPdstFinal(i), 0.U)
 
    // ── 有效性 ──
    u.rs1Valid := stgData(i).rs1Valid
    u.rs2Valid := stgData(i).rs2Valid
    u.rdValid  := stgData(i).rdValid
 
    // ── ROB 索引 ──
    u.robIdx := robIndices(i)
 
    // ── 输出握手 ──
    // valid：本级有效 + 该路有效 + FreeList 能满足分配
    io.out(i).valid := stgValid && laneValid(i) && canFireThisCycle
  }
}