package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config.NSModule
import nscscc.util.CircularQueue  // 导入新写的环形队列模块

class FTQ(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ---- 输出给 IFU ----
    val toIfu       = DecoupledIO(new FtqEntry)
 
    // ---- 后端重定向 & 冲刷 ----
    val redirect    = Flipped(new RedirectIO)
    val flush       = Input(Bool())
 
    // ---- BPU 更新接口（透传） ----
    val update_pd     = Input(new BpuUpdateReq)
    val update_br     = Input(new BpuUpdateReq)
    val rasRestore      = Input(Bool())
    val rasRestoreTop   = Input(UInt(log2Ceil(rasSize).W))
 
    // ---- 启动 ----
    val start_pc    = Input(UInt(32.W))
    val start_valid = Input(Bool())
  })
 
  // =====================================================================
  // 实例化 BPU
  // =====================================================================
  val bpu = Module(new BPU)
 
  // =====================================================================
  // 实例化 CircularQueue
  // =====================================================================
  val queue = Module(new CircularQueue(
    gen      = new FtqEntry,
    entries  = FtqSize,
    enqWidth = 1,
    deqWidth = 1
  ))
 
  // =====================================================================
  // s0_pc：整个前端的 PC 源头
  // =====================================================================
  //
  // 这个寄存器决定了 BPU S0 每一拍读哪个 PC 的 BTB/PHT。
  // 它的变化规则是整个设计的核心：
  //
  //   优先级：redirect > 正常推进
  //   正常推进：
  //     S1 说 taken  → s0_pc = s1_target（跳到预测目标）
  //     S1 说 !taken → s0_pc = s0_pc + 16（投机顺序，下一拍 S0 读的就是这个）
  //     stall        → s0_pc 不变
  //
  val s0_pc = RegInit(0x1C000000.U(32.W))
 
  // 喂 PC 给 BPU S0
  bpu.io.s0_pc := s0_pc
 
  // =====================================================================
  // S1 预测结果
  // =====================================================================
  val s1_valid      = bpu.io.s1_valid
  val s1_pc         = bpu.io.s1_pc
  val s1_taken      = bpu.io.s1_taken
  val s1_target     = bpu.io.s1_target
  val s1_fallThru   = s1_pc + (fetchWidth * 4).U
  val s1_nextPc     = Mux(s1_taken, s1_target, s1_fallThru)
 
  // =====================================================================
  // s1_kill：下一拍的 S1 是否应该被丢弃
  // =====================================================================
  //
  // 为什么需要 kill？
  //
  //   周期N: s0_pc=X (投机顺序), S0读BTB[X]
  //   周期N: S1说上一个PC是taken→s0_pc跳到target
  //   周期N+1: S1处理BTB[X]的结果 → 但X是错的PC！必须丢弃
  //   周期N+2: S1处理BTB[target]的结果 → 正确
  //
  // taken 分支的代价：1拍 S1 气泡。但 FTQ 里有存量，IFU 感受不到。
  //
  val s1_kill = RegInit(false.B)
 
  // =====================================================================
  // 入队控制
  // =====================================================================
  val bpuCanWrite = queue.io.count < BpRunAheadDistance.U
  val doEnqueue   = s1_valid && !s1_kill && bpuCanWrite
 
  queue.io.enq(0).valid := doEnqueue
  queue.io.enq(0).bits.startPc     := s1_pc
  queue.io.enq(0).bits.nextPc      := s1_nextPc
  queue.io.enq(0).bits.taken       := s1_taken
  queue.io.enq(0).bits.fallThru    := s1_fallThru
  queue.io.enq(0).bits.takenOffset := bpu.io.s1_takenOffset
  queue.io.enq(0).bits.meta        := bpu.io.s1_meta
 
  // =====================================================================
  // 流水线控制
  // =====================================================================
  //
  // stall：S1 有有效预测，但队列入不了（超距限制）
  // s0_fire：BPU S0→S1 锁存使能，stall/redirect/flush 时为 false
  //
  val stall   = s1_valid && !s1_kill && !bpuCanWrite
  val s0_fire = !stall && !io.redirect.valid && !io.flush
 
  bpu.io.s0_fire   := s0_fire
  bpu.io.s1_fire   := doEnqueue    // 预测被消费 → RAS 推测更新
  bpu.io.s1_flush  := io.redirect.valid || io.flush
 
  // =====================================================================
  // s0_pc 推进逻辑（核心中的核心）
  // =====================================================================
  //
  // 关键理解：s0_pc 总是比 s1_pc 超前 1 个取指块
  //
  //   s0_pc 在周期N的值，是"投机顺序"的值（假设上一拍 S1 不跳转）
  //   S1 在周期N出结果后，如果 taken，则纠正 s0_pc
  //   纠正的代价：下一拍的 S1 被 kill（因为 S0 读的是错误的投机PC）
  //
  // 这就是"跑在前"的精髓：
  //   - 不跳转时（绝大多数情况）：投机正确，零气泡
  //   - 跳转时：1拍 S1 气泡，但 FTQ 存量吸收
  //
  val s0_seqPc = s0_pc + (fetchWidth * 4).U
 
  when(io.redirect.valid) {
    // 后端重定向：最高优先级
    s0_pc   := io.redirect.target
    s1_kill := true.B
 
  }.elsewhen(io.start_valid) {
    // 启动
    s0_pc   := io.start_pc
    s1_kill := true.B
 
  }.elsewhen(stall) {
    // 队列满了，S1 预测没被消费：全部冻住
    // s0_pc 不变，s1_kill 不变
 
  }.otherwise {
    // 正常推进
    // taken → 跳到 target（s0_pc 被纠正，下一拍 S1 kill）
    // !taken → 继续投机顺序
    s0_pc   := Mux(s1_valid && !s1_kill && s1_taken, s1_target, s0_seqPc)

    
    s1_kill := s1_valid && !s1_kill && s1_taken
  }
 
  // =====================================================================
  // 队列冲刷
  // =====================================================================
  queue.io.flush := io.redirect.valid || io.flush
 
  // =====================================================================
  // IFU 出队
  // =====================================================================
  io.toIfu <> queue.io.deq(0)
 
  // =====================================================================
  // BPU 更新接口透传
  // =====================================================================
  bpu.io.update_pd    <> io.update_pd
  bpu.io.update_br    <> io.update_br
  bpu.io.rasRestore   <> io.rasRestore
  bpu.io.rasRestoreTop <> io.rasRestoreTop
}