package nscscc.frontend

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.mmu.MmuTransError

class IBF(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 来自预译码的输入
    val in = Flipped(Decoupled(new PredecodeResp))
    // 输出到后端
    val out = Vec(CtrlBlockWidth, Decoupled(new CtrlFlowIO))
    // 控制信号
    val flush = Input(Bool())  // 后端redirect时清空(延迟一拍)
  })
  
  // ==================== 环形缓冲区 ====================
  val entries   = RegInit(VecInit(Seq.fill(ibufDepth)(0.U.asTypeOf(new CtrlFlowIO))))
  val valids    = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))

  val head      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 写指针(入队端)
  val tail      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 读指针(出队端)
  val count     = RegInit(0.U((log2Ceil(ibufDepth) + 1).W)) // 缓冲区中有效指令数
  
  val full  = count >= (ibufDepth - fetchWidth).U  // 没有足够空间容纳一次fetchWidth的入队
  val empty = count === 0.U
  
  // ==================== 入队逻辑 ====================
  val canEnqueue = !full
  io.in.ready := canEnqueue
  
  val enqueueCount = Wire(UInt(log2Ceil(fetchWidth+1).W))
  enqueueCount := 0.U
  
  when(io.in.fire && !io.flush) {
    val in = io.in.bits
    
    for (i <- 0 until fetchWidth) {
      val idx = (head + i.U) % ibufDepth.U
      when(in.enqMask(i)) {
        entries(idx).instr      := in.instrs(i)
        entries(idx).pc         := in.pcs(i)
        entries(idx).pdInfo     := in.pdInfo(i)
        entries(idx).exception  := in.mmu_error
        valids(idx) := true.B
      }
    }
    
    enqueueCount := PopCount(in.enqMask)
  }
  
  // ==================== 出队逻辑 ====================
  // 计算每个输出端口对应的缓冲区索引
  val tailIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(ibufDepth).W)))
  for (i <- 0 until CtrlBlockWidth) {
    tailIndices(i) := (tail + i.U) % ibufDepth.U
  }
  
  // 计算从tail开始的连续有效指令
  val hasValidInst = Wire(Vec(CtrlBlockWidth, Bool()))
  for (i <- 0 until CtrlBlockWidth) {
    hasValidInst(i) := (i.U < count) && valids(tailIndices(i))
  }
  
  // 计算基本分配条件：有有效指令、端口就绪、无刷新
  val baseAllocCond = Wire(Vec(CtrlBlockWidth, Bool()))
  for (i <- 0 until CtrlBlockWidth) {
    baseAllocCond(i) := hasValidInst(i) && io.out(i).ready && !io.flush
  }
  
  // 优先级分配：从端口0开始顺序分配
  val allocateMask = Wire(Vec(CtrlBlockWidth, Bool()))
  
  // 第一个端口的分配条件
  allocateMask(0) := baseAllocCond(0)
  
  // 后续端口的分配条件：当前端口满足基本条件，且前面所有端口都不能分配
  for (i <- 1 until CtrlBlockWidth) {
    val previousCannotAlloc = (0 until i).map(j => !baseAllocCond(j)).reduce(_ && _)
    allocateMask(i) := baseAllocCond(i) && previousCannotAlloc
  }
  
  // 计算分配的指令数量
  val allocatedCount = PopCount(allocateMask)
  
  // 设置输出
  for (i <- 0 until CtrlBlockWidth) {
    val idx = tailIndices(i)
    
    when(allocateMask(i)) {
      io.out(i).valid := true.B
      io.out(i).bits.instr  := entries(idx).instr
      io.out(i).bits.pc     := entries(idx).pc
      io.out(i).bits.pdInfo := entries(idx).pdInfo
      io.out(i).bits.exception := entries(idx).exception
    }.otherwise {
      io.out(i).valid := false.B
      io.out(i).bits := DontCare
    }
  }
  
  val issuedCount = PopCount(io.out.map(_.fire))
  
  // ==================== 同时入队和出队的更新逻辑 ====================
  // 使用临时变量计算更新后的值
  val nextHead = Wire(UInt(log2Ceil(ibufDepth).W))
  val nextTail = Wire(UInt(log2Ceil(ibufDepth).W))
  val nextCount = Wire(UInt((log2Ceil(ibufDepth) + 1).W))
  
  // 初始化
  nextHead := head
  nextTail := tail
  nextCount := count
  
  // 入队更新
  when(io.in.fire && !io.flush) {
    nextHead := (head + enqueueCount) % ibufDepth.U
  }
  
  // 出队更新
  // 使用独立的逻辑清除已出队的指令，避免作用域逃逸
  val clearValidMask = Wire(Vec(ibufDepth, Bool()))
  for (i <- 0 until ibufDepth) {
    clearValidMask(i) := false.B
  }
  
  when(issuedCount > 0.U && !io.flush) {
    // 清除已出队的指令有效位
    for (i <- 0 until CtrlBlockWidth) {
      when(i.U < issuedCount) {
        val idx = (tail + i.U) % ibufDepth.U
        clearValidMask(idx) := true.B
      }
    }
    
    nextTail := (tail + issuedCount) % ibufDepth.U
  }
  
  // 应用清除掩码
  for (i <- 0 until ibufDepth) {
    when(clearValidMask(i)) {
      valids(i) := false.B
    }
  }
  
  // 更新计数器：count = count + 入队数 - 出队数
  val countChange = Mux(io.in.fire && !io.flush, enqueueCount, 0.U) - 
                    Mux(issuedCount > 0.U && !io.flush, issuedCount, 0.U)
  nextCount := count + countChange
  
  // 在时钟上升沿更新所有状态
  when(!io.flush) {
    head := nextHead
    tail := nextTail
    count := nextCount
  }
  
  // ==================== 刷新逻辑 ====================
  val flushReg = RegNext(io.flush, false.B)
  when(flushReg) {
    for (i <- 0 until ibufDepth) {
      valids(i) := false.B
    }
    head  := 0.U
    tail  := 0.U
    count := 0.U
  }
  
  // ==================== 调试信息 ====================
  when(io.in.fire) {
    printf(p"[IBF] Enqueue: ${enqueueCount} instrs, new head=${nextHead}, new count=${nextCount}\n")
  }
  
  when(issuedCount > 0.U) {
    printf(p"[IBF] Dequeue: ${issuedCount} instrs, new tail=${nextTail}, new count=${nextCount}\n")
  }
  
  when(io.in.fire && issuedCount > 0.U) {
    printf(p"[IBF] Simultaneous enqueue(${enqueueCount}) and dequeue(${issuedCount})\n")
  }
  
  // 缓冲区状态监控
  printf(p"[IBF Status] head=$head, tail=$tail, count=$count, full=$full, empty=$empty\n")
  

  
  // 确保入队和出队不会冲突
  when(io.in.fire && issuedCount > 0.U) {
    // 如果同时入队和出队，检查是否会导致head和tail交叉
    val newHead = (head + enqueueCount) % ibufDepth.U
    val newTail = (tail + issuedCount) % ibufDepth.U
    val willBeFull = (newHead === newTail && (enqueueCount > 0.U || issuedCount > 0.U))
  }
  
}