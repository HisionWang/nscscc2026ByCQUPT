package nscscc.backend.writeback
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.execute.ExeResult
import nscscc.backend.issue.IssueWakeup
import nscscc.backend.regfile.PRFWritePortIO
import nscscc.backend.rename.RedirectInfo
 
// ═══════════════════════════════════════════════════════════════
//  写回级（Writeback）
//
//  功能：
//    1. 接收各执行单元的结果，写入 PRF
//    2. 广播 wakeup 信号给所有 IQ
//    3. 传递重定向信号
//    4. 传递结果到 ROB 用于提交
// ═══════════════════════════════════════════════════════════════
class Writeback(numExeUnits: Int)(implicit p: Parameters) extends NSModule with HasCoreParameters {
  val io = IO(new Bundle {
    // ── 从各执行单元接收结果 ──
    val exeResults = Input(Vec(numExeUnits, Valid(new ExeResult)))
 
    // ── 写 PRF 端口 ──
    val rfWritePorts = Vec(intRegFileWritePorts, new PRFWritePortIO)
 
    // ── 唤醒广播给 IQ ──
    val wakeupPorts = Vec(IQNumWakeupPorts, Valid(new IssueWakeup))
 
    // ── 重定向 ──
    val redirect = Output(Valid(new RedirectInfo))
 
    // ── 送到 ROB 用于提交 ──
    val commitResults = Vec(numExeUnits, Valid(new DispatchedInst))
  })
 
  // ══════════════════════════════════════════════════════════════
  //  执行单元 → PRF 写端口映射
  //
  //  当前只有 3 个 ALU 通道（ch0, ch1, ch2）会产生写回，
  //  加上 BRU 共 4 个写回源。
  //  写回端口映射：
  //    writePort(0) ← exeResult(0)  // Q1: ALU/CSR
  //    writePort(1) ← exeResult(1)  // Q2: ALU/DIV
  //    writePort(2) ← exeResult(2)  // Q3: ALU/MUL/BRU
  //    writePort(3) ← exeResult(2)  // BRU 可能和 ALU 共享，但不会同拍有效
  //    writePort(4..8): 预留给 MUL/DIV/CSR/LOAD/LOAD
  // ══════════════════════════════════════════════════════════════
 
  // 目前只使用前 numExeUnits 个写端口
  for (w <- 0 until numExeUnits) {
    val res = io.exeResults(w)
    val needWrite = res.valid && res.bits.uop.ctrl.rfWen && res.bits.uop.rdValid
 
    io.rfWritePorts(w).valid := needWrite
    io.rfWritePorts(w).addr  := res.bits.uop.pdst
    io.rfWritePorts(w).data  := res.bits.data
  }
 
  // 多余的写端口暂置无效
  for (w <- numExeUnits until intRegFileWritePorts) {
    io.rfWritePorts(w).valid := false.B
    io.rfWritePorts(w).addr  := 0.U
    io.rfWritePorts(w).data  := 0.U
  }
 
  // ══════════════════════════════════════════════════════════════
  //  唤醒广播
  //  将写回的 pdst 广播给所有 IQ 的 wakeup 端口
  //  目前 3 个 ALU 通道各占 1 个唤醒端口
  //  预留 9 个唤醒端口：ALU×3 + MUL + DIV + BRU + CSR + LOAD×2
  // ══════════════════════════════════════════════════════════════
  for (w <- 0 until numExeUnits) {
    val res = io.exeResults(w)
    val needWakeup = res.valid && res.bits.uop.ctrl.rfWen && res.bits.uop.rdValid
 
    io.wakeupPorts(w).valid    := needWakeup
    io.wakeupPorts(w).bits.pdst := res.bits.uop.pdst
  }
 
  // 多余的唤醒端口暂置无效
  for (w <- numExeUnits until IQNumWakeupPorts) {
    io.wakeupPorts(w).valid    := false.B
    io.wakeupPorts(w).bits.pdst := 0.U
  }
 
  // ══════════════════════════════════════════════════════════════
  //  重定向
  //  选取优先级最高的重定向（当前只可能有一个 BRU 产生）
  // ══════════════════════════════════════════════════════════════
  val redirectCandidates = io.exeResults.map(_.bits.redirect)
  val anyRedirect = redirectCandidates.map(_.valid).reduce(_ || _)
 
  io.redirect.valid := anyRedirect
  // 优先选择 robIdx 最小的（最早的重定向）
  io.redirect.bits := PriorityMux(redirectCandidates.map(r => (r.valid, r.bits)))
 
  // ══════════════════════════════════════════════════════════════
  //  送到 ROB
  // ══════════════════════════════════════════════════════════════
  for (i <- 0 until numExeUnits) {
    io.commitResults(i).valid := io.exeResults(i).valid
    io.commitResults(i).bits  := io.exeResults(i).bits.uop
  }
}