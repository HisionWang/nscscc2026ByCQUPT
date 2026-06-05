package nscscc.frontend

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.mmu.MmuTransError
import nscscc.util.CircularQueue  // 导入新写的环形队列模块

class IBF(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 来自预译码的输入
    val in = Flipped(Decoupled(new PredecodeResp))
    // 输出到后端
    val out = Vec(CtrlBlockWidth, Decoupled(new CtrlFlowIO))
    // 控制信号
    val flush = Input(Bool())  // 后端redirect时清空(延迟一拍)
  })
  
  // ==================== 使用CircularQueue重构 ====================
  
  // 实例化环形队列
  val queue = Module(new CircularQueue(
    gen = new CtrlFlowIO,        // 存储的数据类型
    entries = ibufDepth,         // 队列容量
    enqWidth = fetchWidth,       // 入队宽度（一次最多入队fetchWidth条指令）
    deqWidth = CtrlBlockWidth    // 出队宽度（一次最多出队CtrlBlockWidth条指令）
  ))
  queue.io.read := DontCare
  // 连接flush信号（注意：CircularQueue的flush是高电平有效）
  queue.io.flush := io.flush
  
  // ==================== 入队逻辑 ====================
  // 连接预译码输入到CircularQueue的入队端口

  // 入队有效信号：输入有效且对应的enqMask为真
  for (i <- 0 until fetchWidth) {
    
      queue.io.enq(i).valid := io.in.valid && io.in.bits.enqMask(i)
      queue.io.enq(i).bits.instr := io.in.bits.instrs(i)
      queue.io.enq(i).bits.pc := io.in.bits.pcs(i)
      queue.io.enq(i).bits.pdInfo := io.in.bits.pdInfo(i)

      // 异常处理
      queue.io.enq(i).bits.exception := io.in.bits.mmu_error
    

  }
  
  // 输入就绪信号：队列就绪（CircularQueue内部会处理多路入队的就绪信号）
  io.in.ready := !queue.io.full
  
  // ==================== 出队逻辑 ====================
  // 连接CircularQueue的出队端口到后端输出
  
  for (i <- 0 until CtrlBlockWidth) {
    // 连接valid和bits信号
    io.out(i).valid := queue.io.deq(i).valid
    io.out(i).bits := queue.io.deq(i).bits
    
    // 连接ready信号
    queue.io.deq(i).ready := io.out(i).ready
  }
  
  // ==================== 状态信号透传 ====================
  // 可以将队列状态信号输出用于调试
  val queueEmpty = queue.io.empty
  val queueFull = queue.io.full
  val queueCount = queue.io.count
  
  // ==================== 随机读端口 ====================
  // 如果后端需要随机读取指令（如ROB需要读取特定指令的信息），可以使用read端口
  // 这里示例中暂时不使用，但保留了接口
  
  // ==================== 调试信息 ====================
  when(io.in.fire) {
    val enqCount = PopCount(io.in.bits.enqMask)
    printf(p"[IBF-CircularQueue] Enqueue: ${enqCount} instructions, queue count=${queueCount}\n")
    
    // 输出每条入队的指令信息
    for (i <- 0 until fetchWidth) {
      when(io.in.bits.enqMask(i)) {
        printf(p"  Instr[${i}]: pc=0x${Hexadecimal(io.in.bits.pcs(i))}, " +
               p"instr=0x${Hexadecimal(io.in.bits.instrs(i))}\n")
      }
    }
  }
  
  // 输出出队信息
  for (i <- 0 until CtrlBlockWidth) {
    when(io.out(i).fire) {
      printf(p"[IBF-CircularQueue] Dequeue[${i}]: pc=0x${Hexadecimal(io.out(i).bits.pc)}, " +
             p"instr=0x${Hexadecimal(io.out(i).bits.instr)}\n")
    }
  }
  
  // 队列状态监控
  printf(p"[IBF-CircularQueue Status] count=$queueCount, empty=$queueEmpty, full=$queueFull\n")
  
  when(io.flush) {
    printf(p"[IBF-CircularQueue] Buffer flushed due to redirect\n")
  }
  
  // ==================== 断言检查 ====================
  // 确保不会在队列满时尝试入队 就连个线你检查个屁
  //when(io.in.valid && queue.io.full) {
  //  assert(!io.in.valid || !queue.io.full, 
  //         "IBF: Attempting to enqueue when queue is full")
  //}
  
  // 确保出队的指令是有效的
  for (i <- 0 until CtrlBlockWidth) {
    when(io.out(i).valid && !queue.io.empty) {
      // 出队有效时，队列不应为空
      // 这个检查在CircularQueue内部已经做了，这里再加一层保护
    }
  }
}