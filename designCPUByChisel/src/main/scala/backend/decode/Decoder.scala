package nscscc.backend.decode

import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters, ExceptionBundle}
import nscscc.config.ExcType._
import nscscc.frontend.CtrlFlowIO

import Instructions._

object DecodeTable {
  private val y = 1.U(1.W)
  private val n = 0.U(1.W)

  val default: List[UInt] = List( 
    n, FuType.none,  //非法指令默认走CSR单元
    AluOp.add, BruOp.none, LsuOp.none, BarOp.none, CsrOp.none, TlbOp.none, MulOp.none, DivOp.none,
    SrcType.none, SrcType.none, ImmType.none,
    n, n, n, n, n, n, n, n, n, n, n, y
  )

  private def ctrl(
    fuType: UInt = FuType.none, //异常非法指令默认走CSR单元
    aluOp: UInt = AluOp.add,
    bruOp: UInt = BruOp.none,
    lsuOp: UInt = LsuOp.none,
    barOp: UInt = BarOp.none,
    csrOp: UInt = CsrOp.none,
    tlbOp: UInt = TlbOp.none,
    mulOp: UInt = MulOp.none,
    divOp: UInt = DivOp.none,
    src1Type: UInt = SrcType.reg,
    src2Type: UInt = SrcType.reg,
    immType: UInt = ImmType.none,
    rfWen: UInt = y,
    memRead: UInt = n,
    memWrite: UInt = n,
    csrWen: UInt = n,
    isBranch: UInt = n,
    isJump: UInt = n,
    isPriv: UInt = n,
    isIdle: UInt = n,
    waitForward: UInt = n,
    blockBackward: UInt = n,
    flushOnCommit: UInt = n
  ): List[UInt] = List(
    y, fuType, aluOp, bruOp, lsuOp, barOp, csrOp, tlbOp, mulOp, divOp,
    src1Type, src2Type, immType,
    rfWen, memRead, memWrite, csrWen, isBranch, isJump, isPriv, isIdle,
    waitForward, blockBackward, flushOnCommit, n
  )

  val table: Array[(BitPat, List[UInt])] = Array(
    ADD_W -> ctrl(FuType.alu, aluOp = AluOp.add),
    SUB_W -> ctrl(FuType.alu, aluOp = AluOp.sub),
    SLT   -> ctrl(FuType.alu, aluOp = AluOp.slt),
    SLTU  -> ctrl(FuType.alu, aluOp = AluOp.sltu),
    NOR   -> ctrl(FuType.alu, aluOp = AluOp.nor),
    AND   -> ctrl(FuType.alu, aluOp = AluOp.and),
    OR    -> ctrl(FuType.alu, aluOp = AluOp.or),
    XOR   -> ctrl(FuType.alu, aluOp = AluOp.xor),
    SLL_W -> ctrl(FuType.alu, aluOp = AluOp.sll),
    SRL_W -> ctrl(FuType.alu, aluOp = AluOp.srl),
    SRA_W -> ctrl(FuType.alu, aluOp = AluOp.sra),

    MUL_W   -> ctrl(FuType.mul, mulOp = MulOp.mul),
    MULH_W  -> ctrl(FuType.mul, mulOp = MulOp.mulh),
    MULH_WU -> ctrl(FuType.mul, mulOp = MulOp.mulhu),
    DIV_W   -> ctrl(FuType.div, divOp = DivOp.div),
    MOD_W   -> ctrl(FuType.div, divOp = DivOp.mod),
    DIV_WU  -> ctrl(FuType.div, divOp = DivOp.divu),
    MOD_WU  -> ctrl(FuType.div, divOp = DivOp.modu),

    SLLI_W -> ctrl(FuType.alu, aluOp = AluOp.sll, src2Type = SrcType.imm, immType = ImmType.ui5),
    SRLI_W -> ctrl(FuType.alu, aluOp = AluOp.srl, src2Type = SrcType.imm, immType = ImmType.ui5),
    SRAI_W -> ctrl(FuType.alu, aluOp = AluOp.sra, src2Type = SrcType.imm, immType = ImmType.ui5),

    SLTI   -> ctrl(FuType.alu, aluOp = AluOp.slt, src2Type = SrcType.imm, immType = ImmType.si12),
    SLTUI  -> ctrl(FuType.alu, aluOp = AluOp.sltu, src2Type = SrcType.imm, immType = ImmType.si12),
    ADDI_W -> ctrl(FuType.alu, aluOp = AluOp.add, src2Type = SrcType.imm, immType = ImmType.si12),
    ANDI   -> ctrl(FuType.alu, aluOp = AluOp.and, src2Type = SrcType.imm, immType = ImmType.ui12),
    ORI    -> ctrl(FuType.alu, aluOp = AluOp.or, src2Type = SrcType.imm, immType = ImmType.ui12),
    XORI   -> ctrl(FuType.alu, aluOp = AluOp.xor, src2Type = SrcType.imm, immType = ImmType.ui12),
    LU12I_W   -> ctrl(FuType.alu, aluOp = AluOp.pass2, src1Type = SrcType.zero, src2Type = SrcType.imm, immType = ImmType.si20),
    PCADDU12I -> ctrl(FuType.alu, aluOp = AluOp.add, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si20),

    LD_B  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldb, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    LD_H  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldh, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    LD_W  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldw, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    ST_B  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.stb, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    ST_H  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.sth, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    ST_W  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.stw, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    LD_BU -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldbu, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    LD_HU -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldhu, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    LL_W  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.llw,
      src2Type = SrcType.imm, immType = ImmType.si14, memRead = y,
      waitForward = y, blockBackward = y,
      flushOnCommit = y),
    SC_W  -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.scw,
      src2Type = SrcType.imm, immType = ImmType.si14, memWrite = y,
      waitForward = y, blockBackward = y,
      flushOnCommit = y),

    // 只计算地址，不分配LSQ，不执行, 无异常
    PRELD -> ctrl(FuType.alu, aluOp = AluOp.add, src2Type = SrcType.imm,
      immType = ImmType.si12, rfWen = n),
    DBAR -> ctrl(FuType.alu, barOp = BarOp.dbar,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, flushOnCommit = y),
    IBAR -> ctrl(FuType.alu, barOp = BarOp.ibar,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, waitForward = y, blockBackward = y,
      flushOnCommit = y),

    JIRL -> ctrl(FuType.bru, bruOp = BruOp.jirl, src1Type = SrcType.reg, src2Type = SrcType.imm, immType = ImmType.si16, isJump = y),
    B    -> ctrl(FuType.bru, bruOp = BruOp.b, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si26, rfWen = n, isBranch = y),
    BL   -> ctrl(FuType.bru, bruOp = BruOp.bl, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si26, isJump = y),
    BEQ  -> ctrl(FuType.bru, bruOp = BruOp.beq, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BNE  -> ctrl(FuType.bru, bruOp = BruOp.bne, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BLT  -> ctrl(FuType.bru, bruOp = BruOp.blt, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BGE  -> ctrl(FuType.bru, bruOp = BruOp.bge, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BLTU -> ctrl(FuType.bru, bruOp = BruOp.bltu, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BGEU -> ctrl(FuType.bru, bruOp = BruOp.bgeu, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),

    CSRRD   -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.read, src1Type = SrcType.zero, src2Type = SrcType.none, csrWen = n, isPriv = y),
    CSRWR   -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.write, src1Type = SrcType.reg, src2Type = SrcType.none, csrWen = y, isPriv = y),
    CSRXCHG -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.xchg, src1Type = SrcType.reg, src2Type = SrcType.reg, csrWen = y, isPriv = y),
    RDCNTVL_W ->
      ctrl(FuType.csr, csrOp = CsrOp.rdcntvl, src1Type = SrcType.zero, src2Type = SrcType.none),
    RDCNTVH_W ->
      ctrl(FuType.csr, csrOp = CsrOp.rdcntvh, src1Type = SrcType.zero, src2Type = SrcType.none),
    RDCNTID_W ->
      ctrl(FuType.csr, csrOp = CsrOp.rdcntid, src1Type = SrcType.zero, src2Type = SrcType.none, rfWen = y),
    BREAK   -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    SYSCALL -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    I_ERTN  -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    IDLE    -> ctrl(FuType.priv, rfWen = n, isPriv = y, isIdle = y,
      waitForward = y, blockBackward = y, flushOnCommit = y),
    CPUCFG -> ctrl(FuType.csr, csrOp = CsrOp.cpucfg,
       src1Type = SrcType.reg,
       src2Type = SrcType.none,
       rfWen = y, csrWen = n),
    CACOP -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.cacop,
      src1Type = SrcType.reg, src2Type = SrcType.imm,
      immType = ImmType.si12, rfWen = n, memRead = y,
      waitForward = y, blockBackward = y, flushOnCommit = y, isPriv = y),

    TLBSRCH -> ctrl(FuType.priv, tlbOp = TlbOp.search,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, isPriv = y, waitForward = y, blockBackward = y,
      flushOnCommit = y),
    TLBRD -> ctrl(FuType.priv, tlbOp = TlbOp.read,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, isPriv = y, waitForward = y, blockBackward = y,
      flushOnCommit = y),
    TLBWR -> ctrl(FuType.priv, tlbOp = TlbOp.write,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, isPriv = y, waitForward = y, blockBackward = y,
      flushOnCommit = y),
    TLBFILL -> ctrl(FuType.priv, tlbOp = TlbOp.fill,
      src1Type = SrcType.none, src2Type = SrcType.none,
      rfWen = n, isPriv = y, waitForward = y, blockBackward = y,
      flushOnCommit = y),
    INVTLB -> ctrl(FuType.priv, tlbOp = TlbOp.invalidate,
      src1Type = SrcType.reg, src2Type = SrcType.reg,
      rfWen = n, isPriv = y, waitForward = y, blockBackward = y,
      flushOnCommit = y)
  )
}
// 纯组合逻辑解码器模块
class Decoder(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val inData = Input(new CtrlFlowIO)
    val extInt = Input(Bool())
    val out    = Output(new DecodedInst)
  })

  val inst = io.inData.instr
  val pc   = io.inData.pc
  

  // ===========================================================
  // 1. 基础字段提取
  // ===========================================================
  val rd      =  inst(4, 0)
  val rj      = inst(9, 5)
  val rk      = inst(14, 10)
  val csrAddress = inst(23, 10)

  // ===========================================================
  // 2. 特权级/系统异常指令识别
  // ===========================================================
  val isSys  = SYSCALL === inst
  val isBrk  = BREAK === inst
  val isErtn = I_ERTN === inst
  val isCacop = CACOP === inst
  val isInvtlb = INVTLB === inst
  val invtlbOp = inst(InvtlbOp.width - 1, 0)
  val isInvtlbLegal = InvtlbOp.isLegal(invtlbOp, rj, rk)

  // ===========================================================
  // 3. 查表解码 (修正索引错位，严格对齐 18 元素列表)
  // ===========================================================
  val decoded = ListLookup(inst, DecodeTable.default, DecodeTable.table)
  
  val isInstValid = decoded(0).asBool // 原始 table 中的第 0 位 valid
  val fuType   = decoded(1)
  val aluOp    = decoded(2)
  val bruOp    = decoded(3)
  val lsuOp    = decoded(4)
  val barOp    = decoded(5)
  val csrOp    = decoded(6)
  val tlbOp    = decoded(7)
  val mulOp = decoded(8)
  val divOp = decoded(9)
  val src1Type = decoded(10)
  val src2Type = decoded(11)
  val immType  = decoded(12)
  val rfWen    = decoded(13).asBool
  val memRead  = decoded(14).asBool
  val memWrite = decoded(15).asBool
  val csrWen   = decoded(16).asBool
  val isBranch = decoded(17).asBool
  val isJump   = decoded(18).asBool
  val isPriv   = decoded(19).asBool
  val isIdle   = decoded(20).asBool
  val waitForward = decoded(21).asBool
  val blockBackward = decoded(22).asBool
  val flushOnCommit = decoded(23).asBool
  val isIllegalBase = decoded(24).asBool

  // ===========================================================
  // 4. 有效寄存器计算
  // ===========================================================
  val rs2UseRd = memWrite || io.inData.pdInfo.isBr || csrWen
  
  val rs1Valid = src1Type === SrcType.reg 
  val rs2Valid = src2Type === SrcType.reg || rs2UseRd
  val rdValid  = rfWen

  // ===========================================================
  // 5. 异常向量拼接 (高位在前，ExceptionCode 常量索引)
  // ===========================================================
  val isIllegal = isIllegalBase || (isInvtlb && !isInvtlbLegal)
   //&& !isSys && !isBrk && !isErtn
  

  val excpIn = io.inData.exception
  //val excp = Wire(new ExceptionBundle)

  val excp = Wire(new ExceptionBundle)
  excp := 0.U.asTypeOf(new ExceptionBundle)

  val excpI = Wire(new ExceptionBundle)
  excpI := 0.U.asTypeOf(new ExceptionBundle)
  val hasInt = io.extInt && !csrWen
  excp.excpVec := excp.mergeMany(
    base = excpI.excpVec,
    isIllegal             -> INE,
    excpIn.excpAdef       -> ADEF,
    isBrk                 -> BRK,
    isSys                 -> SYS,
    excpIn.excpTlbPpi     -> PPI_I,
    excpIn.excpTlbPif     -> PIF,
    excpIn.excpTlbRefill  -> TLBR_I,
    //isSys             -> INT,
    hasInt             -> INT,
    isErtn                -> ERTN
  )

  // ===========================================================
  // 6. 输出一次性全覆盖赋值
  // ===========================================================
  
  io.out.pc         := pc
  io.out.inst       := inst
  io.out.rd         := Mux( bruOp === BruOp.bl, 1.U ,
                          Mux( fuType === FuType.csr && csrOp === CsrOp.rdcntid, rj, rd ))
  io.out.rj         := rj
  io.out.rk         := rk
  io.out.rs1        := rj
  io.out.rs2        := Mux(rs2UseRd, rd, rk)
  io.out.rs1Valid   := rs1Valid
  io.out.rs2Valid   := rs2Valid
  io.out.rdValid    := rdValid
  io.out.csrAddress := csrAddress
  io.out.imm        := ImmGen(inst, immType)
  io.out.cacop.valid     := isCacop && !isIllegal
  io.out.cacop.code      := Mux(isCacop, inst(4, 0), 0.U)
  io.out.cacop.cacheType := Mux(isCacop, CacopCode.cacheType(inst), 0.U)
  io.out.cacop.operation := Mux(isCacop, CacopCode.operation(inst), 0.U)
  
  io.out.ctrl.fuType   := Mux(isIllegal, FuType.csr, fuType)
  io.out.ctrl.aluOp    := aluOp
  io.out.ctrl.bruOp    := bruOp
  io.out.ctrl.lsuOp    := lsuOp
  io.out.ctrl.barOp    := barOp
  io.out.ctrl.csrOp    := csrOp
  io.out.ctrl.tlbOp    := Mux(isIllegal, TlbOp.none, tlbOp)
  io.out.ctrl.mulOp := mulOp
  io.out.ctrl.divOp := divOp
  io.out.ctrl.src1Type := src1Type
  io.out.ctrl.src2Type := src2Type
  io.out.ctrl.immType  := immType
  io.out.ctrl.rfWen    := rfWen
  io.out.ctrl.memRead  := memRead
  io.out.ctrl.memWrite := memWrite
 // io.out.ctrl.rs2UseRd := rs2UseRd
  io.out.ctrl.csrWen   := csrWen
  io.out.ctrl.isBranch := isBranch
  io.out.ctrl.isJump   := isJump
  io.out.ctrl.isPriv   := isPriv
  io.out.ctrl.isIdle   := isIdle && !isIllegal
  io.out.ctrl.waitForward := waitForward && !isIllegal
  io.out.ctrl.blockBackward := blockBackward && !isIllegal
  io.out.ctrl.flushOnCommit := flushOnCommit && !isIllegal
  
  io.out.excp     := excp
  io.out.pdInfo  := io.inData.pdInfo
  io.out.bpuInfo  := io.inData.bpuInfo
}
