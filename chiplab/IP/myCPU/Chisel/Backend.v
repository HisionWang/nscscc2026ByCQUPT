module Backend(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_in_1_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_in_2_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_out_0_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 20:14]
  output [9:0]  io_out_0_bits_excpVec, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/Backend.scala 20:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_0_bits_ldst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_0_bits_lrs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_0_bits_lrs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_0_bits_pdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_0_bits_prs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_0_bits_prs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_0_bits_oldPdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_0_bits_robIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [6:0]  io_out_0_bits_robIdxFull, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_lqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_0_bits_sqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [1:0]  io_out_0_bits_issueQueue, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_prs1Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_0_bits_prs2Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_out_1_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 20:14]
  output [9:0]  io_out_1_bits_excpVec, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/Backend.scala 20:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_1_bits_ldst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_1_bits_lrs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_1_bits_lrs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_1_bits_pdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_1_bits_prs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_1_bits_prs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_1_bits_oldPdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_1_bits_robIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [6:0]  io_out_1_bits_robIdxFull, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_lqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_1_bits_sqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [1:0]  io_out_1_bits_issueQueue, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_prs1Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_1_bits_prs2Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_out_2_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_ctrl_mulDivOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 20:14]
  output [9:0]  io_out_2_bits_excpVec, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/Backend.scala 20:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_2_bits_ldst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_2_bits_lrs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_2_bits_lrs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_2_bits_pdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_2_bits_prs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_2_bits_prs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_2_bits_oldPdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_2_bits_robIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [6:0]  io_out_2_bits_robIdxFull, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_lqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_2_bits_sqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [1:0]  io_out_2_bits_issueQueue, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_prs1Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_2_bits_prs2Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_out_3_ready, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_3_bits_pc, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_3_bits_inst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_3_bits_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_3_bits_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_ctrl_mulDivOp, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_3_bits_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [2:0]  io_out_3_bits_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_ctrl_immType, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 20:14]
  output [9:0]  io_out_3_bits_excpVec, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_3_bits_imm, // @[src/main/scala/backend/Backend.scala 20:14]
  output [13:0] io_out_3_bits_csrAddress, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 20:14]
  output [31:0] io_out_3_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_3_bits_ldst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_3_bits_lrs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [4:0]  io_out_3_bits_lrs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_3_bits_pdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_3_bits_prs1, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_3_bits_prs2, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_3_bits_oldPdst, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_rs1Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_rs2Valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_rdValid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_out_3_bits_robIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [6:0]  io_out_3_bits_robIdxFull, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_lqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [3:0]  io_out_3_bits_sqIdx, // @[src/main/scala/backend/Backend.scala 20:14]
  output [1:0]  io_out_3_bits_issueQueue, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_prs1Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  output        io_out_3_bits_prs2Busy, // @[src/main/scala/backend/Backend.scala 20:14]
  input         io_extInt // @[src/main/scala/backend/Backend.scala 20:14]
);
  wire  ctrlBlock_clock; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_reset; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_out_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_0_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_out_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_out_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [1:0] ctrlBlock_io_out_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_1_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_1_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_out_1_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_1_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_out_1_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_1_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_1_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_1_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_1_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_1_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_1_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_1_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_out_1_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_1_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [1:0] ctrlBlock_io_out_1_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_1_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_2_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_2_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_out_2_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_2_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_out_2_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_2_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_2_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_2_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_2_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_2_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_2_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_2_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_out_2_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_2_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [1:0] ctrlBlock_io_out_2_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_2_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_3_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_3_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_3_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_3_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_3_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_out_3_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_out_3_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_3_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_out_3_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_out_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_3_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_3_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_out_3_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_3_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_3_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_3_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_out_3_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_out_3_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_out_3_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [1:0] ctrlBlock_io_out_3_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_out_3_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_redirect_flushSelf; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_extInt; // @[src/main/scala/backend/Backend.scala 22:25]
  CtrlBlock ctrlBlock ( // @[src/main/scala/backend/Backend.scala 22:25]
    .clock(ctrlBlock_clock),
    .reset(ctrlBlock_reset),
    .io_in_0_ready(ctrlBlock_io_in_0_ready),
    .io_in_0_valid(ctrlBlock_io_in_0_valid),
    .io_in_0_bits_instr(ctrlBlock_io_in_0_bits_instr),
    .io_in_0_bits_pc(ctrlBlock_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(ctrlBlock_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(ctrlBlock_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(ctrlBlock_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(ctrlBlock_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(ctrlBlock_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(ctrlBlock_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(ctrlBlock_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_exception_excpTlbRefill(ctrlBlock_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(ctrlBlock_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(ctrlBlock_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(ctrlBlock_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(ctrlBlock_io_in_1_ready),
    .io_in_1_valid(ctrlBlock_io_in_1_valid),
    .io_in_1_bits_instr(ctrlBlock_io_in_1_bits_instr),
    .io_in_1_bits_pc(ctrlBlock_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(ctrlBlock_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(ctrlBlock_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(ctrlBlock_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(ctrlBlock_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(ctrlBlock_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(ctrlBlock_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(ctrlBlock_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_exception_excpTlbRefill(ctrlBlock_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(ctrlBlock_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(ctrlBlock_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(ctrlBlock_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(ctrlBlock_io_in_2_ready),
    .io_in_2_valid(ctrlBlock_io_in_2_valid),
    .io_in_2_bits_instr(ctrlBlock_io_in_2_bits_instr),
    .io_in_2_bits_pc(ctrlBlock_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(ctrlBlock_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(ctrlBlock_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(ctrlBlock_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(ctrlBlock_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(ctrlBlock_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(ctrlBlock_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(ctrlBlock_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_exception_excpTlbRefill(ctrlBlock_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(ctrlBlock_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(ctrlBlock_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(ctrlBlock_io_in_2_bits_exception_excpAdef),
    .io_out_0_valid(ctrlBlock_io_out_0_valid),
    .io_out_0_bits_pc(ctrlBlock_io_out_0_bits_pc),
    .io_out_0_bits_inst(ctrlBlock_io_out_0_bits_inst),
    .io_out_0_bits_ctrl_fuType(ctrlBlock_io_out_0_bits_ctrl_fuType),
    .io_out_0_bits_ctrl_aluOp(ctrlBlock_io_out_0_bits_ctrl_aluOp),
    .io_out_0_bits_ctrl_bruOp(ctrlBlock_io_out_0_bits_ctrl_bruOp),
    .io_out_0_bits_ctrl_lsuOp(ctrlBlock_io_out_0_bits_ctrl_lsuOp),
    .io_out_0_bits_ctrl_csrOp(ctrlBlock_io_out_0_bits_ctrl_csrOp),
    .io_out_0_bits_ctrl_mulDivOp(ctrlBlock_io_out_0_bits_ctrl_mulDivOp),
    .io_out_0_bits_ctrl_src1Type(ctrlBlock_io_out_0_bits_ctrl_src1Type),
    .io_out_0_bits_ctrl_src2Type(ctrlBlock_io_out_0_bits_ctrl_src2Type),
    .io_out_0_bits_ctrl_immType(ctrlBlock_io_out_0_bits_ctrl_immType),
    .io_out_0_bits_ctrl_rfWen(ctrlBlock_io_out_0_bits_ctrl_rfWen),
    .io_out_0_bits_ctrl_memRead(ctrlBlock_io_out_0_bits_ctrl_memRead),
    .io_out_0_bits_ctrl_memWrite(ctrlBlock_io_out_0_bits_ctrl_memWrite),
    .io_out_0_bits_ctrl_csrWen(ctrlBlock_io_out_0_bits_ctrl_csrWen),
    .io_out_0_bits_ctrl_isBranch(ctrlBlock_io_out_0_bits_ctrl_isBranch),
    .io_out_0_bits_ctrl_isJump(ctrlBlock_io_out_0_bits_ctrl_isJump),
    .io_out_0_bits_ctrl_isPriv(ctrlBlock_io_out_0_bits_ctrl_isPriv),
    .io_out_0_bits_excpVec(ctrlBlock_io_out_0_bits_excpVec),
    .io_out_0_bits_imm(ctrlBlock_io_out_0_bits_imm),
    .io_out_0_bits_csrAddress(ctrlBlock_io_out_0_bits_csrAddress),
    .io_out_0_bits_pdInfo_valid(ctrlBlock_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(ctrlBlock_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(ctrlBlock_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(ctrlBlock_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(ctrlBlock_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(ctrlBlock_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(ctrlBlock_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_ldst(ctrlBlock_io_out_0_bits_ldst),
    .io_out_0_bits_lrs1(ctrlBlock_io_out_0_bits_lrs1),
    .io_out_0_bits_lrs2(ctrlBlock_io_out_0_bits_lrs2),
    .io_out_0_bits_pdst(ctrlBlock_io_out_0_bits_pdst),
    .io_out_0_bits_prs1(ctrlBlock_io_out_0_bits_prs1),
    .io_out_0_bits_prs2(ctrlBlock_io_out_0_bits_prs2),
    .io_out_0_bits_oldPdst(ctrlBlock_io_out_0_bits_oldPdst),
    .io_out_0_bits_rs1Valid(ctrlBlock_io_out_0_bits_rs1Valid),
    .io_out_0_bits_rs2Valid(ctrlBlock_io_out_0_bits_rs2Valid),
    .io_out_0_bits_rdValid(ctrlBlock_io_out_0_bits_rdValid),
    .io_out_0_bits_robIdx(ctrlBlock_io_out_0_bits_robIdx),
    .io_out_0_bits_robIdxFull(ctrlBlock_io_out_0_bits_robIdxFull),
    .io_out_0_bits_lqIdx(ctrlBlock_io_out_0_bits_lqIdx),
    .io_out_0_bits_sqIdx(ctrlBlock_io_out_0_bits_sqIdx),
    .io_out_0_bits_issueQueue(ctrlBlock_io_out_0_bits_issueQueue),
    .io_out_0_bits_prs1Busy(ctrlBlock_io_out_0_bits_prs1Busy),
    .io_out_0_bits_prs2Busy(ctrlBlock_io_out_0_bits_prs2Busy),
    .io_out_1_valid(ctrlBlock_io_out_1_valid),
    .io_out_1_bits_pc(ctrlBlock_io_out_1_bits_pc),
    .io_out_1_bits_inst(ctrlBlock_io_out_1_bits_inst),
    .io_out_1_bits_ctrl_fuType(ctrlBlock_io_out_1_bits_ctrl_fuType),
    .io_out_1_bits_ctrl_aluOp(ctrlBlock_io_out_1_bits_ctrl_aluOp),
    .io_out_1_bits_ctrl_bruOp(ctrlBlock_io_out_1_bits_ctrl_bruOp),
    .io_out_1_bits_ctrl_lsuOp(ctrlBlock_io_out_1_bits_ctrl_lsuOp),
    .io_out_1_bits_ctrl_csrOp(ctrlBlock_io_out_1_bits_ctrl_csrOp),
    .io_out_1_bits_ctrl_mulDivOp(ctrlBlock_io_out_1_bits_ctrl_mulDivOp),
    .io_out_1_bits_ctrl_src1Type(ctrlBlock_io_out_1_bits_ctrl_src1Type),
    .io_out_1_bits_ctrl_src2Type(ctrlBlock_io_out_1_bits_ctrl_src2Type),
    .io_out_1_bits_ctrl_immType(ctrlBlock_io_out_1_bits_ctrl_immType),
    .io_out_1_bits_ctrl_rfWen(ctrlBlock_io_out_1_bits_ctrl_rfWen),
    .io_out_1_bits_ctrl_memRead(ctrlBlock_io_out_1_bits_ctrl_memRead),
    .io_out_1_bits_ctrl_memWrite(ctrlBlock_io_out_1_bits_ctrl_memWrite),
    .io_out_1_bits_ctrl_csrWen(ctrlBlock_io_out_1_bits_ctrl_csrWen),
    .io_out_1_bits_ctrl_isBranch(ctrlBlock_io_out_1_bits_ctrl_isBranch),
    .io_out_1_bits_ctrl_isJump(ctrlBlock_io_out_1_bits_ctrl_isJump),
    .io_out_1_bits_ctrl_isPriv(ctrlBlock_io_out_1_bits_ctrl_isPriv),
    .io_out_1_bits_excpVec(ctrlBlock_io_out_1_bits_excpVec),
    .io_out_1_bits_imm(ctrlBlock_io_out_1_bits_imm),
    .io_out_1_bits_csrAddress(ctrlBlock_io_out_1_bits_csrAddress),
    .io_out_1_bits_pdInfo_valid(ctrlBlock_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(ctrlBlock_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(ctrlBlock_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(ctrlBlock_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(ctrlBlock_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(ctrlBlock_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(ctrlBlock_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_ldst(ctrlBlock_io_out_1_bits_ldst),
    .io_out_1_bits_lrs1(ctrlBlock_io_out_1_bits_lrs1),
    .io_out_1_bits_lrs2(ctrlBlock_io_out_1_bits_lrs2),
    .io_out_1_bits_pdst(ctrlBlock_io_out_1_bits_pdst),
    .io_out_1_bits_prs1(ctrlBlock_io_out_1_bits_prs1),
    .io_out_1_bits_prs2(ctrlBlock_io_out_1_bits_prs2),
    .io_out_1_bits_oldPdst(ctrlBlock_io_out_1_bits_oldPdst),
    .io_out_1_bits_rs1Valid(ctrlBlock_io_out_1_bits_rs1Valid),
    .io_out_1_bits_rs2Valid(ctrlBlock_io_out_1_bits_rs2Valid),
    .io_out_1_bits_rdValid(ctrlBlock_io_out_1_bits_rdValid),
    .io_out_1_bits_robIdx(ctrlBlock_io_out_1_bits_robIdx),
    .io_out_1_bits_robIdxFull(ctrlBlock_io_out_1_bits_robIdxFull),
    .io_out_1_bits_lqIdx(ctrlBlock_io_out_1_bits_lqIdx),
    .io_out_1_bits_sqIdx(ctrlBlock_io_out_1_bits_sqIdx),
    .io_out_1_bits_issueQueue(ctrlBlock_io_out_1_bits_issueQueue),
    .io_out_1_bits_prs1Busy(ctrlBlock_io_out_1_bits_prs1Busy),
    .io_out_1_bits_prs2Busy(ctrlBlock_io_out_1_bits_prs2Busy),
    .io_out_2_valid(ctrlBlock_io_out_2_valid),
    .io_out_2_bits_pc(ctrlBlock_io_out_2_bits_pc),
    .io_out_2_bits_inst(ctrlBlock_io_out_2_bits_inst),
    .io_out_2_bits_ctrl_fuType(ctrlBlock_io_out_2_bits_ctrl_fuType),
    .io_out_2_bits_ctrl_aluOp(ctrlBlock_io_out_2_bits_ctrl_aluOp),
    .io_out_2_bits_ctrl_bruOp(ctrlBlock_io_out_2_bits_ctrl_bruOp),
    .io_out_2_bits_ctrl_lsuOp(ctrlBlock_io_out_2_bits_ctrl_lsuOp),
    .io_out_2_bits_ctrl_csrOp(ctrlBlock_io_out_2_bits_ctrl_csrOp),
    .io_out_2_bits_ctrl_mulDivOp(ctrlBlock_io_out_2_bits_ctrl_mulDivOp),
    .io_out_2_bits_ctrl_src1Type(ctrlBlock_io_out_2_bits_ctrl_src1Type),
    .io_out_2_bits_ctrl_src2Type(ctrlBlock_io_out_2_bits_ctrl_src2Type),
    .io_out_2_bits_ctrl_immType(ctrlBlock_io_out_2_bits_ctrl_immType),
    .io_out_2_bits_ctrl_rfWen(ctrlBlock_io_out_2_bits_ctrl_rfWen),
    .io_out_2_bits_ctrl_memRead(ctrlBlock_io_out_2_bits_ctrl_memRead),
    .io_out_2_bits_ctrl_memWrite(ctrlBlock_io_out_2_bits_ctrl_memWrite),
    .io_out_2_bits_ctrl_csrWen(ctrlBlock_io_out_2_bits_ctrl_csrWen),
    .io_out_2_bits_ctrl_isBranch(ctrlBlock_io_out_2_bits_ctrl_isBranch),
    .io_out_2_bits_ctrl_isJump(ctrlBlock_io_out_2_bits_ctrl_isJump),
    .io_out_2_bits_ctrl_isPriv(ctrlBlock_io_out_2_bits_ctrl_isPriv),
    .io_out_2_bits_excpVec(ctrlBlock_io_out_2_bits_excpVec),
    .io_out_2_bits_imm(ctrlBlock_io_out_2_bits_imm),
    .io_out_2_bits_csrAddress(ctrlBlock_io_out_2_bits_csrAddress),
    .io_out_2_bits_pdInfo_valid(ctrlBlock_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(ctrlBlock_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(ctrlBlock_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(ctrlBlock_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(ctrlBlock_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(ctrlBlock_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(ctrlBlock_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_ldst(ctrlBlock_io_out_2_bits_ldst),
    .io_out_2_bits_lrs1(ctrlBlock_io_out_2_bits_lrs1),
    .io_out_2_bits_lrs2(ctrlBlock_io_out_2_bits_lrs2),
    .io_out_2_bits_pdst(ctrlBlock_io_out_2_bits_pdst),
    .io_out_2_bits_prs1(ctrlBlock_io_out_2_bits_prs1),
    .io_out_2_bits_prs2(ctrlBlock_io_out_2_bits_prs2),
    .io_out_2_bits_oldPdst(ctrlBlock_io_out_2_bits_oldPdst),
    .io_out_2_bits_rs1Valid(ctrlBlock_io_out_2_bits_rs1Valid),
    .io_out_2_bits_rs2Valid(ctrlBlock_io_out_2_bits_rs2Valid),
    .io_out_2_bits_rdValid(ctrlBlock_io_out_2_bits_rdValid),
    .io_out_2_bits_robIdx(ctrlBlock_io_out_2_bits_robIdx),
    .io_out_2_bits_robIdxFull(ctrlBlock_io_out_2_bits_robIdxFull),
    .io_out_2_bits_lqIdx(ctrlBlock_io_out_2_bits_lqIdx),
    .io_out_2_bits_sqIdx(ctrlBlock_io_out_2_bits_sqIdx),
    .io_out_2_bits_issueQueue(ctrlBlock_io_out_2_bits_issueQueue),
    .io_out_2_bits_prs1Busy(ctrlBlock_io_out_2_bits_prs1Busy),
    .io_out_2_bits_prs2Busy(ctrlBlock_io_out_2_bits_prs2Busy),
    .io_out_3_valid(ctrlBlock_io_out_3_valid),
    .io_out_3_bits_pc(ctrlBlock_io_out_3_bits_pc),
    .io_out_3_bits_inst(ctrlBlock_io_out_3_bits_inst),
    .io_out_3_bits_ctrl_fuType(ctrlBlock_io_out_3_bits_ctrl_fuType),
    .io_out_3_bits_ctrl_aluOp(ctrlBlock_io_out_3_bits_ctrl_aluOp),
    .io_out_3_bits_ctrl_bruOp(ctrlBlock_io_out_3_bits_ctrl_bruOp),
    .io_out_3_bits_ctrl_lsuOp(ctrlBlock_io_out_3_bits_ctrl_lsuOp),
    .io_out_3_bits_ctrl_csrOp(ctrlBlock_io_out_3_bits_ctrl_csrOp),
    .io_out_3_bits_ctrl_mulDivOp(ctrlBlock_io_out_3_bits_ctrl_mulDivOp),
    .io_out_3_bits_ctrl_src1Type(ctrlBlock_io_out_3_bits_ctrl_src1Type),
    .io_out_3_bits_ctrl_src2Type(ctrlBlock_io_out_3_bits_ctrl_src2Type),
    .io_out_3_bits_ctrl_immType(ctrlBlock_io_out_3_bits_ctrl_immType),
    .io_out_3_bits_ctrl_rfWen(ctrlBlock_io_out_3_bits_ctrl_rfWen),
    .io_out_3_bits_ctrl_memRead(ctrlBlock_io_out_3_bits_ctrl_memRead),
    .io_out_3_bits_ctrl_memWrite(ctrlBlock_io_out_3_bits_ctrl_memWrite),
    .io_out_3_bits_ctrl_csrWen(ctrlBlock_io_out_3_bits_ctrl_csrWen),
    .io_out_3_bits_ctrl_isBranch(ctrlBlock_io_out_3_bits_ctrl_isBranch),
    .io_out_3_bits_ctrl_isJump(ctrlBlock_io_out_3_bits_ctrl_isJump),
    .io_out_3_bits_ctrl_isPriv(ctrlBlock_io_out_3_bits_ctrl_isPriv),
    .io_out_3_bits_excpVec(ctrlBlock_io_out_3_bits_excpVec),
    .io_out_3_bits_imm(ctrlBlock_io_out_3_bits_imm),
    .io_out_3_bits_csrAddress(ctrlBlock_io_out_3_bits_csrAddress),
    .io_out_3_bits_pdInfo_valid(ctrlBlock_io_out_3_bits_pdInfo_valid),
    .io_out_3_bits_pdInfo_isBr(ctrlBlock_io_out_3_bits_pdInfo_isBr),
    .io_out_3_bits_pdInfo_isJal(ctrlBlock_io_out_3_bits_pdInfo_isJal),
    .io_out_3_bits_pdInfo_isJalr(ctrlBlock_io_out_3_bits_pdInfo_isJalr),
    .io_out_3_bits_pdInfo_isCall(ctrlBlock_io_out_3_bits_pdInfo_isCall),
    .io_out_3_bits_pdInfo_isRet(ctrlBlock_io_out_3_bits_pdInfo_isRet),
    .io_out_3_bits_pdInfo_jumpTarget(ctrlBlock_io_out_3_bits_pdInfo_jumpTarget),
    .io_out_3_bits_ldst(ctrlBlock_io_out_3_bits_ldst),
    .io_out_3_bits_lrs1(ctrlBlock_io_out_3_bits_lrs1),
    .io_out_3_bits_lrs2(ctrlBlock_io_out_3_bits_lrs2),
    .io_out_3_bits_pdst(ctrlBlock_io_out_3_bits_pdst),
    .io_out_3_bits_prs1(ctrlBlock_io_out_3_bits_prs1),
    .io_out_3_bits_prs2(ctrlBlock_io_out_3_bits_prs2),
    .io_out_3_bits_oldPdst(ctrlBlock_io_out_3_bits_oldPdst),
    .io_out_3_bits_rs1Valid(ctrlBlock_io_out_3_bits_rs1Valid),
    .io_out_3_bits_rs2Valid(ctrlBlock_io_out_3_bits_rs2Valid),
    .io_out_3_bits_rdValid(ctrlBlock_io_out_3_bits_rdValid),
    .io_out_3_bits_robIdx(ctrlBlock_io_out_3_bits_robIdx),
    .io_out_3_bits_robIdxFull(ctrlBlock_io_out_3_bits_robIdxFull),
    .io_out_3_bits_lqIdx(ctrlBlock_io_out_3_bits_lqIdx),
    .io_out_3_bits_sqIdx(ctrlBlock_io_out_3_bits_sqIdx),
    .io_out_3_bits_issueQueue(ctrlBlock_io_out_3_bits_issueQueue),
    .io_out_3_bits_prs1Busy(ctrlBlock_io_out_3_bits_prs1Busy),
    .io_out_3_bits_prs2Busy(ctrlBlock_io_out_3_bits_prs2Busy),
    .io_redirect_valid(ctrlBlock_io_redirect_valid),
    .io_redirect_robIdx(ctrlBlock_io_redirect_robIdx),
    .io_redirect_flushSelf(ctrlBlock_io_redirect_flushSelf),
    .io_extInt(ctrlBlock_io_extInt)
  );
  assign io_in_0_ready = ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 24:22]
  assign io_in_1_ready = ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 24:22]
  assign io_in_2_ready = ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 24:22]
  assign io_out_0_valid = ctrlBlock_io_out_0_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pc = ctrlBlock_io_out_0_bits_pc; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_inst = ctrlBlock_io_out_0_bits_inst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_fuType = ctrlBlock_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_aluOp = ctrlBlock_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_bruOp = ctrlBlock_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_lsuOp = ctrlBlock_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_csrOp = ctrlBlock_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_mulDivOp = ctrlBlock_io_out_0_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_src1Type = ctrlBlock_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_src2Type = ctrlBlock_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_immType = ctrlBlock_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_rfWen = ctrlBlock_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_memRead = ctrlBlock_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_memWrite = ctrlBlock_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_csrWen = ctrlBlock_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_isBranch = ctrlBlock_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_isJump = ctrlBlock_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ctrl_isPriv = ctrlBlock_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_excpVec = ctrlBlock_io_out_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_imm = ctrlBlock_io_out_0_bits_imm; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_csrAddress = ctrlBlock_io_out_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_valid = ctrlBlock_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_isBr = ctrlBlock_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_isJal = ctrlBlock_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_isJalr = ctrlBlock_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_isCall = ctrlBlock_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_isRet = ctrlBlock_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdInfo_jumpTarget = ctrlBlock_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_ldst = ctrlBlock_io_out_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_lrs1 = ctrlBlock_io_out_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_lrs2 = ctrlBlock_io_out_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_pdst = ctrlBlock_io_out_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_prs1 = ctrlBlock_io_out_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_prs2 = ctrlBlock_io_out_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_oldPdst = ctrlBlock_io_out_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_rs1Valid = ctrlBlock_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_rs2Valid = ctrlBlock_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_rdValid = ctrlBlock_io_out_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_robIdx = ctrlBlock_io_out_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_robIdxFull = ctrlBlock_io_out_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_lqIdx = ctrlBlock_io_out_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_sqIdx = ctrlBlock_io_out_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_issueQueue = ctrlBlock_io_out_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_prs1Busy = ctrlBlock_io_out_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_0_bits_prs2Busy = ctrlBlock_io_out_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_valid = ctrlBlock_io_out_1_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pc = ctrlBlock_io_out_1_bits_pc; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_inst = ctrlBlock_io_out_1_bits_inst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_fuType = ctrlBlock_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_aluOp = ctrlBlock_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_bruOp = ctrlBlock_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_lsuOp = ctrlBlock_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_csrOp = ctrlBlock_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_mulDivOp = ctrlBlock_io_out_1_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_src1Type = ctrlBlock_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_src2Type = ctrlBlock_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_immType = ctrlBlock_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_rfWen = ctrlBlock_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_memRead = ctrlBlock_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_memWrite = ctrlBlock_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_csrWen = ctrlBlock_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_isBranch = ctrlBlock_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_isJump = ctrlBlock_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ctrl_isPriv = ctrlBlock_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_excpVec = ctrlBlock_io_out_1_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_imm = ctrlBlock_io_out_1_bits_imm; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_csrAddress = ctrlBlock_io_out_1_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_valid = ctrlBlock_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_isBr = ctrlBlock_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_isJal = ctrlBlock_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_isJalr = ctrlBlock_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_isCall = ctrlBlock_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_isRet = ctrlBlock_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdInfo_jumpTarget = ctrlBlock_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_ldst = ctrlBlock_io_out_1_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_lrs1 = ctrlBlock_io_out_1_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_lrs2 = ctrlBlock_io_out_1_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_pdst = ctrlBlock_io_out_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_prs1 = ctrlBlock_io_out_1_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_prs2 = ctrlBlock_io_out_1_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_oldPdst = ctrlBlock_io_out_1_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_rs1Valid = ctrlBlock_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_rs2Valid = ctrlBlock_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_rdValid = ctrlBlock_io_out_1_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_robIdx = ctrlBlock_io_out_1_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_robIdxFull = ctrlBlock_io_out_1_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_lqIdx = ctrlBlock_io_out_1_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_sqIdx = ctrlBlock_io_out_1_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_issueQueue = ctrlBlock_io_out_1_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_prs1Busy = ctrlBlock_io_out_1_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_1_bits_prs2Busy = ctrlBlock_io_out_1_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_valid = ctrlBlock_io_out_2_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pc = ctrlBlock_io_out_2_bits_pc; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_inst = ctrlBlock_io_out_2_bits_inst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_fuType = ctrlBlock_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_aluOp = ctrlBlock_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_bruOp = ctrlBlock_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_lsuOp = ctrlBlock_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_csrOp = ctrlBlock_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_mulDivOp = ctrlBlock_io_out_2_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_src1Type = ctrlBlock_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_src2Type = ctrlBlock_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_immType = ctrlBlock_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_rfWen = ctrlBlock_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_memRead = ctrlBlock_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_memWrite = ctrlBlock_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_csrWen = ctrlBlock_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_isBranch = ctrlBlock_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_isJump = ctrlBlock_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ctrl_isPriv = ctrlBlock_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_excpVec = ctrlBlock_io_out_2_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_imm = ctrlBlock_io_out_2_bits_imm; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_csrAddress = ctrlBlock_io_out_2_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_valid = ctrlBlock_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_isBr = ctrlBlock_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_isJal = ctrlBlock_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_isJalr = ctrlBlock_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_isCall = ctrlBlock_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_isRet = ctrlBlock_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdInfo_jumpTarget = ctrlBlock_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_ldst = ctrlBlock_io_out_2_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_lrs1 = ctrlBlock_io_out_2_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_lrs2 = ctrlBlock_io_out_2_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_pdst = ctrlBlock_io_out_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_prs1 = ctrlBlock_io_out_2_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_prs2 = ctrlBlock_io_out_2_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_oldPdst = ctrlBlock_io_out_2_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_rs1Valid = ctrlBlock_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_rs2Valid = ctrlBlock_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_rdValid = ctrlBlock_io_out_2_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_robIdx = ctrlBlock_io_out_2_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_robIdxFull = ctrlBlock_io_out_2_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_lqIdx = ctrlBlock_io_out_2_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_sqIdx = ctrlBlock_io_out_2_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_issueQueue = ctrlBlock_io_out_2_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_prs1Busy = ctrlBlock_io_out_2_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_2_bits_prs2Busy = ctrlBlock_io_out_2_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_valid = ctrlBlock_io_out_3_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pc = ctrlBlock_io_out_3_bits_pc; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_inst = ctrlBlock_io_out_3_bits_inst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_fuType = ctrlBlock_io_out_3_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_aluOp = ctrlBlock_io_out_3_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_bruOp = ctrlBlock_io_out_3_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_lsuOp = ctrlBlock_io_out_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_csrOp = ctrlBlock_io_out_3_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_mulDivOp = ctrlBlock_io_out_3_bits_ctrl_mulDivOp; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_src1Type = ctrlBlock_io_out_3_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_src2Type = ctrlBlock_io_out_3_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_immType = ctrlBlock_io_out_3_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_rfWen = ctrlBlock_io_out_3_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_memRead = ctrlBlock_io_out_3_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_memWrite = ctrlBlock_io_out_3_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_csrWen = ctrlBlock_io_out_3_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_isBranch = ctrlBlock_io_out_3_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_isJump = ctrlBlock_io_out_3_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ctrl_isPriv = ctrlBlock_io_out_3_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_excpVec = ctrlBlock_io_out_3_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_imm = ctrlBlock_io_out_3_bits_imm; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_csrAddress = ctrlBlock_io_out_3_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_valid = ctrlBlock_io_out_3_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_isBr = ctrlBlock_io_out_3_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_isJal = ctrlBlock_io_out_3_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_isJalr = ctrlBlock_io_out_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_isCall = ctrlBlock_io_out_3_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_isRet = ctrlBlock_io_out_3_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdInfo_jumpTarget = ctrlBlock_io_out_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_ldst = ctrlBlock_io_out_3_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_lrs1 = ctrlBlock_io_out_3_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_lrs2 = ctrlBlock_io_out_3_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_pdst = ctrlBlock_io_out_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_prs1 = ctrlBlock_io_out_3_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_prs2 = ctrlBlock_io_out_3_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_oldPdst = ctrlBlock_io_out_3_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_rs1Valid = ctrlBlock_io_out_3_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_rs2Valid = ctrlBlock_io_out_3_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_rdValid = ctrlBlock_io_out_3_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_robIdx = ctrlBlock_io_out_3_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_robIdxFull = ctrlBlock_io_out_3_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_lqIdx = ctrlBlock_io_out_3_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_sqIdx = ctrlBlock_io_out_3_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_issueQueue = ctrlBlock_io_out_3_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_prs1Busy = ctrlBlock_io_out_3_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign io_out_3_bits_prs2Busy = ctrlBlock_io_out_3_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:22]
  assign ctrlBlock_clock = clock;
  assign ctrlBlock_reset = reset;
  assign ctrlBlock_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:22]
  assign ctrlBlock_io_extInt = io_extInt; // @[src/main/scala/backend/Backend.scala 27:23]
endmodule
