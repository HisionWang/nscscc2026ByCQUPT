package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.regread.ExeReq
import nscscc.backend.rename.RedirectInfo
 
class ExeResult(implicit p: Parameters) extends NSBundle {
  val uop      = new DispatchedInst
  val data     = UInt(XLEN.W)
  val redirect = Valid(new RedirectInfo)
}
 
case class ExeUnitParams(
  hasAlu: Boolean = false,
  hasBru: Boolean = false,
  hasCsr: Boolean = false,
  hasMul: Boolean = false,
  hasDiv: Boolean = false,
  hasLsu: Boolean = false,
  hasSta: Boolean = false,
  hasStd: Boolean = false
)
 
class ExeUnit(val params: ExeUnitParams)(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val req      = Flipped(Decoupled(new ExeReq))
    val result   = Valid(new ExeResult)
  })
 
  val req    = io.req.bits
  val fuType = req.uop.ctrl.fuType
 
  // ══════════════════════════════════════════════════════════════
  //  功能子单元实例化
  // ══════════════════════════════════════════════════════════════
 
  // ── ALU ──
  val aluValid_in = if (params.hasAlu) io.req.fire && fuType === FuType.alu else false.B
  val alu = if (params.hasAlu) Module(new ALU) else null
  if (params.hasAlu) {
    alu.io.valid := aluValid_in
    alu.io.uop   := req.uop
    alu.io.rs1   := req.rs1Data
    alu.io.rs2   := req.rs2Data
  }
  val aluValid_out = if (params.hasAlu) RegNext(aluValid_in, false.B) else false.B
  val aluUop      = if (params.hasAlu) RegEnable(req.uop, aluValid_in) else WireDefault(0.U.asTypeOf(new DispatchedInst))
  val aluData     = if (params.hasAlu) alu.io.result else 0.U
 
  // ── BRU ──
  val bruValid_in = if (params.hasBru) io.req.fire && fuType === FuType.bru else false.B
  val bru = if (params.hasBru) Module(new BRU) else null
  if (params.hasBru) {
    bru.io.valid := bruValid_in
    bru.io.uop   := req.uop
    bru.io.rs1   := req.rs1Data
    bru.io.rs2   := req.rs2Data
  }
  val bruValid_out = if (params.hasBru) RegNext(bruValid_in, false.B) else false.B
  val bruUop      = if (params.hasBru) RegEnable(req.uop, bruValid_in) else WireDefault(0.U.asTypeOf(new DispatchedInst))
  val bruData     = if (params.hasBru) bru.io.result else 0.U
 
  // ══════════════════════════════════════════════════════════════
  //  结果仲裁
  // ══════════════════════════════════════════════════════════════
  // 收集所有有效的子单元输出，用优先级选择
  val subValids = Seq(
    if (params.hasAlu) aluValid_out else false.B,
    if (params.hasBru) bruValid_out else false.B
  )
  val subUops = Seq(
    if (params.hasAlu) aluUop else 0.U.asTypeOf(new DispatchedInst),
    if (params.hasBru) bruUop else 0.U.asTypeOf(new DispatchedInst)
  )
  val subData = Seq(
    if (params.hasAlu) aluData else 0.U,
    if (params.hasBru) bruData else 0.U
  )
 
  io.result.valid      := subValids.reduce(_ || _)
  io.result.bits.uop   := Mux1H(subValids, subUops)
  io.result.bits.data  := Mux1H(subValids, subData)
 
  // ── 重定向：BRU 产生 ──
  if (params.hasBru) {
    io.result.bits.redirect <> bru.io.redirect
  } else {
    io.result.bits.redirect.valid := false.B
    io.result.bits.redirect.bits  := DontCare
  }
 
  // ── 握手 ──
  io.req.ready := true.B
}