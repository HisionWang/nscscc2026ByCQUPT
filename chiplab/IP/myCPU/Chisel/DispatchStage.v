module DispatchStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [9:0]  io_in_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [5:0]  io_in_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_in_1_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_1_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_1_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [9:0]  io_in_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [5:0]  io_in_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_in_2_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_2_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_2_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [9:0]  io_in_2_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_2_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_2_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [4:0]  io_in_2_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_2_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_2_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [6:0]  io_in_2_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input  [5:0]  io_in_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q1IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q1IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q1IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_q1IQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q1IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [13:0] io_q1IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q1IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q1IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q1IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q1IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q1IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q1IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q1IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q1IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q2IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q2IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q2IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_q2IQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q2IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [13:0] io_q2IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q2IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q2IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q2IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q2IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q2IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q2IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q2IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q2IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q2IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q3IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q3IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q3IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_q3IQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q3IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [13:0] io_q3IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q3IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q3IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q3IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q3IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q3IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q3IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q3IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q3IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q3IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q4IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q4IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q4IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_q4IQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q4IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [13:0] io_q4IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q4IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q4IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q4IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q4IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q4IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q4IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q4IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q4IQEnq_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q4IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q4IQEnq_0_bits_isSta, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q5IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q5IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q5IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_q5IQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [13:0] io_q5IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_q5IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q5IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q5IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q5IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q5IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_q5IQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_q5IQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_q5IQEnq_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [2:0]  io_q5IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_q5IQEnq_0_bits_isStd, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_lsEnq_req_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_0_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_0_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_0_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_lsEnq_req_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_1_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_1_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_1_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_1_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [5:0]  io_lsEnq_req_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_2_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_lsEnq_req_2_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_2_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_lsEnq_req_2_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valid_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valid_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valid_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valids_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valids_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_valids_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_0_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_0_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_0_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_0_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_robEnq_bits_0_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_0_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_0_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_0_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_0_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_robEnq_bits_0_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_robEnq_bits_0_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_1_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_1_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_1_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_1_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_robEnq_bits_1_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_1_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_1_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_1_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_1_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_robEnq_bits_1_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_robEnq_bits_1_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_2_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [31:0] io_robEnq_bits_2_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_2_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [6:0]  io_robEnq_bits_2_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [4:0]  io_robEnq_bits_2_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_2_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_2_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_2_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output        io_robEnq_bits_2_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [9:0]  io_robEnq_bits_2_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  output [3:0]  io_robEnq_bits_2_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_robEnq_canEnq, // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
  input         io_redirect_valid // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  busyTable_clock; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_reset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_readReq_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_allocReq_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_allocReq_0_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_allocReq_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_allocReq_1_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire  busyTable_io_allocReq_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  wire [6:0] busyTable_io_allocReq_2_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
  reg  laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
  reg  laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
  reg  laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
  reg  robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
  reg  robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
  reg  robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
  reg  lsqWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
  reg  lsqWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
  reg  lsqWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
  reg  iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
  reg  iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
  reg  iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_0_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_0_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [9:0] stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [5:0] stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_1_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_1_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [9:0] stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_1_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_1_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [5:0] stgData_1_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_2_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_2_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [9:0] stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_2_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [4:0] stgData_2_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [6:0] stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [5:0] stgData_2_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 40:24]
  reg [3:0] stgLqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:24]
  reg [3:0] stgLqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:24]
  reg [3:0] stgLqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:24]
  reg [3:0] stgSqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 42:24]
  reg [3:0] stgSqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 42:24]
  reg [3:0] stgSqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 42:24]
  wire  needRob_0 = laneValid_0 & ~robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  wire  needRob_1 = laneValid_1 & ~robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  wire  needRob_2 = laneValid_2 & ~robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  wire  _isMemLane_T = stgData_0_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:44]
  wire  isMemLane_0 = laneValid_0 & stgData_0_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:18]
  wire  _isMemLane_T_2 = stgData_1_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:44]
  wire  isMemLane_1 = laneValid_1 & stgData_1_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:18]
  wire  _isMemLane_T_4 = stgData_2_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:44]
  wire  isMemLane_2 = laneValid_2 & stgData_2_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 53:18]
  wire  needLsq_0 = laneValid_0 & ~lsqWritten_0 & isMemLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 55:36]
  wire  needLsq_1 = laneValid_1 & ~lsqWritten_1 & isMemLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 55:36]
  wire  needLsq_2 = laneValid_2 & ~lsqWritten_2 & isMemLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 55:36]
  wire  needIq_0 = laneValid_0 & ~iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:18]
  wire  needIq_1 = laneValid_1 & ~iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:18]
  wire  needIq_2 = laneValid_2 & ~iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 59:18]
  wire [2:0] _stgValid_T = {needIq_2,needIq_1,needIq_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:25]
  wire  stgValid = |_stgValid_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 68:32]
  wire  isAluLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:15]
  wire  isAluLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:15]
  wire  isAluLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:15]
  wire  isCsrLane_0 = needIq_0 & (stgData_0_ctrl_fuType == 4'h4 | stgData_0_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 82:15]
  wire  isCsrLane_1 = needIq_1 & (stgData_1_ctrl_fuType == 4'h4 | stgData_1_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 82:15]
  wire  isCsrLane_2 = needIq_2 & (stgData_2_ctrl_fuType == 4'h4 | stgData_2_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 82:15]
  wire  isDivLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:15]
  wire  isDivLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:15]
  wire  isDivLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:15]
  wire  isMulLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:15]
  wire  isMulLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:15]
  wire  isMulLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:15]
  wire  isJmpLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:15]
  wire  isJmpLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:15]
  wire  isJmpLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 91:15]
  wire  _isLoadLane_T_1 = needIq_0 & _isMemLane_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:15]
  wire  isLoadLane_0 = needIq_0 & _isMemLane_T & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:56]
  wire  _isLoadLane_T_4 = needIq_1 & _isMemLane_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:15]
  wire  isLoadLane_1 = needIq_1 & _isMemLane_T_2 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:56]
  wire  _isLoadLane_T_7 = needIq_2 & _isMemLane_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:15]
  wire  isLoadLane_2 = needIq_2 & _isMemLane_T_4 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:56]
  wire  isStoreLane_0 = _isLoadLane_T_1 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:56]
  wire  isStoreLane_1 = _isLoadLane_T_4 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:56]
  wire  isStoreLane_2 = _isLoadLane_T_7 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 97:56]
  wire [1:0] _csrToQ1_T_4 = {{1'd0}, isCsrLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  csrToQ1_1 = isCsrLane_1 & _csrToQ1_T_4[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _csrToQ1_T_6 = isCsrLane_1 & csrToQ1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _csrToQ1_T_8 = _csrToQ1_T_4[0] + _csrToQ1_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  csrToQ1_2 = isCsrLane_2 & _csrToQ1_T_8 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire [1:0] _divToQ2_T_4 = {{1'd0}, isDivLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  divToQ2_1 = isDivLane_1 & _divToQ2_T_4[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _divToQ2_T_6 = isDivLane_1 & divToQ2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _divToQ2_T_8 = _divToQ2_T_4[0] + _divToQ2_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  divToQ2_2 = isDivLane_2 & _divToQ2_T_8 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  isMulOrJmpLane_0 = isMulLane_0 | isJmpLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:19]
  wire  isMulOrJmpLane_1 = isMulLane_1 | isJmpLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:19]
  wire  isMulOrJmpLane_2 = isMulLane_2 | isJmpLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:19]
  wire [1:0] _mulJmpToQ3_T_1 = {{1'd0}, isMulOrJmpLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  mulJmpToQ3_1 = isMulOrJmpLane_1 & _mulJmpToQ3_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _mulJmpToQ3_T_3 = isMulOrJmpLane_1 & mulJmpToQ3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _mulJmpToQ3_T_5 = _mulJmpToQ3_T_1[0] + _mulJmpToQ3_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  mulJmpToQ3_2 = isMulOrJmpLane_2 & _mulJmpToQ3_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire [2:0] _consumedMask_T = {csrToQ1_2,csrToQ1_1,isCsrLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:30]
  wire [2:0] _consumedMask_T_1 = {divToQ2_2,divToQ2_1,isDivLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:47]
  wire [2:0] _consumedMask_T_2 = _consumedMask_T | _consumedMask_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:37]
  wire [2:0] _consumedMask_T_3 = {mulJmpToQ3_2,mulJmpToQ3_1,isMulOrJmpLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:67]
  wire [2:0] consumedMask = _consumedMask_T_2 | _consumedMask_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:54]
  wire  q1FreeAfterExclusive = ~(|_consumedMask_T); // @[src/main/scala/backend/dispatch/DispatchStage.scala 145:30]
  wire  q2FreeAfterExclusive = ~(|_consumedMask_T_1); // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:30]
  wire  q3FreeAfterExclusive = ~(|_consumedMask_T_3); // @[src/main/scala/backend/dispatch/DispatchStage.scala 147:30]
  wire [4:0] q1AluPriority = q1FreeAfterExclusive ? 5'h3 : 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:24]
  wire [4:0] q2AluPriority = q2FreeAfterExclusive ? 5'h1 : 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:24]
  wire [4:0] q3AluPriority = q3FreeAfterExclusive ? 5'h2 : 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 170:24]
  wire  rank0OH_0 = q1AluPriority >= q2AluPriority & q1AluPriority >= q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 177:48]
  wire  _rank0OH_1_T = ~rank0OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 178:15]
  wire  rank0OH_1 = ~rank0OH_0 & q2AluPriority >= q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 178:27]
  wire  _rank0OH_2_T_1 = ~rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 179:30]
  wire  rank0OH_2 = _rank0OH_1_T & ~rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 179:27]
  wire [4:0] exclRank0_0 = rank0OH_0 ? 5'h0 : q1AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:22]
  wire [4:0] exclRank0_1 = rank0OH_1 ? 5'h0 : q2AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:22]
  wire [4:0] exclRank0_2 = rank0OH_2 ? 5'h0 : q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:22]
  wire  rank1OH_0 = _rank0OH_1_T & exclRank0_0 >= exclRank0_1 & exclRank0_0 >= exclRank0_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:61]
  wire  _rank1OH_1_T_1 = ~rank1OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 187:30]
  wire  rank1OH_1 = _rank0OH_2_T_1 & ~rank1OH_0 & exclRank0_1 >= exclRank0_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 187:42]
  wire  _rank1OH_2_T = ~rank0OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 188:15]
  wire  _rank1OH_2_T_3 = ~rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 188:45]
  wire  rank1OH_2 = ~rank0OH_2 & _rank1OH_1_T_1 & ~rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 188:42]
  wire  rank2OH_0 = _rank0OH_1_T & _rank1OH_1_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 192:27]
  wire  rank2OH_1 = _rank0OH_2_T_1 & _rank1OH_2_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 193:27]
  wire  rank2OH_2 = _rank1OH_2_T & ~rank1OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 194:27]
  wire  _rank0HasCap_T = rank0OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 202:22]
  wire  rank0HasCap = rank0OH_0 ? q1FreeAfterExclusive : _rank0HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 201:22]
  wire  _rank1HasCap_T = rank1OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 205:22]
  wire  rank1HasCap = rank1OH_0 ? q1FreeAfterExclusive : _rank1HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 204:22]
  wire  _rank2HasCap_T = rank2OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 208:22]
  wire  rank2HasCap = rank2OH_0 ? q1FreeAfterExclusive : _rank2HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 207:22]
  wire  aluCandR1_0 = isAluLane_0 & ~consumedMask[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 214:16]
  wire  aluCandR1_1 = isAluLane_1 & ~consumedMask[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 214:16]
  wire  aluCandR1_2 = isAluLane_2 & ~consumedMask[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 214:16]
  wire [1:0] _aluRound1_T_1 = {{1'd0}, aluCandR1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound1_1 = aluCandR1_1 & _aluRound1_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _aluRound1_T_3 = aluCandR1_1 & aluRound1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _aluRound1_T_5 = _aluRound1_T_1[0] + _aluRound1_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound1_2 = aluCandR1_2 & _aluRound1_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire [2:0] _aluRound1Valid_T = {aluRound1_2,aluRound1_1,aluCandR1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 216:32]
  wire  aluRound1Valid = |_aluRound1Valid_T & rank0HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 216:43]
  wire  aluRound1ToQ1 = aluRound1Valid & rank0OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 217:36]
  wire  aluRound1ToQ2 = aluRound1Valid & rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 218:36]
  wire  aluRound1ToQ3 = aluRound1Valid & rank0OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 219:36]
  wire [2:0] _T_1 = aluRound1Valid ? _aluRound1Valid_T : 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 221:34]
  wire [2:0] _T_2 = consumedMask | _T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 221:29]
  wire  aluCandR2_0 = isAluLane_0 & ~_T_2[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 225:16]
  wire  aluCandR2_1 = isAluLane_1 & ~_T_2[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 225:16]
  wire  aluCandR2_2 = isAluLane_2 & ~_T_2[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 225:16]
  wire [1:0] _aluRound2_T_1 = {{1'd0}, aluCandR2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound2_1 = aluCandR2_1 & _aluRound2_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _aluRound2_T_3 = aluCandR2_1 & aluRound2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _aluRound2_T_5 = _aluRound2_T_1[0] + _aluRound2_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound2_2 = aluCandR2_2 & _aluRound2_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire [2:0] _aluRound2Valid_T = {aluRound2_2,aluRound2_1,aluCandR2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 227:32]
  wire  aluRound2Valid = |_aluRound2Valid_T & rank1HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 227:43]
  wire  aluRound2ToQ1 = aluRound2Valid & rank1OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 228:36]
  wire  aluRound2ToQ2 = aluRound2Valid & rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 229:36]
  wire  aluRound2ToQ3 = aluRound2Valid & rank1OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 230:36]
  wire [2:0] _T_4 = aluRound2Valid ? _aluRound2Valid_T : 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 232:34]
  wire [2:0] _T_5 = _T_2 | _T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 232:29]
  wire  aluCandR3_0 = isAluLane_0 & ~_T_5[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 236:16]
  wire  aluCandR3_1 = isAluLane_1 & ~_T_5[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 236:16]
  wire  aluCandR3_2 = isAluLane_2 & ~_T_5[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 236:16]
  wire [1:0] _aluRound3_T_1 = {{1'd0}, aluCandR3_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound3_1 = aluCandR3_1 & _aluRound3_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _aluRound3_T_3 = aluCandR3_1 & aluRound3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _aluRound3_T_5 = _aluRound3_T_1[0] + _aluRound3_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  aluRound3_2 = aluCandR3_2 & _aluRound3_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire [2:0] _aluRound3Valid_T = {aluRound3_2,aluRound3_1,aluCandR3_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 238:32]
  wire  aluRound3Valid = |_aluRound3Valid_T & rank2HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 238:43]
  wire  aluRound3ToQ1 = aluRound3Valid & rank2OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:36]
  wire  aluRound3ToQ2 = aluRound3Valid & rank2OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 240:36]
  wire  aluRound3ToQ3 = aluRound3Valid & rank2OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 241:36]
  wire  aluToQ1_0 = aluCandR1_0 & aluRound1ToQ1 | aluCandR2_0 & aluRound2ToQ1 | aluCandR3_0 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 248:70]
  wire  aluToQ1_1 = aluRound1_1 & aluRound1ToQ1 | aluRound2_1 & aluRound2ToQ1 | aluRound3_1 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 248:70]
  wire  aluToQ1_2 = aluRound1_2 & aluRound1ToQ1 | aluRound2_2 & aluRound2ToQ1 | aluRound3_2 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 248:70]
  wire  aluToQ2_0 = aluCandR1_0 & aluRound1ToQ2 | aluCandR2_0 & aluRound2ToQ2 | aluCandR3_0 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:70]
  wire  aluToQ2_1 = aluRound1_1 & aluRound1ToQ2 | aluRound2_1 & aluRound2ToQ2 | aluRound3_1 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:70]
  wire  aluToQ2_2 = aluRound1_2 & aluRound1ToQ2 | aluRound2_2 & aluRound2ToQ2 | aluRound3_2 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:70]
  wire  aluToQ3_0 = aluCandR1_0 & aluRound1ToQ3 | aluCandR2_0 & aluRound2ToQ3 | aluCandR3_0 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:70]
  wire  aluToQ3_1 = aluRound1_1 & aluRound1ToQ3 | aluRound2_1 & aluRound2ToQ3 | aluRound3_1 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:70]
  wire  aluToQ3_2 = aluRound1_2 & aluRound1ToQ3 | aluRound2_2 & aluRound2ToQ3 | aluRound3_2 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:70]
  wire  q1Final_0 = isCsrLane_0 | aluToQ1_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:68]
  wire  q1Final_1 = csrToQ1_1 | aluToQ1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:68]
  wire  q1Final_2 = csrToQ1_2 | aluToQ1_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:68]
  wire  q2Final_0 = isDivLane_0 | aluToQ2_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:68]
  wire  q2Final_1 = divToQ2_1 | aluToQ2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:68]
  wire  q2Final_2 = divToQ2_2 | aluToQ2_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:68]
  wire  q3Final_0 = isMulOrJmpLane_0 | aluToQ3_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 256:71]
  wire  q3Final_1 = mulJmpToQ3_1 | aluToQ3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 256:71]
  wire  q3Final_2 = mulJmpToQ3_2 | aluToQ3_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 256:71]
  wire  q4Cand_0 = isLoadLane_0 | isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 266:20]
  wire  _q4Cand_T_1 = q4Cand_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 266:20]
  wire  q4Cand_1 = isLoadLane_1 | isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 266:20]
  wire  q4Cand_2 = isLoadLane_2 | isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 266:20]
  wire  q4Selected_0 = q4Cand_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 266:20]
  wire  _q4Selected_T = q4Cand_0 & _q4Cand_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire [1:0] _q4Selected_T_1 = {{1'd0}, _q4Selected_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  q4Selected_1 = q4Cand_1 & _q4Selected_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _q4Selected_T_3 = q4Cand_1 & q4Selected_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:35]
  wire  _q4Selected_T_5 = _q4Selected_T_1[0] + _q4Selected_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:21]
  wire  q4Selected_2 = q4Cand_2 & _q4Selected_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 115:31]
  wire  _q5Selected_T = _q4Cand_T_1 & isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  _q5Selected_T_1 = q4Selected_1 & isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  _q5Selected_T_2 = q4Selected_2 & isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  q5Selected_0 = _q4Cand_T_1 & isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  iqDispatchMask_0 = q1Final_0 | q2Final_0 | q3Final_0 | _q4Cand_T_1 | q5Selected_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 282:61]
  wire  q5Selected_1 = q4Selected_1 & isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  iqDispatchMask_1 = q1Final_1 | q2Final_1 | q3Final_1 | q4Selected_1 | q5Selected_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 282:61]
  wire  q5Selected_2 = q4Selected_2 & isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 274:19]
  wire  iqDispatchMask_2 = q1Final_2 | q2Final_2 | q3Final_2 | q4Selected_2 | q5Selected_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 282:61]
  wire [2:0] _laneTargetQ_0_T = q5Selected_0 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _laneTargetQ_1_T = q5Selected_1 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _laneTargetQ_2_T = q5Selected_2 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _q1WillSend_T = {q1Final_2,q1Final_1,q1Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:28]
  wire  q1WillSend = |_q1WillSend_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:35]
  wire [2:0] _q2WillSend_T = {q2Final_2,q2Final_1,q2Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 305:28]
  wire  q2WillSend = |_q2WillSend_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 305:35]
  wire [2:0] _q3WillSend_T = {q3Final_2,q3Final_1,q3Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 306:28]
  wire  q3WillSend = |_q3WillSend_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 306:35]
  wire [2:0] _q4WillSend_T = {q4Selected_2,q4Selected_1,_q4Cand_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 307:31]
  wire  q4WillSend = |_q4WillSend_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 307:38]
  wire [2:0] _q5WillSend_T = {q5Selected_2,q5Selected_1,q5Selected_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 308:31]
  wire  q5WillSend = |_q5WillSend_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 308:38]
  wire  iqReady = 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 313:61]
  wire [2:0] _anyNeedRob_T = {needRob_2,needRob_1,needRob_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 319:28]
  wire  anyNeedRob = |_anyNeedRob_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 319:35]
  wire  _robBatchReady_T = ~anyNeedRob; // @[src/main/scala/backend/dispatch/DispatchStage.scala 320:23]
  wire  robBatchReady = ~anyNeedRob | io_robEnq_canEnq; // @[src/main/scala/backend/dispatch/DispatchStage.scala 320:35]
  wire [2:0] _anyNeedLsq_T = {needLsq_2,needLsq_1,needLsq_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 323:28]
  wire  anyNeedLsq = |_anyNeedLsq_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 323:35]
  wire  _needLsqLoadCount_T = needLsq_0 & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 325:16]
  wire  _needLsqLoadCount_T_1 = needLsq_1 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 325:16]
  wire  _needLsqLoadCount_T_2 = needLsq_2 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 325:16]
  wire [1:0] _needLsqLoadCount_T_3 = _needLsqLoadCount_T_1 + _needLsqLoadCount_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 324:35]
  wire [1:0] _GEN_555 = {{1'd0}, _needLsqLoadCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 324:35]
  wire [2:0] _needLsqLoadCount_T_5 = _GEN_555 + _needLsqLoadCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 324:35]
  wire [1:0] needLsqLoadCount = _needLsqLoadCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 324:35]
  wire  _needLsqStoreCount_T = needLsq_0 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 327:16]
  wire  _needLsqStoreCount_T_1 = needLsq_1 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 327:16]
  wire  _needLsqStoreCount_T_2 = needLsq_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 327:16]
  wire [1:0] _needLsqStoreCount_T_3 = _needLsqStoreCount_T_1 + _needLsqStoreCount_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 326:35]
  wire [1:0] _GEN_556 = {{1'd0}, _needLsqStoreCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 326:35]
  wire [2:0] _needLsqStoreCount_T_5 = _GEN_556 + _needLsqStoreCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 326:35]
  wire [1:0] needLsqStoreCount = _needLsqStoreCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 326:35]
  wire  _hasIqDispatch_T = iqDispatchMask_0 & needIq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:73]
  wire  _hasIqDispatch_T_1 = iqDispatchMask_1 & needIq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:73]
  wire  _hasIqDispatch_T_2 = iqDispatchMask_2 & needIq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:73]
  wire  hasIqDispatch = iqDispatchMask_0 & needIq_0 | iqDispatchMask_1 & needIq_1 | iqDispatchMask_2 & needIq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:89]
  wire  dispatchFire = stgValid & hasIqDispatch & (robBatchReady | _robBatchReady_T); // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:48]
  wire  AllWillFire = (needIq_0 & iqDispatchMask_0 | ~needIq_0) & (needIq_1 & iqDispatchMask_1 | ~needIq_1) & (needIq_2
     & iqDispatchMask_2 | ~needIq_2); // @[src/main/scala/backend/dispatch/DispatchStage.scala 337:123]
  wire  canAcceptNew = ~stgValid | dispatchFire & AllWillFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:32]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 345:45]
  wire  inFire = inValid & canAcceptNew; // @[src/main/scala/backend/dispatch/DispatchStage.scala 346:25]
  wire  _GEN_0 = needRob_0 | robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 373:24 37:28 373:40]
  wire  _GEN_1 = needLsq_0 | lsqWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 374:{24,40} 38:28]
  wire  _GEN_2 = _hasIqDispatch_T | iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 375:{44,56} 39:28]
  wire  _GEN_3 = needRob_1 | robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 373:24 37:28 373:40]
  wire  _GEN_4 = needLsq_1 | lsqWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 374:{24,40} 38:28]
  wire  _GEN_5 = _hasIqDispatch_T_1 | iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 375:{44,56} 39:28]
  wire  _GEN_6 = needRob_2 | robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 373:24 37:28 373:40]
  wire  _GEN_7 = needLsq_2 | lsqWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 374:{24,40} 38:28]
  wire  _GEN_8 = _hasIqDispatch_T_2 | iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 375:{44,56} 39:28]
  wire [3:0] _GEN_62 = inFire ? 4'h0 : stgLqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 368:21 41:24]
  wire [3:0] _GEN_63 = inFire ? 4'h0 : stgSqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 369:21 42:24]
  wire [3:0] _GEN_108 = inFire ? 4'h0 : stgLqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 368:21 41:24]
  wire [3:0] _GEN_109 = inFire ? 4'h0 : stgSqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 369:21 42:24]
  wire [3:0] _GEN_154 = inFire ? 4'h0 : stgLqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 368:21 41:24]
  wire [3:0] _GEN_155 = inFire ? 4'h0 : stgSqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22 369:21 42:24]
  wire [3:0] _GEN_208 = io_redirect_valid ? stgLqIdx_0 : _GEN_62; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 41:24]
  wire [3:0] _GEN_209 = io_redirect_valid ? stgSqIdx_0 : _GEN_63; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 42:24]
  wire [3:0] _GEN_250 = io_redirect_valid ? stgLqIdx_1 : _GEN_108; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 41:24]
  wire [3:0] _GEN_251 = io_redirect_valid ? stgSqIdx_1 : _GEN_109; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 42:24]
  wire [3:0] _GEN_292 = io_redirect_valid ? stgLqIdx_2 : _GEN_154; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 41:24]
  wire [3:0] _GEN_293 = io_redirect_valid ? stgSqIdx_2 : _GEN_155; // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39 42:24]
  reg [3:0] lqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 382:26]
  reg [3:0] sqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 383:26]
  wire [3:0] _GEN_557 = {{2'd0}, needLsqLoadCount}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 386:28]
  wire [3:0] _lqHeadPtr_T_1 = lqHeadPtr + _GEN_557; // @[src/main/scala/backend/dispatch/DispatchStage.scala 386:28]
  wire [3:0] _GEN_558 = {{2'd0}, needLsqStoreCount}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 387:28]
  wire [3:0] _sqHeadPtr_T_1 = sqHeadPtr + _GEN_558; // @[src/main/scala/backend/dispatch/DispatchStage.scala 387:28]
  wire [4:0] _lqIndices_0_T = {{1'd0}, lqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  wire [3:0] lqIndices_0 = _lqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  wire [4:0] _sqIndices_0_T = {{1'd0}, sqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  wire [3:0] sqIndices_0 = _sqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  wire [3:0] _GEN_559 = {{3'd0}, _needLsqLoadCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:25]
  wire [4:0] _T_16 = {{1'd0}, _GEN_559}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:25]
  wire [3:0] _GEN_560 = {{3'd0}, _needLsqStoreCount_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 402:25]
  wire [4:0] _T_19 = {{1'd0}, _GEN_560}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 402:25]
  wire [3:0] lqIndices_1 = lqHeadPtr + _T_16[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  wire [3:0] sqIndices_1 = sqHeadPtr + _T_19[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  wire [3:0] _GEN_561 = {{3'd0}, _needLsqLoadCount_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:25]
  wire [3:0] _T_23 = _T_16[3:0] + _GEN_561; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:25]
  wire [3:0] _GEN_562 = {{3'd0}, _needLsqStoreCount_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 402:25]
  wire [3:0] _T_26 = _T_19[3:0] + _GEN_562; // @[src/main/scala/backend/dispatch/DispatchStage.scala 402:25]
  wire [3:0] lqIndices_2 = lqHeadPtr + _T_23; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  wire [3:0] sqIndices_2 = sqHeadPtr + _T_26; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  wire [3:0] effLqIdx_0 = needLsq_0 ? lqIndices_0 : stgLqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:23]
  wire [3:0] effSqIdx_0 = needLsq_0 ? sqIndices_0 : stgSqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:23]
  wire [3:0] effLqIdx_1 = needLsq_1 ? lqIndices_1 : stgLqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:23]
  wire [3:0] effSqIdx_1 = needLsq_1 ? sqIndices_1 : stgSqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:23]
  wire [3:0] effLqIdx_2 = needLsq_2 ? lqIndices_2 : stgLqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:23]
  wire [3:0] effSqIdx_2 = needLsq_2 ? sqIndices_2 : stgSqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:23]
  wire  _busyTable_io_allocReq_0_valid_T_1 = dispatchFire & needRob_0 & stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 429:66]
  wire  _busyTable_io_allocReq_1_valid_T_1 = dispatchFire & needRob_1 & stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 429:66]
  wire  _busyTable_io_allocReq_2_valid_T_1 = dispatchFire & needRob_2 & stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 429:66]
  wire [6:0] q1Uops_u_u_robIdxFull = {1'h0,stgData_0_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 464:24]
  wire  prs1BusyRaw_0 = busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 438:{28,28}]
  wire  q1Uops_u_u_prs1Busy = stgData_0_rs1Valid & stgData_0_lrs1 != 5'h0 & prs1BusyRaw_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 468:24]
  wire  prs2BusyRaw_0 = busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 439:{28,28}]
  wire  q1Uops_u_u_prs2Busy = stgData_0_rs2Valid & stgData_0_lrs2 != 5'h0 & prs2BusyRaw_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 470:24]
  wire [6:0] q1Uops_u_u_1_robIdxFull = {1'h0,stgData_1_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 464:24]
  wire  prs1BusyRaw_1 = busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 438:{28,28}]
  wire  q1Uops_u_u_1_prs1Busy = stgData_1_rs1Valid & stgData_1_lrs1 != 5'h0 & prs1BusyRaw_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 468:24]
  wire  prs2BusyRaw_1 = busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 439:{28,28}]
  wire  q1Uops_u_u_1_prs2Busy = stgData_1_rs2Valid & stgData_1_lrs2 != 5'h0 & prs2BusyRaw_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 470:24]
  wire [6:0] q1Uops_u_u_2_robIdxFull = {1'h0,stgData_2_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 464:24]
  wire  prs1BusyRaw_2 = busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 438:{28,28}]
  wire  q1Uops_u_u_2_prs1Busy = stgData_2_rs1Valid & stgData_2_lrs1 != 5'h0 & prs1BusyRaw_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 468:24]
  wire  prs2BusyRaw_2 = busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 439:{28,28}]
  wire  q1Uops_u_u_2_prs2Busy = stgData_2_rs2Valid & stgData_2_lrs2 != 5'h0 & prs2BusyRaw_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 470:24]
  wire [6:0] _io_q1IQEnq_0_bits_T_35 = q1Final_0 ? q1Uops_u_u_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_36 = q1Final_1 ? q1Uops_u_u_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_37 = q1Final_2 ? q1Uops_u_u_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_38 = _io_q1IQEnq_0_bits_T_35 | _io_q1IQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_40 = q1Final_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_41 = q1Final_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_42 = q1Final_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_43 = _io_q1IQEnq_0_bits_T_40 | _io_q1IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_60 = q1Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_61 = q1Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_62 = q1Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_63 = _io_q1IQEnq_0_bits_T_60 | _io_q1IQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_65 = q1Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_66 = q1Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_67 = q1Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_68 = _io_q1IQEnq_0_bits_T_65 | _io_q1IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_70 = q1Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_71 = q1Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_72 = q1Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_73 = _io_q1IQEnq_0_bits_T_70 | _io_q1IQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_75 = q1Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_76 = q1Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_77 = q1Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_78 = _io_q1IQEnq_0_bits_T_75 | _io_q1IQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_80 = q1Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_81 = q1Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_82 = q1Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_83 = _io_q1IQEnq_0_bits_T_80 | _io_q1IQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_85 = q1Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_86 = q1Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_87 = q1Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_88 = _io_q1IQEnq_0_bits_T_85 | _io_q1IQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_90 = q1Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_91 = q1Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_92 = q1Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_93 = _io_q1IQEnq_0_bits_T_90 | _io_q1IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_95 = q1Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_96 = q1Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_97 = q1Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_98 = _io_q1IQEnq_0_bits_T_95 | _io_q1IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_130 = q1Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_131 = q1Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_132 = q1Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_133 = _io_q1IQEnq_0_bits_T_130 | _io_q1IQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_135 = q1Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_136 = q1Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_137 = q1Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_138 = _io_q1IQEnq_0_bits_T_135 | _io_q1IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q1IQEnq_0_bits_T_140 = q1Final_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q1IQEnq_0_bits_T_141 = q1Final_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q1IQEnq_0_bits_T_142 = q1Final_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q1IQEnq_0_bits_T_143 = _io_q1IQEnq_0_bits_T_140 | _io_q1IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_180 = q1Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_181 = q1Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_182 = q1Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_183 = _io_q1IQEnq_0_bits_T_180 | _io_q1IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_185 = q1Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_186 = q1Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_187 = q1Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_188 = _io_q1IQEnq_0_bits_T_185 | _io_q1IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_190 = q1Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_191 = q1Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_192 = q1Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_193 = _io_q1IQEnq_0_bits_T_190 | _io_q1IQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_195 = q1Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_196 = q1Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_197 = q1Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_198 = _io_q1IQEnq_0_bits_T_195 | _io_q1IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_200 = q1Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_201 = q1Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_202 = q1Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_203 = _io_q1IQEnq_0_bits_T_200 | _io_q1IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_205 = q1Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_206 = q1Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_207 = q1Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_208 = _io_q1IQEnq_0_bits_T_205 | _io_q1IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_210 = q1Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_211 = q1Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_212 = q1Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_213 = _io_q1IQEnq_0_bits_T_210 | _io_q1IQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_215 = q1Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_216 = q1Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_217 = q1Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_218 = _io_q1IQEnq_0_bits_T_215 | _io_q1IQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_220 = q1Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_221 = q1Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_222 = q1Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_223 = _io_q1IQEnq_0_bits_T_220 | _io_q1IQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_225 = q1Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_226 = q1Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_227 = q1Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_228 = _io_q1IQEnq_0_bits_T_225 | _io_q1IQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_230 = q1Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_231 = q1Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_232 = q1Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_233 = _io_q1IQEnq_0_bits_T_230 | _io_q1IQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_235 = q1Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_236 = q1Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_237 = q1Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_238 = _io_q1IQEnq_0_bits_T_235 | _io_q1IQEnq_0_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_20 = q2Final_0 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_21 = q2Final_1 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_22 = q2Final_2 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_23 = _io_q2IQEnq_0_bits_T_20 | _io_q2IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_35 = q2Final_0 ? q1Uops_u_u_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_36 = q2Final_1 ? q1Uops_u_u_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_37 = q2Final_2 ? q1Uops_u_u_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_38 = _io_q2IQEnq_0_bits_T_35 | _io_q2IQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_40 = q2Final_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_41 = q2Final_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_42 = q2Final_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_43 = _io_q2IQEnq_0_bits_T_40 | _io_q2IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_60 = q2Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_61 = q2Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_62 = q2Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_63 = _io_q2IQEnq_0_bits_T_60 | _io_q2IQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_65 = q2Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_66 = q2Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_67 = q2Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_68 = _io_q2IQEnq_0_bits_T_65 | _io_q2IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_70 = q2Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_71 = q2Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_72 = q2Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_73 = _io_q2IQEnq_0_bits_T_70 | _io_q2IQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_75 = q2Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_76 = q2Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_77 = q2Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_78 = _io_q2IQEnq_0_bits_T_75 | _io_q2IQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_80 = q2Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_81 = q2Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_82 = q2Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_83 = _io_q2IQEnq_0_bits_T_80 | _io_q2IQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_85 = q2Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_86 = q2Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_87 = q2Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_88 = _io_q2IQEnq_0_bits_T_85 | _io_q2IQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_90 = q2Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_91 = q2Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_92 = q2Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_93 = _io_q2IQEnq_0_bits_T_90 | _io_q2IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_95 = q2Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_96 = q2Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_97 = q2Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_98 = _io_q2IQEnq_0_bits_T_95 | _io_q2IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_130 = q2Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_131 = q2Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_132 = q2Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_133 = _io_q2IQEnq_0_bits_T_130 | _io_q2IQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_135 = q2Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_136 = q2Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_137 = q2Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_138 = _io_q2IQEnq_0_bits_T_135 | _io_q2IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q2IQEnq_0_bits_T_140 = q2Final_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q2IQEnq_0_bits_T_141 = q2Final_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q2IQEnq_0_bits_T_142 = q2Final_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q2IQEnq_0_bits_T_143 = _io_q2IQEnq_0_bits_T_140 | _io_q2IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_180 = q2Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_181 = q2Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_182 = q2Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_183 = _io_q2IQEnq_0_bits_T_180 | _io_q2IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_185 = q2Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_186 = q2Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_187 = q2Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_188 = _io_q2IQEnq_0_bits_T_185 | _io_q2IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_190 = q2Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_191 = q2Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_192 = q2Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_193 = _io_q2IQEnq_0_bits_T_190 | _io_q2IQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_195 = q2Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_196 = q2Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_197 = q2Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_198 = _io_q2IQEnq_0_bits_T_195 | _io_q2IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_200 = q2Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_201 = q2Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_202 = q2Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_203 = _io_q2IQEnq_0_bits_T_200 | _io_q2IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_205 = q2Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_206 = q2Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_207 = q2Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_208 = _io_q2IQEnq_0_bits_T_205 | _io_q2IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_210 = q2Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_211 = q2Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_212 = q2Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_213 = _io_q2IQEnq_0_bits_T_210 | _io_q2IQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_215 = q2Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_216 = q2Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_217 = q2Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_218 = _io_q2IQEnq_0_bits_T_215 | _io_q2IQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_220 = q2Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_221 = q2Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_222 = q2Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_223 = _io_q2IQEnq_0_bits_T_220 | _io_q2IQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_225 = q2Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_226 = q2Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_227 = q2Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_228 = _io_q2IQEnq_0_bits_T_225 | _io_q2IQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_230 = q2Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_231 = q2Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_232 = q2Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_233 = _io_q2IQEnq_0_bits_T_230 | _io_q2IQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_235 = q2Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_236 = q2Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_237 = q2Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_238 = _io_q2IQEnq_0_bits_T_235 | _io_q2IQEnq_0_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_20 = q3Final_0 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_21 = q3Final_1 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_22 = q3Final_2 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_23 = _io_q3IQEnq_0_bits_T_20 | _io_q3IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_35 = q3Final_0 ? q1Uops_u_u_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_36 = q3Final_1 ? q1Uops_u_u_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_37 = q3Final_2 ? q1Uops_u_u_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_38 = _io_q3IQEnq_0_bits_T_35 | _io_q3IQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_40 = q3Final_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_41 = q3Final_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_42 = q3Final_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_43 = _io_q3IQEnq_0_bits_T_40 | _io_q3IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_60 = q3Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_61 = q3Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_62 = q3Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_63 = _io_q3IQEnq_0_bits_T_60 | _io_q3IQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_65 = q3Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_66 = q3Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_67 = q3Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_68 = _io_q3IQEnq_0_bits_T_65 | _io_q3IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_70 = q3Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_71 = q3Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_72 = q3Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_73 = _io_q3IQEnq_0_bits_T_70 | _io_q3IQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_75 = q3Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_76 = q3Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_77 = q3Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_78 = _io_q3IQEnq_0_bits_T_75 | _io_q3IQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_80 = q3Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_81 = q3Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_82 = q3Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_83 = _io_q3IQEnq_0_bits_T_80 | _io_q3IQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_85 = q3Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_86 = q3Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_87 = q3Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_88 = _io_q3IQEnq_0_bits_T_85 | _io_q3IQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_90 = q3Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_91 = q3Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_92 = q3Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_93 = _io_q3IQEnq_0_bits_T_90 | _io_q3IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_95 = q3Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_96 = q3Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_97 = q3Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_98 = _io_q3IQEnq_0_bits_T_95 | _io_q3IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_130 = q3Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_131 = q3Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_132 = q3Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_133 = _io_q3IQEnq_0_bits_T_130 | _io_q3IQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_135 = q3Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_136 = q3Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_137 = q3Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_138 = _io_q3IQEnq_0_bits_T_135 | _io_q3IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q3IQEnq_0_bits_T_140 = q3Final_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q3IQEnq_0_bits_T_141 = q3Final_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q3IQEnq_0_bits_T_142 = q3Final_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q3IQEnq_0_bits_T_143 = _io_q3IQEnq_0_bits_T_140 | _io_q3IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_180 = q3Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_181 = q3Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_182 = q3Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_183 = _io_q3IQEnq_0_bits_T_180 | _io_q3IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_185 = q3Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_186 = q3Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_187 = q3Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_188 = _io_q3IQEnq_0_bits_T_185 | _io_q3IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_190 = q3Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_191 = q3Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_192 = q3Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_193 = _io_q3IQEnq_0_bits_T_190 | _io_q3IQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_195 = q3Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_196 = q3Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_197 = q3Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_198 = _io_q3IQEnq_0_bits_T_195 | _io_q3IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_200 = q3Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_201 = q3Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_202 = q3Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_203 = _io_q3IQEnq_0_bits_T_200 | _io_q3IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_205 = q3Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_206 = q3Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_207 = q3Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_208 = _io_q3IQEnq_0_bits_T_205 | _io_q3IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_210 = q3Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_211 = q3Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_212 = q3Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_213 = _io_q3IQEnq_0_bits_T_210 | _io_q3IQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_215 = q3Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_216 = q3Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_217 = q3Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_218 = _io_q3IQEnq_0_bits_T_215 | _io_q3IQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_220 = q3Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_221 = q3Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_222 = q3Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_223 = _io_q3IQEnq_0_bits_T_220 | _io_q3IQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_225 = q3Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_226 = q3Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_227 = q3Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_228 = _io_q3IQEnq_0_bits_T_225 | _io_q3IQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_230 = q3Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_231 = q3Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_232 = q3Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_233 = _io_q3IQEnq_0_bits_T_230 | _io_q3IQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_235 = q3Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_236 = q3Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_237 = q3Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_238 = _io_q3IQEnq_0_bits_T_235 | _io_q3IQEnq_0_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] q4Uops_0_pdst = isStoreLane_0 ? 7'h0 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_0_rs2Valid = isStoreLane_0 ? 1'h0 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_0_rdValid = isStoreLane_0 ? 1'h0 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [6:0] q4Uops_0_robIdxFull = isStoreLane_0 ? q1Uops_u_u_robIdxFull : q1Uops_u_u_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_0_lqIdx = isStoreLane_0 ? 4'h0 : effLqIdx_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_0_sqIdx = isStoreLane_0 ? effSqIdx_0 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_0_prs1Busy = isStoreLane_0 ? q1Uops_u_u_prs1Busy : q1Uops_u_u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_0_prs2Busy = isStoreLane_0 ? 1'h0 : q1Uops_u_u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [6:0] q4Uops_1_pdst = isStoreLane_1 ? 7'h0 : stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_1_rs2Valid = isStoreLane_1 ? 1'h0 : stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_1_rdValid = isStoreLane_1 ? 1'h0 : stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [6:0] q4Uops_1_robIdxFull = isStoreLane_1 ? q1Uops_u_u_1_robIdxFull : q1Uops_u_u_1_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_1_lqIdx = isStoreLane_1 ? 4'h0 : effLqIdx_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_1_sqIdx = isStoreLane_1 ? effSqIdx_1 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_1_prs1Busy = isStoreLane_1 ? q1Uops_u_u_1_prs1Busy : q1Uops_u_u_1_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_1_prs2Busy = isStoreLane_1 ? 1'h0 : q1Uops_u_u_1_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [6:0] q4Uops_2_pdst = isStoreLane_2 ? 7'h0 : stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_2_rs2Valid = isStoreLane_2 ? 1'h0 : stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_2_rdValid = isStoreLane_2 ? 1'h0 : stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [6:0] q4Uops_2_robIdxFull = isStoreLane_2 ? q1Uops_u_u_2_robIdxFull : q1Uops_u_u_2_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_2_lqIdx = isStoreLane_2 ? 4'h0 : effLqIdx_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [3:0] q4Uops_2_sqIdx = isStoreLane_2 ? effSqIdx_2 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_2_prs1Busy = isStoreLane_2 ? q1Uops_u_u_2_prs1Busy : q1Uops_u_u_2_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire  q4Uops_2_prs2Busy = isStoreLane_2 ? 1'h0 : q1Uops_u_u_2_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 557:8]
  wire [2:0] _io_q4IQEnq_0_bits_T_20 = _q4Cand_T_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_21 = q4Selected_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_22 = q4Selected_2 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_23 = _io_q4IQEnq_0_bits_T_20 | _io_q4IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_25 = _q4Cand_T_1 ? q4Uops_0_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_26 = q4Selected_1 ? q4Uops_1_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_27 = q4Selected_2 ? q4Uops_2_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_28 = _io_q4IQEnq_0_bits_T_25 | _io_q4IQEnq_0_bits_T_26; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_30 = _q4Cand_T_1 ? q4Uops_0_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_31 = q4Selected_1 ? q4Uops_1_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_32 = q4Selected_2 ? q4Uops_2_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_33 = _io_q4IQEnq_0_bits_T_30 | _io_q4IQEnq_0_bits_T_31; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_35 = _q4Cand_T_1 ? q4Uops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_36 = q4Selected_1 ? q4Uops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_37 = q4Selected_2 ? q4Uops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_38 = _io_q4IQEnq_0_bits_T_35 | _io_q4IQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q4IQEnq_0_bits_T_40 = _q4Cand_T_1 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q4IQEnq_0_bits_T_41 = q4Selected_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q4IQEnq_0_bits_T_42 = q4Selected_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q4IQEnq_0_bits_T_43 = _io_q4IQEnq_0_bits_T_40 | _io_q4IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_60 = _q4Cand_T_1 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_61 = q4Selected_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_62 = q4Selected_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_63 = _io_q4IQEnq_0_bits_T_60 | _io_q4IQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_65 = _q4Cand_T_1 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_66 = q4Selected_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_67 = q4Selected_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_68 = _io_q4IQEnq_0_bits_T_65 | _io_q4IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_70 = _q4Cand_T_1 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_71 = q4Selected_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_72 = q4Selected_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_73 = _io_q4IQEnq_0_bits_T_70 | _io_q4IQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_75 = _q4Cand_T_1 ? q4Uops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_76 = q4Selected_1 ? q4Uops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_77 = q4Selected_2 ? q4Uops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_78 = _io_q4IQEnq_0_bits_T_75 | _io_q4IQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_80 = _q4Cand_T_1 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_81 = q4Selected_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_82 = q4Selected_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_83 = _io_q4IQEnq_0_bits_T_80 | _io_q4IQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_85 = _q4Cand_T_1 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_86 = q4Selected_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_87 = q4Selected_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_88 = _io_q4IQEnq_0_bits_T_85 | _io_q4IQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_90 = _q4Cand_T_1 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_91 = q4Selected_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_92 = q4Selected_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_93 = _io_q4IQEnq_0_bits_T_90 | _io_q4IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_95 = _q4Cand_T_1 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_96 = q4Selected_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_97 = q4Selected_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_98 = _io_q4IQEnq_0_bits_T_95 | _io_q4IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q4IQEnq_0_bits_T_130 = _q4Cand_T_1 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q4IQEnq_0_bits_T_131 = q4Selected_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q4IQEnq_0_bits_T_132 = q4Selected_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q4IQEnq_0_bits_T_133 = _io_q4IQEnq_0_bits_T_130 | _io_q4IQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_135 = _q4Cand_T_1 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_136 = q4Selected_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_137 = q4Selected_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_138 = _io_q4IQEnq_0_bits_T_135 | _io_q4IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q4IQEnq_0_bits_T_140 = _q4Cand_T_1 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q4IQEnq_0_bits_T_141 = q4Selected_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q4IQEnq_0_bits_T_142 = q4Selected_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q4IQEnq_0_bits_T_143 = _io_q4IQEnq_0_bits_T_140 | _io_q4IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_180 = _q4Cand_T_1 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_181 = q4Selected_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_182 = q4Selected_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_183 = _io_q4IQEnq_0_bits_T_180 | _io_q4IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_185 = _q4Cand_T_1 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_186 = q4Selected_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_187 = q4Selected_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_188 = _io_q4IQEnq_0_bits_T_185 | _io_q4IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_190 = _q4Cand_T_1 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_191 = q4Selected_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_192 = q4Selected_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_193 = _io_q4IQEnq_0_bits_T_190 | _io_q4IQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_195 = _q4Cand_T_1 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_196 = q4Selected_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_197 = q4Selected_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_198 = _io_q4IQEnq_0_bits_T_195 | _io_q4IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_200 = _q4Cand_T_1 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_201 = q4Selected_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_202 = q4Selected_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_203 = _io_q4IQEnq_0_bits_T_200 | _io_q4IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_205 = _q4Cand_T_1 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_206 = q4Selected_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_207 = q4Selected_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_208 = _io_q4IQEnq_0_bits_T_205 | _io_q4IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_210 = _q4Cand_T_1 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_211 = q4Selected_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_212 = q4Selected_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_213 = _io_q4IQEnq_0_bits_T_210 | _io_q4IQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_215 = _q4Cand_T_1 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_216 = q4Selected_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_217 = q4Selected_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_218 = _io_q4IQEnq_0_bits_T_215 | _io_q4IQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_220 = _q4Cand_T_1 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_221 = q4Selected_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_222 = q4Selected_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q4IQEnq_0_bits_T_223 = _io_q4IQEnq_0_bits_T_220 | _io_q4IQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_225 = _q4Cand_T_1 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_226 = q4Selected_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_227 = q4Selected_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_228 = _io_q4IQEnq_0_bits_T_225 | _io_q4IQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_230 = _q4Cand_T_1 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_231 = q4Selected_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_232 = q4Selected_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_233 = _io_q4IQEnq_0_bits_T_230 | _io_q4IQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_235 = _q4Cand_T_1 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_236 = q4Selected_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_237 = q4Selected_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q4IQEnq_0_bits_T_238 = _io_q4IQEnq_0_bits_T_235 | _io_q4IQEnq_0_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_23 = _laneTargetQ_0_T | _laneTargetQ_1_T; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_25 = q5Selected_0 ? effSqIdx_0 : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_26 = q5Selected_1 ? effSqIdx_1 : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_27 = q5Selected_2 ? effSqIdx_2 : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_28 = _io_q5IQEnq_0_bits_T_25 | _io_q5IQEnq_0_bits_T_26; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_35 = q5Selected_0 ? q1Uops_u_u_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_36 = q5Selected_1 ? q1Uops_u_u_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_37 = q5Selected_2 ? q1Uops_u_u_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_38 = _io_q5IQEnq_0_bits_T_35 | _io_q5IQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_40 = q5Selected_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_41 = q5Selected_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_42 = q5Selected_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_43 = _io_q5IQEnq_0_bits_T_40 | _io_q5IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_60 = q5Selected_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_61 = q5Selected_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_62 = q5Selected_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_63 = _io_q5IQEnq_0_bits_T_60 | _io_q5IQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_65 = q5Selected_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_66 = q5Selected_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_67 = q5Selected_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_68 = _io_q5IQEnq_0_bits_T_65 | _io_q5IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_70 = q5Selected_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_71 = q5Selected_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_72 = q5Selected_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_73 = _io_q5IQEnq_0_bits_T_70 | _io_q5IQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_80 = q5Selected_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_81 = q5Selected_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_82 = q5Selected_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_83 = _io_q5IQEnq_0_bits_T_80 | _io_q5IQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_85 = q5Selected_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_86 = q5Selected_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_87 = q5Selected_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_88 = _io_q5IQEnq_0_bits_T_85 | _io_q5IQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_90 = q5Selected_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_91 = q5Selected_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_92 = q5Selected_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_93 = _io_q5IQEnq_0_bits_T_90 | _io_q5IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_95 = q5Selected_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_96 = q5Selected_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_97 = q5Selected_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_98 = _io_q5IQEnq_0_bits_T_95 | _io_q5IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_130 = q5Selected_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_131 = q5Selected_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_132 = q5Selected_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_133 = _io_q5IQEnq_0_bits_T_130 | _io_q5IQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q5IQEnq_0_bits_T_140 = q5Selected_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q5IQEnq_0_bits_T_141 = q5Selected_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q5IQEnq_0_bits_T_142 = q5Selected_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_q5IQEnq_0_bits_T_143 = _io_q5IQEnq_0_bits_T_140 | _io_q5IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_180 = q5Selected_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_181 = q5Selected_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_182 = q5Selected_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_183 = _io_q5IQEnq_0_bits_T_180 | _io_q5IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_185 = q5Selected_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_186 = q5Selected_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_187 = q5Selected_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_188 = _io_q5IQEnq_0_bits_T_185 | _io_q5IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_190 = q5Selected_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_191 = q5Selected_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_192 = q5Selected_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_193 = _io_q5IQEnq_0_bits_T_190 | _io_q5IQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_195 = q5Selected_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_196 = q5Selected_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_197 = q5Selected_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_198 = _io_q5IQEnq_0_bits_T_195 | _io_q5IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_200 = q5Selected_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_201 = q5Selected_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_202 = q5Selected_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_203 = _io_q5IQEnq_0_bits_T_200 | _io_q5IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_205 = q5Selected_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_206 = q5Selected_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_207 = q5Selected_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_208 = _io_q5IQEnq_0_bits_T_205 | _io_q5IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_210 = q5Selected_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_211 = q5Selected_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_212 = q5Selected_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_213 = _io_q5IQEnq_0_bits_T_210 | _io_q5IQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_215 = q5Selected_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_216 = q5Selected_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_217 = q5Selected_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_218 = _io_q5IQEnq_0_bits_T_215 | _io_q5IQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_220 = q5Selected_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_221 = q5Selected_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_222 = q5Selected_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_223 = _io_q5IQEnq_0_bits_T_220 | _io_q5IQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_225 = q5Selected_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_226 = q5Selected_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_227 = q5Selected_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_228 = _io_q5IQEnq_0_bits_T_225 | _io_q5IQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_230 = q5Selected_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_231 = q5Selected_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_232 = q5Selected_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_233 = _io_q5IQEnq_0_bits_T_230 | _io_q5IQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_235 = q5Selected_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_236 = q5Selected_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_237 = q5Selected_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_238 = _io_q5IQEnq_0_bits_T_235 | _io_q5IQEnq_0_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  BusyTable busyTable ( // @[src/main/scala/backend/dispatch/DispatchStage.scala 31:25]
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
  assign io_in_0_ready = ~stgValid | dispatchFire & AllWillFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:32]
  assign io_in_1_ready = ~stgValid | dispatchFire & AllWillFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:32]
  assign io_in_2_ready = ~stgValid | dispatchFire & AllWillFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:32]
  assign io_q1IQEnq_0_valid = q1WillSend & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 525:27]
  assign io_q1IQEnq_0_bits_pc = _io_q1IQEnq_0_bits_T_238 | _io_q1IQEnq_0_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_inst = _io_q1IQEnq_0_bits_T_233 | _io_q1IQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_fuType = _io_q1IQEnq_0_bits_T_228 | _io_q1IQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_aluOp = _io_q1IQEnq_0_bits_T_223 | _io_q1IQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_bruOp = _io_q1IQEnq_0_bits_T_218 | _io_q1IQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_lsuOp = _io_q1IQEnq_0_bits_T_213 | _io_q1IQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_csrOp = _io_q1IQEnq_0_bits_T_208 | _io_q1IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_mulOp = _io_q1IQEnq_0_bits_T_203 | _io_q1IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_divOp = _io_q1IQEnq_0_bits_T_198 | _io_q1IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_src1Type = _io_q1IQEnq_0_bits_T_193 | _io_q1IQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_src2Type = _io_q1IQEnq_0_bits_T_188 | _io_q1IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_immType = _io_q1IQEnq_0_bits_T_183 | _io_q1IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_rfWen = q1Final_0 & stgData_0_ctrl_rfWen | q1Final_1 & stgData_1_ctrl_rfWen | q1Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_memRead = q1Final_0 & stgData_0_ctrl_memRead | q1Final_1 & stgData_1_ctrl_memRead |
    q1Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_memWrite = q1Final_0 & stgData_0_ctrl_memWrite | q1Final_1 & stgData_1_ctrl_memWrite |
    q1Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_csrWen = q1Final_0 & stgData_0_ctrl_csrWen | q1Final_1 & stgData_1_ctrl_csrWen |
    q1Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isBranch = q1Final_0 & stgData_0_ctrl_isBranch | q1Final_1 & stgData_1_ctrl_isBranch |
    q1Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isJump = q1Final_0 & stgData_0_ctrl_isJump | q1Final_1 & stgData_1_ctrl_isJump |
    q1Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isPriv = q1Final_0 & stgData_0_ctrl_isPriv | q1Final_1 & stgData_1_ctrl_isPriv |
    q1Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_excpVec = _io_q1IQEnq_0_bits_T_143 | _io_q1IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_imm = _io_q1IQEnq_0_bits_T_138 | _io_q1IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_csrAddress = _io_q1IQEnq_0_bits_T_133 | _io_q1IQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_valid = q1Final_0 & stgData_0_pdInfo_valid | q1Final_1 & stgData_1_pdInfo_valid |
    q1Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isBr = q1Final_0 & stgData_0_pdInfo_isBr | q1Final_1 & stgData_1_pdInfo_isBr |
    q1Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isJal = q1Final_0 & stgData_0_pdInfo_isJal | q1Final_1 & stgData_1_pdInfo_isJal |
    q1Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isJalr = q1Final_0 & stgData_0_pdInfo_isJalr | q1Final_1 & stgData_1_pdInfo_isJalr |
    q1Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isCall = q1Final_0 & stgData_0_pdInfo_isCall | q1Final_1 & stgData_1_pdInfo_isCall |
    q1Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isRet = q1Final_0 & stgData_0_pdInfo_isRet | q1Final_1 & stgData_1_pdInfo_isRet |
    q1Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_jumpTarget = _io_q1IQEnq_0_bits_T_98 | _io_q1IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ldst = _io_q1IQEnq_0_bits_T_93 | _io_q1IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_lrs1 = _io_q1IQEnq_0_bits_T_88 | _io_q1IQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_lrs2 = _io_q1IQEnq_0_bits_T_83 | _io_q1IQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdst = _io_q1IQEnq_0_bits_T_78 | _io_q1IQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs1 = _io_q1IQEnq_0_bits_T_73 | _io_q1IQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs2 = _io_q1IQEnq_0_bits_T_68 | _io_q1IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_oldPdst = _io_q1IQEnq_0_bits_T_63 | _io_q1IQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rs1Valid = q1Final_0 & stgData_0_rs1Valid | q1Final_1 & stgData_1_rs1Valid | q1Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rs2Valid = q1Final_0 & stgData_0_rs2Valid | q1Final_1 & stgData_1_rs2Valid | q1Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rdValid = q1Final_0 & stgData_0_rdValid | q1Final_1 & stgData_1_rdValid | q1Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdx = _io_q1IQEnq_0_bits_T_43 | _io_q1IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdxFull = _io_q1IQEnq_0_bits_T_38 | _io_q1IQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs1Busy = q1Final_0 & q1Uops_u_u_prs1Busy | q1Final_1 & q1Uops_u_u_1_prs1Busy | q1Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs2Busy = q1Final_0 & q1Uops_u_u_prs2Busy | q1Final_1 & q1Uops_u_u_1_prs2Busy | q1Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_valid = q2WillSend & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 537:27]
  assign io_q2IQEnq_0_bits_pc = _io_q2IQEnq_0_bits_T_238 | _io_q2IQEnq_0_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_inst = _io_q2IQEnq_0_bits_T_233 | _io_q2IQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_fuType = _io_q2IQEnq_0_bits_T_228 | _io_q2IQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_aluOp = _io_q2IQEnq_0_bits_T_223 | _io_q2IQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_bruOp = _io_q2IQEnq_0_bits_T_218 | _io_q2IQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_lsuOp = _io_q2IQEnq_0_bits_T_213 | _io_q2IQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_csrOp = _io_q2IQEnq_0_bits_T_208 | _io_q2IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_mulOp = _io_q2IQEnq_0_bits_T_203 | _io_q2IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_divOp = _io_q2IQEnq_0_bits_T_198 | _io_q2IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_src1Type = _io_q2IQEnq_0_bits_T_193 | _io_q2IQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_src2Type = _io_q2IQEnq_0_bits_T_188 | _io_q2IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_immType = _io_q2IQEnq_0_bits_T_183 | _io_q2IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_rfWen = q2Final_0 & stgData_0_ctrl_rfWen | q2Final_1 & stgData_1_ctrl_rfWen | q2Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_memRead = q2Final_0 & stgData_0_ctrl_memRead | q2Final_1 & stgData_1_ctrl_memRead |
    q2Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_memWrite = q2Final_0 & stgData_0_ctrl_memWrite | q2Final_1 & stgData_1_ctrl_memWrite |
    q2Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_csrWen = q2Final_0 & stgData_0_ctrl_csrWen | q2Final_1 & stgData_1_ctrl_csrWen |
    q2Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isBranch = q2Final_0 & stgData_0_ctrl_isBranch | q2Final_1 & stgData_1_ctrl_isBranch |
    q2Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isJump = q2Final_0 & stgData_0_ctrl_isJump | q2Final_1 & stgData_1_ctrl_isJump |
    q2Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isPriv = q2Final_0 & stgData_0_ctrl_isPriv | q2Final_1 & stgData_1_ctrl_isPriv |
    q2Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_excpVec = _io_q2IQEnq_0_bits_T_143 | _io_q2IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_imm = _io_q2IQEnq_0_bits_T_138 | _io_q2IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_csrAddress = _io_q2IQEnq_0_bits_T_133 | _io_q2IQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_valid = q2Final_0 & stgData_0_pdInfo_valid | q2Final_1 & stgData_1_pdInfo_valid |
    q2Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isBr = q2Final_0 & stgData_0_pdInfo_isBr | q2Final_1 & stgData_1_pdInfo_isBr |
    q2Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isJal = q2Final_0 & stgData_0_pdInfo_isJal | q2Final_1 & stgData_1_pdInfo_isJal |
    q2Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isJalr = q2Final_0 & stgData_0_pdInfo_isJalr | q2Final_1 & stgData_1_pdInfo_isJalr |
    q2Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isCall = q2Final_0 & stgData_0_pdInfo_isCall | q2Final_1 & stgData_1_pdInfo_isCall |
    q2Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isRet = q2Final_0 & stgData_0_pdInfo_isRet | q2Final_1 & stgData_1_pdInfo_isRet |
    q2Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_jumpTarget = _io_q2IQEnq_0_bits_T_98 | _io_q2IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ldst = _io_q2IQEnq_0_bits_T_93 | _io_q2IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_lrs1 = _io_q2IQEnq_0_bits_T_88 | _io_q2IQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_lrs2 = _io_q2IQEnq_0_bits_T_83 | _io_q2IQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdst = _io_q2IQEnq_0_bits_T_78 | _io_q2IQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs1 = _io_q2IQEnq_0_bits_T_73 | _io_q2IQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs2 = _io_q2IQEnq_0_bits_T_68 | _io_q2IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_oldPdst = _io_q2IQEnq_0_bits_T_63 | _io_q2IQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rs1Valid = q2Final_0 & stgData_0_rs1Valid | q2Final_1 & stgData_1_rs1Valid | q2Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rs2Valid = q2Final_0 & stgData_0_rs2Valid | q2Final_1 & stgData_1_rs2Valid | q2Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rdValid = q2Final_0 & stgData_0_rdValid | q2Final_1 & stgData_1_rdValid | q2Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdx = _io_q2IQEnq_0_bits_T_43 | _io_q2IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdxFull = _io_q2IQEnq_0_bits_T_38 | _io_q2IQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_issueQueue = _io_q2IQEnq_0_bits_T_23 | _io_q2IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs1Busy = q2Final_0 & q1Uops_u_u_prs1Busy | q2Final_1 & q1Uops_u_u_1_prs1Busy | q2Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs2Busy = q2Final_0 & q1Uops_u_u_prs2Busy | q2Final_1 & q1Uops_u_u_1_prs2Busy | q2Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_valid = q3WillSend & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 549:27]
  assign io_q3IQEnq_0_bits_pc = _io_q3IQEnq_0_bits_T_238 | _io_q3IQEnq_0_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_inst = _io_q3IQEnq_0_bits_T_233 | _io_q3IQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_fuType = _io_q3IQEnq_0_bits_T_228 | _io_q3IQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_aluOp = _io_q3IQEnq_0_bits_T_223 | _io_q3IQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_bruOp = _io_q3IQEnq_0_bits_T_218 | _io_q3IQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_lsuOp = _io_q3IQEnq_0_bits_T_213 | _io_q3IQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_csrOp = _io_q3IQEnq_0_bits_T_208 | _io_q3IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_mulOp = _io_q3IQEnq_0_bits_T_203 | _io_q3IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_divOp = _io_q3IQEnq_0_bits_T_198 | _io_q3IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_src1Type = _io_q3IQEnq_0_bits_T_193 | _io_q3IQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_src2Type = _io_q3IQEnq_0_bits_T_188 | _io_q3IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_immType = _io_q3IQEnq_0_bits_T_183 | _io_q3IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_rfWen = q3Final_0 & stgData_0_ctrl_rfWen | q3Final_1 & stgData_1_ctrl_rfWen | q3Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_memRead = q3Final_0 & stgData_0_ctrl_memRead | q3Final_1 & stgData_1_ctrl_memRead |
    q3Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_memWrite = q3Final_0 & stgData_0_ctrl_memWrite | q3Final_1 & stgData_1_ctrl_memWrite |
    q3Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_csrWen = q3Final_0 & stgData_0_ctrl_csrWen | q3Final_1 & stgData_1_ctrl_csrWen |
    q3Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isBranch = q3Final_0 & stgData_0_ctrl_isBranch | q3Final_1 & stgData_1_ctrl_isBranch |
    q3Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isJump = q3Final_0 & stgData_0_ctrl_isJump | q3Final_1 & stgData_1_ctrl_isJump |
    q3Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isPriv = q3Final_0 & stgData_0_ctrl_isPriv | q3Final_1 & stgData_1_ctrl_isPriv |
    q3Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_excpVec = _io_q3IQEnq_0_bits_T_143 | _io_q3IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_imm = _io_q3IQEnq_0_bits_T_138 | _io_q3IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_csrAddress = _io_q3IQEnq_0_bits_T_133 | _io_q3IQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_valid = q3Final_0 & stgData_0_pdInfo_valid | q3Final_1 & stgData_1_pdInfo_valid |
    q3Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isBr = q3Final_0 & stgData_0_pdInfo_isBr | q3Final_1 & stgData_1_pdInfo_isBr |
    q3Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isJal = q3Final_0 & stgData_0_pdInfo_isJal | q3Final_1 & stgData_1_pdInfo_isJal |
    q3Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isJalr = q3Final_0 & stgData_0_pdInfo_isJalr | q3Final_1 & stgData_1_pdInfo_isJalr |
    q3Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isCall = q3Final_0 & stgData_0_pdInfo_isCall | q3Final_1 & stgData_1_pdInfo_isCall |
    q3Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isRet = q3Final_0 & stgData_0_pdInfo_isRet | q3Final_1 & stgData_1_pdInfo_isRet |
    q3Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_jumpTarget = _io_q3IQEnq_0_bits_T_98 | _io_q3IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ldst = _io_q3IQEnq_0_bits_T_93 | _io_q3IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_lrs1 = _io_q3IQEnq_0_bits_T_88 | _io_q3IQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_lrs2 = _io_q3IQEnq_0_bits_T_83 | _io_q3IQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdst = _io_q3IQEnq_0_bits_T_78 | _io_q3IQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs1 = _io_q3IQEnq_0_bits_T_73 | _io_q3IQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs2 = _io_q3IQEnq_0_bits_T_68 | _io_q3IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_oldPdst = _io_q3IQEnq_0_bits_T_63 | _io_q3IQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rs1Valid = q3Final_0 & stgData_0_rs1Valid | q3Final_1 & stgData_1_rs1Valid | q3Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rs2Valid = q3Final_0 & stgData_0_rs2Valid | q3Final_1 & stgData_1_rs2Valid | q3Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rdValid = q3Final_0 & stgData_0_rdValid | q3Final_1 & stgData_1_rdValid | q3Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdx = _io_q3IQEnq_0_bits_T_43 | _io_q3IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdxFull = _io_q3IQEnq_0_bits_T_38 | _io_q3IQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_issueQueue = _io_q3IQEnq_0_bits_T_23 | _io_q3IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs1Busy = q3Final_0 & q1Uops_u_u_prs1Busy | q3Final_1 & q1Uops_u_u_1_prs1Busy | q3Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs2Busy = q3Final_0 & q1Uops_u_u_prs2Busy | q3Final_1 & q1Uops_u_u_1_prs2Busy | q3Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_valid = q4WillSend & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 559:30]
  assign io_q4IQEnq_0_bits_pc = _io_q4IQEnq_0_bits_T_238 | _io_q4IQEnq_0_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_inst = _io_q4IQEnq_0_bits_T_233 | _io_q4IQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_fuType = _io_q4IQEnq_0_bits_T_228 | _io_q4IQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_aluOp = _io_q4IQEnq_0_bits_T_223 | _io_q4IQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_bruOp = _io_q4IQEnq_0_bits_T_218 | _io_q4IQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_lsuOp = _io_q4IQEnq_0_bits_T_213 | _io_q4IQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_csrOp = _io_q4IQEnq_0_bits_T_208 | _io_q4IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_mulOp = _io_q4IQEnq_0_bits_T_203 | _io_q4IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_divOp = _io_q4IQEnq_0_bits_T_198 | _io_q4IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_src1Type = _io_q4IQEnq_0_bits_T_193 | _io_q4IQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_src2Type = _io_q4IQEnq_0_bits_T_188 | _io_q4IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_immType = _io_q4IQEnq_0_bits_T_183 | _io_q4IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_rfWen = _q4Cand_T_1 & stgData_0_ctrl_rfWen | q4Selected_1 & stgData_1_ctrl_rfWen |
    q4Selected_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_memRead = _q4Cand_T_1 & stgData_0_ctrl_memRead | q4Selected_1 & stgData_1_ctrl_memRead
     | q4Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_memWrite = _q4Cand_T_1 & stgData_0_ctrl_memWrite | q4Selected_1 &
    stgData_1_ctrl_memWrite | q4Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_csrWen = _q4Cand_T_1 & stgData_0_ctrl_csrWen | q4Selected_1 & stgData_1_ctrl_csrWen |
    q4Selected_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isBranch = _q4Cand_T_1 & stgData_0_ctrl_isBranch | q4Selected_1 &
    stgData_1_ctrl_isBranch | q4Selected_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isJump = _q4Cand_T_1 & stgData_0_ctrl_isJump | q4Selected_1 & stgData_1_ctrl_isJump |
    q4Selected_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isPriv = _q4Cand_T_1 & stgData_0_ctrl_isPriv | q4Selected_1 & stgData_1_ctrl_isPriv |
    q4Selected_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_excpVec = _io_q4IQEnq_0_bits_T_143 | _io_q4IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_imm = _io_q4IQEnq_0_bits_T_138 | _io_q4IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_csrAddress = _io_q4IQEnq_0_bits_T_133 | _io_q4IQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_valid = _q4Cand_T_1 & stgData_0_pdInfo_valid | q4Selected_1 & stgData_1_pdInfo_valid
     | q4Selected_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isBr = _q4Cand_T_1 & stgData_0_pdInfo_isBr | q4Selected_1 & stgData_1_pdInfo_isBr |
    q4Selected_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isJal = _q4Cand_T_1 & stgData_0_pdInfo_isJal | q4Selected_1 & stgData_1_pdInfo_isJal
     | q4Selected_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isJalr = _q4Cand_T_1 & stgData_0_pdInfo_isJalr | q4Selected_1 &
    stgData_1_pdInfo_isJalr | q4Selected_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isCall = _q4Cand_T_1 & stgData_0_pdInfo_isCall | q4Selected_1 &
    stgData_1_pdInfo_isCall | q4Selected_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isRet = _q4Cand_T_1 & stgData_0_pdInfo_isRet | q4Selected_1 & stgData_1_pdInfo_isRet
     | q4Selected_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_jumpTarget = _io_q4IQEnq_0_bits_T_98 | _io_q4IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ldst = _io_q4IQEnq_0_bits_T_93 | _io_q4IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lrs1 = _io_q4IQEnq_0_bits_T_88 | _io_q4IQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lrs2 = _io_q4IQEnq_0_bits_T_83 | _io_q4IQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdst = _io_q4IQEnq_0_bits_T_78 | _io_q4IQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs1 = _io_q4IQEnq_0_bits_T_73 | _io_q4IQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs2 = _io_q4IQEnq_0_bits_T_68 | _io_q4IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_oldPdst = _io_q4IQEnq_0_bits_T_63 | _io_q4IQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rs1Valid = _q4Cand_T_1 & stgData_0_rs1Valid | q4Selected_1 & stgData_1_rs1Valid |
    q4Selected_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rs2Valid = _q4Cand_T_1 & q4Uops_0_rs2Valid | q4Selected_1 & q4Uops_1_rs2Valid | q4Selected_2
     & q4Uops_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rdValid = _q4Cand_T_1 & q4Uops_0_rdValid | q4Selected_1 & q4Uops_1_rdValid | q4Selected_2 &
    q4Uops_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdx = _io_q4IQEnq_0_bits_T_43 | _io_q4IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdxFull = _io_q4IQEnq_0_bits_T_38 | _io_q4IQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lqIdx = _io_q4IQEnq_0_bits_T_33 | _io_q4IQEnq_0_bits_T_32; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_sqIdx = _io_q4IQEnq_0_bits_T_28 | _io_q4IQEnq_0_bits_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_issueQueue = _io_q4IQEnq_0_bits_T_23 | _io_q4IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs1Busy = _q4Cand_T_1 & q4Uops_0_prs1Busy | q4Selected_1 & q4Uops_1_prs1Busy | q4Selected_2
     & q4Uops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs2Busy = _q4Cand_T_1 & q4Uops_0_prs2Busy | q4Selected_1 & q4Uops_1_prs2Busy | q4Selected_2
     & q4Uops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_isSta = _q5Selected_T | _q5Selected_T_1 | _q5Selected_T_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_valid = q5WillSend & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 566:30]
  assign io_q5IQEnq_0_bits_pc = _io_q5IQEnq_0_bits_T_238 | _io_q5IQEnq_0_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_inst = _io_q5IQEnq_0_bits_T_233 | _io_q5IQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_fuType = _io_q5IQEnq_0_bits_T_228 | _io_q5IQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_aluOp = _io_q5IQEnq_0_bits_T_223 | _io_q5IQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_bruOp = _io_q5IQEnq_0_bits_T_218 | _io_q5IQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_lsuOp = _io_q5IQEnq_0_bits_T_213 | _io_q5IQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_csrOp = _io_q5IQEnq_0_bits_T_208 | _io_q5IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_mulOp = _io_q5IQEnq_0_bits_T_203 | _io_q5IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_divOp = _io_q5IQEnq_0_bits_T_198 | _io_q5IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_src1Type = _io_q5IQEnq_0_bits_T_193 | _io_q5IQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_src2Type = _io_q5IQEnq_0_bits_T_188 | _io_q5IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_immType = _io_q5IQEnq_0_bits_T_183 | _io_q5IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_rfWen = q5Selected_0 & stgData_0_ctrl_rfWen | q5Selected_1 & stgData_1_ctrl_rfWen |
    q5Selected_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_memRead = q5Selected_0 & stgData_0_ctrl_memRead | q5Selected_1 & stgData_1_ctrl_memRead
     | q5Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_memWrite = q5Selected_0 & stgData_0_ctrl_memWrite | q5Selected_1 &
    stgData_1_ctrl_memWrite | q5Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_csrWen = q5Selected_0 & stgData_0_ctrl_csrWen | q5Selected_1 & stgData_1_ctrl_csrWen |
    q5Selected_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isBranch = q5Selected_0 & stgData_0_ctrl_isBranch | q5Selected_1 &
    stgData_1_ctrl_isBranch | q5Selected_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isJump = q5Selected_0 & stgData_0_ctrl_isJump | q5Selected_1 & stgData_1_ctrl_isJump |
    q5Selected_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isPriv = q5Selected_0 & stgData_0_ctrl_isPriv | q5Selected_1 & stgData_1_ctrl_isPriv |
    q5Selected_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_excpVec = _io_q5IQEnq_0_bits_T_143 | _io_q5IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_csrAddress = _io_q5IQEnq_0_bits_T_133 | _io_q5IQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_valid = q5Selected_0 & stgData_0_pdInfo_valid | q5Selected_1 & stgData_1_pdInfo_valid
     | q5Selected_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isBr = q5Selected_0 & stgData_0_pdInfo_isBr | q5Selected_1 & stgData_1_pdInfo_isBr |
    q5Selected_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isJal = q5Selected_0 & stgData_0_pdInfo_isJal | q5Selected_1 & stgData_1_pdInfo_isJal
     | q5Selected_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isJalr = q5Selected_0 & stgData_0_pdInfo_isJalr | q5Selected_1 &
    stgData_1_pdInfo_isJalr | q5Selected_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isCall = q5Selected_0 & stgData_0_pdInfo_isCall | q5Selected_1 &
    stgData_1_pdInfo_isCall | q5Selected_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isRet = q5Selected_0 & stgData_0_pdInfo_isRet | q5Selected_1 & stgData_1_pdInfo_isRet
     | q5Selected_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_jumpTarget = _io_q5IQEnq_0_bits_T_98 | _io_q5IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ldst = _io_q5IQEnq_0_bits_T_93 | _io_q5IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lrs1 = _io_q5IQEnq_0_bits_T_88 | _io_q5IQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lrs2 = _io_q5IQEnq_0_bits_T_83 | _io_q5IQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs1 = _io_q5IQEnq_0_bits_T_73 | _io_q5IQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs2 = _io_q5IQEnq_0_bits_T_68 | _io_q5IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_oldPdst = _io_q5IQEnq_0_bits_T_63 | _io_q5IQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_rs2Valid = q5Selected_0 & stgData_0_rs2Valid | q5Selected_1 & stgData_1_rs2Valid |
    q5Selected_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdx = _io_q5IQEnq_0_bits_T_43 | _io_q5IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdxFull = _io_q5IQEnq_0_bits_T_38 | _io_q5IQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_sqIdx = _io_q5IQEnq_0_bits_T_28 | _io_q5IQEnq_0_bits_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_issueQueue = _io_q5IQEnq_0_bits_T_23 | _laneTargetQ_2_T; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs2Busy = q5Selected_0 & q1Uops_u_u_prs2Busy | q5Selected_1 & q1Uops_u_u_1_prs2Busy |
    q5Selected_2 & q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_isStd = q5Selected_0 | q5Selected_1 | q5Selected_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_0_valid = dispatchFire & needLsq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 575:50]
  assign io_lsEnq_req_0_bits_robIdx = stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 576:34]
  assign io_lsEnq_req_0_bits_isLoad = stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 577:34]
  assign io_lsEnq_req_0_bits_isStore = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 578:34]
  assign io_lsEnq_req_0_bits_sqIdx = _sqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  assign io_lsEnq_req_0_bits_lqIdx = _lqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  assign io_lsEnq_req_1_valid = dispatchFire & needLsq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 575:50]
  assign io_lsEnq_req_1_bits_robIdx = stgData_1_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 576:34]
  assign io_lsEnq_req_1_bits_isLoad = stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 577:34]
  assign io_lsEnq_req_1_bits_isStore = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 578:34]
  assign io_lsEnq_req_1_bits_sqIdx = sqHeadPtr + _T_19[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  assign io_lsEnq_req_1_bits_lqIdx = lqHeadPtr + _T_16[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  assign io_lsEnq_req_2_valid = dispatchFire & needLsq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 575:50]
  assign io_lsEnq_req_2_bits_robIdx = stgData_2_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 576:34]
  assign io_lsEnq_req_2_bits_isLoad = stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 577:34]
  assign io_lsEnq_req_2_bits_isStore = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 578:34]
  assign io_lsEnq_req_2_bits_sqIdx = sqHeadPtr + _T_26; // @[src/main/scala/backend/dispatch/DispatchStage.scala 400:31]
  assign io_lsEnq_req_2_bits_lqIdx = lqHeadPtr + _T_23; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:31]
  assign io_robEnq_valid_0 = dispatchFire & needRob_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 587:41]
  assign io_robEnq_valid_1 = dispatchFire & needRob_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 587:41]
  assign io_robEnq_valid_2 = dispatchFire & needRob_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 587:41]
  assign io_robEnq_valids_0 = laneValid_0 & ~robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  assign io_robEnq_valids_1 = laneValid_1 & ~robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  assign io_robEnq_valids_2 = laneValid_2 & ~robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 48:18]
  assign io_robEnq_bits_0_pc = stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 589:32]
  assign io_robEnq_bits_0_inst = stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 590:32]
  assign io_robEnq_bits_0_pdst = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 591:32]
  assign io_robEnq_bits_0_oldPdst = stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 592:32]
  assign io_robEnq_bits_0_ldst = stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 593:32]
  assign io_robEnq_bits_0_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 594:32]
  assign io_robEnq_bits_0_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 595:32]
  assign io_robEnq_bits_0_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 596:32]
  assign io_robEnq_bits_0_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 597:32]
  assign io_robEnq_bits_0_excpVec = stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 599:32]
  assign io_robEnq_bits_0_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 598:32]
  assign io_robEnq_bits_1_pc = stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 589:32]
  assign io_robEnq_bits_1_inst = stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 590:32]
  assign io_robEnq_bits_1_pdst = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 591:32]
  assign io_robEnq_bits_1_oldPdst = stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 592:32]
  assign io_robEnq_bits_1_ldst = stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 593:32]
  assign io_robEnq_bits_1_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 594:32]
  assign io_robEnq_bits_1_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 595:32]
  assign io_robEnq_bits_1_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 596:32]
  assign io_robEnq_bits_1_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 597:32]
  assign io_robEnq_bits_1_excpVec = stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 599:32]
  assign io_robEnq_bits_1_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 598:32]
  assign io_robEnq_bits_2_pc = stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 589:32]
  assign io_robEnq_bits_2_inst = stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 590:32]
  assign io_robEnq_bits_2_pdst = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 591:32]
  assign io_robEnq_bits_2_oldPdst = stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 592:32]
  assign io_robEnq_bits_2_ldst = stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 593:32]
  assign io_robEnq_bits_2_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 594:32]
  assign io_robEnq_bits_2_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 595:32]
  assign io_robEnq_bits_2_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 596:32]
  assign io_robEnq_bits_2_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 597:32]
  assign io_robEnq_bits_2_excpVec = stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 599:32]
  assign io_robEnq_bits_2_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 598:32]
  assign busyTable_clock = clock;
  assign busyTable_reset = reset;
  assign busyTable_io_readReq_0 = stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:37]
  assign busyTable_io_readReq_1 = stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 426:37]
  assign busyTable_io_readReq_2 = stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:37]
  assign busyTable_io_readReq_3 = stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 426:37]
  assign busyTable_io_readReq_4 = stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:37]
  assign busyTable_io_readReq_5 = stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 426:37]
  assign busyTable_io_allocReq_0_valid = _busyTable_io_allocReq_0_valid_T_1 & stgData_0_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 430:58]
  assign busyTable_io_allocReq_0_bits = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 431:36]
  assign busyTable_io_allocReq_1_valid = _busyTable_io_allocReq_1_valid_T_1 & stgData_1_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 430:58]
  assign busyTable_io_allocReq_1_bits = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 431:36]
  assign busyTable_io_allocReq_2_valid = _busyTable_io_allocReq_2_valid_T_1 & stgData_2_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 430:58]
  assign busyTable_io_allocReq_2_bits = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 431:36]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 36:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
      robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 357:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 364:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      robWritten_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
      robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 357:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 364:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      robWritten_1 <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
      robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 357:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 364:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      robWritten_2 <= _GEN_6;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
      lsqWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      lsqWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 358:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      lsqWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 365:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      lsqWritten_0 <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
      lsqWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      lsqWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 358:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      lsqWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 365:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      lsqWritten_1 <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
      lsqWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 38:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      lsqWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 358:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      lsqWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 365:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      lsqWritten_2 <= _GEN_7;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 359:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 366:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      iqSent_0 <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 359:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 366:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      iqSent_1 <= _GEN_5;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:28]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 359:21]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 366:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 371:28]
      iqSent_2 <= _GEN_8;
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_mulOp <= io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_divOp <= io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_excpVec <= io_in_0_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_ldst <= io_in_0_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_lrs1 <= io_in_0_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_lrs2 <= io_in_0_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_pdst <= io_in_0_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_prs1 <= io_in_0_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_prs2 <= io_in_0_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_oldPdst <= io_in_0_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_0_robIdx <= io_in_0_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_mulOp <= io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_divOp <= io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_excpVec <= io_in_1_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_ldst <= io_in_1_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_lrs1 <= io_in_1_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_lrs2 <= io_in_1_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_pdst <= io_in_1_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_prs1 <= io_in_1_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_prs2 <= io_in_1_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_oldPdst <= io_in_1_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_1_robIdx <= io_in_1_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_mulOp <= io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_divOp <= io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_excpVec <= io_in_2_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_ldst <= io_in_2_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_lrs1 <= io_in_2_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_lrs2 <= io_in_2_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_pdst <= io_in_2_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_prs1 <= io_in_2_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_prs2 <= io_in_2_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_oldPdst <= io_in_2_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 354:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:22]
        stgData_2_robIdx <= io_in_2_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 367:21]
      end
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_0) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgLqIdx_0 <= lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 408:21]
      end else begin
        stgLqIdx_0 <= _GEN_208;
      end
    end else begin
      stgLqIdx_0 <= _GEN_208;
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_1) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgLqIdx_1 <= lqIndices_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 408:21]
      end else begin
        stgLqIdx_1 <= _GEN_250;
      end
    end else begin
      stgLqIdx_1 <= _GEN_250;
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_2) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgLqIdx_2 <= lqIndices_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 408:21]
      end else begin
        stgLqIdx_2 <= _GEN_292;
      end
    end else begin
      stgLqIdx_2 <= _GEN_292;
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_0) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgSqIdx_0 <= sqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 409:21]
      end else begin
        stgSqIdx_0 <= _GEN_209;
      end
    end else begin
      stgSqIdx_0 <= _GEN_209;
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_1) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgSqIdx_1 <= sqIndices_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 409:21]
      end else begin
        stgSqIdx_1 <= _GEN_251;
      end
    end else begin
      stgSqIdx_1 <= _GEN_251;
    end
    if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 405:22]
      if (needLsq_2) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 407:24]
        stgSqIdx_2 <= sqIndices_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 409:21]
      end else begin
        stgSqIdx_2 <= _GEN_293;
      end
    end else begin
      stgSqIdx_2 <= _GEN_293;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 382:26]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 382:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 389:39]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 390:15]
    end else if (dispatchFire & anyNeedLsq) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 385:36]
      lqHeadPtr <= _lqHeadPtr_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 386:15]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 383:26]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 383:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 389:39]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 391:15]
    end else if (dispatchFire & anyNeedLsq) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 385:36]
      sqHeadPtr <= _sqHeadPtr_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 387:15]
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
  laneValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  laneValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  laneValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  robWritten_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  robWritten_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  robWritten_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  lsqWritten_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  lsqWritten_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  lsqWritten_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  iqSent_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  iqSent_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  iqSent_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_pc = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_inst = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_mulOp = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_divOp = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_excpVec = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_imm = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_33[13:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_ldst = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_lrs1 = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_0_lrs2 = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_0_pdst = _RAND_44[6:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_0_prs1 = _RAND_45[6:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_0_prs2 = _RAND_46[6:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_0_oldPdst = _RAND_47[6:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_0_robIdx = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_1_pc = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_1_inst = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_ctrl_mulOp = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_ctrl_divOp = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_excpVec = _RAND_71[9:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_imm = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_73[13:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_ldst = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_1_lrs1 = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_1_lrs2 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_1_pdst = _RAND_84[6:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_1_prs1 = _RAND_85[6:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_1_prs2 = _RAND_86[6:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_1_oldPdst = _RAND_87[6:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_1_robIdx = _RAND_91[5:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_2_pc = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_2_inst = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_94[3:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_95[4:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_96[3:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_2_ctrl_mulOp = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_2_ctrl_divOp = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_101[2:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_103[3:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_excpVec = _RAND_111[9:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_imm = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_113[13:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  stgData_2_ldst = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  stgData_2_lrs1 = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  stgData_2_lrs2 = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  stgData_2_pdst = _RAND_124[6:0];
  _RAND_125 = {1{`RANDOM}};
  stgData_2_prs1 = _RAND_125[6:0];
  _RAND_126 = {1{`RANDOM}};
  stgData_2_prs2 = _RAND_126[6:0];
  _RAND_127 = {1{`RANDOM}};
  stgData_2_oldPdst = _RAND_127[6:0];
  _RAND_128 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  stgData_2_robIdx = _RAND_131[5:0];
  _RAND_132 = {1{`RANDOM}};
  stgLqIdx_0 = _RAND_132[3:0];
  _RAND_133 = {1{`RANDOM}};
  stgLqIdx_1 = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  stgLqIdx_2 = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  stgSqIdx_0 = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  stgSqIdx_1 = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  stgSqIdx_2 = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  lqHeadPtr = _RAND_138[3:0];
  _RAND_139 = {1{`RANDOM}};
  sqHeadPtr = _RAND_139[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
