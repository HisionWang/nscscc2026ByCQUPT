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
  val memValid = Bool()
  val memRead  = Bool()
  val memWrite = Bool()
  val memVaddr = UInt(XLEN.W)
  val memPaddr = UInt(XLEN.W)
  val memStoreData = UInt(XLEN.W)
  

}
 
case class ExeUnitParams(
  hasAlu: Boolean = false,
  hasBru: Boolean = false,
  hasCsr: Boolean = false,
  hasMul: Boolean = false,
  hasDiv: Boolean = false,
  hasMemAddr: Boolean = false,
  hasStd: Boolean = false
)
 
/**
 * ═══════════════════════════════════════════════════════════════
 * 执行单元（ExeUnit）
 * ═══════════════════════════════════════════════════════════════
 *
 * 【流水线位置】
 * RegReadStage ──▶ ExeUnit ──▶ WriteBack / Forwarding
 *
 * 【时序设计原则】
 * 1. 先打拍，后计算：
 * 从 io.inReq 进来的数据首先被寄存到 stgData 中（Phase 1）。
 * 2. 单周期与多周期混合处理：
 * - ALU/BRU：利用 stgData 组合逻辑直出，1周期完成。
 * - MUL/DIV：触发后需要多周期，期间拉高 fuBusy 阻塞本级流水（Phase 2）。
 * 3. 严格的握手协议：
 * 只有当本级非忙 (!fuBusy) 且下游准备好 (outResult.ready) 时，
 * 才能 outFire，并允许上游输入新数据 (inFire)。
 * ═══════════════════════════════════════════════════════════════
 */
class ExeUnit(val params: ExeUnitParams)(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val inReq      = Flipped(Decoupled(new ExeReq))
    val outResult  = Decoupled(new ExeResult)
    // 增加全局冲刷信号（因为现在模块内部有状态寄存器了，必须能被冲刷）
    val flush      = Input(Bool()) 
    val brMsRedirect   =ValidIO( new brMispredictRedirect )    // 误预测重定向
  })
 
  // ================================================================
  //  Phase 1: 流水级寄存器（严格规范的握手与打拍）
  // ================================================================
  val stgValid = RegInit(false.B)
  val stgData   = Reg(new ExeReq)
  
  // ── 预留多周期阻塞接口 (MUL/DIV) ──
  // TODO: 后续接入乘除法器时，将这里替换为实际的 busy 信号
  // 例如：val fuBusy = mulDiv.io.busy || !mulDiv.io.done
  val fuBusy = WireDefault(false.B) 

  // ── 1-1. 发射判定：本级有效且运算完毕且下游 ready ──
  val outFire = stgValid && !fuBusy && io.outResult.ready

  // ── 1-2. 接收判定：本级为空，或者本级数据能在这一拍成功发走 ──
  val stgReady = !stgValid || outFire
  
  // ── 1-3. 输入判定 ──
  val inFire = io.inReq.valid && stgReady

  // ── 1-4. 将 ready 信号反压给上游 ──
  io.inReq.ready := stgReady

  // ── 1-5. 严格状态转移 ──
  when(io.flush) {
    // 冲刷：清空本级，丢弃正在执行或等待执行的数据
    stgValid := false.B
  }.elsewhen(inFire) {
    // 接收新数据：打入寄存器
    stgValid := true.B
    stgData   := io.inReq.bits
  }.elsewhen(outFire) {
    // 旧数据成功发射且没有新数据进来：清空本级
    stgValid := false.B
  }
  // else：阻塞中，stgValid 和 stgData 保持不变，让多周期运算器继续算

  // ================================================================
  //  Phase 2: 组合逻辑 —— 功能单元 (FU) 核心计算
  //  注意：这里的所有计算都基于已经稳定的 stgData（T1 寄存器值）
  // ================================================================
  val fuType = stgData.uop.ctrl.fuType

  // ── ALU (单周期运算) ──
  val aluValid = if (params.hasAlu) stgValid && fuType === FuType.alu else false.B
  val alu = if (params.hasAlu) Module(new ALU) else null
  if (params.hasAlu) {
    // 直接使用稳定打拍后的 stgData 数据
    alu.io.valid := aluValid
    alu.io.uop   := stgData.uop
    alu.io.rs1   := stgData.rs1Data
    alu.io.rs2   := stgData.rs2Data
  }
  val aluData = if (params.hasAlu) alu.io.result else null

  // ── BRU (单周期运算) ──
  val bruValid = if (params.hasBru) stgValid && fuType === FuType.bru else false.B
  val bru = if (params.hasBru) Module(new BRU) else null
  if (params.hasBru) {
    bru.io.valid := bruValid
    bru.io.uop   := stgData.uop
    bru.io.rs1   := stgData.rs1Data
    bru.io.rs2   := stgData.rs2Data
  }
  val bruData = if (params.hasBru) bru.io.result else null

    // ── load 和 store的地址运算 (单周期运算) ──
  val memAddrValid = if (params.hasMemAddr) stgValid && fuType === FuType.lsu else false.B
  val rs1Data = if (params.hasMemAddr) stgData.rs1Data else null
  val memImm = if (params.hasMemAddr) stgData.uop.imm else null
  val memAddr = if (params.hasMemAddr) (rs1Data + memImm) else null

  // ── std (单周期运算) ──
  val stdValid = if (params.hasStd) ( stgValid && fuType === FuType.lsu && stgData.uop.isStd ) else false.B
  val stdData = if (params.hasStd) (stgData.rs2Data) else null

  // ================================================================
  //  Phase 3: 组装输出到下游
  // ================================================================
  
  // 收集单周期结果（如果是多周期，也在这里收集它的 done 数据）
  val subValids = Seq(
    if (params.hasAlu) aluValid else false.B,
    if (params.hasBru) bruValid else false.B,
    if (params.hasMemAddr) memAddrValid else false.B,
    if (params.hasStd) stdValid else false.B
  )
  val subData = Seq(
    if (params.hasAlu) aluData else 0.U,
    if (params.hasBru) bruData else 0.U,
    if (params.hasMemAddr) memAddr else 0.U,
    if (params.hasStd) stdData else 0.U
  )

  // 输出的 valid 信号必须满足：本级有数据，且多周期计算不处于忙碌状态
  io.outResult.valid     := stgValid && !fuBusy
  
  // 将寄存的 uop 透传出去
  io.outResult.bits.uop  := stgData.uop
  
  // 仲裁并输出计算结果数据
  io.outResult.bits.data := Mux1H(subValids, subData)
  io.outResult.bits.memValid := false.B
  io.outResult.bits.memRead := false.B
  io.outResult.bits.memWrite := false.B
  io.outResult.bits.memVaddr := 0.U
  io.outResult.bits.memPaddr := 0.U
  io.outResult.bits.memStoreData := 0.U


  io.outResult.bits.redirect.valid := false.B
  io.outResult.bits.redirect.bits  := DontCare

  // ── 重定向：BRU 产生的分支预测结果 ──
  if (params.hasBru) {
    // 只有在 BRU 有效执行时，才允许向外发出重定向请求
    io.brMsRedirect.valid := bruValid && bru.io.brMsRedirect.valid
    io.brMsRedirect.bits  := bru.io.brMsRedirect.bits
  } else {
    io.brMsRedirect.valid := false.B
    io.brMsRedirect.bits  := DontCare
  }






// ──────────────────────────────────────────────
//  断言：进入的指令 FuType 必须为本模块所支持
// ──────────────────────────────────────────────

// 1. 根据参数构建支持的功能类型列表（注意去重，例如 lsu 可能被 hasMemAddr/hasStd 共用）
val supportedList = Seq(
  (params.hasAlu,   FuType.alu),
  (params.hasBru,   FuType.bru),
  (params.hasCsr,   FuType.csr),
  (params.hasMul,   FuType.mul),
  (params.hasDiv,   FuType.div),
  (params.hasMemAddr || params.hasStd, FuType.lsu) // lsu 同时覆盖地址计算和 std
).filter(_._1).map(_._2).distinct

// 2. 生成一个 Bool：当前输入 fuType 是否在支持列表中
val fuTypeSupported = supportedList.map(t => io.inReq.bits.uop.ctrl.fuType === t).reduce(_ || _)

// 3. 断言：当 inFire 时，fuType 必须受支持
when(inFire) {
  assert(fuTypeSupported, "ExeUnit received instruction with unsupported FuType!")
}


}
