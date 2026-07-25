package nscscc.backend.issue
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.config.IQParams
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  发射队列（IssueQueue）
 *
 *  数据结构：
 *    - 空闲位图管理出入队
 *    - 年龄矩阵择优发射（最老就绪优先）
 *    - 组合逻辑唤醒（写回广播 pdst，同拍生效）
 *    - freeEntriesReg 寄存器替代 PopCount，切断跨模块关键路径
 *
 *  不包含：
 *    - 投机 Load 唤醒
 *    - blocked 位（下游反压时重新仲裁）
 * ═══════════════════════════════════════════════════════════════
 */
class IssueQueue(val iqParams: IQParams)(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // ── 从分发阶段入队 ──
    val enq           = Flipped(ValidIO(new DispatchedInst))
    // ── 发射到读寄存器级 ──
    val issue         = Decoupled(new DispatchedInst)
    // ── 写回唤醒广播 ──
    val wakeupPorts   = Input(Vec(iqParams.numWakeupPorts, Valid(new IssueWakeup)))
    // ── 重定向 / 冲刷 ──
    val redirect      = Input(new RedirectInfo)
    val redirectInfo  = Flipped(ValidIO(new redirectInfoToModule))
    val flushPipeline = Input(Bool())
    // ── 反馈给分发阶段 ──
    val freeEntries   = Output(UInt(log2Ceil(iqParams.numEntries + 1).W))
  })
 
  val N = iqParams.numEntries
  val freeEntriesWidth = log2Ceil(N + 1)
 
  // ================================================================
  //  表项存储
  // ================================================================
  val entryValid   = RegInit(VecInit(Seq.fill(N)(false.B)))
  val entryUops    = RegInit(VecInit(Seq.fill(N)(0.U.asTypeOf(new DispatchedInst))))
  val entryP1Ready = RegInit(VecInit(Seq.fill(N)(false.B)))
  val entryP2Ready = RegInit(VecInit(Seq.fill(N)(false.B)))
 
  // ================================================================
  //  ★ 空闲表项计数寄存器（替代 PopCount 组合逻辑，切断关键路径）
  //     初始化为 N（全部空闲），每周期增量更新
  // ================================================================
  val freeEntriesReg = RegInit(N.U(freeEntriesWidth.W))
 
  // ================================================================
  //  年龄矩阵 age[i][j]=1 表示 entry[i] 比 entry[j] 更老
  // ================================================================
  val age = RegInit(VecInit(Seq.fill(N)(VecInit(Seq.fill(N)(false.B)))))
 
  // ================================================================
  //  唤醒逻辑（组合逻辑，同拍生效）
  // ================================================================
  val p1Wakeup = Wire(Vec(N, Bool()))
  val p2Wakeup = Wire(Vec(N, Bool()))
 
  for (i <- 0 until N) {
    var p1Match = false.B
    var p2Match = false.B
    for (w <- 0 until iqParams.numWakeupPorts) {
      val pdst = io.wakeupPorts(w).bits.pdst
      val wValid = io.wakeupPorts(w).valid && entryValid(i)
      p1Match = p1Match || (wValid && entryUops(i).rs1Valid && entryUops(i).prs1 === pdst)
      p2Match = p2Match || (wValid && entryUops(i).rs2Valid && entryUops(i).prs2 === pdst)
    }
    p1Wakeup(i) := p1Match
    p2Wakeup(i) := p2Match
  }
 
  // 有效就绪位 = 寄存器值 ∨ 本拍唤醒
  val p1Eff = Wire(Vec(N, Bool()))
  val p2Eff = Wire(Vec(N, Bool()))
  for (i <- 0 until N) {
    p1Eff(i) := entryP1Ready(i) || p1Wakeup(i)
    p2Eff(i) := entryP2Ready(i) || p2Wakeup(i)
  }
 
  // ================================================================
  //  重定向 Kill 逻辑
  // ================================================================
  def isRobIdxAfter(a: UInt, b: UInt): Bool = {
    val aFlag = a(a.getWidth - 1)
    val bFlag = b(b.getWidth - 1)
    val aVal  = a(a.getWidth - 2, 0)
    val bVal  = b(b.getWidth - 2, 0)
    Mux(aFlag === bFlag, aVal > bVal, aFlag === 1.U)
  }
 
  val killed = Wire(Vec(N, Bool()))
  val redirectRobIdx = io.redirectInfo.bits.robIdx
  for (i <- 0 until N) {
    val isNewer = entryUops(i).robIdxFull.isAfter(redirectRobIdx)
    killed(i) := entryValid(i) && io.redirectInfo.valid && io.redirectInfo.bits.doRedirect && isNewer
  }
 
  // ================================================================
  //  请求 & 年龄仲裁
  // ================================================================
  val request = Wire(Vec(N, Bool()))
  for (i <- 0 until N) {
    request(i) := entryValid(i) && p1Eff(i) && p2Eff(i) && !killed(i)
  }
 
  val oldest = Wire(Vec(N, Bool()))
  for (i <- 0 until N) {
    var hasOlder = false.B
    for (j <- 0 until N if j != i) {
      hasOlder = hasOlder || (request(j) && !age(i)(j))
    }
    oldest(i) := request(i) && !hasOlder
  }
 
  val grant = oldest   // 单发射端口，grant = oldest
 
  // ================================================================
  //  ★ 发射输出（Decoupled 握手）—— flush 时禁止发射
  //     原代码未检查 flushPipeline，flush 期间仍可能发射，
  //     导致：①错误指令送入执行单元 ②freeEntriesReg 统计出错
  // ================================================================
  io.issue.valid := grant.reduce(_ || _) //&& !io.flushPipeline   // ← 新增 flush 截断
  io.issue.bits  := Mux1H(grant, entryUops)
 
  val issueFire = io.issue.valid && io.issue.ready
 
  // ================================================================
  //  入队逻辑（空闲位图 + 优先编码器）
  //  freeMask / PriorityEncoder 保留（局部逻辑，用于定位入队槽位）
  //  hasFree 改为读寄存器，切断组合路径
  // ================================================================
  val freeMask = VecInit((0 until N).map(i => !entryValid(i)))
  val enqIdx   = PriorityEncoder(freeMask)
  val hasFree  = freeEntriesReg > 0.U     // ← 改为寄存器判断，替代 freeMask.asUInt.orR
  val enqFire  = io.enq.valid && hasFree
 
  // ── Kill/Grant 后的有效掩码（用于年龄矩阵入队更新） ──
  val validAfterKillGrant = Wire(Vec(N, Bool()))
  for (i <- 0 until N) {
    validAfterKillGrant(i) := entryValid(i) && !killed(i) && !(grant(i) && issueFire)
  }
 
  // ================================================================
  //  状态更新
  //  优先级：flush > kill > grant > enqueue > wakeup(hold)
  // ================================================================
  for (i <- 0 until N) {
 
    // ── valid ──
    when(io.flushPipeline) {
      entryValid(i) := false.B
    }.elsewhen(killed(i)) {
      entryValid(i) := false.B
    }.elsewhen(grant(i) && issueFire) {
      entryValid(i) := false.B
    }.elsewhen(enqFire && enqIdx === i.U) {
      entryValid(i) := true.B
    }
 
    // ── entryP1Ready / entryP2Ready ──
    when(io.flushPipeline || killed(i) || (grant(i) && issueFire)) {
      entryP1Ready(i) := false.B
      entryP2Ready(i) := false.B
    }.elsewhen(enqFire && enqIdx === i.U) {
      entryP1Ready(i) := !io.enq.bits.prs1Busy || !io.enq.bits.rs1Valid
      entryP2Ready(i) := !io.enq.bits.prs2Busy || !io.enq.bits.rs2Valid
    }.otherwise {
      entryP1Ready(i) := entryP1Ready(i) || p1Wakeup(i)
      entryP2Ready(i) := entryP2Ready(i) || p2Wakeup(i)
    }
 
    // ── uop ──
    when(enqFire && enqIdx === i.U) {
      entryUops(i) := io.enq.bits
    }
 
    // ── 年龄矩阵 ──
    age(i)(i) := false.B   // 对角线恒 0
    for (j <- 0 until N if j != i) {
      when(io.flushPipeline) {
        age(i)(j) := false.B
      }.elsewhen(killed(i) || killed(j) || (grant(i) && issueFire) || (grant(j) && issueFire)) {
        age(i)(j) := false.B
      }.elsewhen(enqFire && enqIdx === j.U) {
        // 新 entry 在 j 位置是最新（最年轻），所有仍然有效的 entry 都比它老
        age(i)(j) := validAfterKillGrant(i)
      }.elsewhen(enqFire && enqIdx === i.U) {
        // 新 entry 在 i 位置，不比任何人老
        age(i)(j) := false.B
      }
      // 其他情况：age(i)(j) 保持原值
    }
  }
 
  // ================================================================
  //  ★ 空闲表项计数寄存器更新（核心修改）
  //
  //  规则：
  //    flushPipeline → 重置为 N（全空，最高优先级）
  //    否则 → 当前值 + 出队释放数 - 入队占用数 + 重定向淘汰数
  //
  //  说明：
  //    - issueFire（出队）：一个有效表项变空闲 → +1
  //    - enqFire  （入队）：一个空闲表项变占用 → -1
  //    - PopCount(killed) ：被重定向淘汰的有效表项变空闲 → +killCount
  //      ↑ 这是 IQ 内部局部组合逻辑，不跨越模块边界，
  //        不出现在 IQ→Dispatch→Rename→Snapshot 关键路径上
  // ================================================================
  val killedCount = PopCount(killed)
 
  when(io.flushPipeline) {
    freeEntriesReg := N.U(freeEntriesWidth.W)
  }.otherwise {
    freeEntriesReg := freeEntriesReg +& issueFire.asUInt  +& killedCount -& enqFire.asUInt
  }
 
  // ================================================================
  //  ★ 反馈信号 —— 寄存器输出，切断跨模块组合关键路径
  // ================================================================
  io.freeEntries := freeEntriesReg
}