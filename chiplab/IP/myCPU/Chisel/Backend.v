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
  output        io_redirect_valid, // @[src/main/scala/backend/Backend.scala 20:14]
  output [5:0]  io_redirect_robIdx, // @[src/main/scala/backend/Backend.scala 20:14]
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
  wire  ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [9:0] ctrlBlock_io_q5IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [13:0] ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_q5IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [4:0] ctrlBlock_io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_0_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_lsEnq_req_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_0_bits_isLoad; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_0_bits_isStore; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_1_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_lsEnq_req_1_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_1_bits_isLoad; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_1_bits_isStore; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_1_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_1_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_2_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_lsEnq_req_2_bits_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_2_bits_isLoad; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_lsEnq_req_2_bits_isStore; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_2_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [3:0] ctrlBlock_io_lsEnq_req_2_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 22:25]
  wire [5:0] ctrlBlock_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  ctrlBlock_io_extInt; // @[src/main/scala/backend/Backend.scala 22:25]
  wire  scheduler_clock; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_reset; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q1IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q1IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q1IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q2IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q2IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q2IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q3IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q3IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q3IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q4IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q4IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q4IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4IQEnq_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4IQEnq_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q5IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q5IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q5IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5IQEnq_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5IQEnq_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_ready; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q1Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q1Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q1Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q1Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q1Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q1Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q1Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q1Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q1Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_ready; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q2Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q2Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q2Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q2Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q2Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q2Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q2Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q2Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q2Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_ready; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q3Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q3Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q3Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q3Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q3Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q3Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q3Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q3Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q3Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_ready; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q4Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q4Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q4Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q4Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q4Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q4Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q4Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q4Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q4Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_ready; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [9:0] scheduler_io_q5Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [13:0] scheduler_io_q5Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [31:0] scheduler_io_q5Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_q5Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_q5Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [6:0] scheduler_io_q5Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_q5Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [2:0] scheduler_io_q5Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_q5Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 23:25]
  wire  scheduler_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [5:0] scheduler_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [4:0] scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 23:25]
  wire [3:0] scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 23:25]
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
    .io_q1IQEnq_0_valid(ctrlBlock_io_q1IQEnq_0_valid),
    .io_q1IQEnq_0_bits_pc(ctrlBlock_io_q1IQEnq_0_bits_pc),
    .io_q1IQEnq_0_bits_inst(ctrlBlock_io_q1IQEnq_0_bits_inst),
    .io_q1IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType),
    .io_q1IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp),
    .io_q1IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp),
    .io_q1IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp),
    .io_q1IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp),
    .io_q1IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp),
    .io_q1IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp),
    .io_q1IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type),
    .io_q1IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type),
    .io_q1IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType),
    .io_q1IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen),
    .io_q1IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead),
    .io_q1IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite),
    .io_q1IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen),
    .io_q1IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch),
    .io_q1IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump),
    .io_q1IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv),
    .io_q1IQEnq_0_bits_excpVec(ctrlBlock_io_q1IQEnq_0_bits_excpVec),
    .io_q1IQEnq_0_bits_imm(ctrlBlock_io_q1IQEnq_0_bits_imm),
    .io_q1IQEnq_0_bits_csrAddress(ctrlBlock_io_q1IQEnq_0_bits_csrAddress),
    .io_q1IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid),
    .io_q1IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr),
    .io_q1IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal),
    .io_q1IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr),
    .io_q1IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall),
    .io_q1IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet),
    .io_q1IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_0_bits_ldst(ctrlBlock_io_q1IQEnq_0_bits_ldst),
    .io_q1IQEnq_0_bits_lrs1(ctrlBlock_io_q1IQEnq_0_bits_lrs1),
    .io_q1IQEnq_0_bits_lrs2(ctrlBlock_io_q1IQEnq_0_bits_lrs2),
    .io_q1IQEnq_0_bits_pdst(ctrlBlock_io_q1IQEnq_0_bits_pdst),
    .io_q1IQEnq_0_bits_prs1(ctrlBlock_io_q1IQEnq_0_bits_prs1),
    .io_q1IQEnq_0_bits_prs2(ctrlBlock_io_q1IQEnq_0_bits_prs2),
    .io_q1IQEnq_0_bits_oldPdst(ctrlBlock_io_q1IQEnq_0_bits_oldPdst),
    .io_q1IQEnq_0_bits_rs1Valid(ctrlBlock_io_q1IQEnq_0_bits_rs1Valid),
    .io_q1IQEnq_0_bits_rs2Valid(ctrlBlock_io_q1IQEnq_0_bits_rs2Valid),
    .io_q1IQEnq_0_bits_rdValid(ctrlBlock_io_q1IQEnq_0_bits_rdValid),
    .io_q1IQEnq_0_bits_robIdx(ctrlBlock_io_q1IQEnq_0_bits_robIdx),
    .io_q1IQEnq_0_bits_robIdxFull(ctrlBlock_io_q1IQEnq_0_bits_robIdxFull),
    .io_q1IQEnq_0_bits_prs1Busy(ctrlBlock_io_q1IQEnq_0_bits_prs1Busy),
    .io_q1IQEnq_0_bits_prs2Busy(ctrlBlock_io_q1IQEnq_0_bits_prs2Busy),
    .io_q2IQEnq_0_valid(ctrlBlock_io_q2IQEnq_0_valid),
    .io_q2IQEnq_0_bits_pc(ctrlBlock_io_q2IQEnq_0_bits_pc),
    .io_q2IQEnq_0_bits_inst(ctrlBlock_io_q2IQEnq_0_bits_inst),
    .io_q2IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType),
    .io_q2IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp),
    .io_q2IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp),
    .io_q2IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp),
    .io_q2IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp),
    .io_q2IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp),
    .io_q2IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp),
    .io_q2IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type),
    .io_q2IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type),
    .io_q2IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType),
    .io_q2IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen),
    .io_q2IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead),
    .io_q2IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite),
    .io_q2IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen),
    .io_q2IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch),
    .io_q2IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump),
    .io_q2IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv),
    .io_q2IQEnq_0_bits_excpVec(ctrlBlock_io_q2IQEnq_0_bits_excpVec),
    .io_q2IQEnq_0_bits_imm(ctrlBlock_io_q2IQEnq_0_bits_imm),
    .io_q2IQEnq_0_bits_csrAddress(ctrlBlock_io_q2IQEnq_0_bits_csrAddress),
    .io_q2IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid),
    .io_q2IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr),
    .io_q2IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal),
    .io_q2IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr),
    .io_q2IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall),
    .io_q2IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet),
    .io_q2IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_0_bits_ldst(ctrlBlock_io_q2IQEnq_0_bits_ldst),
    .io_q2IQEnq_0_bits_lrs1(ctrlBlock_io_q2IQEnq_0_bits_lrs1),
    .io_q2IQEnq_0_bits_lrs2(ctrlBlock_io_q2IQEnq_0_bits_lrs2),
    .io_q2IQEnq_0_bits_pdst(ctrlBlock_io_q2IQEnq_0_bits_pdst),
    .io_q2IQEnq_0_bits_prs1(ctrlBlock_io_q2IQEnq_0_bits_prs1),
    .io_q2IQEnq_0_bits_prs2(ctrlBlock_io_q2IQEnq_0_bits_prs2),
    .io_q2IQEnq_0_bits_oldPdst(ctrlBlock_io_q2IQEnq_0_bits_oldPdst),
    .io_q2IQEnq_0_bits_rs1Valid(ctrlBlock_io_q2IQEnq_0_bits_rs1Valid),
    .io_q2IQEnq_0_bits_rs2Valid(ctrlBlock_io_q2IQEnq_0_bits_rs2Valid),
    .io_q2IQEnq_0_bits_rdValid(ctrlBlock_io_q2IQEnq_0_bits_rdValid),
    .io_q2IQEnq_0_bits_robIdx(ctrlBlock_io_q2IQEnq_0_bits_robIdx),
    .io_q2IQEnq_0_bits_robIdxFull(ctrlBlock_io_q2IQEnq_0_bits_robIdxFull),
    .io_q2IQEnq_0_bits_issueQueue(ctrlBlock_io_q2IQEnq_0_bits_issueQueue),
    .io_q2IQEnq_0_bits_prs1Busy(ctrlBlock_io_q2IQEnq_0_bits_prs1Busy),
    .io_q2IQEnq_0_bits_prs2Busy(ctrlBlock_io_q2IQEnq_0_bits_prs2Busy),
    .io_q3IQEnq_0_valid(ctrlBlock_io_q3IQEnq_0_valid),
    .io_q3IQEnq_0_bits_pc(ctrlBlock_io_q3IQEnq_0_bits_pc),
    .io_q3IQEnq_0_bits_inst(ctrlBlock_io_q3IQEnq_0_bits_inst),
    .io_q3IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType),
    .io_q3IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp),
    .io_q3IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp),
    .io_q3IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp),
    .io_q3IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp),
    .io_q3IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp),
    .io_q3IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp),
    .io_q3IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type),
    .io_q3IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type),
    .io_q3IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType),
    .io_q3IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen),
    .io_q3IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead),
    .io_q3IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite),
    .io_q3IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen),
    .io_q3IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch),
    .io_q3IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump),
    .io_q3IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv),
    .io_q3IQEnq_0_bits_excpVec(ctrlBlock_io_q3IQEnq_0_bits_excpVec),
    .io_q3IQEnq_0_bits_imm(ctrlBlock_io_q3IQEnq_0_bits_imm),
    .io_q3IQEnq_0_bits_csrAddress(ctrlBlock_io_q3IQEnq_0_bits_csrAddress),
    .io_q3IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid),
    .io_q3IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr),
    .io_q3IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal),
    .io_q3IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr),
    .io_q3IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall),
    .io_q3IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet),
    .io_q3IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_0_bits_ldst(ctrlBlock_io_q3IQEnq_0_bits_ldst),
    .io_q3IQEnq_0_bits_lrs1(ctrlBlock_io_q3IQEnq_0_bits_lrs1),
    .io_q3IQEnq_0_bits_lrs2(ctrlBlock_io_q3IQEnq_0_bits_lrs2),
    .io_q3IQEnq_0_bits_pdst(ctrlBlock_io_q3IQEnq_0_bits_pdst),
    .io_q3IQEnq_0_bits_prs1(ctrlBlock_io_q3IQEnq_0_bits_prs1),
    .io_q3IQEnq_0_bits_prs2(ctrlBlock_io_q3IQEnq_0_bits_prs2),
    .io_q3IQEnq_0_bits_oldPdst(ctrlBlock_io_q3IQEnq_0_bits_oldPdst),
    .io_q3IQEnq_0_bits_rs1Valid(ctrlBlock_io_q3IQEnq_0_bits_rs1Valid),
    .io_q3IQEnq_0_bits_rs2Valid(ctrlBlock_io_q3IQEnq_0_bits_rs2Valid),
    .io_q3IQEnq_0_bits_rdValid(ctrlBlock_io_q3IQEnq_0_bits_rdValid),
    .io_q3IQEnq_0_bits_robIdx(ctrlBlock_io_q3IQEnq_0_bits_robIdx),
    .io_q3IQEnq_0_bits_robIdxFull(ctrlBlock_io_q3IQEnq_0_bits_robIdxFull),
    .io_q3IQEnq_0_bits_issueQueue(ctrlBlock_io_q3IQEnq_0_bits_issueQueue),
    .io_q3IQEnq_0_bits_prs1Busy(ctrlBlock_io_q3IQEnq_0_bits_prs1Busy),
    .io_q3IQEnq_0_bits_prs2Busy(ctrlBlock_io_q3IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_valid(ctrlBlock_io_q4IQEnq_0_valid),
    .io_q4IQEnq_0_bits_pc(ctrlBlock_io_q4IQEnq_0_bits_pc),
    .io_q4IQEnq_0_bits_inst(ctrlBlock_io_q4IQEnq_0_bits_inst),
    .io_q4IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType),
    .io_q4IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp),
    .io_q4IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp),
    .io_q4IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp),
    .io_q4IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp),
    .io_q4IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp),
    .io_q4IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp),
    .io_q4IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type),
    .io_q4IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type),
    .io_q4IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType),
    .io_q4IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen),
    .io_q4IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead),
    .io_q4IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite),
    .io_q4IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen),
    .io_q4IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch),
    .io_q4IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump),
    .io_q4IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv),
    .io_q4IQEnq_0_bits_excpVec(ctrlBlock_io_q4IQEnq_0_bits_excpVec),
    .io_q4IQEnq_0_bits_imm(ctrlBlock_io_q4IQEnq_0_bits_imm),
    .io_q4IQEnq_0_bits_csrAddress(ctrlBlock_io_q4IQEnq_0_bits_csrAddress),
    .io_q4IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid),
    .io_q4IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr),
    .io_q4IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal),
    .io_q4IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr),
    .io_q4IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall),
    .io_q4IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet),
    .io_q4IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_0_bits_ldst(ctrlBlock_io_q4IQEnq_0_bits_ldst),
    .io_q4IQEnq_0_bits_lrs1(ctrlBlock_io_q4IQEnq_0_bits_lrs1),
    .io_q4IQEnq_0_bits_lrs2(ctrlBlock_io_q4IQEnq_0_bits_lrs2),
    .io_q4IQEnq_0_bits_pdst(ctrlBlock_io_q4IQEnq_0_bits_pdst),
    .io_q4IQEnq_0_bits_prs1(ctrlBlock_io_q4IQEnq_0_bits_prs1),
    .io_q4IQEnq_0_bits_prs2(ctrlBlock_io_q4IQEnq_0_bits_prs2),
    .io_q4IQEnq_0_bits_oldPdst(ctrlBlock_io_q4IQEnq_0_bits_oldPdst),
    .io_q4IQEnq_0_bits_rs1Valid(ctrlBlock_io_q4IQEnq_0_bits_rs1Valid),
    .io_q4IQEnq_0_bits_rs2Valid(ctrlBlock_io_q4IQEnq_0_bits_rs2Valid),
    .io_q4IQEnq_0_bits_rdValid(ctrlBlock_io_q4IQEnq_0_bits_rdValid),
    .io_q4IQEnq_0_bits_robIdx(ctrlBlock_io_q4IQEnq_0_bits_robIdx),
    .io_q4IQEnq_0_bits_robIdxFull(ctrlBlock_io_q4IQEnq_0_bits_robIdxFull),
    .io_q4IQEnq_0_bits_lqIdx(ctrlBlock_io_q4IQEnq_0_bits_lqIdx),
    .io_q4IQEnq_0_bits_sqIdx(ctrlBlock_io_q4IQEnq_0_bits_sqIdx),
    .io_q4IQEnq_0_bits_issueQueue(ctrlBlock_io_q4IQEnq_0_bits_issueQueue),
    .io_q4IQEnq_0_bits_prs1Busy(ctrlBlock_io_q4IQEnq_0_bits_prs1Busy),
    .io_q4IQEnq_0_bits_prs2Busy(ctrlBlock_io_q4IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_bits_isSta(ctrlBlock_io_q4IQEnq_0_bits_isSta),
    .io_q5IQEnq_0_valid(ctrlBlock_io_q5IQEnq_0_valid),
    .io_q5IQEnq_0_bits_pc(ctrlBlock_io_q5IQEnq_0_bits_pc),
    .io_q5IQEnq_0_bits_inst(ctrlBlock_io_q5IQEnq_0_bits_inst),
    .io_q5IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType),
    .io_q5IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp),
    .io_q5IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp),
    .io_q5IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp),
    .io_q5IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp),
    .io_q5IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp),
    .io_q5IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp),
    .io_q5IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type),
    .io_q5IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type),
    .io_q5IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType),
    .io_q5IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen),
    .io_q5IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead),
    .io_q5IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite),
    .io_q5IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen),
    .io_q5IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch),
    .io_q5IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump),
    .io_q5IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv),
    .io_q5IQEnq_0_bits_excpVec(ctrlBlock_io_q5IQEnq_0_bits_excpVec),
    .io_q5IQEnq_0_bits_csrAddress(ctrlBlock_io_q5IQEnq_0_bits_csrAddress),
    .io_q5IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid),
    .io_q5IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr),
    .io_q5IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal),
    .io_q5IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr),
    .io_q5IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall),
    .io_q5IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet),
    .io_q5IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q5IQEnq_0_bits_ldst(ctrlBlock_io_q5IQEnq_0_bits_ldst),
    .io_q5IQEnq_0_bits_lrs1(ctrlBlock_io_q5IQEnq_0_bits_lrs1),
    .io_q5IQEnq_0_bits_lrs2(ctrlBlock_io_q5IQEnq_0_bits_lrs2),
    .io_q5IQEnq_0_bits_prs1(ctrlBlock_io_q5IQEnq_0_bits_prs1),
    .io_q5IQEnq_0_bits_prs2(ctrlBlock_io_q5IQEnq_0_bits_prs2),
    .io_q5IQEnq_0_bits_oldPdst(ctrlBlock_io_q5IQEnq_0_bits_oldPdst),
    .io_q5IQEnq_0_bits_rs2Valid(ctrlBlock_io_q5IQEnq_0_bits_rs2Valid),
    .io_q5IQEnq_0_bits_robIdx(ctrlBlock_io_q5IQEnq_0_bits_robIdx),
    .io_q5IQEnq_0_bits_robIdxFull(ctrlBlock_io_q5IQEnq_0_bits_robIdxFull),
    .io_q5IQEnq_0_bits_sqIdx(ctrlBlock_io_q5IQEnq_0_bits_sqIdx),
    .io_q5IQEnq_0_bits_issueQueue(ctrlBlock_io_q5IQEnq_0_bits_issueQueue),
    .io_q5IQEnq_0_bits_prs2Busy(ctrlBlock_io_q5IQEnq_0_bits_prs2Busy),
    .io_q5IQEnq_0_bits_isStd(ctrlBlock_io_q5IQEnq_0_bits_isStd),
    .io_iqFeedback_q1FreeEntries(ctrlBlock_io_iqFeedback_q1FreeEntries),
    .io_iqFeedback_q2FreeEntries(ctrlBlock_io_iqFeedback_q2FreeEntries),
    .io_iqFeedback_q3FreeEntries(ctrlBlock_io_iqFeedback_q3FreeEntries),
    .io_iqFeedback_q4FreeEntries(ctrlBlock_io_iqFeedback_q4FreeEntries),
    .io_iqFeedback_q5FreeEntries(ctrlBlock_io_iqFeedback_q5FreeEntries),
    .io_lsEnq_req_0_valid(ctrlBlock_io_lsEnq_req_0_valid),
    .io_lsEnq_req_0_bits_robIdx(ctrlBlock_io_lsEnq_req_0_bits_robIdx),
    .io_lsEnq_req_0_bits_isLoad(ctrlBlock_io_lsEnq_req_0_bits_isLoad),
    .io_lsEnq_req_0_bits_isStore(ctrlBlock_io_lsEnq_req_0_bits_isStore),
    .io_lsEnq_req_0_bits_sqIdx(ctrlBlock_io_lsEnq_req_0_bits_sqIdx),
    .io_lsEnq_req_0_bits_lqIdx(ctrlBlock_io_lsEnq_req_0_bits_lqIdx),
    .io_lsEnq_req_1_valid(ctrlBlock_io_lsEnq_req_1_valid),
    .io_lsEnq_req_1_bits_robIdx(ctrlBlock_io_lsEnq_req_1_bits_robIdx),
    .io_lsEnq_req_1_bits_isLoad(ctrlBlock_io_lsEnq_req_1_bits_isLoad),
    .io_lsEnq_req_1_bits_isStore(ctrlBlock_io_lsEnq_req_1_bits_isStore),
    .io_lsEnq_req_1_bits_sqIdx(ctrlBlock_io_lsEnq_req_1_bits_sqIdx),
    .io_lsEnq_req_1_bits_lqIdx(ctrlBlock_io_lsEnq_req_1_bits_lqIdx),
    .io_lsEnq_req_2_valid(ctrlBlock_io_lsEnq_req_2_valid),
    .io_lsEnq_req_2_bits_robIdx(ctrlBlock_io_lsEnq_req_2_bits_robIdx),
    .io_lsEnq_req_2_bits_isLoad(ctrlBlock_io_lsEnq_req_2_bits_isLoad),
    .io_lsEnq_req_2_bits_isStore(ctrlBlock_io_lsEnq_req_2_bits_isStore),
    .io_lsEnq_req_2_bits_sqIdx(ctrlBlock_io_lsEnq_req_2_bits_sqIdx),
    .io_lsEnq_req_2_bits_lqIdx(ctrlBlock_io_lsEnq_req_2_bits_lqIdx),
    .io_redirect_valid(ctrlBlock_io_redirect_valid),
    .io_redirect_robIdx(ctrlBlock_io_redirect_robIdx),
    .io_extInt(ctrlBlock_io_extInt)
  );
  Scheduler scheduler ( // @[src/main/scala/backend/Backend.scala 23:25]
    .clock(scheduler_clock),
    .reset(scheduler_reset),
    .io_q1IQEnq_valid(scheduler_io_q1IQEnq_valid),
    .io_q1IQEnq_bits_pc(scheduler_io_q1IQEnq_bits_pc),
    .io_q1IQEnq_bits_inst(scheduler_io_q1IQEnq_bits_inst),
    .io_q1IQEnq_bits_ctrl_fuType(scheduler_io_q1IQEnq_bits_ctrl_fuType),
    .io_q1IQEnq_bits_ctrl_aluOp(scheduler_io_q1IQEnq_bits_ctrl_aluOp),
    .io_q1IQEnq_bits_ctrl_bruOp(scheduler_io_q1IQEnq_bits_ctrl_bruOp),
    .io_q1IQEnq_bits_ctrl_lsuOp(scheduler_io_q1IQEnq_bits_ctrl_lsuOp),
    .io_q1IQEnq_bits_ctrl_csrOp(scheduler_io_q1IQEnq_bits_ctrl_csrOp),
    .io_q1IQEnq_bits_ctrl_mulOp(scheduler_io_q1IQEnq_bits_ctrl_mulOp),
    .io_q1IQEnq_bits_ctrl_divOp(scheduler_io_q1IQEnq_bits_ctrl_divOp),
    .io_q1IQEnq_bits_ctrl_src1Type(scheduler_io_q1IQEnq_bits_ctrl_src1Type),
    .io_q1IQEnq_bits_ctrl_src2Type(scheduler_io_q1IQEnq_bits_ctrl_src2Type),
    .io_q1IQEnq_bits_ctrl_immType(scheduler_io_q1IQEnq_bits_ctrl_immType),
    .io_q1IQEnq_bits_ctrl_rfWen(scheduler_io_q1IQEnq_bits_ctrl_rfWen),
    .io_q1IQEnq_bits_ctrl_memRead(scheduler_io_q1IQEnq_bits_ctrl_memRead),
    .io_q1IQEnq_bits_ctrl_memWrite(scheduler_io_q1IQEnq_bits_ctrl_memWrite),
    .io_q1IQEnq_bits_ctrl_csrWen(scheduler_io_q1IQEnq_bits_ctrl_csrWen),
    .io_q1IQEnq_bits_ctrl_isBranch(scheduler_io_q1IQEnq_bits_ctrl_isBranch),
    .io_q1IQEnq_bits_ctrl_isJump(scheduler_io_q1IQEnq_bits_ctrl_isJump),
    .io_q1IQEnq_bits_ctrl_isPriv(scheduler_io_q1IQEnq_bits_ctrl_isPriv),
    .io_q1IQEnq_bits_excpVec(scheduler_io_q1IQEnq_bits_excpVec),
    .io_q1IQEnq_bits_imm(scheduler_io_q1IQEnq_bits_imm),
    .io_q1IQEnq_bits_csrAddress(scheduler_io_q1IQEnq_bits_csrAddress),
    .io_q1IQEnq_bits_pdInfo_valid(scheduler_io_q1IQEnq_bits_pdInfo_valid),
    .io_q1IQEnq_bits_pdInfo_isBr(scheduler_io_q1IQEnq_bits_pdInfo_isBr),
    .io_q1IQEnq_bits_pdInfo_isJal(scheduler_io_q1IQEnq_bits_pdInfo_isJal),
    .io_q1IQEnq_bits_pdInfo_isJalr(scheduler_io_q1IQEnq_bits_pdInfo_isJalr),
    .io_q1IQEnq_bits_pdInfo_isCall(scheduler_io_q1IQEnq_bits_pdInfo_isCall),
    .io_q1IQEnq_bits_pdInfo_isRet(scheduler_io_q1IQEnq_bits_pdInfo_isRet),
    .io_q1IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_bits_ldst(scheduler_io_q1IQEnq_bits_ldst),
    .io_q1IQEnq_bits_lrs1(scheduler_io_q1IQEnq_bits_lrs1),
    .io_q1IQEnq_bits_lrs2(scheduler_io_q1IQEnq_bits_lrs2),
    .io_q1IQEnq_bits_pdst(scheduler_io_q1IQEnq_bits_pdst),
    .io_q1IQEnq_bits_prs1(scheduler_io_q1IQEnq_bits_prs1),
    .io_q1IQEnq_bits_prs2(scheduler_io_q1IQEnq_bits_prs2),
    .io_q1IQEnq_bits_oldPdst(scheduler_io_q1IQEnq_bits_oldPdst),
    .io_q1IQEnq_bits_rs1Valid(scheduler_io_q1IQEnq_bits_rs1Valid),
    .io_q1IQEnq_bits_rs2Valid(scheduler_io_q1IQEnq_bits_rs2Valid),
    .io_q1IQEnq_bits_rdValid(scheduler_io_q1IQEnq_bits_rdValid),
    .io_q1IQEnq_bits_robIdx(scheduler_io_q1IQEnq_bits_robIdx),
    .io_q1IQEnq_bits_robIdxFull(scheduler_io_q1IQEnq_bits_robIdxFull),
    .io_q1IQEnq_bits_prs1Busy(scheduler_io_q1IQEnq_bits_prs1Busy),
    .io_q1IQEnq_bits_prs2Busy(scheduler_io_q1IQEnq_bits_prs2Busy),
    .io_q2IQEnq_valid(scheduler_io_q2IQEnq_valid),
    .io_q2IQEnq_bits_pc(scheduler_io_q2IQEnq_bits_pc),
    .io_q2IQEnq_bits_inst(scheduler_io_q2IQEnq_bits_inst),
    .io_q2IQEnq_bits_ctrl_fuType(scheduler_io_q2IQEnq_bits_ctrl_fuType),
    .io_q2IQEnq_bits_ctrl_aluOp(scheduler_io_q2IQEnq_bits_ctrl_aluOp),
    .io_q2IQEnq_bits_ctrl_bruOp(scheduler_io_q2IQEnq_bits_ctrl_bruOp),
    .io_q2IQEnq_bits_ctrl_lsuOp(scheduler_io_q2IQEnq_bits_ctrl_lsuOp),
    .io_q2IQEnq_bits_ctrl_csrOp(scheduler_io_q2IQEnq_bits_ctrl_csrOp),
    .io_q2IQEnq_bits_ctrl_mulOp(scheduler_io_q2IQEnq_bits_ctrl_mulOp),
    .io_q2IQEnq_bits_ctrl_divOp(scheduler_io_q2IQEnq_bits_ctrl_divOp),
    .io_q2IQEnq_bits_ctrl_src1Type(scheduler_io_q2IQEnq_bits_ctrl_src1Type),
    .io_q2IQEnq_bits_ctrl_src2Type(scheduler_io_q2IQEnq_bits_ctrl_src2Type),
    .io_q2IQEnq_bits_ctrl_immType(scheduler_io_q2IQEnq_bits_ctrl_immType),
    .io_q2IQEnq_bits_ctrl_rfWen(scheduler_io_q2IQEnq_bits_ctrl_rfWen),
    .io_q2IQEnq_bits_ctrl_memRead(scheduler_io_q2IQEnq_bits_ctrl_memRead),
    .io_q2IQEnq_bits_ctrl_memWrite(scheduler_io_q2IQEnq_bits_ctrl_memWrite),
    .io_q2IQEnq_bits_ctrl_csrWen(scheduler_io_q2IQEnq_bits_ctrl_csrWen),
    .io_q2IQEnq_bits_ctrl_isBranch(scheduler_io_q2IQEnq_bits_ctrl_isBranch),
    .io_q2IQEnq_bits_ctrl_isJump(scheduler_io_q2IQEnq_bits_ctrl_isJump),
    .io_q2IQEnq_bits_ctrl_isPriv(scheduler_io_q2IQEnq_bits_ctrl_isPriv),
    .io_q2IQEnq_bits_excpVec(scheduler_io_q2IQEnq_bits_excpVec),
    .io_q2IQEnq_bits_imm(scheduler_io_q2IQEnq_bits_imm),
    .io_q2IQEnq_bits_csrAddress(scheduler_io_q2IQEnq_bits_csrAddress),
    .io_q2IQEnq_bits_pdInfo_valid(scheduler_io_q2IQEnq_bits_pdInfo_valid),
    .io_q2IQEnq_bits_pdInfo_isBr(scheduler_io_q2IQEnq_bits_pdInfo_isBr),
    .io_q2IQEnq_bits_pdInfo_isJal(scheduler_io_q2IQEnq_bits_pdInfo_isJal),
    .io_q2IQEnq_bits_pdInfo_isJalr(scheduler_io_q2IQEnq_bits_pdInfo_isJalr),
    .io_q2IQEnq_bits_pdInfo_isCall(scheduler_io_q2IQEnq_bits_pdInfo_isCall),
    .io_q2IQEnq_bits_pdInfo_isRet(scheduler_io_q2IQEnq_bits_pdInfo_isRet),
    .io_q2IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_bits_ldst(scheduler_io_q2IQEnq_bits_ldst),
    .io_q2IQEnq_bits_lrs1(scheduler_io_q2IQEnq_bits_lrs1),
    .io_q2IQEnq_bits_lrs2(scheduler_io_q2IQEnq_bits_lrs2),
    .io_q2IQEnq_bits_pdst(scheduler_io_q2IQEnq_bits_pdst),
    .io_q2IQEnq_bits_prs1(scheduler_io_q2IQEnq_bits_prs1),
    .io_q2IQEnq_bits_prs2(scheduler_io_q2IQEnq_bits_prs2),
    .io_q2IQEnq_bits_oldPdst(scheduler_io_q2IQEnq_bits_oldPdst),
    .io_q2IQEnq_bits_rs1Valid(scheduler_io_q2IQEnq_bits_rs1Valid),
    .io_q2IQEnq_bits_rs2Valid(scheduler_io_q2IQEnq_bits_rs2Valid),
    .io_q2IQEnq_bits_rdValid(scheduler_io_q2IQEnq_bits_rdValid),
    .io_q2IQEnq_bits_robIdx(scheduler_io_q2IQEnq_bits_robIdx),
    .io_q2IQEnq_bits_robIdxFull(scheduler_io_q2IQEnq_bits_robIdxFull),
    .io_q2IQEnq_bits_issueQueue(scheduler_io_q2IQEnq_bits_issueQueue),
    .io_q2IQEnq_bits_prs1Busy(scheduler_io_q2IQEnq_bits_prs1Busy),
    .io_q2IQEnq_bits_prs2Busy(scheduler_io_q2IQEnq_bits_prs2Busy),
    .io_q3IQEnq_valid(scheduler_io_q3IQEnq_valid),
    .io_q3IQEnq_bits_pc(scheduler_io_q3IQEnq_bits_pc),
    .io_q3IQEnq_bits_inst(scheduler_io_q3IQEnq_bits_inst),
    .io_q3IQEnq_bits_ctrl_fuType(scheduler_io_q3IQEnq_bits_ctrl_fuType),
    .io_q3IQEnq_bits_ctrl_aluOp(scheduler_io_q3IQEnq_bits_ctrl_aluOp),
    .io_q3IQEnq_bits_ctrl_bruOp(scheduler_io_q3IQEnq_bits_ctrl_bruOp),
    .io_q3IQEnq_bits_ctrl_lsuOp(scheduler_io_q3IQEnq_bits_ctrl_lsuOp),
    .io_q3IQEnq_bits_ctrl_csrOp(scheduler_io_q3IQEnq_bits_ctrl_csrOp),
    .io_q3IQEnq_bits_ctrl_mulOp(scheduler_io_q3IQEnq_bits_ctrl_mulOp),
    .io_q3IQEnq_bits_ctrl_divOp(scheduler_io_q3IQEnq_bits_ctrl_divOp),
    .io_q3IQEnq_bits_ctrl_src1Type(scheduler_io_q3IQEnq_bits_ctrl_src1Type),
    .io_q3IQEnq_bits_ctrl_src2Type(scheduler_io_q3IQEnq_bits_ctrl_src2Type),
    .io_q3IQEnq_bits_ctrl_immType(scheduler_io_q3IQEnq_bits_ctrl_immType),
    .io_q3IQEnq_bits_ctrl_rfWen(scheduler_io_q3IQEnq_bits_ctrl_rfWen),
    .io_q3IQEnq_bits_ctrl_memRead(scheduler_io_q3IQEnq_bits_ctrl_memRead),
    .io_q3IQEnq_bits_ctrl_memWrite(scheduler_io_q3IQEnq_bits_ctrl_memWrite),
    .io_q3IQEnq_bits_ctrl_csrWen(scheduler_io_q3IQEnq_bits_ctrl_csrWen),
    .io_q3IQEnq_bits_ctrl_isBranch(scheduler_io_q3IQEnq_bits_ctrl_isBranch),
    .io_q3IQEnq_bits_ctrl_isJump(scheduler_io_q3IQEnq_bits_ctrl_isJump),
    .io_q3IQEnq_bits_ctrl_isPriv(scheduler_io_q3IQEnq_bits_ctrl_isPriv),
    .io_q3IQEnq_bits_excpVec(scheduler_io_q3IQEnq_bits_excpVec),
    .io_q3IQEnq_bits_imm(scheduler_io_q3IQEnq_bits_imm),
    .io_q3IQEnq_bits_csrAddress(scheduler_io_q3IQEnq_bits_csrAddress),
    .io_q3IQEnq_bits_pdInfo_valid(scheduler_io_q3IQEnq_bits_pdInfo_valid),
    .io_q3IQEnq_bits_pdInfo_isBr(scheduler_io_q3IQEnq_bits_pdInfo_isBr),
    .io_q3IQEnq_bits_pdInfo_isJal(scheduler_io_q3IQEnq_bits_pdInfo_isJal),
    .io_q3IQEnq_bits_pdInfo_isJalr(scheduler_io_q3IQEnq_bits_pdInfo_isJalr),
    .io_q3IQEnq_bits_pdInfo_isCall(scheduler_io_q3IQEnq_bits_pdInfo_isCall),
    .io_q3IQEnq_bits_pdInfo_isRet(scheduler_io_q3IQEnq_bits_pdInfo_isRet),
    .io_q3IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_bits_ldst(scheduler_io_q3IQEnq_bits_ldst),
    .io_q3IQEnq_bits_lrs1(scheduler_io_q3IQEnq_bits_lrs1),
    .io_q3IQEnq_bits_lrs2(scheduler_io_q3IQEnq_bits_lrs2),
    .io_q3IQEnq_bits_pdst(scheduler_io_q3IQEnq_bits_pdst),
    .io_q3IQEnq_bits_prs1(scheduler_io_q3IQEnq_bits_prs1),
    .io_q3IQEnq_bits_prs2(scheduler_io_q3IQEnq_bits_prs2),
    .io_q3IQEnq_bits_oldPdst(scheduler_io_q3IQEnq_bits_oldPdst),
    .io_q3IQEnq_bits_rs1Valid(scheduler_io_q3IQEnq_bits_rs1Valid),
    .io_q3IQEnq_bits_rs2Valid(scheduler_io_q3IQEnq_bits_rs2Valid),
    .io_q3IQEnq_bits_rdValid(scheduler_io_q3IQEnq_bits_rdValid),
    .io_q3IQEnq_bits_robIdx(scheduler_io_q3IQEnq_bits_robIdx),
    .io_q3IQEnq_bits_robIdxFull(scheduler_io_q3IQEnq_bits_robIdxFull),
    .io_q3IQEnq_bits_issueQueue(scheduler_io_q3IQEnq_bits_issueQueue),
    .io_q3IQEnq_bits_prs1Busy(scheduler_io_q3IQEnq_bits_prs1Busy),
    .io_q3IQEnq_bits_prs2Busy(scheduler_io_q3IQEnq_bits_prs2Busy),
    .io_q4IQEnq_valid(scheduler_io_q4IQEnq_valid),
    .io_q4IQEnq_bits_pc(scheduler_io_q4IQEnq_bits_pc),
    .io_q4IQEnq_bits_inst(scheduler_io_q4IQEnq_bits_inst),
    .io_q4IQEnq_bits_ctrl_fuType(scheduler_io_q4IQEnq_bits_ctrl_fuType),
    .io_q4IQEnq_bits_ctrl_aluOp(scheduler_io_q4IQEnq_bits_ctrl_aluOp),
    .io_q4IQEnq_bits_ctrl_bruOp(scheduler_io_q4IQEnq_bits_ctrl_bruOp),
    .io_q4IQEnq_bits_ctrl_lsuOp(scheduler_io_q4IQEnq_bits_ctrl_lsuOp),
    .io_q4IQEnq_bits_ctrl_csrOp(scheduler_io_q4IQEnq_bits_ctrl_csrOp),
    .io_q4IQEnq_bits_ctrl_mulOp(scheduler_io_q4IQEnq_bits_ctrl_mulOp),
    .io_q4IQEnq_bits_ctrl_divOp(scheduler_io_q4IQEnq_bits_ctrl_divOp),
    .io_q4IQEnq_bits_ctrl_src1Type(scheduler_io_q4IQEnq_bits_ctrl_src1Type),
    .io_q4IQEnq_bits_ctrl_src2Type(scheduler_io_q4IQEnq_bits_ctrl_src2Type),
    .io_q4IQEnq_bits_ctrl_immType(scheduler_io_q4IQEnq_bits_ctrl_immType),
    .io_q4IQEnq_bits_ctrl_rfWen(scheduler_io_q4IQEnq_bits_ctrl_rfWen),
    .io_q4IQEnq_bits_ctrl_memRead(scheduler_io_q4IQEnq_bits_ctrl_memRead),
    .io_q4IQEnq_bits_ctrl_memWrite(scheduler_io_q4IQEnq_bits_ctrl_memWrite),
    .io_q4IQEnq_bits_ctrl_csrWen(scheduler_io_q4IQEnq_bits_ctrl_csrWen),
    .io_q4IQEnq_bits_ctrl_isBranch(scheduler_io_q4IQEnq_bits_ctrl_isBranch),
    .io_q4IQEnq_bits_ctrl_isJump(scheduler_io_q4IQEnq_bits_ctrl_isJump),
    .io_q4IQEnq_bits_ctrl_isPriv(scheduler_io_q4IQEnq_bits_ctrl_isPriv),
    .io_q4IQEnq_bits_excpVec(scheduler_io_q4IQEnq_bits_excpVec),
    .io_q4IQEnq_bits_imm(scheduler_io_q4IQEnq_bits_imm),
    .io_q4IQEnq_bits_csrAddress(scheduler_io_q4IQEnq_bits_csrAddress),
    .io_q4IQEnq_bits_pdInfo_valid(scheduler_io_q4IQEnq_bits_pdInfo_valid),
    .io_q4IQEnq_bits_pdInfo_isBr(scheduler_io_q4IQEnq_bits_pdInfo_isBr),
    .io_q4IQEnq_bits_pdInfo_isJal(scheduler_io_q4IQEnq_bits_pdInfo_isJal),
    .io_q4IQEnq_bits_pdInfo_isJalr(scheduler_io_q4IQEnq_bits_pdInfo_isJalr),
    .io_q4IQEnq_bits_pdInfo_isCall(scheduler_io_q4IQEnq_bits_pdInfo_isCall),
    .io_q4IQEnq_bits_pdInfo_isRet(scheduler_io_q4IQEnq_bits_pdInfo_isRet),
    .io_q4IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_bits_ldst(scheduler_io_q4IQEnq_bits_ldst),
    .io_q4IQEnq_bits_lrs1(scheduler_io_q4IQEnq_bits_lrs1),
    .io_q4IQEnq_bits_lrs2(scheduler_io_q4IQEnq_bits_lrs2),
    .io_q4IQEnq_bits_pdst(scheduler_io_q4IQEnq_bits_pdst),
    .io_q4IQEnq_bits_prs1(scheduler_io_q4IQEnq_bits_prs1),
    .io_q4IQEnq_bits_prs2(scheduler_io_q4IQEnq_bits_prs2),
    .io_q4IQEnq_bits_oldPdst(scheduler_io_q4IQEnq_bits_oldPdst),
    .io_q4IQEnq_bits_rs1Valid(scheduler_io_q4IQEnq_bits_rs1Valid),
    .io_q4IQEnq_bits_rs2Valid(scheduler_io_q4IQEnq_bits_rs2Valid),
    .io_q4IQEnq_bits_rdValid(scheduler_io_q4IQEnq_bits_rdValid),
    .io_q4IQEnq_bits_robIdx(scheduler_io_q4IQEnq_bits_robIdx),
    .io_q4IQEnq_bits_robIdxFull(scheduler_io_q4IQEnq_bits_robIdxFull),
    .io_q4IQEnq_bits_lqIdx(scheduler_io_q4IQEnq_bits_lqIdx),
    .io_q4IQEnq_bits_sqIdx(scheduler_io_q4IQEnq_bits_sqIdx),
    .io_q4IQEnq_bits_issueQueue(scheduler_io_q4IQEnq_bits_issueQueue),
    .io_q4IQEnq_bits_prs1Busy(scheduler_io_q4IQEnq_bits_prs1Busy),
    .io_q4IQEnq_bits_prs2Busy(scheduler_io_q4IQEnq_bits_prs2Busy),
    .io_q4IQEnq_bits_isSta(scheduler_io_q4IQEnq_bits_isSta),
    .io_q5IQEnq_valid(scheduler_io_q5IQEnq_valid),
    .io_q5IQEnq_bits_pc(scheduler_io_q5IQEnq_bits_pc),
    .io_q5IQEnq_bits_inst(scheduler_io_q5IQEnq_bits_inst),
    .io_q5IQEnq_bits_ctrl_fuType(scheduler_io_q5IQEnq_bits_ctrl_fuType),
    .io_q5IQEnq_bits_ctrl_aluOp(scheduler_io_q5IQEnq_bits_ctrl_aluOp),
    .io_q5IQEnq_bits_ctrl_bruOp(scheduler_io_q5IQEnq_bits_ctrl_bruOp),
    .io_q5IQEnq_bits_ctrl_lsuOp(scheduler_io_q5IQEnq_bits_ctrl_lsuOp),
    .io_q5IQEnq_bits_ctrl_csrOp(scheduler_io_q5IQEnq_bits_ctrl_csrOp),
    .io_q5IQEnq_bits_ctrl_mulOp(scheduler_io_q5IQEnq_bits_ctrl_mulOp),
    .io_q5IQEnq_bits_ctrl_divOp(scheduler_io_q5IQEnq_bits_ctrl_divOp),
    .io_q5IQEnq_bits_ctrl_src1Type(scheduler_io_q5IQEnq_bits_ctrl_src1Type),
    .io_q5IQEnq_bits_ctrl_src2Type(scheduler_io_q5IQEnq_bits_ctrl_src2Type),
    .io_q5IQEnq_bits_ctrl_immType(scheduler_io_q5IQEnq_bits_ctrl_immType),
    .io_q5IQEnq_bits_ctrl_rfWen(scheduler_io_q5IQEnq_bits_ctrl_rfWen),
    .io_q5IQEnq_bits_ctrl_memRead(scheduler_io_q5IQEnq_bits_ctrl_memRead),
    .io_q5IQEnq_bits_ctrl_memWrite(scheduler_io_q5IQEnq_bits_ctrl_memWrite),
    .io_q5IQEnq_bits_ctrl_csrWen(scheduler_io_q5IQEnq_bits_ctrl_csrWen),
    .io_q5IQEnq_bits_ctrl_isBranch(scheduler_io_q5IQEnq_bits_ctrl_isBranch),
    .io_q5IQEnq_bits_ctrl_isJump(scheduler_io_q5IQEnq_bits_ctrl_isJump),
    .io_q5IQEnq_bits_ctrl_isPriv(scheduler_io_q5IQEnq_bits_ctrl_isPriv),
    .io_q5IQEnq_bits_excpVec(scheduler_io_q5IQEnq_bits_excpVec),
    .io_q5IQEnq_bits_csrAddress(scheduler_io_q5IQEnq_bits_csrAddress),
    .io_q5IQEnq_bits_pdInfo_valid(scheduler_io_q5IQEnq_bits_pdInfo_valid),
    .io_q5IQEnq_bits_pdInfo_isBr(scheduler_io_q5IQEnq_bits_pdInfo_isBr),
    .io_q5IQEnq_bits_pdInfo_isJal(scheduler_io_q5IQEnq_bits_pdInfo_isJal),
    .io_q5IQEnq_bits_pdInfo_isJalr(scheduler_io_q5IQEnq_bits_pdInfo_isJalr),
    .io_q5IQEnq_bits_pdInfo_isCall(scheduler_io_q5IQEnq_bits_pdInfo_isCall),
    .io_q5IQEnq_bits_pdInfo_isRet(scheduler_io_q5IQEnq_bits_pdInfo_isRet),
    .io_q5IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget),
    .io_q5IQEnq_bits_ldst(scheduler_io_q5IQEnq_bits_ldst),
    .io_q5IQEnq_bits_lrs1(scheduler_io_q5IQEnq_bits_lrs1),
    .io_q5IQEnq_bits_lrs2(scheduler_io_q5IQEnq_bits_lrs2),
    .io_q5IQEnq_bits_prs1(scheduler_io_q5IQEnq_bits_prs1),
    .io_q5IQEnq_bits_prs2(scheduler_io_q5IQEnq_bits_prs2),
    .io_q5IQEnq_bits_oldPdst(scheduler_io_q5IQEnq_bits_oldPdst),
    .io_q5IQEnq_bits_rs2Valid(scheduler_io_q5IQEnq_bits_rs2Valid),
    .io_q5IQEnq_bits_robIdx(scheduler_io_q5IQEnq_bits_robIdx),
    .io_q5IQEnq_bits_robIdxFull(scheduler_io_q5IQEnq_bits_robIdxFull),
    .io_q5IQEnq_bits_sqIdx(scheduler_io_q5IQEnq_bits_sqIdx),
    .io_q5IQEnq_bits_issueQueue(scheduler_io_q5IQEnq_bits_issueQueue),
    .io_q5IQEnq_bits_prs2Busy(scheduler_io_q5IQEnq_bits_prs2Busy),
    .io_q5IQEnq_bits_isStd(scheduler_io_q5IQEnq_bits_isStd),
    .io_q1Issue_ready(scheduler_io_q1Issue_ready),
    .io_q1Issue_valid(scheduler_io_q1Issue_valid),
    .io_q1Issue_bits_pc(scheduler_io_q1Issue_bits_pc),
    .io_q1Issue_bits_inst(scheduler_io_q1Issue_bits_inst),
    .io_q1Issue_bits_ctrl_fuType(scheduler_io_q1Issue_bits_ctrl_fuType),
    .io_q1Issue_bits_ctrl_aluOp(scheduler_io_q1Issue_bits_ctrl_aluOp),
    .io_q1Issue_bits_ctrl_bruOp(scheduler_io_q1Issue_bits_ctrl_bruOp),
    .io_q1Issue_bits_ctrl_lsuOp(scheduler_io_q1Issue_bits_ctrl_lsuOp),
    .io_q1Issue_bits_ctrl_csrOp(scheduler_io_q1Issue_bits_ctrl_csrOp),
    .io_q1Issue_bits_ctrl_mulOp(scheduler_io_q1Issue_bits_ctrl_mulOp),
    .io_q1Issue_bits_ctrl_divOp(scheduler_io_q1Issue_bits_ctrl_divOp),
    .io_q1Issue_bits_ctrl_src1Type(scheduler_io_q1Issue_bits_ctrl_src1Type),
    .io_q1Issue_bits_ctrl_src2Type(scheduler_io_q1Issue_bits_ctrl_src2Type),
    .io_q1Issue_bits_ctrl_immType(scheduler_io_q1Issue_bits_ctrl_immType),
    .io_q1Issue_bits_ctrl_rfWen(scheduler_io_q1Issue_bits_ctrl_rfWen),
    .io_q1Issue_bits_ctrl_memRead(scheduler_io_q1Issue_bits_ctrl_memRead),
    .io_q1Issue_bits_ctrl_memWrite(scheduler_io_q1Issue_bits_ctrl_memWrite),
    .io_q1Issue_bits_ctrl_csrWen(scheduler_io_q1Issue_bits_ctrl_csrWen),
    .io_q1Issue_bits_ctrl_isBranch(scheduler_io_q1Issue_bits_ctrl_isBranch),
    .io_q1Issue_bits_ctrl_isJump(scheduler_io_q1Issue_bits_ctrl_isJump),
    .io_q1Issue_bits_ctrl_isPriv(scheduler_io_q1Issue_bits_ctrl_isPriv),
    .io_q1Issue_bits_excpVec(scheduler_io_q1Issue_bits_excpVec),
    .io_q1Issue_bits_imm(scheduler_io_q1Issue_bits_imm),
    .io_q1Issue_bits_csrAddress(scheduler_io_q1Issue_bits_csrAddress),
    .io_q1Issue_bits_pdInfo_valid(scheduler_io_q1Issue_bits_pdInfo_valid),
    .io_q1Issue_bits_pdInfo_isBr(scheduler_io_q1Issue_bits_pdInfo_isBr),
    .io_q1Issue_bits_pdInfo_isJal(scheduler_io_q1Issue_bits_pdInfo_isJal),
    .io_q1Issue_bits_pdInfo_isJalr(scheduler_io_q1Issue_bits_pdInfo_isJalr),
    .io_q1Issue_bits_pdInfo_isCall(scheduler_io_q1Issue_bits_pdInfo_isCall),
    .io_q1Issue_bits_pdInfo_isRet(scheduler_io_q1Issue_bits_pdInfo_isRet),
    .io_q1Issue_bits_pdInfo_jumpTarget(scheduler_io_q1Issue_bits_pdInfo_jumpTarget),
    .io_q1Issue_bits_ldst(scheduler_io_q1Issue_bits_ldst),
    .io_q1Issue_bits_lrs1(scheduler_io_q1Issue_bits_lrs1),
    .io_q1Issue_bits_lrs2(scheduler_io_q1Issue_bits_lrs2),
    .io_q1Issue_bits_pdst(scheduler_io_q1Issue_bits_pdst),
    .io_q1Issue_bits_prs1(scheduler_io_q1Issue_bits_prs1),
    .io_q1Issue_bits_prs2(scheduler_io_q1Issue_bits_prs2),
    .io_q1Issue_bits_oldPdst(scheduler_io_q1Issue_bits_oldPdst),
    .io_q1Issue_bits_rs1Valid(scheduler_io_q1Issue_bits_rs1Valid),
    .io_q1Issue_bits_rs2Valid(scheduler_io_q1Issue_bits_rs2Valid),
    .io_q1Issue_bits_rdValid(scheduler_io_q1Issue_bits_rdValid),
    .io_q1Issue_bits_robIdx(scheduler_io_q1Issue_bits_robIdx),
    .io_q1Issue_bits_robIdxFull(scheduler_io_q1Issue_bits_robIdxFull),
    .io_q1Issue_bits_lqIdx(scheduler_io_q1Issue_bits_lqIdx),
    .io_q1Issue_bits_sqIdx(scheduler_io_q1Issue_bits_sqIdx),
    .io_q1Issue_bits_issueQueue(scheduler_io_q1Issue_bits_issueQueue),
    .io_q1Issue_bits_prs1Busy(scheduler_io_q1Issue_bits_prs1Busy),
    .io_q1Issue_bits_prs2Busy(scheduler_io_q1Issue_bits_prs2Busy),
    .io_q1Issue_bits_isSta(scheduler_io_q1Issue_bits_isSta),
    .io_q1Issue_bits_isStd(scheduler_io_q1Issue_bits_isStd),
    .io_q2Issue_ready(scheduler_io_q2Issue_ready),
    .io_q2Issue_valid(scheduler_io_q2Issue_valid),
    .io_q2Issue_bits_pc(scheduler_io_q2Issue_bits_pc),
    .io_q2Issue_bits_inst(scheduler_io_q2Issue_bits_inst),
    .io_q2Issue_bits_ctrl_fuType(scheduler_io_q2Issue_bits_ctrl_fuType),
    .io_q2Issue_bits_ctrl_aluOp(scheduler_io_q2Issue_bits_ctrl_aluOp),
    .io_q2Issue_bits_ctrl_bruOp(scheduler_io_q2Issue_bits_ctrl_bruOp),
    .io_q2Issue_bits_ctrl_lsuOp(scheduler_io_q2Issue_bits_ctrl_lsuOp),
    .io_q2Issue_bits_ctrl_csrOp(scheduler_io_q2Issue_bits_ctrl_csrOp),
    .io_q2Issue_bits_ctrl_mulOp(scheduler_io_q2Issue_bits_ctrl_mulOp),
    .io_q2Issue_bits_ctrl_divOp(scheduler_io_q2Issue_bits_ctrl_divOp),
    .io_q2Issue_bits_ctrl_src1Type(scheduler_io_q2Issue_bits_ctrl_src1Type),
    .io_q2Issue_bits_ctrl_src2Type(scheduler_io_q2Issue_bits_ctrl_src2Type),
    .io_q2Issue_bits_ctrl_immType(scheduler_io_q2Issue_bits_ctrl_immType),
    .io_q2Issue_bits_ctrl_rfWen(scheduler_io_q2Issue_bits_ctrl_rfWen),
    .io_q2Issue_bits_ctrl_memRead(scheduler_io_q2Issue_bits_ctrl_memRead),
    .io_q2Issue_bits_ctrl_memWrite(scheduler_io_q2Issue_bits_ctrl_memWrite),
    .io_q2Issue_bits_ctrl_csrWen(scheduler_io_q2Issue_bits_ctrl_csrWen),
    .io_q2Issue_bits_ctrl_isBranch(scheduler_io_q2Issue_bits_ctrl_isBranch),
    .io_q2Issue_bits_ctrl_isJump(scheduler_io_q2Issue_bits_ctrl_isJump),
    .io_q2Issue_bits_ctrl_isPriv(scheduler_io_q2Issue_bits_ctrl_isPriv),
    .io_q2Issue_bits_excpVec(scheduler_io_q2Issue_bits_excpVec),
    .io_q2Issue_bits_imm(scheduler_io_q2Issue_bits_imm),
    .io_q2Issue_bits_csrAddress(scheduler_io_q2Issue_bits_csrAddress),
    .io_q2Issue_bits_pdInfo_valid(scheduler_io_q2Issue_bits_pdInfo_valid),
    .io_q2Issue_bits_pdInfo_isBr(scheduler_io_q2Issue_bits_pdInfo_isBr),
    .io_q2Issue_bits_pdInfo_isJal(scheduler_io_q2Issue_bits_pdInfo_isJal),
    .io_q2Issue_bits_pdInfo_isJalr(scheduler_io_q2Issue_bits_pdInfo_isJalr),
    .io_q2Issue_bits_pdInfo_isCall(scheduler_io_q2Issue_bits_pdInfo_isCall),
    .io_q2Issue_bits_pdInfo_isRet(scheduler_io_q2Issue_bits_pdInfo_isRet),
    .io_q2Issue_bits_pdInfo_jumpTarget(scheduler_io_q2Issue_bits_pdInfo_jumpTarget),
    .io_q2Issue_bits_ldst(scheduler_io_q2Issue_bits_ldst),
    .io_q2Issue_bits_lrs1(scheduler_io_q2Issue_bits_lrs1),
    .io_q2Issue_bits_lrs2(scheduler_io_q2Issue_bits_lrs2),
    .io_q2Issue_bits_pdst(scheduler_io_q2Issue_bits_pdst),
    .io_q2Issue_bits_prs1(scheduler_io_q2Issue_bits_prs1),
    .io_q2Issue_bits_prs2(scheduler_io_q2Issue_bits_prs2),
    .io_q2Issue_bits_oldPdst(scheduler_io_q2Issue_bits_oldPdst),
    .io_q2Issue_bits_rs1Valid(scheduler_io_q2Issue_bits_rs1Valid),
    .io_q2Issue_bits_rs2Valid(scheduler_io_q2Issue_bits_rs2Valid),
    .io_q2Issue_bits_rdValid(scheduler_io_q2Issue_bits_rdValid),
    .io_q2Issue_bits_robIdx(scheduler_io_q2Issue_bits_robIdx),
    .io_q2Issue_bits_robIdxFull(scheduler_io_q2Issue_bits_robIdxFull),
    .io_q2Issue_bits_lqIdx(scheduler_io_q2Issue_bits_lqIdx),
    .io_q2Issue_bits_sqIdx(scheduler_io_q2Issue_bits_sqIdx),
    .io_q2Issue_bits_issueQueue(scheduler_io_q2Issue_bits_issueQueue),
    .io_q2Issue_bits_prs1Busy(scheduler_io_q2Issue_bits_prs1Busy),
    .io_q2Issue_bits_prs2Busy(scheduler_io_q2Issue_bits_prs2Busy),
    .io_q2Issue_bits_isSta(scheduler_io_q2Issue_bits_isSta),
    .io_q2Issue_bits_isStd(scheduler_io_q2Issue_bits_isStd),
    .io_q3Issue_ready(scheduler_io_q3Issue_ready),
    .io_q3Issue_valid(scheduler_io_q3Issue_valid),
    .io_q3Issue_bits_pc(scheduler_io_q3Issue_bits_pc),
    .io_q3Issue_bits_inst(scheduler_io_q3Issue_bits_inst),
    .io_q3Issue_bits_ctrl_fuType(scheduler_io_q3Issue_bits_ctrl_fuType),
    .io_q3Issue_bits_ctrl_aluOp(scheduler_io_q3Issue_bits_ctrl_aluOp),
    .io_q3Issue_bits_ctrl_bruOp(scheduler_io_q3Issue_bits_ctrl_bruOp),
    .io_q3Issue_bits_ctrl_lsuOp(scheduler_io_q3Issue_bits_ctrl_lsuOp),
    .io_q3Issue_bits_ctrl_csrOp(scheduler_io_q3Issue_bits_ctrl_csrOp),
    .io_q3Issue_bits_ctrl_mulOp(scheduler_io_q3Issue_bits_ctrl_mulOp),
    .io_q3Issue_bits_ctrl_divOp(scheduler_io_q3Issue_bits_ctrl_divOp),
    .io_q3Issue_bits_ctrl_src1Type(scheduler_io_q3Issue_bits_ctrl_src1Type),
    .io_q3Issue_bits_ctrl_src2Type(scheduler_io_q3Issue_bits_ctrl_src2Type),
    .io_q3Issue_bits_ctrl_immType(scheduler_io_q3Issue_bits_ctrl_immType),
    .io_q3Issue_bits_ctrl_rfWen(scheduler_io_q3Issue_bits_ctrl_rfWen),
    .io_q3Issue_bits_ctrl_memRead(scheduler_io_q3Issue_bits_ctrl_memRead),
    .io_q3Issue_bits_ctrl_memWrite(scheduler_io_q3Issue_bits_ctrl_memWrite),
    .io_q3Issue_bits_ctrl_csrWen(scheduler_io_q3Issue_bits_ctrl_csrWen),
    .io_q3Issue_bits_ctrl_isBranch(scheduler_io_q3Issue_bits_ctrl_isBranch),
    .io_q3Issue_bits_ctrl_isJump(scheduler_io_q3Issue_bits_ctrl_isJump),
    .io_q3Issue_bits_ctrl_isPriv(scheduler_io_q3Issue_bits_ctrl_isPriv),
    .io_q3Issue_bits_excpVec(scheduler_io_q3Issue_bits_excpVec),
    .io_q3Issue_bits_imm(scheduler_io_q3Issue_bits_imm),
    .io_q3Issue_bits_csrAddress(scheduler_io_q3Issue_bits_csrAddress),
    .io_q3Issue_bits_pdInfo_valid(scheduler_io_q3Issue_bits_pdInfo_valid),
    .io_q3Issue_bits_pdInfo_isBr(scheduler_io_q3Issue_bits_pdInfo_isBr),
    .io_q3Issue_bits_pdInfo_isJal(scheduler_io_q3Issue_bits_pdInfo_isJal),
    .io_q3Issue_bits_pdInfo_isJalr(scheduler_io_q3Issue_bits_pdInfo_isJalr),
    .io_q3Issue_bits_pdInfo_isCall(scheduler_io_q3Issue_bits_pdInfo_isCall),
    .io_q3Issue_bits_pdInfo_isRet(scheduler_io_q3Issue_bits_pdInfo_isRet),
    .io_q3Issue_bits_pdInfo_jumpTarget(scheduler_io_q3Issue_bits_pdInfo_jumpTarget),
    .io_q3Issue_bits_ldst(scheduler_io_q3Issue_bits_ldst),
    .io_q3Issue_bits_lrs1(scheduler_io_q3Issue_bits_lrs1),
    .io_q3Issue_bits_lrs2(scheduler_io_q3Issue_bits_lrs2),
    .io_q3Issue_bits_pdst(scheduler_io_q3Issue_bits_pdst),
    .io_q3Issue_bits_prs1(scheduler_io_q3Issue_bits_prs1),
    .io_q3Issue_bits_prs2(scheduler_io_q3Issue_bits_prs2),
    .io_q3Issue_bits_oldPdst(scheduler_io_q3Issue_bits_oldPdst),
    .io_q3Issue_bits_rs1Valid(scheduler_io_q3Issue_bits_rs1Valid),
    .io_q3Issue_bits_rs2Valid(scheduler_io_q3Issue_bits_rs2Valid),
    .io_q3Issue_bits_rdValid(scheduler_io_q3Issue_bits_rdValid),
    .io_q3Issue_bits_robIdx(scheduler_io_q3Issue_bits_robIdx),
    .io_q3Issue_bits_robIdxFull(scheduler_io_q3Issue_bits_robIdxFull),
    .io_q3Issue_bits_lqIdx(scheduler_io_q3Issue_bits_lqIdx),
    .io_q3Issue_bits_sqIdx(scheduler_io_q3Issue_bits_sqIdx),
    .io_q3Issue_bits_issueQueue(scheduler_io_q3Issue_bits_issueQueue),
    .io_q3Issue_bits_prs1Busy(scheduler_io_q3Issue_bits_prs1Busy),
    .io_q3Issue_bits_prs2Busy(scheduler_io_q3Issue_bits_prs2Busy),
    .io_q3Issue_bits_isSta(scheduler_io_q3Issue_bits_isSta),
    .io_q3Issue_bits_isStd(scheduler_io_q3Issue_bits_isStd),
    .io_q4Issue_ready(scheduler_io_q4Issue_ready),
    .io_q4Issue_valid(scheduler_io_q4Issue_valid),
    .io_q4Issue_bits_pc(scheduler_io_q4Issue_bits_pc),
    .io_q4Issue_bits_inst(scheduler_io_q4Issue_bits_inst),
    .io_q4Issue_bits_ctrl_fuType(scheduler_io_q4Issue_bits_ctrl_fuType),
    .io_q4Issue_bits_ctrl_aluOp(scheduler_io_q4Issue_bits_ctrl_aluOp),
    .io_q4Issue_bits_ctrl_bruOp(scheduler_io_q4Issue_bits_ctrl_bruOp),
    .io_q4Issue_bits_ctrl_lsuOp(scheduler_io_q4Issue_bits_ctrl_lsuOp),
    .io_q4Issue_bits_ctrl_csrOp(scheduler_io_q4Issue_bits_ctrl_csrOp),
    .io_q4Issue_bits_ctrl_mulOp(scheduler_io_q4Issue_bits_ctrl_mulOp),
    .io_q4Issue_bits_ctrl_divOp(scheduler_io_q4Issue_bits_ctrl_divOp),
    .io_q4Issue_bits_ctrl_src1Type(scheduler_io_q4Issue_bits_ctrl_src1Type),
    .io_q4Issue_bits_ctrl_src2Type(scheduler_io_q4Issue_bits_ctrl_src2Type),
    .io_q4Issue_bits_ctrl_immType(scheduler_io_q4Issue_bits_ctrl_immType),
    .io_q4Issue_bits_ctrl_rfWen(scheduler_io_q4Issue_bits_ctrl_rfWen),
    .io_q4Issue_bits_ctrl_memRead(scheduler_io_q4Issue_bits_ctrl_memRead),
    .io_q4Issue_bits_ctrl_memWrite(scheduler_io_q4Issue_bits_ctrl_memWrite),
    .io_q4Issue_bits_ctrl_csrWen(scheduler_io_q4Issue_bits_ctrl_csrWen),
    .io_q4Issue_bits_ctrl_isBranch(scheduler_io_q4Issue_bits_ctrl_isBranch),
    .io_q4Issue_bits_ctrl_isJump(scheduler_io_q4Issue_bits_ctrl_isJump),
    .io_q4Issue_bits_ctrl_isPriv(scheduler_io_q4Issue_bits_ctrl_isPriv),
    .io_q4Issue_bits_excpVec(scheduler_io_q4Issue_bits_excpVec),
    .io_q4Issue_bits_imm(scheduler_io_q4Issue_bits_imm),
    .io_q4Issue_bits_csrAddress(scheduler_io_q4Issue_bits_csrAddress),
    .io_q4Issue_bits_pdInfo_valid(scheduler_io_q4Issue_bits_pdInfo_valid),
    .io_q4Issue_bits_pdInfo_isBr(scheduler_io_q4Issue_bits_pdInfo_isBr),
    .io_q4Issue_bits_pdInfo_isJal(scheduler_io_q4Issue_bits_pdInfo_isJal),
    .io_q4Issue_bits_pdInfo_isJalr(scheduler_io_q4Issue_bits_pdInfo_isJalr),
    .io_q4Issue_bits_pdInfo_isCall(scheduler_io_q4Issue_bits_pdInfo_isCall),
    .io_q4Issue_bits_pdInfo_isRet(scheduler_io_q4Issue_bits_pdInfo_isRet),
    .io_q4Issue_bits_pdInfo_jumpTarget(scheduler_io_q4Issue_bits_pdInfo_jumpTarget),
    .io_q4Issue_bits_ldst(scheduler_io_q4Issue_bits_ldst),
    .io_q4Issue_bits_lrs1(scheduler_io_q4Issue_bits_lrs1),
    .io_q4Issue_bits_lrs2(scheduler_io_q4Issue_bits_lrs2),
    .io_q4Issue_bits_pdst(scheduler_io_q4Issue_bits_pdst),
    .io_q4Issue_bits_prs1(scheduler_io_q4Issue_bits_prs1),
    .io_q4Issue_bits_prs2(scheduler_io_q4Issue_bits_prs2),
    .io_q4Issue_bits_oldPdst(scheduler_io_q4Issue_bits_oldPdst),
    .io_q4Issue_bits_rs1Valid(scheduler_io_q4Issue_bits_rs1Valid),
    .io_q4Issue_bits_rs2Valid(scheduler_io_q4Issue_bits_rs2Valid),
    .io_q4Issue_bits_rdValid(scheduler_io_q4Issue_bits_rdValid),
    .io_q4Issue_bits_robIdx(scheduler_io_q4Issue_bits_robIdx),
    .io_q4Issue_bits_robIdxFull(scheduler_io_q4Issue_bits_robIdxFull),
    .io_q4Issue_bits_lqIdx(scheduler_io_q4Issue_bits_lqIdx),
    .io_q4Issue_bits_sqIdx(scheduler_io_q4Issue_bits_sqIdx),
    .io_q4Issue_bits_issueQueue(scheduler_io_q4Issue_bits_issueQueue),
    .io_q4Issue_bits_prs1Busy(scheduler_io_q4Issue_bits_prs1Busy),
    .io_q4Issue_bits_prs2Busy(scheduler_io_q4Issue_bits_prs2Busy),
    .io_q4Issue_bits_isSta(scheduler_io_q4Issue_bits_isSta),
    .io_q4Issue_bits_isStd(scheduler_io_q4Issue_bits_isStd),
    .io_q5Issue_ready(scheduler_io_q5Issue_ready),
    .io_q5Issue_valid(scheduler_io_q5Issue_valid),
    .io_q5Issue_bits_pc(scheduler_io_q5Issue_bits_pc),
    .io_q5Issue_bits_inst(scheduler_io_q5Issue_bits_inst),
    .io_q5Issue_bits_ctrl_fuType(scheduler_io_q5Issue_bits_ctrl_fuType),
    .io_q5Issue_bits_ctrl_aluOp(scheduler_io_q5Issue_bits_ctrl_aluOp),
    .io_q5Issue_bits_ctrl_bruOp(scheduler_io_q5Issue_bits_ctrl_bruOp),
    .io_q5Issue_bits_ctrl_lsuOp(scheduler_io_q5Issue_bits_ctrl_lsuOp),
    .io_q5Issue_bits_ctrl_csrOp(scheduler_io_q5Issue_bits_ctrl_csrOp),
    .io_q5Issue_bits_ctrl_mulOp(scheduler_io_q5Issue_bits_ctrl_mulOp),
    .io_q5Issue_bits_ctrl_divOp(scheduler_io_q5Issue_bits_ctrl_divOp),
    .io_q5Issue_bits_ctrl_src1Type(scheduler_io_q5Issue_bits_ctrl_src1Type),
    .io_q5Issue_bits_ctrl_src2Type(scheduler_io_q5Issue_bits_ctrl_src2Type),
    .io_q5Issue_bits_ctrl_immType(scheduler_io_q5Issue_bits_ctrl_immType),
    .io_q5Issue_bits_ctrl_rfWen(scheduler_io_q5Issue_bits_ctrl_rfWen),
    .io_q5Issue_bits_ctrl_memRead(scheduler_io_q5Issue_bits_ctrl_memRead),
    .io_q5Issue_bits_ctrl_memWrite(scheduler_io_q5Issue_bits_ctrl_memWrite),
    .io_q5Issue_bits_ctrl_csrWen(scheduler_io_q5Issue_bits_ctrl_csrWen),
    .io_q5Issue_bits_ctrl_isBranch(scheduler_io_q5Issue_bits_ctrl_isBranch),
    .io_q5Issue_bits_ctrl_isJump(scheduler_io_q5Issue_bits_ctrl_isJump),
    .io_q5Issue_bits_ctrl_isPriv(scheduler_io_q5Issue_bits_ctrl_isPriv),
    .io_q5Issue_bits_excpVec(scheduler_io_q5Issue_bits_excpVec),
    .io_q5Issue_bits_imm(scheduler_io_q5Issue_bits_imm),
    .io_q5Issue_bits_csrAddress(scheduler_io_q5Issue_bits_csrAddress),
    .io_q5Issue_bits_pdInfo_valid(scheduler_io_q5Issue_bits_pdInfo_valid),
    .io_q5Issue_bits_pdInfo_isBr(scheduler_io_q5Issue_bits_pdInfo_isBr),
    .io_q5Issue_bits_pdInfo_isJal(scheduler_io_q5Issue_bits_pdInfo_isJal),
    .io_q5Issue_bits_pdInfo_isJalr(scheduler_io_q5Issue_bits_pdInfo_isJalr),
    .io_q5Issue_bits_pdInfo_isCall(scheduler_io_q5Issue_bits_pdInfo_isCall),
    .io_q5Issue_bits_pdInfo_isRet(scheduler_io_q5Issue_bits_pdInfo_isRet),
    .io_q5Issue_bits_pdInfo_jumpTarget(scheduler_io_q5Issue_bits_pdInfo_jumpTarget),
    .io_q5Issue_bits_ldst(scheduler_io_q5Issue_bits_ldst),
    .io_q5Issue_bits_lrs1(scheduler_io_q5Issue_bits_lrs1),
    .io_q5Issue_bits_lrs2(scheduler_io_q5Issue_bits_lrs2),
    .io_q5Issue_bits_pdst(scheduler_io_q5Issue_bits_pdst),
    .io_q5Issue_bits_prs1(scheduler_io_q5Issue_bits_prs1),
    .io_q5Issue_bits_prs2(scheduler_io_q5Issue_bits_prs2),
    .io_q5Issue_bits_oldPdst(scheduler_io_q5Issue_bits_oldPdst),
    .io_q5Issue_bits_rs1Valid(scheduler_io_q5Issue_bits_rs1Valid),
    .io_q5Issue_bits_rs2Valid(scheduler_io_q5Issue_bits_rs2Valid),
    .io_q5Issue_bits_rdValid(scheduler_io_q5Issue_bits_rdValid),
    .io_q5Issue_bits_robIdx(scheduler_io_q5Issue_bits_robIdx),
    .io_q5Issue_bits_robIdxFull(scheduler_io_q5Issue_bits_robIdxFull),
    .io_q5Issue_bits_lqIdx(scheduler_io_q5Issue_bits_lqIdx),
    .io_q5Issue_bits_sqIdx(scheduler_io_q5Issue_bits_sqIdx),
    .io_q5Issue_bits_issueQueue(scheduler_io_q5Issue_bits_issueQueue),
    .io_q5Issue_bits_prs1Busy(scheduler_io_q5Issue_bits_prs1Busy),
    .io_q5Issue_bits_prs2Busy(scheduler_io_q5Issue_bits_prs2Busy),
    .io_q5Issue_bits_isSta(scheduler_io_q5Issue_bits_isSta),
    .io_q5Issue_bits_isStd(scheduler_io_q5Issue_bits_isStd),
    .io_redirect_valid(scheduler_io_redirect_valid),
    .io_redirect_robIdx(scheduler_io_redirect_robIdx),
    .io_feedback_q1FreeEntries(scheduler_io_feedback_q1FreeEntries),
    .io_feedback_q2FreeEntries(scheduler_io_feedback_q2FreeEntries),
    .io_feedback_q3FreeEntries(scheduler_io_feedback_q3FreeEntries),
    .io_feedback_q4FreeEntries(scheduler_io_feedback_q4FreeEntries),
    .io_feedback_q5FreeEntries(scheduler_io_feedback_q5FreeEntries)
  );
  assign io_in_0_ready = ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 26:23]
  assign io_in_1_ready = ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 26:23]
  assign io_in_2_ready = ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 26:23]
  assign io_redirect_valid = 1'h0; // @[src/main/scala/backend/Backend.scala 31:15]
  assign io_redirect_robIdx = 6'h0; // @[src/main/scala/backend/Backend.scala 31:15]
  assign ctrlBlock_clock = clock;
  assign ctrlBlock_reset = reset;
  assign ctrlBlock_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 26:23]
  assign ctrlBlock_io_iqFeedback_q1FreeEntries = scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 41:27]
  assign ctrlBlock_io_iqFeedback_q2FreeEntries = scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 41:27]
  assign ctrlBlock_io_iqFeedback_q3FreeEntries = scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 41:27]
  assign ctrlBlock_io_iqFeedback_q4FreeEntries = scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 41:27]
  assign ctrlBlock_io_iqFeedback_q5FreeEntries = scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 41:27]
  assign ctrlBlock_io_extInt = io_extInt; // @[src/main/scala/backend/Backend.scala 28:23]
  assign scheduler_clock = clock;
  assign scheduler_reset = reset;
  assign scheduler_io_q1IQEnq_valid = ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pc = ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_inst = ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_fuType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_divOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_immType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memRead = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isJump = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_excpVec = ctrlBlock_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_imm = ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_csrAddress = ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_valid = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_ldst = ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_lrs1 = ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_lrs2 = ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_pdst = ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_prs1 = ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_prs2 = ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_oldPdst = ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_rs1Valid = ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_rs2Valid = ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_rdValid = ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_robIdx = ctrlBlock_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_robIdxFull = ctrlBlock_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_prs1Busy = ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q1IQEnq_bits_prs2Busy = ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 34:24]
  assign scheduler_io_q2IQEnq_valid = ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pc = ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_inst = ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_fuType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_divOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_immType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memRead = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isJump = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_excpVec = ctrlBlock_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_imm = ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_csrAddress = ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_valid = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_ldst = ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_lrs1 = ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_lrs2 = ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_pdst = ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_prs1 = ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_prs2 = ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_oldPdst = ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_rs1Valid = ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_rs2Valid = ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_rdValid = ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_robIdx = ctrlBlock_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_robIdxFull = ctrlBlock_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_issueQueue = ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_prs1Busy = ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q2IQEnq_bits_prs2Busy = ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 35:24]
  assign scheduler_io_q3IQEnq_valid = ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pc = ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_inst = ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_fuType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_divOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_immType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memRead = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isJump = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_excpVec = ctrlBlock_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_imm = ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_csrAddress = ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_valid = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_ldst = ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_lrs1 = ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_lrs2 = ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_pdst = ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_prs1 = ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_prs2 = ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_oldPdst = ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_rs1Valid = ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_rs2Valid = ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_rdValid = ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_robIdx = ctrlBlock_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_robIdxFull = ctrlBlock_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_issueQueue = ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_prs1Busy = ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q3IQEnq_bits_prs2Busy = ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 36:24]
  assign scheduler_io_q4IQEnq_valid = ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pc = ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_inst = ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_fuType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_divOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_immType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memRead = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isJump = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_excpVec = ctrlBlock_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_imm = ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_csrAddress = ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_valid = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_ldst = ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_lrs1 = ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_lrs2 = ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_pdst = ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_prs1 = ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_prs2 = ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_oldPdst = ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_rs1Valid = ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_rs2Valid = ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_rdValid = ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_robIdx = ctrlBlock_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_robIdxFull = ctrlBlock_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_lqIdx = ctrlBlock_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_sqIdx = ctrlBlock_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_issueQueue = ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_prs1Busy = ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_prs2Busy = ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q4IQEnq_bits_isSta = ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 37:24]
  assign scheduler_io_q5IQEnq_valid = ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pc = ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_inst = ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_fuType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_divOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_immType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memRead = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isJump = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_excpVec = ctrlBlock_io_q5IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_csrAddress = ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_valid = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_ldst = ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_lrs1 = ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_lrs2 = ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_prs1 = ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_prs2 = ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_oldPdst = ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_rs2Valid = ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_robIdx = ctrlBlock_io_q5IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_robIdxFull = ctrlBlock_io_q5IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_sqIdx = ctrlBlock_io_q5IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_issueQueue = ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_prs2Busy = ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q5IQEnq_bits_isStd = ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 38:24]
  assign scheduler_io_q1Issue_ready = 1'h1; // @[src/main/scala/backend/Backend.scala 60:30]
  assign scheduler_io_q2Issue_ready = 1'h1; // @[src/main/scala/backend/Backend.scala 61:30]
  assign scheduler_io_q3Issue_ready = 1'h1; // @[src/main/scala/backend/Backend.scala 62:30]
  assign scheduler_io_q4Issue_ready = 1'h1; // @[src/main/scala/backend/Backend.scala 63:30]
  assign scheduler_io_q5Issue_ready = 1'h1; // @[src/main/scala/backend/Backend.scala 64:30]
  assign scheduler_io_redirect_valid = io_redirect_valid; // @[src/main/scala/backend/Backend.scala 44:36]
  assign scheduler_io_redirect_robIdx = io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 45:36]
endmodule
