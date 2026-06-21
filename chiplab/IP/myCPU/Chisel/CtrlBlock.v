module CtrlBlock(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_in_1_ready, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_in_2_ready, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q1IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q1IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q1IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [9:0]  io_q1IQEnq_0_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q1IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [13:0] io_q1IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q1IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q1IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q1IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q1IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q1IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q1IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q1IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q1IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q2IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q2IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q2IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [9:0]  io_q2IQEnq_0_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q2IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [13:0] io_q2IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q2IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q2IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q2IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q2IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q2IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q2IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q2IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q2IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q2IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q3IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q3IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q3IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [9:0]  io_q3IQEnq_0_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q3IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [13:0] io_q3IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q3IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q3IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q3IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q3IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q3IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q3IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q3IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q3IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q3IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q4IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q4IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q4IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [9:0]  io_q4IQEnq_0_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q4IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [13:0] io_q4IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_q4IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q4IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q4IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q4IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q4IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q4IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q4IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_lqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_q4IQEnq_0_bits_sqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [2:0]  io_q4IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q4IQEnq_0_bits_isSta, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q5IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_q5IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q5IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_q5IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [4:0]  io_iqFeedback_q1FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [3:0]  io_iqFeedback_q2FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [4:0]  io_iqFeedback_q3FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [4:0]  io_iqFeedback_q4FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [3:0]  io_iqFeedback_q5FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_lsEnq_req_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_0_bits_isLoad, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_0_bits_isStore, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_0_bits_sqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_0_bits_lqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_lsEnq_req_1_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_1_bits_isLoad, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_1_bits_isStore, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_1_bits_sqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_1_bits_lqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_lsEnq_req_2_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_2_bits_isLoad, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_lsEnq_req_2_bits_isStore, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_2_bits_sqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [3:0]  io_lsEnq_req_2_bits_lqIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_writeback_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [5:0]  io_writeback_0_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_writeback_0_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [9:0]  io_writeback_0_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_writeback_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [5:0]  io_writeback_1_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_writeback_1_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [9:0]  io_writeback_1_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_writeback_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [5:0]  io_writeback_2_bits_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [31:0] io_writeback_2_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [9:0]  io_writeback_2_bits_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_valid_0, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_valid_1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_valid_2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_0_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_0_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_0_wrdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_0_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_commit_bits_0_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_bits_0_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_1_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_1_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_1_wrdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_1_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_commit_bits_1_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_bits_1_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_2_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_2_pc, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [31:0] io_commit_bits_2_wrdata, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_commit_bits_2_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [4:0]  io_commit_bits_2_ldst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_bits_2_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_commit_isWalk, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output        io_redirect_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [5:0]  io_redirect_robIdx, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_extInt, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_0, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_1, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_2, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_3, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_4, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_5, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_6, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_7, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_8, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_9, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_10, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_11, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_12, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_13, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_14, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_15, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_16, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_17, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_18, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_19, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_20, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_21, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_22, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_23, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_24, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_25, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_26, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_27, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_28, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_29, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_30, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  output [6:0]  io_debugArchState_31, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_wakeupPorts_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_wakeupPorts_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input         io_wakeupPorts_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 50:14]
  input  [6:0]  io_wakeupPorts_2_bits_pdst // @[src/main/scala/backend/CtrlBlock.scala 50:14]
);
  wire  decodeStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_0_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_1_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_2_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [13:0] decodeStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [9:0] decodeStage_io_out_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [13:0] decodeStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [9:0] decodeStage_io_out_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [13:0] decodeStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [9:0] decodeStage_io_out_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [31:0] decodeStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire [4:0] decodeStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_extInt; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  decodeStage_io_flush; // @[src/main/scala/backend/CtrlBlock.scala 55:27]
  wire  renameStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_in_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_in_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_in_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_in_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_in_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_in_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_out_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [5:0] renameStage_io_out_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_out_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [5:0] renameStage_io_out_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [9:0] renameStage_io_out_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [13:0] renameStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [31:0] renameStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_out_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_out_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [5:0] renameStage_io_out_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_commit_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_commit_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_commit_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_commit_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [4:0] renameStage_io_commit_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_commit_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_commit_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  renameStage_io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [5:0] renameStage_io_redirect_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_0; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_1; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_2; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_3; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_4; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_5; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_6; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_7; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_8; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_9; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_10; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_11; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_12; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_13; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_14; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_15; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_16; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_17; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_18; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_19; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_20; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_21; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_22; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_23; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_24; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_25; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_26; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_27; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_28; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_29; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_30; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire [6:0] renameStage_io_debugArchState_31; // @[src/main/scala/backend/CtrlBlock.scala 63:27]
  wire  dispatchStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_in_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_in_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_in_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_in_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_in_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_in_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_in_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_in_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_in_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_in_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_in_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_in_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [13:0] dispatchStage_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q5IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_lsEnq_req_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_0_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_0_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_0_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_0_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_lsEnq_req_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_1_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_1_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_1_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_1_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [5:0] dispatchStage_io_lsEnq_req_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_2_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_lsEnq_req_2_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_2_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_lsEnq_req_2_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_robEnq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_robEnq_bits_0_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_robEnq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_robEnq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_robEnq_bits_1_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_robEnq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [31:0] dispatchStage_io_robEnq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_robEnq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [4:0] dispatchStage_io_robEnq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [9:0] dispatchStage_io_robEnq_bits_2_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [3:0] dispatchStage_io_robEnq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_robEnq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_wakeupPorts_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_wakeupPorts_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  dispatchStage_io_wakeupPorts_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire [6:0] dispatchStage_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 74:29]
  wire  rob_clock; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_reset; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_flush; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_enq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_enq_bits_0_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [3:0] rob_io_enq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_enq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_enq_bits_1_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [3:0] rob_io_enq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_enq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_enq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_enq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_enq_bits_2_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [3:0] rob_io_enq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_enq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_0_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_commit_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_1_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_commit_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_commit_bits_2_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [6:0] rob_io_commit_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [4:0] rob_io_commit_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_commit_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [5:0] rob_io_redirect_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_writeback_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [5:0] rob_io_writeback_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_writeback_0_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_writeback_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_writeback_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [5:0] rob_io_writeback_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_writeback_1_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_writeback_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire  rob_io_writeback_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [5:0] rob_io_writeback_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [31:0] rob_io_writeback_2_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  wire [9:0] rob_io_writeback_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 95:19]
  DecodeStage decodeStage ( // @[src/main/scala/backend/CtrlBlock.scala 55:27]
    .clock(decodeStage_clock),
    .reset(decodeStage_reset),
    .io_in_0_ready(decodeStage_io_in_0_ready),
    .io_in_0_valid(decodeStage_io_in_0_valid),
    .io_in_0_bits_instr(decodeStage_io_in_0_bits_instr),
    .io_in_0_bits_pc(decodeStage_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(decodeStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(decodeStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(decodeStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(decodeStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(decodeStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(decodeStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(decodeStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_exception_excpTlbRefill(decodeStage_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(decodeStage_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(decodeStage_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(decodeStage_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(decodeStage_io_in_1_ready),
    .io_in_1_valid(decodeStage_io_in_1_valid),
    .io_in_1_bits_instr(decodeStage_io_in_1_bits_instr),
    .io_in_1_bits_pc(decodeStage_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(decodeStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(decodeStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(decodeStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(decodeStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(decodeStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(decodeStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(decodeStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_exception_excpTlbRefill(decodeStage_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(decodeStage_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(decodeStage_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(decodeStage_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(decodeStage_io_in_2_ready),
    .io_in_2_valid(decodeStage_io_in_2_valid),
    .io_in_2_bits_instr(decodeStage_io_in_2_bits_instr),
    .io_in_2_bits_pc(decodeStage_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(decodeStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(decodeStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(decodeStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(decodeStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(decodeStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(decodeStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(decodeStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_exception_excpTlbRefill(decodeStage_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(decodeStage_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(decodeStage_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(decodeStage_io_in_2_bits_exception_excpAdef),
    .io_out_0_ready(decodeStage_io_out_0_ready),
    .io_out_0_valid(decodeStage_io_out_0_valid),
    .io_out_0_bits_pc(decodeStage_io_out_0_bits_pc),
    .io_out_0_bits_inst(decodeStage_io_out_0_bits_inst),
    .io_out_0_bits_rd(decodeStage_io_out_0_bits_rd),
    .io_out_0_bits_rj(decodeStage_io_out_0_bits_rj),
    .io_out_0_bits_rk(decodeStage_io_out_0_bits_rk),
    .io_out_0_bits_rs1(decodeStage_io_out_0_bits_rs1),
    .io_out_0_bits_rs2(decodeStage_io_out_0_bits_rs2),
    .io_out_0_bits_rs1Valid(decodeStage_io_out_0_bits_rs1Valid),
    .io_out_0_bits_rs2Valid(decodeStage_io_out_0_bits_rs2Valid),
    .io_out_0_bits_rdValid(decodeStage_io_out_0_bits_rdValid),
    .io_out_0_bits_csrAddress(decodeStage_io_out_0_bits_csrAddress),
    .io_out_0_bits_imm(decodeStage_io_out_0_bits_imm),
    .io_out_0_bits_ctrl_fuType(decodeStage_io_out_0_bits_ctrl_fuType),
    .io_out_0_bits_ctrl_aluOp(decodeStage_io_out_0_bits_ctrl_aluOp),
    .io_out_0_bits_ctrl_bruOp(decodeStage_io_out_0_bits_ctrl_bruOp),
    .io_out_0_bits_ctrl_lsuOp(decodeStage_io_out_0_bits_ctrl_lsuOp),
    .io_out_0_bits_ctrl_csrOp(decodeStage_io_out_0_bits_ctrl_csrOp),
    .io_out_0_bits_ctrl_mulOp(decodeStage_io_out_0_bits_ctrl_mulOp),
    .io_out_0_bits_ctrl_divOp(decodeStage_io_out_0_bits_ctrl_divOp),
    .io_out_0_bits_ctrl_src1Type(decodeStage_io_out_0_bits_ctrl_src1Type),
    .io_out_0_bits_ctrl_src2Type(decodeStage_io_out_0_bits_ctrl_src2Type),
    .io_out_0_bits_ctrl_immType(decodeStage_io_out_0_bits_ctrl_immType),
    .io_out_0_bits_ctrl_rfWen(decodeStage_io_out_0_bits_ctrl_rfWen),
    .io_out_0_bits_ctrl_memRead(decodeStage_io_out_0_bits_ctrl_memRead),
    .io_out_0_bits_ctrl_memWrite(decodeStage_io_out_0_bits_ctrl_memWrite),
    .io_out_0_bits_ctrl_csrWen(decodeStage_io_out_0_bits_ctrl_csrWen),
    .io_out_0_bits_ctrl_isBranch(decodeStage_io_out_0_bits_ctrl_isBranch),
    .io_out_0_bits_ctrl_isJump(decodeStage_io_out_0_bits_ctrl_isJump),
    .io_out_0_bits_ctrl_isPriv(decodeStage_io_out_0_bits_ctrl_isPriv),
    .io_out_0_bits_excpVec(decodeStage_io_out_0_bits_excpVec),
    .io_out_0_bits_pdInfo_valid(decodeStage_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(decodeStage_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(decodeStage_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(decodeStage_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(decodeStage_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(decodeStage_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(decodeStage_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_1_ready(decodeStage_io_out_1_ready),
    .io_out_1_valid(decodeStage_io_out_1_valid),
    .io_out_1_bits_pc(decodeStage_io_out_1_bits_pc),
    .io_out_1_bits_inst(decodeStage_io_out_1_bits_inst),
    .io_out_1_bits_rd(decodeStage_io_out_1_bits_rd),
    .io_out_1_bits_rj(decodeStage_io_out_1_bits_rj),
    .io_out_1_bits_rk(decodeStage_io_out_1_bits_rk),
    .io_out_1_bits_rs1(decodeStage_io_out_1_bits_rs1),
    .io_out_1_bits_rs2(decodeStage_io_out_1_bits_rs2),
    .io_out_1_bits_rs1Valid(decodeStage_io_out_1_bits_rs1Valid),
    .io_out_1_bits_rs2Valid(decodeStage_io_out_1_bits_rs2Valid),
    .io_out_1_bits_rdValid(decodeStage_io_out_1_bits_rdValid),
    .io_out_1_bits_csrAddress(decodeStage_io_out_1_bits_csrAddress),
    .io_out_1_bits_imm(decodeStage_io_out_1_bits_imm),
    .io_out_1_bits_ctrl_fuType(decodeStage_io_out_1_bits_ctrl_fuType),
    .io_out_1_bits_ctrl_aluOp(decodeStage_io_out_1_bits_ctrl_aluOp),
    .io_out_1_bits_ctrl_bruOp(decodeStage_io_out_1_bits_ctrl_bruOp),
    .io_out_1_bits_ctrl_lsuOp(decodeStage_io_out_1_bits_ctrl_lsuOp),
    .io_out_1_bits_ctrl_csrOp(decodeStage_io_out_1_bits_ctrl_csrOp),
    .io_out_1_bits_ctrl_mulOp(decodeStage_io_out_1_bits_ctrl_mulOp),
    .io_out_1_bits_ctrl_divOp(decodeStage_io_out_1_bits_ctrl_divOp),
    .io_out_1_bits_ctrl_src1Type(decodeStage_io_out_1_bits_ctrl_src1Type),
    .io_out_1_bits_ctrl_src2Type(decodeStage_io_out_1_bits_ctrl_src2Type),
    .io_out_1_bits_ctrl_immType(decodeStage_io_out_1_bits_ctrl_immType),
    .io_out_1_bits_ctrl_rfWen(decodeStage_io_out_1_bits_ctrl_rfWen),
    .io_out_1_bits_ctrl_memRead(decodeStage_io_out_1_bits_ctrl_memRead),
    .io_out_1_bits_ctrl_memWrite(decodeStage_io_out_1_bits_ctrl_memWrite),
    .io_out_1_bits_ctrl_csrWen(decodeStage_io_out_1_bits_ctrl_csrWen),
    .io_out_1_bits_ctrl_isBranch(decodeStage_io_out_1_bits_ctrl_isBranch),
    .io_out_1_bits_ctrl_isJump(decodeStage_io_out_1_bits_ctrl_isJump),
    .io_out_1_bits_ctrl_isPriv(decodeStage_io_out_1_bits_ctrl_isPriv),
    .io_out_1_bits_excpVec(decodeStage_io_out_1_bits_excpVec),
    .io_out_1_bits_pdInfo_valid(decodeStage_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(decodeStage_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(decodeStage_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(decodeStage_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(decodeStage_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(decodeStage_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(decodeStage_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_2_ready(decodeStage_io_out_2_ready),
    .io_out_2_valid(decodeStage_io_out_2_valid),
    .io_out_2_bits_pc(decodeStage_io_out_2_bits_pc),
    .io_out_2_bits_inst(decodeStage_io_out_2_bits_inst),
    .io_out_2_bits_rd(decodeStage_io_out_2_bits_rd),
    .io_out_2_bits_rj(decodeStage_io_out_2_bits_rj),
    .io_out_2_bits_rk(decodeStage_io_out_2_bits_rk),
    .io_out_2_bits_rs1(decodeStage_io_out_2_bits_rs1),
    .io_out_2_bits_rs2(decodeStage_io_out_2_bits_rs2),
    .io_out_2_bits_rs1Valid(decodeStage_io_out_2_bits_rs1Valid),
    .io_out_2_bits_rs2Valid(decodeStage_io_out_2_bits_rs2Valid),
    .io_out_2_bits_rdValid(decodeStage_io_out_2_bits_rdValid),
    .io_out_2_bits_csrAddress(decodeStage_io_out_2_bits_csrAddress),
    .io_out_2_bits_imm(decodeStage_io_out_2_bits_imm),
    .io_out_2_bits_ctrl_fuType(decodeStage_io_out_2_bits_ctrl_fuType),
    .io_out_2_bits_ctrl_aluOp(decodeStage_io_out_2_bits_ctrl_aluOp),
    .io_out_2_bits_ctrl_bruOp(decodeStage_io_out_2_bits_ctrl_bruOp),
    .io_out_2_bits_ctrl_lsuOp(decodeStage_io_out_2_bits_ctrl_lsuOp),
    .io_out_2_bits_ctrl_csrOp(decodeStage_io_out_2_bits_ctrl_csrOp),
    .io_out_2_bits_ctrl_mulOp(decodeStage_io_out_2_bits_ctrl_mulOp),
    .io_out_2_bits_ctrl_divOp(decodeStage_io_out_2_bits_ctrl_divOp),
    .io_out_2_bits_ctrl_src1Type(decodeStage_io_out_2_bits_ctrl_src1Type),
    .io_out_2_bits_ctrl_src2Type(decodeStage_io_out_2_bits_ctrl_src2Type),
    .io_out_2_bits_ctrl_immType(decodeStage_io_out_2_bits_ctrl_immType),
    .io_out_2_bits_ctrl_rfWen(decodeStage_io_out_2_bits_ctrl_rfWen),
    .io_out_2_bits_ctrl_memRead(decodeStage_io_out_2_bits_ctrl_memRead),
    .io_out_2_bits_ctrl_memWrite(decodeStage_io_out_2_bits_ctrl_memWrite),
    .io_out_2_bits_ctrl_csrWen(decodeStage_io_out_2_bits_ctrl_csrWen),
    .io_out_2_bits_ctrl_isBranch(decodeStage_io_out_2_bits_ctrl_isBranch),
    .io_out_2_bits_ctrl_isJump(decodeStage_io_out_2_bits_ctrl_isJump),
    .io_out_2_bits_ctrl_isPriv(decodeStage_io_out_2_bits_ctrl_isPriv),
    .io_out_2_bits_excpVec(decodeStage_io_out_2_bits_excpVec),
    .io_out_2_bits_pdInfo_valid(decodeStage_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(decodeStage_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(decodeStage_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(decodeStage_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(decodeStage_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(decodeStage_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(decodeStage_io_out_2_bits_pdInfo_jumpTarget),
    .io_ratRead_0_rs1(decodeStage_io_ratRead_0_rs1),
    .io_ratRead_0_rs2(decodeStage_io_ratRead_0_rs2),
    .io_ratRead_0_hold1(decodeStage_io_ratRead_0_hold1),
    .io_ratRead_0_hold2(decodeStage_io_ratRead_0_hold2),
    .io_ratRead_1_rs1(decodeStage_io_ratRead_1_rs1),
    .io_ratRead_1_rs2(decodeStage_io_ratRead_1_rs2),
    .io_ratRead_1_hold1(decodeStage_io_ratRead_1_hold1),
    .io_ratRead_1_hold2(decodeStage_io_ratRead_1_hold2),
    .io_ratRead_2_rs1(decodeStage_io_ratRead_2_rs1),
    .io_ratRead_2_rs2(decodeStage_io_ratRead_2_rs2),
    .io_ratRead_2_hold1(decodeStage_io_ratRead_2_hold1),
    .io_ratRead_2_hold2(decodeStage_io_ratRead_2_hold2),
    .io_extInt(decodeStage_io_extInt),
    .io_flush(decodeStage_io_flush)
  );
  RenameStage renameStage ( // @[src/main/scala/backend/CtrlBlock.scala 63:27]
    .clock(renameStage_clock),
    .reset(renameStage_reset),
    .io_in_0_ready(renameStage_io_in_0_ready),
    .io_in_0_valid(renameStage_io_in_0_valid),
    .io_in_0_bits_pc(renameStage_io_in_0_bits_pc),
    .io_in_0_bits_inst(renameStage_io_in_0_bits_inst),
    .io_in_0_bits_rd(renameStage_io_in_0_bits_rd),
    .io_in_0_bits_rj(renameStage_io_in_0_bits_rj),
    .io_in_0_bits_rk(renameStage_io_in_0_bits_rk),
    .io_in_0_bits_rs1(renameStage_io_in_0_bits_rs1),
    .io_in_0_bits_rs2(renameStage_io_in_0_bits_rs2),
    .io_in_0_bits_rs1Valid(renameStage_io_in_0_bits_rs1Valid),
    .io_in_0_bits_rs2Valid(renameStage_io_in_0_bits_rs2Valid),
    .io_in_0_bits_rdValid(renameStage_io_in_0_bits_rdValid),
    .io_in_0_bits_csrAddress(renameStage_io_in_0_bits_csrAddress),
    .io_in_0_bits_imm(renameStage_io_in_0_bits_imm),
    .io_in_0_bits_ctrl_fuType(renameStage_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_aluOp(renameStage_io_in_0_bits_ctrl_aluOp),
    .io_in_0_bits_ctrl_bruOp(renameStage_io_in_0_bits_ctrl_bruOp),
    .io_in_0_bits_ctrl_lsuOp(renameStage_io_in_0_bits_ctrl_lsuOp),
    .io_in_0_bits_ctrl_csrOp(renameStage_io_in_0_bits_ctrl_csrOp),
    .io_in_0_bits_ctrl_mulOp(renameStage_io_in_0_bits_ctrl_mulOp),
    .io_in_0_bits_ctrl_divOp(renameStage_io_in_0_bits_ctrl_divOp),
    .io_in_0_bits_ctrl_src1Type(renameStage_io_in_0_bits_ctrl_src1Type),
    .io_in_0_bits_ctrl_src2Type(renameStage_io_in_0_bits_ctrl_src2Type),
    .io_in_0_bits_ctrl_immType(renameStage_io_in_0_bits_ctrl_immType),
    .io_in_0_bits_ctrl_rfWen(renameStage_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_memRead(renameStage_io_in_0_bits_ctrl_memRead),
    .io_in_0_bits_ctrl_memWrite(renameStage_io_in_0_bits_ctrl_memWrite),
    .io_in_0_bits_ctrl_csrWen(renameStage_io_in_0_bits_ctrl_csrWen),
    .io_in_0_bits_ctrl_isBranch(renameStage_io_in_0_bits_ctrl_isBranch),
    .io_in_0_bits_ctrl_isJump(renameStage_io_in_0_bits_ctrl_isJump),
    .io_in_0_bits_ctrl_isPriv(renameStage_io_in_0_bits_ctrl_isPriv),
    .io_in_0_bits_excpVec(renameStage_io_in_0_bits_excpVec),
    .io_in_0_bits_pdInfo_valid(renameStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(renameStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(renameStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(renameStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(renameStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(renameStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(renameStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_1_ready(renameStage_io_in_1_ready),
    .io_in_1_valid(renameStage_io_in_1_valid),
    .io_in_1_bits_pc(renameStage_io_in_1_bits_pc),
    .io_in_1_bits_inst(renameStage_io_in_1_bits_inst),
    .io_in_1_bits_rd(renameStage_io_in_1_bits_rd),
    .io_in_1_bits_rj(renameStage_io_in_1_bits_rj),
    .io_in_1_bits_rk(renameStage_io_in_1_bits_rk),
    .io_in_1_bits_rs1(renameStage_io_in_1_bits_rs1),
    .io_in_1_bits_rs2(renameStage_io_in_1_bits_rs2),
    .io_in_1_bits_rs1Valid(renameStage_io_in_1_bits_rs1Valid),
    .io_in_1_bits_rs2Valid(renameStage_io_in_1_bits_rs2Valid),
    .io_in_1_bits_rdValid(renameStage_io_in_1_bits_rdValid),
    .io_in_1_bits_csrAddress(renameStage_io_in_1_bits_csrAddress),
    .io_in_1_bits_imm(renameStage_io_in_1_bits_imm),
    .io_in_1_bits_ctrl_fuType(renameStage_io_in_1_bits_ctrl_fuType),
    .io_in_1_bits_ctrl_aluOp(renameStage_io_in_1_bits_ctrl_aluOp),
    .io_in_1_bits_ctrl_bruOp(renameStage_io_in_1_bits_ctrl_bruOp),
    .io_in_1_bits_ctrl_lsuOp(renameStage_io_in_1_bits_ctrl_lsuOp),
    .io_in_1_bits_ctrl_csrOp(renameStage_io_in_1_bits_ctrl_csrOp),
    .io_in_1_bits_ctrl_mulOp(renameStage_io_in_1_bits_ctrl_mulOp),
    .io_in_1_bits_ctrl_divOp(renameStage_io_in_1_bits_ctrl_divOp),
    .io_in_1_bits_ctrl_src1Type(renameStage_io_in_1_bits_ctrl_src1Type),
    .io_in_1_bits_ctrl_src2Type(renameStage_io_in_1_bits_ctrl_src2Type),
    .io_in_1_bits_ctrl_immType(renameStage_io_in_1_bits_ctrl_immType),
    .io_in_1_bits_ctrl_rfWen(renameStage_io_in_1_bits_ctrl_rfWen),
    .io_in_1_bits_ctrl_memRead(renameStage_io_in_1_bits_ctrl_memRead),
    .io_in_1_bits_ctrl_memWrite(renameStage_io_in_1_bits_ctrl_memWrite),
    .io_in_1_bits_ctrl_csrWen(renameStage_io_in_1_bits_ctrl_csrWen),
    .io_in_1_bits_ctrl_isBranch(renameStage_io_in_1_bits_ctrl_isBranch),
    .io_in_1_bits_ctrl_isJump(renameStage_io_in_1_bits_ctrl_isJump),
    .io_in_1_bits_ctrl_isPriv(renameStage_io_in_1_bits_ctrl_isPriv),
    .io_in_1_bits_excpVec(renameStage_io_in_1_bits_excpVec),
    .io_in_1_bits_pdInfo_valid(renameStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(renameStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(renameStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(renameStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(renameStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(renameStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(renameStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_2_ready(renameStage_io_in_2_ready),
    .io_in_2_valid(renameStage_io_in_2_valid),
    .io_in_2_bits_pc(renameStage_io_in_2_bits_pc),
    .io_in_2_bits_inst(renameStage_io_in_2_bits_inst),
    .io_in_2_bits_rd(renameStage_io_in_2_bits_rd),
    .io_in_2_bits_rj(renameStage_io_in_2_bits_rj),
    .io_in_2_bits_rk(renameStage_io_in_2_bits_rk),
    .io_in_2_bits_rs1(renameStage_io_in_2_bits_rs1),
    .io_in_2_bits_rs2(renameStage_io_in_2_bits_rs2),
    .io_in_2_bits_rs1Valid(renameStage_io_in_2_bits_rs1Valid),
    .io_in_2_bits_rs2Valid(renameStage_io_in_2_bits_rs2Valid),
    .io_in_2_bits_rdValid(renameStage_io_in_2_bits_rdValid),
    .io_in_2_bits_csrAddress(renameStage_io_in_2_bits_csrAddress),
    .io_in_2_bits_imm(renameStage_io_in_2_bits_imm),
    .io_in_2_bits_ctrl_fuType(renameStage_io_in_2_bits_ctrl_fuType),
    .io_in_2_bits_ctrl_aluOp(renameStage_io_in_2_bits_ctrl_aluOp),
    .io_in_2_bits_ctrl_bruOp(renameStage_io_in_2_bits_ctrl_bruOp),
    .io_in_2_bits_ctrl_lsuOp(renameStage_io_in_2_bits_ctrl_lsuOp),
    .io_in_2_bits_ctrl_csrOp(renameStage_io_in_2_bits_ctrl_csrOp),
    .io_in_2_bits_ctrl_mulOp(renameStage_io_in_2_bits_ctrl_mulOp),
    .io_in_2_bits_ctrl_divOp(renameStage_io_in_2_bits_ctrl_divOp),
    .io_in_2_bits_ctrl_src1Type(renameStage_io_in_2_bits_ctrl_src1Type),
    .io_in_2_bits_ctrl_src2Type(renameStage_io_in_2_bits_ctrl_src2Type),
    .io_in_2_bits_ctrl_immType(renameStage_io_in_2_bits_ctrl_immType),
    .io_in_2_bits_ctrl_rfWen(renameStage_io_in_2_bits_ctrl_rfWen),
    .io_in_2_bits_ctrl_memRead(renameStage_io_in_2_bits_ctrl_memRead),
    .io_in_2_bits_ctrl_memWrite(renameStage_io_in_2_bits_ctrl_memWrite),
    .io_in_2_bits_ctrl_csrWen(renameStage_io_in_2_bits_ctrl_csrWen),
    .io_in_2_bits_ctrl_isBranch(renameStage_io_in_2_bits_ctrl_isBranch),
    .io_in_2_bits_ctrl_isJump(renameStage_io_in_2_bits_ctrl_isJump),
    .io_in_2_bits_ctrl_isPriv(renameStage_io_in_2_bits_ctrl_isPriv),
    .io_in_2_bits_excpVec(renameStage_io_in_2_bits_excpVec),
    .io_in_2_bits_pdInfo_valid(renameStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(renameStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(renameStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(renameStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(renameStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(renameStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(renameStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_ratRead_0_rs1(renameStage_io_ratRead_0_rs1),
    .io_ratRead_0_rs2(renameStage_io_ratRead_0_rs2),
    .io_ratRead_0_hold1(renameStage_io_ratRead_0_hold1),
    .io_ratRead_0_hold2(renameStage_io_ratRead_0_hold2),
    .io_ratRead_1_rs1(renameStage_io_ratRead_1_rs1),
    .io_ratRead_1_rs2(renameStage_io_ratRead_1_rs2),
    .io_ratRead_1_hold1(renameStage_io_ratRead_1_hold1),
    .io_ratRead_1_hold2(renameStage_io_ratRead_1_hold2),
    .io_ratRead_2_rs1(renameStage_io_ratRead_2_rs1),
    .io_ratRead_2_rs2(renameStage_io_ratRead_2_rs2),
    .io_ratRead_2_hold1(renameStage_io_ratRead_2_hold1),
    .io_ratRead_2_hold2(renameStage_io_ratRead_2_hold2),
    .io_out_0_ready(renameStage_io_out_0_ready),
    .io_out_0_valid(renameStage_io_out_0_valid),
    .io_out_0_bits_pc(renameStage_io_out_0_bits_pc),
    .io_out_0_bits_inst(renameStage_io_out_0_bits_inst),
    .io_out_0_bits_ctrl_fuType(renameStage_io_out_0_bits_ctrl_fuType),
    .io_out_0_bits_ctrl_aluOp(renameStage_io_out_0_bits_ctrl_aluOp),
    .io_out_0_bits_ctrl_bruOp(renameStage_io_out_0_bits_ctrl_bruOp),
    .io_out_0_bits_ctrl_lsuOp(renameStage_io_out_0_bits_ctrl_lsuOp),
    .io_out_0_bits_ctrl_csrOp(renameStage_io_out_0_bits_ctrl_csrOp),
    .io_out_0_bits_ctrl_mulOp(renameStage_io_out_0_bits_ctrl_mulOp),
    .io_out_0_bits_ctrl_divOp(renameStage_io_out_0_bits_ctrl_divOp),
    .io_out_0_bits_ctrl_src1Type(renameStage_io_out_0_bits_ctrl_src1Type),
    .io_out_0_bits_ctrl_src2Type(renameStage_io_out_0_bits_ctrl_src2Type),
    .io_out_0_bits_ctrl_immType(renameStage_io_out_0_bits_ctrl_immType),
    .io_out_0_bits_ctrl_rfWen(renameStage_io_out_0_bits_ctrl_rfWen),
    .io_out_0_bits_ctrl_memRead(renameStage_io_out_0_bits_ctrl_memRead),
    .io_out_0_bits_ctrl_memWrite(renameStage_io_out_0_bits_ctrl_memWrite),
    .io_out_0_bits_ctrl_csrWen(renameStage_io_out_0_bits_ctrl_csrWen),
    .io_out_0_bits_ctrl_isBranch(renameStage_io_out_0_bits_ctrl_isBranch),
    .io_out_0_bits_ctrl_isJump(renameStage_io_out_0_bits_ctrl_isJump),
    .io_out_0_bits_ctrl_isPriv(renameStage_io_out_0_bits_ctrl_isPriv),
    .io_out_0_bits_excpVec(renameStage_io_out_0_bits_excpVec),
    .io_out_0_bits_imm(renameStage_io_out_0_bits_imm),
    .io_out_0_bits_csrAddress(renameStage_io_out_0_bits_csrAddress),
    .io_out_0_bits_pdInfo_valid(renameStage_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(renameStage_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(renameStage_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(renameStage_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(renameStage_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(renameStage_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(renameStage_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_ldst(renameStage_io_out_0_bits_ldst),
    .io_out_0_bits_lrs1(renameStage_io_out_0_bits_lrs1),
    .io_out_0_bits_lrs2(renameStage_io_out_0_bits_lrs2),
    .io_out_0_bits_pdst(renameStage_io_out_0_bits_pdst),
    .io_out_0_bits_prs1(renameStage_io_out_0_bits_prs1),
    .io_out_0_bits_prs2(renameStage_io_out_0_bits_prs2),
    .io_out_0_bits_oldPdst(renameStage_io_out_0_bits_oldPdst),
    .io_out_0_bits_rs1Valid(renameStage_io_out_0_bits_rs1Valid),
    .io_out_0_bits_rs2Valid(renameStage_io_out_0_bits_rs2Valid),
    .io_out_0_bits_rdValid(renameStage_io_out_0_bits_rdValid),
    .io_out_0_bits_robIdx(renameStage_io_out_0_bits_robIdx),
    .io_out_1_ready(renameStage_io_out_1_ready),
    .io_out_1_valid(renameStage_io_out_1_valid),
    .io_out_1_bits_pc(renameStage_io_out_1_bits_pc),
    .io_out_1_bits_inst(renameStage_io_out_1_bits_inst),
    .io_out_1_bits_ctrl_fuType(renameStage_io_out_1_bits_ctrl_fuType),
    .io_out_1_bits_ctrl_aluOp(renameStage_io_out_1_bits_ctrl_aluOp),
    .io_out_1_bits_ctrl_bruOp(renameStage_io_out_1_bits_ctrl_bruOp),
    .io_out_1_bits_ctrl_lsuOp(renameStage_io_out_1_bits_ctrl_lsuOp),
    .io_out_1_bits_ctrl_csrOp(renameStage_io_out_1_bits_ctrl_csrOp),
    .io_out_1_bits_ctrl_mulOp(renameStage_io_out_1_bits_ctrl_mulOp),
    .io_out_1_bits_ctrl_divOp(renameStage_io_out_1_bits_ctrl_divOp),
    .io_out_1_bits_ctrl_src1Type(renameStage_io_out_1_bits_ctrl_src1Type),
    .io_out_1_bits_ctrl_src2Type(renameStage_io_out_1_bits_ctrl_src2Type),
    .io_out_1_bits_ctrl_immType(renameStage_io_out_1_bits_ctrl_immType),
    .io_out_1_bits_ctrl_rfWen(renameStage_io_out_1_bits_ctrl_rfWen),
    .io_out_1_bits_ctrl_memRead(renameStage_io_out_1_bits_ctrl_memRead),
    .io_out_1_bits_ctrl_memWrite(renameStage_io_out_1_bits_ctrl_memWrite),
    .io_out_1_bits_ctrl_csrWen(renameStage_io_out_1_bits_ctrl_csrWen),
    .io_out_1_bits_ctrl_isBranch(renameStage_io_out_1_bits_ctrl_isBranch),
    .io_out_1_bits_ctrl_isJump(renameStage_io_out_1_bits_ctrl_isJump),
    .io_out_1_bits_ctrl_isPriv(renameStage_io_out_1_bits_ctrl_isPriv),
    .io_out_1_bits_excpVec(renameStage_io_out_1_bits_excpVec),
    .io_out_1_bits_imm(renameStage_io_out_1_bits_imm),
    .io_out_1_bits_csrAddress(renameStage_io_out_1_bits_csrAddress),
    .io_out_1_bits_pdInfo_valid(renameStage_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(renameStage_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(renameStage_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(renameStage_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(renameStage_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(renameStage_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(renameStage_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_ldst(renameStage_io_out_1_bits_ldst),
    .io_out_1_bits_lrs1(renameStage_io_out_1_bits_lrs1),
    .io_out_1_bits_lrs2(renameStage_io_out_1_bits_lrs2),
    .io_out_1_bits_pdst(renameStage_io_out_1_bits_pdst),
    .io_out_1_bits_prs1(renameStage_io_out_1_bits_prs1),
    .io_out_1_bits_prs2(renameStage_io_out_1_bits_prs2),
    .io_out_1_bits_oldPdst(renameStage_io_out_1_bits_oldPdst),
    .io_out_1_bits_rs1Valid(renameStage_io_out_1_bits_rs1Valid),
    .io_out_1_bits_rs2Valid(renameStage_io_out_1_bits_rs2Valid),
    .io_out_1_bits_rdValid(renameStage_io_out_1_bits_rdValid),
    .io_out_1_bits_robIdx(renameStage_io_out_1_bits_robIdx),
    .io_out_2_ready(renameStage_io_out_2_ready),
    .io_out_2_valid(renameStage_io_out_2_valid),
    .io_out_2_bits_pc(renameStage_io_out_2_bits_pc),
    .io_out_2_bits_inst(renameStage_io_out_2_bits_inst),
    .io_out_2_bits_ctrl_fuType(renameStage_io_out_2_bits_ctrl_fuType),
    .io_out_2_bits_ctrl_aluOp(renameStage_io_out_2_bits_ctrl_aluOp),
    .io_out_2_bits_ctrl_bruOp(renameStage_io_out_2_bits_ctrl_bruOp),
    .io_out_2_bits_ctrl_lsuOp(renameStage_io_out_2_bits_ctrl_lsuOp),
    .io_out_2_bits_ctrl_csrOp(renameStage_io_out_2_bits_ctrl_csrOp),
    .io_out_2_bits_ctrl_mulOp(renameStage_io_out_2_bits_ctrl_mulOp),
    .io_out_2_bits_ctrl_divOp(renameStage_io_out_2_bits_ctrl_divOp),
    .io_out_2_bits_ctrl_src1Type(renameStage_io_out_2_bits_ctrl_src1Type),
    .io_out_2_bits_ctrl_src2Type(renameStage_io_out_2_bits_ctrl_src2Type),
    .io_out_2_bits_ctrl_immType(renameStage_io_out_2_bits_ctrl_immType),
    .io_out_2_bits_ctrl_rfWen(renameStage_io_out_2_bits_ctrl_rfWen),
    .io_out_2_bits_ctrl_memRead(renameStage_io_out_2_bits_ctrl_memRead),
    .io_out_2_bits_ctrl_memWrite(renameStage_io_out_2_bits_ctrl_memWrite),
    .io_out_2_bits_ctrl_csrWen(renameStage_io_out_2_bits_ctrl_csrWen),
    .io_out_2_bits_ctrl_isBranch(renameStage_io_out_2_bits_ctrl_isBranch),
    .io_out_2_bits_ctrl_isJump(renameStage_io_out_2_bits_ctrl_isJump),
    .io_out_2_bits_ctrl_isPriv(renameStage_io_out_2_bits_ctrl_isPriv),
    .io_out_2_bits_excpVec(renameStage_io_out_2_bits_excpVec),
    .io_out_2_bits_imm(renameStage_io_out_2_bits_imm),
    .io_out_2_bits_csrAddress(renameStage_io_out_2_bits_csrAddress),
    .io_out_2_bits_pdInfo_valid(renameStage_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(renameStage_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(renameStage_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(renameStage_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(renameStage_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(renameStage_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(renameStage_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_ldst(renameStage_io_out_2_bits_ldst),
    .io_out_2_bits_lrs1(renameStage_io_out_2_bits_lrs1),
    .io_out_2_bits_lrs2(renameStage_io_out_2_bits_lrs2),
    .io_out_2_bits_pdst(renameStage_io_out_2_bits_pdst),
    .io_out_2_bits_prs1(renameStage_io_out_2_bits_prs1),
    .io_out_2_bits_prs2(renameStage_io_out_2_bits_prs2),
    .io_out_2_bits_oldPdst(renameStage_io_out_2_bits_oldPdst),
    .io_out_2_bits_rs1Valid(renameStage_io_out_2_bits_rs1Valid),
    .io_out_2_bits_rs2Valid(renameStage_io_out_2_bits_rs2Valid),
    .io_out_2_bits_rdValid(renameStage_io_out_2_bits_rdValid),
    .io_out_2_bits_robIdx(renameStage_io_out_2_bits_robIdx),
    .io_commit_0_valid(renameStage_io_commit_0_valid),
    .io_commit_0_ldst(renameStage_io_commit_0_ldst),
    .io_commit_0_pdst(renameStage_io_commit_0_pdst),
    .io_commit_0_rfWen(renameStage_io_commit_0_rfWen),
    .io_commit_1_valid(renameStage_io_commit_1_valid),
    .io_commit_1_ldst(renameStage_io_commit_1_ldst),
    .io_commit_1_pdst(renameStage_io_commit_1_pdst),
    .io_commit_1_rfWen(renameStage_io_commit_1_rfWen),
    .io_commit_2_valid(renameStage_io_commit_2_valid),
    .io_commit_2_ldst(renameStage_io_commit_2_ldst),
    .io_commit_2_pdst(renameStage_io_commit_2_pdst),
    .io_commit_2_rfWen(renameStage_io_commit_2_rfWen),
    .io_redirect_valid(renameStage_io_redirect_valid),
    .io_redirect_robIdx(renameStage_io_redirect_robIdx),
    .io_debugArchState_0(renameStage_io_debugArchState_0),
    .io_debugArchState_1(renameStage_io_debugArchState_1),
    .io_debugArchState_2(renameStage_io_debugArchState_2),
    .io_debugArchState_3(renameStage_io_debugArchState_3),
    .io_debugArchState_4(renameStage_io_debugArchState_4),
    .io_debugArchState_5(renameStage_io_debugArchState_5),
    .io_debugArchState_6(renameStage_io_debugArchState_6),
    .io_debugArchState_7(renameStage_io_debugArchState_7),
    .io_debugArchState_8(renameStage_io_debugArchState_8),
    .io_debugArchState_9(renameStage_io_debugArchState_9),
    .io_debugArchState_10(renameStage_io_debugArchState_10),
    .io_debugArchState_11(renameStage_io_debugArchState_11),
    .io_debugArchState_12(renameStage_io_debugArchState_12),
    .io_debugArchState_13(renameStage_io_debugArchState_13),
    .io_debugArchState_14(renameStage_io_debugArchState_14),
    .io_debugArchState_15(renameStage_io_debugArchState_15),
    .io_debugArchState_16(renameStage_io_debugArchState_16),
    .io_debugArchState_17(renameStage_io_debugArchState_17),
    .io_debugArchState_18(renameStage_io_debugArchState_18),
    .io_debugArchState_19(renameStage_io_debugArchState_19),
    .io_debugArchState_20(renameStage_io_debugArchState_20),
    .io_debugArchState_21(renameStage_io_debugArchState_21),
    .io_debugArchState_22(renameStage_io_debugArchState_22),
    .io_debugArchState_23(renameStage_io_debugArchState_23),
    .io_debugArchState_24(renameStage_io_debugArchState_24),
    .io_debugArchState_25(renameStage_io_debugArchState_25),
    .io_debugArchState_26(renameStage_io_debugArchState_26),
    .io_debugArchState_27(renameStage_io_debugArchState_27),
    .io_debugArchState_28(renameStage_io_debugArchState_28),
    .io_debugArchState_29(renameStage_io_debugArchState_29),
    .io_debugArchState_30(renameStage_io_debugArchState_30),
    .io_debugArchState_31(renameStage_io_debugArchState_31)
  );
  DispatchStage dispatchStage ( // @[src/main/scala/backend/CtrlBlock.scala 74:29]
    .clock(dispatchStage_clock),
    .reset(dispatchStage_reset),
    .io_in_0_ready(dispatchStage_io_in_0_ready),
    .io_in_0_valid(dispatchStage_io_in_0_valid),
    .io_in_0_bits_pc(dispatchStage_io_in_0_bits_pc),
    .io_in_0_bits_inst(dispatchStage_io_in_0_bits_inst),
    .io_in_0_bits_ctrl_fuType(dispatchStage_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_aluOp(dispatchStage_io_in_0_bits_ctrl_aluOp),
    .io_in_0_bits_ctrl_bruOp(dispatchStage_io_in_0_bits_ctrl_bruOp),
    .io_in_0_bits_ctrl_lsuOp(dispatchStage_io_in_0_bits_ctrl_lsuOp),
    .io_in_0_bits_ctrl_csrOp(dispatchStage_io_in_0_bits_ctrl_csrOp),
    .io_in_0_bits_ctrl_mulOp(dispatchStage_io_in_0_bits_ctrl_mulOp),
    .io_in_0_bits_ctrl_divOp(dispatchStage_io_in_0_bits_ctrl_divOp),
    .io_in_0_bits_ctrl_src1Type(dispatchStage_io_in_0_bits_ctrl_src1Type),
    .io_in_0_bits_ctrl_src2Type(dispatchStage_io_in_0_bits_ctrl_src2Type),
    .io_in_0_bits_ctrl_immType(dispatchStage_io_in_0_bits_ctrl_immType),
    .io_in_0_bits_ctrl_rfWen(dispatchStage_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_memRead(dispatchStage_io_in_0_bits_ctrl_memRead),
    .io_in_0_bits_ctrl_memWrite(dispatchStage_io_in_0_bits_ctrl_memWrite),
    .io_in_0_bits_ctrl_csrWen(dispatchStage_io_in_0_bits_ctrl_csrWen),
    .io_in_0_bits_ctrl_isBranch(dispatchStage_io_in_0_bits_ctrl_isBranch),
    .io_in_0_bits_ctrl_isJump(dispatchStage_io_in_0_bits_ctrl_isJump),
    .io_in_0_bits_ctrl_isPriv(dispatchStage_io_in_0_bits_ctrl_isPriv),
    .io_in_0_bits_excpVec(dispatchStage_io_in_0_bits_excpVec),
    .io_in_0_bits_imm(dispatchStage_io_in_0_bits_imm),
    .io_in_0_bits_csrAddress(dispatchStage_io_in_0_bits_csrAddress),
    .io_in_0_bits_pdInfo_valid(dispatchStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(dispatchStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(dispatchStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(dispatchStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(dispatchStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(dispatchStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(dispatchStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_ldst(dispatchStage_io_in_0_bits_ldst),
    .io_in_0_bits_lrs1(dispatchStage_io_in_0_bits_lrs1),
    .io_in_0_bits_lrs2(dispatchStage_io_in_0_bits_lrs2),
    .io_in_0_bits_pdst(dispatchStage_io_in_0_bits_pdst),
    .io_in_0_bits_prs1(dispatchStage_io_in_0_bits_prs1),
    .io_in_0_bits_prs2(dispatchStage_io_in_0_bits_prs2),
    .io_in_0_bits_oldPdst(dispatchStage_io_in_0_bits_oldPdst),
    .io_in_0_bits_rs1Valid(dispatchStage_io_in_0_bits_rs1Valid),
    .io_in_0_bits_rs2Valid(dispatchStage_io_in_0_bits_rs2Valid),
    .io_in_0_bits_rdValid(dispatchStage_io_in_0_bits_rdValid),
    .io_in_0_bits_robIdx(dispatchStage_io_in_0_bits_robIdx),
    .io_in_1_ready(dispatchStage_io_in_1_ready),
    .io_in_1_valid(dispatchStage_io_in_1_valid),
    .io_in_1_bits_pc(dispatchStage_io_in_1_bits_pc),
    .io_in_1_bits_inst(dispatchStage_io_in_1_bits_inst),
    .io_in_1_bits_ctrl_fuType(dispatchStage_io_in_1_bits_ctrl_fuType),
    .io_in_1_bits_ctrl_aluOp(dispatchStage_io_in_1_bits_ctrl_aluOp),
    .io_in_1_bits_ctrl_bruOp(dispatchStage_io_in_1_bits_ctrl_bruOp),
    .io_in_1_bits_ctrl_lsuOp(dispatchStage_io_in_1_bits_ctrl_lsuOp),
    .io_in_1_bits_ctrl_csrOp(dispatchStage_io_in_1_bits_ctrl_csrOp),
    .io_in_1_bits_ctrl_mulOp(dispatchStage_io_in_1_bits_ctrl_mulOp),
    .io_in_1_bits_ctrl_divOp(dispatchStage_io_in_1_bits_ctrl_divOp),
    .io_in_1_bits_ctrl_src1Type(dispatchStage_io_in_1_bits_ctrl_src1Type),
    .io_in_1_bits_ctrl_src2Type(dispatchStage_io_in_1_bits_ctrl_src2Type),
    .io_in_1_bits_ctrl_immType(dispatchStage_io_in_1_bits_ctrl_immType),
    .io_in_1_bits_ctrl_rfWen(dispatchStage_io_in_1_bits_ctrl_rfWen),
    .io_in_1_bits_ctrl_memRead(dispatchStage_io_in_1_bits_ctrl_memRead),
    .io_in_1_bits_ctrl_memWrite(dispatchStage_io_in_1_bits_ctrl_memWrite),
    .io_in_1_bits_ctrl_csrWen(dispatchStage_io_in_1_bits_ctrl_csrWen),
    .io_in_1_bits_ctrl_isBranch(dispatchStage_io_in_1_bits_ctrl_isBranch),
    .io_in_1_bits_ctrl_isJump(dispatchStage_io_in_1_bits_ctrl_isJump),
    .io_in_1_bits_ctrl_isPriv(dispatchStage_io_in_1_bits_ctrl_isPriv),
    .io_in_1_bits_excpVec(dispatchStage_io_in_1_bits_excpVec),
    .io_in_1_bits_imm(dispatchStage_io_in_1_bits_imm),
    .io_in_1_bits_csrAddress(dispatchStage_io_in_1_bits_csrAddress),
    .io_in_1_bits_pdInfo_valid(dispatchStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(dispatchStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(dispatchStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(dispatchStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(dispatchStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(dispatchStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(dispatchStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_ldst(dispatchStage_io_in_1_bits_ldst),
    .io_in_1_bits_lrs1(dispatchStage_io_in_1_bits_lrs1),
    .io_in_1_bits_lrs2(dispatchStage_io_in_1_bits_lrs2),
    .io_in_1_bits_pdst(dispatchStage_io_in_1_bits_pdst),
    .io_in_1_bits_prs1(dispatchStage_io_in_1_bits_prs1),
    .io_in_1_bits_prs2(dispatchStage_io_in_1_bits_prs2),
    .io_in_1_bits_oldPdst(dispatchStage_io_in_1_bits_oldPdst),
    .io_in_1_bits_rs1Valid(dispatchStage_io_in_1_bits_rs1Valid),
    .io_in_1_bits_rs2Valid(dispatchStage_io_in_1_bits_rs2Valid),
    .io_in_1_bits_rdValid(dispatchStage_io_in_1_bits_rdValid),
    .io_in_1_bits_robIdx(dispatchStage_io_in_1_bits_robIdx),
    .io_in_2_ready(dispatchStage_io_in_2_ready),
    .io_in_2_valid(dispatchStage_io_in_2_valid),
    .io_in_2_bits_pc(dispatchStage_io_in_2_bits_pc),
    .io_in_2_bits_inst(dispatchStage_io_in_2_bits_inst),
    .io_in_2_bits_ctrl_fuType(dispatchStage_io_in_2_bits_ctrl_fuType),
    .io_in_2_bits_ctrl_aluOp(dispatchStage_io_in_2_bits_ctrl_aluOp),
    .io_in_2_bits_ctrl_bruOp(dispatchStage_io_in_2_bits_ctrl_bruOp),
    .io_in_2_bits_ctrl_lsuOp(dispatchStage_io_in_2_bits_ctrl_lsuOp),
    .io_in_2_bits_ctrl_csrOp(dispatchStage_io_in_2_bits_ctrl_csrOp),
    .io_in_2_bits_ctrl_mulOp(dispatchStage_io_in_2_bits_ctrl_mulOp),
    .io_in_2_bits_ctrl_divOp(dispatchStage_io_in_2_bits_ctrl_divOp),
    .io_in_2_bits_ctrl_src1Type(dispatchStage_io_in_2_bits_ctrl_src1Type),
    .io_in_2_bits_ctrl_src2Type(dispatchStage_io_in_2_bits_ctrl_src2Type),
    .io_in_2_bits_ctrl_immType(dispatchStage_io_in_2_bits_ctrl_immType),
    .io_in_2_bits_ctrl_rfWen(dispatchStage_io_in_2_bits_ctrl_rfWen),
    .io_in_2_bits_ctrl_memRead(dispatchStage_io_in_2_bits_ctrl_memRead),
    .io_in_2_bits_ctrl_memWrite(dispatchStage_io_in_2_bits_ctrl_memWrite),
    .io_in_2_bits_ctrl_csrWen(dispatchStage_io_in_2_bits_ctrl_csrWen),
    .io_in_2_bits_ctrl_isBranch(dispatchStage_io_in_2_bits_ctrl_isBranch),
    .io_in_2_bits_ctrl_isJump(dispatchStage_io_in_2_bits_ctrl_isJump),
    .io_in_2_bits_ctrl_isPriv(dispatchStage_io_in_2_bits_ctrl_isPriv),
    .io_in_2_bits_excpVec(dispatchStage_io_in_2_bits_excpVec),
    .io_in_2_bits_imm(dispatchStage_io_in_2_bits_imm),
    .io_in_2_bits_csrAddress(dispatchStage_io_in_2_bits_csrAddress),
    .io_in_2_bits_pdInfo_valid(dispatchStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(dispatchStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(dispatchStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(dispatchStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(dispatchStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(dispatchStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(dispatchStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_ldst(dispatchStage_io_in_2_bits_ldst),
    .io_in_2_bits_lrs1(dispatchStage_io_in_2_bits_lrs1),
    .io_in_2_bits_lrs2(dispatchStage_io_in_2_bits_lrs2),
    .io_in_2_bits_pdst(dispatchStage_io_in_2_bits_pdst),
    .io_in_2_bits_prs1(dispatchStage_io_in_2_bits_prs1),
    .io_in_2_bits_prs2(dispatchStage_io_in_2_bits_prs2),
    .io_in_2_bits_oldPdst(dispatchStage_io_in_2_bits_oldPdst),
    .io_in_2_bits_rs1Valid(dispatchStage_io_in_2_bits_rs1Valid),
    .io_in_2_bits_rs2Valid(dispatchStage_io_in_2_bits_rs2Valid),
    .io_in_2_bits_rdValid(dispatchStage_io_in_2_bits_rdValid),
    .io_in_2_bits_robIdx(dispatchStage_io_in_2_bits_robIdx),
    .io_q1IQEnq_0_valid(dispatchStage_io_q1IQEnq_0_valid),
    .io_q1IQEnq_0_bits_pc(dispatchStage_io_q1IQEnq_0_bits_pc),
    .io_q1IQEnq_0_bits_inst(dispatchStage_io_q1IQEnq_0_bits_inst),
    .io_q1IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType),
    .io_q1IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp),
    .io_q1IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp),
    .io_q1IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp),
    .io_q1IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp),
    .io_q1IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp),
    .io_q1IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp),
    .io_q1IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type),
    .io_q1IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type),
    .io_q1IQEnq_0_bits_ctrl_immType(dispatchStage_io_q1IQEnq_0_bits_ctrl_immType),
    .io_q1IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen),
    .io_q1IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead),
    .io_q1IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite),
    .io_q1IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen),
    .io_q1IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch),
    .io_q1IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump),
    .io_q1IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv),
    .io_q1IQEnq_0_bits_excpVec(dispatchStage_io_q1IQEnq_0_bits_excpVec),
    .io_q1IQEnq_0_bits_imm(dispatchStage_io_q1IQEnq_0_bits_imm),
    .io_q1IQEnq_0_bits_csrAddress(dispatchStage_io_q1IQEnq_0_bits_csrAddress),
    .io_q1IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid),
    .io_q1IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr),
    .io_q1IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal),
    .io_q1IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr),
    .io_q1IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall),
    .io_q1IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet),
    .io_q1IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_0_bits_ldst(dispatchStage_io_q1IQEnq_0_bits_ldst),
    .io_q1IQEnq_0_bits_lrs1(dispatchStage_io_q1IQEnq_0_bits_lrs1),
    .io_q1IQEnq_0_bits_lrs2(dispatchStage_io_q1IQEnq_0_bits_lrs2),
    .io_q1IQEnq_0_bits_pdst(dispatchStage_io_q1IQEnq_0_bits_pdst),
    .io_q1IQEnq_0_bits_prs1(dispatchStage_io_q1IQEnq_0_bits_prs1),
    .io_q1IQEnq_0_bits_prs2(dispatchStage_io_q1IQEnq_0_bits_prs2),
    .io_q1IQEnq_0_bits_oldPdst(dispatchStage_io_q1IQEnq_0_bits_oldPdst),
    .io_q1IQEnq_0_bits_rs1Valid(dispatchStage_io_q1IQEnq_0_bits_rs1Valid),
    .io_q1IQEnq_0_bits_rs2Valid(dispatchStage_io_q1IQEnq_0_bits_rs2Valid),
    .io_q1IQEnq_0_bits_rdValid(dispatchStage_io_q1IQEnq_0_bits_rdValid),
    .io_q1IQEnq_0_bits_robIdx(dispatchStage_io_q1IQEnq_0_bits_robIdx),
    .io_q1IQEnq_0_bits_robIdxFull(dispatchStage_io_q1IQEnq_0_bits_robIdxFull),
    .io_q1IQEnq_0_bits_prs1Busy(dispatchStage_io_q1IQEnq_0_bits_prs1Busy),
    .io_q1IQEnq_0_bits_prs2Busy(dispatchStage_io_q1IQEnq_0_bits_prs2Busy),
    .io_q2IQEnq_0_valid(dispatchStage_io_q2IQEnq_0_valid),
    .io_q2IQEnq_0_bits_pc(dispatchStage_io_q2IQEnq_0_bits_pc),
    .io_q2IQEnq_0_bits_inst(dispatchStage_io_q2IQEnq_0_bits_inst),
    .io_q2IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType),
    .io_q2IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp),
    .io_q2IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp),
    .io_q2IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp),
    .io_q2IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp),
    .io_q2IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp),
    .io_q2IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp),
    .io_q2IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type),
    .io_q2IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type),
    .io_q2IQEnq_0_bits_ctrl_immType(dispatchStage_io_q2IQEnq_0_bits_ctrl_immType),
    .io_q2IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen),
    .io_q2IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead),
    .io_q2IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite),
    .io_q2IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen),
    .io_q2IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch),
    .io_q2IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump),
    .io_q2IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv),
    .io_q2IQEnq_0_bits_excpVec(dispatchStage_io_q2IQEnq_0_bits_excpVec),
    .io_q2IQEnq_0_bits_imm(dispatchStage_io_q2IQEnq_0_bits_imm),
    .io_q2IQEnq_0_bits_csrAddress(dispatchStage_io_q2IQEnq_0_bits_csrAddress),
    .io_q2IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid),
    .io_q2IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr),
    .io_q2IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal),
    .io_q2IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr),
    .io_q2IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall),
    .io_q2IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet),
    .io_q2IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_0_bits_ldst(dispatchStage_io_q2IQEnq_0_bits_ldst),
    .io_q2IQEnq_0_bits_lrs1(dispatchStage_io_q2IQEnq_0_bits_lrs1),
    .io_q2IQEnq_0_bits_lrs2(dispatchStage_io_q2IQEnq_0_bits_lrs2),
    .io_q2IQEnq_0_bits_pdst(dispatchStage_io_q2IQEnq_0_bits_pdst),
    .io_q2IQEnq_0_bits_prs1(dispatchStage_io_q2IQEnq_0_bits_prs1),
    .io_q2IQEnq_0_bits_prs2(dispatchStage_io_q2IQEnq_0_bits_prs2),
    .io_q2IQEnq_0_bits_oldPdst(dispatchStage_io_q2IQEnq_0_bits_oldPdst),
    .io_q2IQEnq_0_bits_rs1Valid(dispatchStage_io_q2IQEnq_0_bits_rs1Valid),
    .io_q2IQEnq_0_bits_rs2Valid(dispatchStage_io_q2IQEnq_0_bits_rs2Valid),
    .io_q2IQEnq_0_bits_rdValid(dispatchStage_io_q2IQEnq_0_bits_rdValid),
    .io_q2IQEnq_0_bits_robIdx(dispatchStage_io_q2IQEnq_0_bits_robIdx),
    .io_q2IQEnq_0_bits_robIdxFull(dispatchStage_io_q2IQEnq_0_bits_robIdxFull),
    .io_q2IQEnq_0_bits_issueQueue(dispatchStage_io_q2IQEnq_0_bits_issueQueue),
    .io_q2IQEnq_0_bits_prs1Busy(dispatchStage_io_q2IQEnq_0_bits_prs1Busy),
    .io_q2IQEnq_0_bits_prs2Busy(dispatchStage_io_q2IQEnq_0_bits_prs2Busy),
    .io_q3IQEnq_0_valid(dispatchStage_io_q3IQEnq_0_valid),
    .io_q3IQEnq_0_bits_pc(dispatchStage_io_q3IQEnq_0_bits_pc),
    .io_q3IQEnq_0_bits_inst(dispatchStage_io_q3IQEnq_0_bits_inst),
    .io_q3IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType),
    .io_q3IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp),
    .io_q3IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp),
    .io_q3IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp),
    .io_q3IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp),
    .io_q3IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp),
    .io_q3IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp),
    .io_q3IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type),
    .io_q3IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type),
    .io_q3IQEnq_0_bits_ctrl_immType(dispatchStage_io_q3IQEnq_0_bits_ctrl_immType),
    .io_q3IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen),
    .io_q3IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead),
    .io_q3IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite),
    .io_q3IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen),
    .io_q3IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch),
    .io_q3IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump),
    .io_q3IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv),
    .io_q3IQEnq_0_bits_excpVec(dispatchStage_io_q3IQEnq_0_bits_excpVec),
    .io_q3IQEnq_0_bits_imm(dispatchStage_io_q3IQEnq_0_bits_imm),
    .io_q3IQEnq_0_bits_csrAddress(dispatchStage_io_q3IQEnq_0_bits_csrAddress),
    .io_q3IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid),
    .io_q3IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr),
    .io_q3IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal),
    .io_q3IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr),
    .io_q3IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall),
    .io_q3IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet),
    .io_q3IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_0_bits_ldst(dispatchStage_io_q3IQEnq_0_bits_ldst),
    .io_q3IQEnq_0_bits_lrs1(dispatchStage_io_q3IQEnq_0_bits_lrs1),
    .io_q3IQEnq_0_bits_lrs2(dispatchStage_io_q3IQEnq_0_bits_lrs2),
    .io_q3IQEnq_0_bits_pdst(dispatchStage_io_q3IQEnq_0_bits_pdst),
    .io_q3IQEnq_0_bits_prs1(dispatchStage_io_q3IQEnq_0_bits_prs1),
    .io_q3IQEnq_0_bits_prs2(dispatchStage_io_q3IQEnq_0_bits_prs2),
    .io_q3IQEnq_0_bits_oldPdst(dispatchStage_io_q3IQEnq_0_bits_oldPdst),
    .io_q3IQEnq_0_bits_rs1Valid(dispatchStage_io_q3IQEnq_0_bits_rs1Valid),
    .io_q3IQEnq_0_bits_rs2Valid(dispatchStage_io_q3IQEnq_0_bits_rs2Valid),
    .io_q3IQEnq_0_bits_rdValid(dispatchStage_io_q3IQEnq_0_bits_rdValid),
    .io_q3IQEnq_0_bits_robIdx(dispatchStage_io_q3IQEnq_0_bits_robIdx),
    .io_q3IQEnq_0_bits_robIdxFull(dispatchStage_io_q3IQEnq_0_bits_robIdxFull),
    .io_q3IQEnq_0_bits_issueQueue(dispatchStage_io_q3IQEnq_0_bits_issueQueue),
    .io_q3IQEnq_0_bits_prs1Busy(dispatchStage_io_q3IQEnq_0_bits_prs1Busy),
    .io_q3IQEnq_0_bits_prs2Busy(dispatchStage_io_q3IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_valid(dispatchStage_io_q4IQEnq_0_valid),
    .io_q4IQEnq_0_bits_pc(dispatchStage_io_q4IQEnq_0_bits_pc),
    .io_q4IQEnq_0_bits_inst(dispatchStage_io_q4IQEnq_0_bits_inst),
    .io_q4IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType),
    .io_q4IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp),
    .io_q4IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp),
    .io_q4IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp),
    .io_q4IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp),
    .io_q4IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp),
    .io_q4IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp),
    .io_q4IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type),
    .io_q4IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type),
    .io_q4IQEnq_0_bits_ctrl_immType(dispatchStage_io_q4IQEnq_0_bits_ctrl_immType),
    .io_q4IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen),
    .io_q4IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead),
    .io_q4IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite),
    .io_q4IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen),
    .io_q4IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch),
    .io_q4IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump),
    .io_q4IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv),
    .io_q4IQEnq_0_bits_excpVec(dispatchStage_io_q4IQEnq_0_bits_excpVec),
    .io_q4IQEnq_0_bits_imm(dispatchStage_io_q4IQEnq_0_bits_imm),
    .io_q4IQEnq_0_bits_csrAddress(dispatchStage_io_q4IQEnq_0_bits_csrAddress),
    .io_q4IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid),
    .io_q4IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr),
    .io_q4IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal),
    .io_q4IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr),
    .io_q4IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall),
    .io_q4IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet),
    .io_q4IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_0_bits_ldst(dispatchStage_io_q4IQEnq_0_bits_ldst),
    .io_q4IQEnq_0_bits_lrs1(dispatchStage_io_q4IQEnq_0_bits_lrs1),
    .io_q4IQEnq_0_bits_lrs2(dispatchStage_io_q4IQEnq_0_bits_lrs2),
    .io_q4IQEnq_0_bits_pdst(dispatchStage_io_q4IQEnq_0_bits_pdst),
    .io_q4IQEnq_0_bits_prs1(dispatchStage_io_q4IQEnq_0_bits_prs1),
    .io_q4IQEnq_0_bits_prs2(dispatchStage_io_q4IQEnq_0_bits_prs2),
    .io_q4IQEnq_0_bits_oldPdst(dispatchStage_io_q4IQEnq_0_bits_oldPdst),
    .io_q4IQEnq_0_bits_rs1Valid(dispatchStage_io_q4IQEnq_0_bits_rs1Valid),
    .io_q4IQEnq_0_bits_rs2Valid(dispatchStage_io_q4IQEnq_0_bits_rs2Valid),
    .io_q4IQEnq_0_bits_rdValid(dispatchStage_io_q4IQEnq_0_bits_rdValid),
    .io_q4IQEnq_0_bits_robIdx(dispatchStage_io_q4IQEnq_0_bits_robIdx),
    .io_q4IQEnq_0_bits_robIdxFull(dispatchStage_io_q4IQEnq_0_bits_robIdxFull),
    .io_q4IQEnq_0_bits_lqIdx(dispatchStage_io_q4IQEnq_0_bits_lqIdx),
    .io_q4IQEnq_0_bits_sqIdx(dispatchStage_io_q4IQEnq_0_bits_sqIdx),
    .io_q4IQEnq_0_bits_issueQueue(dispatchStage_io_q4IQEnq_0_bits_issueQueue),
    .io_q4IQEnq_0_bits_prs1Busy(dispatchStage_io_q4IQEnq_0_bits_prs1Busy),
    .io_q4IQEnq_0_bits_prs2Busy(dispatchStage_io_q4IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_bits_isSta(dispatchStage_io_q4IQEnq_0_bits_isSta),
    .io_q5IQEnq_0_valid(dispatchStage_io_q5IQEnq_0_valid),
    .io_q5IQEnq_0_bits_prs2(dispatchStage_io_q5IQEnq_0_bits_prs2),
    .io_q5IQEnq_0_bits_rs2Valid(dispatchStage_io_q5IQEnq_0_bits_rs2Valid),
    .io_q5IQEnq_0_bits_prs2Busy(dispatchStage_io_q5IQEnq_0_bits_prs2Busy),
    .io_iqFeedback_q1FreeEntries(dispatchStage_io_iqFeedback_q1FreeEntries),
    .io_iqFeedback_q2FreeEntries(dispatchStage_io_iqFeedback_q2FreeEntries),
    .io_iqFeedback_q3FreeEntries(dispatchStage_io_iqFeedback_q3FreeEntries),
    .io_iqFeedback_q4FreeEntries(dispatchStage_io_iqFeedback_q4FreeEntries),
    .io_iqFeedback_q5FreeEntries(dispatchStage_io_iqFeedback_q5FreeEntries),
    .io_lsEnq_req_0_valid(dispatchStage_io_lsEnq_req_0_valid),
    .io_lsEnq_req_0_bits_robIdx(dispatchStage_io_lsEnq_req_0_bits_robIdx),
    .io_lsEnq_req_0_bits_isLoad(dispatchStage_io_lsEnq_req_0_bits_isLoad),
    .io_lsEnq_req_0_bits_isStore(dispatchStage_io_lsEnq_req_0_bits_isStore),
    .io_lsEnq_req_0_bits_sqIdx(dispatchStage_io_lsEnq_req_0_bits_sqIdx),
    .io_lsEnq_req_0_bits_lqIdx(dispatchStage_io_lsEnq_req_0_bits_lqIdx),
    .io_lsEnq_req_1_valid(dispatchStage_io_lsEnq_req_1_valid),
    .io_lsEnq_req_1_bits_robIdx(dispatchStage_io_lsEnq_req_1_bits_robIdx),
    .io_lsEnq_req_1_bits_isLoad(dispatchStage_io_lsEnq_req_1_bits_isLoad),
    .io_lsEnq_req_1_bits_isStore(dispatchStage_io_lsEnq_req_1_bits_isStore),
    .io_lsEnq_req_1_bits_sqIdx(dispatchStage_io_lsEnq_req_1_bits_sqIdx),
    .io_lsEnq_req_1_bits_lqIdx(dispatchStage_io_lsEnq_req_1_bits_lqIdx),
    .io_lsEnq_req_2_valid(dispatchStage_io_lsEnq_req_2_valid),
    .io_lsEnq_req_2_bits_robIdx(dispatchStage_io_lsEnq_req_2_bits_robIdx),
    .io_lsEnq_req_2_bits_isLoad(dispatchStage_io_lsEnq_req_2_bits_isLoad),
    .io_lsEnq_req_2_bits_isStore(dispatchStage_io_lsEnq_req_2_bits_isStore),
    .io_lsEnq_req_2_bits_sqIdx(dispatchStage_io_lsEnq_req_2_bits_sqIdx),
    .io_lsEnq_req_2_bits_lqIdx(dispatchStage_io_lsEnq_req_2_bits_lqIdx),
    .io_robEnq_valid_0(dispatchStage_io_robEnq_valid_0),
    .io_robEnq_valid_1(dispatchStage_io_robEnq_valid_1),
    .io_robEnq_valid_2(dispatchStage_io_robEnq_valid_2),
    .io_robEnq_valids_0(dispatchStage_io_robEnq_valids_0),
    .io_robEnq_valids_1(dispatchStage_io_robEnq_valids_1),
    .io_robEnq_valids_2(dispatchStage_io_robEnq_valids_2),
    .io_robEnq_bits_0_pc(dispatchStage_io_robEnq_bits_0_pc),
    .io_robEnq_bits_0_inst(dispatchStage_io_robEnq_bits_0_inst),
    .io_robEnq_bits_0_pdst(dispatchStage_io_robEnq_bits_0_pdst),
    .io_robEnq_bits_0_oldPdst(dispatchStage_io_robEnq_bits_0_oldPdst),
    .io_robEnq_bits_0_ldst(dispatchStage_io_robEnq_bits_0_ldst),
    .io_robEnq_bits_0_rfWen(dispatchStage_io_robEnq_bits_0_rfWen),
    .io_robEnq_bits_0_memRead(dispatchStage_io_robEnq_bits_0_memRead),
    .io_robEnq_bits_0_memWrite(dispatchStage_io_robEnq_bits_0_memWrite),
    .io_robEnq_bits_0_csrWen(dispatchStage_io_robEnq_bits_0_csrWen),
    .io_robEnq_bits_0_excpVec(dispatchStage_io_robEnq_bits_0_excpVec),
    .io_robEnq_bits_0_fuType(dispatchStage_io_robEnq_bits_0_fuType),
    .io_robEnq_bits_1_pc(dispatchStage_io_robEnq_bits_1_pc),
    .io_robEnq_bits_1_inst(dispatchStage_io_robEnq_bits_1_inst),
    .io_robEnq_bits_1_pdst(dispatchStage_io_robEnq_bits_1_pdst),
    .io_robEnq_bits_1_oldPdst(dispatchStage_io_robEnq_bits_1_oldPdst),
    .io_robEnq_bits_1_ldst(dispatchStage_io_robEnq_bits_1_ldst),
    .io_robEnq_bits_1_rfWen(dispatchStage_io_robEnq_bits_1_rfWen),
    .io_robEnq_bits_1_memRead(dispatchStage_io_robEnq_bits_1_memRead),
    .io_robEnq_bits_1_memWrite(dispatchStage_io_robEnq_bits_1_memWrite),
    .io_robEnq_bits_1_csrWen(dispatchStage_io_robEnq_bits_1_csrWen),
    .io_robEnq_bits_1_excpVec(dispatchStage_io_robEnq_bits_1_excpVec),
    .io_robEnq_bits_1_fuType(dispatchStage_io_robEnq_bits_1_fuType),
    .io_robEnq_bits_2_pc(dispatchStage_io_robEnq_bits_2_pc),
    .io_robEnq_bits_2_inst(dispatchStage_io_robEnq_bits_2_inst),
    .io_robEnq_bits_2_pdst(dispatchStage_io_robEnq_bits_2_pdst),
    .io_robEnq_bits_2_oldPdst(dispatchStage_io_robEnq_bits_2_oldPdst),
    .io_robEnq_bits_2_ldst(dispatchStage_io_robEnq_bits_2_ldst),
    .io_robEnq_bits_2_rfWen(dispatchStage_io_robEnq_bits_2_rfWen),
    .io_robEnq_bits_2_memRead(dispatchStage_io_robEnq_bits_2_memRead),
    .io_robEnq_bits_2_memWrite(dispatchStage_io_robEnq_bits_2_memWrite),
    .io_robEnq_bits_2_csrWen(dispatchStage_io_robEnq_bits_2_csrWen),
    .io_robEnq_bits_2_excpVec(dispatchStage_io_robEnq_bits_2_excpVec),
    .io_robEnq_bits_2_fuType(dispatchStage_io_robEnq_bits_2_fuType),
    .io_robEnq_canEnq(dispatchStage_io_robEnq_canEnq),
    .io_redirect_valid(dispatchStage_io_redirect_valid),
    .io_wakeupPorts_0_valid(dispatchStage_io_wakeupPorts_0_valid),
    .io_wakeupPorts_0_bits_pdst(dispatchStage_io_wakeupPorts_0_bits_pdst),
    .io_wakeupPorts_1_valid(dispatchStage_io_wakeupPorts_1_valid),
    .io_wakeupPorts_1_bits_pdst(dispatchStage_io_wakeupPorts_1_bits_pdst),
    .io_wakeupPorts_2_valid(dispatchStage_io_wakeupPorts_2_valid),
    .io_wakeupPorts_2_bits_pdst(dispatchStage_io_wakeupPorts_2_bits_pdst)
  );
  ROB rob ( // @[src/main/scala/backend/CtrlBlock.scala 95:19]
    .clock(rob_clock),
    .reset(rob_reset),
    .io_flush(rob_io_flush),
    .io_enq_valid_0(rob_io_enq_valid_0),
    .io_enq_valid_1(rob_io_enq_valid_1),
    .io_enq_valid_2(rob_io_enq_valid_2),
    .io_enq_valids_0(rob_io_enq_valids_0),
    .io_enq_valids_1(rob_io_enq_valids_1),
    .io_enq_valids_2(rob_io_enq_valids_2),
    .io_enq_bits_0_pc(rob_io_enq_bits_0_pc),
    .io_enq_bits_0_inst(rob_io_enq_bits_0_inst),
    .io_enq_bits_0_pdst(rob_io_enq_bits_0_pdst),
    .io_enq_bits_0_oldPdst(rob_io_enq_bits_0_oldPdst),
    .io_enq_bits_0_ldst(rob_io_enq_bits_0_ldst),
    .io_enq_bits_0_rfWen(rob_io_enq_bits_0_rfWen),
    .io_enq_bits_0_memRead(rob_io_enq_bits_0_memRead),
    .io_enq_bits_0_memWrite(rob_io_enq_bits_0_memWrite),
    .io_enq_bits_0_csrWen(rob_io_enq_bits_0_csrWen),
    .io_enq_bits_0_excpVec(rob_io_enq_bits_0_excpVec),
    .io_enq_bits_0_fuType(rob_io_enq_bits_0_fuType),
    .io_enq_bits_1_pc(rob_io_enq_bits_1_pc),
    .io_enq_bits_1_inst(rob_io_enq_bits_1_inst),
    .io_enq_bits_1_pdst(rob_io_enq_bits_1_pdst),
    .io_enq_bits_1_oldPdst(rob_io_enq_bits_1_oldPdst),
    .io_enq_bits_1_ldst(rob_io_enq_bits_1_ldst),
    .io_enq_bits_1_rfWen(rob_io_enq_bits_1_rfWen),
    .io_enq_bits_1_memRead(rob_io_enq_bits_1_memRead),
    .io_enq_bits_1_memWrite(rob_io_enq_bits_1_memWrite),
    .io_enq_bits_1_csrWen(rob_io_enq_bits_1_csrWen),
    .io_enq_bits_1_excpVec(rob_io_enq_bits_1_excpVec),
    .io_enq_bits_1_fuType(rob_io_enq_bits_1_fuType),
    .io_enq_bits_2_pc(rob_io_enq_bits_2_pc),
    .io_enq_bits_2_inst(rob_io_enq_bits_2_inst),
    .io_enq_bits_2_pdst(rob_io_enq_bits_2_pdst),
    .io_enq_bits_2_oldPdst(rob_io_enq_bits_2_oldPdst),
    .io_enq_bits_2_ldst(rob_io_enq_bits_2_ldst),
    .io_enq_bits_2_rfWen(rob_io_enq_bits_2_rfWen),
    .io_enq_bits_2_memRead(rob_io_enq_bits_2_memRead),
    .io_enq_bits_2_memWrite(rob_io_enq_bits_2_memWrite),
    .io_enq_bits_2_csrWen(rob_io_enq_bits_2_csrWen),
    .io_enq_bits_2_excpVec(rob_io_enq_bits_2_excpVec),
    .io_enq_bits_2_fuType(rob_io_enq_bits_2_fuType),
    .io_enq_canEnq(rob_io_enq_canEnq),
    .io_commit_valid_0(rob_io_commit_valid_0),
    .io_commit_valid_1(rob_io_commit_valid_1),
    .io_commit_valid_2(rob_io_commit_valid_2),
    .io_commit_bits_0_pdst(rob_io_commit_bits_0_pdst),
    .io_commit_bits_0_pc(rob_io_commit_bits_0_pc),
    .io_commit_bits_0_wrdata(rob_io_commit_bits_0_wrdata),
    .io_commit_bits_0_oldPdst(rob_io_commit_bits_0_oldPdst),
    .io_commit_bits_0_ldst(rob_io_commit_bits_0_ldst),
    .io_commit_bits_0_rfWen(rob_io_commit_bits_0_rfWen),
    .io_commit_bits_1_pdst(rob_io_commit_bits_1_pdst),
    .io_commit_bits_1_pc(rob_io_commit_bits_1_pc),
    .io_commit_bits_1_wrdata(rob_io_commit_bits_1_wrdata),
    .io_commit_bits_1_oldPdst(rob_io_commit_bits_1_oldPdst),
    .io_commit_bits_1_ldst(rob_io_commit_bits_1_ldst),
    .io_commit_bits_1_rfWen(rob_io_commit_bits_1_rfWen),
    .io_commit_bits_2_pdst(rob_io_commit_bits_2_pdst),
    .io_commit_bits_2_pc(rob_io_commit_bits_2_pc),
    .io_commit_bits_2_wrdata(rob_io_commit_bits_2_wrdata),
    .io_commit_bits_2_oldPdst(rob_io_commit_bits_2_oldPdst),
    .io_commit_bits_2_ldst(rob_io_commit_bits_2_ldst),
    .io_commit_bits_2_rfWen(rob_io_commit_bits_2_rfWen),
    .io_redirect_valid(rob_io_redirect_valid),
    .io_redirect_robIdx(rob_io_redirect_robIdx),
    .io_writeback_0_valid(rob_io_writeback_0_valid),
    .io_writeback_0_bits_robIdx(rob_io_writeback_0_bits_robIdx),
    .io_writeback_0_bits_rfdata(rob_io_writeback_0_bits_rfdata),
    .io_writeback_0_bits_excpVec(rob_io_writeback_0_bits_excpVec),
    .io_writeback_1_valid(rob_io_writeback_1_valid),
    .io_writeback_1_bits_robIdx(rob_io_writeback_1_bits_robIdx),
    .io_writeback_1_bits_rfdata(rob_io_writeback_1_bits_rfdata),
    .io_writeback_1_bits_excpVec(rob_io_writeback_1_bits_excpVec),
    .io_writeback_2_valid(rob_io_writeback_2_valid),
    .io_writeback_2_bits_robIdx(rob_io_writeback_2_bits_robIdx),
    .io_writeback_2_bits_rfdata(rob_io_writeback_2_bits_rfdata),
    .io_writeback_2_bits_excpVec(rob_io_writeback_2_bits_excpVec)
  );
  assign io_in_0_ready = decodeStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign io_in_1_ready = decodeStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign io_in_2_ready = decodeStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign io_q1IQEnq_0_valid = dispatchStage_io_q1IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pc = dispatchStage_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_inst = dispatchStage_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_immType = dispatchStage_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_excpVec = dispatchStage_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_imm = dispatchStage_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_csrAddress = dispatchStage_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_ldst = dispatchStage_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_lrs1 = dispatchStage_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_lrs2 = dispatchStage_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_pdst = dispatchStage_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_prs1 = dispatchStage_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_prs2 = dispatchStage_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_oldPdst = dispatchStage_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_rs1Valid = dispatchStage_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_rs2Valid = dispatchStage_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_rdValid = dispatchStage_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_robIdx = dispatchStage_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_robIdxFull = dispatchStage_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_prs1Busy = dispatchStage_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q1IQEnq_0_bits_prs2Busy = dispatchStage_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 80:32]
  assign io_q2IQEnq_0_valid = dispatchStage_io_q2IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pc = dispatchStage_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_inst = dispatchStage_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_immType = dispatchStage_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_excpVec = dispatchStage_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_imm = dispatchStage_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_csrAddress = dispatchStage_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_ldst = dispatchStage_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_lrs1 = dispatchStage_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_lrs2 = dispatchStage_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_pdst = dispatchStage_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_prs1 = dispatchStage_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_prs2 = dispatchStage_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_oldPdst = dispatchStage_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_rs1Valid = dispatchStage_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_rs2Valid = dispatchStage_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_rdValid = dispatchStage_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_robIdx = dispatchStage_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_robIdxFull = dispatchStage_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_issueQueue = dispatchStage_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_prs1Busy = dispatchStage_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q2IQEnq_0_bits_prs2Busy = dispatchStage_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 81:32]
  assign io_q3IQEnq_0_valid = dispatchStage_io_q3IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pc = dispatchStage_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_inst = dispatchStage_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_immType = dispatchStage_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_excpVec = dispatchStage_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_imm = dispatchStage_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_csrAddress = dispatchStage_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_ldst = dispatchStage_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_lrs1 = dispatchStage_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_lrs2 = dispatchStage_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_pdst = dispatchStage_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_prs1 = dispatchStage_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_prs2 = dispatchStage_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_oldPdst = dispatchStage_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_rs1Valid = dispatchStage_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_rs2Valid = dispatchStage_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_rdValid = dispatchStage_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_robIdx = dispatchStage_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_robIdxFull = dispatchStage_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_issueQueue = dispatchStage_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_prs1Busy = dispatchStage_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q3IQEnq_0_bits_prs2Busy = dispatchStage_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 82:32]
  assign io_q4IQEnq_0_valid = dispatchStage_io_q4IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pc = dispatchStage_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_inst = dispatchStage_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_immType = dispatchStage_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_excpVec = dispatchStage_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_imm = dispatchStage_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_csrAddress = dispatchStage_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_ldst = dispatchStage_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_lrs1 = dispatchStage_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_lrs2 = dispatchStage_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_pdst = dispatchStage_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_prs1 = dispatchStage_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_prs2 = dispatchStage_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_oldPdst = dispatchStage_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_rs1Valid = dispatchStage_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_rs2Valid = dispatchStage_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_rdValid = dispatchStage_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_robIdx = dispatchStage_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_robIdxFull = dispatchStage_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_lqIdx = dispatchStage_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_sqIdx = dispatchStage_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_issueQueue = dispatchStage_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_prs1Busy = dispatchStage_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_prs2Busy = dispatchStage_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q4IQEnq_0_bits_isSta = dispatchStage_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 83:32]
  assign io_q5IQEnq_0_valid = dispatchStage_io_q5IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 84:32]
  assign io_q5IQEnq_0_bits_prs2 = dispatchStage_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 84:32]
  assign io_q5IQEnq_0_bits_rs2Valid = dispatchStage_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 84:32]
  assign io_q5IQEnq_0_bits_prs2Busy = dispatchStage_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 84:32]
  assign io_lsEnq_req_0_valid = dispatchStage_io_lsEnq_req_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_0_bits_robIdx = dispatchStage_io_lsEnq_req_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_0_bits_isLoad = dispatchStage_io_lsEnq_req_0_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_0_bits_isStore = dispatchStage_io_lsEnq_req_0_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_0_bits_sqIdx = dispatchStage_io_lsEnq_req_0_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_0_bits_lqIdx = dispatchStage_io_lsEnq_req_0_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_valid = dispatchStage_io_lsEnq_req_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_bits_robIdx = dispatchStage_io_lsEnq_req_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_bits_isLoad = dispatchStage_io_lsEnq_req_1_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_bits_isStore = dispatchStage_io_lsEnq_req_1_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_bits_sqIdx = dispatchStage_io_lsEnq_req_1_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_1_bits_lqIdx = dispatchStage_io_lsEnq_req_1_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_valid = dispatchStage_io_lsEnq_req_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_bits_robIdx = dispatchStage_io_lsEnq_req_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_bits_isLoad = dispatchStage_io_lsEnq_req_2_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_bits_isStore = dispatchStage_io_lsEnq_req_2_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_bits_sqIdx = dispatchStage_io_lsEnq_req_2_bits_sqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_lsEnq_req_2_bits_lqIdx = dispatchStage_io_lsEnq_req_2_bits_lqIdx; // @[src/main/scala/backend/CtrlBlock.scala 90:26]
  assign io_commit_valid_0 = rob_io_commit_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_valid_1 = rob_io_commit_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_valid_2 = rob_io_commit_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_pdst = rob_io_commit_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_pc = rob_io_commit_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_wrdata = rob_io_commit_bits_0_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_oldPdst = rob_io_commit_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_ldst = rob_io_commit_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_0_rfWen = rob_io_commit_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_pdst = rob_io_commit_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_pc = rob_io_commit_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_wrdata = rob_io_commit_bits_1_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_oldPdst = rob_io_commit_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_ldst = rob_io_commit_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_1_rfWen = rob_io_commit_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_pdst = rob_io_commit_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_pc = rob_io_commit_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_wrdata = rob_io_commit_bits_2_wrdata; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_oldPdst = rob_io_commit_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_ldst = rob_io_commit_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_bits_2_rfWen = rob_io_commit_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_commit_isWalk = 1'h0; // @[src/main/scala/backend/CtrlBlock.scala 108:15]
  assign io_redirect_valid = rob_io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 123:15]
  assign io_redirect_robIdx = rob_io_redirect_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 123:15]
  assign io_debugArchState_0 = renameStage_io_debugArchState_0; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_1 = renameStage_io_debugArchState_1; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_2 = renameStage_io_debugArchState_2; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_3 = renameStage_io_debugArchState_3; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_4 = renameStage_io_debugArchState_4; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_5 = renameStage_io_debugArchState_5; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_6 = renameStage_io_debugArchState_6; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_7 = renameStage_io_debugArchState_7; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_8 = renameStage_io_debugArchState_8; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_9 = renameStage_io_debugArchState_9; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_10 = renameStage_io_debugArchState_10; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_11 = renameStage_io_debugArchState_11; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_12 = renameStage_io_debugArchState_12; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_13 = renameStage_io_debugArchState_13; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_14 = renameStage_io_debugArchState_14; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_15 = renameStage_io_debugArchState_15; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_16 = renameStage_io_debugArchState_16; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_17 = renameStage_io_debugArchState_17; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_18 = renameStage_io_debugArchState_18; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_19 = renameStage_io_debugArchState_19; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_20 = renameStage_io_debugArchState_20; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_21 = renameStage_io_debugArchState_21; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_22 = renameStage_io_debugArchState_22; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_23 = renameStage_io_debugArchState_23; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_24 = renameStage_io_debugArchState_24; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_25 = renameStage_io_debugArchState_25; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_26 = renameStage_io_debugArchState_26; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_27 = renameStage_io_debugArchState_27; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_28 = renameStage_io_debugArchState_28; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_29 = renameStage_io_debugArchState_29; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_30 = renameStage_io_debugArchState_30; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign io_debugArchState_31 = renameStage_io_debugArchState_31; // @[src/main/scala/backend/CtrlBlock.scala 69:21]
  assign decodeStage_clock = clock;
  assign decodeStage_reset = reset;
  assign decodeStage_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 56:24]
  assign decodeStage_io_out_0_ready = renameStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign decodeStage_io_out_1_ready = renameStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign decodeStage_io_out_2_ready = renameStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign decodeStage_io_extInt = io_extInt; // @[src/main/scala/backend/CtrlBlock.scala 57:25]
  assign decodeStage_io_flush = io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 58:37]
  assign renameStage_clock = clock;
  assign renameStage_reset = reset;
  assign renameStage_io_in_0_valid = decodeStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pc = decodeStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_inst = decodeStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rd = decodeStage_io_out_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rj = decodeStage_io_out_0_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rk = decodeStage_io_out_0_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rs1 = decodeStage_io_out_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rs2 = decodeStage_io_out_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rs1Valid = decodeStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rs2Valid = decodeStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_rdValid = decodeStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_csrAddress = decodeStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_imm = decodeStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_fuType = decodeStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_aluOp = decodeStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_bruOp = decodeStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_lsuOp = decodeStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_csrOp = decodeStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_mulOp = decodeStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_divOp = decodeStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_src1Type = decodeStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_src2Type = decodeStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_immType = decodeStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_rfWen = decodeStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_memRead = decodeStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_memWrite = decodeStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_csrWen = decodeStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_isBranch = decodeStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_isJump = decodeStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_ctrl_isPriv = decodeStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_excpVec = decodeStage_io_out_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_valid = decodeStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_isBr = decodeStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_isJal = decodeStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_isJalr = decodeStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_isCall = decodeStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_isRet = decodeStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_0_bits_pdInfo_jumpTarget = decodeStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_valid = decodeStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pc = decodeStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_inst = decodeStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rd = decodeStage_io_out_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rj = decodeStage_io_out_1_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rk = decodeStage_io_out_1_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rs1 = decodeStage_io_out_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rs2 = decodeStage_io_out_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rs1Valid = decodeStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rs2Valid = decodeStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_rdValid = decodeStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_csrAddress = decodeStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_imm = decodeStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_fuType = decodeStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_aluOp = decodeStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_bruOp = decodeStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_lsuOp = decodeStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_csrOp = decodeStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_mulOp = decodeStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_divOp = decodeStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_src1Type = decodeStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_src2Type = decodeStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_immType = decodeStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_rfWen = decodeStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_memRead = decodeStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_memWrite = decodeStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_csrWen = decodeStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_isBranch = decodeStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_isJump = decodeStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_ctrl_isPriv = decodeStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_excpVec = decodeStage_io_out_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_valid = decodeStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_isBr = decodeStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_isJal = decodeStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_isJalr = decodeStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_isCall = decodeStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_isRet = decodeStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_1_bits_pdInfo_jumpTarget = decodeStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_valid = decodeStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pc = decodeStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_inst = decodeStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rd = decodeStage_io_out_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rj = decodeStage_io_out_2_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rk = decodeStage_io_out_2_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rs1 = decodeStage_io_out_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rs2 = decodeStage_io_out_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rs1Valid = decodeStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rs2Valid = decodeStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_rdValid = decodeStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_csrAddress = decodeStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_imm = decodeStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_fuType = decodeStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_aluOp = decodeStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_bruOp = decodeStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_lsuOp = decodeStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_csrOp = decodeStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_mulOp = decodeStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_divOp = decodeStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_src1Type = decodeStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_src2Type = decodeStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_immType = decodeStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_rfWen = decodeStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_memRead = decodeStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_memWrite = decodeStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_csrWen = decodeStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_isBranch = decodeStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_isJump = decodeStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_ctrl_isPriv = decodeStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_excpVec = decodeStage_io_out_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_valid = decodeStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_isBr = decodeStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_isJal = decodeStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_isJalr = decodeStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_isCall = decodeStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_isRet = decodeStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_in_2_bits_pdInfo_jumpTarget = decodeStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 64:26]
  assign renameStage_io_ratRead_0_rs1 = decodeStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_0_rs2 = decodeStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_0_hold1 = decodeStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_0_hold2 = decodeStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_1_rs1 = decodeStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_1_rs2 = decodeStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_1_hold1 = decodeStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_1_hold2 = decodeStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_2_rs1 = decodeStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_2_rs2 = decodeStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_2_hold1 = decodeStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_ratRead_2_hold2 = decodeStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 65:26]
  assign renameStage_io_out_0_ready = dispatchStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign renameStage_io_out_1_ready = dispatchStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign renameStage_io_out_2_ready = dispatchStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign renameStage_io_commit_0_valid = rob_io_commit_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 99:38]
  assign renameStage_io_commit_0_ldst = rob_io_commit_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 102:38]
  assign renameStage_io_commit_0_pdst = rob_io_commit_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 100:38]
  assign renameStage_io_commit_0_rfWen = rob_io_commit_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 103:38]
  assign renameStage_io_commit_1_valid = rob_io_commit_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 99:38]
  assign renameStage_io_commit_1_ldst = rob_io_commit_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 102:38]
  assign renameStage_io_commit_1_pdst = rob_io_commit_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 100:38]
  assign renameStage_io_commit_1_rfWen = rob_io_commit_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 103:38]
  assign renameStage_io_commit_2_valid = rob_io_commit_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 99:38]
  assign renameStage_io_commit_2_ldst = rob_io_commit_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 102:38]
  assign renameStage_io_commit_2_pdst = rob_io_commit_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 100:38]
  assign renameStage_io_commit_2_rfWen = rob_io_commit_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 103:38]
  assign renameStage_io_redirect_valid = io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 66:27]
  assign renameStage_io_redirect_robIdx = io_redirect_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 66:27]
  assign dispatchStage_clock = clock;
  assign dispatchStage_reset = reset;
  assign dispatchStage_io_in_0_valid = renameStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pc = renameStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_inst = renameStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_fuType = renameStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_aluOp = renameStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_bruOp = renameStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_lsuOp = renameStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_csrOp = renameStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_mulOp = renameStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_divOp = renameStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_src1Type = renameStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_src2Type = renameStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_immType = renameStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_rfWen = renameStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_memRead = renameStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_memWrite = renameStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_csrWen = renameStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_isBranch = renameStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_isJump = renameStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ctrl_isPriv = renameStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_excpVec = renameStage_io_out_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_imm = renameStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_csrAddress = renameStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_valid = renameStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isBr = renameStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isJal = renameStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isJalr = renameStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isCall = renameStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isRet = renameStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdInfo_jumpTarget = renameStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_ldst = renameStage_io_out_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_lrs1 = renameStage_io_out_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_lrs2 = renameStage_io_out_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_pdst = renameStage_io_out_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_prs1 = renameStage_io_out_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_prs2 = renameStage_io_out_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_oldPdst = renameStage_io_out_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_rs1Valid = renameStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_rs2Valid = renameStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_rdValid = renameStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_0_bits_robIdx = renameStage_io_out_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_valid = renameStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pc = renameStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_inst = renameStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_fuType = renameStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_aluOp = renameStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_bruOp = renameStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_lsuOp = renameStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_csrOp = renameStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_mulOp = renameStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_divOp = renameStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_src1Type = renameStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_src2Type = renameStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_immType = renameStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_rfWen = renameStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_memRead = renameStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_memWrite = renameStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_csrWen = renameStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_isBranch = renameStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_isJump = renameStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ctrl_isPriv = renameStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_excpVec = renameStage_io_out_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_imm = renameStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_csrAddress = renameStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_valid = renameStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isBr = renameStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isJal = renameStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isJalr = renameStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isCall = renameStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isRet = renameStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdInfo_jumpTarget = renameStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_ldst = renameStage_io_out_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_lrs1 = renameStage_io_out_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_lrs2 = renameStage_io_out_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_pdst = renameStage_io_out_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_prs1 = renameStage_io_out_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_prs2 = renameStage_io_out_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_oldPdst = renameStage_io_out_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_rs1Valid = renameStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_rs2Valid = renameStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_rdValid = renameStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_1_bits_robIdx = renameStage_io_out_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_valid = renameStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pc = renameStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_inst = renameStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_fuType = renameStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_aluOp = renameStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_bruOp = renameStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_lsuOp = renameStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_csrOp = renameStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_mulOp = renameStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_divOp = renameStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_src1Type = renameStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_src2Type = renameStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_immType = renameStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_rfWen = renameStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_memRead = renameStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_memWrite = renameStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_csrWen = renameStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_isBranch = renameStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_isJump = renameStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ctrl_isPriv = renameStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_excpVec = renameStage_io_out_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_imm = renameStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_csrAddress = renameStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_valid = renameStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isBr = renameStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isJal = renameStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isJalr = renameStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isCall = renameStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isRet = renameStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdInfo_jumpTarget = renameStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_ldst = renameStage_io_out_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_lrs1 = renameStage_io_out_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_lrs2 = renameStage_io_out_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_pdst = renameStage_io_out_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_prs1 = renameStage_io_out_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_prs2 = renameStage_io_out_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_oldPdst = renameStage_io_out_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_rs1Valid = renameStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_rs2Valid = renameStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_rdValid = renameStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_in_2_bits_robIdx = renameStage_io_out_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 75:29]
  assign dispatchStage_io_iqFeedback_q1FreeEntries = io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 87:31]
  assign dispatchStage_io_iqFeedback_q2FreeEntries = io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 87:31]
  assign dispatchStage_io_iqFeedback_q3FreeEntries = io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 87:31]
  assign dispatchStage_io_iqFeedback_q4FreeEntries = io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 87:31]
  assign dispatchStage_io_iqFeedback_q5FreeEntries = io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 87:31]
  assign dispatchStage_io_robEnq_canEnq = rob_io_enq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign dispatchStage_io_redirect_valid = io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:29]
  assign dispatchStage_io_wakeupPorts_0_valid = io_wakeupPorts_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign dispatchStage_io_wakeupPorts_0_bits_pdst = io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign dispatchStage_io_wakeupPorts_1_valid = io_wakeupPorts_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign dispatchStage_io_wakeupPorts_1_bits_pdst = io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign dispatchStage_io_wakeupPorts_2_valid = io_wakeupPorts_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign dispatchStage_io_wakeupPorts_2_bits_pdst = io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 114:32]
  assign rob_clock = clock;
  assign rob_reset = reset;
  assign rob_io_flush = io_redirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 111:28]
  assign rob_io_enq_valid_0 = dispatchStage_io_robEnq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_valid_1 = dispatchStage_io_robEnq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_valid_2 = dispatchStage_io_robEnq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_valids_0 = dispatchStage_io_robEnq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_valids_1 = dispatchStage_io_robEnq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_valids_2 = dispatchStage_io_robEnq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_pc = dispatchStage_io_robEnq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_inst = dispatchStage_io_robEnq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_pdst = dispatchStage_io_robEnq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_oldPdst = dispatchStage_io_robEnq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_ldst = dispatchStage_io_robEnq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_rfWen = dispatchStage_io_robEnq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_memRead = dispatchStage_io_robEnq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_memWrite = dispatchStage_io_robEnq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_csrWen = dispatchStage_io_robEnq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_excpVec = dispatchStage_io_robEnq_bits_0_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_0_fuType = dispatchStage_io_robEnq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_pc = dispatchStage_io_robEnq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_inst = dispatchStage_io_robEnq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_pdst = dispatchStage_io_robEnq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_oldPdst = dispatchStage_io_robEnq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_ldst = dispatchStage_io_robEnq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_rfWen = dispatchStage_io_robEnq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_memRead = dispatchStage_io_robEnq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_memWrite = dispatchStage_io_robEnq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_csrWen = dispatchStage_io_robEnq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_excpVec = dispatchStage_io_robEnq_bits_1_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_1_fuType = dispatchStage_io_robEnq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_pc = dispatchStage_io_robEnq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_inst = dispatchStage_io_robEnq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_pdst = dispatchStage_io_robEnq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_oldPdst = dispatchStage_io_robEnq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_ldst = dispatchStage_io_robEnq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_rfWen = dispatchStage_io_robEnq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_memRead = dispatchStage_io_robEnq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_memWrite = dispatchStage_io_robEnq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_csrWen = dispatchStage_io_robEnq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_excpVec = dispatchStage_io_robEnq_bits_2_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_enq_bits_2_fuType = dispatchStage_io_robEnq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 118:14]
  assign rob_io_writeback_0_valid = io_writeback_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_0_bits_robIdx = io_writeback_0_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_0_bits_rfdata = io_writeback_0_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_0_bits_excpVec = io_writeback_0_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_1_valid = io_writeback_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_1_bits_robIdx = io_writeback_1_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_1_bits_rfdata = io_writeback_1_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_1_bits_excpVec = io_writeback_1_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_2_valid = io_writeback_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_2_bits_robIdx = io_writeback_2_bits_robIdx; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_2_bits_rfdata = io_writeback_2_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
  assign rob_io_writeback_2_bits_excpVec = io_writeback_2_bits_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 113:20]
endmodule
