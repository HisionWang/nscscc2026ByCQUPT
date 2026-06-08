package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
 
class BPU1(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 预测接口
    val predictReq   = Input(new BpuPredictReq)
    val predictResp  = Output(new BpuPredictResp)
    val predictFire  = Input(Bool())   // 预测结果被实际使用(请求成功发射到ICache)
 
    // BPU更新接口
    val update_pd    = Input(new BpuUpdateReq)   // 预译码快速反馈
    val update_br    = Input(new BpuUpdateReq)   // 后端精确反馈
 
    // RAS恢复(后端redirect时)
    val rasRestore     = Input(Bool())
    val rasRestoreTop  = Input(UInt(log2Ceil(rasSize).W))
 
    // flush
    val flush = Input(Bool())
  })
 
  // ==================== BTB ==================== check OK
  // 使用VecInit(RegInit(...))实现组合读
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
 
  // BTB索引与标签
  val btbIdx = io.predictReq.pc(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
  val btbTag = io.predictReq.pc(31, btbIndexBits + fetchBlockBits)
 
  // BTB组合读
  val btbEntry = btbMem(btbIdx)
  val btbHit   = btbEntry.valid && btbEntry.tag === btbTag
 
  // ==================== PHT ====================
  val phtMem = RegInit(VecInit(Seq.fill(phtSize)(0.U(2.W))))
 
  val phtIdx     = io.predictReq.pc(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
  val phtCounter = phtMem(phtIdx)
  val phtTaken   = phtCounter(1)   // 最高位为1则预测跳
 
  // ==================== RAS ====================
  val rasStack = Mem(rasSize, UInt(32.W))
  val rasTop   = RegInit(0.U(log2Ceil(rasSize).W))
 
  // RAS恢复(后端redirect)
  when(io.rasRestore) {
    rasTop := io.rasRestoreTop
  }
 
  // ==================== 预测逻辑 ====================
  val btbTarget = btbEntry.target
  val btbIsJalr = btbEntry.isJalr
  val btbIsJal  = btbEntry.isJal
  val btbIsCall = btbEntry.isCall
  val btbIsRet  = btbEntry.isRet
  val btbOffset = btbEntry.offset
 
  // 最终预测:
  // - BTB未命中: 不跳
  // - BTB命中且是JALR: 必跳, 目标问RAS
  // - BTB命中且是JAL: 必跳, 目标问BTB
  // - BTB命中且非JALR/JAL: 条件分支, 看PHT
  val finalTaken  = btbHit && (btbIsJalr || btbIsJal || phtTaken)
  val rasTarget   = Mux(rasTop === 0.U, 0.U, rasStack(rasTop - 1.U))
  val finalTarget = Mux(btbIsJalr, rasTarget, btbTarget)
 
  // 输出预测结果
  io.predictResp.taken       := finalTaken
  io.predictResp.target      := Mux(btbHit, finalTarget, 0.U)
  io.predictResp.takenOffset := Mux(btbHit, btbOffset, 0.U)
 
  // 元信息
  io.predictResp.meta.btbHit     := btbHit
  io.predictResp.meta.btbIsJalr  := btbIsJalr
  io.predictResp.meta.btbIsJal   := btbIsJal
  io.predictResp.meta.btbIsCall  := btbIsCall
  io.predictResp.meta.btbIsRet   := btbIsRet
  io.predictResp.meta.btbOffset  := btbOffset
  io.predictResp.meta.phtCounter := phtCounter
  io.predictResp.meta.rasTop     := rasTop
  io.predictResp.meta.predTaken  := finalTaken
  io.predictResp.meta.predTarget := Mux(btbHit, finalTarget, 0.U)

 
  // ==================== BPU 更新逻辑 ====================
  // 后端更新优先级高于预译码更新
  val doUpdate = io.update_br.valid || io.update_pd.valid
  val update   = Mux(io.update_br.valid, io.update_br, io.update_pd)
 
  when(doUpdate) {
    val updateIdx = update.pc(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val updateTag = update.pc(31, btbIndexBits + fetchBlockBits)
    val updateOffset = update.pc(fetchBlockBits - 1, 2)  // 块内偏移
 
    // 更新BTB
    val newEntry = Wire(new BTBEntry)
    newEntry.valid  := true.B
    newEntry.tag    := updateTag
    newEntry.target := update.target
    newEntry.isJalr := update.isJalr
    newEntry.isJal  := update.isJal
    newEntry.isCall := update.isCall
    newEntry.isRet  := update.isRet
    newEntry.offset := updateOffset
    btbMem(updateIdx) := newEntry
 
    // 更新PHT
    val updatePhtIdx = update.pc(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val oldCounter   = phtMem(updatePhtIdx)
    when(update.taken && oldCounter =/= 3.U) {
      phtMem(updatePhtIdx) := oldCounter + 1.U
    }.elsewhen(!update.taken && oldCounter =/= 0.U) {
      phtMem(updatePhtIdx) := oldCounter - 1.U
    }
 
    // 后端更新时同步RAS
    when(io.update_br.valid) {
      when(update.isCall) {
        rasStack(rasTop) := update.pc + 4.U
        val nextTop = Mux(rasTop === (rasSize - 1).U, 0.U, rasTop + 1.U)
        rasTop := nextTop
      }
      when(update.isRet) {
        val nextTop = Mux(rasTop === 0.U, (rasSize - 1).U, rasTop - 1.U)
        rasTop := nextTop
      }
    }
  }

  // ==================== RAS 推测更新 ====================
  // 仅当预测结果被实际使用时才更新RAS
  when(io.predictFire && btbHit) {
    when(btbIsCall) {
      // 函数调用: 压栈返回地址
      // 返回地址 = 取指PC + (call偏移 + 1) * 4
      val returnAddr = io.predictReq.pc + (btbOffset + 1.U) * 4.U
      rasStack(rasTop) := returnAddr
      val nextTop = Mux(rasTop === (rasSize - 1).U, 0.U, rasTop + 1.U)
      rasTop := nextTop
    }
    when(btbIsRet) {
      // 函数返回: 弹栈
      val nextTop = Mux(rasTop === 0.U, (rasSize - 1).U, rasTop - 1.U)
      rasTop := nextTop
    }
  }
 
  // flush时不做预测状态清除(BTB/PHT的记忆有价值), 但RAS通过restore机制恢复
  // flush信号主要用于通知BPU当前流水线正在被冲洗
}