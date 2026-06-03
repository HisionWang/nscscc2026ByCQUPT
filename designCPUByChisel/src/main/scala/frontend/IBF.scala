package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
 
class IBF(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 来自预译码的输入
    val in = Flipped(Decoupled(new PredecodeResp))
    // 输出到后端
    val out = Vec(CtrlBlockWidth, Decoupled(new CtrlFlowIO))
    // 控制信号
    val flush = Input(Bool())  // 后端redirect时清空(延迟一拍)
    // 后端就绪
    val backendReady = Input(Vec(CtrlBlockWidth, Bool()))
  })
 
  io.out.foreach(_.bits := DontCare)
 
  // ==================== 环形缓冲区 ====================
  val entries   = RegInit(VecInit(Seq.fill(ibufDepth)(0.U.asTypeOf(new CtrlFlowIO))))
  val valids    = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))

  val head      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 写指针(入队端)
  val tail      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 读指针(出队端)
  val count     = RegInit(0.U((log2Ceil(ibufDepth) + 1).W)) //可能会满16个
 
  val full  = count > /*=*/ (ibufDepth - fetchWidth).U  // 留fetchWidth个空位
  val empty = count === 0.U
 
  // ==================== 入队逻辑 ====================
  io.in.ready := !full
 
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
    head  := (head + PopCount(in.enqMask)) % ibufDepth.U
    count := count + PopCount(in.enqMask)
  }
 
  // ==================== 出队逻辑 ====================
  val tailIndices = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(ibufDepth).W)))
  val canIssue    = Wire(Vec(CtrlBlockWidth, Bool()))
 
  for (i <- 0 until CtrlBlockWidth) {
    tailIndices(i) := (tail + i.U) % ibufDepth.U
    canIssue(i)    := (i.U < count) && valids(tailIndices(i))
  }
  val allReady = io.out.map(_.ready).reduce(_ && _)

  for (i <- 0 until CtrlBlockWidth) {

    when(allReady){
      val idx = tailIndices(i)

      io.out(i).valid           := canIssue(i)
      io.out(i).bits.instr      := entries(idx).instr
      io.out(i).bits.pc         := entries(idx).pc
      io.out(i).bits.pdInfo     := entries(idx).pdInfo
      // 异常向量：默认全0，根据来源填充对应位
      io.out(i).bits.exception.foreach(_ := false.B)
      //暂不关心异常
      //when(entries(idx).exception) {
      //  // MMU错误: 根据具体错误类型填PIL/PIS/PIF/PME
      //  // 目前简单处理，全部标记为PIL
      //  io.out(i).bits.exception(FetchExceptIdx.PIL) := true.B
      //}
      //// PC非对齐检测
      //when(entries(idx).pc(1, 0) =/= 0.U) {
      //  io.out(i).bits.exception(FetchExceptIdx.ADEF) := true.B
      //}

    }

  }

  // 更新读指针
  val issuedCount = PopCount(io.out.map(_.fire))
  when(issuedCount > 0.U && !io.flush) {
    for (i <- 0 until CtrlBlockWidth) {
      when(i.U < issuedCount) {
        valids(tailIndices(i)) := false.B
      }
    }
    tail  := (tail + issuedCount) % ibufDepth.U
    count := count - issuedCount
  }

 
  // ==================== 刷新逻辑 ====================
  // 后端redirect时清空(延迟一拍, 因为当拍可能还有有效数据在传输)
  val flushReg = RegNext(io.flush, false.B)
  when(flushReg) {
    for (i <- 0 until ibufDepth) {
      valids(i) := false.B
    }
    head  := 0.U
    tail  := 0.U
    count := 0.U
  }
}