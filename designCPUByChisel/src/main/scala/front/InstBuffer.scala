
import chisel3._
import Frontend._
import ICacheBunble._

import chisel3.util._
import chisel3.util.experimental.BoringUtils
import config._
import config.NSModule
import config.NSBundle

// 龙芯32位指令缓冲组件 - 支持可配置发射宽度
class IBF(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    // 来自Icache的输入
    val icacheResp = Flipped(Decoupled(new IcacheResp))
    
    // 输出到后端的接口，宽度可配置
    val out = Vec(issueWidth, Decoupled(new CtrlFlowIO))
    
    // 控制信号
    val flush = Input(Bool())
    
    // 后端就绪信号，与发射宽度相同
    val backendReady = Input(Vec(issueWidth, Bool()))
  })

  // 指令缓冲区 - 环形缓冲区设计
  val instBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(0.U(32.W))))
  val pcBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(0.U(32.W))))
  val validBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))
  val exceptionBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))
  val uncachedBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))
  val missBuffer = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))
  
  // 缓冲区指针
  val head = RegInit(0.U(log2Up(ibufDepth).W))  // 写指针
  val tail = RegInit(0.U(log2Up(ibufDepth).W))  // 读指针
  
  // 缓冲区状态
  val count = RegInit(0.U((log2Up(ibufDepth) + 1).W))  // 缓冲区中有效指令数量
  val availableSpace = ibufDepth.U - count
  
  val full = count === ibufDepth.U
  val empty = count === 0.U
  
  // 输入处理：从Icache接收数据
  val canAcceptInput = availableSpace >= fetchWidth.U && !io.flush
  io.icacheResp.ready := canAcceptInput
  
  // 写入缓冲区逻辑
  when(io.icacheResp.fire() && !io.flush) {
    val icache = io.icacheResp.bits
    val basePc = icache.addr
    
    // 计算实际要写入的指令数量
    val validInstCount = PopCount(icache.instvalids)
    
    // 写入指令到缓冲区
    for (i <- 0 until fetchWidth) {
      when(icache.instvalids(i) && (count + i.U) < ibufDepth.U) {
        val writeIdx = (head + i.U) % ibufDepth.U
        instBuffer(writeIdx) := icache.instrs(i)
        pcBuffer(writeIdx) := basePc + (i * 4).U
        validBuffer(writeIdx) := true.B
        exceptionBuffer(writeIdx) := icache.mmu_error
        uncachedBuffer(writeIdx) := icache.uncached
        missBuffer(writeIdx) := icache.miss
      }
    }
    
    // 更新指针和计数器
    head := (head + validInstCount) % ibufDepth.U
    count := count + validInstCount
    

  }
  
  // 输出处理：动态计算可发射的指令数量
  // 计算从尾指针开始的连续有效指令数
  val consecutiveValids = Wire(Vec(issueWidth, Bool()))
  val tailIndices = Wire(Vec(issueWidth, UInt(log2Up(ibufDepth).W)))
  
  for (i <- 0 until issueWidth) {
    tailIndices(i) := (tail + i.U) % ibufDepth.U
    // 检查从尾指针开始的第i条指令是否有效
    consecutiveValids(i) := (i.U < count) && validBuffer(tailIndices(i))
  }
  
  // 计算实际可发射的指令数，受到以下限制：
  // 1. 缓冲区中连续有效指令数
  // 2. 后端就绪的端口数
  // 3. 最大发射宽度限制
  val maxConsecutive = Wire(UInt(log2Up(issueWidth+1).W))
  maxConsecutive := 0.U
  
  // 找到最大连续有效数
  for (i <- 0 until issueWidth) {
    when(consecutiveValids(i)) {
      maxConsecutive := (i + 1).U
    }
  }
  
  // 计算后端就绪的端口数
  val backendReadyCount = PopCount(io.backendReady)
  
  // 实际发射数量取最小值
  val actualIssueCount = Mux(
    maxConsecutive < backendReadyCount,
    maxConsecutive,
    backendReadyCount
  )
  
  // 设置输出端口
  for (i <- 0 until issueWidth) {
    val idx = tailIndices(i)
    
    // 端口有效条件：i小于实际发射数
    io.out(i).valid := (i.U < actualIssueCount) && !io.flush
    
    // 设置指令数据
    io.out(i).bits.instr := instBuffer(idx)
    io.out(i).bits.pc := pcBuffer(idx)
    io.out(i).bits.pnpc := pcBuffer(idx) + 4.U
    io.out(i).bits.brIdx := false.B
    io.out(i).bits.isRVC := false.B
    io.out(i).bits.crossPageIPFFix := false.B
    
    // 异常处理
    io.out(i).bits.exceptionVec.map(_ := false.B)
    when(exceptionBuffer(idx)) {
      io.out(i).bits.exceptionVec(1) := true.B
    }

  }
  
  // 计算发射握手成功的数量
  val issuedCount = Wire(UInt(log2Up(issueWidth+1).W))
  issuedCount := 0.U
  
  // 计算实际发射的指令数（考虑握手成功）
  for (i <- 0 until issueWidth) {
    when(io.out(i).fire()) {
      issuedCount := issuedCount + 1.U
    }
  }
  
  // 更新读指针和计数器
  when(issuedCount > 0.U && !io.flush) {
    // 清除已发射的指令
    for (i <- 0 until issueWidth) {
      when(i.U < issuedCount) {
        val idx = (tail + i.U) % ibufDepth.U
        validBuffer(idx) := false.B
      }
    }
    
    // 更新尾指针
    tail := (tail + issuedCount) % ibufDepth.U
    count := count - issuedCount
    

  }
  
  // 刷新逻辑
  when(io.flush) {
    // 清空缓冲区
    for (i <- 0 until ibufDepth) {
      validBuffer(i) := false.B
    }
    head := 0.U
    tail := 0.U
    count := 0.U

  }
  
  // 性能计数器
  val enqueueCounter = RegInit(0.U(32.W))
  val dequeueCounter = RegInit(0.U(32.W))
  val issueWidthCounter = RegInit(VecInit(Seq.fill(issueWidth+1)(0.U(32.W))))
  
  when(io.icacheResp.fire()) {
    enqueueCounter := enqueueCounter + PopCount(io.icacheResp.bits.instvalids)
  }
  
  when(issuedCount > 0.U) {
    dequeueCounter := dequeueCounter + issuedCount
    
    // 统计不同发射宽度的次数
    for (i <- 0 to issueWidth) {
      when(issuedCount === i.U) {
        issueWidthCounter(i) := issueWidthCounter(i) + 1.U
      }
    }
  }
  
  // 输出统计信息
  printf(p"IBF Statistics: enqueue=${enqueueCounter}, dequeue=${dequeueCounter}\n")
  for (i <- 1 to issueWidth) {
    printf(p"  Issue width ${i}: ${issueWidthCounter(i)} cycles\n")
  }
  
  // 断言检查
  assert(count <= ibufDepth.U, "IBF buffer count overflow")
  assert(!(io.icacheResp.valid && !io.icacheResp.ready && !io.flush), 
    "IBF back pressure when not flushing")
}