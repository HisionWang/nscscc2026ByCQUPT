module RenameStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_rj, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_rk, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_0_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_0_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [9:0]  io_in_0_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_in_1_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_rj, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_rk, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_1_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_1_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [9:0]  io_in_1_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_in_2_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_rj, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_rk, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_2_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_2_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [9:0]  io_in_2_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_0_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_0_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_0_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_0_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_1_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_1_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_1_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_1_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_2_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_ratRead_2_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_2_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_ratRead_2_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_out_0_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_0_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_0_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [9:0]  io_out_0_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_0_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_0_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_0_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_0_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_0_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_0_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_0_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [5:0]  io_out_0_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_0_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_out_1_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_1_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_1_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [9:0]  io_out_1_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_1_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_1_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_1_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_1_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_1_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_1_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_1_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [5:0]  io_out_1_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_1_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_out_2_ready, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_2_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_2_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [9:0]  io_out_2_bits_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_2_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_2_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [4:0]  io_out_2_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_2_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_2_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_2_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_out_2_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [5:0]  io_out_2_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output        io_out_2_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_commit_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [4:0]  io_commit_0_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [6:0]  io_commit_0_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_commit_0_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input         io_redirect_valid, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  input  [5:0]  io_redirect_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_0, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_1, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_2, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_3, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_4, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_5, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_6, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_7, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_8, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_9, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_10, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_11, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_12, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_13, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_14, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_15, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_16, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_17, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_18, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_19, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_20, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_21, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_22, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_23, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_24, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_25, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_26, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_27, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_28, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_29, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_30, // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
  output [6:0]  io_debugArchState_31 // @[src/main/scala/backend/rename/RenameStage.scala 47:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  rat_clock; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_reset; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_redirect; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_0_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_1_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_1_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_2_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_2_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_3_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_3_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_3_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_4_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_4_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_4_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_5_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_readPorts_5_hold; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_5_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_6_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_6_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_7_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_7_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_readPorts_8_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_readPorts_8_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_specWritePorts_0_wen; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_specWritePorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_specWritePorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_specWritePorts_1_wen; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_specWritePorts_1_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_specWritePorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_specWritePorts_2_wen; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_specWritePorts_2_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_specWritePorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_archWritePorts_0_wen; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_archWritePorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_archWritePorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_0; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_1; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_2; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_3; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_4; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_5; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_6; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_7; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_8; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_9; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_10; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_11; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_12; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_13; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_14; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_15; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_16; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_17; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_18; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_19; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_20; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_21; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_22; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_23; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_24; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_25; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_26; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_27; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_28; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_29; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_30; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_debugArchState_31; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [4:0] rat_io_archReadPorts_0_laddr; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [6:0] rat_io_archReadPorts_0_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  rat_io_snptEnq; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire [2:0] rat_io_snptSelect; // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
  wire  freeList_clock; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_reset; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_allocReqs_0; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_allocReqs_1; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_allocReqs_2; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [6:0] freeList_io_allocPdest_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [6:0] freeList_io_allocPdest_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [6:0] freeList_io_allocPdest_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_doAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_deallocReqs_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [6:0] freeList_io_deallocReqs_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_renBrTags_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [2:0] freeList_io_renBrTags_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_renBrTags_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [2:0] freeList_io_renBrTags_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_renBrTags_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [2:0] freeList_io_renBrTags_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire  freeList_io_brMispredict; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  wire [2:0] freeList_io_brMispredTag; // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
  reg  stgValid; // @[src/main/scala/backend/rename/RenameStage.scala 84:26]
  reg  laneValid_0; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
  reg  laneValid_1; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
  reg  laneValid_2; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_rj; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_rk; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_0_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_0_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [9:0] stgData_0_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_rj; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_rk; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_1_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_1_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [9:0] stgData_1_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_rj; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_rk; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_2_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_2_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [9:0] stgData_2_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 86:22]
  wire  _outReadyAll_T_1 = ~laneValid_0 | io_out_0_ready; // @[src/main/scala/backend/rename/RenameStage.scala 91:19]
  wire  _outReadyAll_T_3 = ~laneValid_1 | io_out_1_ready; // @[src/main/scala/backend/rename/RenameStage.scala 91:19]
  wire  _outReadyAll_T_5 = ~laneValid_2 | io_out_2_ready; // @[src/main/scala/backend/rename/RenameStage.scala 91:19]
  wire  outReadyAll = _outReadyAll_T_1 & _outReadyAll_T_3 & _outReadyAll_T_5; // @[src/main/scala/backend/rename/RenameStage.scala 92:14]
  wire  _needAllocVec_T = stgValid & laneValid_0; // @[src/main/scala/backend/rename/RenameStage.scala 97:14]
  wire  _needAllocVec_T_2 = stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:69]
  wire  needAllocVec_0 = stgValid & laneValid_0 & stgData_0_rdValid & stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  wire  _needAllocVec_T_4 = stgValid & laneValid_1; // @[src/main/scala/backend/rename/RenameStage.scala 97:14]
  wire  _needAllocVec_T_6 = stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:69]
  wire  needAllocVec_1 = stgValid & laneValid_1 & stgData_1_rdValid & stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  wire  _needAllocVec_T_8 = stgValid & laneValid_2; // @[src/main/scala/backend/rename/RenameStage.scala 97:14]
  wire  _needAllocVec_T_10 = stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:69]
  wire  needAllocVec_2 = stgValid & laneValid_2 & stgData_2_rdValid & stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  wire  outFire = stgValid & outReadyAll & freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 104:41]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 107:28]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 110:45]
  wire  inFire = inValid & stgReady; // @[src/main/scala/backend/rename/RenameStage.scala 111:25]
  wire  _GEN_0 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/rename/RenameStage.scala 134:23 136:14 84:26]
  wire  _GEN_4 = inFire | _GEN_0; // @[src/main/scala/backend/rename/RenameStage.scala 127:22 129:14]
  wire  jHasAlloc = laneValid_0 & needAllocVec_0 & _needAllocVec_T_2; // @[src/main/scala/backend/rename/RenameStage.scala 303:55]
  wire [6:0] prs1Raw_1 = rat_io_readPorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 281:{29,29}]
  wire [6:0] prs1Final_1 = jHasAlloc & stgData_0_rd == stgData_1_rj & stgData_1_rs1Valid ? freeList_io_allocPdest_0_bits
     : prs1Raw_1; // @[src/main/scala/backend/rename/RenameStage.scala 308:81 309:22 297:23]
  wire [6:0] prs2Raw_1 = rat_io_readPorts_4_data; // @[src/main/scala/backend/rename/RenameStage.scala 284:{29,29}]
  wire [6:0] prs2Final_1 = jHasAlloc & stgData_0_rd == stgData_1_rk & stgData_1_rs2Valid ? freeList_io_allocPdest_0_bits
     : prs2Raw_1; // @[src/main/scala/backend/rename/RenameStage.scala 312:81 313:22 298:23]
  wire [6:0] oldPdstRaw_1 = rat_io_readPorts_7_data; // @[src/main/scala/backend/rename/RenameStage.scala 287:{27,27}]
  wire [6:0] oldPdstFinal_1 = jHasAlloc & stgData_0_rd == stgData_1_rd ? freeList_io_allocPdest_0_bits : oldPdstRaw_1; // @[src/main/scala/backend/rename/RenameStage.scala 299:21 317:58 318:25]
  wire  jHasAlloc_1 = laneValid_0 & needAllocVec_0 & _needAllocVec_T_2; // @[src/main/scala/backend/rename/RenameStage.scala 303:55]
  wire [6:0] prs1Raw_2 = rat_io_readPorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 281:{29,29}]
  wire [6:0] _GEN_237 = jHasAlloc & stgData_0_rd == stgData_2_rj & stgData_2_rs1Valid ? freeList_io_allocPdest_0_bits :
    prs1Raw_2; // @[src/main/scala/backend/rename/RenameStage.scala 308:81 309:22 297:23]
  wire [6:0] prs2Raw_2 = rat_io_readPorts_5_data; // @[src/main/scala/backend/rename/RenameStage.scala 284:{29,29}]
  wire [6:0] _GEN_238 = jHasAlloc & stgData_0_rd == stgData_2_rk & stgData_2_rs2Valid ? freeList_io_allocPdest_0_bits :
    prs2Raw_2; // @[src/main/scala/backend/rename/RenameStage.scala 312:81 313:22 298:23]
  wire [6:0] oldPdstRaw_2 = rat_io_readPorts_8_data; // @[src/main/scala/backend/rename/RenameStage.scala 287:{27,27}]
  wire [6:0] _GEN_239 = jHasAlloc & stgData_0_rd == stgData_2_rd ? freeList_io_allocPdest_0_bits : oldPdstRaw_2; // @[src/main/scala/backend/rename/RenameStage.scala 299:21 317:58 318:25]
  wire  jHasAlloc_2 = laneValid_1 & needAllocVec_1 & _needAllocVec_T_6; // @[src/main/scala/backend/rename/RenameStage.scala 303:55]
  wire [6:0] prs1Final_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rj & stgData_2_rs1Valid ?
    freeList_io_allocPdest_1_bits : _GEN_237; // @[src/main/scala/backend/rename/RenameStage.scala 308:81 309:22]
  wire [6:0] prs2Final_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rk & stgData_2_rs2Valid ?
    freeList_io_allocPdest_1_bits : _GEN_238; // @[src/main/scala/backend/rename/RenameStage.scala 312:81 313:22]
  wire [6:0] oldPdstFinal_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rd ? freeList_io_allocPdest_1_bits : _GEN_239; // @[src/main/scala/backend/rename/RenameStage.scala 317:58 318:25]
  reg [5:0] robIdxHead_value; // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
  reg  robIdxHead_flag; // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
  wire [1:0] _validCount_T_3 = _needAllocVec_T_4 + _needAllocVec_T_8; // @[src/main/scala/backend/rename/RenameStage.scala 341:28]
  wire [1:0] _GEN_247 = {{1'd0}, _needAllocVec_T}; // @[src/main/scala/backend/rename/RenameStage.scala 341:28]
  wire [2:0] _validCount_T_5 = _GEN_247 + _validCount_T_3; // @[src/main/scala/backend/rename/RenameStage.scala 341:28]
  wire [1:0] validCount = _validCount_T_5[1:0]; // @[src/main/scala/backend/rename/RenameStage.scala 341:28]
  wire [5:0] _GEN_248 = {{4'd0}, validCount}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [6:0] robIdxHeadNext_newIncValue = robIdxHead_value + _GEN_248; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIdxHeadNext_wrap = robIdxHeadNext_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] robIdxHeadNext_newPtr_value = robIdxHeadNext_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [6:0] thisPtr_newIncValue = {{1'd0}, robIdxHead_value}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  thisPtr_wrap = thisPtr_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] thisPtr_value = thisPtr_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [5:0] _GEN_249 = {{5'd0}, laneValid_0}; // @[src/main/scala/backend/rename/RenameStage.scala 371:27]
  wire [6:0] _T_24 = {{1'd0}, _GEN_249}; // @[src/main/scala/backend/rename/RenameStage.scala 371:27]
  wire [6:0] thisPtr_newIncValue_1 = robIdxHead_value + _T_24[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  thisPtr_wrap_1 = thisPtr_newIncValue_1 >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] _GEN_250 = {{5'd0}, laneValid_1}; // @[src/main/scala/backend/rename/RenameStage.scala 371:27]
  wire [5:0] _T_27 = _T_24[5:0] + _GEN_250; // @[src/main/scala/backend/rename/RenameStage.scala 371:27]
  wire [6:0] thisPtr_newIncValue_2 = robIdxHead_value + _T_27; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  thisPtr_wrap_2 = thisPtr_newIncValue_2 >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [6:0] freeList_io_renBrTags_1_bits_newIncValue = robIdxHead_value + 6'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [5:0] freeList_io_renBrTags_1_bits_newPtr_value = freeList_io_renBrTags_1_bits_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [6:0] freeList_io_renBrTags_2_bits_newIncValue = robIdxHead_value + 6'h2; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [5:0] freeList_io_renBrTags_2_bits_newPtr_value = freeList_io_renBrTags_2_bits_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  _hasBranch_T_1 = _needAllocVec_T & stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 395:30]
  wire  _hasBranch_T_3 = _needAllocVec_T_4 & stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 395:30]
  wire  _hasBranch_T_5 = _needAllocVec_T_8 & stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 395:30]
  wire [2:0] _hasBranch_T_6 = {_hasBranch_T_5,_hasBranch_T_3,_hasBranch_T_1}; // @[src/main/scala/backend/rename/RenameStage.scala 396:6]
  wire  hasBranch = |_hasBranch_T_6; // @[src/main/scala/backend/rename/RenameStage.scala 396:13]
  wire [6:0] prs1Raw_0 = rat_io_readPorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 281:{29,29}]
  wire [6:0] prs2Raw_0 = rat_io_readPorts_3_data; // @[src/main/scala/backend/rename/RenameStage.scala 284:{29,29}]
  wire [6:0] oldPdstRaw_0 = rat_io_readPorts_6_data; // @[src/main/scala/backend/rename/RenameStage.scala 287:{27,27}]
  RenameTable rat ( // @[src/main/scala/backend/rename/RenameStage.scala 72:24]
    .clock(rat_clock),
    .reset(rat_reset),
    .io_redirect(rat_io_redirect),
    .io_readPorts_0_addr(rat_io_readPorts_0_addr),
    .io_readPorts_0_hold(rat_io_readPorts_0_hold),
    .io_readPorts_0_data(rat_io_readPorts_0_data),
    .io_readPorts_1_addr(rat_io_readPorts_1_addr),
    .io_readPorts_1_hold(rat_io_readPorts_1_hold),
    .io_readPorts_1_data(rat_io_readPorts_1_data),
    .io_readPorts_2_addr(rat_io_readPorts_2_addr),
    .io_readPorts_2_hold(rat_io_readPorts_2_hold),
    .io_readPorts_2_data(rat_io_readPorts_2_data),
    .io_readPorts_3_addr(rat_io_readPorts_3_addr),
    .io_readPorts_3_hold(rat_io_readPorts_3_hold),
    .io_readPorts_3_data(rat_io_readPorts_3_data),
    .io_readPorts_4_addr(rat_io_readPorts_4_addr),
    .io_readPorts_4_hold(rat_io_readPorts_4_hold),
    .io_readPorts_4_data(rat_io_readPorts_4_data),
    .io_readPorts_5_addr(rat_io_readPorts_5_addr),
    .io_readPorts_5_hold(rat_io_readPorts_5_hold),
    .io_readPorts_5_data(rat_io_readPorts_5_data),
    .io_readPorts_6_addr(rat_io_readPorts_6_addr),
    .io_readPorts_6_data(rat_io_readPorts_6_data),
    .io_readPorts_7_addr(rat_io_readPorts_7_addr),
    .io_readPorts_7_data(rat_io_readPorts_7_data),
    .io_readPorts_8_addr(rat_io_readPorts_8_addr),
    .io_readPorts_8_data(rat_io_readPorts_8_data),
    .io_specWritePorts_0_wen(rat_io_specWritePorts_0_wen),
    .io_specWritePorts_0_addr(rat_io_specWritePorts_0_addr),
    .io_specWritePorts_0_data(rat_io_specWritePorts_0_data),
    .io_specWritePorts_1_wen(rat_io_specWritePorts_1_wen),
    .io_specWritePorts_1_addr(rat_io_specWritePorts_1_addr),
    .io_specWritePorts_1_data(rat_io_specWritePorts_1_data),
    .io_specWritePorts_2_wen(rat_io_specWritePorts_2_wen),
    .io_specWritePorts_2_addr(rat_io_specWritePorts_2_addr),
    .io_specWritePorts_2_data(rat_io_specWritePorts_2_data),
    .io_archWritePorts_0_wen(rat_io_archWritePorts_0_wen),
    .io_archWritePorts_0_addr(rat_io_archWritePorts_0_addr),
    .io_archWritePorts_0_data(rat_io_archWritePorts_0_data),
    .io_debugArchState_0(rat_io_debugArchState_0),
    .io_debugArchState_1(rat_io_debugArchState_1),
    .io_debugArchState_2(rat_io_debugArchState_2),
    .io_debugArchState_3(rat_io_debugArchState_3),
    .io_debugArchState_4(rat_io_debugArchState_4),
    .io_debugArchState_5(rat_io_debugArchState_5),
    .io_debugArchState_6(rat_io_debugArchState_6),
    .io_debugArchState_7(rat_io_debugArchState_7),
    .io_debugArchState_8(rat_io_debugArchState_8),
    .io_debugArchState_9(rat_io_debugArchState_9),
    .io_debugArchState_10(rat_io_debugArchState_10),
    .io_debugArchState_11(rat_io_debugArchState_11),
    .io_debugArchState_12(rat_io_debugArchState_12),
    .io_debugArchState_13(rat_io_debugArchState_13),
    .io_debugArchState_14(rat_io_debugArchState_14),
    .io_debugArchState_15(rat_io_debugArchState_15),
    .io_debugArchState_16(rat_io_debugArchState_16),
    .io_debugArchState_17(rat_io_debugArchState_17),
    .io_debugArchState_18(rat_io_debugArchState_18),
    .io_debugArchState_19(rat_io_debugArchState_19),
    .io_debugArchState_20(rat_io_debugArchState_20),
    .io_debugArchState_21(rat_io_debugArchState_21),
    .io_debugArchState_22(rat_io_debugArchState_22),
    .io_debugArchState_23(rat_io_debugArchState_23),
    .io_debugArchState_24(rat_io_debugArchState_24),
    .io_debugArchState_25(rat_io_debugArchState_25),
    .io_debugArchState_26(rat_io_debugArchState_26),
    .io_debugArchState_27(rat_io_debugArchState_27),
    .io_debugArchState_28(rat_io_debugArchState_28),
    .io_debugArchState_29(rat_io_debugArchState_29),
    .io_debugArchState_30(rat_io_debugArchState_30),
    .io_debugArchState_31(rat_io_debugArchState_31),
    .io_archReadPorts_0_laddr(rat_io_archReadPorts_0_laddr),
    .io_archReadPorts_0_pdata(rat_io_archReadPorts_0_pdata),
    .io_snptEnq(rat_io_snptEnq),
    .io_snptSelect(rat_io_snptSelect)
  );
  FreeList freeList ( // @[src/main/scala/backend/rename/RenameStage.scala 73:24]
    .clock(freeList_clock),
    .reset(freeList_reset),
    .io_allocReqs_0(freeList_io_allocReqs_0),
    .io_allocReqs_1(freeList_io_allocReqs_1),
    .io_allocReqs_2(freeList_io_allocReqs_2),
    .io_allocPdest_0_bits(freeList_io_allocPdest_0_bits),
    .io_allocPdest_1_bits(freeList_io_allocPdest_1_bits),
    .io_allocPdest_2_bits(freeList_io_allocPdest_2_bits),
    .io_canAlloc(freeList_io_canAlloc),
    .io_doAlloc(freeList_io_doAlloc),
    .io_deallocReqs_0_valid(freeList_io_deallocReqs_0_valid),
    .io_deallocReqs_0_bits(freeList_io_deallocReqs_0_bits),
    .io_renBrTags_0_valid(freeList_io_renBrTags_0_valid),
    .io_renBrTags_0_bits(freeList_io_renBrTags_0_bits),
    .io_renBrTags_1_valid(freeList_io_renBrTags_1_valid),
    .io_renBrTags_1_bits(freeList_io_renBrTags_1_bits),
    .io_renBrTags_2_valid(freeList_io_renBrTags_2_valid),
    .io_renBrTags_2_bits(freeList_io_renBrTags_2_bits),
    .io_brMispredict(freeList_io_brMispredict),
    .io_brMispredTag(freeList_io_brMispredTag)
  );
  assign io_in_0_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 107:28]
  assign io_in_1_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 107:28]
  assign io_in_2_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 107:28]
  assign io_out_0_valid = _needAllocVec_T & freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 445:49]
  assign io_out_0_bits_pc = stgData_0_pc; // @[src/main/scala/backend/rename/RenameStage.scala 412:18]
  assign io_out_0_bits_inst = stgData_0_inst; // @[src/main/scala/backend/rename/RenameStage.scala 413:18]
  assign io_out_0_bits_ctrl_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_aluOp = stgData_0_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_bruOp = stgData_0_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_lsuOp = stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_csrOp = stgData_0_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_mulOp = stgData_0_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_divOp = stgData_0_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_src1Type = stgData_0_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_src2Type = stgData_0_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_immType = stgData_0_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_isBranch = stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_isJump = stgData_0_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_ctrl_isPriv = stgData_0_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_0_bits_excpVec = stgData_0_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 415:18]
  assign io_out_0_bits_imm = stgData_0_imm; // @[src/main/scala/backend/rename/RenameStage.scala 416:18]
  assign io_out_0_bits_csrAddress = stgData_0_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 417:18]
  assign io_out_0_bits_pdInfo_valid = stgData_0_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_isBr = stgData_0_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_isJal = stgData_0_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_isJalr = stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_isCall = stgData_0_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_isRet = stgData_0_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_pdInfo_jumpTarget = stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_0_bits_ldst = stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 421:12]
  assign io_out_0_bits_lrs1 = stgData_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 422:12]
  assign io_out_0_bits_lrs2 = stgData_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 423:12]
  assign io_out_0_bits_pdst = needAllocVec_0 ? freeList_io_allocPdest_0_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 431:18]
  assign io_out_0_bits_prs1 = stgData_0_rj == 5'h0 | ~stgData_0_rs1Valid ? 7'h0 : prs1Raw_0; // @[src/main/scala/backend/rename/RenameStage.scala 427:18]
  assign io_out_0_bits_prs2 = stgData_0_rk == 5'h0 & ~stgData_0_ctrl_memWrite | ~stgData_0_rs2Valid ? 7'h0 : prs2Raw_0; // @[src/main/scala/backend/rename/RenameStage.scala 429:18]
  assign io_out_0_bits_oldPdst = needAllocVec_0 & _needAllocVec_T_2 ? oldPdstRaw_0 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 432:21]
  assign io_out_0_bits_rs1Valid = stgData_0_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 436:16]
  assign io_out_0_bits_rs2Valid = stgData_0_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 437:16]
  assign io_out_0_bits_rdValid = stgData_0_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 438:16]
  assign io_out_0_bits_robIdx_value = thisPtr_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_0_bits_robIdx_flag = thisPtr_wrap ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign io_out_1_valid = _needAllocVec_T_4 & freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 445:49]
  assign io_out_1_bits_pc = stgData_1_pc; // @[src/main/scala/backend/rename/RenameStage.scala 412:18]
  assign io_out_1_bits_inst = stgData_1_inst; // @[src/main/scala/backend/rename/RenameStage.scala 413:18]
  assign io_out_1_bits_ctrl_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_aluOp = stgData_1_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_bruOp = stgData_1_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_lsuOp = stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_csrOp = stgData_1_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_mulOp = stgData_1_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_divOp = stgData_1_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_src1Type = stgData_1_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_src2Type = stgData_1_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_immType = stgData_1_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_isBranch = stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_isJump = stgData_1_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_ctrl_isPriv = stgData_1_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_1_bits_excpVec = stgData_1_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 415:18]
  assign io_out_1_bits_imm = stgData_1_imm; // @[src/main/scala/backend/rename/RenameStage.scala 416:18]
  assign io_out_1_bits_csrAddress = stgData_1_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 417:18]
  assign io_out_1_bits_pdInfo_valid = stgData_1_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_isBr = stgData_1_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_isJal = stgData_1_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_isJalr = stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_isCall = stgData_1_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_isRet = stgData_1_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_pdInfo_jumpTarget = stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_1_bits_ldst = stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 421:12]
  assign io_out_1_bits_lrs1 = stgData_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 422:12]
  assign io_out_1_bits_lrs2 = stgData_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 423:12]
  assign io_out_1_bits_pdst = needAllocVec_1 ? freeList_io_allocPdest_1_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 431:18]
  assign io_out_1_bits_prs1 = stgData_1_rj == 5'h0 | ~stgData_1_rs1Valid ? 7'h0 : prs1Final_1; // @[src/main/scala/backend/rename/RenameStage.scala 427:18]
  assign io_out_1_bits_prs2 = stgData_1_rk == 5'h0 & ~stgData_1_ctrl_memWrite | ~stgData_1_rs2Valid ? 7'h0 : prs2Final_1
    ; // @[src/main/scala/backend/rename/RenameStage.scala 429:18]
  assign io_out_1_bits_oldPdst = needAllocVec_1 & _needAllocVec_T_6 ? oldPdstFinal_1 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 432:21]
  assign io_out_1_bits_rs1Valid = stgData_1_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 436:16]
  assign io_out_1_bits_rs2Valid = stgData_1_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 437:16]
  assign io_out_1_bits_rdValid = stgData_1_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 438:16]
  assign io_out_1_bits_robIdx_value = thisPtr_newIncValue_1[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_1_bits_robIdx_flag = thisPtr_wrap_1 ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign io_out_2_valid = _needAllocVec_T_8 & freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 445:49]
  assign io_out_2_bits_pc = stgData_2_pc; // @[src/main/scala/backend/rename/RenameStage.scala 412:18]
  assign io_out_2_bits_inst = stgData_2_inst; // @[src/main/scala/backend/rename/RenameStage.scala 413:18]
  assign io_out_2_bits_ctrl_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_aluOp = stgData_2_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_bruOp = stgData_2_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_lsuOp = stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_csrOp = stgData_2_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_mulOp = stgData_2_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_divOp = stgData_2_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_src1Type = stgData_2_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_src2Type = stgData_2_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_immType = stgData_2_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_isBranch = stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_isJump = stgData_2_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_ctrl_isPriv = stgData_2_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 414:18]
  assign io_out_2_bits_excpVec = stgData_2_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 415:18]
  assign io_out_2_bits_imm = stgData_2_imm; // @[src/main/scala/backend/rename/RenameStage.scala 416:18]
  assign io_out_2_bits_csrAddress = stgData_2_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 417:18]
  assign io_out_2_bits_pdInfo_valid = stgData_2_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_isBr = stgData_2_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_isJal = stgData_2_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_isJalr = stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_isCall = stgData_2_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_isRet = stgData_2_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_pdInfo_jumpTarget = stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 418:18]
  assign io_out_2_bits_ldst = stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 421:12]
  assign io_out_2_bits_lrs1 = stgData_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 422:12]
  assign io_out_2_bits_lrs2 = stgData_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 423:12]
  assign io_out_2_bits_pdst = needAllocVec_2 ? freeList_io_allocPdest_2_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 431:18]
  assign io_out_2_bits_prs1 = stgData_2_rj == 5'h0 | ~stgData_2_rs1Valid ? 7'h0 : prs1Final_2; // @[src/main/scala/backend/rename/RenameStage.scala 427:18]
  assign io_out_2_bits_prs2 = stgData_2_rk == 5'h0 & ~stgData_2_ctrl_memWrite | ~stgData_2_rs2Valid ? 7'h0 : prs2Final_2
    ; // @[src/main/scala/backend/rename/RenameStage.scala 429:18]
  assign io_out_2_bits_oldPdst = needAllocVec_2 & _needAllocVec_T_10 ? oldPdstFinal_2 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 432:21]
  assign io_out_2_bits_rs1Valid = stgData_2_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 436:16]
  assign io_out_2_bits_rs2Valid = stgData_2_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 437:16]
  assign io_out_2_bits_rdValid = stgData_2_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 438:16]
  assign io_out_2_bits_robIdx_value = thisPtr_newIncValue_2[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_2_bits_robIdx_flag = thisPtr_wrap_2 ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign io_debugArchState_0 = rat_io_debugArchState_0; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_1 = rat_io_debugArchState_1; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_2 = rat_io_debugArchState_2; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_3 = rat_io_debugArchState_3; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_4 = rat_io_debugArchState_4; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_5 = rat_io_debugArchState_5; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_6 = rat_io_debugArchState_6; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_7 = rat_io_debugArchState_7; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_8 = rat_io_debugArchState_8; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_9 = rat_io_debugArchState_9; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_10 = rat_io_debugArchState_10; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_11 = rat_io_debugArchState_11; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_12 = rat_io_debugArchState_12; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_13 = rat_io_debugArchState_13; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_14 = rat_io_debugArchState_14; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_15 = rat_io_debugArchState_15; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_16 = rat_io_debugArchState_16; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_17 = rat_io_debugArchState_17; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_18 = rat_io_debugArchState_18; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_19 = rat_io_debugArchState_19; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_20 = rat_io_debugArchState_20; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_21 = rat_io_debugArchState_21; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_22 = rat_io_debugArchState_22; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_23 = rat_io_debugArchState_23; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_24 = rat_io_debugArchState_24; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_25 = rat_io_debugArchState_25; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_26 = rat_io_debugArchState_26; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_27 = rat_io_debugArchState_27; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_28 = rat_io_debugArchState_28; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_29 = rat_io_debugArchState_29; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_30 = rat_io_debugArchState_30; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign io_debugArchState_31 = rat_io_debugArchState_31; // @[src/main/scala/backend/rename/RenameStage.scala 75:21]
  assign rat_clock = clock;
  assign rat_reset = reset;
  assign rat_io_redirect = io_redirect_valid; // @[src/main/scala/backend/rename/RenameStage.scala 248:19]
  assign rat_io_readPorts_0_addr = io_ratRead_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 165:44]
  assign rat_io_readPorts_0_hold = io_ratRead_0_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 166:44]
  assign rat_io_readPorts_1_addr = io_ratRead_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 165:44]
  assign rat_io_readPorts_1_hold = io_ratRead_1_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 166:44]
  assign rat_io_readPorts_2_addr = io_ratRead_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 165:44]
  assign rat_io_readPorts_2_hold = io_ratRead_2_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 166:44]
  assign rat_io_readPorts_3_addr = io_ratRead_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 168:49]
  assign rat_io_readPorts_3_hold = io_ratRead_0_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 169:49]
  assign rat_io_readPorts_4_addr = io_ratRead_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 168:49]
  assign rat_io_readPorts_4_hold = io_ratRead_1_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 169:49]
  assign rat_io_readPorts_5_addr = io_ratRead_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 168:49]
  assign rat_io_readPorts_5_hold = io_ratRead_2_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 169:49]
  assign rat_io_readPorts_6_addr = stgValid ? stgData_0_rd : io_in_0_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 183:10]
  assign rat_io_readPorts_7_addr = stgValid ? stgData_1_rd : io_in_1_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 183:10]
  assign rat_io_readPorts_8_addr = stgValid ? stgData_2_rd : io_in_2_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 183:10]
  assign rat_io_specWritePorts_0_wen = outFire & needAllocVec_0; // @[src/main/scala/backend/rename/RenameStage.scala 230:39]
  assign rat_io_specWritePorts_0_addr = stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 231:28]
  assign rat_io_specWritePorts_0_data = freeList_io_allocPdest_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 232:28]
  assign rat_io_specWritePorts_1_wen = outFire & needAllocVec_1; // @[src/main/scala/backend/rename/RenameStage.scala 230:39]
  assign rat_io_specWritePorts_1_addr = stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 231:28]
  assign rat_io_specWritePorts_1_data = freeList_io_allocPdest_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 232:28]
  assign rat_io_specWritePorts_2_wen = outFire & needAllocVec_2; // @[src/main/scala/backend/rename/RenameStage.scala 230:39]
  assign rat_io_specWritePorts_2_addr = stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 231:28]
  assign rat_io_specWritePorts_2_data = freeList_io_allocPdest_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 227:28 232:28]
  assign rat_io_archWritePorts_0_wen = io_commit_0_valid & io_commit_0_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 240:57]
  assign rat_io_archWritePorts_0_addr = io_commit_0_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 241:35]
  assign rat_io_archWritePorts_0_data = io_commit_0_pdst; // @[src/main/scala/backend/rename/RenameStage.scala 242:35]
  assign rat_io_archReadPorts_0_laddr = io_commit_0_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 254:38]
  assign rat_io_snptEnq = hasBranch & outFire; // @[src/main/scala/backend/rename/RenameStage.scala 399:36]
  assign rat_io_snptSelect = io_redirect_robIdx_value[2:0]; // @[src/main/scala/backend/rename/RenameStage.scala 403:50]
  assign freeList_clock = clock;
  assign freeList_reset = reset;
  assign freeList_io_allocReqs_0 = stgValid & laneValid_0 & stgData_0_rdValid & stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  assign freeList_io_allocReqs_1 = stgValid & laneValid_1 & stgData_1_rdValid & stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  assign freeList_io_allocReqs_2 = stgValid & laneValid_2 & stgData_2_rdValid & stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 97:52]
  assign freeList_io_doAlloc = stgValid & outReadyAll & freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 104:41]
  assign freeList_io_deallocReqs_0_valid = io_commit_0_valid & io_commit_0_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 255:60]
  assign freeList_io_deallocReqs_0_bits = rat_io_archReadPorts_0_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 256:38]
  assign freeList_io_renBrTags_0_valid = outFire & laneValid_0 & stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 384:63]
  assign freeList_io_renBrTags_0_bits = thisPtr_value[2:0]; // @[src/main/scala/backend/rename/RenameStage.scala 386:31]
  assign freeList_io_renBrTags_1_valid = outFire & laneValid_1 & stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 384:63]
  assign freeList_io_renBrTags_1_bits = freeList_io_renBrTags_1_bits_newPtr_value[2:0]; // @[src/main/scala/backend/rename/RenameStage.scala 386:31]
  assign freeList_io_renBrTags_2_valid = outFire & laneValid_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 384:63]
  assign freeList_io_renBrTags_2_bits = freeList_io_renBrTags_2_bits_newPtr_value[2:0]; // @[src/main/scala/backend/rename/RenameStage.scala 386:31]
  assign freeList_io_brMispredict = io_redirect_valid; // @[src/main/scala/backend/rename/RenameStage.scala 378:28]
  assign freeList_io_brMispredTag = io_redirect_robIdx_value[2:0]; // @[src/main/scala/backend/rename/RenameStage.scala 379:55]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 84:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 84:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      stgValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 123:14]
    end else begin
      stgValid <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 125:20]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 131:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 134:23]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 138:20]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 125:20]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 131:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 134:23]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 138:20]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 85:26]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 125:20]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 131:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 134:23]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 138:20]
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rd <= io_in_0_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rj <= io_in_0_bits_rj; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rk <= io_in_0_bits_rk; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rs1 <= io_in_0_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rs2 <= io_in_0_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_mulOp <= io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_divOp <= io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_excpVec <= io_in_0_bits_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rd <= io_in_1_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rj <= io_in_1_bits_rj; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rk <= io_in_1_bits_rk; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rs1 <= io_in_1_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rs2 <= io_in_1_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_mulOp <= io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_divOp <= io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_excpVec <= io_in_1_bits_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rd <= io_in_2_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rj <= io_in_2_bits_rj; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rk <= io_in_2_bits_rk; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rs1 <= io_in_2_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rs2 <= io_in_2_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_mulOp <= io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_divOp <= io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_excpVec <= io_in_2_bits_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (!(io_redirect_valid)) begin // @[src/main/scala/backend/rename/RenameStage.scala 121:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 127:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 132:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
      robIdxHead_value <= 6'h0; // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 349:27]
      robIdxHead_value <= io_redirect_robIdx_value; // @[src/main/scala/backend/rename/RenameStage.scala 356:26]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 358:23]
      robIdxHead_value <= robIdxHeadNext_newPtr_value; // @[src/main/scala/backend/rename/RenameStage.scala 360:20]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
      robIdxHead_flag <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 333:27]
    end else if (io_redirect_valid) begin // @[src/main/scala/backend/rename/RenameStage.scala 349:27]
      robIdxHead_flag <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 357:26]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 358:23]
      if (robIdxHeadNext_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        robIdxHead_flag <= ~robIdxHead_flag;
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
  stgData_0_rd = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_rj = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_rk = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_rs1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_rs2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_14[13:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_imm = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_mulOp = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_ctrl_divOp = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_excpVec = _RAND_33[9:0];
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
  stgData_1_pc = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_1_inst = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_1_rd = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_1_rj = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_1_rk = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_1_rs1 = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_1_rs2 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_51[13:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_1_imm = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_ctrl_mulOp = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_ctrl_divOp = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_excpVec = _RAND_70[9:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_2_pc = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_2_inst = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_2_rd = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_2_rj = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_2_rk = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_2_rs1 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_2_rs2 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_88[13:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_2_imm = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_90[3:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_93[3:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_2_ctrl_mulOp = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_2_ctrl_divOp = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_excpVec = _RAND_107[9:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  robIdxHead_value = _RAND_115[5:0];
  _RAND_116 = {1{`RANDOM}};
  robIdxHead_flag = _RAND_116[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
