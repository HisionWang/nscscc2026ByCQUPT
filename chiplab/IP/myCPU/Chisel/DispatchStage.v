module DispatchStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [9:0]  io_in_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_in_1_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [9:0]  io_in_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_in_2_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_2_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [9:0]  io_in_2_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_2_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_2_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [4:0]  io_in_2_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_2_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_2_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_2_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input  [5:0]  io_in_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_out_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [6:0]  io_out_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [1:0]  io_out_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_out_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [6:0]  io_out_1_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_1_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [1:0]  io_out_1_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_1_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_out_2_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_2_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_2_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_2_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_2_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_2_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_2_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [6:0]  io_out_2_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_2_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [1:0]  io_out_2_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_2_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_3_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_3_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_3_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_3_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_3_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [2:0]  io_out_3_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_out_3_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_3_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [13:0] io_out_3_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_out_3_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_3_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_3_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_out_3_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_3_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_3_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_3_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_3_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_out_3_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [6:0]  io_out_3_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_out_3_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [1:0]  io_out_3_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_out_3_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valid_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valid_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valid_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valids_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valids_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_valids_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_0_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_0_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_0_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_0_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_robEnq_bits_0_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_0_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_0_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_0_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_0_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_robEnq_bits_0_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_robEnq_bits_0_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_1_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_1_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_1_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_1_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_robEnq_bits_1_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_1_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_1_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_1_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_1_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_robEnq_bits_1_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_robEnq_bits_1_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_2_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [31:0] io_robEnq_bits_2_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_2_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [5:0]  io_robEnq_bits_2_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [4:0]  io_robEnq_bits_2_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_2_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_2_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_2_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output        io_robEnq_bits_2_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [9:0]  io_robEnq_bits_2_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  output [3:0]  io_robEnq_bits_2_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_robEnq_canEnq, // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
  input         io_redirect_valid // @[src/main/scala/backend/dispatch/DispatchStage.scala 25:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  busyTable_clock; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_reset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_readReq_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_allocReq_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_allocReq_0_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_allocReq_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_allocReq_1_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire  busyTable_io_allocReq_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  wire [5:0] busyTable_io_allocReq_2_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
  reg  stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:26]
  reg  laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
  reg  laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
  reg  laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [9:0] stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_1_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [9:0] stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_1_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_1_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_1_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_2_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [9:0] stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_2_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [4:0] stgData_2_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  reg [5:0] stgData_2_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:22]
  wire  _targetQueue_0_T_5 = 4'h4 == stgData_0_ctrl_fuType | 4'h2 == stgData_0_ctrl_fuType; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _targetQueue_0_T_7 = 4'h5 == stgData_0_ctrl_fuType ? 2'h2 : {{1'd0}, _targetQueue_0_T_5}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] targetQueue_0 = 4'h3 == stgData_0_ctrl_fuType ? 2'h3 : _targetQueue_0_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _targetQueue_1_T_5 = 4'h4 == stgData_1_ctrl_fuType | 4'h2 == stgData_1_ctrl_fuType; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _targetQueue_1_T_7 = 4'h5 == stgData_1_ctrl_fuType ? 2'h2 : {{1'd0}, _targetQueue_1_T_5}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] targetQueue_1 = 4'h3 == stgData_1_ctrl_fuType ? 2'h3 : _targetQueue_1_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _targetQueue_2_T_5 = 4'h4 == stgData_2_ctrl_fuType | 4'h2 == stgData_2_ctrl_fuType; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _targetQueue_2_T_7 = 4'h5 == stgData_2_ctrl_fuType ? 2'h2 : {{1'd0}, _targetQueue_2_T_5}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] targetQueue_2 = 4'h3 == stgData_2_ctrl_fuType ? 2'h3 : _targetQueue_2_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  outFire = stgValid & io_robEnq_canEnq; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:40]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:28]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 52:46]
  wire  inFire = inValid & stgReady; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:26]
  wire  _GEN_12 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:23 69:14 35:26]
  wire  _GEN_16 = inFire | _GEN_12; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22 63:14]
  wire  _busyTable_io_allocReq_0_valid_T = outFire & laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:47]
  wire  _busyTable_io_allocReq_1_valid_T = outFire & laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:47]
  wire  _busyTable_io_allocReq_2_valid_T = outFire & laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:47]
  reg [3:0] lqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:26]
  reg [3:0] sqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:26]
  wire  _lqAllocCount_T = laneValid_0 & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 112:18]
  wire  _lqAllocCount_T_1 = laneValid_1 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 112:18]
  wire  _lqAllocCount_T_2 = laneValid_2 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 112:18]
  wire [1:0] _lqAllocCount_T_3 = _lqAllocCount_T_1 + _lqAllocCount_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:30]
  wire [1:0] _GEN_1366 = {{1'd0}, _lqAllocCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:30]
  wire [2:0] _lqAllocCount_T_5 = _GEN_1366 + _lqAllocCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:30]
  wire [1:0] lqAllocCount = _lqAllocCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:30]
  wire  _sqAllocCount_T = laneValid_0 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:18]
  wire  _sqAllocCount_T_1 = laneValid_1 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:18]
  wire  _sqAllocCount_T_2 = laneValid_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:18]
  wire [1:0] _sqAllocCount_T_3 = _sqAllocCount_T_1 + _sqAllocCount_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 113:30]
  wire [1:0] _GEN_1367 = {{1'd0}, _sqAllocCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 113:30]
  wire [2:0] _sqAllocCount_T_5 = _GEN_1367 + _sqAllocCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 113:30]
  wire [1:0] sqAllocCount = _sqAllocCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 113:30]
  wire [3:0] _GEN_1368 = {{2'd0}, lqAllocCount}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 117:28]
  wire [3:0] _lqHeadPtr_T_1 = lqHeadPtr + _GEN_1368; // @[src/main/scala/backend/dispatch/DispatchStage.scala 117:28]
  wire [3:0] _GEN_1369 = {{2'd0}, sqAllocCount}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 118:28]
  wire [3:0] _sqHeadPtr_T_1 = sqHeadPtr + _GEN_1369; // @[src/main/scala/backend/dispatch/DispatchStage.scala 118:28]
  wire [4:0] _lqIndices_0_T = {{1'd0}, lqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 131:31]
  wire [3:0] lqIndices_0 = _lqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 131:31]
  wire [4:0] _sqIndices_0_T = {{1'd0}, sqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:31]
  wire [3:0] sqIndices_0 = _sqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:31]
  wire [3:0] _GEN_1370 = {{3'd0}, _lqAllocCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:25]
  wire [4:0] _T_3 = {{1'd0}, _GEN_1370}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:25]
  wire [3:0] _GEN_1371 = {{3'd0}, _sqAllocCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 134:25]
  wire [4:0] _T_6 = {{1'd0}, _GEN_1371}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 134:25]
  wire [3:0] lqIndices_1 = lqHeadPtr + _T_3[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 131:31]
  wire [3:0] sqIndices_1 = sqHeadPtr + _T_6[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:31]
  wire [3:0] _GEN_1372 = {{3'd0}, _lqAllocCount_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:25]
  wire [3:0] _T_10 = _T_3[3:0] + _GEN_1372; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:25]
  wire [3:0] _GEN_1373 = {{3'd0}, _sqAllocCount_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 134:25]
  wire [3:0] _T_13 = _T_6[3:0] + _GEN_1373; // @[src/main/scala/backend/dispatch/DispatchStage.scala 134:25]
  wire [3:0] lqIndices_2 = lqHeadPtr + _T_10; // @[src/main/scala/backend/dispatch/DispatchStage.scala 131:31]
  wire [3:0] sqIndices_2 = sqHeadPtr + _T_13; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:31]
  wire [6:0] u_robIdxFull = {1'h0,stgData_0_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:24]
  wire  u_prs1Busy = stgData_0_rs1Valid & stgData_0_lrs1 != 5'h0 & busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:24]
  wire  u_prs2Busy = stgData_0_rs2Valid & stgData_0_lrs2 != 5'h0 & busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 175:24]
  wire  _GEN_262 = 2'h0 == targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 181:{26,26}]
  wire  _GEN_263 = 2'h1 == targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 181:{26,26}]
  wire  _GEN_264 = 2'h2 == targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 181:{26,26}]
  wire  _GEN_265 = 2'h3 == targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 181:{26,26}]
  wire  _GEN_446 = stgValid & laneValid_0 & _GEN_262; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 180:50]
  wire  _GEN_447 = stgValid & laneValid_0 & _GEN_263; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 180:50]
  wire  _GEN_448 = stgValid & laneValid_0 & _GEN_264; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 180:50]
  wire  _GEN_449 = stgValid & laneValid_0 & _GEN_265; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:21 180:50]
  wire [6:0] u_1_robIdxFull = {1'h0,stgData_1_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:24]
  wire  u_1_prs1Busy = stgData_1_rs1Valid & stgData_1_lrs1 != 5'h0 & busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:24]
  wire  u_1_prs2Busy = stgData_1_rs2Valid & stgData_1_lrs2 != 5'h0 & busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 175:24]
  wire  _GEN_630 = 2'h0 == targetQueue_1 | _GEN_446; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_631 = 2'h1 == targetQueue_1 | _GEN_447; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_632 = 2'h2 == targetQueue_1 | _GEN_448; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_633 = 2'h3 == targetQueue_1 | _GEN_449; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire [31:0] _GEN_634 = 2'h0 == targetQueue_1 ? stgData_1_pc : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_635 = 2'h1 == targetQueue_1 ? stgData_1_pc : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_636 = 2'h2 == targetQueue_1 ? stgData_1_pc : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_637 = 2'h3 == targetQueue_1 ? stgData_1_pc : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_638 = 2'h0 == targetQueue_1 ? stgData_1_inst : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_639 = 2'h1 == targetQueue_1 ? stgData_1_inst : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_640 = 2'h2 == targetQueue_1 ? stgData_1_inst : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_641 = 2'h3 == targetQueue_1 ? stgData_1_inst : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_642 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_fuType : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_643 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_fuType : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_644 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_fuType : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_645 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_fuType : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_646 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_aluOp : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_647 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_aluOp : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_648 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_aluOp : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_649 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_aluOp : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_650 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_bruOp : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_651 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_bruOp : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_652 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_bruOp : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_653 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_bruOp : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_654 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_lsuOp : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_655 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_lsuOp : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_656 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_lsuOp : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_657 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_lsuOp : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_658 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_csrOp : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_659 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_csrOp : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_660 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_csrOp : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_661 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_csrOp : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_662 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_mulDivOp : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_663 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_mulDivOp : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_664 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_mulDivOp : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_665 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_mulDivOp : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_666 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_src1Type : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_667 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_src1Type : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_668 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_src1Type : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_669 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_src1Type : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_670 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_src2Type : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_671 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_src2Type : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_672 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_src2Type : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_673 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_src2Type : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_674 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_immType : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_675 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_immType : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_676 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_immType : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_677 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_immType : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_678 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_rfWen : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_679 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_rfWen : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_680 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_rfWen : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_681 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_rfWen : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_682 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_memRead : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_683 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_memRead : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_684 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_memRead : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_685 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_memRead : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_686 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_memWrite : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_687 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_memWrite : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_688 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_memWrite : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_689 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_memWrite : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_690 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_csrWen : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_691 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_csrWen : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_692 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_csrWen : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_693 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_csrWen : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_694 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_isBranch : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_695 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_isBranch : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_696 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_isBranch : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_697 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_isBranch : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_698 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_isJump : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_699 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_isJump : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_700 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_isJump : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_701 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_isJump : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_702 = 2'h0 == targetQueue_1 ? stgData_1_ctrl_isPriv : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_703 = 2'h1 == targetQueue_1 ? stgData_1_ctrl_isPriv : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_704 = 2'h2 == targetQueue_1 ? stgData_1_ctrl_isPriv : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_705 = 2'h3 == targetQueue_1 ? stgData_1_ctrl_isPriv : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_706 = 2'h0 == targetQueue_1 ? stgData_1_excpVec : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_707 = 2'h1 == targetQueue_1 ? stgData_1_excpVec : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_708 = 2'h2 == targetQueue_1 ? stgData_1_excpVec : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_709 = 2'h3 == targetQueue_1 ? stgData_1_excpVec : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_710 = 2'h0 == targetQueue_1 ? stgData_1_imm : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_711 = 2'h1 == targetQueue_1 ? stgData_1_imm : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_712 = 2'h2 == targetQueue_1 ? stgData_1_imm : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_713 = 2'h3 == targetQueue_1 ? stgData_1_imm : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_714 = 2'h0 == targetQueue_1 ? stgData_1_csrAddress : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_715 = 2'h1 == targetQueue_1 ? stgData_1_csrAddress : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_716 = 2'h2 == targetQueue_1 ? stgData_1_csrAddress : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_717 = 2'h3 == targetQueue_1 ? stgData_1_csrAddress : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_718 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_valid : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_719 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_valid : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_720 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_valid : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_721 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_valid : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_722 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_isBr : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_723 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_isBr : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_724 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_isBr : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_725 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_isBr : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_726 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_isJal : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_727 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_isJal : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_728 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_isJal : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_729 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_isJal : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_730 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_isJalr : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_731 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_isJalr : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_732 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_isJalr : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_733 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_isJalr : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_734 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_isCall : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_735 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_isCall : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_736 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_isCall : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_737 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_isCall : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_738 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_isRet : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_739 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_isRet : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_740 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_isRet : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_741 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_isRet : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_742 = 2'h0 == targetQueue_1 ? stgData_1_pdInfo_jumpTarget : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_743 = 2'h1 == targetQueue_1 ? stgData_1_pdInfo_jumpTarget : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_744 = 2'h2 == targetQueue_1 ? stgData_1_pdInfo_jumpTarget : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_745 = 2'h3 == targetQueue_1 ? stgData_1_pdInfo_jumpTarget : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_746 = 2'h0 == targetQueue_1 ? stgData_1_ldst : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_747 = 2'h1 == targetQueue_1 ? stgData_1_ldst : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_748 = 2'h2 == targetQueue_1 ? stgData_1_ldst : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_749 = 2'h3 == targetQueue_1 ? stgData_1_ldst : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_750 = 2'h0 == targetQueue_1 ? stgData_1_lrs1 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_751 = 2'h1 == targetQueue_1 ? stgData_1_lrs1 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_752 = 2'h2 == targetQueue_1 ? stgData_1_lrs1 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_753 = 2'h3 == targetQueue_1 ? stgData_1_lrs1 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_754 = 2'h0 == targetQueue_1 ? stgData_1_lrs2 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_755 = 2'h1 == targetQueue_1 ? stgData_1_lrs2 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_756 = 2'h2 == targetQueue_1 ? stgData_1_lrs2 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_757 = 2'h3 == targetQueue_1 ? stgData_1_lrs2 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_758 = 2'h0 == targetQueue_1 ? stgData_1_pdst : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_759 = 2'h1 == targetQueue_1 ? stgData_1_pdst : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_760 = 2'h2 == targetQueue_1 ? stgData_1_pdst : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_761 = 2'h3 == targetQueue_1 ? stgData_1_pdst : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_762 = 2'h0 == targetQueue_1 ? stgData_1_prs1 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_763 = 2'h1 == targetQueue_1 ? stgData_1_prs1 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_764 = 2'h2 == targetQueue_1 ? stgData_1_prs1 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_765 = 2'h3 == targetQueue_1 ? stgData_1_prs1 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_766 = 2'h0 == targetQueue_1 ? stgData_1_prs2 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_767 = 2'h1 == targetQueue_1 ? stgData_1_prs2 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_768 = 2'h2 == targetQueue_1 ? stgData_1_prs2 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_769 = 2'h3 == targetQueue_1 ? stgData_1_prs2 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_770 = 2'h0 == targetQueue_1 ? stgData_1_oldPdst : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_771 = 2'h1 == targetQueue_1 ? stgData_1_oldPdst : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_772 = 2'h2 == targetQueue_1 ? stgData_1_oldPdst : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_773 = 2'h3 == targetQueue_1 ? stgData_1_oldPdst : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_774 = 2'h0 == targetQueue_1 ? stgData_1_rs1Valid : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_775 = 2'h1 == targetQueue_1 ? stgData_1_rs1Valid : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_776 = 2'h2 == targetQueue_1 ? stgData_1_rs1Valid : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_777 = 2'h3 == targetQueue_1 ? stgData_1_rs1Valid : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_778 = 2'h0 == targetQueue_1 ? stgData_1_rs2Valid : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_779 = 2'h1 == targetQueue_1 ? stgData_1_rs2Valid : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_780 = 2'h2 == targetQueue_1 ? stgData_1_rs2Valid : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_781 = 2'h3 == targetQueue_1 ? stgData_1_rs2Valid : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_782 = 2'h0 == targetQueue_1 ? stgData_1_rdValid : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_783 = 2'h1 == targetQueue_1 ? stgData_1_rdValid : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_784 = 2'h2 == targetQueue_1 ? stgData_1_rdValid : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_785 = 2'h3 == targetQueue_1 ? stgData_1_rdValid : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_786 = 2'h0 == targetQueue_1 ? stgData_1_robIdx : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_787 = 2'h1 == targetQueue_1 ? stgData_1_robIdx : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_788 = 2'h2 == targetQueue_1 ? stgData_1_robIdx : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_789 = 2'h3 == targetQueue_1 ? stgData_1_robIdx : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_790 = 2'h0 == targetQueue_1 ? u_1_robIdxFull : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_791 = 2'h1 == targetQueue_1 ? u_1_robIdxFull : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_792 = 2'h2 == targetQueue_1 ? u_1_robIdxFull : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_793 = 2'h3 == targetQueue_1 ? u_1_robIdxFull : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_794 = 2'h0 == targetQueue_1 ? lqIndices_1 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_795 = 2'h1 == targetQueue_1 ? lqIndices_1 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_796 = 2'h2 == targetQueue_1 ? lqIndices_1 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_797 = 2'h3 == targetQueue_1 ? lqIndices_1 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_798 = 2'h0 == targetQueue_1 ? sqIndices_1 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_799 = 2'h1 == targetQueue_1 ? sqIndices_1 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_800 = 2'h2 == targetQueue_1 ? sqIndices_1 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_801 = 2'h3 == targetQueue_1 ? sqIndices_1 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_802 = 2'h0 == targetQueue_1 ? targetQueue_1 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_803 = 2'h1 == targetQueue_1 ? targetQueue_1 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_804 = 2'h2 == targetQueue_1 ? targetQueue_1 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_805 = 2'h3 == targetQueue_1 ? targetQueue_1 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_806 = 2'h0 == targetQueue_1 ? u_1_prs1Busy : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_807 = 2'h1 == targetQueue_1 ? u_1_prs1Busy : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_808 = 2'h2 == targetQueue_1 ? u_1_prs1Busy : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_809 = 2'h3 == targetQueue_1 ? u_1_prs1Busy : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_810 = 2'h0 == targetQueue_1 ? u_1_prs2Busy : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_811 = 2'h1 == targetQueue_1 ? u_1_prs2Busy : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_812 = 2'h2 == targetQueue_1 ? u_1_prs2Busy : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_813 = 2'h3 == targetQueue_1 ? u_1_prs2Busy : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_814 = stgValid & laneValid_1 ? _GEN_630 : _GEN_446; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_815 = stgValid & laneValid_1 ? _GEN_631 : _GEN_447; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_816 = stgValid & laneValid_1 ? _GEN_632 : _GEN_448; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_817 = stgValid & laneValid_1 ? _GEN_633 : _GEN_449; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_818 = stgValid & laneValid_1 ? _GEN_634 : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_819 = stgValid & laneValid_1 ? _GEN_635 : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_820 = stgValid & laneValid_1 ? _GEN_636 : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_821 = stgValid & laneValid_1 ? _GEN_637 : stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_822 = stgValid & laneValid_1 ? _GEN_638 : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_823 = stgValid & laneValid_1 ? _GEN_639 : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_824 = stgValid & laneValid_1 ? _GEN_640 : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_825 = stgValid & laneValid_1 ? _GEN_641 : stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_826 = stgValid & laneValid_1 ? _GEN_642 : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_827 = stgValid & laneValid_1 ? _GEN_643 : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_828 = stgValid & laneValid_1 ? _GEN_644 : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_829 = stgValid & laneValid_1 ? _GEN_645 : stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_830 = stgValid & laneValid_1 ? _GEN_646 : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_831 = stgValid & laneValid_1 ? _GEN_647 : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_832 = stgValid & laneValid_1 ? _GEN_648 : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_833 = stgValid & laneValid_1 ? _GEN_649 : stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_834 = stgValid & laneValid_1 ? _GEN_650 : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_835 = stgValid & laneValid_1 ? _GEN_651 : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_836 = stgValid & laneValid_1 ? _GEN_652 : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_837 = stgValid & laneValid_1 ? _GEN_653 : stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_838 = stgValid & laneValid_1 ? _GEN_654 : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_839 = stgValid & laneValid_1 ? _GEN_655 : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_840 = stgValid & laneValid_1 ? _GEN_656 : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_841 = stgValid & laneValid_1 ? _GEN_657 : stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_842 = stgValid & laneValid_1 ? _GEN_658 : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_843 = stgValid & laneValid_1 ? _GEN_659 : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_844 = stgValid & laneValid_1 ? _GEN_660 : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_845 = stgValid & laneValid_1 ? _GEN_661 : stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_846 = stgValid & laneValid_1 ? _GEN_662 : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_847 = stgValid & laneValid_1 ? _GEN_663 : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_848 = stgValid & laneValid_1 ? _GEN_664 : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_849 = stgValid & laneValid_1 ? _GEN_665 : stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_850 = stgValid & laneValid_1 ? _GEN_666 : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_851 = stgValid & laneValid_1 ? _GEN_667 : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_852 = stgValid & laneValid_1 ? _GEN_668 : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_853 = stgValid & laneValid_1 ? _GEN_669 : stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_854 = stgValid & laneValid_1 ? _GEN_670 : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_855 = stgValid & laneValid_1 ? _GEN_671 : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_856 = stgValid & laneValid_1 ? _GEN_672 : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [2:0] _GEN_857 = stgValid & laneValid_1 ? _GEN_673 : stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_858 = stgValid & laneValid_1 ? _GEN_674 : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_859 = stgValid & laneValid_1 ? _GEN_675 : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_860 = stgValid & laneValid_1 ? _GEN_676 : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_861 = stgValid & laneValid_1 ? _GEN_677 : stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_862 = stgValid & laneValid_1 ? _GEN_678 : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_863 = stgValid & laneValid_1 ? _GEN_679 : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_864 = stgValid & laneValid_1 ? _GEN_680 : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_865 = stgValid & laneValid_1 ? _GEN_681 : stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_866 = stgValid & laneValid_1 ? _GEN_682 : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_867 = stgValid & laneValid_1 ? _GEN_683 : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_868 = stgValid & laneValid_1 ? _GEN_684 : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_869 = stgValid & laneValid_1 ? _GEN_685 : stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_870 = stgValid & laneValid_1 ? _GEN_686 : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_871 = stgValid & laneValid_1 ? _GEN_687 : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_872 = stgValid & laneValid_1 ? _GEN_688 : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_873 = stgValid & laneValid_1 ? _GEN_689 : stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_874 = stgValid & laneValid_1 ? _GEN_690 : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_875 = stgValid & laneValid_1 ? _GEN_691 : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_876 = stgValid & laneValid_1 ? _GEN_692 : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_877 = stgValid & laneValid_1 ? _GEN_693 : stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_878 = stgValid & laneValid_1 ? _GEN_694 : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_879 = stgValid & laneValid_1 ? _GEN_695 : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_880 = stgValid & laneValid_1 ? _GEN_696 : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_881 = stgValid & laneValid_1 ? _GEN_697 : stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_882 = stgValid & laneValid_1 ? _GEN_698 : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_883 = stgValid & laneValid_1 ? _GEN_699 : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_884 = stgValid & laneValid_1 ? _GEN_700 : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_885 = stgValid & laneValid_1 ? _GEN_701 : stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_886 = stgValid & laneValid_1 ? _GEN_702 : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_887 = stgValid & laneValid_1 ? _GEN_703 : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_888 = stgValid & laneValid_1 ? _GEN_704 : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_889 = stgValid & laneValid_1 ? _GEN_705 : stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [9:0] _GEN_890 = stgValid & laneValid_1 ? _GEN_706 : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [9:0] _GEN_891 = stgValid & laneValid_1 ? _GEN_707 : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [9:0] _GEN_892 = stgValid & laneValid_1 ? _GEN_708 : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [9:0] _GEN_893 = stgValid & laneValid_1 ? _GEN_709 : stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_894 = stgValid & laneValid_1 ? _GEN_710 : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_895 = stgValid & laneValid_1 ? _GEN_711 : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_896 = stgValid & laneValid_1 ? _GEN_712 : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_897 = stgValid & laneValid_1 ? _GEN_713 : stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [13:0] _GEN_898 = stgValid & laneValid_1 ? _GEN_714 : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [13:0] _GEN_899 = stgValid & laneValid_1 ? _GEN_715 : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [13:0] _GEN_900 = stgValid & laneValid_1 ? _GEN_716 : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [13:0] _GEN_901 = stgValid & laneValid_1 ? _GEN_717 : stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_902 = stgValid & laneValid_1 ? _GEN_718 : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_903 = stgValid & laneValid_1 ? _GEN_719 : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_904 = stgValid & laneValid_1 ? _GEN_720 : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_905 = stgValid & laneValid_1 ? _GEN_721 : stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_906 = stgValid & laneValid_1 ? _GEN_722 : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_907 = stgValid & laneValid_1 ? _GEN_723 : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_908 = stgValid & laneValid_1 ? _GEN_724 : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_909 = stgValid & laneValid_1 ? _GEN_725 : stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_910 = stgValid & laneValid_1 ? _GEN_726 : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_911 = stgValid & laneValid_1 ? _GEN_727 : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_912 = stgValid & laneValid_1 ? _GEN_728 : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_913 = stgValid & laneValid_1 ? _GEN_729 : stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_914 = stgValid & laneValid_1 ? _GEN_730 : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_915 = stgValid & laneValid_1 ? _GEN_731 : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_916 = stgValid & laneValid_1 ? _GEN_732 : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_917 = stgValid & laneValid_1 ? _GEN_733 : stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_918 = stgValid & laneValid_1 ? _GEN_734 : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_919 = stgValid & laneValid_1 ? _GEN_735 : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_920 = stgValid & laneValid_1 ? _GEN_736 : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_921 = stgValid & laneValid_1 ? _GEN_737 : stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_922 = stgValid & laneValid_1 ? _GEN_738 : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_923 = stgValid & laneValid_1 ? _GEN_739 : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_924 = stgValid & laneValid_1 ? _GEN_740 : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_925 = stgValid & laneValid_1 ? _GEN_741 : stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_926 = stgValid & laneValid_1 ? _GEN_742 : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_927 = stgValid & laneValid_1 ? _GEN_743 : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_928 = stgValid & laneValid_1 ? _GEN_744 : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [31:0] _GEN_929 = stgValid & laneValid_1 ? _GEN_745 : stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_930 = stgValid & laneValid_1 ? _GEN_746 : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_931 = stgValid & laneValid_1 ? _GEN_747 : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_932 = stgValid & laneValid_1 ? _GEN_748 : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_933 = stgValid & laneValid_1 ? _GEN_749 : stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_934 = stgValid & laneValid_1 ? _GEN_750 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_935 = stgValid & laneValid_1 ? _GEN_751 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_936 = stgValid & laneValid_1 ? _GEN_752 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_937 = stgValid & laneValid_1 ? _GEN_753 : stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_938 = stgValid & laneValid_1 ? _GEN_754 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_939 = stgValid & laneValid_1 ? _GEN_755 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_940 = stgValid & laneValid_1 ? _GEN_756 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [4:0] _GEN_941 = stgValid & laneValid_1 ? _GEN_757 : stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_942 = stgValid & laneValid_1 ? _GEN_758 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_943 = stgValid & laneValid_1 ? _GEN_759 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_944 = stgValid & laneValid_1 ? _GEN_760 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_945 = stgValid & laneValid_1 ? _GEN_761 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_946 = stgValid & laneValid_1 ? _GEN_762 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_947 = stgValid & laneValid_1 ? _GEN_763 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_948 = stgValid & laneValid_1 ? _GEN_764 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_949 = stgValid & laneValid_1 ? _GEN_765 : stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_950 = stgValid & laneValid_1 ? _GEN_766 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_951 = stgValid & laneValid_1 ? _GEN_767 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_952 = stgValid & laneValid_1 ? _GEN_768 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_953 = stgValid & laneValid_1 ? _GEN_769 : stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_954 = stgValid & laneValid_1 ? _GEN_770 : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_955 = stgValid & laneValid_1 ? _GEN_771 : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_956 = stgValid & laneValid_1 ? _GEN_772 : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_957 = stgValid & laneValid_1 ? _GEN_773 : stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_958 = stgValid & laneValid_1 ? _GEN_774 : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_959 = stgValid & laneValid_1 ? _GEN_775 : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_960 = stgValid & laneValid_1 ? _GEN_776 : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_961 = stgValid & laneValid_1 ? _GEN_777 : stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_962 = stgValid & laneValid_1 ? _GEN_778 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_963 = stgValid & laneValid_1 ? _GEN_779 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_964 = stgValid & laneValid_1 ? _GEN_780 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_965 = stgValid & laneValid_1 ? _GEN_781 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_966 = stgValid & laneValid_1 ? _GEN_782 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_967 = stgValid & laneValid_1 ? _GEN_783 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_968 = stgValid & laneValid_1 ? _GEN_784 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_969 = stgValid & laneValid_1 ? _GEN_785 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_970 = stgValid & laneValid_1 ? _GEN_786 : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_971 = stgValid & laneValid_1 ? _GEN_787 : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_972 = stgValid & laneValid_1 ? _GEN_788 : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [5:0] _GEN_973 = stgValid & laneValid_1 ? _GEN_789 : stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [6:0] _GEN_974 = stgValid & laneValid_1 ? _GEN_790 : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [6:0] _GEN_975 = stgValid & laneValid_1 ? _GEN_791 : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [6:0] _GEN_976 = stgValid & laneValid_1 ? _GEN_792 : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [6:0] _GEN_977 = stgValid & laneValid_1 ? _GEN_793 : u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_978 = stgValid & laneValid_1 ? _GEN_794 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_979 = stgValid & laneValid_1 ? _GEN_795 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_980 = stgValid & laneValid_1 ? _GEN_796 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_981 = stgValid & laneValid_1 ? _GEN_797 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_982 = stgValid & laneValid_1 ? _GEN_798 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_983 = stgValid & laneValid_1 ? _GEN_799 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_984 = stgValid & laneValid_1 ? _GEN_800 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [3:0] _GEN_985 = stgValid & laneValid_1 ? _GEN_801 : sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [1:0] _GEN_986 = stgValid & laneValid_1 ? _GEN_802 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [1:0] _GEN_987 = stgValid & laneValid_1 ? _GEN_803 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [1:0] _GEN_988 = stgValid & laneValid_1 ? _GEN_804 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [1:0] _GEN_989 = stgValid & laneValid_1 ? _GEN_805 : targetQueue_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_990 = stgValid & laneValid_1 ? _GEN_806 : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_991 = stgValid & laneValid_1 ? _GEN_807 : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_992 = stgValid & laneValid_1 ? _GEN_808 : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_993 = stgValid & laneValid_1 ? _GEN_809 : u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_994 = stgValid & laneValid_1 ? _GEN_810 : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_995 = stgValid & laneValid_1 ? _GEN_811 : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_996 = stgValid & laneValid_1 ? _GEN_812 : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire  _GEN_997 = stgValid & laneValid_1 ? _GEN_813 : u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  wire [6:0] u_2_robIdxFull = {1'h0,stgData_2_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:24]
  wire  u_2_prs1Busy = stgData_2_rs1Valid & stgData_2_lrs1 != 5'h0 & busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:24]
  wire  u_2_prs2Busy = stgData_2_rs2Valid & stgData_2_lrs2 != 5'h0 & busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 175:24]
  wire  _GEN_998 = 2'h0 == targetQueue_2 | _GEN_814; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_999 = 2'h1 == targetQueue_2 | _GEN_815; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_1000 = 2'h2 == targetQueue_2 | _GEN_816; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire  _GEN_1001 = 2'h3 == targetQueue_2 | _GEN_817; // @[src/main/scala/backend/dispatch/DispatchStage.scala 181:{26,26}]
  wire [31:0] _GEN_1002 = 2'h0 == targetQueue_2 ? stgData_2_pc : _GEN_818; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1003 = 2'h1 == targetQueue_2 ? stgData_2_pc : _GEN_819; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1004 = 2'h2 == targetQueue_2 ? stgData_2_pc : _GEN_820; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1005 = 2'h3 == targetQueue_2 ? stgData_2_pc : _GEN_821; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1006 = 2'h0 == targetQueue_2 ? stgData_2_inst : _GEN_822; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1007 = 2'h1 == targetQueue_2 ? stgData_2_inst : _GEN_823; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1008 = 2'h2 == targetQueue_2 ? stgData_2_inst : _GEN_824; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1009 = 2'h3 == targetQueue_2 ? stgData_2_inst : _GEN_825; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1010 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_fuType : _GEN_826; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1011 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_fuType : _GEN_827; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1012 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_fuType : _GEN_828; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1013 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_fuType : _GEN_829; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1014 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_aluOp : _GEN_830; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1015 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_aluOp : _GEN_831; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1016 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_aluOp : _GEN_832; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1017 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_aluOp : _GEN_833; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1018 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_bruOp : _GEN_834; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1019 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_bruOp : _GEN_835; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1020 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_bruOp : _GEN_836; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1021 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_bruOp : _GEN_837; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1022 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_lsuOp : _GEN_838; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1023 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_lsuOp : _GEN_839; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1024 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_lsuOp : _GEN_840; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1025 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_lsuOp : _GEN_841; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1026 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_csrOp : _GEN_842; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1027 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_csrOp : _GEN_843; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1028 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_csrOp : _GEN_844; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1029 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_csrOp : _GEN_845; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1030 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_mulDivOp : _GEN_846; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1031 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_mulDivOp : _GEN_847; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1032 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_mulDivOp : _GEN_848; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1033 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_mulDivOp : _GEN_849; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1034 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_src1Type : _GEN_850; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1035 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_src1Type : _GEN_851; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1036 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_src1Type : _GEN_852; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1037 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_src1Type : _GEN_853; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1038 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_src2Type : _GEN_854; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1039 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_src2Type : _GEN_855; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1040 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_src2Type : _GEN_856; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [2:0] _GEN_1041 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_src2Type : _GEN_857; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1042 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_immType : _GEN_858; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1043 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_immType : _GEN_859; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1044 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_immType : _GEN_860; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1045 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_immType : _GEN_861; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1046 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_rfWen : _GEN_862; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1047 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_rfWen : _GEN_863; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1048 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_rfWen : _GEN_864; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1049 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_rfWen : _GEN_865; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1050 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_memRead : _GEN_866; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1051 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_memRead : _GEN_867; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1052 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_memRead : _GEN_868; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1053 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_memRead : _GEN_869; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1054 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_memWrite : _GEN_870; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1055 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_memWrite : _GEN_871; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1056 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_memWrite : _GEN_872; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1057 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_memWrite : _GEN_873; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1058 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_csrWen : _GEN_874; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1059 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_csrWen : _GEN_875; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1060 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_csrWen : _GEN_876; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1061 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_csrWen : _GEN_877; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1062 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_isBranch : _GEN_878; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1063 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_isBranch : _GEN_879; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1064 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_isBranch : _GEN_880; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1065 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_isBranch : _GEN_881; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1066 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_isJump : _GEN_882; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1067 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_isJump : _GEN_883; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1068 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_isJump : _GEN_884; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1069 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_isJump : _GEN_885; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1070 = 2'h0 == targetQueue_2 ? stgData_2_ctrl_isPriv : _GEN_886; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1071 = 2'h1 == targetQueue_2 ? stgData_2_ctrl_isPriv : _GEN_887; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1072 = 2'h2 == targetQueue_2 ? stgData_2_ctrl_isPriv : _GEN_888; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1073 = 2'h3 == targetQueue_2 ? stgData_2_ctrl_isPriv : _GEN_889; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_1074 = 2'h0 == targetQueue_2 ? stgData_2_excpVec : _GEN_890; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_1075 = 2'h1 == targetQueue_2 ? stgData_2_excpVec : _GEN_891; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_1076 = 2'h2 == targetQueue_2 ? stgData_2_excpVec : _GEN_892; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [9:0] _GEN_1077 = 2'h3 == targetQueue_2 ? stgData_2_excpVec : _GEN_893; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1078 = 2'h0 == targetQueue_2 ? stgData_2_imm : _GEN_894; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1079 = 2'h1 == targetQueue_2 ? stgData_2_imm : _GEN_895; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1080 = 2'h2 == targetQueue_2 ? stgData_2_imm : _GEN_896; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1081 = 2'h3 == targetQueue_2 ? stgData_2_imm : _GEN_897; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_1082 = 2'h0 == targetQueue_2 ? stgData_2_csrAddress : _GEN_898; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_1083 = 2'h1 == targetQueue_2 ? stgData_2_csrAddress : _GEN_899; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_1084 = 2'h2 == targetQueue_2 ? stgData_2_csrAddress : _GEN_900; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [13:0] _GEN_1085 = 2'h3 == targetQueue_2 ? stgData_2_csrAddress : _GEN_901; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1086 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_valid : _GEN_902; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1087 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_valid : _GEN_903; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1088 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_valid : _GEN_904; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1089 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_valid : _GEN_905; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1090 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_isBr : _GEN_906; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1091 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_isBr : _GEN_907; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1092 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_isBr : _GEN_908; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1093 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_isBr : _GEN_909; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1094 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_isJal : _GEN_910; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1095 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_isJal : _GEN_911; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1096 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_isJal : _GEN_912; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1097 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_isJal : _GEN_913; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1098 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_isJalr : _GEN_914; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1099 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_isJalr : _GEN_915; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1100 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_isJalr : _GEN_916; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1101 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_isJalr : _GEN_917; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1102 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_isCall : _GEN_918; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1103 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_isCall : _GEN_919; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1104 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_isCall : _GEN_920; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1105 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_isCall : _GEN_921; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1106 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_isRet : _GEN_922; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1107 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_isRet : _GEN_923; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1108 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_isRet : _GEN_924; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1109 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_isRet : _GEN_925; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1110 = 2'h0 == targetQueue_2 ? stgData_2_pdInfo_jumpTarget : _GEN_926; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1111 = 2'h1 == targetQueue_2 ? stgData_2_pdInfo_jumpTarget : _GEN_927; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1112 = 2'h2 == targetQueue_2 ? stgData_2_pdInfo_jumpTarget : _GEN_928; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [31:0] _GEN_1113 = 2'h3 == targetQueue_2 ? stgData_2_pdInfo_jumpTarget : _GEN_929; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1114 = 2'h0 == targetQueue_2 ? stgData_2_ldst : _GEN_930; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1115 = 2'h1 == targetQueue_2 ? stgData_2_ldst : _GEN_931; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1116 = 2'h2 == targetQueue_2 ? stgData_2_ldst : _GEN_932; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1117 = 2'h3 == targetQueue_2 ? stgData_2_ldst : _GEN_933; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1118 = 2'h0 == targetQueue_2 ? stgData_2_lrs1 : _GEN_934; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1119 = 2'h1 == targetQueue_2 ? stgData_2_lrs1 : _GEN_935; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1120 = 2'h2 == targetQueue_2 ? stgData_2_lrs1 : _GEN_936; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1121 = 2'h3 == targetQueue_2 ? stgData_2_lrs1 : _GEN_937; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1122 = 2'h0 == targetQueue_2 ? stgData_2_lrs2 : _GEN_938; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1123 = 2'h1 == targetQueue_2 ? stgData_2_lrs2 : _GEN_939; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1124 = 2'h2 == targetQueue_2 ? stgData_2_lrs2 : _GEN_940; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [4:0] _GEN_1125 = 2'h3 == targetQueue_2 ? stgData_2_lrs2 : _GEN_941; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1126 = 2'h0 == targetQueue_2 ? stgData_2_pdst : _GEN_942; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1127 = 2'h1 == targetQueue_2 ? stgData_2_pdst : _GEN_943; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1128 = 2'h2 == targetQueue_2 ? stgData_2_pdst : _GEN_944; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1129 = 2'h3 == targetQueue_2 ? stgData_2_pdst : _GEN_945; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1130 = 2'h0 == targetQueue_2 ? stgData_2_prs1 : _GEN_946; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1131 = 2'h1 == targetQueue_2 ? stgData_2_prs1 : _GEN_947; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1132 = 2'h2 == targetQueue_2 ? stgData_2_prs1 : _GEN_948; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1133 = 2'h3 == targetQueue_2 ? stgData_2_prs1 : _GEN_949; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1134 = 2'h0 == targetQueue_2 ? stgData_2_prs2 : _GEN_950; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1135 = 2'h1 == targetQueue_2 ? stgData_2_prs2 : _GEN_951; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1136 = 2'h2 == targetQueue_2 ? stgData_2_prs2 : _GEN_952; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1137 = 2'h3 == targetQueue_2 ? stgData_2_prs2 : _GEN_953; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1138 = 2'h0 == targetQueue_2 ? stgData_2_oldPdst : _GEN_954; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1139 = 2'h1 == targetQueue_2 ? stgData_2_oldPdst : _GEN_955; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1140 = 2'h2 == targetQueue_2 ? stgData_2_oldPdst : _GEN_956; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1141 = 2'h3 == targetQueue_2 ? stgData_2_oldPdst : _GEN_957; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1142 = 2'h0 == targetQueue_2 ? stgData_2_rs1Valid : _GEN_958; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1143 = 2'h1 == targetQueue_2 ? stgData_2_rs1Valid : _GEN_959; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1144 = 2'h2 == targetQueue_2 ? stgData_2_rs1Valid : _GEN_960; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1145 = 2'h3 == targetQueue_2 ? stgData_2_rs1Valid : _GEN_961; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1146 = 2'h0 == targetQueue_2 ? stgData_2_rs2Valid : _GEN_962; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1147 = 2'h1 == targetQueue_2 ? stgData_2_rs2Valid : _GEN_963; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1148 = 2'h2 == targetQueue_2 ? stgData_2_rs2Valid : _GEN_964; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1149 = 2'h3 == targetQueue_2 ? stgData_2_rs2Valid : _GEN_965; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1150 = 2'h0 == targetQueue_2 ? stgData_2_rdValid : _GEN_966; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1151 = 2'h1 == targetQueue_2 ? stgData_2_rdValid : _GEN_967; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1152 = 2'h2 == targetQueue_2 ? stgData_2_rdValid : _GEN_968; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1153 = 2'h3 == targetQueue_2 ? stgData_2_rdValid : _GEN_969; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1154 = 2'h0 == targetQueue_2 ? stgData_2_robIdx : _GEN_970; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1155 = 2'h1 == targetQueue_2 ? stgData_2_robIdx : _GEN_971; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1156 = 2'h2 == targetQueue_2 ? stgData_2_robIdx : _GEN_972; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [5:0] _GEN_1157 = 2'h3 == targetQueue_2 ? stgData_2_robIdx : _GEN_973; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_1158 = 2'h0 == targetQueue_2 ? u_2_robIdxFull : _GEN_974; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_1159 = 2'h1 == targetQueue_2 ? u_2_robIdxFull : _GEN_975; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_1160 = 2'h2 == targetQueue_2 ? u_2_robIdxFull : _GEN_976; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [6:0] _GEN_1161 = 2'h3 == targetQueue_2 ? u_2_robIdxFull : _GEN_977; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1162 = 2'h0 == targetQueue_2 ? lqIndices_2 : _GEN_978; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1163 = 2'h1 == targetQueue_2 ? lqIndices_2 : _GEN_979; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1164 = 2'h2 == targetQueue_2 ? lqIndices_2 : _GEN_980; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1165 = 2'h3 == targetQueue_2 ? lqIndices_2 : _GEN_981; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1166 = 2'h0 == targetQueue_2 ? sqIndices_2 : _GEN_982; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1167 = 2'h1 == targetQueue_2 ? sqIndices_2 : _GEN_983; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1168 = 2'h2 == targetQueue_2 ? sqIndices_2 : _GEN_984; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [3:0] _GEN_1169 = 2'h3 == targetQueue_2 ? sqIndices_2 : _GEN_985; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_1170 = 2'h0 == targetQueue_2 ? targetQueue_2 : _GEN_986; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_1171 = 2'h1 == targetQueue_2 ? targetQueue_2 : _GEN_987; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_1172 = 2'h2 == targetQueue_2 ? targetQueue_2 : _GEN_988; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire [1:0] _GEN_1173 = 2'h3 == targetQueue_2 ? targetQueue_2 : _GEN_989; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1174 = 2'h0 == targetQueue_2 ? u_2_prs1Busy : _GEN_990; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1175 = 2'h1 == targetQueue_2 ? u_2_prs1Busy : _GEN_991; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1176 = 2'h2 == targetQueue_2 ? u_2_prs1Busy : _GEN_992; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1177 = 2'h3 == targetQueue_2 ? u_2_prs1Busy : _GEN_993; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1178 = 2'h0 == targetQueue_2 ? u_2_prs2Busy : _GEN_994; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1179 = 2'h1 == targetQueue_2 ? u_2_prs2Busy : _GEN_995; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1180 = 2'h2 == targetQueue_2 ? u_2_prs2Busy : _GEN_996; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  wire  _GEN_1181 = 2'h3 == targetQueue_2 ? u_2_prs2Busy : _GEN_997; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:{26,26}]
  BusyTable busyTable ( // @[src/main/scala/backend/dispatch/DispatchStage.scala 30:25]
    .clock(busyTable_clock),
    .reset(busyTable_reset),
    .io_readReq_0(busyTable_io_readReq_0),
    .io_readReq_1(busyTable_io_readReq_1),
    .io_readReq_2(busyTable_io_readReq_2),
    .io_readReq_3(busyTable_io_readReq_3),
    .io_readReq_4(busyTable_io_readReq_4),
    .io_readReq_5(busyTable_io_readReq_5),
    .io_readResp_0(busyTable_io_readResp_0),
    .io_readResp_1(busyTable_io_readResp_1),
    .io_readResp_2(busyTable_io_readResp_2),
    .io_readResp_3(busyTable_io_readResp_3),
    .io_readResp_4(busyTable_io_readResp_4),
    .io_readResp_5(busyTable_io_readResp_5),
    .io_allocReq_0_valid(busyTable_io_allocReq_0_valid),
    .io_allocReq_0_bits(busyTable_io_allocReq_0_bits),
    .io_allocReq_1_valid(busyTable_io_allocReq_1_valid),
    .io_allocReq_1_bits(busyTable_io_allocReq_1_bits),
    .io_allocReq_2_valid(busyTable_io_allocReq_2_valid),
    .io_allocReq_2_bits(busyTable_io_allocReq_2_bits)
  );
  assign io_in_0_ready = ~stgValid | outFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:28]
  assign io_in_1_ready = ~stgValid | outFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:28]
  assign io_in_2_ready = ~stgValid | outFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:28]
  assign io_out_0_valid = stgValid & laneValid_2 ? _GEN_998 : _GEN_814; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pc = stgValid & laneValid_2 ? _GEN_1002 : _GEN_818; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_inst = stgValid & laneValid_2 ? _GEN_1006 : _GEN_822; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_fuType = stgValid & laneValid_2 ? _GEN_1010 : _GEN_826; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_aluOp = stgValid & laneValid_2 ? _GEN_1014 : _GEN_830; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_bruOp = stgValid & laneValid_2 ? _GEN_1018 : _GEN_834; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_lsuOp = stgValid & laneValid_2 ? _GEN_1022 : _GEN_838; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_csrOp = stgValid & laneValid_2 ? _GEN_1026 : _GEN_842; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_mulDivOp = stgValid & laneValid_2 ? _GEN_1030 : _GEN_846; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_src1Type = stgValid & laneValid_2 ? _GEN_1034 : _GEN_850; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_src2Type = stgValid & laneValid_2 ? _GEN_1038 : _GEN_854; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_immType = stgValid & laneValid_2 ? _GEN_1042 : _GEN_858; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_rfWen = stgValid & laneValid_2 ? _GEN_1046 : _GEN_862; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_memRead = stgValid & laneValid_2 ? _GEN_1050 : _GEN_866; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_memWrite = stgValid & laneValid_2 ? _GEN_1054 : _GEN_870; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_csrWen = stgValid & laneValid_2 ? _GEN_1058 : _GEN_874; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_isBranch = stgValid & laneValid_2 ? _GEN_1062 : _GEN_878; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_isJump = stgValid & laneValid_2 ? _GEN_1066 : _GEN_882; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ctrl_isPriv = stgValid & laneValid_2 ? _GEN_1070 : _GEN_886; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_excpVec = stgValid & laneValid_2 ? _GEN_1074 : _GEN_890; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_imm = stgValid & laneValid_2 ? _GEN_1078 : _GEN_894; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_csrAddress = stgValid & laneValid_2 ? _GEN_1082 : _GEN_898; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_valid = stgValid & laneValid_2 ? _GEN_1086 : _GEN_902; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_isBr = stgValid & laneValid_2 ? _GEN_1090 : _GEN_906; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_isJal = stgValid & laneValid_2 ? _GEN_1094 : _GEN_910; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_isJalr = stgValid & laneValid_2 ? _GEN_1098 : _GEN_914; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_isCall = stgValid & laneValid_2 ? _GEN_1102 : _GEN_918; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_isRet = stgValid & laneValid_2 ? _GEN_1106 : _GEN_922; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdInfo_jumpTarget = stgValid & laneValid_2 ? _GEN_1110 : _GEN_926; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_ldst = stgValid & laneValid_2 ? _GEN_1114 : _GEN_930; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_lrs1 = stgValid & laneValid_2 ? _GEN_1118 : _GEN_934; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_lrs2 = stgValid & laneValid_2 ? _GEN_1122 : _GEN_938; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_pdst = stgValid & laneValid_2 ? _GEN_1126 : _GEN_942; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_prs1 = stgValid & laneValid_2 ? _GEN_1130 : _GEN_946; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_prs2 = stgValid & laneValid_2 ? _GEN_1134 : _GEN_950; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_oldPdst = stgValid & laneValid_2 ? _GEN_1138 : _GEN_954; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_rs1Valid = stgValid & laneValid_2 ? _GEN_1142 : _GEN_958; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_rs2Valid = stgValid & laneValid_2 ? _GEN_1146 : _GEN_962; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_rdValid = stgValid & laneValid_2 ? _GEN_1150 : _GEN_966; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_robIdx = stgValid & laneValid_2 ? _GEN_1154 : _GEN_970; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_robIdxFull = stgValid & laneValid_2 ? _GEN_1158 : _GEN_974; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_lqIdx = stgValid & laneValid_2 ? _GEN_1162 : _GEN_978; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_sqIdx = stgValid & laneValid_2 ? _GEN_1166 : _GEN_982; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_issueQueue = stgValid & laneValid_2 ? _GEN_1170 : _GEN_986; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_prs1Busy = stgValid & laneValid_2 ? _GEN_1174 : _GEN_990; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_0_bits_prs2Busy = stgValid & laneValid_2 ? _GEN_1178 : _GEN_994; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_valid = stgValid & laneValid_2 ? _GEN_999 : _GEN_815; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pc = stgValid & laneValid_2 ? _GEN_1003 : _GEN_819; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_inst = stgValid & laneValid_2 ? _GEN_1007 : _GEN_823; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_fuType = stgValid & laneValid_2 ? _GEN_1011 : _GEN_827; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_aluOp = stgValid & laneValid_2 ? _GEN_1015 : _GEN_831; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_bruOp = stgValid & laneValid_2 ? _GEN_1019 : _GEN_835; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_lsuOp = stgValid & laneValid_2 ? _GEN_1023 : _GEN_839; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_csrOp = stgValid & laneValid_2 ? _GEN_1027 : _GEN_843; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_mulDivOp = stgValid & laneValid_2 ? _GEN_1031 : _GEN_847; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_src1Type = stgValid & laneValid_2 ? _GEN_1035 : _GEN_851; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_src2Type = stgValid & laneValid_2 ? _GEN_1039 : _GEN_855; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_immType = stgValid & laneValid_2 ? _GEN_1043 : _GEN_859; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_rfWen = stgValid & laneValid_2 ? _GEN_1047 : _GEN_863; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_memRead = stgValid & laneValid_2 ? _GEN_1051 : _GEN_867; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_memWrite = stgValid & laneValid_2 ? _GEN_1055 : _GEN_871; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_csrWen = stgValid & laneValid_2 ? _GEN_1059 : _GEN_875; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_isBranch = stgValid & laneValid_2 ? _GEN_1063 : _GEN_879; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_isJump = stgValid & laneValid_2 ? _GEN_1067 : _GEN_883; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ctrl_isPriv = stgValid & laneValid_2 ? _GEN_1071 : _GEN_887; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_excpVec = stgValid & laneValid_2 ? _GEN_1075 : _GEN_891; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_imm = stgValid & laneValid_2 ? _GEN_1079 : _GEN_895; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_csrAddress = stgValid & laneValid_2 ? _GEN_1083 : _GEN_899; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_valid = stgValid & laneValid_2 ? _GEN_1087 : _GEN_903; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_isBr = stgValid & laneValid_2 ? _GEN_1091 : _GEN_907; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_isJal = stgValid & laneValid_2 ? _GEN_1095 : _GEN_911; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_isJalr = stgValid & laneValid_2 ? _GEN_1099 : _GEN_915; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_isCall = stgValid & laneValid_2 ? _GEN_1103 : _GEN_919; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_isRet = stgValid & laneValid_2 ? _GEN_1107 : _GEN_923; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdInfo_jumpTarget = stgValid & laneValid_2 ? _GEN_1111 : _GEN_927; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_ldst = stgValid & laneValid_2 ? _GEN_1115 : _GEN_931; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_lrs1 = stgValid & laneValid_2 ? _GEN_1119 : _GEN_935; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_lrs2 = stgValid & laneValid_2 ? _GEN_1123 : _GEN_939; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_pdst = stgValid & laneValid_2 ? _GEN_1127 : _GEN_943; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_prs1 = stgValid & laneValid_2 ? _GEN_1131 : _GEN_947; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_prs2 = stgValid & laneValid_2 ? _GEN_1135 : _GEN_951; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_oldPdst = stgValid & laneValid_2 ? _GEN_1139 : _GEN_955; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_rs1Valid = stgValid & laneValid_2 ? _GEN_1143 : _GEN_959; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_rs2Valid = stgValid & laneValid_2 ? _GEN_1147 : _GEN_963; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_rdValid = stgValid & laneValid_2 ? _GEN_1151 : _GEN_967; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_robIdx = stgValid & laneValid_2 ? _GEN_1155 : _GEN_971; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_robIdxFull = stgValid & laneValid_2 ? _GEN_1159 : _GEN_975; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_lqIdx = stgValid & laneValid_2 ? _GEN_1163 : _GEN_979; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_sqIdx = stgValid & laneValid_2 ? _GEN_1167 : _GEN_983; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_issueQueue = stgValid & laneValid_2 ? _GEN_1171 : _GEN_987; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_prs1Busy = stgValid & laneValid_2 ? _GEN_1175 : _GEN_991; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_1_bits_prs2Busy = stgValid & laneValid_2 ? _GEN_1179 : _GEN_995; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_valid = stgValid & laneValid_2 ? _GEN_1000 : _GEN_816; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pc = stgValid & laneValid_2 ? _GEN_1004 : _GEN_820; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_inst = stgValid & laneValid_2 ? _GEN_1008 : _GEN_824; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_fuType = stgValid & laneValid_2 ? _GEN_1012 : _GEN_828; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_aluOp = stgValid & laneValid_2 ? _GEN_1016 : _GEN_832; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_bruOp = stgValid & laneValid_2 ? _GEN_1020 : _GEN_836; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_lsuOp = stgValid & laneValid_2 ? _GEN_1024 : _GEN_840; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_csrOp = stgValid & laneValid_2 ? _GEN_1028 : _GEN_844; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_mulDivOp = stgValid & laneValid_2 ? _GEN_1032 : _GEN_848; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_src1Type = stgValid & laneValid_2 ? _GEN_1036 : _GEN_852; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_src2Type = stgValid & laneValid_2 ? _GEN_1040 : _GEN_856; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_immType = stgValid & laneValid_2 ? _GEN_1044 : _GEN_860; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_rfWen = stgValid & laneValid_2 ? _GEN_1048 : _GEN_864; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_memRead = stgValid & laneValid_2 ? _GEN_1052 : _GEN_868; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_memWrite = stgValid & laneValid_2 ? _GEN_1056 : _GEN_872; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_csrWen = stgValid & laneValid_2 ? _GEN_1060 : _GEN_876; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_isBranch = stgValid & laneValid_2 ? _GEN_1064 : _GEN_880; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_isJump = stgValid & laneValid_2 ? _GEN_1068 : _GEN_884; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ctrl_isPriv = stgValid & laneValid_2 ? _GEN_1072 : _GEN_888; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_excpVec = stgValid & laneValid_2 ? _GEN_1076 : _GEN_892; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_imm = stgValid & laneValid_2 ? _GEN_1080 : _GEN_896; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_csrAddress = stgValid & laneValid_2 ? _GEN_1084 : _GEN_900; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_valid = stgValid & laneValid_2 ? _GEN_1088 : _GEN_904; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_isBr = stgValid & laneValid_2 ? _GEN_1092 : _GEN_908; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_isJal = stgValid & laneValid_2 ? _GEN_1096 : _GEN_912; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_isJalr = stgValid & laneValid_2 ? _GEN_1100 : _GEN_916; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_isCall = stgValid & laneValid_2 ? _GEN_1104 : _GEN_920; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_isRet = stgValid & laneValid_2 ? _GEN_1108 : _GEN_924; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdInfo_jumpTarget = stgValid & laneValid_2 ? _GEN_1112 : _GEN_928; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_ldst = stgValid & laneValid_2 ? _GEN_1116 : _GEN_932; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_lrs1 = stgValid & laneValid_2 ? _GEN_1120 : _GEN_936; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_lrs2 = stgValid & laneValid_2 ? _GEN_1124 : _GEN_940; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_pdst = stgValid & laneValid_2 ? _GEN_1128 : _GEN_944; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_prs1 = stgValid & laneValid_2 ? _GEN_1132 : _GEN_948; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_prs2 = stgValid & laneValid_2 ? _GEN_1136 : _GEN_952; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_oldPdst = stgValid & laneValid_2 ? _GEN_1140 : _GEN_956; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_rs1Valid = stgValid & laneValid_2 ? _GEN_1144 : _GEN_960; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_rs2Valid = stgValid & laneValid_2 ? _GEN_1148 : _GEN_964; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_rdValid = stgValid & laneValid_2 ? _GEN_1152 : _GEN_968; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_robIdx = stgValid & laneValid_2 ? _GEN_1156 : _GEN_972; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_robIdxFull = stgValid & laneValid_2 ? _GEN_1160 : _GEN_976; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_lqIdx = stgValid & laneValid_2 ? _GEN_1164 : _GEN_980; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_sqIdx = stgValid & laneValid_2 ? _GEN_1168 : _GEN_984; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_issueQueue = stgValid & laneValid_2 ? _GEN_1172 : _GEN_988; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_prs1Busy = stgValid & laneValid_2 ? _GEN_1176 : _GEN_992; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_2_bits_prs2Busy = stgValid & laneValid_2 ? _GEN_1180 : _GEN_996; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_valid = stgValid & laneValid_2 ? _GEN_1001 : _GEN_817; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pc = stgValid & laneValid_2 ? _GEN_1005 : _GEN_821; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_inst = stgValid & laneValid_2 ? _GEN_1009 : _GEN_825; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_fuType = stgValid & laneValid_2 ? _GEN_1013 : _GEN_829; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_aluOp = stgValid & laneValid_2 ? _GEN_1017 : _GEN_833; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_bruOp = stgValid & laneValid_2 ? _GEN_1021 : _GEN_837; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_lsuOp = stgValid & laneValid_2 ? _GEN_1025 : _GEN_841; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_csrOp = stgValid & laneValid_2 ? _GEN_1029 : _GEN_845; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_mulDivOp = stgValid & laneValid_2 ? _GEN_1033 : _GEN_849; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_src1Type = stgValid & laneValid_2 ? _GEN_1037 : _GEN_853; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_src2Type = stgValid & laneValid_2 ? _GEN_1041 : _GEN_857; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_immType = stgValid & laneValid_2 ? _GEN_1045 : _GEN_861; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_rfWen = stgValid & laneValid_2 ? _GEN_1049 : _GEN_865; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_memRead = stgValid & laneValid_2 ? _GEN_1053 : _GEN_869; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_memWrite = stgValid & laneValid_2 ? _GEN_1057 : _GEN_873; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_csrWen = stgValid & laneValid_2 ? _GEN_1061 : _GEN_877; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_isBranch = stgValid & laneValid_2 ? _GEN_1065 : _GEN_881; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_isJump = stgValid & laneValid_2 ? _GEN_1069 : _GEN_885; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ctrl_isPriv = stgValid & laneValid_2 ? _GEN_1073 : _GEN_889; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_excpVec = stgValid & laneValid_2 ? _GEN_1077 : _GEN_893; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_imm = stgValid & laneValid_2 ? _GEN_1081 : _GEN_897; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_csrAddress = stgValid & laneValid_2 ? _GEN_1085 : _GEN_901; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_valid = stgValid & laneValid_2 ? _GEN_1089 : _GEN_905; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_isBr = stgValid & laneValid_2 ? _GEN_1093 : _GEN_909; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_isJal = stgValid & laneValid_2 ? _GEN_1097 : _GEN_913; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_isJalr = stgValid & laneValid_2 ? _GEN_1101 : _GEN_917; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_isCall = stgValid & laneValid_2 ? _GEN_1105 : _GEN_921; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_isRet = stgValid & laneValid_2 ? _GEN_1109 : _GEN_925; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdInfo_jumpTarget = stgValid & laneValid_2 ? _GEN_1113 : _GEN_929; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_ldst = stgValid & laneValid_2 ? _GEN_1117 : _GEN_933; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_lrs1 = stgValid & laneValid_2 ? _GEN_1121 : _GEN_937; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_lrs2 = stgValid & laneValid_2 ? _GEN_1125 : _GEN_941; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_pdst = stgValid & laneValid_2 ? _GEN_1129 : _GEN_945; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_prs1 = stgValid & laneValid_2 ? _GEN_1133 : _GEN_949; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_prs2 = stgValid & laneValid_2 ? _GEN_1137 : _GEN_953; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_oldPdst = stgValid & laneValid_2 ? _GEN_1141 : _GEN_957; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_rs1Valid = stgValid & laneValid_2 ? _GEN_1145 : _GEN_961; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_rs2Valid = stgValid & laneValid_2 ? _GEN_1149 : _GEN_965; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_rdValid = stgValid & laneValid_2 ? _GEN_1153 : _GEN_969; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_robIdx = stgValid & laneValid_2 ? _GEN_1157 : _GEN_973; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_robIdxFull = stgValid & laneValid_2 ? _GEN_1161 : _GEN_977; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_lqIdx = stgValid & laneValid_2 ? _GEN_1165 : _GEN_981; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_sqIdx = stgValid & laneValid_2 ? _GEN_1169 : _GEN_985; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_issueQueue = stgValid & laneValid_2 ? _GEN_1173 : _GEN_989; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_prs1Busy = stgValid & laneValid_2 ? _GEN_1177 : _GEN_993; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_out_3_bits_prs2Busy = stgValid & laneValid_2 ? _GEN_1181 : _GEN_997; // @[src/main/scala/backend/dispatch/DispatchStage.scala 180:50]
  assign io_robEnq_valid_0 = _busyTable_io_allocReq_0_valid_T & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 196:56]
  assign io_robEnq_valid_1 = _busyTable_io_allocReq_1_valid_T & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 196:56]
  assign io_robEnq_valid_2 = _busyTable_io_allocReq_2_valid_T & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 196:56]
  assign io_robEnq_valids_0 = laneValid_0 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 197:43]
  assign io_robEnq_valids_1 = laneValid_1 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 197:43]
  assign io_robEnq_valids_2 = laneValid_2 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 197:43]
  assign io_robEnq_bits_0_pc = stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:32]
  assign io_robEnq_bits_0_inst = stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:32]
  assign io_robEnq_bits_0_pdst = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:32]
  assign io_robEnq_bits_0_oldPdst = stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 201:32]
  assign io_robEnq_bits_0_ldst = stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 202:32]
  assign io_robEnq_bits_0_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 203:32]
  assign io_robEnq_bits_0_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 204:32]
  assign io_robEnq_bits_0_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 205:32]
  assign io_robEnq_bits_0_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 206:32]
  assign io_robEnq_bits_0_excpVec = stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 208:32]
  assign io_robEnq_bits_0_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 207:32]
  assign io_robEnq_bits_1_pc = stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:32]
  assign io_robEnq_bits_1_inst = stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:32]
  assign io_robEnq_bits_1_pdst = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:32]
  assign io_robEnq_bits_1_oldPdst = stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 201:32]
  assign io_robEnq_bits_1_ldst = stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 202:32]
  assign io_robEnq_bits_1_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 203:32]
  assign io_robEnq_bits_1_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 204:32]
  assign io_robEnq_bits_1_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 205:32]
  assign io_robEnq_bits_1_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 206:32]
  assign io_robEnq_bits_1_excpVec = stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 208:32]
  assign io_robEnq_bits_1_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 207:32]
  assign io_robEnq_bits_2_pc = stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:32]
  assign io_robEnq_bits_2_inst = stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:32]
  assign io_robEnq_bits_2_pdst = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:32]
  assign io_robEnq_bits_2_oldPdst = stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 201:32]
  assign io_robEnq_bits_2_ldst = stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 202:32]
  assign io_robEnq_bits_2_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 203:32]
  assign io_robEnq_bits_2_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 204:32]
  assign io_robEnq_bits_2_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 205:32]
  assign io_robEnq_bits_2_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 206:32]
  assign io_robEnq_bits_2_excpVec = stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 208:32]
  assign io_robEnq_bits_2_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 207:32]
  assign busyTable_clock = clock;
  assign busyTable_reset = reset;
  assign busyTable_io_readReq_0 = stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:37]
  assign busyTable_io_readReq_1 = stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 92:37]
  assign busyTable_io_readReq_2 = stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:37]
  assign busyTable_io_readReq_3 = stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 92:37]
  assign busyTable_io_readReq_4 = stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:37]
  assign busyTable_io_readReq_5 = stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 92:37]
  assign busyTable_io_allocReq_0_valid = outFire & laneValid_0 & stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:63]
  assign busyTable_io_allocReq_0_bits = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 98:36]
  assign busyTable_io_allocReq_1_valid = outFire & laneValid_1 & stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:63]
  assign busyTable_io_allocReq_1_bits = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 98:36]
  assign busyTable_io_allocReq_2_valid = outFire & laneValid_2 & stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:63]
  assign busyTable_io_allocReq_2_bits = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 98:36]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      stgValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:14]
    end else begin
      stgValid <= _GEN_16;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:54]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 65:20]
    end else if (outFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:23]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 70:54]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:54]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 65:20]
    end else if (outFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:23]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 70:54]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:54]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 65:20]
    end else if (outFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:23]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 70:54]
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_mulDivOp <= io_in_0_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_excpVec <= io_in_0_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_ldst <= io_in_0_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_lrs1 <= io_in_0_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_lrs2 <= io_in_0_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_pdst <= io_in_0_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_prs1 <= io_in_0_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_prs2 <= io_in_0_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_oldPdst <= io_in_0_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_0_robIdx <= io_in_0_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_mulDivOp <= io_in_1_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_excpVec <= io_in_1_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_ldst <= io_in_1_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_lrs1 <= io_in_1_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_lrs2 <= io_in_1_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_pdst <= io_in_1_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_prs1 <= io_in_1_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_prs2 <= io_in_1_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_oldPdst <= io_in_1_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_1_robIdx <= io_in_1_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_mulDivOp <= io_in_2_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_excpVec <= io_in_2_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_ldst <= io_in_2_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_lrs1 <= io_in_2_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_lrs2 <= io_in_2_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_pdst <= io_in_2_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_prs1 <= io_in_2_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_prs2 <= io_in_2_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_oldPdst <= io_in_2_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:22]
        stgData_2_robIdx <= io_in_2_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:26]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 120:39]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 121:15]
    end else if (outFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:17]
      lqHeadPtr <= _lqHeadPtr_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 117:15]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:26]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 120:39]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 122:15]
    end else if (outFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:17]
      sqHeadPtr <= _sqHeadPtr_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 118:15]
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
  stgValid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  laneValid_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  laneValid_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  laneValid_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stgData_0_pc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stgData_0_inst = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_ctrl_mulDivOp = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_excpVec = _RAND_22[9:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_imm = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_24[13:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_ldst = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_lrs1 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_lrs2 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_pdst = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_prs1 = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_prs2 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_oldPdst = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_robIdx = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_1_pc = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_1_inst = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_1_ctrl_mulDivOp = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_excpVec = _RAND_61[9:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_imm = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_63[13:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_ldst = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_lrs1 = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_lrs2 = _RAND_73[4:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_pdst = _RAND_74[5:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_prs1 = _RAND_75[5:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_prs2 = _RAND_76[5:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_oldPdst = _RAND_77[5:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_robIdx = _RAND_81[5:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_2_pc = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_2_inst = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_2_ctrl_mulDivOp = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_2_excpVec = _RAND_100[9:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_2_imm = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_102[13:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_ldst = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_lrs1 = _RAND_111[4:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_lrs2 = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_pdst = _RAND_113[5:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_prs1 = _RAND_114[5:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_2_prs2 = _RAND_115[5:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_2_oldPdst = _RAND_116[5:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_2_robIdx = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  lqHeadPtr = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  sqHeadPtr = _RAND_122[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
