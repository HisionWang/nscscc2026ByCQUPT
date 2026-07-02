package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.rename.RedirectInfo
 
// ═══════════════════════════════════════════════════════════════
//  分支执行单元
//
//  支持操作：jirl, b, bl, beq, bne, blt, bge, bltu, bgeu
//  单拍组合逻辑完成
// ═══════════════════════════════════════════════════════════════
class BRU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val valid      = Input(Bool())
    val uop        = Input(new DispatchedInst)
    val rs1        = Input(UInt(XLEN.W))
    val rs2        = Input(UInt(XLEN.W))
    val result     = Output(UInt(XLEN.W))       // 写回目标寄存器的值（如 BL 的 PC+4）
    val redirect   = Valid(new RedirectInfo)     // 误预测重定向
    val isBranch   = Output(Bool())              // 是否为分支指令（用于分支预测更新）
    val taken      = Output(Bool())              // 分支是否 taken
  })
 
  val op   = io.uop.ctrl.bruOp
  val src1 = io.rs1
  val src2 = io.rs2
  val pc   = io.uop.pc
 
  // ── 条件判断 ──
  val eq  = src1 === src2
  val ne  = !eq
  val lt  = src1.asSInt < src2.asSInt
  val ge  = !lt
  val ltu = src1 < src2
  val geu = !ltu
 
  // ── 分支是否 taken ──
  val branchTaken = MuxCase(false.B, Seq(
    ( op === BruOp.jirl ) -> true.B,
    ( op === BruOp.b    ) -> true.B,
    ( op === BruOp.bl   ) -> true.B,
    ( op === BruOp.beq  ) -> eq,
    ( op === BruOp.bne  ) -> ne,
    ( op === BruOp.blt  ) -> lt,
    ( op === BruOp.bge  ) -> ge,
    ( op === BruOp.bltu ) -> ltu,
    ( op === BruOp.bgeu ) -> geu
  ))
 
  // ── 目标地址计算 ──
  // LoongArch: 条件分支偏移为 si16<<2，B/BL 为 si26<<2，JIRL 为 si16<<2 + rs1
  val imm        = io.uop.imm
  val jirlTarget = (src1 + imm)(XLEN - 1, 0)
  val branchTarget = (pc + imm)(XLEN - 1, 0)
 
  val target = Mux(op === BruOp.jirl, jirlTarget, branchTarget)
  dontTouch(target)
  // ── 写回值 ──
  // BL 和 JIRL 需要把 PC+4 写入目标寄存器
  val linkResult = pc + 4.U
 
  io.result := Mux(op === BruOp.bl || op === BruOp.jirl, linkResult, 0.U)
 
  // ── 重定向 ──
  // 当前简化实现：所有分支/跳转指令都发出重定向
  // 后续接入分支预测后，只在误预测时才重定向
  io.isBranch := op =/= BruOp.none
  io.taken    := branchTaken
 
  io.redirect.valid := io.valid && io.isBranch && branchTaken
  io.redirect.bits.valid      := true.B
  io.redirect.bits.robIdx := io.uop.robIdxFull
}