package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.dispatch.DispatchedInst
 
// ═══════════════════════════════════════════════════════════════
//  ALU 执行单元
//
//  支持操作：add, sub, slt, sltu, and, or, xor, nor,
//            sll, srl, sra, pass2
//  单拍组合逻辑完成
// ═══════════════════════════════════════════════════════════════
class ALU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val valid  = Input(Bool())
    val uop    = Input(new DispatchedInst)
    val rs1    = Input(UInt(XLEN.W))
    val rs2    = Input(UInt(XLEN.W))
    val result = Output(UInt(XLEN.W))
  })
 
  val op    = io.uop.ctrl.aluOp
  val src1  = io.rs1
  val src2  = io.rs2
 
  // ── 加减法 ──
  val addResult  = (src1 + src2)(XLEN - 1, 0)
  val subResult  = (src1 - src2)(XLEN - 1, 0)
 
  // ── 比较类 ──
  val sltResult  = Mux(src1.asSInt < src2.asSInt, 1.U(XLEN.W), 0.U(XLEN.W))
  val sltuResult = Mux(src1 < src2, 1.U(XLEN.W), 0.U(XLEN.W))
 
  // ── 逻辑类 ──
  val andResult  = src1 & src2
  val orResult   = src1 | src2
  val xorResult  = src1 ^ src2
  val norResult  = ~(src1 | src2)
 
  // ── 移位类 ──
  // LoongArch 移位量只取低 5 位（32位架构）
  val shamt = src2(4, 0)
  val sllResult  = src1 << shamt
  val srlResult  = src1 >> shamt
  val sraResult  = (src1.asSInt >> shamt).asUInt
 
  // ── 直通 ──
  val pass2Result = src2
 
  // ── 结果选择 ──
  io.result := MuxCase(0.U(XLEN.W), Seq(
    (op === AluOp.add  ) -> addResult,
    (op === AluOp.sub  ) -> subResult,
    (op === AluOp.slt  ) -> sltResult,
    (op === AluOp.sltu ) -> sltuResult,
    (op === AluOp.and  ) -> andResult,
    (op === AluOp.or   ) -> orResult,
    (op === AluOp.xor  ) -> xorResult,
    (op === AluOp.nor  ) -> norResult,
    (op === AluOp.sll  ) -> sllResult(XLEN - 1, 0),
    (op === AluOp.srl  ) -> srlResult(XLEN - 1, 0),
    (op === AluOp.sra  ) -> sraResult(XLEN - 1, 0),
    (op === AluOp.pass2) -> pass2Result
  ))
}