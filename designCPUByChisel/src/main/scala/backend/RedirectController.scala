package nscscc.backend.redirect
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.backend.rename._
import firrtl.flattenType



class RobRedirectReq(implicit p: Parameters) extends NSBundle {
  val valid       = Bool()
  val robIdx      = new RobPtr(RobSize)
  val isException = Bool()                        // true=异常, false=CSR写
  val excp = new ExceptionBundle
  val pc          = UInt(XLEN.W)                  // 异常指令PC / CSR写指令PC
}

 
class RedirectController(implicit p: Parameters) extends NSModule with HasCsrParameters {
  val io = IO(new Bundle {
    // ── 输入 ──
    val bruRedirect     = Input(Valid(new redirectInfoFromBru))
    val robRedirect     = Input(new RobRedirectReq)
    val robRollbackDone = Input(Bool())
    val eentry          = Input(UInt(XLEN.W))
    val tlbrentry       = Input(UInt(XLEN.W))
 
    // ── 统一重定向输出 ──
    val redirectInfo    = ValidIO(new redirectInfoToModule)
 
    // ── 暂停信号 ──
    val robRedirectPause     = Output(Bool())

    // ── ROB 回滚控制 ──
    val robNeedRollback   = Output(Bool())
    val robRollbackTarget = Output(new RobPtr(RobSize))
 
    // ── Rename 恢复 ──
    val doRecover       = Output(Bool())
    val recoverSnptId  = Output(UInt(log2Ceil(SnapshotNum).W))
 
    // ── CSR 异常写入 ──
    val csrExcpValid   = Output(Bool())
    val csrExcpVec     = Output(new ExceptionBundle)
    val csrExcpPc      = Output(UInt(XLEN.W))
  })
 
  // ================================================================
  //  输入寄存（打1拍改善时序）
  // ================================================================
  val bruReg = RegNext(io.bruRedirect)
  val robReq = RegNext(io.robRedirect)
 
  // ================================================================
  //  状态机
  //    s_idle        : 正常运行
  //    s_bru_redirect: BRU重定向，本周期发出redirectInfo
  //    s_rob_rollback: ROB重定向，等待回滚完成后发出redirectInfo
  // ================================================================
  val s_idle :: s_bru_redirect :: s_rob_rollback :: Nil = Enum(3)
  val state = RegInit(s_idle)
 
  // ROB 重定向信息（在回滚期间保持稳定）
  val robInfoIsException = Reg(Bool())
  val robInfoExcpVec     = Reg(new ExceptionBundle)
  val robInfoPc          = Reg(UInt(XLEN.W))
  val robInfoRobIdx      = Reg(new RobPtr(RobSize))
 
  switch(state) {
    is(s_idle) {
      when(robReq.valid) {
        state               := s_rob_rollback
        robInfoIsException  := robReq.isException
        robInfoExcpVec      := robReq.excp
        robInfoPc           := robReq.pc
        robInfoRobIdx       := robReq.robIdx
      }.elsewhen(bruReg.valid) {
        state := s_bru_redirect
      }
    }
    is(s_bru_redirect) {
      state := s_idle
    }
    is(s_rob_rollback) {
      when(io.robRollbackDone) {
        state := s_idle
      }
    }
  }
 
  // ================================================================
  //  暂停信号
  //  规则：非空闲态 且 非发重定向的周期 → 暂停
  // ================================================================
  val isRollingBack  = (state === s_rob_rollback)
  val rollbackDone   = isRollingBack && io.robRollbackDone
 
  io.robRedirectPause   := isRollingBack && !rollbackDone

 
  // ================================================================
  //  ROB 回滚控制
  // ================================================================
  io.robNeedRollback   := (state === s_rob_rollback)
  io.robRollbackTarget := robInfoRobIdx
 
  // ================================================================
  //  重定向目标地址
  // ================================================================
  val isTlbExcp = false.B //robInfoExcpVec(5) || robInfoExcpVec(4) ||
                  //robInfoExcpVec(3) || robInfoExcpVec(2) ||
                  //robInfoExcpVec(1)
  val robTarget = Mux(robInfoIsException,
    Mux(isTlbExcp, io.tlbrentry, io.eentry),
    robInfoPc + 4.U
  )
 
  // ================================================================
  //  统一重定向输出
  //    BRU：s_bru_redirect 周期发出
  //    ROB：rollbackDone 周期发出
  // ================================================================
  val bruRedirecting = (state === s_bru_redirect)
  val robRedirecting = rollbackDone
 
  io.redirectInfo.valid               := bruRedirecting || robRedirecting
  io.redirectInfo.bits.doRedirect     := true.B
  io.redirectInfo.bits.flushSelf      := Mux(bruRedirecting, false.B, robInfoIsException)
  io.redirectInfo.bits.fromBru        := bruRedirecting
  io.redirectInfo.bits.snptId         := bruReg.bits.snptId
  io.redirectInfo.bits.robIdx         := Mux(bruRedirecting, bruReg.bits.robIdx, robInfoRobIdx)
  io.redirectInfo.bits.fromRob        := robRedirecting
  io.redirectInfo.bits.target         := Mux(bruRedirecting, bruReg.bits.target, robTarget)
 
  // ================================================================
  //  Rename 恢复
  // ================================================================
  io.doRecover      := robRedirecting
  io.recoverSnptId  := bruReg.bits.snptId
 
  // ================================================================
  //  CSR 异常写入
  // ================================================================
  io.csrExcpValid := robRedirecting && robInfoIsException
  io.csrExcpVec   := Mux(robRedirecting && robInfoIsException, robInfoExcpVec, 0.U)
  io.csrExcpPc    := Mux(robRedirecting && robInfoIsException, robInfoPc, 0.U)
}