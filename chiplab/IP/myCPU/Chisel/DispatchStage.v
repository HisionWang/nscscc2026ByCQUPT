module DispatchStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [9:0]  io_in_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [5:0]  io_in_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_in_1_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [9:0]  io_in_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [5:0]  io_in_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_in_2_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_2_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [9:0]  io_in_2_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_2_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_2_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [4:0]  io_in_2_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_2_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_2_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [6:0]  io_in_2_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input  [5:0]  io_in_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_aluIQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_aluIQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_aluIQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_aluIQEnq_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_aluIQEnq_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_aluIQEnq_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_aluIQEnq_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_aluIQEnq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_aluIQEnq_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_aluIQEnq_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_aluIQEnq_1_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_aluIQEnq_1_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_bruIQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_bruIQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_bruIQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_bruIQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_bruIQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_bruIQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_bruIQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_bruIQEnq_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_bruIQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_bruIQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_bruIQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_bruIQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_bruIQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_bruIQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_bruIQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_bruIQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_bruIQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_bruIQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_bruIQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_bruIQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_bruIQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_bruIQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_bruIQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_bruIQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_bruIQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_mulDivIQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_mulDivIQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_mulDivIQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_mulDivIQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_mulDivIQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_mulDivIQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_mulDivIQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_mulDivIQEnq_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_mulDivIQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_mulDivIQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_mulDivIQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_mulDivIQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_mulDivIQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_mulDivIQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_mulDivIQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_mulDivIQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_mulDivIQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_mulDivIQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_mulDivIQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_mulDivIQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_mulDivIQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_mulDivIQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_mulDivIQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_mulDivIQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_mulDivIQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_loadStaIQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_loadStaIQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_loadStaIQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_0_bits_isSta, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_loadStaIQEnq_1_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_loadStaIQEnq_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_loadStaIQEnq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_loadStaIQEnq_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_loadStaIQEnq_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_loadStaIQEnq_1_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_loadStaIQEnq_1_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_loadStaIQEnq_1_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_loadStaIQEnq_1_bits_isSta, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_stdIQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_stdIQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_stdIQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_stdIQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_stdIQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_stdIQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_stdIQEnq_0_bits_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [13:0] io_stdIQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_stdIQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_stdIQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_stdIQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_stdIQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_stdIQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_stdIQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_stdIQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_stdIQEnq_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_stdIQEnq_0_bits_robIdxFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_stdIQEnq_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [2:0]  io_stdIQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_stdIQEnq_0_bits_isStd, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_lsEnq_req_0_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_0_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_0_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_0_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_0_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_lsEnq_req_1_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_1_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_1_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_1_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_1_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [5:0]  io_lsEnq_req_2_bits_robIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_2_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_lsEnq_req_2_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_2_bits_sqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_lsEnq_req_2_bits_lqIdx, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valid_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valid_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valid_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valids_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valids_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_valids_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_0_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_0_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_0_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_0_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_robEnq_bits_0_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_0_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_0_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_0_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_0_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_robEnq_bits_0_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_robEnq_bits_0_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_1_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_1_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_1_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_1_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_robEnq_bits_1_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_1_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_1_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_1_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_1_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_robEnq_bits_1_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_robEnq_bits_1_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_2_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [31:0] io_robEnq_bits_2_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_2_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [6:0]  io_robEnq_bits_2_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [4:0]  io_robEnq_bits_2_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_2_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_2_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_2_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output        io_robEnq_bits_2_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [9:0]  io_robEnq_bits_2_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  output [3:0]  io_robEnq_bits_2_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_robEnq_canEnq, // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
  input         io_redirect_valid // @[src/main/scala/backend/dispatch/DispatchStage.scala 10:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  busyTable_clock; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_reset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_readReq_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_allocReq_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_allocReq_0_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_allocReq_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_allocReq_1_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire  busyTable_io_allocReq_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  wire [6:0] busyTable_io_allocReq_2_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
  reg  stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 20:26]
  reg  laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
  reg  laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
  reg  laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
  reg  iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
  reg  iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
  reg  iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_0_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [9:0] stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [5:0] stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_1_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [9:0] stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_1_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_1_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [5:0] stgData_1_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_2_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [9:0] stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_2_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [4:0] stgData_2_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [6:0] stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  reg [5:0] stgData_2_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 23:22]
  wire  lanePending_0 = laneValid_0 & ~iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:76]
  wire  lanePending_1 = laneValid_1 & ~iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:76]
  wire  lanePending_2 = laneValid_2 & ~iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:76]
  wire  allLanesDone = (~laneValid_0 | iqSent_0) & (~laneValid_1 | iqSent_1) & (~laneValid_2 | iqSent_2); // @[src/main/scala/backend/dispatch/DispatchStage.scala 29:84]
  wire  isAluLane_0 = lanePending_0 & stgData_0_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 33:20]
  wire  isAluLane_1 = lanePending_1 & stgData_1_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 33:20]
  wire  isAluLane_2 = lanePending_2 & stgData_2_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 33:20]
  wire  isBruLane_0 = lanePending_0 & stgData_0_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:20]
  wire  isBruLane_1 = lanePending_1 & stgData_1_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:20]
  wire  isBruLane_2 = lanePending_2 & stgData_2_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 35:20]
  wire  isCsrLane_0 = lanePending_0 & (stgData_0_ctrl_fuType == 4'h4 | stgData_0_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:20]
  wire  isCsrLane_1 = lanePending_1 & (stgData_1_ctrl_fuType == 4'h4 | stgData_1_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:20]
  wire  isCsrLane_2 = lanePending_2 & (stgData_2_ctrl_fuType == 4'h4 | stgData_2_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 37:20]
  wire  isMulDivLane_0 = lanePending_0 & stgData_0_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:20]
  wire  isMulDivLane_1 = lanePending_1 & stgData_1_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:20]
  wire  isMulDivLane_2 = lanePending_2 & stgData_2_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 39:20]
  wire  _isLoadLane_T_1 = lanePending_0 & stgData_0_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:20]
  wire  isLoadLane_0 = lanePending_0 & stgData_0_ctrl_fuType == 4'h3 & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  wire  _isLoadLane_T_4 = lanePending_1 & stgData_1_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:20]
  wire  isLoadLane_1 = lanePending_1 & stgData_1_ctrl_fuType == 4'h3 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  wire  _isLoadLane_T_7 = lanePending_2 & stgData_2_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:20]
  wire  isLoadLane_2 = lanePending_2 & stgData_2_ctrl_fuType == 4'h3 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  wire  isStoreLane_0 = _isLoadLane_T_1 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  wire  isStoreLane_1 = _isLoadLane_T_4 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  wire  isStoreLane_2 = _isLoadLane_T_7 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  wire  isBruTargetLane_0 = isBruLane_0 | isCsrLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 47:18]
  wire  isBruTargetLane_1 = isBruLane_1 | isCsrLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 47:18]
  wire  isBruTargetLane_2 = isBruLane_2 | isCsrLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 47:18]
  wire  isLoadStaLane_0 = isLoadLane_0 | isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:19]
  wire  isLoadStaLane_1 = isLoadLane_1 | isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:19]
  wire  isLoadStaLane_2 = isLoadLane_2 | isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 51:19]
  wire [1:0] _GEN_597 = {{1'd0}, isAluLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire [2:0] _aluAccepted_T_1 = {{1'd0}, _GEN_597}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  aluAccepted_1 = isAluLane_1 & _aluAccepted_T_1[1:0] < 2'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _aluAccepted_T_3 = isAluLane_1 & aluAccepted_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _GEN_598 = {{1'd0}, _aluAccepted_T_3}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire [1:0] _aluAccepted_T_5 = _aluAccepted_T_1[1:0] + _GEN_598; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  aluAccepted_2 = isAluLane_2 & _aluAccepted_T_5 < 2'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _aluAccepted_T_6 = isAluLane_2 & aluAccepted_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _bruAccepted_T_1 = {{1'd0}, isBruTargetLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  bruAccepted_1 = isBruTargetLane_1 & _bruAccepted_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _bruAccepted_T_3 = isBruTargetLane_1 & bruAccepted_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire  _bruAccepted_T_5 = _bruAccepted_T_1[0] + _bruAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  bruAccepted_2 = isBruTargetLane_2 & _bruAccepted_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _bruAccepted_T_6 = isBruTargetLane_2 & bruAccepted_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _mulDivAccepted_T_1 = {{1'd0}, isMulDivLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  mulDivAccepted_1 = isMulDivLane_1 & _mulDivAccepted_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _mulDivAccepted_T_3 = isMulDivLane_1 & mulDivAccepted_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire  _mulDivAccepted_T_5 = _mulDivAccepted_T_1[0] + _mulDivAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  mulDivAccepted_2 = isMulDivLane_2 & _mulDivAccepted_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _mulDivAccepted_T_6 = isMulDivLane_2 & mulDivAccepted_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _GEN_600 = {{1'd0}, isLoadStaLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire [2:0] _loadStaAccepted_T_1 = {{1'd0}, _GEN_600}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  loadStaAccepted_1 = isLoadStaLane_1 & _loadStaAccepted_T_1[1:0] < 2'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _loadStaAccepted_T_3 = isLoadStaLane_1 & loadStaAccepted_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _GEN_601 = {{1'd0}, _loadStaAccepted_T_3}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire [1:0] _loadStaAccepted_T_5 = _loadStaAccepted_T_1[1:0] + _GEN_601; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  loadStaAccepted_2 = isLoadStaLane_2 & _loadStaAccepted_T_5 < 2'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _loadStaAccepted_T_6 = isLoadStaLane_2 & loadStaAccepted_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire [1:0] _stdAccepted_T_1 = {{1'd0}, isStoreLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  stdAccepted_1 = isStoreLane_1 & _stdAccepted_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _stdAccepted_T_3 = isStoreLane_1 & stdAccepted_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire  _stdAccepted_T_5 = _stdAccepted_T_1[0] + _stdAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:21]
  wire  stdAccepted_2 = isStoreLane_2 & _stdAccepted_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:31]
  wire  _stdAccepted_T_6 = isStoreLane_2 & stdAccepted_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 64:35]
  wire  _dispatchMask_T_2 = isAluLane_0 | isBruTargetLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:48]
  wire  _dispatchMask_T_4 = _dispatchMask_T_2 | isMulDivLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:48]
  wire  _dispatchMask_T_6 = _dispatchMask_T_4 | isLoadStaLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:48]
  wire  dispatchMask_0 = _dispatchMask_T_6 | isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:48]
  wire  _dispatchMask_T_11 = _aluAccepted_T_3 | _bruAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:48]
  wire  _dispatchMask_T_13 = _dispatchMask_T_11 | _mulDivAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:48]
  wire  _dispatchMask_T_15 = _dispatchMask_T_13 | _loadStaAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:48]
  wire  dispatchMask_1 = _dispatchMask_T_15 | _stdAccepted_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:48]
  wire  _dispatchMask_T_20 = _aluAccepted_T_6 | _bruAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:48]
  wire  _dispatchMask_T_22 = _dispatchMask_T_20 | _mulDivAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:48]
  wire  _dispatchMask_T_24 = _dispatchMask_T_22 | _loadStaAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:48]
  wire  dispatchMask_2 = _dispatchMask_T_24 | _stdAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:48]
  wire [1:0] _aluDispatchCount_T_3 = _aluAccepted_T_3 + _aluAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:38]
  wire [2:0] _aluDispatchCount_T_5 = _GEN_597 + _aluDispatchCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:38]
  wire [1:0] aluDispatchCount = _aluDispatchCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:38]
  wire [1:0] _bruDispatchCount_T_3 = _bruAccepted_T_3 + _bruAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 86:38]
  wire [2:0] _bruDispatchCount_T_5 = _bruAccepted_T_1 + _bruDispatchCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 86:38]
  wire [1:0] bruDispatchCount = _bruDispatchCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 86:38]
  wire [1:0] _mulDivDispatchCount_T_3 = _mulDivAccepted_T_3 + _mulDivAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 87:38]
  wire [2:0] _mulDivDispatchCount_T_5 = _mulDivAccepted_T_1 + _mulDivDispatchCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 87:38]
  wire [1:0] mulDivDispatchCount = _mulDivDispatchCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 87:38]
  wire [1:0] _loadStaDispatchCount_T_3 = _loadStaAccepted_T_3 + _loadStaAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:38]
  wire [2:0] _loadStaDispatchCount_T_5 = _GEN_600 + _loadStaDispatchCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:38]
  wire [1:0] loadStaDispatchCount = _loadStaDispatchCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:38]
  wire [1:0] _stdDispatchCount_T_3 = _stdAccepted_T_3 + _stdAccepted_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 89:38]
  wire [2:0] _stdDispatchCount_T_5 = _stdAccepted_T_1 + _stdDispatchCount_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 89:38]
  wire [1:0] stdDispatchCount = _stdDispatchCount_T_5[1:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 89:38]
  wire  _iqReady_T_1 = bruDispatchCount <= 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 93:38]
  wire  _iqReady_T_2 = aluDispatchCount <= 2'h2 & _iqReady_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 92:68]
  wire  _iqReady_T_3 = mulDivDispatchCount <= 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:38]
  wire  _iqReady_T_4 = _iqReady_T_2 & _iqReady_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 93:68]
  wire  _iqReady_T_5 = loadStaDispatchCount <= 2'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:38]
  wire  _iqReady_T_6 = _iqReady_T_4 & _iqReady_T_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 94:71]
  wire  _iqReady_T_7 = stdDispatchCount <= 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:38]
  wire  iqReady = _iqReady_T_6 & _iqReady_T_7; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:72]
  wire  _hasAccepted_T = dispatchMask_0 & lanePending_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:74]
  wire  _hasAccepted_T_1 = dispatchMask_1 & lanePending_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:74]
  wire  _hasAccepted_T_2 = dispatchMask_2 & lanePending_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:74]
  wire  hasAccepted = dispatchMask_0 & lanePending_0 | dispatchMask_1 & lanePending_1 | dispatchMask_2 & lanePending_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 108:90]
  wire  dispatchFire = stgValid & hasAccepted & iqReady & io_robEnq_canEnq; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:69]
  wire  canAcceptNew = ~stgValid | allLanesDone; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:32]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 116:45]
  wire  inFire = inValid & canAcceptNew; // @[src/main/scala/backend/dispatch/DispatchStage.scala 117:25]
  wire  willStillBePending_0 = lanePending_0 & ~dispatchMask_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 125:20]
  wire  willStillBePending_1 = lanePending_1 & ~dispatchMask_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 125:20]
  wire  willStillBePending_2 = lanePending_2 & ~dispatchMask_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 125:20]
  wire  _GEN_0 = _hasAccepted_T | iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:47 147:19 22:26]
  wire  _GEN_1 = _hasAccepted_T_1 | iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:47 147:19 22:26]
  wire  _GEN_2 = _hasAccepted_T_2 | iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:47 147:19 22:26]
  wire [2:0] _stgValid_T = {willStillBePending_2,willStillBePending_1,willStillBePending_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 151:36]
  wire  _GEN_6 = dispatchFire ? |_stgValid_T : stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 143:28 151:14 20:26]
  wire  _GEN_7 = inFire | _GEN_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22 137:14]
  reg [3:0] lqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 162:26]
  reg [3:0] sqHeadPtr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 163:26]
  wire  _lqHeadPtr_T = isLoadLane_0 & dispatchMask_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 167:21]
  wire  _lqHeadPtr_T_1 = isLoadLane_1 & dispatchMask_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 167:21]
  wire  _lqHeadPtr_T_2 = isLoadLane_2 & dispatchMask_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 167:21]
  wire [1:0] _lqHeadPtr_T_3 = _lqHeadPtr_T_1 + _lqHeadPtr_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:38]
  wire [1:0] _GEN_608 = {{1'd0}, _lqHeadPtr_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:38]
  wire [2:0] _lqHeadPtr_T_5 = _GEN_608 + _lqHeadPtr_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:38]
  wire [3:0] _GEN_609 = {{2'd0}, _lqHeadPtr_T_5[1:0]}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:28]
  wire [3:0] _lqHeadPtr_T_8 = lqHeadPtr + _GEN_609; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:28]
  wire  _sqHeadPtr_T = isStoreLane_0 & dispatchMask_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:22]
  wire  _sqHeadPtr_T_1 = isStoreLane_1 & dispatchMask_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:22]
  wire  _sqHeadPtr_T_2 = isStoreLane_2 & dispatchMask_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:22]
  wire [1:0] _sqHeadPtr_T_3 = _sqHeadPtr_T_1 + _sqHeadPtr_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:38]
  wire [1:0] _GEN_610 = {{1'd0}, _sqHeadPtr_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:38]
  wire [2:0] _sqHeadPtr_T_5 = _GEN_610 + _sqHeadPtr_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:38]
  wire [3:0] _GEN_611 = {{2'd0}, _sqHeadPtr_T_5[1:0]}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:28]
  wire [3:0] _sqHeadPtr_T_8 = sqHeadPtr + _GEN_611; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:28]
  wire [4:0] _lqIndices_0_T = {{1'd0}, lqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  wire [3:0] lqIndices_0 = _lqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  wire [4:0] _sqIndices_0_T = {{1'd0}, sqHeadPtr}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  wire [3:0] sqIndices_0 = _sqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  wire [3:0] _GEN_612 = {{3'd0}, _lqHeadPtr_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:25]
  wire [4:0] _T_6 = {{1'd0}, _GEN_612}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:25]
  wire [3:0] _GEN_613 = {{3'd0}, _sqHeadPtr_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:25]
  wire [4:0] _T_9 = {{1'd0}, _GEN_613}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:25]
  wire [3:0] lqIndices_1 = lqHeadPtr + _T_6[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  wire [3:0] sqIndices_1 = sqHeadPtr + _T_9[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  wire [3:0] _GEN_614 = {{3'd0}, _lqHeadPtr_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:25]
  wire [3:0] _T_13 = _T_6[3:0] + _GEN_614; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:25]
  wire [3:0] _GEN_615 = {{3'd0}, _sqHeadPtr_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:25]
  wire [3:0] _T_16 = _T_9[3:0] + _GEN_615; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:25]
  wire [3:0] lqIndices_2 = lqHeadPtr + _T_13; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  wire [3:0] sqIndices_2 = sqHeadPtr + _T_16; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  wire  _busyTable_io_allocReq_0_valid_T_1 = dispatchFire & dispatchMask_0 & lanePending_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:71]
  wire  _busyTable_io_allocReq_1_valid_T_1 = dispatchFire & dispatchMask_1 & lanePending_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:71]
  wire  _busyTable_io_allocReq_2_valid_T_1 = dispatchFire & dispatchMask_2 & lanePending_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 198:71]
  wire [6:0] aluUops_0_robIdxFull = {1'h0,stgData_0_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 235:24]
  wire  prs1BusyRaw_0 = busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 209:{28,28}]
  wire  aluUops_0_prs1Busy = stgData_0_rs1Valid & stgData_0_lrs1 != 5'h0 & prs1BusyRaw_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:24]
  wire  prs2BusyRaw_0 = busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 210:{28,28}]
  wire  aluUops_0_prs2Busy = stgData_0_rs2Valid & stgData_0_lrs2 != 5'h0 & prs2BusyRaw_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 241:24]
  wire [6:0] aluUops_1_robIdxFull = {1'h0,stgData_1_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 235:24]
  wire  prs1BusyRaw_1 = busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 209:{28,28}]
  wire  aluUops_1_prs1Busy = stgData_1_rs1Valid & stgData_1_lrs1 != 5'h0 & prs1BusyRaw_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:24]
  wire  prs2BusyRaw_1 = busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 210:{28,28}]
  wire  aluUops_1_prs2Busy = stgData_1_rs2Valid & stgData_1_lrs2 != 5'h0 & prs2BusyRaw_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 241:24]
  wire [6:0] aluUops_2_robIdxFull = {1'h0,stgData_2_robIdx}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 235:24]
  wire  prs1BusyRaw_2 = busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 209:{28,28}]
  wire  aluUops_2_prs1Busy = stgData_2_rs1Valid & stgData_2_lrs1 != 5'h0 & prs1BusyRaw_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:24]
  wire  prs2BusyRaw_2 = busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 210:{28,28}]
  wire  aluUops_2_prs2Busy = stgData_2_rs2Valid & stgData_2_lrs2 != 5'h0 & prs2BusyRaw_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 241:24]
  wire  matchOH__1 = _aluAccepted_T_3 & _aluAccepted_T_1[1:0] == 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 302:38]
  wire  matchOH__2 = _aluAccepted_T_6 & _aluAccepted_T_5 == 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 302:38]
  wire [2:0] _T_32 = {matchOH__2,matchOH__1,isAluLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:18]
  wire [6:0] _io_aluIQEnq_0_bits_T_35 = isAluLane_0 ? aluUops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_36 = matchOH__1 ? aluUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_37 = matchOH__2 ? aluUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_38 = _io_aluIQEnq_0_bits_T_35 | _io_aluIQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_0_bits_T_40 = isAluLane_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_0_bits_T_41 = matchOH__1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_0_bits_T_42 = matchOH__2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_0_bits_T_43 = _io_aluIQEnq_0_bits_T_40 | _io_aluIQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_60 = isAluLane_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_61 = matchOH__1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_62 = matchOH__2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_63 = _io_aluIQEnq_0_bits_T_60 | _io_aluIQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_65 = isAluLane_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_66 = matchOH__1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_67 = matchOH__2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_68 = _io_aluIQEnq_0_bits_T_65 | _io_aluIQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_70 = isAluLane_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_71 = matchOH__1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_72 = matchOH__2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_73 = _io_aluIQEnq_0_bits_T_70 | _io_aluIQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_75 = isAluLane_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_76 = matchOH__1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_77 = matchOH__2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_0_bits_T_78 = _io_aluIQEnq_0_bits_T_75 | _io_aluIQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_80 = isAluLane_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_81 = matchOH__1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_82 = matchOH__2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_83 = _io_aluIQEnq_0_bits_T_80 | _io_aluIQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_85 = isAluLane_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_86 = matchOH__1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_87 = matchOH__2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_88 = _io_aluIQEnq_0_bits_T_85 | _io_aluIQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_90 = isAluLane_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_91 = matchOH__1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_92 = matchOH__2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_93 = _io_aluIQEnq_0_bits_T_90 | _io_aluIQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_95 = isAluLane_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_96 = matchOH__1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_97 = matchOH__2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_98 = _io_aluIQEnq_0_bits_T_95 | _io_aluIQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_0_bits_T_130 = isAluLane_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_0_bits_T_131 = matchOH__1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_0_bits_T_132 = matchOH__2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_0_bits_T_133 = _io_aluIQEnq_0_bits_T_130 | _io_aluIQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_135 = isAluLane_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_136 = matchOH__1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_137 = matchOH__2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_138 = _io_aluIQEnq_0_bits_T_135 | _io_aluIQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_0_bits_T_140 = isAluLane_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_0_bits_T_141 = matchOH__1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_0_bits_T_142 = matchOH__2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_0_bits_T_143 = _io_aluIQEnq_0_bits_T_140 | _io_aluIQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_180 = isAluLane_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_181 = matchOH__1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_182 = matchOH__2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_183 = _io_aluIQEnq_0_bits_T_180 | _io_aluIQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_185 = isAluLane_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_186 = matchOH__1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_187 = matchOH__2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_188 = _io_aluIQEnq_0_bits_T_185 | _io_aluIQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_190 = isAluLane_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_191 = matchOH__1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_192 = matchOH__2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_193 = _io_aluIQEnq_0_bits_T_190 | _io_aluIQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_195 = isAluLane_0 ? stgData_0_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_196 = matchOH__1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_197 = matchOH__2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_198 = _io_aluIQEnq_0_bits_T_195 | _io_aluIQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_200 = isAluLane_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_201 = matchOH__1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_202 = matchOH__2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_0_bits_T_203 = _io_aluIQEnq_0_bits_T_200 | _io_aluIQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_205 = isAluLane_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_206 = matchOH__1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_207 = matchOH__2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_208 = _io_aluIQEnq_0_bits_T_205 | _io_aluIQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_210 = isAluLane_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_211 = matchOH__1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_212 = matchOH__2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_213 = _io_aluIQEnq_0_bits_T_210 | _io_aluIQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_215 = isAluLane_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_216 = matchOH__1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_217 = matchOH__2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_0_bits_T_218 = _io_aluIQEnq_0_bits_T_215 | _io_aluIQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_220 = isAluLane_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_221 = matchOH__1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_222 = matchOH__2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_0_bits_T_223 = _io_aluIQEnq_0_bits_T_220 | _io_aluIQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_225 = isAluLane_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_226 = matchOH__1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_227 = matchOH__2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_228 = _io_aluIQEnq_0_bits_T_225 | _io_aluIQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_230 = isAluLane_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_231 = matchOH__1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_232 = matchOH__2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_0_bits_T_233 = _io_aluIQEnq_0_bits_T_230 | _io_aluIQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  matchOH_1_1 = _aluAccepted_T_3 & _aluAccepted_T_1[1:0] == 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 302:38]
  wire  matchOH_1_2 = _aluAccepted_T_6 & _aluAccepted_T_5 == 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 302:38]
  wire [2:0] _T_35 = {matchOH_1_2,matchOH_1_1,1'h0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:18]
  wire [6:0] _io_aluIQEnq_1_bits_T_36 = matchOH_1_1 ? aluUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_37 = matchOH_1_2 ? aluUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_1_bits_T_41 = matchOH_1_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_aluIQEnq_1_bits_T_42 = matchOH_1_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_61 = matchOH_1_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_62 = matchOH_1_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_66 = matchOH_1_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_67 = matchOH_1_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_71 = matchOH_1_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_72 = matchOH_1_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_76 = matchOH_1_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_aluIQEnq_1_bits_T_77 = matchOH_1_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_81 = matchOH_1_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_82 = matchOH_1_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_86 = matchOH_1_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_87 = matchOH_1_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_91 = matchOH_1_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_92 = matchOH_1_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_96 = matchOH_1_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_97 = matchOH_1_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_1_bits_T_131 = matchOH_1_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_aluIQEnq_1_bits_T_132 = matchOH_1_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_136 = matchOH_1_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_137 = matchOH_1_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_1_bits_T_141 = matchOH_1_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_aluIQEnq_1_bits_T_142 = matchOH_1_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_181 = matchOH_1_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_182 = matchOH_1_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_186 = matchOH_1_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_187 = matchOH_1_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_191 = matchOH_1_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_192 = matchOH_1_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_196 = matchOH_1_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_197 = matchOH_1_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_201 = matchOH_1_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_aluIQEnq_1_bits_T_202 = matchOH_1_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_206 = matchOH_1_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_207 = matchOH_1_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_211 = matchOH_1_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_212 = matchOH_1_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_216 = matchOH_1_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_aluIQEnq_1_bits_T_217 = matchOH_1_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_221 = matchOH_1_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_aluIQEnq_1_bits_T_222 = matchOH_1_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_226 = matchOH_1_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_227 = matchOH_1_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_231 = matchOH_1_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_aluIQEnq_1_bits_T_232 = matchOH_1_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  matchOH_2_1 = _bruAccepted_T_3 & ~_bruAccepted_T_1[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 321:44]
  wire  matchOH_2_2 = _bruAccepted_T_6 & ~_bruAccepted_T_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 321:44]
  wire [2:0] _T_47 = {matchOH_2_2,matchOH_2_1,isBruTargetLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 323:18]
  wire [6:0] _io_bruIQEnq_0_bits_T_35 = isBruTargetLane_0 ? aluUops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_36 = matchOH_2_1 ? aluUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_37 = matchOH_2_2 ? aluUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_38 = _io_bruIQEnq_0_bits_T_35 | _io_bruIQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_bruIQEnq_0_bits_T_40 = isBruTargetLane_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_bruIQEnq_0_bits_T_41 = matchOH_2_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_bruIQEnq_0_bits_T_42 = matchOH_2_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_bruIQEnq_0_bits_T_43 = _io_bruIQEnq_0_bits_T_40 | _io_bruIQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_60 = isBruTargetLane_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_61 = matchOH_2_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_62 = matchOH_2_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_63 = _io_bruIQEnq_0_bits_T_60 | _io_bruIQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_65 = isBruTargetLane_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_66 = matchOH_2_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_67 = matchOH_2_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_68 = _io_bruIQEnq_0_bits_T_65 | _io_bruIQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_70 = isBruTargetLane_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_71 = matchOH_2_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_72 = matchOH_2_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_73 = _io_bruIQEnq_0_bits_T_70 | _io_bruIQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_75 = isBruTargetLane_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_76 = matchOH_2_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_77 = matchOH_2_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_bruIQEnq_0_bits_T_78 = _io_bruIQEnq_0_bits_T_75 | _io_bruIQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_80 = isBruTargetLane_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_81 = matchOH_2_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_82 = matchOH_2_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_83 = _io_bruIQEnq_0_bits_T_80 | _io_bruIQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_85 = isBruTargetLane_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_86 = matchOH_2_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_87 = matchOH_2_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_88 = _io_bruIQEnq_0_bits_T_85 | _io_bruIQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_90 = isBruTargetLane_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_91 = matchOH_2_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_92 = matchOH_2_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_93 = _io_bruIQEnq_0_bits_T_90 | _io_bruIQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_95 = isBruTargetLane_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_96 = matchOH_2_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_97 = matchOH_2_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_98 = _io_bruIQEnq_0_bits_T_95 | _io_bruIQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_bruIQEnq_0_bits_T_130 = isBruTargetLane_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_bruIQEnq_0_bits_T_131 = matchOH_2_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_bruIQEnq_0_bits_T_132 = matchOH_2_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_bruIQEnq_0_bits_T_133 = _io_bruIQEnq_0_bits_T_130 | _io_bruIQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_135 = isBruTargetLane_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_136 = matchOH_2_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_137 = matchOH_2_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_138 = _io_bruIQEnq_0_bits_T_135 | _io_bruIQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_bruIQEnq_0_bits_T_140 = isBruTargetLane_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_bruIQEnq_0_bits_T_141 = matchOH_2_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_bruIQEnq_0_bits_T_142 = matchOH_2_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_bruIQEnq_0_bits_T_143 = _io_bruIQEnq_0_bits_T_140 | _io_bruIQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_180 = isBruTargetLane_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_181 = matchOH_2_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_182 = matchOH_2_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_183 = _io_bruIQEnq_0_bits_T_180 | _io_bruIQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_185 = isBruTargetLane_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_186 = matchOH_2_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_187 = matchOH_2_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_188 = _io_bruIQEnq_0_bits_T_185 | _io_bruIQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_190 = isBruTargetLane_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_191 = matchOH_2_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_192 = matchOH_2_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_193 = _io_bruIQEnq_0_bits_T_190 | _io_bruIQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_195 = isBruTargetLane_0 ? stgData_0_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_196 = matchOH_2_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_197 = matchOH_2_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_198 = _io_bruIQEnq_0_bits_T_195 | _io_bruIQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_200 = isBruTargetLane_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_201 = matchOH_2_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_202 = matchOH_2_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_bruIQEnq_0_bits_T_203 = _io_bruIQEnq_0_bits_T_200 | _io_bruIQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_205 = isBruTargetLane_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_206 = matchOH_2_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_207 = matchOH_2_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_208 = _io_bruIQEnq_0_bits_T_205 | _io_bruIQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_210 = isBruTargetLane_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_211 = matchOH_2_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_212 = matchOH_2_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_213 = _io_bruIQEnq_0_bits_T_210 | _io_bruIQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_215 = isBruTargetLane_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_216 = matchOH_2_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_217 = matchOH_2_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_bruIQEnq_0_bits_T_218 = _io_bruIQEnq_0_bits_T_215 | _io_bruIQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_220 = isBruTargetLane_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_221 = matchOH_2_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_222 = matchOH_2_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_bruIQEnq_0_bits_T_223 = _io_bruIQEnq_0_bits_T_220 | _io_bruIQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_225 = isBruTargetLane_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_226 = matchOH_2_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_227 = matchOH_2_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_228 = _io_bruIQEnq_0_bits_T_225 | _io_bruIQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_230 = isBruTargetLane_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_231 = matchOH_2_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_232 = matchOH_2_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_bruIQEnq_0_bits_T_233 = _io_bruIQEnq_0_bits_T_230 | _io_bruIQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  matchOH_3_1 = _mulDivAccepted_T_3 & ~_mulDivAccepted_T_1[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 340:44]
  wire  matchOH_3_2 = _mulDivAccepted_T_6 & ~_mulDivAccepted_T_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 340:44]
  wire [2:0] _T_59 = {matchOH_3_2,matchOH_3_1,isMulDivLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:18]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_35 = isMulDivLane_0 ? aluUops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_36 = matchOH_3_1 ? aluUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_37 = matchOH_3_2 ? aluUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_38 = _io_mulDivIQEnq_0_bits_T_35 | _io_mulDivIQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_mulDivIQEnq_0_bits_T_40 = isMulDivLane_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_mulDivIQEnq_0_bits_T_41 = matchOH_3_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_mulDivIQEnq_0_bits_T_42 = matchOH_3_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_mulDivIQEnq_0_bits_T_43 = _io_mulDivIQEnq_0_bits_T_40 | _io_mulDivIQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_60 = isMulDivLane_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_61 = matchOH_3_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_62 = matchOH_3_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_63 = _io_mulDivIQEnq_0_bits_T_60 | _io_mulDivIQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_65 = isMulDivLane_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_66 = matchOH_3_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_67 = matchOH_3_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_68 = _io_mulDivIQEnq_0_bits_T_65 | _io_mulDivIQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_70 = isMulDivLane_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_71 = matchOH_3_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_72 = matchOH_3_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_73 = _io_mulDivIQEnq_0_bits_T_70 | _io_mulDivIQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_75 = isMulDivLane_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_76 = matchOH_3_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_77 = matchOH_3_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_mulDivIQEnq_0_bits_T_78 = _io_mulDivIQEnq_0_bits_T_75 | _io_mulDivIQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_80 = isMulDivLane_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_81 = matchOH_3_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_82 = matchOH_3_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_83 = _io_mulDivIQEnq_0_bits_T_80 | _io_mulDivIQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_85 = isMulDivLane_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_86 = matchOH_3_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_87 = matchOH_3_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_88 = _io_mulDivIQEnq_0_bits_T_85 | _io_mulDivIQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_90 = isMulDivLane_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_91 = matchOH_3_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_92 = matchOH_3_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_93 = _io_mulDivIQEnq_0_bits_T_90 | _io_mulDivIQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_95 = isMulDivLane_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_96 = matchOH_3_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_97 = matchOH_3_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_98 = _io_mulDivIQEnq_0_bits_T_95 | _io_mulDivIQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_mulDivIQEnq_0_bits_T_130 = isMulDivLane_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_mulDivIQEnq_0_bits_T_131 = matchOH_3_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_mulDivIQEnq_0_bits_T_132 = matchOH_3_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_mulDivIQEnq_0_bits_T_133 = _io_mulDivIQEnq_0_bits_T_130 | _io_mulDivIQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_135 = isMulDivLane_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_136 = matchOH_3_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_137 = matchOH_3_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_138 = _io_mulDivIQEnq_0_bits_T_135 | _io_mulDivIQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_mulDivIQEnq_0_bits_T_140 = isMulDivLane_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_mulDivIQEnq_0_bits_T_141 = matchOH_3_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_mulDivIQEnq_0_bits_T_142 = matchOH_3_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_mulDivIQEnq_0_bits_T_143 = _io_mulDivIQEnq_0_bits_T_140 | _io_mulDivIQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_180 = isMulDivLane_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_181 = matchOH_3_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_182 = matchOH_3_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_183 = _io_mulDivIQEnq_0_bits_T_180 | _io_mulDivIQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_185 = isMulDivLane_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_186 = matchOH_3_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_187 = matchOH_3_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_188 = _io_mulDivIQEnq_0_bits_T_185 | _io_mulDivIQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_190 = isMulDivLane_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_191 = matchOH_3_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_192 = matchOH_3_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_193 = _io_mulDivIQEnq_0_bits_T_190 | _io_mulDivIQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_195 = isMulDivLane_0 ? stgData_0_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_196 = matchOH_3_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_197 = matchOH_3_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_198 = _io_mulDivIQEnq_0_bits_T_195 | _io_mulDivIQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_200 = isMulDivLane_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_201 = matchOH_3_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_202 = matchOH_3_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_mulDivIQEnq_0_bits_T_203 = _io_mulDivIQEnq_0_bits_T_200 | _io_mulDivIQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_205 = isMulDivLane_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_206 = matchOH_3_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_207 = matchOH_3_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_208 = _io_mulDivIQEnq_0_bits_T_205 | _io_mulDivIQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_210 = isMulDivLane_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_211 = matchOH_3_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_212 = matchOH_3_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_213 = _io_mulDivIQEnq_0_bits_T_210 | _io_mulDivIQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_215 = isMulDivLane_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_216 = matchOH_3_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_217 = matchOH_3_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_mulDivIQEnq_0_bits_T_218 = _io_mulDivIQEnq_0_bits_T_215 | _io_mulDivIQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_220 = isMulDivLane_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_221 = matchOH_3_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_222 = matchOH_3_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_mulDivIQEnq_0_bits_T_223 = _io_mulDivIQEnq_0_bits_T_220 | _io_mulDivIQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_225 = isMulDivLane_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_226 = matchOH_3_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_227 = matchOH_3_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_228 = _io_mulDivIQEnq_0_bits_T_225 | _io_mulDivIQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_230 = isMulDivLane_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_231 = matchOH_3_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_232 = matchOH_3_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_mulDivIQEnq_0_bits_T_233 = _io_mulDivIQEnq_0_bits_T_230 | _io_mulDivIQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] loadStaUops_0_pdst = isStoreLane_0 ? 7'h0 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_0_rs2Valid = isStoreLane_0 ? 1'h0 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_0_rdValid = isStoreLane_0 ? 1'h0 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [6:0] loadStaUops_0_robIdxFull = isStoreLane_0 ? aluUops_0_robIdxFull : aluUops_0_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_0_lqIdx = isStoreLane_0 ? 4'h0 : lqIndices_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_0_sqIdx = isStoreLane_0 ? sqIndices_0 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_0_prs1Busy = isStoreLane_0 ? aluUops_0_prs1Busy : aluUops_0_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_0_prs2Busy = isStoreLane_0 ? 1'h0 : aluUops_0_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [6:0] loadStaUops_1_pdst = isStoreLane_1 ? 7'h0 : stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_1_rs2Valid = isStoreLane_1 ? 1'h0 : stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_1_rdValid = isStoreLane_1 ? 1'h0 : stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [6:0] loadStaUops_1_robIdxFull = isStoreLane_1 ? aluUops_1_robIdxFull : aluUops_1_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_1_lqIdx = isStoreLane_1 ? 4'h0 : lqIndices_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_1_sqIdx = isStoreLane_1 ? sqIndices_1 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_1_prs1Busy = isStoreLane_1 ? aluUops_1_prs1Busy : aluUops_1_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_1_prs2Busy = isStoreLane_1 ? 1'h0 : aluUops_1_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [6:0] loadStaUops_2_pdst = isStoreLane_2 ? 7'h0 : stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_2_rs2Valid = isStoreLane_2 ? 1'h0 : stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_2_rdValid = isStoreLane_2 ? 1'h0 : stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [6:0] loadStaUops_2_robIdxFull = isStoreLane_2 ? aluUops_2_robIdxFull : aluUops_2_robIdxFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_2_lqIdx = isStoreLane_2 ? 4'h0 : lqIndices_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire [3:0] loadStaUops_2_sqIdx = isStoreLane_2 ? sqIndices_2 : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_2_prs1Busy = isStoreLane_2 ? aluUops_2_prs1Busy : aluUops_2_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  loadStaUops_2_prs2Busy = isStoreLane_2 ? 1'h0 : aluUops_2_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 356:8]
  wire  matchOH_4_1 = _loadStaAccepted_T_3 & _loadStaAccepted_T_1[1:0] == 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:46]
  wire  matchOH_4_2 = _loadStaAccepted_T_6 & _loadStaAccepted_T_5 == 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:46]
  wire [2:0] _T_71 = {matchOH_4_2,matchOH_4_1,isLoadStaLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:18]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_20 = isLoadStaLane_0 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_21 = matchOH_4_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_22 = matchOH_4_2 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_23 = _io_loadStaIQEnq_0_bits_T_20 | _io_loadStaIQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_25 = isLoadStaLane_0 ? loadStaUops_0_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_26 = matchOH_4_1 ? loadStaUops_1_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_27 = matchOH_4_2 ? loadStaUops_2_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_28 = _io_loadStaIQEnq_0_bits_T_25 | _io_loadStaIQEnq_0_bits_T_26; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_30 = isLoadStaLane_0 ? loadStaUops_0_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_31 = matchOH_4_1 ? loadStaUops_1_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_32 = matchOH_4_2 ? loadStaUops_2_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_33 = _io_loadStaIQEnq_0_bits_T_30 | _io_loadStaIQEnq_0_bits_T_31; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_35 = isLoadStaLane_0 ? loadStaUops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_36 = matchOH_4_1 ? loadStaUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_37 = matchOH_4_2 ? loadStaUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_38 = _io_loadStaIQEnq_0_bits_T_35 | _io_loadStaIQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_0_bits_T_40 = isLoadStaLane_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_0_bits_T_41 = matchOH_4_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_0_bits_T_42 = matchOH_4_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_0_bits_T_43 = _io_loadStaIQEnq_0_bits_T_40 | _io_loadStaIQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_60 = isLoadStaLane_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_61 = matchOH_4_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_62 = matchOH_4_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_63 = _io_loadStaIQEnq_0_bits_T_60 | _io_loadStaIQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_65 = isLoadStaLane_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_66 = matchOH_4_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_67 = matchOH_4_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_68 = _io_loadStaIQEnq_0_bits_T_65 | _io_loadStaIQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_70 = isLoadStaLane_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_71 = matchOH_4_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_72 = matchOH_4_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_73 = _io_loadStaIQEnq_0_bits_T_70 | _io_loadStaIQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_75 = isLoadStaLane_0 ? loadStaUops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_76 = matchOH_4_1 ? loadStaUops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_77 = matchOH_4_2 ? loadStaUops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_0_bits_T_78 = _io_loadStaIQEnq_0_bits_T_75 | _io_loadStaIQEnq_0_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_80 = isLoadStaLane_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_81 = matchOH_4_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_82 = matchOH_4_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_83 = _io_loadStaIQEnq_0_bits_T_80 | _io_loadStaIQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_85 = isLoadStaLane_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_86 = matchOH_4_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_87 = matchOH_4_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_88 = _io_loadStaIQEnq_0_bits_T_85 | _io_loadStaIQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_90 = isLoadStaLane_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_91 = matchOH_4_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_92 = matchOH_4_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_93 = _io_loadStaIQEnq_0_bits_T_90 | _io_loadStaIQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_95 = isLoadStaLane_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_96 = matchOH_4_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_97 = matchOH_4_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_98 = _io_loadStaIQEnq_0_bits_T_95 | _io_loadStaIQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_0_bits_T_130 = isLoadStaLane_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_0_bits_T_131 = matchOH_4_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_0_bits_T_132 = matchOH_4_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_0_bits_T_133 = _io_loadStaIQEnq_0_bits_T_130 | _io_loadStaIQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_135 = isLoadStaLane_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_136 = matchOH_4_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_137 = matchOH_4_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_138 = _io_loadStaIQEnq_0_bits_T_135 | _io_loadStaIQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_0_bits_T_140 = isLoadStaLane_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_0_bits_T_141 = matchOH_4_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_0_bits_T_142 = matchOH_4_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_0_bits_T_143 = _io_loadStaIQEnq_0_bits_T_140 | _io_loadStaIQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_180 = isLoadStaLane_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_181 = matchOH_4_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_182 = matchOH_4_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_183 = _io_loadStaIQEnq_0_bits_T_180 | _io_loadStaIQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_185 = isLoadStaLane_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_186 = matchOH_4_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_187 = matchOH_4_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_188 = _io_loadStaIQEnq_0_bits_T_185 | _io_loadStaIQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_190 = isLoadStaLane_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_191 = matchOH_4_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_192 = matchOH_4_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_193 = _io_loadStaIQEnq_0_bits_T_190 | _io_loadStaIQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_195 = isLoadStaLane_0 ? stgData_0_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_196 = matchOH_4_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_197 = matchOH_4_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_198 = _io_loadStaIQEnq_0_bits_T_195 | _io_loadStaIQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_200 = isLoadStaLane_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_201 = matchOH_4_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_202 = matchOH_4_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_0_bits_T_203 = _io_loadStaIQEnq_0_bits_T_200 | _io_loadStaIQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_205 = isLoadStaLane_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_206 = matchOH_4_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_207 = matchOH_4_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_208 = _io_loadStaIQEnq_0_bits_T_205 | _io_loadStaIQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_210 = isLoadStaLane_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_211 = matchOH_4_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_212 = matchOH_4_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_213 = _io_loadStaIQEnq_0_bits_T_210 | _io_loadStaIQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_215 = isLoadStaLane_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_216 = matchOH_4_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_217 = matchOH_4_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_0_bits_T_218 = _io_loadStaIQEnq_0_bits_T_215 | _io_loadStaIQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_220 = isLoadStaLane_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_221 = matchOH_4_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_222 = matchOH_4_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_0_bits_T_223 = _io_loadStaIQEnq_0_bits_T_220 | _io_loadStaIQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_225 = isLoadStaLane_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_226 = matchOH_4_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_227 = matchOH_4_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_228 = _io_loadStaIQEnq_0_bits_T_225 | _io_loadStaIQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_230 = isLoadStaLane_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_231 = matchOH_4_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_232 = matchOH_4_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_0_bits_T_233 = _io_loadStaIQEnq_0_bits_T_230 | _io_loadStaIQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  matchOH_5_1 = _loadStaAccepted_T_3 & _loadStaAccepted_T_1[1:0] == 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:46]
  wire  matchOH_5_2 = _loadStaAccepted_T_6 & _loadStaAccepted_T_5 == 2'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 361:46]
  wire [2:0] _T_74 = {matchOH_5_2,matchOH_5_1,1'h0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:18]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_21 = matchOH_5_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_22 = matchOH_5_2 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_26 = matchOH_5_1 ? loadStaUops_1_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_27 = matchOH_5_2 ? loadStaUops_2_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_31 = matchOH_5_1 ? loadStaUops_1_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_32 = matchOH_5_2 ? loadStaUops_2_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_36 = matchOH_5_1 ? loadStaUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_37 = matchOH_5_2 ? loadStaUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_1_bits_T_41 = matchOH_5_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_loadStaIQEnq_1_bits_T_42 = matchOH_5_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_61 = matchOH_5_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_62 = matchOH_5_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_66 = matchOH_5_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_67 = matchOH_5_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_71 = matchOH_5_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_72 = matchOH_5_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_76 = matchOH_5_1 ? loadStaUops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_loadStaIQEnq_1_bits_T_77 = matchOH_5_2 ? loadStaUops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_81 = matchOH_5_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_82 = matchOH_5_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_86 = matchOH_5_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_87 = matchOH_5_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_91 = matchOH_5_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_92 = matchOH_5_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_96 = matchOH_5_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_97 = matchOH_5_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_1_bits_T_131 = matchOH_5_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_loadStaIQEnq_1_bits_T_132 = matchOH_5_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_136 = matchOH_5_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_137 = matchOH_5_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_1_bits_T_141 = matchOH_5_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_loadStaIQEnq_1_bits_T_142 = matchOH_5_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_181 = matchOH_5_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_182 = matchOH_5_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_186 = matchOH_5_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_187 = matchOH_5_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_191 = matchOH_5_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_192 = matchOH_5_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_196 = matchOH_5_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_197 = matchOH_5_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_201 = matchOH_5_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_loadStaIQEnq_1_bits_T_202 = matchOH_5_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_206 = matchOH_5_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_207 = matchOH_5_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_211 = matchOH_5_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_212 = matchOH_5_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_216 = matchOH_5_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_loadStaIQEnq_1_bits_T_217 = matchOH_5_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_221 = matchOH_5_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadStaIQEnq_1_bits_T_222 = matchOH_5_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_226 = matchOH_5_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_227 = matchOH_5_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_231 = matchOH_5_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadStaIQEnq_1_bits_T_232 = matchOH_5_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  matchOH_6_1 = _stdAccepted_T_3 & ~_stdAccepted_T_1[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 380:38]
  wire  matchOH_6_2 = _stdAccepted_T_6 & ~_stdAccepted_T_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 380:38]
  wire [2:0] _T_86 = {matchOH_6_2,matchOH_6_1,isStoreLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 382:18]
  wire [2:0] _io_stdIQEnq_0_bits_T_20 = isStoreLane_0 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_21 = matchOH_6_1 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_22 = matchOH_6_2 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_23 = _io_stdIQEnq_0_bits_T_20 | _io_stdIQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_26 = matchOH_6_1 ? sqIndices_1 : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_27 = matchOH_6_2 ? sqIndices_2 : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_28 = loadStaUops_0_sqIdx | _io_stdIQEnq_0_bits_T_26; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_35 = isStoreLane_0 ? aluUops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_36 = matchOH_6_1 ? aluUops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_37 = matchOH_6_2 ? aluUops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_38 = _io_stdIQEnq_0_bits_T_35 | _io_stdIQEnq_0_bits_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_stdIQEnq_0_bits_T_40 = isStoreLane_0 ? stgData_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_stdIQEnq_0_bits_T_41 = matchOH_6_1 ? stgData_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_stdIQEnq_0_bits_T_42 = matchOH_6_2 ? stgData_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_stdIQEnq_0_bits_T_43 = _io_stdIQEnq_0_bits_T_40 | _io_stdIQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_60 = isStoreLane_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_61 = matchOH_6_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_62 = matchOH_6_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_63 = _io_stdIQEnq_0_bits_T_60 | _io_stdIQEnq_0_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_65 = isStoreLane_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_66 = matchOH_6_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_67 = matchOH_6_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_68 = _io_stdIQEnq_0_bits_T_65 | _io_stdIQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_70 = isStoreLane_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_71 = matchOH_6_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_72 = matchOH_6_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_stdIQEnq_0_bits_T_73 = _io_stdIQEnq_0_bits_T_70 | _io_stdIQEnq_0_bits_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_80 = isStoreLane_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_81 = matchOH_6_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_82 = matchOH_6_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_83 = _io_stdIQEnq_0_bits_T_80 | _io_stdIQEnq_0_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_85 = isStoreLane_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_86 = matchOH_6_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_87 = matchOH_6_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_88 = _io_stdIQEnq_0_bits_T_85 | _io_stdIQEnq_0_bits_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_90 = isStoreLane_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_91 = matchOH_6_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_92 = matchOH_6_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_93 = _io_stdIQEnq_0_bits_T_90 | _io_stdIQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_95 = isStoreLane_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_96 = matchOH_6_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_97 = matchOH_6_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_98 = _io_stdIQEnq_0_bits_T_95 | _io_stdIQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_stdIQEnq_0_bits_T_130 = isStoreLane_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_stdIQEnq_0_bits_T_131 = matchOH_6_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_stdIQEnq_0_bits_T_132 = matchOH_6_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_stdIQEnq_0_bits_T_133 = _io_stdIQEnq_0_bits_T_130 | _io_stdIQEnq_0_bits_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_stdIQEnq_0_bits_T_140 = isStoreLane_0 ? stgData_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_stdIQEnq_0_bits_T_141 = matchOH_6_1 ? stgData_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_stdIQEnq_0_bits_T_142 = matchOH_6_2 ? stgData_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_stdIQEnq_0_bits_T_143 = _io_stdIQEnq_0_bits_T_140 | _io_stdIQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_180 = isStoreLane_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_181 = matchOH_6_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_182 = matchOH_6_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_183 = _io_stdIQEnq_0_bits_T_180 | _io_stdIQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_185 = isStoreLane_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_186 = matchOH_6_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_187 = matchOH_6_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_188 = _io_stdIQEnq_0_bits_T_185 | _io_stdIQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_190 = isStoreLane_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_191 = matchOH_6_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_192 = matchOH_6_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_193 = _io_stdIQEnq_0_bits_T_190 | _io_stdIQEnq_0_bits_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_195 = isStoreLane_0 ? stgData_0_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_196 = matchOH_6_1 ? stgData_1_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_197 = matchOH_6_2 ? stgData_2_ctrl_mulDivOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_198 = _io_stdIQEnq_0_bits_T_195 | _io_stdIQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_200 = isStoreLane_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_201 = matchOH_6_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_202 = matchOH_6_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_stdIQEnq_0_bits_T_203 = _io_stdIQEnq_0_bits_T_200 | _io_stdIQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_205 = isStoreLane_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_206 = matchOH_6_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_207 = matchOH_6_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_208 = _io_stdIQEnq_0_bits_T_205 | _io_stdIQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_210 = isStoreLane_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_211 = matchOH_6_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_212 = matchOH_6_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_213 = _io_stdIQEnq_0_bits_T_210 | _io_stdIQEnq_0_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_215 = isStoreLane_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_216 = matchOH_6_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_217 = matchOH_6_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_stdIQEnq_0_bits_T_218 = _io_stdIQEnq_0_bits_T_215 | _io_stdIQEnq_0_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_220 = isStoreLane_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_221 = matchOH_6_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_222 = matchOH_6_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_stdIQEnq_0_bits_T_223 = _io_stdIQEnq_0_bits_T_220 | _io_stdIQEnq_0_bits_T_221; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_225 = isStoreLane_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_226 = matchOH_6_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_227 = matchOH_6_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_228 = _io_stdIQEnq_0_bits_T_225 | _io_stdIQEnq_0_bits_T_226; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_230 = isStoreLane_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_231 = matchOH_6_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_232 = matchOH_6_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_stdIQEnq_0_bits_T_233 = _io_stdIQEnq_0_bits_T_230 | _io_stdIQEnq_0_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  reg  enqOK; // @[src/main/scala/backend/dispatch/DispatchStage.scala 392:23]
  wire  _GEN_595 = dispatchFire | enqOK; // @[src/main/scala/backend/dispatch/DispatchStage.scala 395:29 396:13 392:23]
  wire  _io_lsEnq_req_0_valid_T_2 = dispatchFire & ~enqOK & laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:60]
  wire  _io_lsEnq_req_1_valid_T_2 = dispatchFire & ~enqOK & laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:60]
  wire  _io_lsEnq_req_2_valid_T_2 = dispatchFire & ~enqOK & laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:60]
  BusyTable busyTable ( // @[src/main/scala/backend/dispatch/DispatchStage.scala 15:25]
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
  assign io_in_0_ready = ~stgValid | allLanesDone; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:32]
  assign io_in_1_ready = ~stgValid | allLanesDone; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:32]
  assign io_in_2_ready = ~stgValid | allLanesDone; // @[src/main/scala/backend/dispatch/DispatchStage.scala 114:32]
  assign io_aluIQEnq_0_valid = |_T_32 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:29]
  assign io_aluIQEnq_0_bits_pc = _io_aluIQEnq_0_bits_T_233 | _io_aluIQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_inst = _io_aluIQEnq_0_bits_T_228 | _io_aluIQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_fuType = _io_aluIQEnq_0_bits_T_223 | _io_aluIQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_aluOp = _io_aluIQEnq_0_bits_T_218 | _io_aluIQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_bruOp = _io_aluIQEnq_0_bits_T_213 | _io_aluIQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_lsuOp = _io_aluIQEnq_0_bits_T_208 | _io_aluIQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_csrOp = _io_aluIQEnq_0_bits_T_203 | _io_aluIQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_mulDivOp = _io_aluIQEnq_0_bits_T_198 | _io_aluIQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_src1Type = _io_aluIQEnq_0_bits_T_193 | _io_aluIQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_src2Type = _io_aluIQEnq_0_bits_T_188 | _io_aluIQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_immType = _io_aluIQEnq_0_bits_T_183 | _io_aluIQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_rfWen = isAluLane_0 & stgData_0_ctrl_rfWen | matchOH__1 & stgData_1_ctrl_rfWen |
    matchOH__2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_memRead = isAluLane_0 & stgData_0_ctrl_memRead | matchOH__1 & stgData_1_ctrl_memRead |
    matchOH__2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_memWrite = isAluLane_0 & stgData_0_ctrl_memWrite | matchOH__1 & stgData_1_ctrl_memWrite
     | matchOH__2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_csrWen = isAluLane_0 & stgData_0_ctrl_csrWen | matchOH__1 & stgData_1_ctrl_csrWen |
    matchOH__2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_isBranch = isAluLane_0 & stgData_0_ctrl_isBranch | matchOH__1 & stgData_1_ctrl_isBranch
     | matchOH__2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_isJump = isAluLane_0 & stgData_0_ctrl_isJump | matchOH__1 & stgData_1_ctrl_isJump |
    matchOH__2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ctrl_isPriv = isAluLane_0 & stgData_0_ctrl_isPriv | matchOH__1 & stgData_1_ctrl_isPriv |
    matchOH__2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_excpVec = _io_aluIQEnq_0_bits_T_143 | _io_aluIQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_imm = _io_aluIQEnq_0_bits_T_138 | _io_aluIQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_csrAddress = _io_aluIQEnq_0_bits_T_133 | _io_aluIQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_valid = isAluLane_0 & stgData_0_pdInfo_valid | matchOH__1 & stgData_1_pdInfo_valid |
    matchOH__2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_isBr = isAluLane_0 & stgData_0_pdInfo_isBr | matchOH__1 & stgData_1_pdInfo_isBr |
    matchOH__2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_isJal = isAluLane_0 & stgData_0_pdInfo_isJal | matchOH__1 & stgData_1_pdInfo_isJal |
    matchOH__2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_isJalr = isAluLane_0 & stgData_0_pdInfo_isJalr | matchOH__1 & stgData_1_pdInfo_isJalr
     | matchOH__2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_isCall = isAluLane_0 & stgData_0_pdInfo_isCall | matchOH__1 & stgData_1_pdInfo_isCall
     | matchOH__2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_isRet = isAluLane_0 & stgData_0_pdInfo_isRet | matchOH__1 & stgData_1_pdInfo_isRet |
    matchOH__2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdInfo_jumpTarget = _io_aluIQEnq_0_bits_T_98 | _io_aluIQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_ldst = _io_aluIQEnq_0_bits_T_93 | _io_aluIQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_lrs1 = _io_aluIQEnq_0_bits_T_88 | _io_aluIQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_lrs2 = _io_aluIQEnq_0_bits_T_83 | _io_aluIQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_pdst = _io_aluIQEnq_0_bits_T_78 | _io_aluIQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_prs1 = _io_aluIQEnq_0_bits_T_73 | _io_aluIQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_prs2 = _io_aluIQEnq_0_bits_T_68 | _io_aluIQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_oldPdst = _io_aluIQEnq_0_bits_T_63 | _io_aluIQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_rs1Valid = isAluLane_0 & stgData_0_rs1Valid | matchOH__1 & stgData_1_rs1Valid | matchOH__2
     & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_rs2Valid = isAluLane_0 & stgData_0_rs2Valid | matchOH__1 & stgData_1_rs2Valid | matchOH__2
     & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_rdValid = isAluLane_0 & stgData_0_rdValid | matchOH__1 & stgData_1_rdValid | matchOH__2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_robIdx = _io_aluIQEnq_0_bits_T_43 | _io_aluIQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_robIdxFull = _io_aluIQEnq_0_bits_T_38 | _io_aluIQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_prs1Busy = isAluLane_0 & aluUops_0_prs1Busy | matchOH__1 & aluUops_1_prs1Busy | matchOH__2
     & aluUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_0_bits_prs2Busy = isAluLane_0 & aluUops_0_prs2Busy | matchOH__1 & aluUops_1_prs2Busy | matchOH__2
     & aluUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_valid = |_T_35 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:29]
  assign io_aluIQEnq_1_bits_pc = _io_aluIQEnq_1_bits_T_231 | _io_aluIQEnq_1_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_inst = _io_aluIQEnq_1_bits_T_226 | _io_aluIQEnq_1_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_fuType = _io_aluIQEnq_1_bits_T_221 | _io_aluIQEnq_1_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_aluOp = _io_aluIQEnq_1_bits_T_216 | _io_aluIQEnq_1_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_bruOp = _io_aluIQEnq_1_bits_T_211 | _io_aluIQEnq_1_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_lsuOp = _io_aluIQEnq_1_bits_T_206 | _io_aluIQEnq_1_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_csrOp = _io_aluIQEnq_1_bits_T_201 | _io_aluIQEnq_1_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_mulDivOp = _io_aluIQEnq_1_bits_T_196 | _io_aluIQEnq_1_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_src1Type = _io_aluIQEnq_1_bits_T_191 | _io_aluIQEnq_1_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_src2Type = _io_aluIQEnq_1_bits_T_186 | _io_aluIQEnq_1_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_immType = _io_aluIQEnq_1_bits_T_181 | _io_aluIQEnq_1_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_rfWen = matchOH_1_1 & stgData_1_ctrl_rfWen | matchOH_1_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_memRead = matchOH_1_1 & stgData_1_ctrl_memRead | matchOH_1_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_memWrite = matchOH_1_1 & stgData_1_ctrl_memWrite | matchOH_1_2 &
    stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_csrWen = matchOH_1_1 & stgData_1_ctrl_csrWen | matchOH_1_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_isBranch = matchOH_1_1 & stgData_1_ctrl_isBranch | matchOH_1_2 &
    stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_isJump = matchOH_1_1 & stgData_1_ctrl_isJump | matchOH_1_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ctrl_isPriv = matchOH_1_1 & stgData_1_ctrl_isPriv | matchOH_1_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_excpVec = _io_aluIQEnq_1_bits_T_141 | _io_aluIQEnq_1_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_imm = _io_aluIQEnq_1_bits_T_136 | _io_aluIQEnq_1_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_csrAddress = _io_aluIQEnq_1_bits_T_131 | _io_aluIQEnq_1_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_valid = matchOH_1_1 & stgData_1_pdInfo_valid | matchOH_1_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_isBr = matchOH_1_1 & stgData_1_pdInfo_isBr | matchOH_1_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_isJal = matchOH_1_1 & stgData_1_pdInfo_isJal | matchOH_1_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_isJalr = matchOH_1_1 & stgData_1_pdInfo_isJalr | matchOH_1_2 &
    stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_isCall = matchOH_1_1 & stgData_1_pdInfo_isCall | matchOH_1_2 &
    stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_isRet = matchOH_1_1 & stgData_1_pdInfo_isRet | matchOH_1_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdInfo_jumpTarget = _io_aluIQEnq_1_bits_T_96 | _io_aluIQEnq_1_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_ldst = _io_aluIQEnq_1_bits_T_91 | _io_aluIQEnq_1_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_lrs1 = _io_aluIQEnq_1_bits_T_86 | _io_aluIQEnq_1_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_lrs2 = _io_aluIQEnq_1_bits_T_81 | _io_aluIQEnq_1_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_pdst = _io_aluIQEnq_1_bits_T_76 | _io_aluIQEnq_1_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_prs1 = _io_aluIQEnq_1_bits_T_71 | _io_aluIQEnq_1_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_prs2 = _io_aluIQEnq_1_bits_T_66 | _io_aluIQEnq_1_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_oldPdst = _io_aluIQEnq_1_bits_T_61 | _io_aluIQEnq_1_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_rs1Valid = matchOH_1_1 & stgData_1_rs1Valid | matchOH_1_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_rs2Valid = matchOH_1_1 & stgData_1_rs2Valid | matchOH_1_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_rdValid = matchOH_1_1 & stgData_1_rdValid | matchOH_1_2 & stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_robIdx = _io_aluIQEnq_1_bits_T_41 | _io_aluIQEnq_1_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_robIdxFull = _io_aluIQEnq_1_bits_T_36 | _io_aluIQEnq_1_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_prs1Busy = matchOH_1_1 & aluUops_1_prs1Busy | matchOH_1_2 & aluUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_aluIQEnq_1_bits_prs2Busy = matchOH_1_1 & aluUops_1_prs2Busy | matchOH_1_2 & aluUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_valid = |_T_47 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 323:29]
  assign io_bruIQEnq_0_bits_pc = _io_bruIQEnq_0_bits_T_233 | _io_bruIQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_inst = _io_bruIQEnq_0_bits_T_228 | _io_bruIQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_fuType = _io_bruIQEnq_0_bits_T_223 | _io_bruIQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_aluOp = _io_bruIQEnq_0_bits_T_218 | _io_bruIQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_bruOp = _io_bruIQEnq_0_bits_T_213 | _io_bruIQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_lsuOp = _io_bruIQEnq_0_bits_T_208 | _io_bruIQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_csrOp = _io_bruIQEnq_0_bits_T_203 | _io_bruIQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_mulDivOp = _io_bruIQEnq_0_bits_T_198 | _io_bruIQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_src1Type = _io_bruIQEnq_0_bits_T_193 | _io_bruIQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_src2Type = _io_bruIQEnq_0_bits_T_188 | _io_bruIQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_immType = _io_bruIQEnq_0_bits_T_183 | _io_bruIQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_rfWen = isBruTargetLane_0 & stgData_0_ctrl_rfWen | matchOH_2_1 & stgData_1_ctrl_rfWen
     | matchOH_2_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_memRead = isBruTargetLane_0 & stgData_0_ctrl_memRead | matchOH_2_1 &
    stgData_1_ctrl_memRead | matchOH_2_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_memWrite = isBruTargetLane_0 & stgData_0_ctrl_memWrite | matchOH_2_1 &
    stgData_1_ctrl_memWrite | matchOH_2_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_csrWen = isBruTargetLane_0 & stgData_0_ctrl_csrWen | matchOH_2_1 &
    stgData_1_ctrl_csrWen | matchOH_2_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_isBranch = isBruTargetLane_0 & stgData_0_ctrl_isBranch | matchOH_2_1 &
    stgData_1_ctrl_isBranch | matchOH_2_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_isJump = isBruTargetLane_0 & stgData_0_ctrl_isJump | matchOH_2_1 &
    stgData_1_ctrl_isJump | matchOH_2_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ctrl_isPriv = isBruTargetLane_0 & stgData_0_ctrl_isPriv | matchOH_2_1 &
    stgData_1_ctrl_isPriv | matchOH_2_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_excpVec = _io_bruIQEnq_0_bits_T_143 | _io_bruIQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_imm = _io_bruIQEnq_0_bits_T_138 | _io_bruIQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_csrAddress = _io_bruIQEnq_0_bits_T_133 | _io_bruIQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_valid = isBruTargetLane_0 & stgData_0_pdInfo_valid | matchOH_2_1 &
    stgData_1_pdInfo_valid | matchOH_2_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_isBr = isBruTargetLane_0 & stgData_0_pdInfo_isBr | matchOH_2_1 &
    stgData_1_pdInfo_isBr | matchOH_2_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_isJal = isBruTargetLane_0 & stgData_0_pdInfo_isJal | matchOH_2_1 &
    stgData_1_pdInfo_isJal | matchOH_2_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_isJalr = isBruTargetLane_0 & stgData_0_pdInfo_isJalr | matchOH_2_1 &
    stgData_1_pdInfo_isJalr | matchOH_2_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_isCall = isBruTargetLane_0 & stgData_0_pdInfo_isCall | matchOH_2_1 &
    stgData_1_pdInfo_isCall | matchOH_2_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_isRet = isBruTargetLane_0 & stgData_0_pdInfo_isRet | matchOH_2_1 &
    stgData_1_pdInfo_isRet | matchOH_2_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdInfo_jumpTarget = _io_bruIQEnq_0_bits_T_98 | _io_bruIQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_ldst = _io_bruIQEnq_0_bits_T_93 | _io_bruIQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_lrs1 = _io_bruIQEnq_0_bits_T_88 | _io_bruIQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_lrs2 = _io_bruIQEnq_0_bits_T_83 | _io_bruIQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_pdst = _io_bruIQEnq_0_bits_T_78 | _io_bruIQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_prs1 = _io_bruIQEnq_0_bits_T_73 | _io_bruIQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_prs2 = _io_bruIQEnq_0_bits_T_68 | _io_bruIQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_oldPdst = _io_bruIQEnq_0_bits_T_63 | _io_bruIQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_rs1Valid = isBruTargetLane_0 & stgData_0_rs1Valid | matchOH_2_1 & stgData_1_rs1Valid |
    matchOH_2_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_rs2Valid = isBruTargetLane_0 & stgData_0_rs2Valid | matchOH_2_1 & stgData_1_rs2Valid |
    matchOH_2_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_rdValid = isBruTargetLane_0 & stgData_0_rdValid | matchOH_2_1 & stgData_1_rdValid |
    matchOH_2_2 & stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_robIdx = _io_bruIQEnq_0_bits_T_43 | _io_bruIQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_robIdxFull = _io_bruIQEnq_0_bits_T_38 | _io_bruIQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_prs1Busy = isBruTargetLane_0 & aluUops_0_prs1Busy | matchOH_2_1 & aluUops_1_prs1Busy |
    matchOH_2_2 & aluUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_bruIQEnq_0_bits_prs2Busy = isBruTargetLane_0 & aluUops_0_prs2Busy | matchOH_2_1 & aluUops_1_prs2Busy |
    matchOH_2_2 & aluUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_valid = |_T_59 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:29]
  assign io_mulDivIQEnq_0_bits_pc = _io_mulDivIQEnq_0_bits_T_233 | _io_mulDivIQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_inst = _io_mulDivIQEnq_0_bits_T_228 | _io_mulDivIQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_fuType = _io_mulDivIQEnq_0_bits_T_223 | _io_mulDivIQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_aluOp = _io_mulDivIQEnq_0_bits_T_218 | _io_mulDivIQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_bruOp = _io_mulDivIQEnq_0_bits_T_213 | _io_mulDivIQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_lsuOp = _io_mulDivIQEnq_0_bits_T_208 | _io_mulDivIQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_csrOp = _io_mulDivIQEnq_0_bits_T_203 | _io_mulDivIQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_mulDivOp = _io_mulDivIQEnq_0_bits_T_198 | _io_mulDivIQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_src1Type = _io_mulDivIQEnq_0_bits_T_193 | _io_mulDivIQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_src2Type = _io_mulDivIQEnq_0_bits_T_188 | _io_mulDivIQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_immType = _io_mulDivIQEnq_0_bits_T_183 | _io_mulDivIQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_rfWen = isMulDivLane_0 & stgData_0_ctrl_rfWen | matchOH_3_1 & stgData_1_ctrl_rfWen
     | matchOH_3_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_memRead = isMulDivLane_0 & stgData_0_ctrl_memRead | matchOH_3_1 &
    stgData_1_ctrl_memRead | matchOH_3_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_memWrite = isMulDivLane_0 & stgData_0_ctrl_memWrite | matchOH_3_1 &
    stgData_1_ctrl_memWrite | matchOH_3_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_csrWen = isMulDivLane_0 & stgData_0_ctrl_csrWen | matchOH_3_1 &
    stgData_1_ctrl_csrWen | matchOH_3_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_isBranch = isMulDivLane_0 & stgData_0_ctrl_isBranch | matchOH_3_1 &
    stgData_1_ctrl_isBranch | matchOH_3_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_isJump = isMulDivLane_0 & stgData_0_ctrl_isJump | matchOH_3_1 &
    stgData_1_ctrl_isJump | matchOH_3_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ctrl_isPriv = isMulDivLane_0 & stgData_0_ctrl_isPriv | matchOH_3_1 &
    stgData_1_ctrl_isPriv | matchOH_3_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_excpVec = _io_mulDivIQEnq_0_bits_T_143 | _io_mulDivIQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_imm = _io_mulDivIQEnq_0_bits_T_138 | _io_mulDivIQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_csrAddress = _io_mulDivIQEnq_0_bits_T_133 | _io_mulDivIQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_valid = isMulDivLane_0 & stgData_0_pdInfo_valid | matchOH_3_1 &
    stgData_1_pdInfo_valid | matchOH_3_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_isBr = isMulDivLane_0 & stgData_0_pdInfo_isBr | matchOH_3_1 &
    stgData_1_pdInfo_isBr | matchOH_3_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_isJal = isMulDivLane_0 & stgData_0_pdInfo_isJal | matchOH_3_1 &
    stgData_1_pdInfo_isJal | matchOH_3_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_isJalr = isMulDivLane_0 & stgData_0_pdInfo_isJalr | matchOH_3_1 &
    stgData_1_pdInfo_isJalr | matchOH_3_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_isCall = isMulDivLane_0 & stgData_0_pdInfo_isCall | matchOH_3_1 &
    stgData_1_pdInfo_isCall | matchOH_3_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_isRet = isMulDivLane_0 & stgData_0_pdInfo_isRet | matchOH_3_1 &
    stgData_1_pdInfo_isRet | matchOH_3_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdInfo_jumpTarget = _io_mulDivIQEnq_0_bits_T_98 | _io_mulDivIQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_ldst = _io_mulDivIQEnq_0_bits_T_93 | _io_mulDivIQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_lrs1 = _io_mulDivIQEnq_0_bits_T_88 | _io_mulDivIQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_lrs2 = _io_mulDivIQEnq_0_bits_T_83 | _io_mulDivIQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_pdst = _io_mulDivIQEnq_0_bits_T_78 | _io_mulDivIQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_prs1 = _io_mulDivIQEnq_0_bits_T_73 | _io_mulDivIQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_prs2 = _io_mulDivIQEnq_0_bits_T_68 | _io_mulDivIQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_oldPdst = _io_mulDivIQEnq_0_bits_T_63 | _io_mulDivIQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_rs1Valid = isMulDivLane_0 & stgData_0_rs1Valid | matchOH_3_1 & stgData_1_rs1Valid |
    matchOH_3_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_rs2Valid = isMulDivLane_0 & stgData_0_rs2Valid | matchOH_3_1 & stgData_1_rs2Valid |
    matchOH_3_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_rdValid = isMulDivLane_0 & stgData_0_rdValid | matchOH_3_1 & stgData_1_rdValid |
    matchOH_3_2 & stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_robIdx = _io_mulDivIQEnq_0_bits_T_43 | _io_mulDivIQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_robIdxFull = _io_mulDivIQEnq_0_bits_T_38 | _io_mulDivIQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_prs1Busy = isMulDivLane_0 & aluUops_0_prs1Busy | matchOH_3_1 & aluUops_1_prs1Busy |
    matchOH_3_2 & aluUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mulDivIQEnq_0_bits_prs2Busy = isMulDivLane_0 & aluUops_0_prs2Busy | matchOH_3_1 & aluUops_1_prs2Busy |
    matchOH_3_2 & aluUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_valid = |_T_71 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:29]
  assign io_loadStaIQEnq_0_bits_pc = _io_loadStaIQEnq_0_bits_T_233 | _io_loadStaIQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_inst = _io_loadStaIQEnq_0_bits_T_228 | _io_loadStaIQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_fuType = _io_loadStaIQEnq_0_bits_T_223 | _io_loadStaIQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_aluOp = _io_loadStaIQEnq_0_bits_T_218 | _io_loadStaIQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_bruOp = _io_loadStaIQEnq_0_bits_T_213 | _io_loadStaIQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_lsuOp = _io_loadStaIQEnq_0_bits_T_208 | _io_loadStaIQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_csrOp = _io_loadStaIQEnq_0_bits_T_203 | _io_loadStaIQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_mulDivOp = _io_loadStaIQEnq_0_bits_T_198 | _io_loadStaIQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_src1Type = _io_loadStaIQEnq_0_bits_T_193 | _io_loadStaIQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_src2Type = _io_loadStaIQEnq_0_bits_T_188 | _io_loadStaIQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_immType = _io_loadStaIQEnq_0_bits_T_183 | _io_loadStaIQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_rfWen = isLoadStaLane_0 & stgData_0_ctrl_rfWen | matchOH_4_1 & stgData_1_ctrl_rfWen
     | matchOH_4_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_memRead = isLoadStaLane_0 & stgData_0_ctrl_memRead | matchOH_4_1 &
    stgData_1_ctrl_memRead | matchOH_4_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_memWrite = isLoadStaLane_0 & stgData_0_ctrl_memWrite | matchOH_4_1 &
    stgData_1_ctrl_memWrite | matchOH_4_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_csrWen = isLoadStaLane_0 & stgData_0_ctrl_csrWen | matchOH_4_1 &
    stgData_1_ctrl_csrWen | matchOH_4_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_isBranch = isLoadStaLane_0 & stgData_0_ctrl_isBranch | matchOH_4_1 &
    stgData_1_ctrl_isBranch | matchOH_4_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_isJump = isLoadStaLane_0 & stgData_0_ctrl_isJump | matchOH_4_1 &
    stgData_1_ctrl_isJump | matchOH_4_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ctrl_isPriv = isLoadStaLane_0 & stgData_0_ctrl_isPriv | matchOH_4_1 &
    stgData_1_ctrl_isPriv | matchOH_4_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_excpVec = _io_loadStaIQEnq_0_bits_T_143 | _io_loadStaIQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_imm = _io_loadStaIQEnq_0_bits_T_138 | _io_loadStaIQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_csrAddress = _io_loadStaIQEnq_0_bits_T_133 | _io_loadStaIQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_valid = isLoadStaLane_0 & stgData_0_pdInfo_valid | matchOH_4_1 &
    stgData_1_pdInfo_valid | matchOH_4_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_isBr = isLoadStaLane_0 & stgData_0_pdInfo_isBr | matchOH_4_1 &
    stgData_1_pdInfo_isBr | matchOH_4_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_isJal = isLoadStaLane_0 & stgData_0_pdInfo_isJal | matchOH_4_1 &
    stgData_1_pdInfo_isJal | matchOH_4_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_isJalr = isLoadStaLane_0 & stgData_0_pdInfo_isJalr | matchOH_4_1 &
    stgData_1_pdInfo_isJalr | matchOH_4_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_isCall = isLoadStaLane_0 & stgData_0_pdInfo_isCall | matchOH_4_1 &
    stgData_1_pdInfo_isCall | matchOH_4_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_isRet = isLoadStaLane_0 & stgData_0_pdInfo_isRet | matchOH_4_1 &
    stgData_1_pdInfo_isRet | matchOH_4_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdInfo_jumpTarget = _io_loadStaIQEnq_0_bits_T_98 | _io_loadStaIQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_ldst = _io_loadStaIQEnq_0_bits_T_93 | _io_loadStaIQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_lrs1 = _io_loadStaIQEnq_0_bits_T_88 | _io_loadStaIQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_lrs2 = _io_loadStaIQEnq_0_bits_T_83 | _io_loadStaIQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_pdst = _io_loadStaIQEnq_0_bits_T_78 | _io_loadStaIQEnq_0_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_prs1 = _io_loadStaIQEnq_0_bits_T_73 | _io_loadStaIQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_prs2 = _io_loadStaIQEnq_0_bits_T_68 | _io_loadStaIQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_oldPdst = _io_loadStaIQEnq_0_bits_T_63 | _io_loadStaIQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_rs1Valid = isLoadStaLane_0 & stgData_0_rs1Valid | matchOH_4_1 & stgData_1_rs1Valid |
    matchOH_4_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_rs2Valid = isLoadStaLane_0 & loadStaUops_0_rs2Valid | matchOH_4_1 &
    loadStaUops_1_rs2Valid | matchOH_4_2 & loadStaUops_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_rdValid = isLoadStaLane_0 & loadStaUops_0_rdValid | matchOH_4_1 & loadStaUops_1_rdValid
     | matchOH_4_2 & loadStaUops_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_robIdx = _io_loadStaIQEnq_0_bits_T_43 | _io_loadStaIQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_robIdxFull = _io_loadStaIQEnq_0_bits_T_38 | _io_loadStaIQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_lqIdx = _io_loadStaIQEnq_0_bits_T_33 | _io_loadStaIQEnq_0_bits_T_32; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_sqIdx = _io_loadStaIQEnq_0_bits_T_28 | _io_loadStaIQEnq_0_bits_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_issueQueue = _io_loadStaIQEnq_0_bits_T_23 | _io_loadStaIQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_prs1Busy = isLoadStaLane_0 & loadStaUops_0_prs1Busy | matchOH_4_1 &
    loadStaUops_1_prs1Busy | matchOH_4_2 & loadStaUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_prs2Busy = isLoadStaLane_0 & loadStaUops_0_prs2Busy | matchOH_4_1 &
    loadStaUops_1_prs2Busy | matchOH_4_2 & loadStaUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_0_bits_isSta = isLoadStaLane_0 & isStoreLane_0 | matchOH_4_1 & isStoreLane_1 | matchOH_4_2 &
    isStoreLane_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_valid = |_T_74 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 363:29]
  assign io_loadStaIQEnq_1_bits_pc = _io_loadStaIQEnq_1_bits_T_231 | _io_loadStaIQEnq_1_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_inst = _io_loadStaIQEnq_1_bits_T_226 | _io_loadStaIQEnq_1_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_fuType = _io_loadStaIQEnq_1_bits_T_221 | _io_loadStaIQEnq_1_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_aluOp = _io_loadStaIQEnq_1_bits_T_216 | _io_loadStaIQEnq_1_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_bruOp = _io_loadStaIQEnq_1_bits_T_211 | _io_loadStaIQEnq_1_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_lsuOp = _io_loadStaIQEnq_1_bits_T_206 | _io_loadStaIQEnq_1_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_csrOp = _io_loadStaIQEnq_1_bits_T_201 | _io_loadStaIQEnq_1_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_mulDivOp = _io_loadStaIQEnq_1_bits_T_196 | _io_loadStaIQEnq_1_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_src1Type = _io_loadStaIQEnq_1_bits_T_191 | _io_loadStaIQEnq_1_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_src2Type = _io_loadStaIQEnq_1_bits_T_186 | _io_loadStaIQEnq_1_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_immType = _io_loadStaIQEnq_1_bits_T_181 | _io_loadStaIQEnq_1_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_rfWen = matchOH_5_1 & stgData_1_ctrl_rfWen | matchOH_5_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_memRead = matchOH_5_1 & stgData_1_ctrl_memRead | matchOH_5_2 &
    stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_memWrite = matchOH_5_1 & stgData_1_ctrl_memWrite | matchOH_5_2 &
    stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_csrWen = matchOH_5_1 & stgData_1_ctrl_csrWen | matchOH_5_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_isBranch = matchOH_5_1 & stgData_1_ctrl_isBranch | matchOH_5_2 &
    stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_isJump = matchOH_5_1 & stgData_1_ctrl_isJump | matchOH_5_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ctrl_isPriv = matchOH_5_1 & stgData_1_ctrl_isPriv | matchOH_5_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_excpVec = _io_loadStaIQEnq_1_bits_T_141 | _io_loadStaIQEnq_1_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_imm = _io_loadStaIQEnq_1_bits_T_136 | _io_loadStaIQEnq_1_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_csrAddress = _io_loadStaIQEnq_1_bits_T_131 | _io_loadStaIQEnq_1_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_valid = matchOH_5_1 & stgData_1_pdInfo_valid | matchOH_5_2 &
    stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_isBr = matchOH_5_1 & stgData_1_pdInfo_isBr | matchOH_5_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_isJal = matchOH_5_1 & stgData_1_pdInfo_isJal | matchOH_5_2 &
    stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_isJalr = matchOH_5_1 & stgData_1_pdInfo_isJalr | matchOH_5_2 &
    stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_isCall = matchOH_5_1 & stgData_1_pdInfo_isCall | matchOH_5_2 &
    stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_isRet = matchOH_5_1 & stgData_1_pdInfo_isRet | matchOH_5_2 &
    stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdInfo_jumpTarget = _io_loadStaIQEnq_1_bits_T_96 | _io_loadStaIQEnq_1_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_ldst = _io_loadStaIQEnq_1_bits_T_91 | _io_loadStaIQEnq_1_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_lrs1 = _io_loadStaIQEnq_1_bits_T_86 | _io_loadStaIQEnq_1_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_lrs2 = _io_loadStaIQEnq_1_bits_T_81 | _io_loadStaIQEnq_1_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_pdst = _io_loadStaIQEnq_1_bits_T_76 | _io_loadStaIQEnq_1_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_prs1 = _io_loadStaIQEnq_1_bits_T_71 | _io_loadStaIQEnq_1_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_prs2 = _io_loadStaIQEnq_1_bits_T_66 | _io_loadStaIQEnq_1_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_oldPdst = _io_loadStaIQEnq_1_bits_T_61 | _io_loadStaIQEnq_1_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_rs1Valid = matchOH_5_1 & stgData_1_rs1Valid | matchOH_5_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_rs2Valid = matchOH_5_1 & loadStaUops_1_rs2Valid | matchOH_5_2 & loadStaUops_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_rdValid = matchOH_5_1 & loadStaUops_1_rdValid | matchOH_5_2 & loadStaUops_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_robIdx = _io_loadStaIQEnq_1_bits_T_41 | _io_loadStaIQEnq_1_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_robIdxFull = _io_loadStaIQEnq_1_bits_T_36 | _io_loadStaIQEnq_1_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_lqIdx = _io_loadStaIQEnq_1_bits_T_31 | _io_loadStaIQEnq_1_bits_T_32; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_sqIdx = _io_loadStaIQEnq_1_bits_T_26 | _io_loadStaIQEnq_1_bits_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_issueQueue = _io_loadStaIQEnq_1_bits_T_21 | _io_loadStaIQEnq_1_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_prs1Busy = matchOH_5_1 & loadStaUops_1_prs1Busy | matchOH_5_2 & loadStaUops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_prs2Busy = matchOH_5_1 & loadStaUops_1_prs2Busy | matchOH_5_2 & loadStaUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadStaIQEnq_1_bits_isSta = matchOH_5_1 & isStoreLane_1 | matchOH_5_2 & isStoreLane_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_valid = |_T_86 & dispatchFire; // @[src/main/scala/backend/dispatch/DispatchStage.scala 382:29]
  assign io_stdIQEnq_0_bits_pc = _io_stdIQEnq_0_bits_T_233 | _io_stdIQEnq_0_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_inst = _io_stdIQEnq_0_bits_T_228 | _io_stdIQEnq_0_bits_T_227; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_fuType = _io_stdIQEnq_0_bits_T_223 | _io_stdIQEnq_0_bits_T_222; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_aluOp = _io_stdIQEnq_0_bits_T_218 | _io_stdIQEnq_0_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_bruOp = _io_stdIQEnq_0_bits_T_213 | _io_stdIQEnq_0_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_lsuOp = _io_stdIQEnq_0_bits_T_208 | _io_stdIQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_csrOp = _io_stdIQEnq_0_bits_T_203 | _io_stdIQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_mulDivOp = _io_stdIQEnq_0_bits_T_198 | _io_stdIQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_src1Type = _io_stdIQEnq_0_bits_T_193 | _io_stdIQEnq_0_bits_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_src2Type = _io_stdIQEnq_0_bits_T_188 | _io_stdIQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_immType = _io_stdIQEnq_0_bits_T_183 | _io_stdIQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_rfWen = isStoreLane_0 & stgData_0_ctrl_rfWen | matchOH_6_1 & stgData_1_ctrl_rfWen |
    matchOH_6_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_memRead = isStoreLane_0 & stgData_0_ctrl_memRead | matchOH_6_1 & stgData_1_ctrl_memRead
     | matchOH_6_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_memWrite = isStoreLane_0 & stgData_0_ctrl_memWrite | matchOH_6_1 &
    stgData_1_ctrl_memWrite | matchOH_6_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_csrWen = isStoreLane_0 & stgData_0_ctrl_csrWen | matchOH_6_1 & stgData_1_ctrl_csrWen |
    matchOH_6_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_isBranch = isStoreLane_0 & stgData_0_ctrl_isBranch | matchOH_6_1 &
    stgData_1_ctrl_isBranch | matchOH_6_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_isJump = isStoreLane_0 & stgData_0_ctrl_isJump | matchOH_6_1 & stgData_1_ctrl_isJump |
    matchOH_6_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ctrl_isPriv = isStoreLane_0 & stgData_0_ctrl_isPriv | matchOH_6_1 & stgData_1_ctrl_isPriv |
    matchOH_6_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_excpVec = _io_stdIQEnq_0_bits_T_143 | _io_stdIQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_csrAddress = _io_stdIQEnq_0_bits_T_133 | _io_stdIQEnq_0_bits_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_valid = isStoreLane_0 & stgData_0_pdInfo_valid | matchOH_6_1 & stgData_1_pdInfo_valid
     | matchOH_6_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_isBr = isStoreLane_0 & stgData_0_pdInfo_isBr | matchOH_6_1 & stgData_1_pdInfo_isBr |
    matchOH_6_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_isJal = isStoreLane_0 & stgData_0_pdInfo_isJal | matchOH_6_1 & stgData_1_pdInfo_isJal
     | matchOH_6_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_isJalr = isStoreLane_0 & stgData_0_pdInfo_isJalr | matchOH_6_1 &
    stgData_1_pdInfo_isJalr | matchOH_6_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_isCall = isStoreLane_0 & stgData_0_pdInfo_isCall | matchOH_6_1 &
    stgData_1_pdInfo_isCall | matchOH_6_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_isRet = isStoreLane_0 & stgData_0_pdInfo_isRet | matchOH_6_1 & stgData_1_pdInfo_isRet
     | matchOH_6_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_pdInfo_jumpTarget = _io_stdIQEnq_0_bits_T_98 | _io_stdIQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_ldst = _io_stdIQEnq_0_bits_T_93 | _io_stdIQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_lrs1 = _io_stdIQEnq_0_bits_T_88 | _io_stdIQEnq_0_bits_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_lrs2 = _io_stdIQEnq_0_bits_T_83 | _io_stdIQEnq_0_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_prs1 = _io_stdIQEnq_0_bits_T_73 | _io_stdIQEnq_0_bits_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_prs2 = _io_stdIQEnq_0_bits_T_68 | _io_stdIQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_oldPdst = _io_stdIQEnq_0_bits_T_63 | _io_stdIQEnq_0_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_rs2Valid = isStoreLane_0 & stgData_0_rs2Valid | matchOH_6_1 & stgData_1_rs2Valid |
    matchOH_6_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_robIdx = _io_stdIQEnq_0_bits_T_43 | _io_stdIQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_robIdxFull = _io_stdIQEnq_0_bits_T_38 | _io_stdIQEnq_0_bits_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_sqIdx = _io_stdIQEnq_0_bits_T_28 | _io_stdIQEnq_0_bits_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_issueQueue = _io_stdIQEnq_0_bits_T_23 | _io_stdIQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_prs2Busy = isStoreLane_0 & aluUops_0_prs2Busy | matchOH_6_1 & aluUops_1_prs2Busy |
    matchOH_6_2 & aluUops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_stdIQEnq_0_bits_isStd = isStoreLane_0 | matchOH_6_1 | matchOH_6_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_0_valid = dispatchFire & ~enqOK & laneValid_0 & stgValid & isLoadStaLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:88]
  assign io_lsEnq_req_0_bits_robIdx = stgData_0_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:34]
  assign io_lsEnq_req_0_bits_isLoad = lanePending_0 & stgData_0_ctrl_fuType == 4'h3 & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  assign io_lsEnq_req_0_bits_isStore = _isLoadLane_T_1 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  assign io_lsEnq_req_0_bits_sqIdx = _sqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  assign io_lsEnq_req_0_bits_lqIdx = _lqIndices_0_T[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  assign io_lsEnq_req_1_valid = dispatchFire & ~enqOK & laneValid_1 & stgValid & isLoadStaLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:88]
  assign io_lsEnq_req_1_bits_robIdx = stgData_1_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:34]
  assign io_lsEnq_req_1_bits_isLoad = lanePending_1 & stgData_1_ctrl_fuType == 4'h3 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  assign io_lsEnq_req_1_bits_isStore = _isLoadLane_T_4 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  assign io_lsEnq_req_1_bits_sqIdx = sqHeadPtr + _T_9[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  assign io_lsEnq_req_1_bits_lqIdx = lqHeadPtr + _T_6[3:0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  assign io_lsEnq_req_2_valid = dispatchFire & ~enqOK & laneValid_2 & stgValid & isLoadStaLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 399:88]
  assign io_lsEnq_req_2_bits_robIdx = stgData_2_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 401:34]
  assign io_lsEnq_req_2_bits_isLoad = lanePending_2 & stgData_2_ctrl_fuType == 4'h3 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 41:61]
  assign io_lsEnq_req_2_bits_isStore = _isLoadLane_T_7 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 43:61]
  assign io_lsEnq_req_2_bits_sqIdx = sqHeadPtr + _T_16; // @[src/main/scala/backend/dispatch/DispatchStage.scala 183:31]
  assign io_lsEnq_req_2_bits_lqIdx = lqHeadPtr + _T_13; // @[src/main/scala/backend/dispatch/DispatchStage.scala 182:31]
  assign io_robEnq_valid_0 = _io_lsEnq_req_0_valid_T_2 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 413:68]
  assign io_robEnq_valid_1 = _io_lsEnq_req_1_valid_T_2 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 413:68]
  assign io_robEnq_valid_2 = _io_lsEnq_req_2_valid_T_2 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 413:68]
  assign io_robEnq_valids_0 = laneValid_0 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 414:41]
  assign io_robEnq_valids_1 = laneValid_1 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 414:41]
  assign io_robEnq_valids_2 = laneValid_2 & stgValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 414:41]
  assign io_robEnq_bits_0_pc = stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 415:32]
  assign io_robEnq_bits_0_inst = stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 416:32]
  assign io_robEnq_bits_0_pdst = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:32]
  assign io_robEnq_bits_0_oldPdst = stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:32]
  assign io_robEnq_bits_0_ldst = stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 419:32]
  assign io_robEnq_bits_0_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 420:32]
  assign io_robEnq_bits_0_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 421:32]
  assign io_robEnq_bits_0_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 422:32]
  assign io_robEnq_bits_0_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 423:32]
  assign io_robEnq_bits_0_excpVec = stgData_0_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:32]
  assign io_robEnq_bits_0_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 424:32]
  assign io_robEnq_bits_1_pc = stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 415:32]
  assign io_robEnq_bits_1_inst = stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 416:32]
  assign io_robEnq_bits_1_pdst = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:32]
  assign io_robEnq_bits_1_oldPdst = stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:32]
  assign io_robEnq_bits_1_ldst = stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 419:32]
  assign io_robEnq_bits_1_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 420:32]
  assign io_robEnq_bits_1_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 421:32]
  assign io_robEnq_bits_1_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 422:32]
  assign io_robEnq_bits_1_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 423:32]
  assign io_robEnq_bits_1_excpVec = stgData_1_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:32]
  assign io_robEnq_bits_1_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 424:32]
  assign io_robEnq_bits_2_pc = stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 415:32]
  assign io_robEnq_bits_2_inst = stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 416:32]
  assign io_robEnq_bits_2_pdst = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 417:32]
  assign io_robEnq_bits_2_oldPdst = stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 418:32]
  assign io_robEnq_bits_2_ldst = stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 419:32]
  assign io_robEnq_bits_2_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 420:32]
  assign io_robEnq_bits_2_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 421:32]
  assign io_robEnq_bits_2_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 422:32]
  assign io_robEnq_bits_2_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 423:32]
  assign io_robEnq_bits_2_excpVec = stgData_2_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 425:32]
  assign io_robEnq_bits_2_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 424:32]
  assign busyTable_clock = clock;
  assign busyTable_reset = reset;
  assign busyTable_io_readReq_0 = stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 192:37]
  assign busyTable_io_readReq_1 = stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 193:37]
  assign busyTable_io_readReq_2 = stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 192:37]
  assign busyTable_io_readReq_3 = stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 193:37]
  assign busyTable_io_readReq_4 = stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 192:37]
  assign busyTable_io_readReq_5 = stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 193:37]
  assign busyTable_io_allocReq_0_valid = _busyTable_io_allocReq_0_valid_T_1 & stgData_0_rdValid & stgData_0_ldst != 5'h0
    ; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:76]
  assign busyTable_io_allocReq_0_bits = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:36]
  assign busyTable_io_allocReq_1_valid = _busyTable_io_allocReq_1_valid_T_1 & stgData_1_rdValid & stgData_1_ldst != 5'h0
    ; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:76]
  assign busyTable_io_allocReq_1_bits = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:36]
  assign busyTable_io_allocReq_2_valid = _busyTable_io_allocReq_2_valid_T_1 & stgData_2_rdValid & stgData_2_ldst != 5'h0
    ; // @[src/main/scala/backend/dispatch/DispatchStage.scala 199:76]
  assign busyTable_io_allocReq_2_bits = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 200:36]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 20:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 20:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      stgValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 130:14]
    end else begin
      stgValid <= _GEN_7;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 139:20]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 139:20]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 21:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 139:20]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 140:20]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 143:28]
      iqSent_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 140:20]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 143:28]
      iqSent_1 <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 22:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 133:20]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 140:20]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 143:28]
      iqSent_2 <= _GEN_2;
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_mulDivOp <= io_in_0_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_excpVec <= io_in_0_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_ldst <= io_in_0_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_lrs1 <= io_in_0_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_lrs2 <= io_in_0_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_pdst <= io_in_0_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_prs1 <= io_in_0_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_prs2 <= io_in_0_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_oldPdst <= io_in_0_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_0_robIdx <= io_in_0_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_mulDivOp <= io_in_1_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_excpVec <= io_in_1_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_ldst <= io_in_1_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_lrs1 <= io_in_1_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_lrs2 <= io_in_1_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_pdst <= io_in_1_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_prs1 <= io_in_1_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_prs2 <= io_in_1_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_oldPdst <= io_in_1_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_1_robIdx <= io_in_1_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_mulDivOp <= io_in_2_bits_ctrl_mulDivOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_excpVec <= io_in_2_bits_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_ldst <= io_in_2_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_lrs1 <= io_in_2_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_lrs2 <= io_in_2_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_pdst <= io_in_2_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_prs1 <= io_in_2_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_prs2 <= io_in_2_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_oldPdst <= io_in_2_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:39]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:22]
        stgData_2_robIdx <= io_in_2_bits_robIdx; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 162:26]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 162:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 171:39]
      lqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 172:15]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 165:22]
      lqHeadPtr <= _lqHeadPtr_T_8; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:15]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 163:26]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 163:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 171:39]
      sqHeadPtr <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:15]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 165:22]
      sqHeadPtr <= _sqHeadPtr_T_8; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:15]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 392:23]
      enqOK <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 392:23]
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 393:17]
      enqOK <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 394:13]
    end else begin
      enqOK <= _GEN_595;
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
  iqSent_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  iqSent_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  iqSent_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_pc = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_inst = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_ctrl_mulDivOp = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_excpVec = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_imm = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_27[13:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_ldst = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_lrs1 = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_lrs2 = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_pdst = _RAND_38[6:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_prs1 = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_prs2 = _RAND_40[6:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_oldPdst = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_0_robIdx = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_1_pc = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_1_inst = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_48[3:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_1_ctrl_mulDivOp = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_excpVec = _RAND_64[9:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_imm = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_66[13:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_ldst = _RAND_74[4:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_lrs1 = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_lrs2 = _RAND_76[4:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_pdst = _RAND_77[6:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_prs1 = _RAND_78[6:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_prs2 = _RAND_79[6:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_oldPdst = _RAND_80[6:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_1_robIdx = _RAND_84[5:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_2_pc = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_2_inst = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_88[4:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_90[3:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_2_ctrl_mulDivOp = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_95[3:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_2_excpVec = _RAND_103[9:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_2_imm = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_105[13:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_ldst = _RAND_113[4:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_lrs1 = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_2_lrs2 = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_2_pdst = _RAND_116[6:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_2_prs1 = _RAND_117[6:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_2_prs2 = _RAND_118[6:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_2_oldPdst = _RAND_119[6:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  stgData_2_robIdx = _RAND_123[5:0];
  _RAND_124 = {1{`RANDOM}};
  lqHeadPtr = _RAND_124[3:0];
  _RAND_125 = {1{`RANDOM}};
  sqHeadPtr = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  enqOK = _RAND_126[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
