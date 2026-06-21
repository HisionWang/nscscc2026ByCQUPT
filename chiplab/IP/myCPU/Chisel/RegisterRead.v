module RegisterRead(
  input         clock,
  input         reset,
  output        io_iqIssues_0_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_0_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_0_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_0_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [9:0]  io_iqIssues_0_bits_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_0_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [13:0] io_iqIssues_0_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_0_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_0_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_0_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_0_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_0_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_0_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_0_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_0_bits_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_0_bits_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_lqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_sqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_1_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_1_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_1_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_1_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [9:0]  io_iqIssues_1_bits_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_1_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [13:0] io_iqIssues_1_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_1_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_1_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_1_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_1_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_1_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_1_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_1_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_1_bits_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_1_bits_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_1_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_2_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_2_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_2_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_2_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [9:0]  io_iqIssues_2_bits_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_2_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [13:0] io_iqIssues_2_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_2_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_2_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_2_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_2_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_2_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_2_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_2_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_2_bits_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_2_bits_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_lqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_sqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_3_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_4_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_exeReqs_0_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_0_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [9:0]  io_exeReqs_0_bits_uop_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [13:0] io_exeReqs_0_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_0_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_0_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_0_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_0_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_0_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_0_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_0_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_0_bits_uop_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_0_bits_uop_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_lqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_sqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_0_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_exeReqs_1_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_1_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [9:0]  io_exeReqs_1_bits_uop_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [13:0] io_exeReqs_1_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_1_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_1_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_1_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_1_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_1_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_1_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_1_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_1_bits_uop_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_1_bits_uop_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_1_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_1_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_exeReqs_2_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_2_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [9:0]  io_exeReqs_2_bits_uop_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [13:0] io_exeReqs_2_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_2_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_2_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_2_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_2_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_2_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_2_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_2_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_2_bits_uop_robIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_2_bits_uop_robIdxFull, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_lqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_sqIdx, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_rs2Data // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
`endif // RANDOMIZE_REG_INIT
  reg  rrd_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg [31:0] rrd_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [9:0] rrd_uop_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [13:0] rrd_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  reg [31:0] out_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [9:0] out_uop_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [13:0] out_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:24]
  reg [31:0] out_rs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:24]
  wire  out_fire = out_valid & io_exeReqs_0_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out = rrd_valid & (~out_valid | out_fire); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready = ~rrd_valid | rrd_to_out; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire = io_iqIssues_0_valid & rrd_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _io_rfReadAddrs_0_T = rrd_valid ? rrd_uop_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 123:42]
  wire [6:0] _io_rfReadAddrs_1_T = rrd_valid ? rrd_uop_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 125:42]
  wire  _GEN_0 = rrd_to_out ? 1'h0 : rrd_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_1 = iq_fire | _GEN_0; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_99 = out_fire ? 1'h0 : out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_100 = rrd_to_out | _GEN_99; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg [31:0] rrd_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [9:0] rrd_uop_1_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [13:0] rrd_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_1_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_1_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  reg [31:0] out_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [9:0] out_uop_1_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [13:0] out_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_1_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_1_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs1_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:24]
  reg [31:0] out_rs2_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:24]
  wire  out_fire_1 = out_valid_1 & io_exeReqs_1_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out_1 = rrd_valid_1 & (~out_valid_1 | out_fire_1); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_1 = ~rrd_valid_1 | rrd_to_out_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_1 = io_iqIssues_1_valid & rrd_ready_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _io_rfReadAddrs_2_T = rrd_valid_1 ? rrd_uop_1_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 123:42]
  wire [6:0] _io_rfReadAddrs_3_T = rrd_valid_1 ? rrd_uop_1_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 125:42]
  wire  _GEN_302 = rrd_to_out_1 ? 1'h0 : rrd_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_303 = iq_fire_1 | _GEN_302; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_401 = out_fire_1 ? 1'h0 : out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_402 = rrd_to_out_1 | _GEN_401; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg [31:0] rrd_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [9:0] rrd_uop_2_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [13:0] rrd_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_2_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_2_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  reg [31:0] out_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [9:0] out_uop_2_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [13:0] out_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_2_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_2_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:24]
  reg [31:0] out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:24]
  wire  out_fire_2 = out_valid_2 & io_exeReqs_2_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out_2 = rrd_valid_2 & (~out_valid_2 | out_fire_2); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_2 = ~rrd_valid_2 | rrd_to_out_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_2 = io_iqIssues_2_valid & rrd_ready_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _io_rfReadAddrs_4_T = rrd_valid_2 ? rrd_uop_2_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 123:42]
  wire [6:0] _io_rfReadAddrs_5_T = rrd_valid_2 ? rrd_uop_2_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 125:42]
  wire  _GEN_604 = rrd_to_out_2 ? 1'h0 : rrd_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_605 = iq_fire_2 | _GEN_604; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_703 = out_fire_2 ? 1'h0 : out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_704 = rrd_to_out_2 | _GEN_703; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg  out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  wire  rrd_to_out_3 = rrd_valid_3 & ~out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_3 = ~rrd_valid_3 | rrd_to_out_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_3 = io_iqIssues_3_valid & rrd_ready_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire  _GEN_906 = rrd_to_out_3 ? 1'h0 : rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_907 = iq_fire_3 | _GEN_906; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_1006 = rrd_to_out_3 | out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg  out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  wire  rrd_to_out_4 = rrd_valid_4 & ~out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_4 = ~rrd_valid_4 | rrd_to_out_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_4 = io_iqIssues_4_valid & rrd_ready_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire  _GEN_1208 = rrd_to_out_4 ? 1'h0 : rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_1209 = iq_fire_4 | _GEN_1208; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_1308 = rrd_to_out_4 | out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  assign io_iqIssues_0_ready = ~rrd_valid | rrd_to_out; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  assign io_iqIssues_1_ready = ~rrd_valid_1 | rrd_to_out_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  assign io_iqIssues_2_ready = ~rrd_valid_2 | rrd_to_out_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  assign io_iqIssues_3_ready = ~rrd_valid_3 | rrd_to_out_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  assign io_iqIssues_4_ready = ~rrd_valid_4 | rrd_to_out_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  assign io_rfReadAddrs_0 = iq_fire ? io_iqIssues_0_bits_prs1 : _io_rfReadAddrs_0_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 122:42]
  assign io_rfReadAddrs_1 = iq_fire ? io_iqIssues_0_bits_prs2 : _io_rfReadAddrs_1_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 124:42]
  assign io_rfReadAddrs_2 = iq_fire_1 ? io_iqIssues_1_bits_prs1 : _io_rfReadAddrs_2_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 122:42]
  assign io_rfReadAddrs_3 = iq_fire_1 ? io_iqIssues_1_bits_prs2 : _io_rfReadAddrs_3_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 124:42]
  assign io_rfReadAddrs_4 = iq_fire_2 ? io_iqIssues_2_bits_prs1 : _io_rfReadAddrs_4_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 122:42]
  assign io_rfReadAddrs_5 = iq_fire_2 ? io_iqIssues_2_bits_prs2 : _io_rfReadAddrs_5_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 124:42]
  assign io_exeReqs_0_valid = out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 186:47]
  assign io_exeReqs_0_bits_uop_pc = out_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_inst = out_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_fuType = out_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_aluOp = out_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_bruOp = out_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_lsuOp = out_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_csrOp = out_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_mulOp = out_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_divOp = out_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_src1Type = out_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_src2Type = out_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_immType = out_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_rfWen = out_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_memRead = out_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_memWrite = out_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_csrWen = out_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_isBranch = out_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_isJump = out_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ctrl_isPriv = out_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_excpVec = out_uop_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_imm = out_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_csrAddress = out_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_valid = out_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isBr = out_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isJal = out_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isJalr = out_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isCall = out_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isRet = out_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdInfo_jumpTarget = out_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_ldst = out_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_lrs1 = out_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_lrs2 = out_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_pdst = out_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs1 = out_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs2 = out_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_oldPdst = out_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_rs1Valid = out_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_rs2Valid = out_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_rdValid = out_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_robIdx = out_uop_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_robIdxFull = out_uop_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_lqIdx = out_uop_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_sqIdx = out_uop_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_issueQueue = out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs1Busy = out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs2Busy = out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_isSta = out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_rs1Data = out_rs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 188:34]
  assign io_exeReqs_0_bits_rs2Data = out_rs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 189:34]
  assign io_exeReqs_1_valid = out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 186:47]
  assign io_exeReqs_1_bits_uop_pc = out_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_inst = out_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_fuType = out_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_aluOp = out_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_bruOp = out_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_lsuOp = out_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_csrOp = out_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_mulOp = out_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_divOp = out_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_src1Type = out_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_src2Type = out_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_immType = out_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_rfWen = out_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_memRead = out_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_memWrite = out_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_csrWen = out_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_isBranch = out_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_isJump = out_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ctrl_isPriv = out_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_excpVec = out_uop_1_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_imm = out_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_csrAddress = out_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_valid = out_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isBr = out_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isJal = out_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isJalr = out_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isCall = out_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isRet = out_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdInfo_jumpTarget = out_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_ldst = out_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_lrs1 = out_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_lrs2 = out_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_pdst = out_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_prs1 = out_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_prs2 = out_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_oldPdst = out_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_rs1Valid = out_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_rs2Valid = out_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_rdValid = out_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_robIdx = out_uop_1_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_robIdxFull = out_uop_1_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_issueQueue = out_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_prs1Busy = out_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_prs2Busy = out_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_rs1Data = out_rs1_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 188:34]
  assign io_exeReqs_1_bits_rs2Data = out_rs2_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 189:34]
  assign io_exeReqs_2_valid = out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 186:47]
  assign io_exeReqs_2_bits_uop_pc = out_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_inst = out_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_fuType = out_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_aluOp = out_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_bruOp = out_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_lsuOp = out_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_csrOp = out_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_mulOp = out_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_divOp = out_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_src1Type = out_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_src2Type = out_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_immType = out_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_rfWen = out_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_memRead = out_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_memWrite = out_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_csrWen = out_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_isBranch = out_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_isJump = out_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ctrl_isPriv = out_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_excpVec = out_uop_2_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_imm = out_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_csrAddress = out_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_valid = out_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isBr = out_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isJal = out_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isJalr = out_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isCall = out_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isRet = out_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdInfo_jumpTarget = out_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_ldst = out_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_lrs1 = out_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_lrs2 = out_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_pdst = out_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs1 = out_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs2 = out_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_oldPdst = out_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_rs1Valid = out_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_rs2Valid = out_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_rdValid = out_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_robIdx = out_uop_2_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_robIdxFull = out_uop_2_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_lqIdx = out_uop_2_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_sqIdx = out_uop_2_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_issueQueue = out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs1Busy = out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs2Busy = out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_isSta = out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_rs1Data = out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 188:34]
  assign io_exeReqs_2_bits_rs2Data = out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 189:34]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid <= _GEN_1;
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pc <= io_iqIssues_0_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_inst <= io_iqIssues_0_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_fuType <= io_iqIssues_0_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_aluOp <= io_iqIssues_0_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_bruOp <= io_iqIssues_0_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_lsuOp <= io_iqIssues_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_csrOp <= io_iqIssues_0_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_mulOp <= io_iqIssues_0_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_divOp <= io_iqIssues_0_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_src1Type <= io_iqIssues_0_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_src2Type <= io_iqIssues_0_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_immType <= io_iqIssues_0_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_rfWen <= io_iqIssues_0_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_memRead <= io_iqIssues_0_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_memWrite <= io_iqIssues_0_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_csrWen <= io_iqIssues_0_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_isBranch <= io_iqIssues_0_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_isJump <= io_iqIssues_0_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ctrl_isPriv <= io_iqIssues_0_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_excpVec <= io_iqIssues_0_bits_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_imm <= io_iqIssues_0_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_csrAddress <= io_iqIssues_0_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_valid <= io_iqIssues_0_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_isBr <= io_iqIssues_0_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_isJal <= io_iqIssues_0_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_isJalr <= io_iqIssues_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_isCall <= io_iqIssues_0_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_isRet <= io_iqIssues_0_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdInfo_jumpTarget <= io_iqIssues_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_ldst <= io_iqIssues_0_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_lrs1 <= io_iqIssues_0_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_lrs2 <= io_iqIssues_0_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_pdst <= io_iqIssues_0_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_prs1 <= io_iqIssues_0_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_prs2 <= io_iqIssues_0_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_oldPdst <= io_iqIssues_0_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_rs1Valid <= io_iqIssues_0_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_rs2Valid <= io_iqIssues_0_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_rdValid <= io_iqIssues_0_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_robIdx <= io_iqIssues_0_bits_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_robIdxFull <= io_iqIssues_0_bits_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_lqIdx <= io_iqIssues_0_bits_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_sqIdx <= io_iqIssues_0_bits_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_issueQueue <= io_iqIssues_0_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_prs1Busy <= io_iqIssues_0_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_prs2Busy <= io_iqIssues_0_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_isSta <= io_iqIssues_0_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid <= _GEN_100;
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pc <= rrd_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_inst <= rrd_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_fuType <= rrd_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_aluOp <= rrd_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_bruOp <= rrd_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_lsuOp <= rrd_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_csrOp <= rrd_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_mulOp <= rrd_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_divOp <= rrd_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_src1Type <= rrd_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_src2Type <= rrd_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_immType <= rrd_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_rfWen <= rrd_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_memRead <= rrd_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_memWrite <= rrd_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_csrWen <= rrd_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_isBranch <= rrd_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_isJump <= rrd_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ctrl_isPriv <= rrd_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_excpVec <= rrd_uop_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_imm <= rrd_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_csrAddress <= rrd_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_valid <= rrd_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_isBr <= rrd_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_isJal <= rrd_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_isJalr <= rrd_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_isCall <= rrd_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_isRet <= rrd_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdInfo_jumpTarget <= rrd_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_ldst <= rrd_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_lrs1 <= rrd_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_lrs2 <= rrd_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_pdst <= rrd_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_prs1 <= rrd_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_prs2 <= rrd_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_oldPdst <= rrd_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_rs1Valid <= rrd_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_rs2Valid <= rrd_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_rdValid <= rrd_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_robIdx <= rrd_uop_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_robIdxFull <= rrd_uop_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_lqIdx <= rrd_uop_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_sqIdx <= rrd_uop_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_issueQueue <= rrd_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_prs1Busy <= rrd_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_prs2Busy <= rrd_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_isSta <= rrd_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 141:22]
        out_rs1 <= 32'h0;
      end else if (rrd_uop_prs1 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 142:22]
        out_rs1 <= 32'h0;
      end else begin
        out_rs1 <= io_rfReadData_0;
      end
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 144:10]
        out_rs2 <= 32'h0;
      end else if (rrd_uop_prs2 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 145:10]
        out_rs2 <= 32'h0;
      end else begin
        out_rs2 <= io_rfReadData_1;
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid_1 <= _GEN_303;
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pc <= io_iqIssues_1_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_inst <= io_iqIssues_1_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_fuType <= io_iqIssues_1_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_aluOp <= io_iqIssues_1_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_bruOp <= io_iqIssues_1_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_lsuOp <= io_iqIssues_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_csrOp <= io_iqIssues_1_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_mulOp <= io_iqIssues_1_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_divOp <= io_iqIssues_1_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_src1Type <= io_iqIssues_1_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_src2Type <= io_iqIssues_1_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_immType <= io_iqIssues_1_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_rfWen <= io_iqIssues_1_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_memRead <= io_iqIssues_1_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_memWrite <= io_iqIssues_1_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_csrWen <= io_iqIssues_1_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_isBranch <= io_iqIssues_1_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_isJump <= io_iqIssues_1_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ctrl_isPriv <= io_iqIssues_1_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_excpVec <= io_iqIssues_1_bits_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_imm <= io_iqIssues_1_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_csrAddress <= io_iqIssues_1_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_valid <= io_iqIssues_1_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_isBr <= io_iqIssues_1_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_isJal <= io_iqIssues_1_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_isJalr <= io_iqIssues_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_isCall <= io_iqIssues_1_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_isRet <= io_iqIssues_1_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdInfo_jumpTarget <= io_iqIssues_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_ldst <= io_iqIssues_1_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_lrs1 <= io_iqIssues_1_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_lrs2 <= io_iqIssues_1_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_pdst <= io_iqIssues_1_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_prs1 <= io_iqIssues_1_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_prs2 <= io_iqIssues_1_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_oldPdst <= io_iqIssues_1_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_rs1Valid <= io_iqIssues_1_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_rs2Valid <= io_iqIssues_1_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_rdValid <= io_iqIssues_1_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_robIdx <= io_iqIssues_1_bits_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_robIdxFull <= io_iqIssues_1_bits_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_issueQueue <= io_iqIssues_1_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_prs1Busy <= io_iqIssues_1_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_prs2Busy <= io_iqIssues_1_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_1 <= _GEN_402;
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pc <= rrd_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_inst <= rrd_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_fuType <= rrd_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_aluOp <= rrd_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_bruOp <= rrd_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_lsuOp <= rrd_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_csrOp <= rrd_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_mulOp <= rrd_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_divOp <= rrd_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_src1Type <= rrd_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_src2Type <= rrd_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_immType <= rrd_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_rfWen <= rrd_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_memRead <= rrd_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_memWrite <= rrd_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_csrWen <= rrd_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_isBranch <= rrd_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_isJump <= rrd_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ctrl_isPriv <= rrd_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_excpVec <= rrd_uop_1_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_imm <= rrd_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_csrAddress <= rrd_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_valid <= rrd_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_isBr <= rrd_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_isJal <= rrd_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_isJalr <= rrd_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_isCall <= rrd_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_isRet <= rrd_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdInfo_jumpTarget <= rrd_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_ldst <= rrd_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_lrs1 <= rrd_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_lrs2 <= rrd_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_pdst <= rrd_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_prs1 <= rrd_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_prs2 <= rrd_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_oldPdst <= rrd_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_rs1Valid <= rrd_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_rs2Valid <= rrd_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_rdValid <= rrd_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_robIdx <= rrd_uop_1_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_robIdxFull <= rrd_uop_1_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_issueQueue <= rrd_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_prs1Busy <= rrd_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_prs2Busy <= rrd_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_1_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 141:22]
        out_rs1_1 <= 32'h0;
      end else if (rrd_uop_1_prs1 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 142:22]
        out_rs1_1 <= 32'h0;
      end else begin
        out_rs1_1 <= io_rfReadData_2;
      end
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_1_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 144:10]
        out_rs2_1 <= 32'h0;
      end else if (rrd_uop_1_prs2 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 145:10]
        out_rs2_1 <= 32'h0;
      end else begin
        out_rs2_1 <= io_rfReadData_3;
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid_2 <= _GEN_605;
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pc <= io_iqIssues_2_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_inst <= io_iqIssues_2_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_fuType <= io_iqIssues_2_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_aluOp <= io_iqIssues_2_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_bruOp <= io_iqIssues_2_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_lsuOp <= io_iqIssues_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_csrOp <= io_iqIssues_2_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_mulOp <= io_iqIssues_2_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_divOp <= io_iqIssues_2_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_src1Type <= io_iqIssues_2_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_src2Type <= io_iqIssues_2_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_immType <= io_iqIssues_2_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_rfWen <= io_iqIssues_2_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_memRead <= io_iqIssues_2_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_memWrite <= io_iqIssues_2_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_csrWen <= io_iqIssues_2_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_isBranch <= io_iqIssues_2_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_isJump <= io_iqIssues_2_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ctrl_isPriv <= io_iqIssues_2_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_excpVec <= io_iqIssues_2_bits_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_imm <= io_iqIssues_2_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_csrAddress <= io_iqIssues_2_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_valid <= io_iqIssues_2_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_isBr <= io_iqIssues_2_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_isJal <= io_iqIssues_2_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_isJalr <= io_iqIssues_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_isCall <= io_iqIssues_2_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_isRet <= io_iqIssues_2_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdInfo_jumpTarget <= io_iqIssues_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_ldst <= io_iqIssues_2_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_lrs1 <= io_iqIssues_2_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_lrs2 <= io_iqIssues_2_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_pdst <= io_iqIssues_2_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_prs1 <= io_iqIssues_2_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_prs2 <= io_iqIssues_2_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_oldPdst <= io_iqIssues_2_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_rs1Valid <= io_iqIssues_2_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_rs2Valid <= io_iqIssues_2_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_rdValid <= io_iqIssues_2_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_robIdx <= io_iqIssues_2_bits_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_robIdxFull <= io_iqIssues_2_bits_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_lqIdx <= io_iqIssues_2_bits_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_sqIdx <= io_iqIssues_2_bits_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_issueQueue <= io_iqIssues_2_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_prs1Busy <= io_iqIssues_2_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_prs2Busy <= io_iqIssues_2_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_isSta <= io_iqIssues_2_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_2 <= _GEN_704;
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pc <= rrd_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_inst <= rrd_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_fuType <= rrd_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_aluOp <= rrd_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_bruOp <= rrd_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_lsuOp <= rrd_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_csrOp <= rrd_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_mulOp <= rrd_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_divOp <= rrd_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_src1Type <= rrd_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_src2Type <= rrd_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_immType <= rrd_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_rfWen <= rrd_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_memRead <= rrd_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_memWrite <= rrd_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_csrWen <= rrd_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_isBranch <= rrd_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_isJump <= rrd_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ctrl_isPriv <= rrd_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_excpVec <= rrd_uop_2_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_imm <= rrd_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_csrAddress <= rrd_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_valid <= rrd_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_isBr <= rrd_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_isJal <= rrd_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_isJalr <= rrd_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_isCall <= rrd_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_isRet <= rrd_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdInfo_jumpTarget <= rrd_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_ldst <= rrd_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_lrs1 <= rrd_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_lrs2 <= rrd_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_pdst <= rrd_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_prs1 <= rrd_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_prs2 <= rrd_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_oldPdst <= rrd_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_rs1Valid <= rrd_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_rs2Valid <= rrd_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_rdValid <= rrd_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_robIdx <= rrd_uop_2_robIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_robIdxFull <= rrd_uop_2_robIdxFull; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_lqIdx <= rrd_uop_2_lqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_sqIdx <= rrd_uop_2_sqIdx; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_issueQueue <= rrd_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_prs1Busy <= rrd_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_prs2Busy <= rrd_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_isSta <= rrd_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_2_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 141:22]
        out_rs1_2 <= 32'h0;
      end else if (rrd_uop_2_prs1 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 142:22]
        out_rs1_2 <= 32'h0;
      end else begin
        out_rs1_2 <= io_rfReadData_4;
      end
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_2_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 144:10]
        out_rs2_2 <= 32'h0;
      end else if (rrd_uop_2_prs2 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 145:10]
        out_rs2_2 <= 32'h0;
      end else begin
        out_rs2_2 <= io_rfReadData_5;
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid_3 <= _GEN_907;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_3 <= _GEN_1006;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid_4 <= _GEN_1209;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_4 <= _GEN_1308;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rrd_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rrd_uop_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rrd_uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rrd_uop_ctrl_fuType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  rrd_uop_ctrl_aluOp = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  rrd_uop_ctrl_bruOp = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  rrd_uop_ctrl_lsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  rrd_uop_ctrl_csrOp = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  rrd_uop_ctrl_mulOp = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  rrd_uop_ctrl_divOp = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  rrd_uop_ctrl_src1Type = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  rrd_uop_ctrl_src2Type = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  rrd_uop_ctrl_immType = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  rrd_uop_ctrl_rfWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  rrd_uop_ctrl_memRead = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  rrd_uop_ctrl_memWrite = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  rrd_uop_ctrl_csrWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  rrd_uop_ctrl_isBranch = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  rrd_uop_ctrl_isJump = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  rrd_uop_ctrl_isPriv = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  rrd_uop_excpVec = _RAND_20[9:0];
  _RAND_21 = {1{`RANDOM}};
  rrd_uop_imm = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  rrd_uop_csrAddress = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  rrd_uop_pdInfo_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  rrd_uop_pdInfo_isBr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  rrd_uop_pdInfo_isJal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  rrd_uop_pdInfo_isJalr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  rrd_uop_pdInfo_isCall = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  rrd_uop_pdInfo_isRet = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  rrd_uop_pdInfo_jumpTarget = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  rrd_uop_ldst = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  rrd_uop_lrs1 = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  rrd_uop_lrs2 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  rrd_uop_pdst = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  rrd_uop_prs1 = _RAND_34[6:0];
  _RAND_35 = {1{`RANDOM}};
  rrd_uop_prs2 = _RAND_35[6:0];
  _RAND_36 = {1{`RANDOM}};
  rrd_uop_oldPdst = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  rrd_uop_rs1Valid = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  rrd_uop_rs2Valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  rrd_uop_rdValid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  rrd_uop_robIdx = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  rrd_uop_robIdxFull = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  rrd_uop_lqIdx = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  rrd_uop_sqIdx = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  rrd_uop_issueQueue = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  rrd_uop_prs1Busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  rrd_uop_prs2Busy = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  rrd_uop_isSta = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  out_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  out_uop_pc = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  out_uop_inst = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  out_uop_ctrl_fuType = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  out_uop_ctrl_aluOp = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  out_uop_ctrl_bruOp = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  out_uop_ctrl_lsuOp = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  out_uop_ctrl_csrOp = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  out_uop_ctrl_mulOp = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  out_uop_ctrl_divOp = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  out_uop_ctrl_src1Type = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  out_uop_ctrl_src2Type = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  out_uop_ctrl_immType = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  out_uop_ctrl_rfWen = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  out_uop_ctrl_memRead = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  out_uop_ctrl_memWrite = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  out_uop_ctrl_csrWen = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  out_uop_ctrl_isBranch = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  out_uop_ctrl_isJump = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  out_uop_ctrl_isPriv = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  out_uop_excpVec = _RAND_68[9:0];
  _RAND_69 = {1{`RANDOM}};
  out_uop_imm = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  out_uop_csrAddress = _RAND_70[13:0];
  _RAND_71 = {1{`RANDOM}};
  out_uop_pdInfo_valid = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  out_uop_pdInfo_isBr = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  out_uop_pdInfo_isJal = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  out_uop_pdInfo_isJalr = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  out_uop_pdInfo_isCall = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  out_uop_pdInfo_isRet = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  out_uop_pdInfo_jumpTarget = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  out_uop_ldst = _RAND_78[4:0];
  _RAND_79 = {1{`RANDOM}};
  out_uop_lrs1 = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  out_uop_lrs2 = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  out_uop_pdst = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  out_uop_prs1 = _RAND_82[6:0];
  _RAND_83 = {1{`RANDOM}};
  out_uop_prs2 = _RAND_83[6:0];
  _RAND_84 = {1{`RANDOM}};
  out_uop_oldPdst = _RAND_84[6:0];
  _RAND_85 = {1{`RANDOM}};
  out_uop_rs1Valid = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  out_uop_rs2Valid = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  out_uop_rdValid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  out_uop_robIdx = _RAND_88[5:0];
  _RAND_89 = {1{`RANDOM}};
  out_uop_robIdxFull = _RAND_89[6:0];
  _RAND_90 = {1{`RANDOM}};
  out_uop_lqIdx = _RAND_90[3:0];
  _RAND_91 = {1{`RANDOM}};
  out_uop_sqIdx = _RAND_91[3:0];
  _RAND_92 = {1{`RANDOM}};
  out_uop_issueQueue = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  out_uop_prs1Busy = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  out_uop_prs2Busy = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  out_uop_isSta = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  out_rs1 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  out_rs2 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  rrd_valid_1 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  rrd_uop_1_pc = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  rrd_uop_1_inst = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  rrd_uop_1_ctrl_fuType = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  rrd_uop_1_ctrl_aluOp = _RAND_102[4:0];
  _RAND_103 = {1{`RANDOM}};
  rrd_uop_1_ctrl_bruOp = _RAND_103[3:0];
  _RAND_104 = {1{`RANDOM}};
  rrd_uop_1_ctrl_lsuOp = _RAND_104[3:0];
  _RAND_105 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrOp = _RAND_105[2:0];
  _RAND_106 = {1{`RANDOM}};
  rrd_uop_1_ctrl_mulOp = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  rrd_uop_1_ctrl_divOp = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src1Type = _RAND_108[2:0];
  _RAND_109 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src2Type = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  rrd_uop_1_ctrl_immType = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  rrd_uop_1_ctrl_rfWen = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memRead = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memWrite = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrWen = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isBranch = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isJump = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isPriv = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  rrd_uop_1_excpVec = _RAND_118[9:0];
  _RAND_119 = {1{`RANDOM}};
  rrd_uop_1_imm = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  rrd_uop_1_csrAddress = _RAND_120[13:0];
  _RAND_121 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_valid = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isBr = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJal = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJalr = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isCall = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isRet = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_jumpTarget = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  rrd_uop_1_ldst = _RAND_128[4:0];
  _RAND_129 = {1{`RANDOM}};
  rrd_uop_1_lrs1 = _RAND_129[4:0];
  _RAND_130 = {1{`RANDOM}};
  rrd_uop_1_lrs2 = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  rrd_uop_1_pdst = _RAND_131[6:0];
  _RAND_132 = {1{`RANDOM}};
  rrd_uop_1_prs1 = _RAND_132[6:0];
  _RAND_133 = {1{`RANDOM}};
  rrd_uop_1_prs2 = _RAND_133[6:0];
  _RAND_134 = {1{`RANDOM}};
  rrd_uop_1_oldPdst = _RAND_134[6:0];
  _RAND_135 = {1{`RANDOM}};
  rrd_uop_1_rs1Valid = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  rrd_uop_1_rs2Valid = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  rrd_uop_1_rdValid = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  rrd_uop_1_robIdx = _RAND_138[5:0];
  _RAND_139 = {1{`RANDOM}};
  rrd_uop_1_robIdxFull = _RAND_139[6:0];
  _RAND_140 = {1{`RANDOM}};
  rrd_uop_1_issueQueue = _RAND_140[2:0];
  _RAND_141 = {1{`RANDOM}};
  rrd_uop_1_prs1Busy = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  rrd_uop_1_prs2Busy = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  out_valid_1 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  out_uop_1_pc = _RAND_144[31:0];
  _RAND_145 = {1{`RANDOM}};
  out_uop_1_inst = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  out_uop_1_ctrl_fuType = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  out_uop_1_ctrl_aluOp = _RAND_147[4:0];
  _RAND_148 = {1{`RANDOM}};
  out_uop_1_ctrl_bruOp = _RAND_148[3:0];
  _RAND_149 = {1{`RANDOM}};
  out_uop_1_ctrl_lsuOp = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  out_uop_1_ctrl_csrOp = _RAND_150[2:0];
  _RAND_151 = {1{`RANDOM}};
  out_uop_1_ctrl_mulOp = _RAND_151[2:0];
  _RAND_152 = {1{`RANDOM}};
  out_uop_1_ctrl_divOp = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  out_uop_1_ctrl_src1Type = _RAND_153[2:0];
  _RAND_154 = {1{`RANDOM}};
  out_uop_1_ctrl_src2Type = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  out_uop_1_ctrl_immType = _RAND_155[3:0];
  _RAND_156 = {1{`RANDOM}};
  out_uop_1_ctrl_rfWen = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  out_uop_1_ctrl_memRead = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  out_uop_1_ctrl_memWrite = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  out_uop_1_ctrl_csrWen = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  out_uop_1_ctrl_isBranch = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  out_uop_1_ctrl_isJump = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  out_uop_1_ctrl_isPriv = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  out_uop_1_excpVec = _RAND_163[9:0];
  _RAND_164 = {1{`RANDOM}};
  out_uop_1_imm = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  out_uop_1_csrAddress = _RAND_165[13:0];
  _RAND_166 = {1{`RANDOM}};
  out_uop_1_pdInfo_valid = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  out_uop_1_pdInfo_isBr = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJal = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJalr = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  out_uop_1_pdInfo_isCall = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  out_uop_1_pdInfo_isRet = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  out_uop_1_pdInfo_jumpTarget = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  out_uop_1_ldst = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  out_uop_1_lrs1 = _RAND_174[4:0];
  _RAND_175 = {1{`RANDOM}};
  out_uop_1_lrs2 = _RAND_175[4:0];
  _RAND_176 = {1{`RANDOM}};
  out_uop_1_pdst = _RAND_176[6:0];
  _RAND_177 = {1{`RANDOM}};
  out_uop_1_prs1 = _RAND_177[6:0];
  _RAND_178 = {1{`RANDOM}};
  out_uop_1_prs2 = _RAND_178[6:0];
  _RAND_179 = {1{`RANDOM}};
  out_uop_1_oldPdst = _RAND_179[6:0];
  _RAND_180 = {1{`RANDOM}};
  out_uop_1_rs1Valid = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  out_uop_1_rs2Valid = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  out_uop_1_rdValid = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  out_uop_1_robIdx = _RAND_183[5:0];
  _RAND_184 = {1{`RANDOM}};
  out_uop_1_robIdxFull = _RAND_184[6:0];
  _RAND_185 = {1{`RANDOM}};
  out_uop_1_issueQueue = _RAND_185[2:0];
  _RAND_186 = {1{`RANDOM}};
  out_uop_1_prs1Busy = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  out_uop_1_prs2Busy = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  out_rs1_1 = _RAND_188[31:0];
  _RAND_189 = {1{`RANDOM}};
  out_rs2_1 = _RAND_189[31:0];
  _RAND_190 = {1{`RANDOM}};
  rrd_valid_2 = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  rrd_uop_2_pc = _RAND_191[31:0];
  _RAND_192 = {1{`RANDOM}};
  rrd_uop_2_inst = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  rrd_uop_2_ctrl_fuType = _RAND_193[3:0];
  _RAND_194 = {1{`RANDOM}};
  rrd_uop_2_ctrl_aluOp = _RAND_194[4:0];
  _RAND_195 = {1{`RANDOM}};
  rrd_uop_2_ctrl_bruOp = _RAND_195[3:0];
  _RAND_196 = {1{`RANDOM}};
  rrd_uop_2_ctrl_lsuOp = _RAND_196[3:0];
  _RAND_197 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrOp = _RAND_197[2:0];
  _RAND_198 = {1{`RANDOM}};
  rrd_uop_2_ctrl_mulOp = _RAND_198[2:0];
  _RAND_199 = {1{`RANDOM}};
  rrd_uop_2_ctrl_divOp = _RAND_199[2:0];
  _RAND_200 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src1Type = _RAND_200[2:0];
  _RAND_201 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src2Type = _RAND_201[2:0];
  _RAND_202 = {1{`RANDOM}};
  rrd_uop_2_ctrl_immType = _RAND_202[3:0];
  _RAND_203 = {1{`RANDOM}};
  rrd_uop_2_ctrl_rfWen = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memRead = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memWrite = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrWen = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isBranch = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isJump = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isPriv = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  rrd_uop_2_excpVec = _RAND_210[9:0];
  _RAND_211 = {1{`RANDOM}};
  rrd_uop_2_imm = _RAND_211[31:0];
  _RAND_212 = {1{`RANDOM}};
  rrd_uop_2_csrAddress = _RAND_212[13:0];
  _RAND_213 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_valid = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isBr = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJal = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJalr = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isCall = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isRet = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_jumpTarget = _RAND_219[31:0];
  _RAND_220 = {1{`RANDOM}};
  rrd_uop_2_ldst = _RAND_220[4:0];
  _RAND_221 = {1{`RANDOM}};
  rrd_uop_2_lrs1 = _RAND_221[4:0];
  _RAND_222 = {1{`RANDOM}};
  rrd_uop_2_lrs2 = _RAND_222[4:0];
  _RAND_223 = {1{`RANDOM}};
  rrd_uop_2_pdst = _RAND_223[6:0];
  _RAND_224 = {1{`RANDOM}};
  rrd_uop_2_prs1 = _RAND_224[6:0];
  _RAND_225 = {1{`RANDOM}};
  rrd_uop_2_prs2 = _RAND_225[6:0];
  _RAND_226 = {1{`RANDOM}};
  rrd_uop_2_oldPdst = _RAND_226[6:0];
  _RAND_227 = {1{`RANDOM}};
  rrd_uop_2_rs1Valid = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  rrd_uop_2_rs2Valid = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  rrd_uop_2_rdValid = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  rrd_uop_2_robIdx = _RAND_230[5:0];
  _RAND_231 = {1{`RANDOM}};
  rrd_uop_2_robIdxFull = _RAND_231[6:0];
  _RAND_232 = {1{`RANDOM}};
  rrd_uop_2_lqIdx = _RAND_232[3:0];
  _RAND_233 = {1{`RANDOM}};
  rrd_uop_2_sqIdx = _RAND_233[3:0];
  _RAND_234 = {1{`RANDOM}};
  rrd_uop_2_issueQueue = _RAND_234[2:0];
  _RAND_235 = {1{`RANDOM}};
  rrd_uop_2_prs1Busy = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  rrd_uop_2_prs2Busy = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  rrd_uop_2_isSta = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  out_valid_2 = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  out_uop_2_pc = _RAND_239[31:0];
  _RAND_240 = {1{`RANDOM}};
  out_uop_2_inst = _RAND_240[31:0];
  _RAND_241 = {1{`RANDOM}};
  out_uop_2_ctrl_fuType = _RAND_241[3:0];
  _RAND_242 = {1{`RANDOM}};
  out_uop_2_ctrl_aluOp = _RAND_242[4:0];
  _RAND_243 = {1{`RANDOM}};
  out_uop_2_ctrl_bruOp = _RAND_243[3:0];
  _RAND_244 = {1{`RANDOM}};
  out_uop_2_ctrl_lsuOp = _RAND_244[3:0];
  _RAND_245 = {1{`RANDOM}};
  out_uop_2_ctrl_csrOp = _RAND_245[2:0];
  _RAND_246 = {1{`RANDOM}};
  out_uop_2_ctrl_mulOp = _RAND_246[2:0];
  _RAND_247 = {1{`RANDOM}};
  out_uop_2_ctrl_divOp = _RAND_247[2:0];
  _RAND_248 = {1{`RANDOM}};
  out_uop_2_ctrl_src1Type = _RAND_248[2:0];
  _RAND_249 = {1{`RANDOM}};
  out_uop_2_ctrl_src2Type = _RAND_249[2:0];
  _RAND_250 = {1{`RANDOM}};
  out_uop_2_ctrl_immType = _RAND_250[3:0];
  _RAND_251 = {1{`RANDOM}};
  out_uop_2_ctrl_rfWen = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  out_uop_2_ctrl_memRead = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  out_uop_2_ctrl_memWrite = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  out_uop_2_ctrl_csrWen = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  out_uop_2_ctrl_isBranch = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  out_uop_2_ctrl_isJump = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  out_uop_2_ctrl_isPriv = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  out_uop_2_excpVec = _RAND_258[9:0];
  _RAND_259 = {1{`RANDOM}};
  out_uop_2_imm = _RAND_259[31:0];
  _RAND_260 = {1{`RANDOM}};
  out_uop_2_csrAddress = _RAND_260[13:0];
  _RAND_261 = {1{`RANDOM}};
  out_uop_2_pdInfo_valid = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  out_uop_2_pdInfo_isBr = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJal = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJalr = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  out_uop_2_pdInfo_isCall = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  out_uop_2_pdInfo_isRet = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  out_uop_2_pdInfo_jumpTarget = _RAND_267[31:0];
  _RAND_268 = {1{`RANDOM}};
  out_uop_2_ldst = _RAND_268[4:0];
  _RAND_269 = {1{`RANDOM}};
  out_uop_2_lrs1 = _RAND_269[4:0];
  _RAND_270 = {1{`RANDOM}};
  out_uop_2_lrs2 = _RAND_270[4:0];
  _RAND_271 = {1{`RANDOM}};
  out_uop_2_pdst = _RAND_271[6:0];
  _RAND_272 = {1{`RANDOM}};
  out_uop_2_prs1 = _RAND_272[6:0];
  _RAND_273 = {1{`RANDOM}};
  out_uop_2_prs2 = _RAND_273[6:0];
  _RAND_274 = {1{`RANDOM}};
  out_uop_2_oldPdst = _RAND_274[6:0];
  _RAND_275 = {1{`RANDOM}};
  out_uop_2_rs1Valid = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  out_uop_2_rs2Valid = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  out_uop_2_rdValid = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  out_uop_2_robIdx = _RAND_278[5:0];
  _RAND_279 = {1{`RANDOM}};
  out_uop_2_robIdxFull = _RAND_279[6:0];
  _RAND_280 = {1{`RANDOM}};
  out_uop_2_lqIdx = _RAND_280[3:0];
  _RAND_281 = {1{`RANDOM}};
  out_uop_2_sqIdx = _RAND_281[3:0];
  _RAND_282 = {1{`RANDOM}};
  out_uop_2_issueQueue = _RAND_282[2:0];
  _RAND_283 = {1{`RANDOM}};
  out_uop_2_prs1Busy = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  out_uop_2_prs2Busy = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  out_uop_2_isSta = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  out_rs1_2 = _RAND_286[31:0];
  _RAND_287 = {1{`RANDOM}};
  out_rs2_2 = _RAND_287[31:0];
  _RAND_288 = {1{`RANDOM}};
  rrd_valid_3 = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  out_valid_3 = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  rrd_valid_4 = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  out_valid_4 = _RAND_291[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
