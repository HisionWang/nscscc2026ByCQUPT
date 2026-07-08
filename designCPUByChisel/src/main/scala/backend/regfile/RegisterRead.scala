package nscscc.backend.regread
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.rename.RedirectInfo
import nscscc.backend.execute._
 
// ═══════════════════════════════════════════════════════════════
//  执行单元请求：RegRead → ExeUnit
// ═══════════════════════════════════════════════════════════════
class ExeReq(implicit p: Parameters) extends NSBundle {
  val uop     = new DispatchedInst
  val rs1Data = UInt(XLEN.W)
  val rs2Data = UInt(XLEN.W)
}
 
// ═══════════════════════════════════════════════════════════════
//  读寄存器级（RegisterRead）
//
//  5 个通道对应 5 个 IQ：
//    Q1 (ALU+CSR)      : 2 读端口 (prs1, prs2)
//    Q2 (ALU+DIV)      : 2 读端口 (prs1, prs2)
//    Q3 (ALU+MUL+JMP)  : 2 读端口 (prs1, prs2)
//    Q4 (LOAD+STA)     : 1 读端口 (prs1)
//    Q5 (STD)          : 1 读端口 (prs2)
//
//  流水线结构（每通道独立）：
//    rrd 级：锁存 IQ 发来的 uop，发送 PRF 读地址
//    out 级：PRF 数据就绪，输出到执行单元
//
//  总延迟：IQ 发射 → 执行单元可见 = 2 拍
//    T+0: IQ fire → 锁存 uop，发 PRF 地址
//    T+1: PRF 数据返回 → 锁存到 out 级
//    T+2: out 级对执行单元可见
// ═══════════════════════════════════════════════════════════════
class RegisterRead(implicit p: Parameters) extends NSModule with HasCoreParameters {
 
  // ── 通道配置 ──
  val numChannels       = IQNum
  val readPortsPerChan  = Seq(2, 2, 2, 1, 1)     // 每通道读端口数
  val totalReadPorts    = readPortsPerChan.sum     // 8
  // Q5 的单端口读的是 prs2 而非 prs1
  val singlePortReadsPrs2 = Seq(false, false, false, false, true)
 
  val io = IO(new Bundle {
    // ── 从 IQ 接收 ──
    val iqIssues     = Vec(numChannels, Flipped(Decoupled(new DispatchedInst)))
 
    // ── 连接 PRF ──
    val rfReadAddrs  = Output(Vec(totalReadPorts, UInt(PhyRegIdxWidth.W)))
    val rfReadData   = Input(Vec(totalReadPorts, UInt(XLEN.W)))
 
    // ── 发往执行单元 ──
    val exeReqs      = Vec(numChannels, Decoupled(new ExeReq))
 
    // ── 重定向 / 冲刷 ──
    val redirect      = Input(new RedirectInfo)

    val bruInfo    = Flipped(ValidIO( new redirectInfoFromBru ))    // 误预测重定向

    val flushPipeline = Input(Bool())
  })
 
  // ══════════════════════════════════════════════════════════════
  //  robIdx 比较工具（与 IssueQueue 中一致）
  // ══════════════════════════════════════════════════════════════
  def isRobIdxAfter(a: UInt, b: UInt): Bool = {
    val aFlag = a(a.getWidth - 1)
    val bFlag = b(b.getWidth - 1)
    val aVal  = a(a.getWidth - 2, 0)
    val bVal  = b(b.getWidth - 2, 0)
    Mux(aFlag === bFlag, aVal > bVal, aFlag === 1.U)
  }
 
  // ══════════════════════════════════════════════════════════════
  //  逐通道构建流水线
  // ══════════════════════════════════════════════════════════════
  var portOffset = 0
 
  for (ch <- 0 until numChannels) {
    val numPorts     = readPortsPerChan(ch)
    val readsPrs2    = singlePortReadsPrs2(ch)
    val basePort     = portOffset
 
    // ──────────────────────────────────────────
    //  rrd 级寄存器：锁存 IQ 发来的 uop
    // ──────────────────────────────────────────
    val rrd_valid = RegInit(false.B)
    val rrd_uop   = Reg(new DispatchedInst)
 
    // ──────────────────────────────────────────
    //  out 级寄存器：PRF 数据就绪，对执行单元可见
    // ──────────────────────────────────────────
    val out_valid = RegInit(false.B)
    val out_uop   = Reg(new DispatchedInst)
    val out_rs1   = Reg(UInt(XLEN.W))
    val out_rs2   = Reg(UInt(XLEN.W))
 
    // ──────────────────────────────────────────
    //  Kill 检测
    // ──────────────────────────────────────────
    val doRedirect = io.bruInfo.valid && io.bruInfo.bits.doRedirect
    val redirectRobIdx = io.bruInfo.bits.robIdx

    val rrd_killed = rrd_valid && doRedirect &&
                     rrd_uop.robIdxFull.isAfter(redirectRobIdx)
    val out_killed = out_valid && doRedirect &&
                     out_uop.robIdxFull.isAfter(redirectRobIdx)

    dontTouch(rrd_killed)
    dontTouch(out_killed)
    // ──────────────────────────────────────────
    //  握手控制信号
    // ──────────────────────────────────────────
    val out_fire   = out_valid && !out_killed && io.exeReqs(ch).ready
    val rrd_to_out = rrd_valid && !rrd_killed && (!out_valid || out_fire)
    val rrd_ready  = !rrd_valid || rrd_to_out
    val iq_fire    = io.iqIssues(ch).valid && rrd_ready
 
    // IQ 握手
    io.iqIssues(ch).ready := rrd_ready
 
    // ──────────────────────────────────────────
    //  PRF 读地址
    //  IQ fire 时发新地址；否则维持 rrd_uop 的地址
    //  rrd 空时发 0（无害，PRF 地址 0 恒返回 0）
    // ──────────────────────────────────────────
    if (numPorts == 2) {
      io.rfReadAddrs(basePort)     := Mux(iq_fire, io.iqIssues(ch).bits.prs1,
                                      Mux(rrd_valid, rrd_uop.prs1, 0.U))
      io.rfReadAddrs(basePort + 1) := Mux(iq_fire, io.iqIssues(ch).bits.prs2,
                                      Mux(rrd_valid, rrd_uop.prs2, 0.U))
    } else {
      // 单端口：Q4 读 prs1，Q5 读 prs2
      val readSrc = Mux(readsPrs2.asBool,
        Mux(iq_fire, io.iqIssues(ch).bits.prs2, Mux(rrd_valid, rrd_uop.prs2, 0.U)),
        Mux(iq_fire, io.iqIssues(ch).bits.prs1, Mux(rrd_valid, rrd_uop.prs1, 0.U))
      )
      io.rfReadAddrs(basePort) := readSrc
    }
 
    // ──────────────────────────────────────────
    //  PRF 读数据（1 拍后可用）+ x0 处理 + 未使用源置零
    // ──────────────────────────────────────────
    val rfRs1 = io.rfReadData(basePort)
    val rfRs2 = if (numPorts == 2) io.rfReadData(basePort + 1) else 0.U
 
    val rs1Data = Mux(!rrd_uop.rs1Valid, 0.U,
                  Mux(rrd_uop.prs1 === 0.U, 0.U, rfRs1))
    val rs2Data = if (numPorts == 2) {
      Mux(!rrd_uop.rs2Valid, 0.U,
      Mux(rrd_uop.prs2 === 0.U, 0.U, rfRs2))
    } else {
      // 单端口通道：Q4 不需要 rs2，Q5 不需要 rs1
      Mux(!rrd_uop.rs2Valid, 0.U,
      Mux(rrd_uop.prs2 === 0.U, 0.U, rfRs1))  // Q5: 单端口数据给 rs2
    }
 
    // ──────────────────────────────────────────
    //  寄存器更新
    //  优先级：flush > kill > 正常流水
    // ──────────────────────────────────────────
    when(io.flushPipeline) {
      rrd_valid := false.B
      out_valid := false.B
    }.otherwise {
      // ── rrd 级 ──
      when(rrd_killed) {
        rrd_valid := false.B
      }.elsewhen(iq_fire) {
        rrd_valid := true.B
        rrd_uop   := io.iqIssues(ch).bits
      }.elsewhen(rrd_to_out) {
        rrd_valid := false.B
      }
 
      // ── out 级 ──
      when(out_killed) {
        out_valid := false.B
      }.elsewhen(rrd_to_out) {
        out_valid := true.B
        out_uop   := rrd_uop
        out_rs1   := rs1Data
        out_rs2   := rs2Data
      }.elsewhen(out_fire) {
        out_valid := false.B
      }
    }
 
    // ──────────────────────────────────────────
    //  输出到执行单元
    // ──────────────────────────────────────────
    io.exeReqs(ch).valid         := out_valid && !out_killed
    io.exeReqs(ch).bits.uop      := out_uop
    io.exeReqs(ch).bits.rs1Data  := out_rs1
    io.exeReqs(ch).bits.rs2Data  := out_rs2
 
    portOffset += numPorts
  }
}