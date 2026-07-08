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

  val memValid = Bool()// 没有输出这个！
  val memRead  = Bool()// 没有输出这个！
  val memWrite = Bool()// 没有输出这个！
  val memVaddr = UInt(XLEN.W)// 没有输出这个！
  val memPaddr = UInt(XLEN.W)// 没有输出这个！
  val memStoreData = UInt(XLEN.W)// 没有输出这个！

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
 * 执行单元（ExeUnit）—— 含乘除法器集成版
 * ═══════════════════════════════════════════════════════════════
 *
 * 【架构变更】
 * 原设计中 ALU/BRU 互斥共享 stgData，所有指令占用同一流水级。
 * 新增 MUL（流水线）/ DIV（多周期）后，三者可以并行执行：
 *   - 快速通道（ALU/BRU/LSU/CSR）：单周期，使用 stgData 寄存器
 *   - 乘法通道（MUL）：3级流水线，独立握手
 *   - 除法通道（DIV）：多周期，独立握手
 *
 * 【输入路由】
 *   - 快速指令：stgReady 即可接收
 *   - MUL 指令：乘法器 in.ready 即可接收（流水线，通常总是就绪）
 *   - DIV 指令：除法器 in.ready（仅空闲时）才可接收
 *   三类指令互斥（FuType 不同），不存在同一输入同时路由到两个通道的情况
 *
 * 【输出仲裁】
 *   三个通道竞争唯一的 outResult 端口：
 *   优先级：快速通道 > 除法通道 > 乘法通道
 *   - 快速通道阻塞 stgData，必须优先输出
 *   - 除法器多周期阻塞，优先级次之
 *   - 乘法器流水线可吸收延迟，优先级最低
 * ═══════════════════════════════════════════════════════════════
 */
class ExeUnit(val params: ExeUnitParams)(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val inReq      = Flipped(Decoupled(new ExeReq))
    val outResult  = Decoupled(new ExeResult)
    val flush      = Input(Bool())
    val bruInfo    = ValidIO( new redirectInfoFromBru )    // 误预测重定向

  })
  // ================================================================
  //  输入路由：判断当前输入指令的目标通道
  // ================================================================
  val incomingFuType = io.inReq.bits.uop.ctrl.fuType
  val isFastPath = incomingFuType === FuType.alu || incomingFuType === FuType.bru ||
                   incomingFuType === FuType.lsu || incomingFuType === FuType.csr ||
                   incomingFuType === FuType.priv
  val isMulInst = if (params.hasMul) incomingFuType === FuType.mul else false.B
  val isDivInst = if (params.hasDiv) incomingFuType === FuType.div else false.B
 
  // ================================================================
  //  快速通道 Phase 1：流水级寄存器
  //  仅 ALU/BRU/LSU/CSR/PRIV 使用此寄存器
  // ================================================================
  val stgValid = RegInit(false.B)
  val stgData  = Reg(new ExeReq)
 
  // ================================================================
  //  输出仲裁信号（先声明，后面赋值）
  // ================================================================
  val fastOutValid = WireDefault(stgValid)  // 快速通道有数据时即可输出
 
  // 快速通道的 outFire：stgValid 且下游 ready 且快速通道赢得仲裁
  // 快速通道优先级最高，只要 stgValid 就一定赢
  val outFire  = stgValid && io.outResult.ready
  val stgReady = !stgValid || outFire
 
  // 快速通道输入
  val fastInFire = io.inReq.valid && isFastPath && stgReady
 
  // ── stgValid 状态转移 ──
  when(io.flush) {
    stgValid := false.B
  }.elsewhen(fastInFire) {
    stgValid := true.B
    stgData  := io.inReq.bits
  }.elsewhen(outFire) {
    stgValid := false.B
  }
 
  // ================================================================
  //  快速通道 Phase 2：功能单元计算
  // ================================================================
  val fuType = stgData.uop.ctrl.fuType
 
  // ── ALU (单周期) ──
  val aluValid = if (params.hasAlu) stgValid && fuType === FuType.alu else false.B
  val alu = if (params.hasAlu) Module(new ALU) else null
  if (params.hasAlu) {
    alu.io.valid := aluValid
    alu.io.uop   := stgData.uop
    alu.io.rs1   := stgData.rs1Data
    alu.io.rs2   := stgData.rs2Data
  }
  val aluData = if (params.hasAlu) alu.io.result else null
 
  // ── BRU (单周期) ──
  val bruValid = if (params.hasBru) stgValid && fuType === FuType.bru else false.B
  val bru = if (params.hasBru) Module(new BRU) else null
  if (params.hasBru) {
    bru.io.valid := bruValid
    bru.io.uop   := stgData.uop
    bru.io.rs1   := stgData.rs1Data
    bru.io.rs2   := stgData.rs2Data
  }
  val bruData = if (params.hasBru) bru.io.result else null
 
  // ── load/store 地址运算 (单周期) ──
  val memAddrValid = if (params.hasMemAddr) stgValid && fuType === FuType.lsu else false.B
  val rs1Data = if (params.hasMemAddr) stgData.rs1Data else null
  val memImm  = if (params.hasMemAddr) stgData.uop.imm else null
  val memAddr = if (params.hasMemAddr) (rs1Data + memImm) else null
 
  // ── std (单周期) ──
  val stdValid = if (params.hasStd) (stgValid && fuType === FuType.lsu && stgData.uop.isStd) else false.B
  val stdData  = if (params.hasStd) stgData.rs2Data else null
 
  // ── 快速通道数据收集 ──
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
 
  val fastOutData = Mux1H(subValids, subData)
  val fastOutUop  = stgData.uop
 
  // ================================================================
  //  乘法器（流水线）
  // ================================================================
  val mul = if (params.hasMul) Module(new Multiplier) else null
  if (params.hasMul) {
    mul.io.in.valid := io.inReq.valid && isMulInst
    mul.io.in.bits  := io.inReq.bits
    mul.io.flush    := io.flush
  }
  val mulOutValid = if (params.hasMul) mul.io.out.valid else false.B
 
  // ================================================================
  //  除法器（多周期）
  // ================================================================
  val div = if (params.hasDiv) Module(new Divider) else null
  if (params.hasDiv) {
    div.io.in.valid := io.inReq.valid && isDivInst
    div.io.in.bits  := io.inReq.bits
    div.io.flush    := io.flush
  }
  val divOutValid = if (params.hasDiv) div.io.out.valid else false.B
 
  // ================================================================
  //  输入 ready 信号
  //  根据指令类型路由到对应通道的 ready
  // ================================================================
  val fastReady = stgReady
  val mulReady  = if (params.hasMul) mul.io.in.ready else false.B
  val divReady  = if (params.hasDiv) div.io.in.ready else false.B
 
  io.inReq.ready := Mux(isFastPath, fastReady,
                    Mux(isMulInst,  mulReady,
                    Mux(isDivInst,  divReady, false.B)))
 
  // ================================================================
  //  输出仲裁
  //  优先级：快速通道 > 除法通道 > 乘法通道
  // ================================================================
  val fastWins = fastOutValid
  val divWins  = !fastOutValid && divOutValid
  val mulWins  = !fastOutValid && !divOutValid && mulOutValid
 
  io.outResult.valid := fastOutValid || mulOutValid || divOutValid
 
  // ── 各通道的 ready 反馈 ──
  // 快速通道：赢得仲裁且下游 ready 时发射
  // outFire 已在上面定义 = stgValid && io.outResult.ready
 
  // 除法器：赢得仲裁且下游 ready
  if (params.hasDiv) {
    div.io.out.ready := divWins && io.outResult.ready
  }
 
  // 乘法器：赢得仲裁且下游 ready
  if (params.hasMul) {
    mul.io.out.ready := mulWins && io.outResult.ready
  }
 
  // ── 输出数据选择（动态构建 Mux1H 列表，避免引用未实例化的模块）──
  val outUopSelects = Seq(fastWins -> fastOutUop) ++
    (if (params.hasMul) Seq(mulWins -> mul.io.out.bits.uop) else Seq()) ++
    (if (params.hasDiv) Seq(divWins -> div.io.out.bits.uop) else Seq())
 
  val outDataSelects = Seq(fastWins -> fastOutData) ++
    (if (params.hasMul) Seq(mulWins -> mul.io.out.bits.data) else Seq()) ++
    (if (params.hasDiv) Seq(divWins -> div.io.out.bits.data) else Seq())
 
  io.outResult.bits.uop  := Mux1H(outUopSelects)
  io.outResult.bits.data := Mux1H(outDataSelects)

  io.outResult.bits.memValid := false.B
  io.outResult.bits.memRead := false.B
  io.outResult.bits.memWrite := false.B
  io.outResult.bits.memVaddr := 0.U
  io.outResult.bits.memPaddr := 0.U
  io.outResult.bits.memStoreData := 0.U

 
  io.outResult.bits.redirect.valid := false.B
  io.outResult.bits.redirect.bits  := DontCare
 
  // ================================================================
  //  重定向：BRU 产生的分支误预测
  // ================================================================
  if (params.hasBru) {
    // 只有在 BRU 有效执行时，才允许向外发出重定向请求
    io.bruInfo.valid := bruValid && bru.io.bruInfo.valid
    io.bruInfo.bits  := bru.io.bruInfo.bits
  } else {
    io.bruInfo.valid := false.B
    io.bruInfo.bits  := DontCare
  }
 
  // ================================================================
  //  断言：进入的指令 FuType 必须为本模块所支持
  // ================================================================
  val supportedList = Seq(
    (params.hasAlu,   FuType.alu),
    (params.hasBru,   FuType.bru),
    (params.hasCsr,   FuType.csr),
    (params.hasMul,   FuType.mul),
    (params.hasDiv,   FuType.div),
    (params.hasMemAddr || params.hasStd, FuType.lsu)
  ).filter(_._1).map(_._2).distinct
 
  val fuTypeSupported = supportedList.map(t => io.inReq.bits.uop.ctrl.fuType === t).reduce(_ || _)
 
  //when(io.inReq.valid && io.inReq.ready) {
  //  assert(fuTypeSupported, "ExeUnit received instruction with unsupported FuType!")
  //}
}

