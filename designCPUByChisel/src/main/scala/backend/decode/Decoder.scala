package nscscc.backend.decode

import chisel3._
import chisel3.util._
import nscscc.config.{NSBundle, NSModule, Parameters, ExceptionBundle}
import nscscc.frontend.CtrlFlowIO
import firrtl.PrimOps.Div
import nscscc.config.ExcType._
object DecodeTable {
  private val y = 1.U(1.W)
  private val n = 0.U(1.W)

  val default: List[UInt] = List( 
    n, FuType.none,  //非法指令默认走CSR单元
    AluOp.add, BruOp.none, LsuOp.none, CsrOp.none, MulOp.none, DivOp.none,
    SrcType.none, SrcType.none, ImmType.none,
    n, n, n, n, n, n, n, y
  )

  private def ctrl(
    fuType: UInt = FuType.none, //异常非法指令默认走CSR单元
    aluOp: UInt = AluOp.add,
    bruOp: UInt = BruOp.none,
    lsuOp: UInt = LsuOp.none,
    csrOp: UInt = CsrOp.none,
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
    isPriv: UInt = n
  ): List[UInt] = List(
    y, fuType, aluOp, bruOp, lsuOp, csrOp, mulOp, divOp,
    src1Type, src2Type, immType,
    rfWen, memRead, memWrite, csrWen, isBranch, isJump, isPriv, n
  )

  val table: Array[(BitPat, List[UInt])] = Array(
    BitPat("b00000000000100000???????????????") -> ctrl(FuType.alu, aluOp = AluOp.add),
    BitPat("b00000000000100010???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sub),
    BitPat("b00000000000100100???????????????") -> ctrl(FuType.alu, aluOp = AluOp.slt),
    BitPat("b00000000000100101???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sltu),
    BitPat("b00000000000101000???????????????") -> ctrl(FuType.alu, aluOp = AluOp.nor),
    BitPat("b00000000000101001???????????????") -> ctrl(FuType.alu, aluOp = AluOp.and),
    BitPat("b00000000000101010???????????????") -> ctrl(FuType.alu, aluOp = AluOp.or),
    BitPat("b00000000000101011???????????????") -> ctrl(FuType.alu, aluOp = AluOp.xor),
    BitPat("b00000000000101110???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sll),
    BitPat("b00000000000101111???????????????") -> ctrl(FuType.alu, aluOp = AluOp.srl),
    BitPat("b00000000000110000???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sra),

    BitPat("b00000000000111000???????????????") -> ctrl(FuType.mul, mulOp = MulOp.mul),
    BitPat("b00000000000111001???????????????") -> ctrl(FuType.mul, mulOp = MulOp.mulh),
    BitPat("b00000000000111010???????????????") -> ctrl(FuType.mul, mulOp = MulOp.mulhu),
    BitPat("b00000000001000000???????????????") -> ctrl(FuType.div, divOp = DivOp.div),
    BitPat("b00000000001000001???????????????") -> ctrl(FuType.div, divOp = DivOp.mod),
    BitPat("b00000000001000010???????????????") -> ctrl(FuType.div, divOp = DivOp.divu),
    BitPat("b00000000001000011???????????????") -> ctrl(FuType.div, divOp = DivOp.modu),

    BitPat("b00000000010000001???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sll, src2Type = SrcType.imm, immType = ImmType.ui5),
    BitPat("b00000000010001001???????????????") -> ctrl(FuType.alu, aluOp = AluOp.srl, src2Type = SrcType.imm, immType = ImmType.ui5),
    BitPat("b00000000010010001???????????????") -> ctrl(FuType.alu, aluOp = AluOp.sra, src2Type = SrcType.imm, immType = ImmType.ui5),

    BitPat("b0000001000??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.slt, src2Type = SrcType.imm, immType = ImmType.si12),
    BitPat("b0000001001??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.sltu, src2Type = SrcType.imm, immType = ImmType.si12),
    BitPat("b0000001010??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.add, src2Type = SrcType.imm, immType = ImmType.si12),
    BitPat("b0000001101??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.and, src2Type = SrcType.imm, immType = ImmType.ui12),
    BitPat("b0000001110??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.or, src2Type = SrcType.imm, immType = ImmType.ui12),
    BitPat("b0000001111??????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.xor, src2Type = SrcType.imm, immType = ImmType.ui12),
    BitPat("b0001010?????????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.pass2, src1Type = SrcType.zero, src2Type = SrcType.imm, immType = ImmType.si20),
    BitPat("b0001110?????????????????????????") -> ctrl(FuType.alu, aluOp = AluOp.add, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si20),

    BitPat("b0010100000??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldb, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    BitPat("b0010100001??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldh, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    BitPat("b0010100010??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldw, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    BitPat("b0010100100??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.stb, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    BitPat("b0010100101??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.sth, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    BitPat("b0010100110??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.stw, src2Type = SrcType.imm, immType = ImmType.si12, rfWen = n, memWrite = y),
    BitPat("b0010101000??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldbu, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),
    BitPat("b0010101001??????????????????????") -> ctrl(FuType.lsu, aluOp = AluOp.add, lsuOp = LsuOp.ldhu, src2Type = SrcType.imm, immType = ImmType.si12, memRead = y),

    BitPat("b010011??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.jirl, src1Type = SrcType.reg, src2Type = SrcType.imm, immType = ImmType.si16, isJump = y),
    BitPat("b010100??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.b, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si26, rfWen = n, isBranch = y),
    BitPat("b010101??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.bl, src1Type = SrcType.pc, src2Type = SrcType.imm, immType = ImmType.si26, isJump = y),
    BitPat("b010110??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.beq, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BitPat("b010111??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.bne, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BitPat("b011000??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.blt, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BitPat("b011001??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.bge, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BitPat("b011010??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.bltu, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),
    BitPat("b011011??????????????????????????") -> ctrl(FuType.bru, bruOp = BruOp.bgeu, src1Type = SrcType.reg, src2Type = SrcType.reg, immType = ImmType.si16, rfWen = n, isBranch = y),

    BitPat("b00000100??????????????00000?????") -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.read, src1Type = SrcType.zero, src2Type = SrcType.none, csrWen = n), //CSR RD
    BitPat("b00000100??????????????00001?????") -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.write, src1Type = SrcType.reg, src2Type = SrcType.none, csrWen = y), // CSR WR
    BitPat("b00000100????????????????????????") -> ctrl(FuType.csr, rfWen = y, csrOp = CsrOp.xchg, src1Type = SrcType.reg, src2Type = SrcType.reg, csrWen = y),// CSR CHANGE

    BitPat("b00000000001010100???????????????") -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    BitPat("b00000000001010110???????????????") -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    BitPat("b00000110010010000011100000000000") -> ctrl(FuType.priv, rfWen = n, isPriv = y)
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
  val isSys  = inst(31,15) === "h56".U
  val isBrk  = inst(31,15) === "h54".U
  val isErtn = inst === "h06483800".U

  // ===========================================================
  // 3. 查表解码 (修正索引错位，严格对齐 18 元素列表)
  // ===========================================================
  val decoded = ListLookup(inst, DecodeTable.default, DecodeTable.table)
  
  val isInstValid = decoded(0).asBool // 原始 table 中的第 0 位 valid
  val fuType   = decoded(1)
  val aluOp    = decoded(2)
  val bruOp    = decoded(3)
  val lsuOp    = decoded(4)
  val csrOp    = decoded(5)
  val mulOp = decoded(6)
  val divOp = decoded(7)
  val src1Type = decoded(8)
  val src2Type = decoded(9)
  val immType  = decoded(10)           // 恢复为 4-bit 的 immType
  val rfWen    = decoded(11).asBool   // 恢复为 1-bit 的 rfWen
  val memRead  = decoded(12).asBool
  val memWrite = decoded(13).asBool
  val csrWen   = decoded(14).asBool
  val isBranch = decoded(15).asBool
  val isJump   = decoded(16).asBool
  val isPriv   = decoded(17).asBool
  val isIllegalBase = decoded(18).asBool // 原默认列表的最后一项

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
  val isIllegal = isIllegalBase && !isSys && !isBrk && !isErtn
  
//  val currentExcpVec = Cat(
//    isIllegal,          // [9] INE
//    excp.excpAdef,      // [8] ADEF
//    isBrk,              // [7] BRK
//    isSys,              // [6] SYS
//    excp.excpTlbPpi,    // [5] PPI
//    false.B,            // [4] PME
//    excp.excpTlbPif,    // [3] PIF
//    false.B,            // [2] PIS
//    excp.excpTlbRefill, // [1] PIL
//    io.extInt           // [0] INT
//  )
  val excpIn = io.inData.exception
  //val excp = Wire(new ExceptionBundle)

  val excp = Wire(new ExceptionBundle)
  excp := 0.U.asTypeOf(new ExceptionBundle)

  val excpI = Wire(new ExceptionBundle)
  excpI := 0.U.asTypeOf(new ExceptionBundle)

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
    io.extInt             -> INT,
    isErtn                -> ERTN
  )

//  when(isIllegal) {
//    excp.excpVec := excp.setOn(excpI.excpVec, INE)
//  }
//  when(excpIn.excpAdef) {
//    excp.excpVec := excp.setOn(excpI.excpVec, ADEF)
//  }
//  when(isBrk) {
//    excp.excpVec := excp.setOn(excpI.excpVec, BRK)
//  }
//  when(isSys) {
//    excp.excpVec := excp.setOn(excpI.excpVec, SYS)
//  }
//  when(excpIn.excpTlbPpi) {
//    excp.excpVec := excp.setOn(excpI.excpVec, PPI_I)
//  }
//  when(excpIn.excpTlbPif) {
//    excp.excpVec := excp.setOn(excpI.excpVec, PIF)
//  }
//  when(excpIn.excpTlbRefill) {
//    excp.excpVec := excp.setOn(excpI.excpVec, TLBR_I)
//  }
//  when(io.extInt) {
//    excp.excpVec := excp.setOn(excpI.excpVec, INT)
//  }
  // ===========================================================
  // 6. 输出一次性全覆盖赋值
  // ===========================================================
  
  io.out.pc         := pc
  io.out.inst       := inst
  io.out.rd         := Mux( bruOp === BruOp.bl, 1.U , rd)
  io.out.rj         := rj
  io.out.rk         := rk
  io.out.rs1        := rj
  io.out.rs2        := Mux(rs2UseRd, rd, rk)
  io.out.rs1Valid   := rs1Valid
  io.out.rs2Valid   := rs2Valid
  io.out.rdValid    := rdValid
  io.out.csrAddress := csrAddress
  io.out.imm        := ImmGen(inst, immType)
  
  io.out.ctrl.fuType   := Mux(isIllegal, FuType.csr, fuType)
  io.out.ctrl.aluOp    := aluOp
  io.out.ctrl.bruOp    := bruOp
  io.out.ctrl.lsuOp    := lsuOp
  io.out.ctrl.csrOp    := csrOp
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
  
  io.out.excp     := excp
  io.out.pdInfo  := io.inData.pdInfo
  io.out.bpuInfo  := io.inData.bpuInfo
}
