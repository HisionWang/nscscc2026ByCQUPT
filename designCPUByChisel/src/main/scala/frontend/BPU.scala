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
    val predictFire  = Input(Bool())   

    // BPU更新接口
    val update_pd    = Input(new BpuUpdateReq)   
    val update_br    = Input(new BpuUpdateReq)   

    // RAS接口 (已弃用，保留以防止顶层连线报错)
    val rasRestore     = Input(Bool())
    val rasRestoreTop  = Input(UInt(log2Ceil(rasSize).W))
    val flush          = Input(Bool())
  })

  // ==================== 辅助计算 ====================
  // 块内字节数位宽，例如 fetchWidth=4 时，块大小为16字节，位宽为4
  val fetchBlockBitsValue = log2Ceil(fetchWidth) + 2

  val btbEntryWidth = 0.U.asTypeOf(new BTBEntry).getWidth
  val rnd = new Random()
  val randomBtbInit = Seq.fill(btbSize)(BigInt(btbEntryWidth, rnd))

  // ==================== 实例化双体 BRAM ====================
  // Bank0: 存储当前对齐块 (Block N) 的预测信息
  val btbMem0 = Module(new SimpleBlockRAM(depth = btbSize, width = btbEntryWidth, readLatency = 1
                                          //  ,initVals = Some(randomBtbInit)
                                          ))
  val phtMem0 = Module(new SimpleBlockRAM(depth = phtSize, width = 2, readLatency = 1))

  // Bank1: 存储下一个对齐块 (Block N+1) 的预测信息
  val btbMem1 = Module(new SimpleBlockRAM(depth = btbSize, width = btbEntryWidth, readLatency = 1
                                          // ,initVals = Some(randomBtbInit)
                                          ))
  val phtMem1 = Module(new SimpleBlockRAM(depth = phtSize, width = 2, readLatency = 1))

  // ==================== 读请求逻辑 (提前一拍使用 nextPC 索引) ====================
  val readBlockIdx = io.predictReq.nextPC(btbIndexBits + fetchBlockBitsValue - 1, fetchBlockBitsValue)

  // 4个BRAM共享同一个读使能和读地址
  btbMem0.io.rd_en   := io.predictReq.pc_fire
  btbMem0.io.rd_addr := readBlockIdx
  phtMem0.io.rd_en   := io.predictReq.pc_fire
  phtMem0.io.rd_addr := readBlockIdx

  btbMem1.io.rd_en   := io.predictReq.pc_fire
  btbMem1.io.rd_addr := readBlockIdx
  phtMem1.io.rd_en   := io.predictReq.pc_fire
  phtMem1.io.rd_addr := readBlockIdx

  // ==================== 预测命中与优先级逻辑 (当前周期使用 pc 校验) ====================
  val fetchOffset = io.predictReq.pc(fetchBlockBitsValue - 1, 2)
  
  // 计算当前块和下一个块的 Tag
  val tag0 = io.predictReq.pc(31, btbIndexBits + fetchBlockBitsValue)
  // 获取下一个块的起始地址，用于提取 Tag1
  val nextBlockBase = Cat(io.predictReq.pc(31, fetchBlockBitsValue) + 1.U, 0.U(fetchBlockBitsValue.W))
  val tag1 = nextBlockBase(31, btbIndexBits + fetchBlockBitsValue)

  // 解析 Bank0 (当前块) 数据
  val btbEntry0  = btbMem0.io.rd_data.asTypeOf(new BTBEntry)
  val phtCounter0= phtMem0.io.rd_data
  val phtTaken0  = phtCounter0(1)
  // 命中条件0：Entry有效，Tag匹配，且分支位于取指起始偏移之后 (或刚好对齐)
  val btbHit0    = btbEntry0.valid && (btbEntry0.tag === tag0) && (btbEntry0.offset >= fetchOffset)
  val predTaken0 = btbHit0 && (btbEntry0.isJalr || btbEntry0.isJal || phtTaken0)

  // 解析 Bank1 (下一块) 数据
  val btbEntry1  = btbMem1.io.rd_data.asTypeOf(new BTBEntry)
  val phtCounter1= phtMem1.io.rd_data
  val phtTaken1  = phtCounter1(1)
  // 命中条件1：Entry有效，Tag匹配，且分支位于下一块的开头，且在当前 fetchWidth 覆盖范围内
  val btbHit1    = btbEntry1.valid && (btbEntry1.tag === tag1) && (btbEntry1.offset < fetchOffset)
  val predTaken1 = btbHit1 && (btbEntry1.isJalr || btbEntry1.isJal || phtTaken1)

  // ==================== 仲裁与输出生成 ====================
  // 优先级：Bank0 (靠前) > Bank1 (靠后)
  val finalTaken  = predTaken0 || predTaken1
  val finalTarget = Mux(predTaken0, btbEntry0.target, btbEntry1.target)

  // 关键：计算相对当前取指 PC 的相对 takenOffset，供 Predecoder 使用
  // 如果命中 Bank0，偏移量就是：原本在块内的偏移 - 取指起始偏移
  val offset0_out = btbEntry0.offset - fetchOffset
  // 如果命中 Bank1，偏移量就是：在下一块的偏移 + 取指块容量 - 取指起始偏移
  val offset1_out = btbEntry1.offset + fetchWidth.U - fetchOffset
  
  val finalOffset = Mux(predTaken0, offset0_out, offset1_out)

  io.predictResp.taken       := finalTaken
  io.predictResp.takenOffset := finalOffset
  io.predictResp.target      := finalTarget

  // 组装 Meta 信息（反馈给更新逻辑使用）
  io.predictResp.meta.btbHit     := btbHit0 || btbHit1
  io.predictResp.meta.btbIsJalr  := Mux(predTaken0, btbEntry0.isJalr, btbEntry1.isJalr)
  io.predictResp.meta.btbIsJal   := Mux(predTaken0, btbEntry0.isJal, btbEntry1.isJal)
  io.predictResp.meta.btbIsCall  := Mux(predTaken0, btbEntry0.isCall, btbEntry1.isCall)
  io.predictResp.meta.btbIsRet   := Mux(predTaken0, btbEntry0.isRet, btbEntry1.isRet)
  io.predictResp.meta.btbOffset  := Mux(predTaken0, btbEntry0.offset, btbEntry1.offset) // 真实块内offset
  io.predictResp.meta.phtCounter := Mux(predTaken0, phtCounter0, phtCounter1)
  io.predictResp.meta.rasTop     := 0.U 
  io.predictResp.meta.predTaken  := finalTaken
  io.predictResp.meta.predTarget := finalTarget

  // ==================== BPU 更新逻辑 (双写核心) ====================
  val doUpdate = io.update_br.valid || io.update_pd.valid
  val update   = Mux(io.update_br.valid, io.update_br, io.update_pd)

  // 默认关闭所有写使能
  btbMem0.io.wr_en := false.B; btbMem0.io.wr_addr := 0.U; btbMem0.io.wr_data := 0.U
  phtMem0.io.wr_en := false.B; phtMem0.io.wr_addr := 0.U; phtMem0.io.wr_data := 0.U
  btbMem1.io.wr_en := false.B; btbMem1.io.wr_addr := 0.U; btbMem1.io.wr_data := 0.U
  phtMem1.io.wr_en := false.B; phtMem1.io.wr_addr := 0.U; phtMem1.io.wr_data := 0.U

  when(doUpdate) {
    // 提取需要更新的目标块索引和 Tag
    val updateBlockIdx = update.pc(btbIndexBits + fetchBlockBitsValue - 1, fetchBlockBitsValue)
    val updateTag      = update.pc(31, btbIndexBits + fetchBlockBitsValue)

    // 新的 BTB 条目
    val newEntry = Wire(new BTBEntry)
    newEntry.valid  := true.B
    newEntry.tag    := updateTag
    newEntry.target := update.target
    newEntry.isJalr := update.isJalr
    newEntry.isJal  := update.isJal
    newEntry.isCall := update.isCall
    newEntry.isRet  := update.isRet
    newEntry.offset := update.offset 
    
    // 更新 PHT 计数器
    val oldCounter  = update.oldPhtCounter 
    val nextCounter = WireDefault(oldCounter)
    when(update.taken && oldCounter =/= 3.U) {
      nextCounter := oldCounter + 1.U
    }.elsewhen(!update.taken && oldCounter =/= 0.U) {
      nextCounter := oldCounter - 1.U
    }

    // --- 双发写入逻辑 ---
    // 1. 写入 Bank0: 地址就是当前目标块的索引
    btbMem0.io.wr_en   := true.B
    btbMem0.io.wr_addr := updateBlockIdx
    btbMem0.io.wr_data := newEntry.asUInt

    phtMem0.io.wr_en   := true.B
    phtMem0.io.wr_addr := updateBlockIdx
    phtMem0.io.wr_data := nextCounter

    // 2. 写入 Bank1: 地址是 目标块索引减 1 (自然溢出回卷是正常的)
    // 因为 Bank1 的索引 N 里面存的是 N+1 块的数据，所以要写 X 块的数据，就要写在索引 X-1 处
    val updateBlockIdx_minus_1 = updateBlockIdx - 1.U

    btbMem1.io.wr_en   := true.B
    btbMem1.io.wr_addr := updateBlockIdx_minus_1
    btbMem1.io.wr_data := newEntry.asUInt

    phtMem1.io.wr_en   := true.B
    phtMem1.io.wr_addr := updateBlockIdx_minus_1
    phtMem1.io.wr_data := nextCounter
  }
}

