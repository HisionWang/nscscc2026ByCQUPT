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
    val out = Vec(issueWidth, Decoupled(new CtrlFlowIO))
    // 控制信号
    val flush = Input(Bool())  // 后端redirect时清空(延迟一拍)
    // 后端就绪
    val backendReady = Input(Vec(issueWidth, Bool()))
  })
 
  io.out.foreach(_.bits := DontCare)
 
  // ==================== 环形缓冲区 ====================
  val entries   = RegInit(VecInit(Seq.fill(ibufDepth)(0.U.asTypeOf(new IBufEntry))))
  val valids    = RegInit(VecInit(Seq.fill(ibufDepth)(false.B)))
  val head      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 写指针(入队端)
  val tail      = RegInit(0.U(log2Ceil(ibufDepth).W))  // 读指针(出队端)
  val count     = RegInit(0.U((log2Ceil(ibufDepth) + 1).W))
 
  val full  = count >= (ibufDepth - fetchWidth).U  // 留fetchWidth个空位
  val empty = count === 0.U
 
  // ==================== 入队逻辑 ====================
  io.in.ready := !full
 
  when(io.in.fire && !io.flush) {
    val resp = io.in.bits
    var writeOffset = 0.U(log2Ceil(ibufDepth).W)
 
    for (i <- 0 until fetchWidth) {
      val idx = (head + writeOffset) % ibufDepth.U
      when(resp.enqMask(i)) {
        entries(idx).instr      := resp.instrs(i)
        entries(idx).pc         := resp.pcs(i)
        entries(idx).isBr       := resp.pdInfo(i).isBr
        entries(idx).isJal      := resp.pdInfo(i).isJal
        entries(idx).isJalr     := resp.pdInfo(i).isJalr
        entries(idx).isCall     := resp.pdInfo(i).isCall
        entries(idx).isRet      := resp.pdInfo(i).isRet
        entries(idx).exception  := resp.mmu_error
        entries(idx).jumpTarget := resp.pdInfo(i).jumpTarget
        valids(idx) := true.B
        writeOffset := writeOffset + 1.U
      }
    }
    head  := (head + PopCount(resp.enqMask)) % ibufDepth.U
    count := count + PopCount(resp.enqMask)
  }
 
  // ==================== 出队逻辑 ====================
  val tailIndices = Wire(Vec(issueWidth, UInt(log2Ceil(ibufDepth).W)))
  val canIssue    = Wire(Vec(issueWidth, Bool()))
 
  for (i <- 0 until issueWidth) {
    tailIndices(i) := (tail + i.U) % ibufDepth.U
    canIssue(i)    := (i.U < count) && valids(tailIndices(i))
  }
 
  // 计算连续可发射数
  val maxConsecutive = WireInit(0.U(log2Ceil(issueWidth + 1).W))
  for (i <- 0 until issueWidth) {
    when(canIssue(i)) {
      maxConsecutive := (i + 1).U
    }
  }
 
  val backendReadyCount = PopCount(io.backendReady)
  val actualIssueCount  = Mux(maxConsecutive < backendReadyCount,
                              maxConsecutive, backendReadyCount)
 
  // 输出端口
  for (i <- 0 until issueWidth) {
    val idx = tailIndices(i)
    io.out(i).valid := (i.U < actualIssueCount) && !io.flush
 
    io.out(i).bits.instr    := Cat(0.U(32.W), entries(idx).instr)  // 扩展到64位
    io.out(i).bits.pc       := entries(idx).pc
    io.out(i).bits.pnpc     := entries(idx).pc + 4.U
    io.out(i).bits.isBranch := entries(idx).isBr
    io.out(i).bits.brIdx    := false.B
    io.out(i).bits.isRVC    := false.B
    io.out(i).bits.crossPageIPFFix := false.B
    io.out(i).bits.runahead_checkpoint_id := 0.U
 
    // 异常
    io.out(i).bits.exceptionVec.map(_ := false.B)
    when(entries(idx).exception) {
      io.out(i).bits.exceptionVec(1) := true.B  // ADEF
    }
    io.out(i).bits.intrVec.map(_ := false.B)
 
    // redirect: 暂不在此处生成
    io.out(i).bits.redirect.valid  := false.B
    io.out(i).bits.redirect.target := 0.U
    io.out(i).bits.redirect.rtype  := 0.U
  }
 
  // 更新读指针
  val issuedCount = PopCount(io.out.map(_.fire))
  when(issuedCount > 0.U && !io.flush) {
    for (i <- 0 until issueWidth) {
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