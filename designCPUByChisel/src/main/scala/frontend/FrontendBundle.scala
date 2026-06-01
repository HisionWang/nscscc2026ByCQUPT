package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle

class RedirectIO(implicit p: Parameters) extends NSBundle {
  val target = Output(UInt(32.W))
  val rtype = Output(UInt(1.W)) // 1: branch mispredict: only need to flush frontend  0: others: flush the whole pipeline
  val valid = Output(Bool())
}

class CtrlFlowIO(implicit p: Parameters) extends NSBundle {
  val instr = Output(UInt(64.W))
  val pc = Output(UInt(32.W))
  val pnpc = Output(UInt(32.W))
  val redirect = new RedirectIO
  val exceptionVec = Output(Vec(16, Bool()))
  val intrVec = Output(Vec(12, Bool()))
  val brIdx = Output(UInt(4.W))
  val isRVC = Output(Bool())
  val crossPageIPFFix = Output(Bool())
  val runahead_checkpoint_id = Output(UInt(64.W))
  val isBranch = Output(Bool())
}
// ==================== LoongArch32 操作码 ====================
object LoongArch32Opcodes {
  val OPC_B    = "b010100".U(6.W)   // 无条件跳转 b
  val OPC_BL   = "b010101".U(6.W)   // 函数调用 bl
  val OPC_JIRL = "b010011".U(6.W)   // 间接跳转 jirl
  val OPC_BEQ  = "b010110".U(6.W)   // 条件分支
  val OPC_BNE  = "b010111".U(6.W)
  val OPC_BLT  = "b011000".U(6.W)
  val OPC_BGE  = "b011001".U(6.W)
  val OPC_BLTU = "b011010".U(6.W)
  val OPC_BGEU = "b011011".U(6.W)
 
  def isBranchOpcode(op: UInt): Bool =
    op === OPC_BEQ || op === OPC_BNE || op === OPC_BLT ||
    op === OPC_BGE || op === OPC_BLTU || op === OPC_BGEU
}
 
// ==================== BTB 表项 ====================
class BTBEntry(implicit p: Parameters) extends NSBundle {
  val valid  = Bool()
  val tag    = UInt(btbTagBits.W)
  val target = UInt(32.W)
  val isJalr = Bool()   // 间接跳转 (jirl)
  val isJal  = Bool()   // 无条件直接跳转 (b/bl)
  val isCall = Bool()   // 函数调用 (bl / jirl r1,...)
  val isRet  = Bool()   // 函数返回 (jirl r0, r1, 0)
  val offset = UInt(log2Ceil(fetchWidth).W)  // 分支在fetch块内的指令偏移
}
 
// ==================== BPU 元信息 ====================
class BpuMeta(implicit p: Parameters) extends NSBundle {
  val btbHit      = Bool()
  val btbIsJalr   = Bool()
  val btbIsJal    = Bool()
  val btbIsCall   = Bool()
  val btbIsRet    = Bool()
  val btbOffset   = UInt(log2Ceil(fetchWidth).W)
  val phtCounter  = UInt(2.W)
  val rasTop      = UInt(log2Ceil(rasSize).W)
  val predTaken   = Bool()
  val predTarget  = UInt(32.W)
}
 
// ==================== BPU 预测请求/响应 ====================
class BpuPredictReq(implicit p: Parameters) extends NSBundle {
  val pc = UInt(32.W)
}
 
class BpuPredictResp(implicit p: Parameters) extends NSBundle {
  val taken       = Bool()
  val target      = UInt(32.W)
  val takenOffset = UInt(log2Ceil(fetchWidth).W)
  val meta        = new BpuMeta
}
 
// ==================== BPU 更新请求 ====================
class BpuUpdateReq(implicit p: Parameters) extends NSBundle {
  val valid    = Bool()
  val pc       = UInt(32.W)
  val taken    = Bool()       // 实际是否跳转
  val target   = UInt(32.W)   // 实际跳转目标
  val isJalr   = Bool()
  val isJal    = Bool()
  val isCall   = Bool()
  val isRet    = Bool()
  val offset   = UInt(log2Ceil(fetchWidth).W)  // 分支在块内偏移
  val rasTop   = UInt(log2Ceil(rasSize).W)     // RAS恢复指针(后端redirect用)
}
 
// ==================== 预测信息流水线 Bundle ====================
class PredInfoBundle(implicit p: Parameters) extends NSBundle {
  val pc          = UInt(32.W)
  val fallThrough = UInt(32.W)
  val taken       = Bool()
  val target      = UInt(32.W)
  val takenOffset = UInt(log2Ceil(fetchWidth).W)
  val meta        = new BpuMeta
}
 
// ==================== 前端重定向 ====================
class FrontendRedirect(implicit p: Parameters) extends NSBundle {
  val valid  = Bool()
  val target = UInt(32.W)
}
 
// ==================== 预译码信息 ====================
class PredecodeInfo(implicit p: Parameters) extends NSBundle {
  val valid      = Bool()
  val isBr       = Bool()     // 条件分支 (beq/bne/blt/bge/bltu/bgeu)
  val isJal      = Bool()     // 无条件直接跳转 (b/bl)
  val isJalr     = Bool()     // 间接跳转 (jirl)
  val isCall     = Bool()     // 函数调用
  val isRet      = Bool()     // 函数返回
  val jumpTarget = UInt(32.W) // 跳转目标(直接跳转可计算, jirl为0)
}
 
// ==================== 预译码输出 ====================
class PredecodeResp(implicit p: Parameters) extends NSBundle {
  val instrs           = Vec(fetchWidth, UInt(32.W))
  val pcs              = Vec(fetchWidth, UInt(32.W))
  val instvalids           = Vec(fetchWidth, Bool())
  val pdInfo           = Vec(fetchWidth, new PredecodeInfo)
  val enqMask          = Vec(fetchWidth, Bool())     // 入队掩码(经预译码校验修正)
  val frontendRedirect = new FrontendRedirect
  val bpuUpdate        = new BpuUpdateReq            // BPU快速更新请求
  val miss             = Bool()
  val uncached         = Bool()
  val mmu_error        = Bool()
  val addr             = UInt(32.W)
}
 
// ==================== IBuffer 表项 ====================
class IBufEntry(implicit p: Parameters) extends NSBundle {
  val instr      = UInt(32.W)
  val pc         = UInt(32.W)
  val isBr       = Bool()
  val isJal      = Bool()
  val isJalr     = Bool()
  val isCall     = Bool()
  val isRet      = Bool()
  val exception  = Bool()
  val jumpTarget = UInt(32.W)
}
 
// ==================== 可刷新队列 ====================
class FlushableQueue[T <: Data](gen: T, entries: Int)(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val enq   = Flipped(DecoupledIO(gen))
    val deq   = DecoupledIO(gen)
    val flush = Input(Bool())
    val count = Output(UInt(log2Ceil(entries + 1).W))
  })
 
  val data   = RegInit(VecInit(Seq.fill(entries)(0.U.asTypeOf(gen))))
  val valids = RegInit(VecInit(Seq.fill(entries)(false.B)))
  val head   = RegInit(0.U(log2Ceil(entries).W))
  val tail   = RegInit(0.U(log2Ceil(entries).W))
  val count  = RegInit(0.U(log2Ceil(entries + 1).W))
 
  val full  = count === entries.U
  val empty = count === 0.U
 
  io.enq.ready := !full
  io.deq.valid := !empty
  io.deq.bits  := data(head)
  io.count     := count
 
  when(io.flush) {
    for (i <- 0 until entries) { valids(i) := false.B }
    head  := 0.U
    tail  := 0.U
    count := 0.U
  }.elsewhen(io.enq.fire && io.deq.fire) {
    // 同时入队和出队
    data(tail)  := io.enq.bits
    valids(tail) := true.B
    valids(head) := false.B
    head := Mux(head === (entries - 1).U, 0.U, head + 1.U)
    tail := Mux(tail === (entries - 1).U, 0.U, tail + 1.U)
  }.elsewhen(io.enq.fire) {
    data(tail)  := io.enq.bits
    valids(tail) := true.B
    tail := Mux(tail === (entries - 1).U, 0.U, tail + 1.U)
    count := count + 1.U
  }.elsewhen(io.deq.fire) {
    valids(head) := false.B
    head := Mux(head === (entries - 1).U, 0.U, head + 1.U)
    count := count - 1.U
  }
}