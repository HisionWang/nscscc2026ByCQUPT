package nscscc.backend

import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters}
import nscscc.frontend.CtrlFlowIO

object DecodeTable {
  private val y = 1.U(1.W)
  private val n = 0.U(1.W)

  val default: List[UInt] = List(
    n, FuType.none, AluOp.add, BruOp.none, LsuOp.none, CsrOp.none, MulDivOp.none,
    SrcType.none, SrcType.none, ImmType.none,
    n, n, n, n, n, n, y
  )

  private def ctrl(
    fuType: UInt,
    aluOp: UInt = AluOp.add,
    bruOp: UInt = BruOp.none,
    lsuOp: UInt = LsuOp.none,
    csrOp: UInt = CsrOp.none,
    mulDivOp: UInt = MulDivOp.none,
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
    y, fuType, aluOp, bruOp, lsuOp, csrOp, mulDivOp,
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

    BitPat("b00000000000111000???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.mul),
    BitPat("b00000000000111001???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.mulh),
    BitPat("b00000000000111010???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.mulhu),
    BitPat("b00000000001000000???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.div),
    BitPat("b00000000001000001???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.mod),
    BitPat("b00000000001000010???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.divu),
    BitPat("b00000000001000011???????????????") -> ctrl(FuType.mulDiv, mulDivOp = MulDivOp.modu),

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

    BitPat("b00000100??????????????00000?????") -> ctrl(FuType.csr, csrOp = CsrOp.read, src1Type = SrcType.zero, src2Type = SrcType.none),
    BitPat("b00000100??????????????00001?????") -> ctrl(FuType.csr, csrOp = CsrOp.write, src1Type = SrcType.reg, src2Type = SrcType.none, csrWen = y),
    BitPat("b00000100????????????????????????") -> ctrl(FuType.csr, csrOp = CsrOp.xchg, src1Type = SrcType.reg, src2Type = SrcType.reg, csrWen = y),

    BitPat("b00000000001010100???????????????") -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    BitPat("b00000000001010110???????????????") -> ctrl(FuType.priv, rfWen = n, isPriv = y),
    BitPat("b00000110010010000011100000000000") -> ctrl(FuType.priv, rfWen = n, isPriv = y)
  )
}

class Decoder(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val inst  = Input(UInt(32.W))
    val pc    = Input(UInt(XLEN.W))
    val valid = Input(Bool())
    val out   = Output(new DecodedInst)
  })

  val decoded = ListLookup(io.inst, DecodeTable.default, DecodeTable.table)

  io.out.pc      := io.pc
  io.out.inst    := io.inst
  io.out.valid   := io.valid && decoded(0).asBool
  io.out.rd      := io.inst(4, 0)
  io.out.rj      := io.inst(9, 5)
  io.out.rk      := io.inst(14, 10)
  io.out.csrAddress := io.inst(23, 10)
  io.out.imm     := ImmGen(io.inst, decoded(9))

  io.out.ctrl.valid    := io.valid && decoded(0).asBool
  io.out.ctrl.fuType   := decoded(1)
  io.out.ctrl.aluOp    := decoded(2)
  io.out.ctrl.bruOp    := decoded(3)
  io.out.ctrl.lsuOp    := decoded(4)
  io.out.ctrl.csrOp    := decoded(5)
  io.out.ctrl.mulDivOp := decoded(6)
  io.out.ctrl.src1Type := decoded(7)
  io.out.ctrl.src2Type := decoded(8)
  io.out.ctrl.immType  := decoded(9)
  io.out.ctrl.rfWen    := io.valid && decoded(10).asBool
  io.out.ctrl.memRead  := io.valid && decoded(11).asBool
  io.out.ctrl.memWrite := io.valid && decoded(12).asBool
  io.out.ctrl.csrWen   := io.valid && decoded(13).asBool
  io.out.ctrl.isBranch := io.valid && decoded(14).asBool
  io.out.ctrl.isJump   := io.valid && decoded(15).asBool
  io.out.ctrl.isPriv   := io.valid && decoded(16).asBool
  io.out.ctrl.illegal  := false.B//io.valid && decoded(17).asBool
}

class DecodeStage(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    //val in    = Flipped(DecoupledIO(new PredecodeResp))
    val in = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
    
    val out   = DecoupledIO(Vec(CtrlBlockWidth, new DecodedInst))
    val flush = Input(Bool())
  })

  val stageValid = RegInit(false.B)
  val stageData  = Reg(Vec(CtrlBlockWidth, new DecodedInst))

  val inFire  = io.in(0).valid && io.in(0).ready
  val outFire = io.out.valid && io.out.ready

  for (i <- 0 until CtrlBlockWidth) {
    io.in(i).ready  := !stageValid || outFire
  }
  io.out.valid := stageValid
  io.out.bits  := stageData

  val decoded = Wire(Vec(CtrlBlockWidth, new DecodedInst))
  for (i <- 0 until CtrlBlockWidth) {
    val decoder = Module(new Decoder)
    //val laneValid = if (i < fetchWidth) io.in(i).bits.instvalids else false.B
    val laneInst  =  io.in(i).bits.instr
    val lanePc    =  io.in(i).bits.pc

    decoder.io.inst  := laneInst
    decoder.io.pc    := lanePc
    decoder.io.valid := io.in(i).valid
    decoded(i) := decoder.io.out
  }

  when(io.flush) {
    stageValid := false.B
  }.elsewhen(inFire) {
    stageValid := true.B
    stageData  := decoded
  }.elsewhen(outFire) {
    stageValid := false.B
  }

  dontTouch(stageData)
  dontTouch(stageValid)
  
}
