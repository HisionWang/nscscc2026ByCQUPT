package nscscc.backend.redirect
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.backend.rename._
import firrtl.flattenType
import nscscc.csr._
import nscscc.config.ExcType._



class RobRedirectReq(implicit p: Parameters) extends NSBundle {
  val valid       = Bool()
  val robIdx      = new RobPtr(RobSize)
  val isException = Bool()                        // true=异常, false=CSR写
  val excp = new ExceptionBundle
  val pc          = UInt(XLEN.W)                  // 异常指令PC / CSR写指令PC
  val excpVaddr          = UInt(XLEN.W)                  // 异常指令PC / CSR写指令PC
  val invalidIcache = Bool()
  
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
    // val doRecover       = Output(Bool())
    // val recoverSnptId  = Output(UInt(log2Ceil(SnapshotNum).W))
 
    // ── CSR 异常写入 ──
    //val csrExcpValid   = Output(Bool())
    //val csrExcpVec     = Output(new ExceptionBundle)
    //val csrExcpPc      = Output(UInt(XLEN.W))


    val excpEvent           = Output(new ExcpEvent)
    val excpInfo            = Output(new ExcpInfo)
    val redirectAddrFromCsr = Input(new RedirectEntry)


  })
 
  // ================================================================
  //  输入寄存（打1拍改善时序）
  // ================================================================
  val bruReg = RegNext(io.bruRedirect)
  val robReq = (io.robRedirect)
 
  // ================================================================
  //  状态机
  //    s_idle        : 正常运行
  //    s_bru_redirect: BRU重定向，本周期发出redirectInfo
  //    s_rob_rollback: ROB重定向，等待回滚完成后发出redirectInfo
  // ================================================================
  val s_idle :: s_bru_redirect :: s_rob_rollback :: s_rob_flush :: Nil = Enum(4)
  val state = RegInit(s_idle)
 
  // ROB 重定向信息（在回滚期间保持稳定）
  val robInfoIsException = RegInit(false.B)
  val robInfoInvalidIcache = RegInit(false.B)
  val robInfoExcpVec     = RegInit(0.U.asTypeOf(new ExceptionBundle))
  val robInfoPc          = RegInit(0.U(XLEN.W))
  val robInfoRobIdx      = RegInit(0.U.asTypeOf(new RobPtr(RobSize)))
 
  switch(state) {
    is(s_idle) {
      when(robReq.valid) {
        state               := s_rob_rollback
        robInfoIsException  := robReq.isException
        robInfoExcpVec      := robReq.excp
        robInfoPc           := robReq.pc
        robInfoRobIdx       := robReq.robIdx
        robInfoInvalidIcache := robReq.invalidIcache
      }.elsewhen(io.bruRedirect.valid ){//就算没有重定向也要发去释放快照//&& io.bruRedirect.bits.doRedirect) {
        state := s_bru_redirect
      }
    }
    is(s_bru_redirect) {
      when(robReq.valid) {
        state               := s_rob_rollback
        robInfoIsException  := robReq.isException
        robInfoExcpVec      := robReq.excp
        robInfoPc           := robReq.pc
        robInfoRobIdx       := robReq.robIdx
        robInfoInvalidIcache := robReq.invalidIcache
      }.elsewhen(io.bruRedirect.valid ){
        state := s_bru_redirect
      }.otherwise{
        state := s_idle
      }
    }
    is(s_rob_rollback) {
      when(io.robRollbackDone) {
        state := s_rob_flush
      }
    }
    is(s_rob_flush) { // archcommit 打了一拍，所以Rob重定向信号也要跟着延迟一拍
      state := s_idle
    }
  }
 
  // ================================================================
  //  暂停信号
  //  规则：非空闲态 且 非发重定向的周期 → 暂停
  // ================================================================
  val isRollingBack  = (state === s_rob_rollback)
  val rollbackDone   = isRollingBack && io.robRollbackDone
  io.robRedirectPause   := isRollingBack //|| io.robRedirect.valid

 
  // ================================================================
  //  ROB 回滚控制
  // ================================================================
  io.robNeedRollback   := (state === s_rob_rollback)
  io.robRollbackTarget := robInfoRobIdx
 
  // ================================================================
  //  重定向目标地址
  // ================================================================
  val hasErtnBit = robInfoExcpVec.has(ERTN)
  val isPureErtnExcp = robInfoExcpVec.excpVec === (1.U << ExcType.ERTN.id).asUInt
  val isErtnExcp = robInfoIsException && hasErtnBit && isPureErtnExcp
  val isTlbExcp = robInfoIsException && !isErtnExcp && robInfoExcpVec.isTlbRefill
  val isNormalExcp = robInfoIsException && !isErtnExcp

//  val robTarget = Mux(robInfoIsException,
//    Mux(isTlbExcp, io.tlbrentry, io.eentry),
//    robInfoPc + 4.U
//  )

  // 2. 多路地址选择 (自上而下具有优先级，默认分支为 CSR 写指令的 PC + 4)
  val robTarget = MuxCase(
    robInfoPc + 4.U,  //默认分支为 CSR 写指令的 PC + 4
    Seq(
      isTlbExcp    -> io.redirectAddrFromCsr.tlbrentry, // TLB重填异常入口
      isNormalExcp -> io.redirectAddrFromCsr.eentry,    // 普通异常入口
      isErtnExcp   -> io.redirectAddrFromCsr.era     // ERTN返回入口 
    )
  )

 
  // ================================================================
  //  统一重定向输出
  //    BRU：s_bru_redirect 周期发出
  //    ROB：rollbackDone 周期发出
  // ================================================================
  val bruRedirecting = (state === s_bru_redirect)
  val robRedirecting = (state === s_rob_flush)
 
  io.redirectInfo.valid               := bruRedirecting || robRedirecting
  io.redirectInfo.bits.doRedirect     := Mux(bruRedirecting, bruReg.bits.doRedirect, robRedirecting)
  io.redirectInfo.bits.flushSelf      := Mux(bruRedirecting, false.B, robInfoIsException)
  io.redirectInfo.bits.fromBru        := bruRedirecting
  io.redirectInfo.bits.snptId         := bruReg.bits.snptId
  io.redirectInfo.bits.robIdx         := Mux(bruRedirecting, bruReg.bits.robIdx, robInfoRobIdx)
  io.redirectInfo.bits.invalidIcache  := Mux(bruRedirecting, false.B, robInfoInvalidIcache)
  io.redirectInfo.bits.fromRob        := robRedirecting
  io.redirectInfo.bits.target         := Mux(bruRedirecting, bruReg.bits.target, robTarget)

  // ================================================================
  //  Rename 恢复
  // ================================================================
  // io.doRecover      := robRedirecting
  // io.recoverSnptId  := bruReg.bits.snptId
 
  // ================================================================
  //  CSR 异常写入
  // ================================================================
  val commitException = io.robRedirect.valid && io.robRedirect.isException
  val commitHasErtnBit = io.robRedirect.excp.has(ERTN)
  val commitIsPureErtn = io.robRedirect.excp.excpVec === (1.U << ExcType.ERTN.id).asUInt
  val commitIsErtnExcp = commitException && commitHasErtnBit && commitIsPureErtn
  io.excpEvent.excp := commitException && !commitIsErtnExcp
  io.excpEvent.ertn := commitIsErtnExcp
  io.excpEvent.badvWrite := commitException && io.robRedirect.excp.needsBadvWrite
  io.excpEvent.tlbehiWrite := commitException && io.robRedirect.excp.needsTlbehiWrite
  io.excpEvent.tlbRefill := commitException && io.robRedirect.excp.isTlbRefill

// io.csrExcpVec   := io.robRedirect.excp
// io.csrExcpPc    := io.robRedirect.pc

  val exceptionVaddr = io.robRedirect.excp.badvSelect(
  io.robRedirect.pc, io.robRedirect.excpVaddr)
  io.excpInfo.era := io.robRedirect.pc
  io.excpInfo.ecode := io.robRedirect.excp.ecode
  io.excpInfo.esubcode := io.robRedirect.excp.esubcode
  io.excpInfo.badVaddr := exceptionVaddr
  io.excpInfo.vppn     := exceptionVaddr(31, 13)


}
