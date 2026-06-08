package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
 
class BPU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // ---- S0: PC 输入（来自 FTQ 的 s0_pc 寄存器） ----
    val s0_pc      = Input(UInt(32.W))
    val s0_fire    = Input(Bool())     // FTQ 通知：本周期 S0→S1 锁存有效
 
    // ---- S1: 预测输出（1 周期延迟） ----
    val s1_valid      = Output(Bool())
    val s1_pc         = Output(UInt(32.W))
    val s1_taken      = Output(Bool())
    val s1_target     = Output(UInt(32.W))
    val s1_takenOffset = Output(UInt(log2Ceil(fetchWidth).W))
    val s1_meta       = Output(new BpuMeta)
 
    // ---- S1 消费确认（用于 RAS 推测更新） ----
    val s1_fire    = Input(Bool())
 
    // ---- BPU 更新接口 ----
    val update_pd  = Input(new BpuUpdateReq)
    val update_br  = Input(new BpuUpdateReq)
 
    // ---- RAS 恢复 ----
    val rasRestore    = Input(Bool())
    val rasRestoreTop = Input(UInt(log2Ceil(rasSize).W))
 
    // ---- 冲刷 S1（重定向时无效化） ----
    val s1_flush   = Input(Bool())
  })
 
  // =====================================================================
  // BTB 存储体
  // =====================================================================
  val btbDefault = Wire(new BTBEntry)
  btbDefault.valid  := false.B
  btbDefault.tag    := 0.U
  btbDefault.target := 0.U
  btbDefault.isJalr := false.B
  btbDefault.isJal  := false.B
  btbDefault.isCall := false.B
  btbDefault.isRet  := false.B
  btbDefault.offset := 0.U
 
  val btbMem = RegInit(VecInit(Seq.fill(btbSize)(btbDefault)))
 
  // =====================================================================
  // PHT 存储体
  // =====================================================================
  val phtMem = RegInit(VecInit(Seq.fill(phtSize)(0.U(2.W))))
 
  // =====================================================================
  // S0: 读 BTB + PHT（组合读，但结果被 RegEnable 锁存，切断关键路径）
  // =====================================================================
  //
  // S0 关键路径：s0_pc(reg) → btbIdx → btbMem MUX → RegEnable 入口
  //                                       ↑
  //                              这是最大的 MUX，但路径到此为止
  //
  val s0_btbIdx = io.s0_pc(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
  val s0_btbTag = io.s0_pc(31, btbIndexBits + fetchBlockBits)
  val s0_btbRead = btbMem(s0_btbIdx)        // 组合读
  val s0_btbHit  = s0_btbRead.valid && s0_btbRead.tag === s0_btbTag
 
  val s0_phtIdx  = io.s0_pc(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
  val s0_phtRead = phtMem(s0_phtIdx)        // 组合读
 
  // =====================================================================
  // S0 → S1 流水线寄存器
  // =====================================================================
  // 用 RegInit + when(s0_fire) 实现带使能的锁存
  // stall 时 s0_fire=false，S1 保持上一拍的数据
  //
  val s1_valid_reg    = RegInit(false.B)
  val s1_pc_reg       = RegInit(0.U(32.W))
  val s1_btbEntry_reg = RegInit(btbDefault)
  val s1_btbHit_reg   = RegInit(false.B)
  val s1_phtCounter_reg = RegInit(0.U(2.W))
 
  // s1_valid 管理：flush 清除，s0_fire 置位，stall 保持
  when(io.s1_flush) {
    s1_valid_reg := false.B
  }.elsewhen(io.s0_fire) {
    s1_valid_reg := true.B
  }
 
  // S0→S1 数据锁存
  when(io.s0_fire) {
    s1_pc_reg         := io.s0_pc
    s1_btbEntry_reg   := s0_btbRead
    s1_btbHit_reg     := s0_btbHit
    s1_phtCounter_reg := s0_phtRead
  }
  // s0_fire=false 时，以上寄存器保持原值（stall 或 redirect）
 
  io.s1_valid := s1_valid_reg
  io.s1_pc    := s1_pc_reg
 
  // =====================================================================
  // RAS（小结构，S1 中组合读即可）
  // =====================================================================
  val rasStack = RegInit(VecInit(Seq.fill(rasSize)(0.U(32.W))))
  val rasTop   = RegInit(0.U(log2Ceil(rasSize).W))
 
  when(io.rasRestore) {
    rasTop := io.rasRestoreTop
  }
 
  // =====================================================================
  // S1: 预测逻辑（所有输入来自流水线寄存器，关键路径短）
  // =====================================================================
  //
  // S1 关键路径：s1_btbHit(reg) → PHT判断 → RAS读 → target MUX → 输出
  //              不包含 BTB 存储体读！比原来的长路径短得多
  //
  val btbEntry = s1_btbEntry_reg
  val btbHit   = s1_btbHit_reg
  val phtCtr   = s1_phtCounter_reg
  val s1_pc    = s1_pc_reg
 
  val phtTaken   = phtCtr(1)
  val finalTaken = btbHit && (btbEntry.isJalr || btbEntry.isJal || phtTaken)
 
  // RAS 组合读（rasSize=16，MUX 很小，不在关键路径上）
  val rasTarget   = Mux(rasTop === 0.U, 0.U, rasStack(rasTop - 1.U))
  val btbTarget   = Mux(btbEntry.isJalr, rasTarget, btbEntry.target)
  val s1_fallThru = s1_pc + (fetchWidth * 4).U
 
  // 输出
  io.s1_taken       := finalTaken
  io.s1_target      := Mux(btbHit, btbTarget, s1_fallThru)
  io.s1_takenOffset := btbEntry.offset
 
  // 元信息
  io.s1_meta.btbHit     := btbHit
  io.s1_meta.btbIsJalr  := btbEntry.isJalr
  io.s1_meta.btbIsJal   := btbEntry.isJal
  io.s1_meta.btbIsCall  := btbEntry.isCall
  io.s1_meta.btbIsRet   := btbEntry.isRet
  io.s1_meta.btbOffset  := btbEntry.offset
  io.s1_meta.phtCounter := phtCtr
  io.s1_meta.rasTop     := rasTop
  io.s1_meta.predTaken  := finalTaken
  io.s1_meta.predTarget := Mux(btbHit, btbTarget, s1_fallThru)
 
  // =====================================================================
  // BPU 更新逻辑（与原版相同，写 BTB/PHT/RAS）
  // =====================================================================
  val doUpdate = io.update_br.valid || io.update_pd.valid
  val update   = Mux(io.update_br.valid, io.update_br, io.update_pd)
 
  when(doUpdate) {
    val uIdx = update.pc(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val uTag = update.pc(31, btbIndexBits + fetchBlockBits)
    val uOff = update.pc(fetchBlockBits - 1, 2)
 
    val newEntry = Wire(new BTBEntry)
    newEntry.valid  := true.B
    newEntry.tag    := uTag
    newEntry.target := update.target
    newEntry.isJalr := update.isJalr
    newEntry.isJal  := update.isJal
    newEntry.isCall := update.isCall
    newEntry.isRet  := update.isRet
    newEntry.offset := uOff
    btbMem(uIdx) := newEntry
 
    val uPhtIdx = update.pc(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val oldCtr  = phtMem(uPhtIdx)
    when(update.taken && oldCtr =/= 3.U) {
      phtMem(uPhtIdx) := oldCtr + 1.U
    }.elsewhen(!update.taken && oldCtr =/= 0.U) {
      phtMem(uPhtIdx) := oldCtr - 1.U
    }
 
    when(io.update_br.valid) {
      when(update.isCall) {
        rasStack(rasTop) := update.pc + 4.U
        rasTop := Mux(rasTop === (rasSize - 1).U, 0.U, rasTop + 1.U)
      }
      when(update.isRet) {
        rasTop := Mux(rasTop === 0.U, (rasSize - 1).U, rasTop - 1.U)
      }
    }
  }
 
  // =====================================================================
  // RAS 推测更新：仅在预测被 FTQ 消费时才改 RAS
  // =====================================================================
  when(io.s1_fire && btbHit) {
    when(btbEntry.isCall) {
      val retAddr = s1_pc + (btbEntry.offset + 1.U) * 4.U
      rasStack(rasTop) := retAddr
      rasTop := Mux(rasTop === (rasSize - 1).U, 0.U, rasTop + 1.U)
    }
    when(btbEntry.isRet) {
      rasTop := Mux(rasTop === 0.U, (rasSize - 1).U, rasTop - 1.U)
    }
  }
}