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
  input  [5:0]  io_iqIssues_0_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_0_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_0_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_0_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_0_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  input  [5:0]  io_iqIssues_1_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_1_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_1_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  input  [5:0]  io_iqIssues_2_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_2_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_2_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_2_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_2_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_3_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_3_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_3_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_3_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [9:0]  io_iqIssues_3_bits_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_3_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [13:0] io_iqIssues_3_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_3_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_3_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_3_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_3_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_3_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_3_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_3_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_3_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_3_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_3_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_3_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_3_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_3_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_iqIssues_4_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_4_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_4_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_4_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [9:0]  io_iqIssues_4_bits_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_4_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [13:0] io_iqIssues_4_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_iqIssues_4_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_4_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_4_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [4:0]  io_iqIssues_4_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_4_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_4_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_4_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [6:0]  io_iqIssues_4_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_4_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [5:0]  io_iqIssues_4_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [3:0]  io_iqIssues_4_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [2:0]  io_iqIssues_4_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_iqIssues_4_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_6, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_rfReadAddrs_7, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_6, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input  [31:0] io_rfReadData_7, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  output [5:0]  io_exeReqs_0_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_0_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_0_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_0_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_0_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  output [5:0]  io_exeReqs_1_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_1_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_1_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  output [5:0]  io_exeReqs_2_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_2_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_2_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_2_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_2_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_2_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_exeReqs_3_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_3_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_3_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_3_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [9:0]  io_exeReqs_3_bits_uop_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_3_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [13:0] io_exeReqs_3_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_3_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_3_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_3_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_3_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_3_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_3_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_3_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_3_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_3_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_3_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_3_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_3_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_3_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_3_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  input         io_exeReqs_4_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_4_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_4_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_4_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [9:0]  io_exeReqs_4_bits_uop_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_4_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [13:0] io_exeReqs_4_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_4_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_4_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_4_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [4:0]  io_exeReqs_4_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_4_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_4_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_4_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [6:0]  io_exeReqs_4_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_4_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [5:0]  io_exeReqs_4_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [3:0]  io_exeReqs_4_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [2:0]  io_exeReqs_4_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output        io_exeReqs_4_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
  output [31:0] io_exeReqs_4_bits_rs2Data // @[src/main/scala/backend/regfile/RegisterRead.scala 46:14]
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
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
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
  reg [5:0] rrd_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
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
  reg [5:0] out_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
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
  wire  _GEN_107 = out_fire ? 1'h0 : out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_108 = rrd_to_out | _GEN_107; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
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
  reg [5:0] rrd_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
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
  reg [5:0] out_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
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
  wire  _GEN_326 = rrd_to_out_1 ? 1'h0 : rrd_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_327 = iq_fire_1 | _GEN_326; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_433 = out_fire_1 ? 1'h0 : out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_434 = rrd_to_out_1 | _GEN_433; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
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
  reg [5:0] rrd_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
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
  reg [5:0] out_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:24]
  reg [31:0] out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:24]
  wire  out_fire_2 = out_valid_2 & io_exeReqs_2_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out_2 = rrd_valid_2 & (~out_valid_2 | out_fire_2); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_2 = ~rrd_valid_2 | rrd_to_out_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_2 = io_iqIssues_2_valid & rrd_ready_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _io_rfReadAddrs_4_T = rrd_valid_2 ? rrd_uop_2_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 123:42]
  wire [6:0] _io_rfReadAddrs_5_T = rrd_valid_2 ? rrd_uop_2_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 125:42]
  wire  _GEN_652 = rrd_to_out_2 ? 1'h0 : rrd_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_653 = iq_fire_2 | _GEN_652; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_759 = out_fire_2 ? 1'h0 : out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_760 = rrd_to_out_2 | _GEN_759; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg [31:0] rrd_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [9:0] rrd_uop_3_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [13:0] rrd_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  reg [31:0] out_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [9:0] out_uop_3_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [13:0] out_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs1_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:24]
  wire  out_fire_3 = out_valid_3 & io_exeReqs_3_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out_3 = rrd_valid_3 & (~out_valid_3 | out_fire_3); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_3 = ~rrd_valid_3 | rrd_to_out_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_3 = io_iqIssues_3_valid & rrd_ready_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _readSrc_T_2 = rrd_valid_3 ? rrd_uop_3_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 130:52]
  wire  _GEN_978 = rrd_to_out_3 ? 1'h0 : rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_979 = iq_fire_3 | _GEN_978; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_1085 = out_fire_3 ? 1'h0 : out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_1086 = rrd_to_out_3 | _GEN_1085; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
  reg  rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
  reg [31:0] rrd_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [9:0] rrd_uop_4_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [13:0] rrd_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [31:0] rrd_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [4:0] rrd_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [6:0] rrd_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [5:0] rrd_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [3:0] rrd_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg [2:0] rrd_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  rrd_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 87:24]
  reg  out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
  reg [31:0] out_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [9:0] out_uop_4_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [13:0] out_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [4:0] out_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [6:0] out_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [5:0] out_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [3:0] out_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [2:0] out_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg  out_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:24]
  reg [31:0] out_rs2_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:24]
  wire  out_fire_4 = out_valid_4 & io_exeReqs_4_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 108:47]
  wire  rrd_to_out_4 = rrd_valid_4 & (~out_valid_4 | out_fire_4); // @[src/main/scala/backend/regfile/RegisterRead.scala 109:47]
  wire  rrd_ready_4 = ~rrd_valid_4 | rrd_to_out_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 110:33]
  wire  iq_fire_4 = io_iqIssues_4_valid & rrd_ready_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 111:44]
  wire [6:0] _readSrc_T_4 = rrd_valid_4 ? rrd_uop_4_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 129:52]
  wire  _GEN_1304 = rrd_to_out_4 ? 1'h0 : rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 166:30 167:19 86:28]
  wire  _GEN_1305 = iq_fire_4 | _GEN_1304; // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27 164:19]
  wire  _GEN_1411 = out_fire_4 ? 1'h0 : out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:28 179:19 92:28]
  wire  _GEN_1412 = rrd_to_out_4 | _GEN_1411; // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30 174:19]
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
  assign io_rfReadAddrs_6 = iq_fire_3 ? io_iqIssues_3_bits_prs1 : _readSrc_T_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 130:12]
  assign io_rfReadAddrs_7 = iq_fire_4 ? io_iqIssues_4_bits_prs2 : _readSrc_T_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 129:12]
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
  assign io_exeReqs_0_bits_uop_robIdx_value = out_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_robIdx_flag = out_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_robIdxFull_value = out_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_robIdxFull_flag = out_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_lqIdx_value = out_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_lqIdx_flag = out_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_sqIdx_value = out_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_sqIdx_flag = out_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_issueQueue = out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs1Busy = out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_prs2Busy = out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_isSta = out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_0_bits_uop_isStd = out_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
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
  assign io_exeReqs_1_bits_uop_robIdx_value = out_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_robIdx_flag = out_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_robIdxFull_value = out_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_1_bits_uop_robIdxFull_flag = out_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
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
  assign io_exeReqs_2_bits_uop_robIdx_value = out_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_robIdx_flag = out_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_robIdxFull_value = out_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_robIdxFull_flag = out_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_lqIdx_value = out_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_lqIdx_flag = out_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_sqIdx_value = out_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_sqIdx_flag = out_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_issueQueue = out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs1Busy = out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_prs2Busy = out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_isSta = out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_uop_isStd = out_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_2_bits_rs1Data = out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 188:34]
  assign io_exeReqs_2_bits_rs2Data = out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 189:34]
  assign io_exeReqs_3_valid = out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 186:47]
  assign io_exeReqs_3_bits_uop_pc = out_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_inst = out_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_fuType = out_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_aluOp = out_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_bruOp = out_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_lsuOp = out_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_csrOp = out_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_mulOp = out_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_divOp = out_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_src1Type = out_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_src2Type = out_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_immType = out_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_rfWen = out_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_memRead = out_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_memWrite = out_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_csrWen = out_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_isBranch = out_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_isJump = out_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ctrl_isPriv = out_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_excpVec = out_uop_3_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_imm = out_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_csrAddress = out_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_valid = out_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isBr = out_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isJal = out_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isJalr = out_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isCall = out_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isRet = out_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdInfo_jumpTarget = out_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_ldst = out_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_lrs1 = out_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_lrs2 = out_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_pdst = out_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_prs1 = out_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_prs2 = out_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_oldPdst = out_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_rs1Valid = out_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_rs2Valid = out_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_rdValid = out_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_robIdx_value = out_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_robIdx_flag = out_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_robIdxFull_value = out_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_robIdxFull_flag = out_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_lqIdx_value = out_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_lqIdx_flag = out_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_sqIdx_value = out_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_sqIdx_flag = out_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_issueQueue = out_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_prs1Busy = out_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_prs2Busy = out_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_isSta = out_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_uop_isStd = out_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_3_bits_rs1Data = out_rs1_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 188:34]
  assign io_exeReqs_4_valid = out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 186:47]
  assign io_exeReqs_4_bits_uop_pc = out_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_inst = out_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_fuType = out_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_aluOp = out_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_bruOp = out_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_lsuOp = out_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_csrOp = out_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_mulOp = out_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_divOp = out_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_src1Type = out_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_src2Type = out_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_immType = out_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_rfWen = out_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_memRead = out_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_memWrite = out_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_csrWen = out_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_isBranch = out_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_isJump = out_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ctrl_isPriv = out_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_excpVec = out_uop_4_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_imm = out_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_csrAddress = out_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_valid = out_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isBr = out_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isJal = out_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isJalr = out_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isCall = out_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isRet = out_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdInfo_jumpTarget = out_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_ldst = out_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_lrs1 = out_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_lrs2 = out_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_pdst = out_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_prs1 = out_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_prs2 = out_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_oldPdst = out_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_rs1Valid = out_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_rs2Valid = out_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_rdValid = out_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_robIdx_value = out_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_robIdx_flag = out_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_robIdxFull_value = out_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_robIdxFull_flag = out_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_lqIdx_value = out_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_lqIdx_flag = out_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_sqIdx_value = out_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_sqIdx_flag = out_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_issueQueue = out_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_prs1Busy = out_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_prs2Busy = out_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_isSta = out_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_uop_isStd = out_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 187:34]
  assign io_exeReqs_4_bits_rs2Data = out_rs2_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 189:34]
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
      rrd_uop_robIdx_value <= io_iqIssues_0_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_robIdx_flag <= io_iqIssues_0_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_robIdxFull_value <= io_iqIssues_0_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_robIdxFull_flag <= io_iqIssues_0_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_lqIdx_value <= io_iqIssues_0_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_lqIdx_flag <= io_iqIssues_0_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_sqIdx_value <= io_iqIssues_0_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_sqIdx_flag <= io_iqIssues_0_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
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
    if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_isStd <= io_iqIssues_0_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid <= _GEN_108;
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
      out_uop_robIdx_value <= rrd_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_robIdx_flag <= rrd_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_robIdxFull_value <= rrd_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_robIdxFull_flag <= rrd_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_lqIdx_value <= rrd_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_lqIdx_flag <= rrd_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_sqIdx_value <= rrd_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_sqIdx_flag <= rrd_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
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
      out_uop_isStd <= rrd_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
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
      rrd_valid_1 <= _GEN_327;
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
      rrd_uop_1_robIdx_value <= io_iqIssues_1_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_robIdx_flag <= io_iqIssues_1_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_robIdxFull_value <= io_iqIssues_1_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_1_robIdxFull_flag <= io_iqIssues_1_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
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
      out_valid_1 <= _GEN_434;
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
      out_uop_1_robIdx_value <= rrd_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_robIdx_flag <= rrd_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_robIdxFull_value <= rrd_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_1_robIdxFull_flag <= rrd_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
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
      rrd_valid_2 <= _GEN_653;
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
      rrd_uop_2_robIdx_value <= io_iqIssues_2_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_robIdx_flag <= io_iqIssues_2_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_robIdxFull_value <= io_iqIssues_2_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_robIdxFull_flag <= io_iqIssues_2_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_lqIdx_value <= io_iqIssues_2_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_lqIdx_flag <= io_iqIssues_2_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_sqIdx_value <= io_iqIssues_2_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_sqIdx_flag <= io_iqIssues_2_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
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
    if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_2_isStd <= io_iqIssues_2_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_2 <= _GEN_760;
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
      out_uop_2_robIdx_value <= rrd_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_robIdx_flag <= rrd_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_robIdxFull_value <= rrd_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_robIdxFull_flag <= rrd_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_lqIdx_value <= rrd_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_lqIdx_flag <= rrd_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_sqIdx_value <= rrd_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_2_sqIdx_flag <= rrd_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
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
      out_uop_2_isStd <= rrd_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
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
      rrd_valid_3 <= _GEN_979;
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pc <= io_iqIssues_3_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_inst <= io_iqIssues_3_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_fuType <= io_iqIssues_3_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_aluOp <= io_iqIssues_3_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_bruOp <= io_iqIssues_3_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_lsuOp <= io_iqIssues_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_csrOp <= io_iqIssues_3_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_mulOp <= io_iqIssues_3_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_divOp <= io_iqIssues_3_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_src1Type <= io_iqIssues_3_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_src2Type <= io_iqIssues_3_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_immType <= io_iqIssues_3_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_rfWen <= io_iqIssues_3_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_memRead <= io_iqIssues_3_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_memWrite <= io_iqIssues_3_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_csrWen <= io_iqIssues_3_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_isBranch <= io_iqIssues_3_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_isJump <= io_iqIssues_3_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ctrl_isPriv <= io_iqIssues_3_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_excpVec <= io_iqIssues_3_bits_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_imm <= io_iqIssues_3_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_csrAddress <= io_iqIssues_3_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_valid <= io_iqIssues_3_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_isBr <= io_iqIssues_3_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_isJal <= io_iqIssues_3_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_isJalr <= io_iqIssues_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_isCall <= io_iqIssues_3_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_isRet <= io_iqIssues_3_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdInfo_jumpTarget <= io_iqIssues_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_ldst <= io_iqIssues_3_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_lrs1 <= io_iqIssues_3_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_lrs2 <= io_iqIssues_3_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_pdst <= io_iqIssues_3_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_prs1 <= io_iqIssues_3_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_prs2 <= io_iqIssues_3_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_oldPdst <= io_iqIssues_3_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_rs1Valid <= io_iqIssues_3_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_rs2Valid <= io_iqIssues_3_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_rdValid <= io_iqIssues_3_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_robIdx_value <= io_iqIssues_3_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_robIdx_flag <= io_iqIssues_3_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_robIdxFull_value <= io_iqIssues_3_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_robIdxFull_flag <= io_iqIssues_3_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_lqIdx_value <= io_iqIssues_3_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_lqIdx_flag <= io_iqIssues_3_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_sqIdx_value <= io_iqIssues_3_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_sqIdx_flag <= io_iqIssues_3_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_issueQueue <= io_iqIssues_3_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_prs1Busy <= io_iqIssues_3_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_prs2Busy <= io_iqIssues_3_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_isSta <= io_iqIssues_3_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_3_isStd <= io_iqIssues_3_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_3 <= _GEN_1086;
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pc <= rrd_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_inst <= rrd_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_fuType <= rrd_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_aluOp <= rrd_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_bruOp <= rrd_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_lsuOp <= rrd_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_csrOp <= rrd_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_mulOp <= rrd_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_divOp <= rrd_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_src1Type <= rrd_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_src2Type <= rrd_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_immType <= rrd_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_rfWen <= rrd_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_memRead <= rrd_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_memWrite <= rrd_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_csrWen <= rrd_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_isBranch <= rrd_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_isJump <= rrd_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ctrl_isPriv <= rrd_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_excpVec <= rrd_uop_3_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_imm <= rrd_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_csrAddress <= rrd_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_valid <= rrd_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_isBr <= rrd_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_isJal <= rrd_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_isJalr <= rrd_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_isCall <= rrd_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_isRet <= rrd_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdInfo_jumpTarget <= rrd_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_ldst <= rrd_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_lrs1 <= rrd_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_lrs2 <= rrd_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_pdst <= rrd_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_prs1 <= rrd_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_prs2 <= rrd_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_oldPdst <= rrd_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_rs1Valid <= rrd_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_rs2Valid <= rrd_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_rdValid <= rrd_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_robIdx_value <= rrd_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_robIdx_flag <= rrd_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_robIdxFull_value <= rrd_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_robIdxFull_flag <= rrd_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_lqIdx_value <= rrd_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_lqIdx_flag <= rrd_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_sqIdx_value <= rrd_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_sqIdx_flag <= rrd_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_issueQueue <= rrd_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_prs1Busy <= rrd_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_prs2Busy <= rrd_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_isSta <= rrd_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_3_isStd <= rrd_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_3_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 141:22]
        out_rs1_3 <= 32'h0;
      end else if (rrd_uop_3_prs1 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 142:22]
        out_rs1_3 <= 32'h0;
      end else begin
        out_rs1_3 <= io_rfReadData_6;
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
      rrd_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 86:28]
    end else begin
      rrd_valid_4 <= _GEN_1305;
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pc <= io_iqIssues_4_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_inst <= io_iqIssues_4_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_fuType <= io_iqIssues_4_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_aluOp <= io_iqIssues_4_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_bruOp <= io_iqIssues_4_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_lsuOp <= io_iqIssues_4_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_csrOp <= io_iqIssues_4_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_mulOp <= io_iqIssues_4_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_divOp <= io_iqIssues_4_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_src1Type <= io_iqIssues_4_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_src2Type <= io_iqIssues_4_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_immType <= io_iqIssues_4_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_rfWen <= io_iqIssues_4_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_memRead <= io_iqIssues_4_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_memWrite <= io_iqIssues_4_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_csrWen <= io_iqIssues_4_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_isBranch <= io_iqIssues_4_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_isJump <= io_iqIssues_4_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ctrl_isPriv <= io_iqIssues_4_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_excpVec <= io_iqIssues_4_bits_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_imm <= io_iqIssues_4_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_csrAddress <= io_iqIssues_4_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_valid <= io_iqIssues_4_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_isBr <= io_iqIssues_4_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_isJal <= io_iqIssues_4_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_isJalr <= io_iqIssues_4_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_isCall <= io_iqIssues_4_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_isRet <= io_iqIssues_4_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdInfo_jumpTarget <= io_iqIssues_4_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_ldst <= io_iqIssues_4_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_lrs1 <= io_iqIssues_4_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_lrs2 <= io_iqIssues_4_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_pdst <= io_iqIssues_4_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_prs1 <= io_iqIssues_4_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_prs2 <= io_iqIssues_4_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_oldPdst <= io_iqIssues_4_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_rs1Valid <= io_iqIssues_4_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_rs2Valid <= io_iqIssues_4_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_rdValid <= io_iqIssues_4_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_robIdx_value <= io_iqIssues_4_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_robIdx_flag <= io_iqIssues_4_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_robIdxFull_value <= io_iqIssues_4_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_robIdxFull_flag <= io_iqIssues_4_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_lqIdx_value <= io_iqIssues_4_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_lqIdx_flag <= io_iqIssues_4_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_sqIdx_value <= io_iqIssues_4_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_sqIdx_flag <= io_iqIssues_4_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_issueQueue <= io_iqIssues_4_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_prs1Busy <= io_iqIssues_4_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_prs2Busy <= io_iqIssues_4_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_isSta <= io_iqIssues_4_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 163:27]
      rrd_uop_4_isStd <= io_iqIssues_4_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
      out_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 92:28]
    end else begin
      out_valid_4 <= _GEN_1412;
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pc <= rrd_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_inst <= rrd_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_fuType <= rrd_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_aluOp <= rrd_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_bruOp <= rrd_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_lsuOp <= rrd_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_csrOp <= rrd_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_mulOp <= rrd_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_divOp <= rrd_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_src1Type <= rrd_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_src2Type <= rrd_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_immType <= rrd_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_rfWen <= rrd_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_memRead <= rrd_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_memWrite <= rrd_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_csrWen <= rrd_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_isBranch <= rrd_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_isJump <= rrd_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ctrl_isPriv <= rrd_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_excpVec <= rrd_uop_4_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_imm <= rrd_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_csrAddress <= rrd_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_valid <= rrd_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_isBr <= rrd_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_isJal <= rrd_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_isJalr <= rrd_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_isCall <= rrd_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_isRet <= rrd_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdInfo_jumpTarget <= rrd_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_ldst <= rrd_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_lrs1 <= rrd_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_lrs2 <= rrd_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_pdst <= rrd_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_prs1 <= rrd_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_prs2 <= rrd_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_oldPdst <= rrd_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_rs1Valid <= rrd_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_rs2Valid <= rrd_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_rdValid <= rrd_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_robIdx_value <= rrd_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_robIdx_flag <= rrd_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_robIdxFull_value <= rrd_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_robIdxFull_flag <= rrd_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_lqIdx_value <= rrd_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_lqIdx_flag <= rrd_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_sqIdx_value <= rrd_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_sqIdx_flag <= rrd_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_issueQueue <= rrd_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_prs1Busy <= rrd_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_prs2Busy <= rrd_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_isSta <= rrd_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      out_uop_4_isStd <= rrd_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 175:19]
    end
    if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 173:30]
      if (~rrd_uop_4_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 148:10]
        out_rs2_4 <= 32'h0;
      end else if (rrd_uop_4_prs2 == 7'h0) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 149:10]
        out_rs2_4 <= 32'h0;
      end else begin
        out_rs2_4 <= io_rfReadData_7;
      end
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
  rrd_uop_robIdx_value = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  rrd_uop_robIdx_flag = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  rrd_uop_robIdxFull_value = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  rrd_uop_robIdxFull_flag = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  rrd_uop_lqIdx_value = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  rrd_uop_lqIdx_flag = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  rrd_uop_sqIdx_value = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  rrd_uop_sqIdx_flag = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  rrd_uop_issueQueue = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  rrd_uop_prs1Busy = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  rrd_uop_prs2Busy = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  rrd_uop_isSta = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  rrd_uop_isStd = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  out_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  out_uop_pc = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  out_uop_inst = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  out_uop_ctrl_fuType = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  out_uop_ctrl_aluOp = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  out_uop_ctrl_bruOp = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  out_uop_ctrl_lsuOp = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  out_uop_ctrl_csrOp = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  out_uop_ctrl_mulOp = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  out_uop_ctrl_divOp = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  out_uop_ctrl_src1Type = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  out_uop_ctrl_src2Type = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  out_uop_ctrl_immType = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  out_uop_ctrl_rfWen = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  out_uop_ctrl_memRead = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  out_uop_ctrl_memWrite = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  out_uop_ctrl_csrWen = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  out_uop_ctrl_isBranch = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  out_uop_ctrl_isJump = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  out_uop_ctrl_isPriv = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  out_uop_excpVec = _RAND_73[9:0];
  _RAND_74 = {1{`RANDOM}};
  out_uop_imm = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  out_uop_csrAddress = _RAND_75[13:0];
  _RAND_76 = {1{`RANDOM}};
  out_uop_pdInfo_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  out_uop_pdInfo_isBr = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  out_uop_pdInfo_isJal = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  out_uop_pdInfo_isJalr = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  out_uop_pdInfo_isCall = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  out_uop_pdInfo_isRet = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  out_uop_pdInfo_jumpTarget = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  out_uop_ldst = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  out_uop_lrs1 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  out_uop_lrs2 = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  out_uop_pdst = _RAND_86[6:0];
  _RAND_87 = {1{`RANDOM}};
  out_uop_prs1 = _RAND_87[6:0];
  _RAND_88 = {1{`RANDOM}};
  out_uop_prs2 = _RAND_88[6:0];
  _RAND_89 = {1{`RANDOM}};
  out_uop_oldPdst = _RAND_89[6:0];
  _RAND_90 = {1{`RANDOM}};
  out_uop_rs1Valid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  out_uop_rs2Valid = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  out_uop_rdValid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  out_uop_robIdx_value = _RAND_93[5:0];
  _RAND_94 = {1{`RANDOM}};
  out_uop_robIdx_flag = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  out_uop_robIdxFull_value = _RAND_95[5:0];
  _RAND_96 = {1{`RANDOM}};
  out_uop_robIdxFull_flag = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  out_uop_lqIdx_value = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  out_uop_lqIdx_flag = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  out_uop_sqIdx_value = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  out_uop_sqIdx_flag = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  out_uop_issueQueue = _RAND_101[2:0];
  _RAND_102 = {1{`RANDOM}};
  out_uop_prs1Busy = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  out_uop_prs2Busy = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  out_uop_isSta = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  out_uop_isStd = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  out_rs1 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  out_rs2 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  rrd_valid_1 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  rrd_uop_1_pc = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  rrd_uop_1_inst = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  rrd_uop_1_ctrl_fuType = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  rrd_uop_1_ctrl_aluOp = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  rrd_uop_1_ctrl_bruOp = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  rrd_uop_1_ctrl_lsuOp = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrOp = _RAND_115[2:0];
  _RAND_116 = {1{`RANDOM}};
  rrd_uop_1_ctrl_mulOp = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  rrd_uop_1_ctrl_divOp = _RAND_117[2:0];
  _RAND_118 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src1Type = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src2Type = _RAND_119[2:0];
  _RAND_120 = {1{`RANDOM}};
  rrd_uop_1_ctrl_immType = _RAND_120[3:0];
  _RAND_121 = {1{`RANDOM}};
  rrd_uop_1_ctrl_rfWen = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memRead = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memWrite = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrWen = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isBranch = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isJump = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isPriv = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  rrd_uop_1_excpVec = _RAND_128[9:0];
  _RAND_129 = {1{`RANDOM}};
  rrd_uop_1_imm = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  rrd_uop_1_csrAddress = _RAND_130[13:0];
  _RAND_131 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_valid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isBr = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJal = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJalr = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isCall = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isRet = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_jumpTarget = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  rrd_uop_1_ldst = _RAND_138[4:0];
  _RAND_139 = {1{`RANDOM}};
  rrd_uop_1_lrs1 = _RAND_139[4:0];
  _RAND_140 = {1{`RANDOM}};
  rrd_uop_1_lrs2 = _RAND_140[4:0];
  _RAND_141 = {1{`RANDOM}};
  rrd_uop_1_pdst = _RAND_141[6:0];
  _RAND_142 = {1{`RANDOM}};
  rrd_uop_1_prs1 = _RAND_142[6:0];
  _RAND_143 = {1{`RANDOM}};
  rrd_uop_1_prs2 = _RAND_143[6:0];
  _RAND_144 = {1{`RANDOM}};
  rrd_uop_1_oldPdst = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  rrd_uop_1_rs1Valid = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  rrd_uop_1_rs2Valid = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  rrd_uop_1_rdValid = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  rrd_uop_1_robIdx_value = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  rrd_uop_1_robIdx_flag = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  rrd_uop_1_robIdxFull_value = _RAND_150[5:0];
  _RAND_151 = {1{`RANDOM}};
  rrd_uop_1_robIdxFull_flag = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  rrd_uop_1_issueQueue = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  rrd_uop_1_prs1Busy = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  rrd_uop_1_prs2Busy = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  out_valid_1 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  out_uop_1_pc = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  out_uop_1_inst = _RAND_157[31:0];
  _RAND_158 = {1{`RANDOM}};
  out_uop_1_ctrl_fuType = _RAND_158[3:0];
  _RAND_159 = {1{`RANDOM}};
  out_uop_1_ctrl_aluOp = _RAND_159[4:0];
  _RAND_160 = {1{`RANDOM}};
  out_uop_1_ctrl_bruOp = _RAND_160[3:0];
  _RAND_161 = {1{`RANDOM}};
  out_uop_1_ctrl_lsuOp = _RAND_161[3:0];
  _RAND_162 = {1{`RANDOM}};
  out_uop_1_ctrl_csrOp = _RAND_162[2:0];
  _RAND_163 = {1{`RANDOM}};
  out_uop_1_ctrl_mulOp = _RAND_163[2:0];
  _RAND_164 = {1{`RANDOM}};
  out_uop_1_ctrl_divOp = _RAND_164[2:0];
  _RAND_165 = {1{`RANDOM}};
  out_uop_1_ctrl_src1Type = _RAND_165[2:0];
  _RAND_166 = {1{`RANDOM}};
  out_uop_1_ctrl_src2Type = _RAND_166[2:0];
  _RAND_167 = {1{`RANDOM}};
  out_uop_1_ctrl_immType = _RAND_167[3:0];
  _RAND_168 = {1{`RANDOM}};
  out_uop_1_ctrl_rfWen = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  out_uop_1_ctrl_memRead = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  out_uop_1_ctrl_memWrite = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  out_uop_1_ctrl_csrWen = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  out_uop_1_ctrl_isBranch = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  out_uop_1_ctrl_isJump = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  out_uop_1_ctrl_isPriv = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  out_uop_1_excpVec = _RAND_175[9:0];
  _RAND_176 = {1{`RANDOM}};
  out_uop_1_imm = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  out_uop_1_csrAddress = _RAND_177[13:0];
  _RAND_178 = {1{`RANDOM}};
  out_uop_1_pdInfo_valid = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  out_uop_1_pdInfo_isBr = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJal = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJalr = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  out_uop_1_pdInfo_isCall = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  out_uop_1_pdInfo_isRet = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  out_uop_1_pdInfo_jumpTarget = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  out_uop_1_ldst = _RAND_185[4:0];
  _RAND_186 = {1{`RANDOM}};
  out_uop_1_lrs1 = _RAND_186[4:0];
  _RAND_187 = {1{`RANDOM}};
  out_uop_1_lrs2 = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  out_uop_1_pdst = _RAND_188[6:0];
  _RAND_189 = {1{`RANDOM}};
  out_uop_1_prs1 = _RAND_189[6:0];
  _RAND_190 = {1{`RANDOM}};
  out_uop_1_prs2 = _RAND_190[6:0];
  _RAND_191 = {1{`RANDOM}};
  out_uop_1_oldPdst = _RAND_191[6:0];
  _RAND_192 = {1{`RANDOM}};
  out_uop_1_rs1Valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  out_uop_1_rs2Valid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  out_uop_1_rdValid = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  out_uop_1_robIdx_value = _RAND_195[5:0];
  _RAND_196 = {1{`RANDOM}};
  out_uop_1_robIdx_flag = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  out_uop_1_robIdxFull_value = _RAND_197[5:0];
  _RAND_198 = {1{`RANDOM}};
  out_uop_1_robIdxFull_flag = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  out_uop_1_issueQueue = _RAND_199[2:0];
  _RAND_200 = {1{`RANDOM}};
  out_uop_1_prs1Busy = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  out_uop_1_prs2Busy = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  out_rs1_1 = _RAND_202[31:0];
  _RAND_203 = {1{`RANDOM}};
  out_rs2_1 = _RAND_203[31:0];
  _RAND_204 = {1{`RANDOM}};
  rrd_valid_2 = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  rrd_uop_2_pc = _RAND_205[31:0];
  _RAND_206 = {1{`RANDOM}};
  rrd_uop_2_inst = _RAND_206[31:0];
  _RAND_207 = {1{`RANDOM}};
  rrd_uop_2_ctrl_fuType = _RAND_207[3:0];
  _RAND_208 = {1{`RANDOM}};
  rrd_uop_2_ctrl_aluOp = _RAND_208[4:0];
  _RAND_209 = {1{`RANDOM}};
  rrd_uop_2_ctrl_bruOp = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  rrd_uop_2_ctrl_lsuOp = _RAND_210[3:0];
  _RAND_211 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrOp = _RAND_211[2:0];
  _RAND_212 = {1{`RANDOM}};
  rrd_uop_2_ctrl_mulOp = _RAND_212[2:0];
  _RAND_213 = {1{`RANDOM}};
  rrd_uop_2_ctrl_divOp = _RAND_213[2:0];
  _RAND_214 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src1Type = _RAND_214[2:0];
  _RAND_215 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src2Type = _RAND_215[2:0];
  _RAND_216 = {1{`RANDOM}};
  rrd_uop_2_ctrl_immType = _RAND_216[3:0];
  _RAND_217 = {1{`RANDOM}};
  rrd_uop_2_ctrl_rfWen = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memRead = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memWrite = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrWen = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isBranch = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isJump = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isPriv = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  rrd_uop_2_excpVec = _RAND_224[9:0];
  _RAND_225 = {1{`RANDOM}};
  rrd_uop_2_imm = _RAND_225[31:0];
  _RAND_226 = {1{`RANDOM}};
  rrd_uop_2_csrAddress = _RAND_226[13:0];
  _RAND_227 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_valid = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isBr = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJal = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJalr = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isCall = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isRet = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_jumpTarget = _RAND_233[31:0];
  _RAND_234 = {1{`RANDOM}};
  rrd_uop_2_ldst = _RAND_234[4:0];
  _RAND_235 = {1{`RANDOM}};
  rrd_uop_2_lrs1 = _RAND_235[4:0];
  _RAND_236 = {1{`RANDOM}};
  rrd_uop_2_lrs2 = _RAND_236[4:0];
  _RAND_237 = {1{`RANDOM}};
  rrd_uop_2_pdst = _RAND_237[6:0];
  _RAND_238 = {1{`RANDOM}};
  rrd_uop_2_prs1 = _RAND_238[6:0];
  _RAND_239 = {1{`RANDOM}};
  rrd_uop_2_prs2 = _RAND_239[6:0];
  _RAND_240 = {1{`RANDOM}};
  rrd_uop_2_oldPdst = _RAND_240[6:0];
  _RAND_241 = {1{`RANDOM}};
  rrd_uop_2_rs1Valid = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  rrd_uop_2_rs2Valid = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  rrd_uop_2_rdValid = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  rrd_uop_2_robIdx_value = _RAND_244[5:0];
  _RAND_245 = {1{`RANDOM}};
  rrd_uop_2_robIdx_flag = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  rrd_uop_2_robIdxFull_value = _RAND_246[5:0];
  _RAND_247 = {1{`RANDOM}};
  rrd_uop_2_robIdxFull_flag = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  rrd_uop_2_lqIdx_value = _RAND_248[3:0];
  _RAND_249 = {1{`RANDOM}};
  rrd_uop_2_lqIdx_flag = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  rrd_uop_2_sqIdx_value = _RAND_250[3:0];
  _RAND_251 = {1{`RANDOM}};
  rrd_uop_2_sqIdx_flag = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  rrd_uop_2_issueQueue = _RAND_252[2:0];
  _RAND_253 = {1{`RANDOM}};
  rrd_uop_2_prs1Busy = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  rrd_uop_2_prs2Busy = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  rrd_uop_2_isSta = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  rrd_uop_2_isStd = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  out_valid_2 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  out_uop_2_pc = _RAND_258[31:0];
  _RAND_259 = {1{`RANDOM}};
  out_uop_2_inst = _RAND_259[31:0];
  _RAND_260 = {1{`RANDOM}};
  out_uop_2_ctrl_fuType = _RAND_260[3:0];
  _RAND_261 = {1{`RANDOM}};
  out_uop_2_ctrl_aluOp = _RAND_261[4:0];
  _RAND_262 = {1{`RANDOM}};
  out_uop_2_ctrl_bruOp = _RAND_262[3:0];
  _RAND_263 = {1{`RANDOM}};
  out_uop_2_ctrl_lsuOp = _RAND_263[3:0];
  _RAND_264 = {1{`RANDOM}};
  out_uop_2_ctrl_csrOp = _RAND_264[2:0];
  _RAND_265 = {1{`RANDOM}};
  out_uop_2_ctrl_mulOp = _RAND_265[2:0];
  _RAND_266 = {1{`RANDOM}};
  out_uop_2_ctrl_divOp = _RAND_266[2:0];
  _RAND_267 = {1{`RANDOM}};
  out_uop_2_ctrl_src1Type = _RAND_267[2:0];
  _RAND_268 = {1{`RANDOM}};
  out_uop_2_ctrl_src2Type = _RAND_268[2:0];
  _RAND_269 = {1{`RANDOM}};
  out_uop_2_ctrl_immType = _RAND_269[3:0];
  _RAND_270 = {1{`RANDOM}};
  out_uop_2_ctrl_rfWen = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  out_uop_2_ctrl_memRead = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  out_uop_2_ctrl_memWrite = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  out_uop_2_ctrl_csrWen = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  out_uop_2_ctrl_isBranch = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  out_uop_2_ctrl_isJump = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  out_uop_2_ctrl_isPriv = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  out_uop_2_excpVec = _RAND_277[9:0];
  _RAND_278 = {1{`RANDOM}};
  out_uop_2_imm = _RAND_278[31:0];
  _RAND_279 = {1{`RANDOM}};
  out_uop_2_csrAddress = _RAND_279[13:0];
  _RAND_280 = {1{`RANDOM}};
  out_uop_2_pdInfo_valid = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  out_uop_2_pdInfo_isBr = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJal = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJalr = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  out_uop_2_pdInfo_isCall = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  out_uop_2_pdInfo_isRet = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  out_uop_2_pdInfo_jumpTarget = _RAND_286[31:0];
  _RAND_287 = {1{`RANDOM}};
  out_uop_2_ldst = _RAND_287[4:0];
  _RAND_288 = {1{`RANDOM}};
  out_uop_2_lrs1 = _RAND_288[4:0];
  _RAND_289 = {1{`RANDOM}};
  out_uop_2_lrs2 = _RAND_289[4:0];
  _RAND_290 = {1{`RANDOM}};
  out_uop_2_pdst = _RAND_290[6:0];
  _RAND_291 = {1{`RANDOM}};
  out_uop_2_prs1 = _RAND_291[6:0];
  _RAND_292 = {1{`RANDOM}};
  out_uop_2_prs2 = _RAND_292[6:0];
  _RAND_293 = {1{`RANDOM}};
  out_uop_2_oldPdst = _RAND_293[6:0];
  _RAND_294 = {1{`RANDOM}};
  out_uop_2_rs1Valid = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  out_uop_2_rs2Valid = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  out_uop_2_rdValid = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  out_uop_2_robIdx_value = _RAND_297[5:0];
  _RAND_298 = {1{`RANDOM}};
  out_uop_2_robIdx_flag = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  out_uop_2_robIdxFull_value = _RAND_299[5:0];
  _RAND_300 = {1{`RANDOM}};
  out_uop_2_robIdxFull_flag = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  out_uop_2_lqIdx_value = _RAND_301[3:0];
  _RAND_302 = {1{`RANDOM}};
  out_uop_2_lqIdx_flag = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  out_uop_2_sqIdx_value = _RAND_303[3:0];
  _RAND_304 = {1{`RANDOM}};
  out_uop_2_sqIdx_flag = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  out_uop_2_issueQueue = _RAND_305[2:0];
  _RAND_306 = {1{`RANDOM}};
  out_uop_2_prs1Busy = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  out_uop_2_prs2Busy = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  out_uop_2_isSta = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  out_uop_2_isStd = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  out_rs1_2 = _RAND_310[31:0];
  _RAND_311 = {1{`RANDOM}};
  out_rs2_2 = _RAND_311[31:0];
  _RAND_312 = {1{`RANDOM}};
  rrd_valid_3 = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  rrd_uop_3_pc = _RAND_313[31:0];
  _RAND_314 = {1{`RANDOM}};
  rrd_uop_3_inst = _RAND_314[31:0];
  _RAND_315 = {1{`RANDOM}};
  rrd_uop_3_ctrl_fuType = _RAND_315[3:0];
  _RAND_316 = {1{`RANDOM}};
  rrd_uop_3_ctrl_aluOp = _RAND_316[4:0];
  _RAND_317 = {1{`RANDOM}};
  rrd_uop_3_ctrl_bruOp = _RAND_317[3:0];
  _RAND_318 = {1{`RANDOM}};
  rrd_uop_3_ctrl_lsuOp = _RAND_318[3:0];
  _RAND_319 = {1{`RANDOM}};
  rrd_uop_3_ctrl_csrOp = _RAND_319[2:0];
  _RAND_320 = {1{`RANDOM}};
  rrd_uop_3_ctrl_mulOp = _RAND_320[2:0];
  _RAND_321 = {1{`RANDOM}};
  rrd_uop_3_ctrl_divOp = _RAND_321[2:0];
  _RAND_322 = {1{`RANDOM}};
  rrd_uop_3_ctrl_src1Type = _RAND_322[2:0];
  _RAND_323 = {1{`RANDOM}};
  rrd_uop_3_ctrl_src2Type = _RAND_323[2:0];
  _RAND_324 = {1{`RANDOM}};
  rrd_uop_3_ctrl_immType = _RAND_324[3:0];
  _RAND_325 = {1{`RANDOM}};
  rrd_uop_3_ctrl_rfWen = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  rrd_uop_3_ctrl_memRead = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  rrd_uop_3_ctrl_memWrite = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  rrd_uop_3_ctrl_csrWen = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isBranch = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isJump = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isPriv = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  rrd_uop_3_excpVec = _RAND_332[9:0];
  _RAND_333 = {1{`RANDOM}};
  rrd_uop_3_imm = _RAND_333[31:0];
  _RAND_334 = {1{`RANDOM}};
  rrd_uop_3_csrAddress = _RAND_334[13:0];
  _RAND_335 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_valid = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isBr = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isJal = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isJalr = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isCall = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isRet = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_jumpTarget = _RAND_341[31:0];
  _RAND_342 = {1{`RANDOM}};
  rrd_uop_3_ldst = _RAND_342[4:0];
  _RAND_343 = {1{`RANDOM}};
  rrd_uop_3_lrs1 = _RAND_343[4:0];
  _RAND_344 = {1{`RANDOM}};
  rrd_uop_3_lrs2 = _RAND_344[4:0];
  _RAND_345 = {1{`RANDOM}};
  rrd_uop_3_pdst = _RAND_345[6:0];
  _RAND_346 = {1{`RANDOM}};
  rrd_uop_3_prs1 = _RAND_346[6:0];
  _RAND_347 = {1{`RANDOM}};
  rrd_uop_3_prs2 = _RAND_347[6:0];
  _RAND_348 = {1{`RANDOM}};
  rrd_uop_3_oldPdst = _RAND_348[6:0];
  _RAND_349 = {1{`RANDOM}};
  rrd_uop_3_rs1Valid = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  rrd_uop_3_rs2Valid = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  rrd_uop_3_rdValid = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  rrd_uop_3_robIdx_value = _RAND_352[5:0];
  _RAND_353 = {1{`RANDOM}};
  rrd_uop_3_robIdx_flag = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  rrd_uop_3_robIdxFull_value = _RAND_354[5:0];
  _RAND_355 = {1{`RANDOM}};
  rrd_uop_3_robIdxFull_flag = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  rrd_uop_3_lqIdx_value = _RAND_356[3:0];
  _RAND_357 = {1{`RANDOM}};
  rrd_uop_3_lqIdx_flag = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  rrd_uop_3_sqIdx_value = _RAND_358[3:0];
  _RAND_359 = {1{`RANDOM}};
  rrd_uop_3_sqIdx_flag = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  rrd_uop_3_issueQueue = _RAND_360[2:0];
  _RAND_361 = {1{`RANDOM}};
  rrd_uop_3_prs1Busy = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  rrd_uop_3_prs2Busy = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  rrd_uop_3_isSta = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  rrd_uop_3_isStd = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  out_valid_3 = _RAND_365[0:0];
  _RAND_366 = {1{`RANDOM}};
  out_uop_3_pc = _RAND_366[31:0];
  _RAND_367 = {1{`RANDOM}};
  out_uop_3_inst = _RAND_367[31:0];
  _RAND_368 = {1{`RANDOM}};
  out_uop_3_ctrl_fuType = _RAND_368[3:0];
  _RAND_369 = {1{`RANDOM}};
  out_uop_3_ctrl_aluOp = _RAND_369[4:0];
  _RAND_370 = {1{`RANDOM}};
  out_uop_3_ctrl_bruOp = _RAND_370[3:0];
  _RAND_371 = {1{`RANDOM}};
  out_uop_3_ctrl_lsuOp = _RAND_371[3:0];
  _RAND_372 = {1{`RANDOM}};
  out_uop_3_ctrl_csrOp = _RAND_372[2:0];
  _RAND_373 = {1{`RANDOM}};
  out_uop_3_ctrl_mulOp = _RAND_373[2:0];
  _RAND_374 = {1{`RANDOM}};
  out_uop_3_ctrl_divOp = _RAND_374[2:0];
  _RAND_375 = {1{`RANDOM}};
  out_uop_3_ctrl_src1Type = _RAND_375[2:0];
  _RAND_376 = {1{`RANDOM}};
  out_uop_3_ctrl_src2Type = _RAND_376[2:0];
  _RAND_377 = {1{`RANDOM}};
  out_uop_3_ctrl_immType = _RAND_377[3:0];
  _RAND_378 = {1{`RANDOM}};
  out_uop_3_ctrl_rfWen = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  out_uop_3_ctrl_memRead = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  out_uop_3_ctrl_memWrite = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  out_uop_3_ctrl_csrWen = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  out_uop_3_ctrl_isBranch = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  out_uop_3_ctrl_isJump = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  out_uop_3_ctrl_isPriv = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  out_uop_3_excpVec = _RAND_385[9:0];
  _RAND_386 = {1{`RANDOM}};
  out_uop_3_imm = _RAND_386[31:0];
  _RAND_387 = {1{`RANDOM}};
  out_uop_3_csrAddress = _RAND_387[13:0];
  _RAND_388 = {1{`RANDOM}};
  out_uop_3_pdInfo_valid = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  out_uop_3_pdInfo_isBr = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  out_uop_3_pdInfo_isJal = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  out_uop_3_pdInfo_isJalr = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  out_uop_3_pdInfo_isCall = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  out_uop_3_pdInfo_isRet = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  out_uop_3_pdInfo_jumpTarget = _RAND_394[31:0];
  _RAND_395 = {1{`RANDOM}};
  out_uop_3_ldst = _RAND_395[4:0];
  _RAND_396 = {1{`RANDOM}};
  out_uop_3_lrs1 = _RAND_396[4:0];
  _RAND_397 = {1{`RANDOM}};
  out_uop_3_lrs2 = _RAND_397[4:0];
  _RAND_398 = {1{`RANDOM}};
  out_uop_3_pdst = _RAND_398[6:0];
  _RAND_399 = {1{`RANDOM}};
  out_uop_3_prs1 = _RAND_399[6:0];
  _RAND_400 = {1{`RANDOM}};
  out_uop_3_prs2 = _RAND_400[6:0];
  _RAND_401 = {1{`RANDOM}};
  out_uop_3_oldPdst = _RAND_401[6:0];
  _RAND_402 = {1{`RANDOM}};
  out_uop_3_rs1Valid = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  out_uop_3_rs2Valid = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  out_uop_3_rdValid = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  out_uop_3_robIdx_value = _RAND_405[5:0];
  _RAND_406 = {1{`RANDOM}};
  out_uop_3_robIdx_flag = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  out_uop_3_robIdxFull_value = _RAND_407[5:0];
  _RAND_408 = {1{`RANDOM}};
  out_uop_3_robIdxFull_flag = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  out_uop_3_lqIdx_value = _RAND_409[3:0];
  _RAND_410 = {1{`RANDOM}};
  out_uop_3_lqIdx_flag = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  out_uop_3_sqIdx_value = _RAND_411[3:0];
  _RAND_412 = {1{`RANDOM}};
  out_uop_3_sqIdx_flag = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  out_uop_3_issueQueue = _RAND_413[2:0];
  _RAND_414 = {1{`RANDOM}};
  out_uop_3_prs1Busy = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  out_uop_3_prs2Busy = _RAND_415[0:0];
  _RAND_416 = {1{`RANDOM}};
  out_uop_3_isSta = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  out_uop_3_isStd = _RAND_417[0:0];
  _RAND_418 = {1{`RANDOM}};
  out_rs1_3 = _RAND_418[31:0];
  _RAND_419 = {1{`RANDOM}};
  rrd_valid_4 = _RAND_419[0:0];
  _RAND_420 = {1{`RANDOM}};
  rrd_uop_4_pc = _RAND_420[31:0];
  _RAND_421 = {1{`RANDOM}};
  rrd_uop_4_inst = _RAND_421[31:0];
  _RAND_422 = {1{`RANDOM}};
  rrd_uop_4_ctrl_fuType = _RAND_422[3:0];
  _RAND_423 = {1{`RANDOM}};
  rrd_uop_4_ctrl_aluOp = _RAND_423[4:0];
  _RAND_424 = {1{`RANDOM}};
  rrd_uop_4_ctrl_bruOp = _RAND_424[3:0];
  _RAND_425 = {1{`RANDOM}};
  rrd_uop_4_ctrl_lsuOp = _RAND_425[3:0];
  _RAND_426 = {1{`RANDOM}};
  rrd_uop_4_ctrl_csrOp = _RAND_426[2:0];
  _RAND_427 = {1{`RANDOM}};
  rrd_uop_4_ctrl_mulOp = _RAND_427[2:0];
  _RAND_428 = {1{`RANDOM}};
  rrd_uop_4_ctrl_divOp = _RAND_428[2:0];
  _RAND_429 = {1{`RANDOM}};
  rrd_uop_4_ctrl_src1Type = _RAND_429[2:0];
  _RAND_430 = {1{`RANDOM}};
  rrd_uop_4_ctrl_src2Type = _RAND_430[2:0];
  _RAND_431 = {1{`RANDOM}};
  rrd_uop_4_ctrl_immType = _RAND_431[3:0];
  _RAND_432 = {1{`RANDOM}};
  rrd_uop_4_ctrl_rfWen = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  rrd_uop_4_ctrl_memRead = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  rrd_uop_4_ctrl_memWrite = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  rrd_uop_4_ctrl_csrWen = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isBranch = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isJump = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isPriv = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  rrd_uop_4_excpVec = _RAND_439[9:0];
  _RAND_440 = {1{`RANDOM}};
  rrd_uop_4_imm = _RAND_440[31:0];
  _RAND_441 = {1{`RANDOM}};
  rrd_uop_4_csrAddress = _RAND_441[13:0];
  _RAND_442 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_valid = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isBr = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isJal = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isJalr = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isCall = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isRet = _RAND_447[0:0];
  _RAND_448 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_jumpTarget = _RAND_448[31:0];
  _RAND_449 = {1{`RANDOM}};
  rrd_uop_4_ldst = _RAND_449[4:0];
  _RAND_450 = {1{`RANDOM}};
  rrd_uop_4_lrs1 = _RAND_450[4:0];
  _RAND_451 = {1{`RANDOM}};
  rrd_uop_4_lrs2 = _RAND_451[4:0];
  _RAND_452 = {1{`RANDOM}};
  rrd_uop_4_pdst = _RAND_452[6:0];
  _RAND_453 = {1{`RANDOM}};
  rrd_uop_4_prs1 = _RAND_453[6:0];
  _RAND_454 = {1{`RANDOM}};
  rrd_uop_4_prs2 = _RAND_454[6:0];
  _RAND_455 = {1{`RANDOM}};
  rrd_uop_4_oldPdst = _RAND_455[6:0];
  _RAND_456 = {1{`RANDOM}};
  rrd_uop_4_rs1Valid = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  rrd_uop_4_rs2Valid = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  rrd_uop_4_rdValid = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  rrd_uop_4_robIdx_value = _RAND_459[5:0];
  _RAND_460 = {1{`RANDOM}};
  rrd_uop_4_robIdx_flag = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  rrd_uop_4_robIdxFull_value = _RAND_461[5:0];
  _RAND_462 = {1{`RANDOM}};
  rrd_uop_4_robIdxFull_flag = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  rrd_uop_4_lqIdx_value = _RAND_463[3:0];
  _RAND_464 = {1{`RANDOM}};
  rrd_uop_4_lqIdx_flag = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  rrd_uop_4_sqIdx_value = _RAND_465[3:0];
  _RAND_466 = {1{`RANDOM}};
  rrd_uop_4_sqIdx_flag = _RAND_466[0:0];
  _RAND_467 = {1{`RANDOM}};
  rrd_uop_4_issueQueue = _RAND_467[2:0];
  _RAND_468 = {1{`RANDOM}};
  rrd_uop_4_prs1Busy = _RAND_468[0:0];
  _RAND_469 = {1{`RANDOM}};
  rrd_uop_4_prs2Busy = _RAND_469[0:0];
  _RAND_470 = {1{`RANDOM}};
  rrd_uop_4_isSta = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  rrd_uop_4_isStd = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  out_valid_4 = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  out_uop_4_pc = _RAND_473[31:0];
  _RAND_474 = {1{`RANDOM}};
  out_uop_4_inst = _RAND_474[31:0];
  _RAND_475 = {1{`RANDOM}};
  out_uop_4_ctrl_fuType = _RAND_475[3:0];
  _RAND_476 = {1{`RANDOM}};
  out_uop_4_ctrl_aluOp = _RAND_476[4:0];
  _RAND_477 = {1{`RANDOM}};
  out_uop_4_ctrl_bruOp = _RAND_477[3:0];
  _RAND_478 = {1{`RANDOM}};
  out_uop_4_ctrl_lsuOp = _RAND_478[3:0];
  _RAND_479 = {1{`RANDOM}};
  out_uop_4_ctrl_csrOp = _RAND_479[2:0];
  _RAND_480 = {1{`RANDOM}};
  out_uop_4_ctrl_mulOp = _RAND_480[2:0];
  _RAND_481 = {1{`RANDOM}};
  out_uop_4_ctrl_divOp = _RAND_481[2:0];
  _RAND_482 = {1{`RANDOM}};
  out_uop_4_ctrl_src1Type = _RAND_482[2:0];
  _RAND_483 = {1{`RANDOM}};
  out_uop_4_ctrl_src2Type = _RAND_483[2:0];
  _RAND_484 = {1{`RANDOM}};
  out_uop_4_ctrl_immType = _RAND_484[3:0];
  _RAND_485 = {1{`RANDOM}};
  out_uop_4_ctrl_rfWen = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  out_uop_4_ctrl_memRead = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  out_uop_4_ctrl_memWrite = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  out_uop_4_ctrl_csrWen = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  out_uop_4_ctrl_isBranch = _RAND_489[0:0];
  _RAND_490 = {1{`RANDOM}};
  out_uop_4_ctrl_isJump = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  out_uop_4_ctrl_isPriv = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  out_uop_4_excpVec = _RAND_492[9:0];
  _RAND_493 = {1{`RANDOM}};
  out_uop_4_imm = _RAND_493[31:0];
  _RAND_494 = {1{`RANDOM}};
  out_uop_4_csrAddress = _RAND_494[13:0];
  _RAND_495 = {1{`RANDOM}};
  out_uop_4_pdInfo_valid = _RAND_495[0:0];
  _RAND_496 = {1{`RANDOM}};
  out_uop_4_pdInfo_isBr = _RAND_496[0:0];
  _RAND_497 = {1{`RANDOM}};
  out_uop_4_pdInfo_isJal = _RAND_497[0:0];
  _RAND_498 = {1{`RANDOM}};
  out_uop_4_pdInfo_isJalr = _RAND_498[0:0];
  _RAND_499 = {1{`RANDOM}};
  out_uop_4_pdInfo_isCall = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  out_uop_4_pdInfo_isRet = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  out_uop_4_pdInfo_jumpTarget = _RAND_501[31:0];
  _RAND_502 = {1{`RANDOM}};
  out_uop_4_ldst = _RAND_502[4:0];
  _RAND_503 = {1{`RANDOM}};
  out_uop_4_lrs1 = _RAND_503[4:0];
  _RAND_504 = {1{`RANDOM}};
  out_uop_4_lrs2 = _RAND_504[4:0];
  _RAND_505 = {1{`RANDOM}};
  out_uop_4_pdst = _RAND_505[6:0];
  _RAND_506 = {1{`RANDOM}};
  out_uop_4_prs1 = _RAND_506[6:0];
  _RAND_507 = {1{`RANDOM}};
  out_uop_4_prs2 = _RAND_507[6:0];
  _RAND_508 = {1{`RANDOM}};
  out_uop_4_oldPdst = _RAND_508[6:0];
  _RAND_509 = {1{`RANDOM}};
  out_uop_4_rs1Valid = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  out_uop_4_rs2Valid = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  out_uop_4_rdValid = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  out_uop_4_robIdx_value = _RAND_512[5:0];
  _RAND_513 = {1{`RANDOM}};
  out_uop_4_robIdx_flag = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  out_uop_4_robIdxFull_value = _RAND_514[5:0];
  _RAND_515 = {1{`RANDOM}};
  out_uop_4_robIdxFull_flag = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  out_uop_4_lqIdx_value = _RAND_516[3:0];
  _RAND_517 = {1{`RANDOM}};
  out_uop_4_lqIdx_flag = _RAND_517[0:0];
  _RAND_518 = {1{`RANDOM}};
  out_uop_4_sqIdx_value = _RAND_518[3:0];
  _RAND_519 = {1{`RANDOM}};
  out_uop_4_sqIdx_flag = _RAND_519[0:0];
  _RAND_520 = {1{`RANDOM}};
  out_uop_4_issueQueue = _RAND_520[2:0];
  _RAND_521 = {1{`RANDOM}};
  out_uop_4_prs1Busy = _RAND_521[0:0];
  _RAND_522 = {1{`RANDOM}};
  out_uop_4_prs2Busy = _RAND_522[0:0];
  _RAND_523 = {1{`RANDOM}};
  out_uop_4_isSta = _RAND_523[0:0];
  _RAND_524 = {1{`RANDOM}};
  out_uop_4_isStd = _RAND_524[0:0];
  _RAND_525 = {1{`RANDOM}};
  out_rs2_4 = _RAND_525[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
