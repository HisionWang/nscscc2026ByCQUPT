package nscscc.frontend

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.util.SimpleBlockRAM
import scala.util.Random
class BPU(implicit p: Parameters) extends NSModule {
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

  // ==================== BTB ==================== 
  val btbEntryWidth = 0.U.asTypeOf(new BTBEntry).getWidth

  val rnd = new Random()
  val randomBtbInit = Seq.fill(btbSize)(BigInt(btbEntryWidth, rnd))

  val btbMem = Module(new SimpleBlockRAM(
    depth = btbSize, 
    width = btbEntryWidth, 
    readLatency = 1,
    initVals = Some(randomBtbInit) 
    ))

  // BTB索引与标签
  val btbIdx = io.predictReq.nextPC(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
  val btbTag = io.predictReq.pc(31, btbIndexBits + fetchBlockBits)

  // 读请求
  btbMem.io.rd_en   := true.B
  btbMem.io.rd_addr := btbIdx

  // 读取并解包数据
  val btbEntry = btbMem.io.rd_data.asTypeOf(new BTBEntry)
  val btbHit   = btbEntry.valid && btbEntry.tag === btbTag

  val btbEntrydebug = btbEntry.asUInt
  dontTouch(btbEntrydebug)

  // ==================== PHT ====================
  val PhtInit = Seq.fill(phtSize)(BigInt(0))
  val phtMem = Module(new SimpleBlockRAM(
    depth = phtSize,
    width = 2, 
    readLatency = 1
    ))

  val phtIdx = io.predictReq.nextPC(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
  
  // 读请求
  phtMem.io.rd_en   := true.B
  phtMem.io.rd_addr := phtIdx

  val phtCounter = phtMem.io.rd_data
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

  // 最终预测
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
  val doUpdate = io.update_br.valid || io.update_pd.valid
  val update   = Mux(io.update_br.valid, io.update_br, io.update_pd)

  // 默认关闭写使能
  btbMem.io.wr_en   := false.B
  btbMem.io.wr_addr := 0.U
  btbMem.io.wr_data := 0.U

  phtMem.io.wr_en   := false.B
  phtMem.io.wr_addr := 0.U
  phtMem.io.wr_data := 0.U

  when(doUpdate) {
    val updateIdx    = update.pc(btbIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val updateTag    = update.pc(31, btbIndexBits + fetchBlockBits)
    val updateOffset = update.pc(fetchBlockBits - 1, 2)  

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
    
    btbMem.io.wr_en   := true.B
    btbMem.io.wr_addr := updateIdx
    btbMem.io.wr_data := newEntry.asUInt

    // 更新PHT (不再读取自身，完全依赖后端 update 请求中传回的计数值)
    // 注意：假设 BpuUpdateReq 中已存在 oldPhtCounter 字段，这里直接使用
    val updatePhtIdx = update.pc(phtIndexBits + fetchBlockBits - 1, fetchBlockBits)
    val oldCounter   = update.oldPhtCounter 
    
    val nextCounter = WireDefault(oldCounter)
    when(update.taken && oldCounter =/= 3.U) {
      nextCounter := oldCounter + 1.U
    }.elsewhen(!update.taken && oldCounter =/= 0.U) {
      nextCounter := oldCounter - 1.U
    }

    phtMem.io.wr_en   := true.B
    phtMem.io.wr_addr := updatePhtIdx
    phtMem.io.wr_data := nextCounter

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
  when(io.predictFire && btbHit) {
    when(btbIsCall) {
      val returnAddr = io.predictReq.pc + (btbOffset + 1.U) * 4.U
      rasStack(rasTop) := returnAddr
      val nextTop = Mux(rasTop === (rasSize - 1).U, 0.U, rasTop + 1.U)
      rasTop := nextTop
    }
    when(btbIsRet) {
      val nextTop = Mux(rasTop === 0.U, (rasSize - 1).U, rasTop - 1.U)
      rasTop := nextTop
    }
  }
}