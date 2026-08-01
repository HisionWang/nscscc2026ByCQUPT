package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.regread.ExeReq
import nscscc.backend.rename.RedirectInfo
 
// ═══════════════════════════════════════════════════════════════
//  流水线乘法器
//
//  支持操作：MUL  (有符号 × 有符号，低32位)
//            MULH (有符号 × 有符号，高32位)
//            MULHU(无符号 × 无符号，高32位)
//
//  3级流水线：
//    S1: 接收输入，计算64位乘积
//    S2: 流水缓冲级（改善时序）
//    S3: 结果选择 + 输出握手
//
//  设计参考：
//    - open-la500 的 Booth 编码 + Wallace 树思想
//    - 香山的符号修正策略
//    - iFuCore 的流水线打拍结构
// ═══════════════════════════════════════════════════════════════
class Multiplier(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val in    = Flipped(Decoupled(new ExeReq))
    val out   = Decoupled(new ExeResult)
    //val flush = Input(Bool())
    val redirectInfo    = Flipped(ValidIO( new redirectInfoToModule ))    // 误预测重定向

  })
  io.out.bits.memValid := false.B
  io.out.bits.memRead := false.B
  io.out.bits.memWrite := false.B
  io.out.bits.memVaddr := 0.U
  io.out.bits.memPaddr := 0.U
  io.out.bits.memStoreData := 0.U
  io.out.bits.csrWen := false.B
  io.out.bits.csrWaddr := 0.U
  io.out.bits.csrWdata := 0.U
  io.out.bits.csrTimer := 0.U
  io.out.bits.tlbFillIdx := 0.U

 
  // ================================================================
  //  S1 寄存器：锁存输入 + 计算64位乘积
  // ================================================================
  val s1_valid   = RegInit(false.B)
  val s1_uop    = RegInit(0.U.asTypeOf(new DispatchedInst))
  val s1_prod   = RegInit(0.U((2 * XLEN).W))
  val s1_isMul  = RegInit(false.B)
  val s1_isMulh = RegInit(false.B)
 
  // ================================================================
  //  S2 寄存器：流水缓冲
  // ================================================================
  val s2_valid  = RegInit(false.B)
  val s2_uop    = RegInit(0.U.asTypeOf(new DispatchedInst))
  val s2_prod   = RegInit(0.U((2 * XLEN).W))
  val s2_isMul  = RegInit(false.B)
  val s2_isMulh = RegInit(false.B)
 
  // ================================================================
  //  S3 寄存器：结果选择 + 输出
  // ================================================================
  val s3_valid   = RegInit(false.B)
  val s3_uop  = RegInit(0.U.asTypeOf(new DispatchedInst))
  val s3_data = RegInit(0.U(XLEN.W))
 
  // ================================================================
  //  流水线反压控制
  //  S3 输出 → S2 推进 → S1 推进 → 输入接收
  // ================================================================
  val s3_fire = s3_valid && io.out.ready
  val s2_fire = s2_valid && (!s3_valid || s3_fire)
  val s1_fire = s1_valid && (!s2_valid || s2_fire)
  val in_fire = io.in.valid && (!s1_valid || s1_fire)
 
  io.in.ready := !s1_valid || s1_fire
 
  // ================================================================
  //  输入级：计算64位乘积
  //
  //  策略（结合 open-la500 Booth 与香山符号修正的优点）：
  //  1. 先计算无符号乘积 a * b（综合工具映射为 DSP 或优化逻辑）
  //  2. 有符号乘积通过符号修正从无符号乘积推导：
  //     signed = unsigned - a[31]*b*2^32 - b[31]*a*2^32
  //     这样只需一次乘法 + 两次加法，节省硬件资源
  //  3. MUL 的低32位在有无符号下结果一致，无需区分
  // ================================================================
  val a     = io.in.bits.rs1Data
  val b     = io.in.bits.rs2Data
  val mulOp = io.in.bits.uop.ctrl.mulOp
 
  val isSignedOp = (mulOp === MulOp.mul) || (mulOp === MulOp.mulh)
 
  // 无符号乘积
  val prodUnsigned = a * b   // 64位
 
  // 符号修正：signed_prod = unsigned_prod - a[31]*b<<32 - b[31]*a<<32
  val signCorrection = Mux(a(XLEN - 1), Cat(b, 0.U(XLEN.W)), 0.U((2 * XLEN).W)) +
                       Mux(b(XLEN - 1), Cat(a, 0.U(XLEN.W)), 0.U((2 * XLEN).W))
  val prodSigned = prodUnsigned - signCorrection
 
  // 根据操作类型选择乘积
  val prod = Mux(isSignedOp, prodSigned, prodUnsigned)
 
  // ================================================================
  //  S1 更新
  // ================================================================
  val doRedirect = io.redirectInfo.valid && io.redirectInfo.bits.doRedirect
  val redirectRobIdx = io.redirectInfo.bits.robIdx
  val s1DoFlush = in_fire && doRedirect &&
                     io.in.bits.uop.robIdxFull.isAfter(redirectRobIdx)

  when(s1DoFlush) {
    s1_valid := false.B
  }.elsewhen(in_fire) {
    s1_valid  := true.B
    s1_uop    := io.in.bits.uop
    s1_prod   := prod
    s1_isMul  := (mulOp === MulOp.mul)
    s1_isMulh := (mulOp === MulOp.mulh)
  }.elsewhen(s1_fire) {
    s1_valid := false.B
  }
 
  // ================================================================
  //  S2 更新
  // ================================================================
  val s2DoFlush = in_fire && doRedirect &&
                     s1_uop.robIdxFull.isAfter(redirectRobIdx)
  when(s2DoFlush) {
    s2_valid := false.B
  }.elsewhen(s1_fire) {
    s2_valid  := true.B
    s2_uop    := s1_uop
    s2_prod   := s1_prod
    s2_isMul  := s1_isMul
    s2_isMulh := s1_isMulh
  }.elsewhen(s2_fire) {
    s2_valid := false.B
  }
 
  // ================================================================
  //  S2 → S3：结果选择
  //  MUL   → prod[31:0]
  //  MULH  → prod[63:32]
  //  MULHU → prod[63:32]
  // ================================================================
  val s2_result = Mux(s2_isMul, s2_prod(XLEN - 1, 0), s2_prod(2 * XLEN - 1, XLEN))
 
  // ================================================================
  //  S3 更新
  // ================================================================
      val s3DoFlush = in_fire && doRedirect &&
                     s2_uop.robIdxFull.isAfter(redirectRobIdx)
  when(s3DoFlush) {
    s3_valid := false.B
  }.elsewhen(s2_fire) {
    s3_valid := true.B
    s3_uop   := s2_uop
    s3_data  := s2_result
  }.elsewhen(s3_fire) {
    s3_valid := false.B
  }
 
  // ================================================================
  //  输出
  // ================================================================
  io.out.valid              := s3_valid
  io.out.bits.uop           := s3_uop
  io.out.bits.data          := s3_data
  io.out.bits.redirect.valid := false.B
  io.out.bits.redirect.bits  := DontCare
}
