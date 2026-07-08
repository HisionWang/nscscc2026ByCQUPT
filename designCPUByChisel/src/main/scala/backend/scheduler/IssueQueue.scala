package nscscc.backend.issue
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.config.IQParams   // ← 显式引入 IQParams
/**
 * ═══════════════════════════════════════════════════════════════
 *  发射队列（IssueQueue）
 *
 *  数据结构：
 *    - 空闲位图管理出入队
 *    - 年龄矩阵择优发射（最老就绪优先）
 *    - 组合逻辑唤醒（写回广播 pdst，同拍生效）
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
    val bruInfo    = Flipped (ValidIO( new redirectInfoFromBru ))    // 误预测重定向
    val flushPipeline = Input(Bool())
    // ── 反馈给分发阶段 ──
    val freeEntries   = Output(UInt(log2Ceil(iqParams.numEntries + 1).W))
  })
 
  val N = iqParams.numEntries
 
  // ================================================================
  //  表项存储
  // ================================================================
  val entryValid   = RegInit(VecInit(Seq.fill(N)(false.B)))
  
  val entryUops    = Reg(Vec(N, new DispatchedInst))
  val entryP1Ready = RegInit(VecInit(Seq.fill(N)(false.B)))
  val entryP2Ready = RegInit(VecInit(Seq.fill(N)(false.B)))
 
  // ================================================================
  //  年龄矩阵 age[i][j]=1 表示 entry[i] 比 entry[j] 更老 这算法还牛的 
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
  //  robIdxFull 的 MSB 为环绕位，低 bit 为索引
  //  比较规则：同 flag 比大小，不同 flag 则 flag=1 的更晚
  // ================================================================
  def isRobIdxAfter(a: UInt, b: UInt): Bool = {
    val aFlag = a(a.getWidth - 1)
    val bFlag = b(b.getWidth - 1)
    val aVal  = a(a.getWidth - 2, 0)
    val bVal  = b(b.getWidth - 2, 0)
    Mux(aFlag === bFlag, aVal > bVal, aFlag === 1.U)
  }

val killed = Wire(Vec(N, Bool()))
val redirectRobIdx = io.bruInfo.bits.robIdx
  for (i <- 0 until N) {
      // 比较 e.robIdxFull 是否比 redirect.robIdx 更新
      val sameFlag = entryUops(i).robIdxFull.flag === redirectRobIdx.flag
      // flushSelf=true: >= (包含自身); flushSelf=false: > (不含自身)
      //val isNewer = Mux(sameFlag,
      //  Mux(false.B, //io.redirect.flushSelf,
      //    entryUops(i).robIdxFull.value >= redirectRobIdx.value,
      //    entryUops(i).robIdxFull.value >  redirectRobIdx.value
      //  ),
      //  Mux(false.B,  //io.redirect.flushSelf,
      //    entryUops(i).robIdxFull.value <= redirectRobIdx.value,
      //    entryUops(i).robIdxFull.value <  redirectRobIdx.value
      //  )
      //)
      val isNewer = entryUops(i).robIdxFull.isAfter(redirectRobIdx)
      
      killed(i) := entryValid(i) && io.bruInfo.valid && io.bruInfo.bits.doRedirect && isNewer

    
  }


  
//  for (i <- 0 until N) {
//    killed(i) := entryValid(i) && io.bruInfo.valid && io.bruInfo.bits.doRedirect
//                 isRobIdxAfter(entryUops(i).robIdxFull.value, io.bruInfo.robIdx.value)
//  }
 
  // ================================================================
  //  请求 & 年龄仲裁
  // ================================================================
  val request = Wire(Vec(N, Bool()))
  for (i <- 0 until N) {
    request(i) := entryValid(i) && p1Eff(i) && p2Eff(i) && !killed(i)
  }
 
  // oldest[i] = request[i] && 不存在比 i 更老的请求者
  //  val oldest = Wire(Vec(N, Bool()))
  //  for (i <- 0 until N) {
  //    val hasOlder = (0 until N).map(j => j != i).map(j =>
  //      request(j) && !age(i)(j)   // age[i][j]=0 意味着 j 比 i 老
  //    ).reduce(_ || _)
  //    oldest(i) := request(i) && !hasOlder
  //  }

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
  //  发射输出（Decoupled 握手）
  // ================================================================
  io.issue.valid := grant.reduce(_ || _)
  io.issue.bits  := Mux1H(grant, entryUops)
 
  val issueFire = io.issue.valid && io.issue.ready
 
  // ================================================================
  //  入队逻辑（空闲位图 + 优先编码器）
  // ================================================================
  val freeMask = VecInit((0 until N).map(i => !entryValid(i)))
  val enqIdx   = PriorityEncoder(freeMask)
  val hasFree  = freeMask.asUInt.orR
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
  //  反馈信号
  // ================================================================
  io.freeEntries := PopCount(freeMask)
}