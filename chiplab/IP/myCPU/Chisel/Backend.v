module Backend(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 22:14]
  output        io_in_1_ready, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 22:14]
  output        io_in_2_ready, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 22:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 22:14]
  output        io_redirect_valid, // @[src/main/scala/backend/Backend.scala 22:14]
  output [5:0]  io_redirect_robIdx, // @[src/main/scala/backend/Backend.scala 22:14]
  input         io_extInt // @[src/main/scala/backend/Backend.scala 22:14]
);
  wire  ctrlBlock_clock; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_reset; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [9:0] ctrlBlock_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [13:0] ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [9:0] ctrlBlock_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [13:0] ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [9:0] ctrlBlock_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [13:0] ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [9:0] ctrlBlock_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [13:0] ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [9:0] ctrlBlock_io_q5IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [13:0] ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_q5IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_0_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_lsEnq_req_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_0_bits_isLoad; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_0_bits_isStore; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_1_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_lsEnq_req_1_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_1_bits_isLoad; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_1_bits_isStore; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_1_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_1_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_2_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_lsEnq_req_2_bits_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_2_bits_isLoad; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_lsEnq_req_2_bits_isStore; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_2_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_2_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 24:27]
  wire [5:0] ctrlBlock_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  ctrlBlock_io_extInt; // @[src/main/scala/backend/Backend.scala 24:27]
  wire  scheduler_clock; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_reset; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q1IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q1IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q1IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q2IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q2IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q2IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q3IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q3IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q3IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q4IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q4IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q4IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4IQEnq_bits_isSta; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q5IQEnq_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q5IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q5IQEnq_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5IQEnq_bits_isStd; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_ready; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q1Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q1Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q1Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q1Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q1Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q1Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q1Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q1Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q1Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_ready; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q2Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q2Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q2Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q2Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q2Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q2Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q2Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q2Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_ready; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q3Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q3Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q3Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q3Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q3Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q3Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q3Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q3Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q3Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_ready; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q4Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q4Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q4Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q4Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q4Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q4Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q4Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q4Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q4Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_ready; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [9:0] scheduler_io_q5Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [13:0] scheduler_io_q5Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [31:0] scheduler_io_q5Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_q5Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_q5Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [6:0] scheduler_io_q5Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_q5Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [2:0] scheduler_io_q5Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_q5Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  scheduler_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [5:0] scheduler_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [4:0] scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 25:27]
  wire [3:0] scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 25:27]
  wire  regRead_clock; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_reset; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_0_bits_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_0_bits_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_iqIssues_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_0_bits_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_iqIssues_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_iqIssues_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_1_bits_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_1_bits_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_1_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_iqIssues_1_bits_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_1_bits_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_iqIssues_1_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_1_bits_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_1_bits_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_1_bits_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_1_bits_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_1_bits_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_1_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_iqIssues_1_bits_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_1_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_1_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_1_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_2_bits_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_2_bits_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_2_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_iqIssues_2_bits_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_2_bits_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_iqIssues_2_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_2_bits_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_2_bits_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_2_bits_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_2_bits_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_2_bits_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_2_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_iqIssues_2_bits_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_2_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_2_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_2_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_2_bits_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_3_bits_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_3_bits_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_3_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_iqIssues_3_bits_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_3_bits_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_iqIssues_3_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_3_bits_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_3_bits_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_3_bits_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_3_bits_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_3_bits_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_3_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_iqIssues_3_bits_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_3_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_3_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_3_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_3_bits_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_4_bits_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_4_bits_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_4_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_iqIssues_4_bits_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_iqIssues_4_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_iqIssues_4_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_4_bits_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_4_bits_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_iqIssues_4_bits_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_4_bits_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_4_bits_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_4_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_iqIssues_4_bits_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_iqIssues_4_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_iqIssues_4_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_iqIssues_4_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_iqIssues_4_bits_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_0; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_3; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_4; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_5; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_6; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_rfReadAddrs_7; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_0; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_3; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_4; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_5; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_6; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_rfReadData_7; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_exeReqs_0_bits_uop_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_exeReqs_0_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_exeReqs_0_bits_uop_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_0_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_0_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_exeReqs_1_bits_uop_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_exeReqs_1_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_exeReqs_1_bits_uop_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_1_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_1_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_exeReqs_2_bits_uop_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_exeReqs_2_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_exeReqs_2_bits_uop_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_2_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_2_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_exeReqs_3_bits_uop_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_exeReqs_3_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_exeReqs_3_bits_uop_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_3_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_3_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_ready; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [9:0] regRead_io_exeReqs_4_bits_uop_excpVec; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [13:0] regRead_io_exeReqs_4_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_exeReqs_4_bits_uop_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_robIdxFull; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_lqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_sqIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_exeReqs_4_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [31:0] regRead_io_exeReqs_4_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regRead_io_redirect_valid; // @[src/main/scala/backend/Backend.scala 26:27]
  wire [5:0] regRead_io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 26:27]
  wire  regFile_clock; // @[src/main/scala/backend/Backend.scala 27:27]
  wire  regFile_reset; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_0_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_0_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_1_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_1_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_2_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_2_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_3_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_3_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_4_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_4_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_5_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_5_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_6_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_6_data; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [6:0] regFile_io_readPorts_7_addr; // @[src/main/scala/backend/Backend.scala 27:27]
  wire [31:0] regFile_io_readPorts_7_data; // @[src/main/scala/backend/Backend.scala 27:27]
  CtrlBlock ctrlBlock ( // @[src/main/scala/backend/Backend.scala 24:27]
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
  Scheduler scheduler ( // @[src/main/scala/backend/Backend.scala 25:27]
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
    .io_q2Issue_bits_issueQueue(scheduler_io_q2Issue_bits_issueQueue),
    .io_q2Issue_bits_prs1Busy(scheduler_io_q2Issue_bits_prs1Busy),
    .io_q2Issue_bits_prs2Busy(scheduler_io_q2Issue_bits_prs2Busy),
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
    .io_q5Issue_bits_prs1(scheduler_io_q5Issue_bits_prs1),
    .io_q5Issue_bits_prs2(scheduler_io_q5Issue_bits_prs2),
    .io_q5Issue_bits_oldPdst(scheduler_io_q5Issue_bits_oldPdst),
    .io_q5Issue_bits_rs2Valid(scheduler_io_q5Issue_bits_rs2Valid),
    .io_q5Issue_bits_robIdx(scheduler_io_q5Issue_bits_robIdx),
    .io_q5Issue_bits_robIdxFull(scheduler_io_q5Issue_bits_robIdxFull),
    .io_q5Issue_bits_sqIdx(scheduler_io_q5Issue_bits_sqIdx),
    .io_q5Issue_bits_issueQueue(scheduler_io_q5Issue_bits_issueQueue),
    .io_q5Issue_bits_prs2Busy(scheduler_io_q5Issue_bits_prs2Busy),
    .io_q5Issue_bits_isStd(scheduler_io_q5Issue_bits_isStd),
    .io_redirect_valid(scheduler_io_redirect_valid),
    .io_redirect_robIdx(scheduler_io_redirect_robIdx),
    .io_feedback_q1FreeEntries(scheduler_io_feedback_q1FreeEntries),
    .io_feedback_q2FreeEntries(scheduler_io_feedback_q2FreeEntries),
    .io_feedback_q3FreeEntries(scheduler_io_feedback_q3FreeEntries),
    .io_feedback_q4FreeEntries(scheduler_io_feedback_q4FreeEntries),
    .io_feedback_q5FreeEntries(scheduler_io_feedback_q5FreeEntries)
  );
  RegisterRead regRead ( // @[src/main/scala/backend/Backend.scala 26:27]
    .clock(regRead_clock),
    .reset(regRead_reset),
    .io_iqIssues_0_ready(regRead_io_iqIssues_0_ready),
    .io_iqIssues_0_valid(regRead_io_iqIssues_0_valid),
    .io_iqIssues_0_bits_pc(regRead_io_iqIssues_0_bits_pc),
    .io_iqIssues_0_bits_inst(regRead_io_iqIssues_0_bits_inst),
    .io_iqIssues_0_bits_ctrl_fuType(regRead_io_iqIssues_0_bits_ctrl_fuType),
    .io_iqIssues_0_bits_ctrl_aluOp(regRead_io_iqIssues_0_bits_ctrl_aluOp),
    .io_iqIssues_0_bits_ctrl_bruOp(regRead_io_iqIssues_0_bits_ctrl_bruOp),
    .io_iqIssues_0_bits_ctrl_lsuOp(regRead_io_iqIssues_0_bits_ctrl_lsuOp),
    .io_iqIssues_0_bits_ctrl_csrOp(regRead_io_iqIssues_0_bits_ctrl_csrOp),
    .io_iqIssues_0_bits_ctrl_mulOp(regRead_io_iqIssues_0_bits_ctrl_mulOp),
    .io_iqIssues_0_bits_ctrl_divOp(regRead_io_iqIssues_0_bits_ctrl_divOp),
    .io_iqIssues_0_bits_ctrl_src1Type(regRead_io_iqIssues_0_bits_ctrl_src1Type),
    .io_iqIssues_0_bits_ctrl_src2Type(regRead_io_iqIssues_0_bits_ctrl_src2Type),
    .io_iqIssues_0_bits_ctrl_immType(regRead_io_iqIssues_0_bits_ctrl_immType),
    .io_iqIssues_0_bits_ctrl_rfWen(regRead_io_iqIssues_0_bits_ctrl_rfWen),
    .io_iqIssues_0_bits_ctrl_memRead(regRead_io_iqIssues_0_bits_ctrl_memRead),
    .io_iqIssues_0_bits_ctrl_memWrite(regRead_io_iqIssues_0_bits_ctrl_memWrite),
    .io_iqIssues_0_bits_ctrl_csrWen(regRead_io_iqIssues_0_bits_ctrl_csrWen),
    .io_iqIssues_0_bits_ctrl_isBranch(regRead_io_iqIssues_0_bits_ctrl_isBranch),
    .io_iqIssues_0_bits_ctrl_isJump(regRead_io_iqIssues_0_bits_ctrl_isJump),
    .io_iqIssues_0_bits_ctrl_isPriv(regRead_io_iqIssues_0_bits_ctrl_isPriv),
    .io_iqIssues_0_bits_excpVec(regRead_io_iqIssues_0_bits_excpVec),
    .io_iqIssues_0_bits_imm(regRead_io_iqIssues_0_bits_imm),
    .io_iqIssues_0_bits_csrAddress(regRead_io_iqIssues_0_bits_csrAddress),
    .io_iqIssues_0_bits_pdInfo_valid(regRead_io_iqIssues_0_bits_pdInfo_valid),
    .io_iqIssues_0_bits_pdInfo_isBr(regRead_io_iqIssues_0_bits_pdInfo_isBr),
    .io_iqIssues_0_bits_pdInfo_isJal(regRead_io_iqIssues_0_bits_pdInfo_isJal),
    .io_iqIssues_0_bits_pdInfo_isJalr(regRead_io_iqIssues_0_bits_pdInfo_isJalr),
    .io_iqIssues_0_bits_pdInfo_isCall(regRead_io_iqIssues_0_bits_pdInfo_isCall),
    .io_iqIssues_0_bits_pdInfo_isRet(regRead_io_iqIssues_0_bits_pdInfo_isRet),
    .io_iqIssues_0_bits_pdInfo_jumpTarget(regRead_io_iqIssues_0_bits_pdInfo_jumpTarget),
    .io_iqIssues_0_bits_ldst(regRead_io_iqIssues_0_bits_ldst),
    .io_iqIssues_0_bits_lrs1(regRead_io_iqIssues_0_bits_lrs1),
    .io_iqIssues_0_bits_lrs2(regRead_io_iqIssues_0_bits_lrs2),
    .io_iqIssues_0_bits_pdst(regRead_io_iqIssues_0_bits_pdst),
    .io_iqIssues_0_bits_prs1(regRead_io_iqIssues_0_bits_prs1),
    .io_iqIssues_0_bits_prs2(regRead_io_iqIssues_0_bits_prs2),
    .io_iqIssues_0_bits_oldPdst(regRead_io_iqIssues_0_bits_oldPdst),
    .io_iqIssues_0_bits_rs1Valid(regRead_io_iqIssues_0_bits_rs1Valid),
    .io_iqIssues_0_bits_rs2Valid(regRead_io_iqIssues_0_bits_rs2Valid),
    .io_iqIssues_0_bits_rdValid(regRead_io_iqIssues_0_bits_rdValid),
    .io_iqIssues_0_bits_robIdx(regRead_io_iqIssues_0_bits_robIdx),
    .io_iqIssues_0_bits_robIdxFull(regRead_io_iqIssues_0_bits_robIdxFull),
    .io_iqIssues_0_bits_lqIdx(regRead_io_iqIssues_0_bits_lqIdx),
    .io_iqIssues_0_bits_sqIdx(regRead_io_iqIssues_0_bits_sqIdx),
    .io_iqIssues_0_bits_issueQueue(regRead_io_iqIssues_0_bits_issueQueue),
    .io_iqIssues_0_bits_prs1Busy(regRead_io_iqIssues_0_bits_prs1Busy),
    .io_iqIssues_0_bits_prs2Busy(regRead_io_iqIssues_0_bits_prs2Busy),
    .io_iqIssues_0_bits_isSta(regRead_io_iqIssues_0_bits_isSta),
    .io_iqIssues_1_ready(regRead_io_iqIssues_1_ready),
    .io_iqIssues_1_valid(regRead_io_iqIssues_1_valid),
    .io_iqIssues_1_bits_pc(regRead_io_iqIssues_1_bits_pc),
    .io_iqIssues_1_bits_inst(regRead_io_iqIssues_1_bits_inst),
    .io_iqIssues_1_bits_ctrl_fuType(regRead_io_iqIssues_1_bits_ctrl_fuType),
    .io_iqIssues_1_bits_ctrl_aluOp(regRead_io_iqIssues_1_bits_ctrl_aluOp),
    .io_iqIssues_1_bits_ctrl_bruOp(regRead_io_iqIssues_1_bits_ctrl_bruOp),
    .io_iqIssues_1_bits_ctrl_lsuOp(regRead_io_iqIssues_1_bits_ctrl_lsuOp),
    .io_iqIssues_1_bits_ctrl_csrOp(regRead_io_iqIssues_1_bits_ctrl_csrOp),
    .io_iqIssues_1_bits_ctrl_mulOp(regRead_io_iqIssues_1_bits_ctrl_mulOp),
    .io_iqIssues_1_bits_ctrl_divOp(regRead_io_iqIssues_1_bits_ctrl_divOp),
    .io_iqIssues_1_bits_ctrl_src1Type(regRead_io_iqIssues_1_bits_ctrl_src1Type),
    .io_iqIssues_1_bits_ctrl_src2Type(regRead_io_iqIssues_1_bits_ctrl_src2Type),
    .io_iqIssues_1_bits_ctrl_immType(regRead_io_iqIssues_1_bits_ctrl_immType),
    .io_iqIssues_1_bits_ctrl_rfWen(regRead_io_iqIssues_1_bits_ctrl_rfWen),
    .io_iqIssues_1_bits_ctrl_memRead(regRead_io_iqIssues_1_bits_ctrl_memRead),
    .io_iqIssues_1_bits_ctrl_memWrite(regRead_io_iqIssues_1_bits_ctrl_memWrite),
    .io_iqIssues_1_bits_ctrl_csrWen(regRead_io_iqIssues_1_bits_ctrl_csrWen),
    .io_iqIssues_1_bits_ctrl_isBranch(regRead_io_iqIssues_1_bits_ctrl_isBranch),
    .io_iqIssues_1_bits_ctrl_isJump(regRead_io_iqIssues_1_bits_ctrl_isJump),
    .io_iqIssues_1_bits_ctrl_isPriv(regRead_io_iqIssues_1_bits_ctrl_isPriv),
    .io_iqIssues_1_bits_excpVec(regRead_io_iqIssues_1_bits_excpVec),
    .io_iqIssues_1_bits_imm(regRead_io_iqIssues_1_bits_imm),
    .io_iqIssues_1_bits_csrAddress(regRead_io_iqIssues_1_bits_csrAddress),
    .io_iqIssues_1_bits_pdInfo_valid(regRead_io_iqIssues_1_bits_pdInfo_valid),
    .io_iqIssues_1_bits_pdInfo_isBr(regRead_io_iqIssues_1_bits_pdInfo_isBr),
    .io_iqIssues_1_bits_pdInfo_isJal(regRead_io_iqIssues_1_bits_pdInfo_isJal),
    .io_iqIssues_1_bits_pdInfo_isJalr(regRead_io_iqIssues_1_bits_pdInfo_isJalr),
    .io_iqIssues_1_bits_pdInfo_isCall(regRead_io_iqIssues_1_bits_pdInfo_isCall),
    .io_iqIssues_1_bits_pdInfo_isRet(regRead_io_iqIssues_1_bits_pdInfo_isRet),
    .io_iqIssues_1_bits_pdInfo_jumpTarget(regRead_io_iqIssues_1_bits_pdInfo_jumpTarget),
    .io_iqIssues_1_bits_ldst(regRead_io_iqIssues_1_bits_ldst),
    .io_iqIssues_1_bits_lrs1(regRead_io_iqIssues_1_bits_lrs1),
    .io_iqIssues_1_bits_lrs2(regRead_io_iqIssues_1_bits_lrs2),
    .io_iqIssues_1_bits_pdst(regRead_io_iqIssues_1_bits_pdst),
    .io_iqIssues_1_bits_prs1(regRead_io_iqIssues_1_bits_prs1),
    .io_iqIssues_1_bits_prs2(regRead_io_iqIssues_1_bits_prs2),
    .io_iqIssues_1_bits_oldPdst(regRead_io_iqIssues_1_bits_oldPdst),
    .io_iqIssues_1_bits_rs1Valid(regRead_io_iqIssues_1_bits_rs1Valid),
    .io_iqIssues_1_bits_rs2Valid(regRead_io_iqIssues_1_bits_rs2Valid),
    .io_iqIssues_1_bits_rdValid(regRead_io_iqIssues_1_bits_rdValid),
    .io_iqIssues_1_bits_robIdx(regRead_io_iqIssues_1_bits_robIdx),
    .io_iqIssues_1_bits_robIdxFull(regRead_io_iqIssues_1_bits_robIdxFull),
    .io_iqIssues_1_bits_issueQueue(regRead_io_iqIssues_1_bits_issueQueue),
    .io_iqIssues_1_bits_prs1Busy(regRead_io_iqIssues_1_bits_prs1Busy),
    .io_iqIssues_1_bits_prs2Busy(regRead_io_iqIssues_1_bits_prs2Busy),
    .io_iqIssues_2_ready(regRead_io_iqIssues_2_ready),
    .io_iqIssues_2_valid(regRead_io_iqIssues_2_valid),
    .io_iqIssues_2_bits_pc(regRead_io_iqIssues_2_bits_pc),
    .io_iqIssues_2_bits_inst(regRead_io_iqIssues_2_bits_inst),
    .io_iqIssues_2_bits_ctrl_fuType(regRead_io_iqIssues_2_bits_ctrl_fuType),
    .io_iqIssues_2_bits_ctrl_aluOp(regRead_io_iqIssues_2_bits_ctrl_aluOp),
    .io_iqIssues_2_bits_ctrl_bruOp(regRead_io_iqIssues_2_bits_ctrl_bruOp),
    .io_iqIssues_2_bits_ctrl_lsuOp(regRead_io_iqIssues_2_bits_ctrl_lsuOp),
    .io_iqIssues_2_bits_ctrl_csrOp(regRead_io_iqIssues_2_bits_ctrl_csrOp),
    .io_iqIssues_2_bits_ctrl_mulOp(regRead_io_iqIssues_2_bits_ctrl_mulOp),
    .io_iqIssues_2_bits_ctrl_divOp(regRead_io_iqIssues_2_bits_ctrl_divOp),
    .io_iqIssues_2_bits_ctrl_src1Type(regRead_io_iqIssues_2_bits_ctrl_src1Type),
    .io_iqIssues_2_bits_ctrl_src2Type(regRead_io_iqIssues_2_bits_ctrl_src2Type),
    .io_iqIssues_2_bits_ctrl_immType(regRead_io_iqIssues_2_bits_ctrl_immType),
    .io_iqIssues_2_bits_ctrl_rfWen(regRead_io_iqIssues_2_bits_ctrl_rfWen),
    .io_iqIssues_2_bits_ctrl_memRead(regRead_io_iqIssues_2_bits_ctrl_memRead),
    .io_iqIssues_2_bits_ctrl_memWrite(regRead_io_iqIssues_2_bits_ctrl_memWrite),
    .io_iqIssues_2_bits_ctrl_csrWen(regRead_io_iqIssues_2_bits_ctrl_csrWen),
    .io_iqIssues_2_bits_ctrl_isBranch(regRead_io_iqIssues_2_bits_ctrl_isBranch),
    .io_iqIssues_2_bits_ctrl_isJump(regRead_io_iqIssues_2_bits_ctrl_isJump),
    .io_iqIssues_2_bits_ctrl_isPriv(regRead_io_iqIssues_2_bits_ctrl_isPriv),
    .io_iqIssues_2_bits_excpVec(regRead_io_iqIssues_2_bits_excpVec),
    .io_iqIssues_2_bits_imm(regRead_io_iqIssues_2_bits_imm),
    .io_iqIssues_2_bits_csrAddress(regRead_io_iqIssues_2_bits_csrAddress),
    .io_iqIssues_2_bits_pdInfo_valid(regRead_io_iqIssues_2_bits_pdInfo_valid),
    .io_iqIssues_2_bits_pdInfo_isBr(regRead_io_iqIssues_2_bits_pdInfo_isBr),
    .io_iqIssues_2_bits_pdInfo_isJal(regRead_io_iqIssues_2_bits_pdInfo_isJal),
    .io_iqIssues_2_bits_pdInfo_isJalr(regRead_io_iqIssues_2_bits_pdInfo_isJalr),
    .io_iqIssues_2_bits_pdInfo_isCall(regRead_io_iqIssues_2_bits_pdInfo_isCall),
    .io_iqIssues_2_bits_pdInfo_isRet(regRead_io_iqIssues_2_bits_pdInfo_isRet),
    .io_iqIssues_2_bits_pdInfo_jumpTarget(regRead_io_iqIssues_2_bits_pdInfo_jumpTarget),
    .io_iqIssues_2_bits_ldst(regRead_io_iqIssues_2_bits_ldst),
    .io_iqIssues_2_bits_lrs1(regRead_io_iqIssues_2_bits_lrs1),
    .io_iqIssues_2_bits_lrs2(regRead_io_iqIssues_2_bits_lrs2),
    .io_iqIssues_2_bits_pdst(regRead_io_iqIssues_2_bits_pdst),
    .io_iqIssues_2_bits_prs1(regRead_io_iqIssues_2_bits_prs1),
    .io_iqIssues_2_bits_prs2(regRead_io_iqIssues_2_bits_prs2),
    .io_iqIssues_2_bits_oldPdst(regRead_io_iqIssues_2_bits_oldPdst),
    .io_iqIssues_2_bits_rs1Valid(regRead_io_iqIssues_2_bits_rs1Valid),
    .io_iqIssues_2_bits_rs2Valid(regRead_io_iqIssues_2_bits_rs2Valid),
    .io_iqIssues_2_bits_rdValid(regRead_io_iqIssues_2_bits_rdValid),
    .io_iqIssues_2_bits_robIdx(regRead_io_iqIssues_2_bits_robIdx),
    .io_iqIssues_2_bits_robIdxFull(regRead_io_iqIssues_2_bits_robIdxFull),
    .io_iqIssues_2_bits_lqIdx(regRead_io_iqIssues_2_bits_lqIdx),
    .io_iqIssues_2_bits_sqIdx(regRead_io_iqIssues_2_bits_sqIdx),
    .io_iqIssues_2_bits_issueQueue(regRead_io_iqIssues_2_bits_issueQueue),
    .io_iqIssues_2_bits_prs1Busy(regRead_io_iqIssues_2_bits_prs1Busy),
    .io_iqIssues_2_bits_prs2Busy(regRead_io_iqIssues_2_bits_prs2Busy),
    .io_iqIssues_2_bits_isSta(regRead_io_iqIssues_2_bits_isSta),
    .io_iqIssues_3_ready(regRead_io_iqIssues_3_ready),
    .io_iqIssues_3_valid(regRead_io_iqIssues_3_valid),
    .io_iqIssues_3_bits_pc(regRead_io_iqIssues_3_bits_pc),
    .io_iqIssues_3_bits_inst(regRead_io_iqIssues_3_bits_inst),
    .io_iqIssues_3_bits_ctrl_fuType(regRead_io_iqIssues_3_bits_ctrl_fuType),
    .io_iqIssues_3_bits_ctrl_aluOp(regRead_io_iqIssues_3_bits_ctrl_aluOp),
    .io_iqIssues_3_bits_ctrl_bruOp(regRead_io_iqIssues_3_bits_ctrl_bruOp),
    .io_iqIssues_3_bits_ctrl_lsuOp(regRead_io_iqIssues_3_bits_ctrl_lsuOp),
    .io_iqIssues_3_bits_ctrl_csrOp(regRead_io_iqIssues_3_bits_ctrl_csrOp),
    .io_iqIssues_3_bits_ctrl_mulOp(regRead_io_iqIssues_3_bits_ctrl_mulOp),
    .io_iqIssues_3_bits_ctrl_divOp(regRead_io_iqIssues_3_bits_ctrl_divOp),
    .io_iqIssues_3_bits_ctrl_src1Type(regRead_io_iqIssues_3_bits_ctrl_src1Type),
    .io_iqIssues_3_bits_ctrl_src2Type(regRead_io_iqIssues_3_bits_ctrl_src2Type),
    .io_iqIssues_3_bits_ctrl_immType(regRead_io_iqIssues_3_bits_ctrl_immType),
    .io_iqIssues_3_bits_ctrl_rfWen(regRead_io_iqIssues_3_bits_ctrl_rfWen),
    .io_iqIssues_3_bits_ctrl_memRead(regRead_io_iqIssues_3_bits_ctrl_memRead),
    .io_iqIssues_3_bits_ctrl_memWrite(regRead_io_iqIssues_3_bits_ctrl_memWrite),
    .io_iqIssues_3_bits_ctrl_csrWen(regRead_io_iqIssues_3_bits_ctrl_csrWen),
    .io_iqIssues_3_bits_ctrl_isBranch(regRead_io_iqIssues_3_bits_ctrl_isBranch),
    .io_iqIssues_3_bits_ctrl_isJump(regRead_io_iqIssues_3_bits_ctrl_isJump),
    .io_iqIssues_3_bits_ctrl_isPriv(regRead_io_iqIssues_3_bits_ctrl_isPriv),
    .io_iqIssues_3_bits_excpVec(regRead_io_iqIssues_3_bits_excpVec),
    .io_iqIssues_3_bits_imm(regRead_io_iqIssues_3_bits_imm),
    .io_iqIssues_3_bits_csrAddress(regRead_io_iqIssues_3_bits_csrAddress),
    .io_iqIssues_3_bits_pdInfo_valid(regRead_io_iqIssues_3_bits_pdInfo_valid),
    .io_iqIssues_3_bits_pdInfo_isBr(regRead_io_iqIssues_3_bits_pdInfo_isBr),
    .io_iqIssues_3_bits_pdInfo_isJal(regRead_io_iqIssues_3_bits_pdInfo_isJal),
    .io_iqIssues_3_bits_pdInfo_isJalr(regRead_io_iqIssues_3_bits_pdInfo_isJalr),
    .io_iqIssues_3_bits_pdInfo_isCall(regRead_io_iqIssues_3_bits_pdInfo_isCall),
    .io_iqIssues_3_bits_pdInfo_isRet(regRead_io_iqIssues_3_bits_pdInfo_isRet),
    .io_iqIssues_3_bits_pdInfo_jumpTarget(regRead_io_iqIssues_3_bits_pdInfo_jumpTarget),
    .io_iqIssues_3_bits_ldst(regRead_io_iqIssues_3_bits_ldst),
    .io_iqIssues_3_bits_lrs1(regRead_io_iqIssues_3_bits_lrs1),
    .io_iqIssues_3_bits_lrs2(regRead_io_iqIssues_3_bits_lrs2),
    .io_iqIssues_3_bits_pdst(regRead_io_iqIssues_3_bits_pdst),
    .io_iqIssues_3_bits_prs1(regRead_io_iqIssues_3_bits_prs1),
    .io_iqIssues_3_bits_prs2(regRead_io_iqIssues_3_bits_prs2),
    .io_iqIssues_3_bits_oldPdst(regRead_io_iqIssues_3_bits_oldPdst),
    .io_iqIssues_3_bits_rs1Valid(regRead_io_iqIssues_3_bits_rs1Valid),
    .io_iqIssues_3_bits_rs2Valid(regRead_io_iqIssues_3_bits_rs2Valid),
    .io_iqIssues_3_bits_rdValid(regRead_io_iqIssues_3_bits_rdValid),
    .io_iqIssues_3_bits_robIdx(regRead_io_iqIssues_3_bits_robIdx),
    .io_iqIssues_3_bits_robIdxFull(regRead_io_iqIssues_3_bits_robIdxFull),
    .io_iqIssues_3_bits_lqIdx(regRead_io_iqIssues_3_bits_lqIdx),
    .io_iqIssues_3_bits_sqIdx(regRead_io_iqIssues_3_bits_sqIdx),
    .io_iqIssues_3_bits_issueQueue(regRead_io_iqIssues_3_bits_issueQueue),
    .io_iqIssues_3_bits_prs1Busy(regRead_io_iqIssues_3_bits_prs1Busy),
    .io_iqIssues_3_bits_prs2Busy(regRead_io_iqIssues_3_bits_prs2Busy),
    .io_iqIssues_3_bits_isSta(regRead_io_iqIssues_3_bits_isSta),
    .io_iqIssues_4_ready(regRead_io_iqIssues_4_ready),
    .io_iqIssues_4_valid(regRead_io_iqIssues_4_valid),
    .io_iqIssues_4_bits_pc(regRead_io_iqIssues_4_bits_pc),
    .io_iqIssues_4_bits_inst(regRead_io_iqIssues_4_bits_inst),
    .io_iqIssues_4_bits_ctrl_fuType(regRead_io_iqIssues_4_bits_ctrl_fuType),
    .io_iqIssues_4_bits_ctrl_aluOp(regRead_io_iqIssues_4_bits_ctrl_aluOp),
    .io_iqIssues_4_bits_ctrl_bruOp(regRead_io_iqIssues_4_bits_ctrl_bruOp),
    .io_iqIssues_4_bits_ctrl_lsuOp(regRead_io_iqIssues_4_bits_ctrl_lsuOp),
    .io_iqIssues_4_bits_ctrl_csrOp(regRead_io_iqIssues_4_bits_ctrl_csrOp),
    .io_iqIssues_4_bits_ctrl_mulOp(regRead_io_iqIssues_4_bits_ctrl_mulOp),
    .io_iqIssues_4_bits_ctrl_divOp(regRead_io_iqIssues_4_bits_ctrl_divOp),
    .io_iqIssues_4_bits_ctrl_src1Type(regRead_io_iqIssues_4_bits_ctrl_src1Type),
    .io_iqIssues_4_bits_ctrl_src2Type(regRead_io_iqIssues_4_bits_ctrl_src2Type),
    .io_iqIssues_4_bits_ctrl_immType(regRead_io_iqIssues_4_bits_ctrl_immType),
    .io_iqIssues_4_bits_ctrl_rfWen(regRead_io_iqIssues_4_bits_ctrl_rfWen),
    .io_iqIssues_4_bits_ctrl_memRead(regRead_io_iqIssues_4_bits_ctrl_memRead),
    .io_iqIssues_4_bits_ctrl_memWrite(regRead_io_iqIssues_4_bits_ctrl_memWrite),
    .io_iqIssues_4_bits_ctrl_csrWen(regRead_io_iqIssues_4_bits_ctrl_csrWen),
    .io_iqIssues_4_bits_ctrl_isBranch(regRead_io_iqIssues_4_bits_ctrl_isBranch),
    .io_iqIssues_4_bits_ctrl_isJump(regRead_io_iqIssues_4_bits_ctrl_isJump),
    .io_iqIssues_4_bits_ctrl_isPriv(regRead_io_iqIssues_4_bits_ctrl_isPriv),
    .io_iqIssues_4_bits_excpVec(regRead_io_iqIssues_4_bits_excpVec),
    .io_iqIssues_4_bits_csrAddress(regRead_io_iqIssues_4_bits_csrAddress),
    .io_iqIssues_4_bits_pdInfo_valid(regRead_io_iqIssues_4_bits_pdInfo_valid),
    .io_iqIssues_4_bits_pdInfo_isBr(regRead_io_iqIssues_4_bits_pdInfo_isBr),
    .io_iqIssues_4_bits_pdInfo_isJal(regRead_io_iqIssues_4_bits_pdInfo_isJal),
    .io_iqIssues_4_bits_pdInfo_isJalr(regRead_io_iqIssues_4_bits_pdInfo_isJalr),
    .io_iqIssues_4_bits_pdInfo_isCall(regRead_io_iqIssues_4_bits_pdInfo_isCall),
    .io_iqIssues_4_bits_pdInfo_isRet(regRead_io_iqIssues_4_bits_pdInfo_isRet),
    .io_iqIssues_4_bits_pdInfo_jumpTarget(regRead_io_iqIssues_4_bits_pdInfo_jumpTarget),
    .io_iqIssues_4_bits_ldst(regRead_io_iqIssues_4_bits_ldst),
    .io_iqIssues_4_bits_lrs1(regRead_io_iqIssues_4_bits_lrs1),
    .io_iqIssues_4_bits_lrs2(regRead_io_iqIssues_4_bits_lrs2),
    .io_iqIssues_4_bits_prs1(regRead_io_iqIssues_4_bits_prs1),
    .io_iqIssues_4_bits_prs2(regRead_io_iqIssues_4_bits_prs2),
    .io_iqIssues_4_bits_oldPdst(regRead_io_iqIssues_4_bits_oldPdst),
    .io_iqIssues_4_bits_rs2Valid(regRead_io_iqIssues_4_bits_rs2Valid),
    .io_iqIssues_4_bits_robIdx(regRead_io_iqIssues_4_bits_robIdx),
    .io_iqIssues_4_bits_robIdxFull(regRead_io_iqIssues_4_bits_robIdxFull),
    .io_iqIssues_4_bits_sqIdx(regRead_io_iqIssues_4_bits_sqIdx),
    .io_iqIssues_4_bits_issueQueue(regRead_io_iqIssues_4_bits_issueQueue),
    .io_iqIssues_4_bits_prs2Busy(regRead_io_iqIssues_4_bits_prs2Busy),
    .io_iqIssues_4_bits_isStd(regRead_io_iqIssues_4_bits_isStd),
    .io_rfReadAddrs_0(regRead_io_rfReadAddrs_0),
    .io_rfReadAddrs_1(regRead_io_rfReadAddrs_1),
    .io_rfReadAddrs_2(regRead_io_rfReadAddrs_2),
    .io_rfReadAddrs_3(regRead_io_rfReadAddrs_3),
    .io_rfReadAddrs_4(regRead_io_rfReadAddrs_4),
    .io_rfReadAddrs_5(regRead_io_rfReadAddrs_5),
    .io_rfReadAddrs_6(regRead_io_rfReadAddrs_6),
    .io_rfReadAddrs_7(regRead_io_rfReadAddrs_7),
    .io_rfReadData_0(regRead_io_rfReadData_0),
    .io_rfReadData_1(regRead_io_rfReadData_1),
    .io_rfReadData_2(regRead_io_rfReadData_2),
    .io_rfReadData_3(regRead_io_rfReadData_3),
    .io_rfReadData_4(regRead_io_rfReadData_4),
    .io_rfReadData_5(regRead_io_rfReadData_5),
    .io_rfReadData_6(regRead_io_rfReadData_6),
    .io_rfReadData_7(regRead_io_rfReadData_7),
    .io_exeReqs_0_ready(regRead_io_exeReqs_0_ready),
    .io_exeReqs_0_valid(regRead_io_exeReqs_0_valid),
    .io_exeReqs_0_bits_uop_pc(regRead_io_exeReqs_0_bits_uop_pc),
    .io_exeReqs_0_bits_uop_inst(regRead_io_exeReqs_0_bits_uop_inst),
    .io_exeReqs_0_bits_uop_ctrl_fuType(regRead_io_exeReqs_0_bits_uop_ctrl_fuType),
    .io_exeReqs_0_bits_uop_ctrl_aluOp(regRead_io_exeReqs_0_bits_uop_ctrl_aluOp),
    .io_exeReqs_0_bits_uop_ctrl_bruOp(regRead_io_exeReqs_0_bits_uop_ctrl_bruOp),
    .io_exeReqs_0_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_0_bits_uop_ctrl_lsuOp),
    .io_exeReqs_0_bits_uop_ctrl_csrOp(regRead_io_exeReqs_0_bits_uop_ctrl_csrOp),
    .io_exeReqs_0_bits_uop_ctrl_mulOp(regRead_io_exeReqs_0_bits_uop_ctrl_mulOp),
    .io_exeReqs_0_bits_uop_ctrl_divOp(regRead_io_exeReqs_0_bits_uop_ctrl_divOp),
    .io_exeReqs_0_bits_uop_ctrl_src1Type(regRead_io_exeReqs_0_bits_uop_ctrl_src1Type),
    .io_exeReqs_0_bits_uop_ctrl_src2Type(regRead_io_exeReqs_0_bits_uop_ctrl_src2Type),
    .io_exeReqs_0_bits_uop_ctrl_immType(regRead_io_exeReqs_0_bits_uop_ctrl_immType),
    .io_exeReqs_0_bits_uop_ctrl_rfWen(regRead_io_exeReqs_0_bits_uop_ctrl_rfWen),
    .io_exeReqs_0_bits_uop_ctrl_memRead(regRead_io_exeReqs_0_bits_uop_ctrl_memRead),
    .io_exeReqs_0_bits_uop_ctrl_memWrite(regRead_io_exeReqs_0_bits_uop_ctrl_memWrite),
    .io_exeReqs_0_bits_uop_ctrl_csrWen(regRead_io_exeReqs_0_bits_uop_ctrl_csrWen),
    .io_exeReqs_0_bits_uop_ctrl_isBranch(regRead_io_exeReqs_0_bits_uop_ctrl_isBranch),
    .io_exeReqs_0_bits_uop_ctrl_isJump(regRead_io_exeReqs_0_bits_uop_ctrl_isJump),
    .io_exeReqs_0_bits_uop_ctrl_isPriv(regRead_io_exeReqs_0_bits_uop_ctrl_isPriv),
    .io_exeReqs_0_bits_uop_excpVec(regRead_io_exeReqs_0_bits_uop_excpVec),
    .io_exeReqs_0_bits_uop_imm(regRead_io_exeReqs_0_bits_uop_imm),
    .io_exeReqs_0_bits_uop_csrAddress(regRead_io_exeReqs_0_bits_uop_csrAddress),
    .io_exeReqs_0_bits_uop_pdInfo_valid(regRead_io_exeReqs_0_bits_uop_pdInfo_valid),
    .io_exeReqs_0_bits_uop_pdInfo_isBr(regRead_io_exeReqs_0_bits_uop_pdInfo_isBr),
    .io_exeReqs_0_bits_uop_pdInfo_isJal(regRead_io_exeReqs_0_bits_uop_pdInfo_isJal),
    .io_exeReqs_0_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_0_bits_uop_pdInfo_isJalr),
    .io_exeReqs_0_bits_uop_pdInfo_isCall(regRead_io_exeReqs_0_bits_uop_pdInfo_isCall),
    .io_exeReqs_0_bits_uop_pdInfo_isRet(regRead_io_exeReqs_0_bits_uop_pdInfo_isRet),
    .io_exeReqs_0_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_0_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_0_bits_uop_ldst(regRead_io_exeReqs_0_bits_uop_ldst),
    .io_exeReqs_0_bits_uop_lrs1(regRead_io_exeReqs_0_bits_uop_lrs1),
    .io_exeReqs_0_bits_uop_lrs2(regRead_io_exeReqs_0_bits_uop_lrs2),
    .io_exeReqs_0_bits_uop_pdst(regRead_io_exeReqs_0_bits_uop_pdst),
    .io_exeReqs_0_bits_uop_prs1(regRead_io_exeReqs_0_bits_uop_prs1),
    .io_exeReqs_0_bits_uop_prs2(regRead_io_exeReqs_0_bits_uop_prs2),
    .io_exeReqs_0_bits_uop_oldPdst(regRead_io_exeReqs_0_bits_uop_oldPdst),
    .io_exeReqs_0_bits_uop_rs1Valid(regRead_io_exeReqs_0_bits_uop_rs1Valid),
    .io_exeReqs_0_bits_uop_rs2Valid(regRead_io_exeReqs_0_bits_uop_rs2Valid),
    .io_exeReqs_0_bits_uop_rdValid(regRead_io_exeReqs_0_bits_uop_rdValid),
    .io_exeReqs_0_bits_uop_robIdx(regRead_io_exeReqs_0_bits_uop_robIdx),
    .io_exeReqs_0_bits_uop_robIdxFull(regRead_io_exeReqs_0_bits_uop_robIdxFull),
    .io_exeReqs_0_bits_uop_lqIdx(regRead_io_exeReqs_0_bits_uop_lqIdx),
    .io_exeReqs_0_bits_uop_sqIdx(regRead_io_exeReqs_0_bits_uop_sqIdx),
    .io_exeReqs_0_bits_uop_issueQueue(regRead_io_exeReqs_0_bits_uop_issueQueue),
    .io_exeReqs_0_bits_uop_prs1Busy(regRead_io_exeReqs_0_bits_uop_prs1Busy),
    .io_exeReqs_0_bits_uop_prs2Busy(regRead_io_exeReqs_0_bits_uop_prs2Busy),
    .io_exeReqs_0_bits_uop_isSta(regRead_io_exeReqs_0_bits_uop_isSta),
    .io_exeReqs_0_bits_uop_isStd(regRead_io_exeReqs_0_bits_uop_isStd),
    .io_exeReqs_0_bits_rs1Data(regRead_io_exeReqs_0_bits_rs1Data),
    .io_exeReqs_0_bits_rs2Data(regRead_io_exeReqs_0_bits_rs2Data),
    .io_exeReqs_1_ready(regRead_io_exeReqs_1_ready),
    .io_exeReqs_1_valid(regRead_io_exeReqs_1_valid),
    .io_exeReqs_1_bits_uop_pc(regRead_io_exeReqs_1_bits_uop_pc),
    .io_exeReqs_1_bits_uop_inst(regRead_io_exeReqs_1_bits_uop_inst),
    .io_exeReqs_1_bits_uop_ctrl_fuType(regRead_io_exeReqs_1_bits_uop_ctrl_fuType),
    .io_exeReqs_1_bits_uop_ctrl_aluOp(regRead_io_exeReqs_1_bits_uop_ctrl_aluOp),
    .io_exeReqs_1_bits_uop_ctrl_bruOp(regRead_io_exeReqs_1_bits_uop_ctrl_bruOp),
    .io_exeReqs_1_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_1_bits_uop_ctrl_lsuOp),
    .io_exeReqs_1_bits_uop_ctrl_csrOp(regRead_io_exeReqs_1_bits_uop_ctrl_csrOp),
    .io_exeReqs_1_bits_uop_ctrl_mulOp(regRead_io_exeReqs_1_bits_uop_ctrl_mulOp),
    .io_exeReqs_1_bits_uop_ctrl_divOp(regRead_io_exeReqs_1_bits_uop_ctrl_divOp),
    .io_exeReqs_1_bits_uop_ctrl_src1Type(regRead_io_exeReqs_1_bits_uop_ctrl_src1Type),
    .io_exeReqs_1_bits_uop_ctrl_src2Type(regRead_io_exeReqs_1_bits_uop_ctrl_src2Type),
    .io_exeReqs_1_bits_uop_ctrl_immType(regRead_io_exeReqs_1_bits_uop_ctrl_immType),
    .io_exeReqs_1_bits_uop_ctrl_rfWen(regRead_io_exeReqs_1_bits_uop_ctrl_rfWen),
    .io_exeReqs_1_bits_uop_ctrl_memRead(regRead_io_exeReqs_1_bits_uop_ctrl_memRead),
    .io_exeReqs_1_bits_uop_ctrl_memWrite(regRead_io_exeReqs_1_bits_uop_ctrl_memWrite),
    .io_exeReqs_1_bits_uop_ctrl_csrWen(regRead_io_exeReqs_1_bits_uop_ctrl_csrWen),
    .io_exeReqs_1_bits_uop_ctrl_isBranch(regRead_io_exeReqs_1_bits_uop_ctrl_isBranch),
    .io_exeReqs_1_bits_uop_ctrl_isJump(regRead_io_exeReqs_1_bits_uop_ctrl_isJump),
    .io_exeReqs_1_bits_uop_ctrl_isPriv(regRead_io_exeReqs_1_bits_uop_ctrl_isPriv),
    .io_exeReqs_1_bits_uop_excpVec(regRead_io_exeReqs_1_bits_uop_excpVec),
    .io_exeReqs_1_bits_uop_imm(regRead_io_exeReqs_1_bits_uop_imm),
    .io_exeReqs_1_bits_uop_csrAddress(regRead_io_exeReqs_1_bits_uop_csrAddress),
    .io_exeReqs_1_bits_uop_pdInfo_valid(regRead_io_exeReqs_1_bits_uop_pdInfo_valid),
    .io_exeReqs_1_bits_uop_pdInfo_isBr(regRead_io_exeReqs_1_bits_uop_pdInfo_isBr),
    .io_exeReqs_1_bits_uop_pdInfo_isJal(regRead_io_exeReqs_1_bits_uop_pdInfo_isJal),
    .io_exeReqs_1_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_1_bits_uop_pdInfo_isJalr),
    .io_exeReqs_1_bits_uop_pdInfo_isCall(regRead_io_exeReqs_1_bits_uop_pdInfo_isCall),
    .io_exeReqs_1_bits_uop_pdInfo_isRet(regRead_io_exeReqs_1_bits_uop_pdInfo_isRet),
    .io_exeReqs_1_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_1_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_1_bits_uop_ldst(regRead_io_exeReqs_1_bits_uop_ldst),
    .io_exeReqs_1_bits_uop_lrs1(regRead_io_exeReqs_1_bits_uop_lrs1),
    .io_exeReqs_1_bits_uop_lrs2(regRead_io_exeReqs_1_bits_uop_lrs2),
    .io_exeReqs_1_bits_uop_pdst(regRead_io_exeReqs_1_bits_uop_pdst),
    .io_exeReqs_1_bits_uop_prs1(regRead_io_exeReqs_1_bits_uop_prs1),
    .io_exeReqs_1_bits_uop_prs2(regRead_io_exeReqs_1_bits_uop_prs2),
    .io_exeReqs_1_bits_uop_oldPdst(regRead_io_exeReqs_1_bits_uop_oldPdst),
    .io_exeReqs_1_bits_uop_rs1Valid(regRead_io_exeReqs_1_bits_uop_rs1Valid),
    .io_exeReqs_1_bits_uop_rs2Valid(regRead_io_exeReqs_1_bits_uop_rs2Valid),
    .io_exeReqs_1_bits_uop_rdValid(regRead_io_exeReqs_1_bits_uop_rdValid),
    .io_exeReqs_1_bits_uop_robIdx(regRead_io_exeReqs_1_bits_uop_robIdx),
    .io_exeReqs_1_bits_uop_robIdxFull(regRead_io_exeReqs_1_bits_uop_robIdxFull),
    .io_exeReqs_1_bits_uop_lqIdx(regRead_io_exeReqs_1_bits_uop_lqIdx),
    .io_exeReqs_1_bits_uop_sqIdx(regRead_io_exeReqs_1_bits_uop_sqIdx),
    .io_exeReqs_1_bits_uop_issueQueue(regRead_io_exeReqs_1_bits_uop_issueQueue),
    .io_exeReqs_1_bits_uop_prs1Busy(regRead_io_exeReqs_1_bits_uop_prs1Busy),
    .io_exeReqs_1_bits_uop_prs2Busy(regRead_io_exeReqs_1_bits_uop_prs2Busy),
    .io_exeReqs_1_bits_uop_isSta(regRead_io_exeReqs_1_bits_uop_isSta),
    .io_exeReqs_1_bits_uop_isStd(regRead_io_exeReqs_1_bits_uop_isStd),
    .io_exeReqs_1_bits_rs1Data(regRead_io_exeReqs_1_bits_rs1Data),
    .io_exeReqs_1_bits_rs2Data(regRead_io_exeReqs_1_bits_rs2Data),
    .io_exeReqs_2_ready(regRead_io_exeReqs_2_ready),
    .io_exeReqs_2_valid(regRead_io_exeReqs_2_valid),
    .io_exeReqs_2_bits_uop_pc(regRead_io_exeReqs_2_bits_uop_pc),
    .io_exeReqs_2_bits_uop_inst(regRead_io_exeReqs_2_bits_uop_inst),
    .io_exeReqs_2_bits_uop_ctrl_fuType(regRead_io_exeReqs_2_bits_uop_ctrl_fuType),
    .io_exeReqs_2_bits_uop_ctrl_aluOp(regRead_io_exeReqs_2_bits_uop_ctrl_aluOp),
    .io_exeReqs_2_bits_uop_ctrl_bruOp(regRead_io_exeReqs_2_bits_uop_ctrl_bruOp),
    .io_exeReqs_2_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_2_bits_uop_ctrl_lsuOp),
    .io_exeReqs_2_bits_uop_ctrl_csrOp(regRead_io_exeReqs_2_bits_uop_ctrl_csrOp),
    .io_exeReqs_2_bits_uop_ctrl_mulOp(regRead_io_exeReqs_2_bits_uop_ctrl_mulOp),
    .io_exeReqs_2_bits_uop_ctrl_divOp(regRead_io_exeReqs_2_bits_uop_ctrl_divOp),
    .io_exeReqs_2_bits_uop_ctrl_src1Type(regRead_io_exeReqs_2_bits_uop_ctrl_src1Type),
    .io_exeReqs_2_bits_uop_ctrl_src2Type(regRead_io_exeReqs_2_bits_uop_ctrl_src2Type),
    .io_exeReqs_2_bits_uop_ctrl_immType(regRead_io_exeReqs_2_bits_uop_ctrl_immType),
    .io_exeReqs_2_bits_uop_ctrl_rfWen(regRead_io_exeReqs_2_bits_uop_ctrl_rfWen),
    .io_exeReqs_2_bits_uop_ctrl_memRead(regRead_io_exeReqs_2_bits_uop_ctrl_memRead),
    .io_exeReqs_2_bits_uop_ctrl_memWrite(regRead_io_exeReqs_2_bits_uop_ctrl_memWrite),
    .io_exeReqs_2_bits_uop_ctrl_csrWen(regRead_io_exeReqs_2_bits_uop_ctrl_csrWen),
    .io_exeReqs_2_bits_uop_ctrl_isBranch(regRead_io_exeReqs_2_bits_uop_ctrl_isBranch),
    .io_exeReqs_2_bits_uop_ctrl_isJump(regRead_io_exeReqs_2_bits_uop_ctrl_isJump),
    .io_exeReqs_2_bits_uop_ctrl_isPriv(regRead_io_exeReqs_2_bits_uop_ctrl_isPriv),
    .io_exeReqs_2_bits_uop_excpVec(regRead_io_exeReqs_2_bits_uop_excpVec),
    .io_exeReqs_2_bits_uop_imm(regRead_io_exeReqs_2_bits_uop_imm),
    .io_exeReqs_2_bits_uop_csrAddress(regRead_io_exeReqs_2_bits_uop_csrAddress),
    .io_exeReqs_2_bits_uop_pdInfo_valid(regRead_io_exeReqs_2_bits_uop_pdInfo_valid),
    .io_exeReqs_2_bits_uop_pdInfo_isBr(regRead_io_exeReqs_2_bits_uop_pdInfo_isBr),
    .io_exeReqs_2_bits_uop_pdInfo_isJal(regRead_io_exeReqs_2_bits_uop_pdInfo_isJal),
    .io_exeReqs_2_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_2_bits_uop_pdInfo_isJalr),
    .io_exeReqs_2_bits_uop_pdInfo_isCall(regRead_io_exeReqs_2_bits_uop_pdInfo_isCall),
    .io_exeReqs_2_bits_uop_pdInfo_isRet(regRead_io_exeReqs_2_bits_uop_pdInfo_isRet),
    .io_exeReqs_2_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_2_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_2_bits_uop_ldst(regRead_io_exeReqs_2_bits_uop_ldst),
    .io_exeReqs_2_bits_uop_lrs1(regRead_io_exeReqs_2_bits_uop_lrs1),
    .io_exeReqs_2_bits_uop_lrs2(regRead_io_exeReqs_2_bits_uop_lrs2),
    .io_exeReqs_2_bits_uop_pdst(regRead_io_exeReqs_2_bits_uop_pdst),
    .io_exeReqs_2_bits_uop_prs1(regRead_io_exeReqs_2_bits_uop_prs1),
    .io_exeReqs_2_bits_uop_prs2(regRead_io_exeReqs_2_bits_uop_prs2),
    .io_exeReqs_2_bits_uop_oldPdst(regRead_io_exeReqs_2_bits_uop_oldPdst),
    .io_exeReqs_2_bits_uop_rs1Valid(regRead_io_exeReqs_2_bits_uop_rs1Valid),
    .io_exeReqs_2_bits_uop_rs2Valid(regRead_io_exeReqs_2_bits_uop_rs2Valid),
    .io_exeReqs_2_bits_uop_rdValid(regRead_io_exeReqs_2_bits_uop_rdValid),
    .io_exeReqs_2_bits_uop_robIdx(regRead_io_exeReqs_2_bits_uop_robIdx),
    .io_exeReqs_2_bits_uop_robIdxFull(regRead_io_exeReqs_2_bits_uop_robIdxFull),
    .io_exeReqs_2_bits_uop_lqIdx(regRead_io_exeReqs_2_bits_uop_lqIdx),
    .io_exeReqs_2_bits_uop_sqIdx(regRead_io_exeReqs_2_bits_uop_sqIdx),
    .io_exeReqs_2_bits_uop_issueQueue(regRead_io_exeReqs_2_bits_uop_issueQueue),
    .io_exeReqs_2_bits_uop_prs1Busy(regRead_io_exeReqs_2_bits_uop_prs1Busy),
    .io_exeReqs_2_bits_uop_prs2Busy(regRead_io_exeReqs_2_bits_uop_prs2Busy),
    .io_exeReqs_2_bits_uop_isSta(regRead_io_exeReqs_2_bits_uop_isSta),
    .io_exeReqs_2_bits_uop_isStd(regRead_io_exeReqs_2_bits_uop_isStd),
    .io_exeReqs_2_bits_rs1Data(regRead_io_exeReqs_2_bits_rs1Data),
    .io_exeReqs_2_bits_rs2Data(regRead_io_exeReqs_2_bits_rs2Data),
    .io_exeReqs_3_ready(regRead_io_exeReqs_3_ready),
    .io_exeReqs_3_valid(regRead_io_exeReqs_3_valid),
    .io_exeReqs_3_bits_uop_pc(regRead_io_exeReqs_3_bits_uop_pc),
    .io_exeReqs_3_bits_uop_inst(regRead_io_exeReqs_3_bits_uop_inst),
    .io_exeReqs_3_bits_uop_ctrl_fuType(regRead_io_exeReqs_3_bits_uop_ctrl_fuType),
    .io_exeReqs_3_bits_uop_ctrl_aluOp(regRead_io_exeReqs_3_bits_uop_ctrl_aluOp),
    .io_exeReqs_3_bits_uop_ctrl_bruOp(regRead_io_exeReqs_3_bits_uop_ctrl_bruOp),
    .io_exeReqs_3_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_3_bits_uop_ctrl_lsuOp),
    .io_exeReqs_3_bits_uop_ctrl_csrOp(regRead_io_exeReqs_3_bits_uop_ctrl_csrOp),
    .io_exeReqs_3_bits_uop_ctrl_mulOp(regRead_io_exeReqs_3_bits_uop_ctrl_mulOp),
    .io_exeReqs_3_bits_uop_ctrl_divOp(regRead_io_exeReqs_3_bits_uop_ctrl_divOp),
    .io_exeReqs_3_bits_uop_ctrl_src1Type(regRead_io_exeReqs_3_bits_uop_ctrl_src1Type),
    .io_exeReqs_3_bits_uop_ctrl_src2Type(regRead_io_exeReqs_3_bits_uop_ctrl_src2Type),
    .io_exeReqs_3_bits_uop_ctrl_immType(regRead_io_exeReqs_3_bits_uop_ctrl_immType),
    .io_exeReqs_3_bits_uop_ctrl_rfWen(regRead_io_exeReqs_3_bits_uop_ctrl_rfWen),
    .io_exeReqs_3_bits_uop_ctrl_memRead(regRead_io_exeReqs_3_bits_uop_ctrl_memRead),
    .io_exeReqs_3_bits_uop_ctrl_memWrite(regRead_io_exeReqs_3_bits_uop_ctrl_memWrite),
    .io_exeReqs_3_bits_uop_ctrl_csrWen(regRead_io_exeReqs_3_bits_uop_ctrl_csrWen),
    .io_exeReqs_3_bits_uop_ctrl_isBranch(regRead_io_exeReqs_3_bits_uop_ctrl_isBranch),
    .io_exeReqs_3_bits_uop_ctrl_isJump(regRead_io_exeReqs_3_bits_uop_ctrl_isJump),
    .io_exeReqs_3_bits_uop_ctrl_isPriv(regRead_io_exeReqs_3_bits_uop_ctrl_isPriv),
    .io_exeReqs_3_bits_uop_excpVec(regRead_io_exeReqs_3_bits_uop_excpVec),
    .io_exeReqs_3_bits_uop_imm(regRead_io_exeReqs_3_bits_uop_imm),
    .io_exeReqs_3_bits_uop_csrAddress(regRead_io_exeReqs_3_bits_uop_csrAddress),
    .io_exeReqs_3_bits_uop_pdInfo_valid(regRead_io_exeReqs_3_bits_uop_pdInfo_valid),
    .io_exeReqs_3_bits_uop_pdInfo_isBr(regRead_io_exeReqs_3_bits_uop_pdInfo_isBr),
    .io_exeReqs_3_bits_uop_pdInfo_isJal(regRead_io_exeReqs_3_bits_uop_pdInfo_isJal),
    .io_exeReqs_3_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_3_bits_uop_pdInfo_isJalr),
    .io_exeReqs_3_bits_uop_pdInfo_isCall(regRead_io_exeReqs_3_bits_uop_pdInfo_isCall),
    .io_exeReqs_3_bits_uop_pdInfo_isRet(regRead_io_exeReqs_3_bits_uop_pdInfo_isRet),
    .io_exeReqs_3_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_3_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_3_bits_uop_ldst(regRead_io_exeReqs_3_bits_uop_ldst),
    .io_exeReqs_3_bits_uop_lrs1(regRead_io_exeReqs_3_bits_uop_lrs1),
    .io_exeReqs_3_bits_uop_lrs2(regRead_io_exeReqs_3_bits_uop_lrs2),
    .io_exeReqs_3_bits_uop_pdst(regRead_io_exeReqs_3_bits_uop_pdst),
    .io_exeReqs_3_bits_uop_prs1(regRead_io_exeReqs_3_bits_uop_prs1),
    .io_exeReqs_3_bits_uop_prs2(regRead_io_exeReqs_3_bits_uop_prs2),
    .io_exeReqs_3_bits_uop_oldPdst(regRead_io_exeReqs_3_bits_uop_oldPdst),
    .io_exeReqs_3_bits_uop_rs1Valid(regRead_io_exeReqs_3_bits_uop_rs1Valid),
    .io_exeReqs_3_bits_uop_rs2Valid(regRead_io_exeReqs_3_bits_uop_rs2Valid),
    .io_exeReqs_3_bits_uop_rdValid(regRead_io_exeReqs_3_bits_uop_rdValid),
    .io_exeReqs_3_bits_uop_robIdx(regRead_io_exeReqs_3_bits_uop_robIdx),
    .io_exeReqs_3_bits_uop_robIdxFull(regRead_io_exeReqs_3_bits_uop_robIdxFull),
    .io_exeReqs_3_bits_uop_lqIdx(regRead_io_exeReqs_3_bits_uop_lqIdx),
    .io_exeReqs_3_bits_uop_sqIdx(regRead_io_exeReqs_3_bits_uop_sqIdx),
    .io_exeReqs_3_bits_uop_issueQueue(regRead_io_exeReqs_3_bits_uop_issueQueue),
    .io_exeReqs_3_bits_uop_prs1Busy(regRead_io_exeReqs_3_bits_uop_prs1Busy),
    .io_exeReqs_3_bits_uop_prs2Busy(regRead_io_exeReqs_3_bits_uop_prs2Busy),
    .io_exeReqs_3_bits_uop_isSta(regRead_io_exeReqs_3_bits_uop_isSta),
    .io_exeReqs_3_bits_uop_isStd(regRead_io_exeReqs_3_bits_uop_isStd),
    .io_exeReqs_3_bits_rs1Data(regRead_io_exeReqs_3_bits_rs1Data),
    .io_exeReqs_3_bits_rs2Data(regRead_io_exeReqs_3_bits_rs2Data),
    .io_exeReqs_4_ready(regRead_io_exeReqs_4_ready),
    .io_exeReqs_4_valid(regRead_io_exeReqs_4_valid),
    .io_exeReqs_4_bits_uop_pc(regRead_io_exeReqs_4_bits_uop_pc),
    .io_exeReqs_4_bits_uop_inst(regRead_io_exeReqs_4_bits_uop_inst),
    .io_exeReqs_4_bits_uop_ctrl_fuType(regRead_io_exeReqs_4_bits_uop_ctrl_fuType),
    .io_exeReqs_4_bits_uop_ctrl_aluOp(regRead_io_exeReqs_4_bits_uop_ctrl_aluOp),
    .io_exeReqs_4_bits_uop_ctrl_bruOp(regRead_io_exeReqs_4_bits_uop_ctrl_bruOp),
    .io_exeReqs_4_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_4_bits_uop_ctrl_lsuOp),
    .io_exeReqs_4_bits_uop_ctrl_csrOp(regRead_io_exeReqs_4_bits_uop_ctrl_csrOp),
    .io_exeReqs_4_bits_uop_ctrl_mulOp(regRead_io_exeReqs_4_bits_uop_ctrl_mulOp),
    .io_exeReqs_4_bits_uop_ctrl_divOp(regRead_io_exeReqs_4_bits_uop_ctrl_divOp),
    .io_exeReqs_4_bits_uop_ctrl_src1Type(regRead_io_exeReqs_4_bits_uop_ctrl_src1Type),
    .io_exeReqs_4_bits_uop_ctrl_src2Type(regRead_io_exeReqs_4_bits_uop_ctrl_src2Type),
    .io_exeReqs_4_bits_uop_ctrl_immType(regRead_io_exeReqs_4_bits_uop_ctrl_immType),
    .io_exeReqs_4_bits_uop_ctrl_rfWen(regRead_io_exeReqs_4_bits_uop_ctrl_rfWen),
    .io_exeReqs_4_bits_uop_ctrl_memRead(regRead_io_exeReqs_4_bits_uop_ctrl_memRead),
    .io_exeReqs_4_bits_uop_ctrl_memWrite(regRead_io_exeReqs_4_bits_uop_ctrl_memWrite),
    .io_exeReqs_4_bits_uop_ctrl_csrWen(regRead_io_exeReqs_4_bits_uop_ctrl_csrWen),
    .io_exeReqs_4_bits_uop_ctrl_isBranch(regRead_io_exeReqs_4_bits_uop_ctrl_isBranch),
    .io_exeReqs_4_bits_uop_ctrl_isJump(regRead_io_exeReqs_4_bits_uop_ctrl_isJump),
    .io_exeReqs_4_bits_uop_ctrl_isPriv(regRead_io_exeReqs_4_bits_uop_ctrl_isPriv),
    .io_exeReqs_4_bits_uop_excpVec(regRead_io_exeReqs_4_bits_uop_excpVec),
    .io_exeReqs_4_bits_uop_imm(regRead_io_exeReqs_4_bits_uop_imm),
    .io_exeReqs_4_bits_uop_csrAddress(regRead_io_exeReqs_4_bits_uop_csrAddress),
    .io_exeReqs_4_bits_uop_pdInfo_valid(regRead_io_exeReqs_4_bits_uop_pdInfo_valid),
    .io_exeReqs_4_bits_uop_pdInfo_isBr(regRead_io_exeReqs_4_bits_uop_pdInfo_isBr),
    .io_exeReqs_4_bits_uop_pdInfo_isJal(regRead_io_exeReqs_4_bits_uop_pdInfo_isJal),
    .io_exeReqs_4_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_4_bits_uop_pdInfo_isJalr),
    .io_exeReqs_4_bits_uop_pdInfo_isCall(regRead_io_exeReqs_4_bits_uop_pdInfo_isCall),
    .io_exeReqs_4_bits_uop_pdInfo_isRet(regRead_io_exeReqs_4_bits_uop_pdInfo_isRet),
    .io_exeReqs_4_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_4_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_4_bits_uop_ldst(regRead_io_exeReqs_4_bits_uop_ldst),
    .io_exeReqs_4_bits_uop_lrs1(regRead_io_exeReqs_4_bits_uop_lrs1),
    .io_exeReqs_4_bits_uop_lrs2(regRead_io_exeReqs_4_bits_uop_lrs2),
    .io_exeReqs_4_bits_uop_pdst(regRead_io_exeReqs_4_bits_uop_pdst),
    .io_exeReqs_4_bits_uop_prs1(regRead_io_exeReqs_4_bits_uop_prs1),
    .io_exeReqs_4_bits_uop_prs2(regRead_io_exeReqs_4_bits_uop_prs2),
    .io_exeReqs_4_bits_uop_oldPdst(regRead_io_exeReqs_4_bits_uop_oldPdst),
    .io_exeReqs_4_bits_uop_rs1Valid(regRead_io_exeReqs_4_bits_uop_rs1Valid),
    .io_exeReqs_4_bits_uop_rs2Valid(regRead_io_exeReqs_4_bits_uop_rs2Valid),
    .io_exeReqs_4_bits_uop_rdValid(regRead_io_exeReqs_4_bits_uop_rdValid),
    .io_exeReqs_4_bits_uop_robIdx(regRead_io_exeReqs_4_bits_uop_robIdx),
    .io_exeReqs_4_bits_uop_robIdxFull(regRead_io_exeReqs_4_bits_uop_robIdxFull),
    .io_exeReqs_4_bits_uop_lqIdx(regRead_io_exeReqs_4_bits_uop_lqIdx),
    .io_exeReqs_4_bits_uop_sqIdx(regRead_io_exeReqs_4_bits_uop_sqIdx),
    .io_exeReqs_4_bits_uop_issueQueue(regRead_io_exeReqs_4_bits_uop_issueQueue),
    .io_exeReqs_4_bits_uop_prs1Busy(regRead_io_exeReqs_4_bits_uop_prs1Busy),
    .io_exeReqs_4_bits_uop_prs2Busy(regRead_io_exeReqs_4_bits_uop_prs2Busy),
    .io_exeReqs_4_bits_uop_isSta(regRead_io_exeReqs_4_bits_uop_isSta),
    .io_exeReqs_4_bits_uop_isStd(regRead_io_exeReqs_4_bits_uop_isStd),
    .io_exeReqs_4_bits_rs1Data(regRead_io_exeReqs_4_bits_rs1Data),
    .io_exeReqs_4_bits_rs2Data(regRead_io_exeReqs_4_bits_rs2Data),
    .io_redirect_valid(regRead_io_redirect_valid),
    .io_redirect_robIdx(regRead_io_redirect_robIdx)
  );
  RegFile regFile ( // @[src/main/scala/backend/Backend.scala 27:27]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_readPorts_0_addr(regFile_io_readPorts_0_addr),
    .io_readPorts_0_data(regFile_io_readPorts_0_data),
    .io_readPorts_1_addr(regFile_io_readPorts_1_addr),
    .io_readPorts_1_data(regFile_io_readPorts_1_data),
    .io_readPorts_2_addr(regFile_io_readPorts_2_addr),
    .io_readPorts_2_data(regFile_io_readPorts_2_data),
    .io_readPorts_3_addr(regFile_io_readPorts_3_addr),
    .io_readPorts_3_data(regFile_io_readPorts_3_data),
    .io_readPorts_4_addr(regFile_io_readPorts_4_addr),
    .io_readPorts_4_data(regFile_io_readPorts_4_data),
    .io_readPorts_5_addr(regFile_io_readPorts_5_addr),
    .io_readPorts_5_data(regFile_io_readPorts_5_data),
    .io_readPorts_6_addr(regFile_io_readPorts_6_addr),
    .io_readPorts_6_data(regFile_io_readPorts_6_data),
    .io_readPorts_7_addr(regFile_io_readPorts_7_addr),
    .io_readPorts_7_data(regFile_io_readPorts_7_data)
  );
  assign io_in_0_ready = ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 32:23]
  assign io_in_1_ready = ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 32:23]
  assign io_in_2_ready = ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 32:23]
  assign io_redirect_valid = 1'h0; // @[src/main/scala/backend/Backend.scala 39:15]
  assign io_redirect_robIdx = 6'h0; // @[src/main/scala/backend/Backend.scala 39:15]
  assign ctrlBlock_clock = clock;
  assign ctrlBlock_reset = reset;
  assign ctrlBlock_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 32:23]
  assign ctrlBlock_io_iqFeedback_q1FreeEntries = scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 53:27]
  assign ctrlBlock_io_iqFeedback_q2FreeEntries = scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 53:27]
  assign ctrlBlock_io_iqFeedback_q3FreeEntries = scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 53:27]
  assign ctrlBlock_io_iqFeedback_q4FreeEntries = scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 53:27]
  assign ctrlBlock_io_iqFeedback_q5FreeEntries = scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 53:27]
  assign ctrlBlock_io_extInt = io_extInt; // @[src/main/scala/backend/Backend.scala 34:23]
  assign scheduler_clock = clock;
  assign scheduler_reset = reset;
  assign scheduler_io_q1IQEnq_valid = ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pc = ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_inst = ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_fuType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_divOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_immType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memRead = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isJump = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_excpVec = ctrlBlock_io_q1IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_imm = ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_csrAddress = ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_valid = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_ldst = ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_lrs1 = ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_lrs2 = ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_pdst = ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_prs1 = ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_prs2 = ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_oldPdst = ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_rs1Valid = ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_rs2Valid = ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_rdValid = ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_robIdx = ctrlBlock_io_q1IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_robIdxFull = ctrlBlock_io_q1IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_prs1Busy = ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q1IQEnq_bits_prs2Busy = ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 44:24]
  assign scheduler_io_q2IQEnq_valid = ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pc = ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_inst = ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_fuType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_divOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_immType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memRead = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isJump = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_excpVec = ctrlBlock_io_q2IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_imm = ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_csrAddress = ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_valid = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_ldst = ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_lrs1 = ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_lrs2 = ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_pdst = ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_prs1 = ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_prs2 = ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_oldPdst = ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_rs1Valid = ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_rs2Valid = ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_rdValid = ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_robIdx = ctrlBlock_io_q2IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_robIdxFull = ctrlBlock_io_q2IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_issueQueue = ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_prs1Busy = ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q2IQEnq_bits_prs2Busy = ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 45:24]
  assign scheduler_io_q3IQEnq_valid = ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pc = ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_inst = ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_fuType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_divOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_immType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memRead = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isJump = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_excpVec = ctrlBlock_io_q3IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_imm = ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_csrAddress = ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_valid = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_ldst = ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_lrs1 = ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_lrs2 = ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_pdst = ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_prs1 = ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_prs2 = ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_oldPdst = ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_rs1Valid = ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_rs2Valid = ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_rdValid = ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_robIdx = ctrlBlock_io_q3IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_robIdxFull = ctrlBlock_io_q3IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_issueQueue = ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_prs1Busy = ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q3IQEnq_bits_prs2Busy = ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 46:24]
  assign scheduler_io_q4IQEnq_valid = ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pc = ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_inst = ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_fuType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_divOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_immType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memRead = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isJump = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_excpVec = ctrlBlock_io_q4IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_imm = ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_csrAddress = ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_valid = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_ldst = ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_lrs1 = ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_lrs2 = ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_pdst = ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_prs1 = ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_prs2 = ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_oldPdst = ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_rs1Valid = ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_rs2Valid = ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_rdValid = ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_robIdx = ctrlBlock_io_q4IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_robIdxFull = ctrlBlock_io_q4IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_lqIdx = ctrlBlock_io_q4IQEnq_0_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_sqIdx = ctrlBlock_io_q4IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_issueQueue = ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_prs1Busy = ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_prs2Busy = ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q4IQEnq_bits_isSta = ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 47:24]
  assign scheduler_io_q5IQEnq_valid = ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pc = ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_inst = ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_fuType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_divOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_immType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memRead = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isJump = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_excpVec = ctrlBlock_io_q5IQEnq_0_bits_excpVec; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_csrAddress = ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_valid = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_ldst = ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_lrs1 = ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_lrs2 = ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_prs1 = ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_prs2 = ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_oldPdst = ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_rs2Valid = ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_robIdx = ctrlBlock_io_q5IQEnq_0_bits_robIdx; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_robIdxFull = ctrlBlock_io_q5IQEnq_0_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_sqIdx = ctrlBlock_io_q5IQEnq_0_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_issueQueue = ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_prs2Busy = ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q5IQEnq_bits_isStd = ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 48:24]
  assign scheduler_io_q1Issue_ready = regRead_io_iqIssues_0_ready; // @[src/main/scala/backend/Backend.scala 58:26]
  assign scheduler_io_q2Issue_ready = regRead_io_iqIssues_1_ready; // @[src/main/scala/backend/Backend.scala 59:26]
  assign scheduler_io_q3Issue_ready = regRead_io_iqIssues_2_ready; // @[src/main/scala/backend/Backend.scala 60:26]
  assign scheduler_io_q4Issue_ready = regRead_io_iqIssues_3_ready; // @[src/main/scala/backend/Backend.scala 61:26]
  assign scheduler_io_q5Issue_ready = regRead_io_iqIssues_4_ready; // @[src/main/scala/backend/Backend.scala 62:26]
  assign scheduler_io_redirect_valid = io_redirect_valid; // @[src/main/scala/backend/Backend.scala 84:36]
  assign scheduler_io_redirect_robIdx = io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 85:32]
  assign regRead_clock = clock;
  assign regRead_reset = reset;
  assign regRead_io_iqIssues_0_valid = scheduler_io_q1Issue_valid; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pc = scheduler_io_q1Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_inst = scheduler_io_q1Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_fuType = scheduler_io_q1Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_aluOp = scheduler_io_q1Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_bruOp = scheduler_io_q1Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_lsuOp = scheduler_io_q1Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_csrOp = scheduler_io_q1Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_mulOp = scheduler_io_q1Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_divOp = scheduler_io_q1Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_src1Type = scheduler_io_q1Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_src2Type = scheduler_io_q1Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_immType = scheduler_io_q1Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_rfWen = scheduler_io_q1Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_memRead = scheduler_io_q1Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_memWrite = scheduler_io_q1Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_csrWen = scheduler_io_q1Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isBranch = scheduler_io_q1Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isJump = scheduler_io_q1Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isPriv = scheduler_io_q1Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_excpVec = scheduler_io_q1Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_imm = scheduler_io_q1Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_csrAddress = scheduler_io_q1Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_valid = scheduler_io_q1Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isBr = scheduler_io_q1Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isJal = scheduler_io_q1Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isJalr = scheduler_io_q1Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isCall = scheduler_io_q1Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isRet = scheduler_io_q1Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_jumpTarget = scheduler_io_q1Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_ldst = scheduler_io_q1Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_lrs1 = scheduler_io_q1Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_lrs2 = scheduler_io_q1Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_pdst = scheduler_io_q1Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_prs1 = scheduler_io_q1Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_prs2 = scheduler_io_q1Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_oldPdst = scheduler_io_q1Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_rs1Valid = scheduler_io_q1Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_rs2Valid = scheduler_io_q1Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_rdValid = scheduler_io_q1Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_robIdx = scheduler_io_q1Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_robIdxFull = scheduler_io_q1Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_lqIdx = scheduler_io_q1Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_sqIdx = scheduler_io_q1Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_issueQueue = scheduler_io_q1Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_prs1Busy = scheduler_io_q1Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_prs2Busy = scheduler_io_q1Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_0_bits_isSta = scheduler_io_q1Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 58:26]
  assign regRead_io_iqIssues_1_valid = scheduler_io_q2Issue_valid; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pc = scheduler_io_q2Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_inst = scheduler_io_q2Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_fuType = scheduler_io_q2Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_aluOp = scheduler_io_q2Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_bruOp = scheduler_io_q2Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_lsuOp = scheduler_io_q2Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_csrOp = scheduler_io_q2Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_mulOp = scheduler_io_q2Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_divOp = scheduler_io_q2Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_src1Type = scheduler_io_q2Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_src2Type = scheduler_io_q2Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_immType = scheduler_io_q2Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_rfWen = scheduler_io_q2Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_memRead = scheduler_io_q2Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_memWrite = scheduler_io_q2Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_csrWen = scheduler_io_q2Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isBranch = scheduler_io_q2Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isJump = scheduler_io_q2Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isPriv = scheduler_io_q2Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_excpVec = scheduler_io_q2Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_imm = scheduler_io_q2Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_csrAddress = scheduler_io_q2Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_valid = scheduler_io_q2Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isBr = scheduler_io_q2Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isJal = scheduler_io_q2Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isJalr = scheduler_io_q2Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isCall = scheduler_io_q2Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isRet = scheduler_io_q2Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_jumpTarget = scheduler_io_q2Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_ldst = scheduler_io_q2Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_lrs1 = scheduler_io_q2Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_lrs2 = scheduler_io_q2Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_pdst = scheduler_io_q2Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_prs1 = scheduler_io_q2Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_prs2 = scheduler_io_q2Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_oldPdst = scheduler_io_q2Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_rs1Valid = scheduler_io_q2Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_rs2Valid = scheduler_io_q2Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_rdValid = scheduler_io_q2Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_robIdx = scheduler_io_q2Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_robIdxFull = scheduler_io_q2Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_issueQueue = scheduler_io_q2Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_prs1Busy = scheduler_io_q2Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_1_bits_prs2Busy = scheduler_io_q2Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 59:26]
  assign regRead_io_iqIssues_2_valid = scheduler_io_q3Issue_valid; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pc = scheduler_io_q3Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_inst = scheduler_io_q3Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_fuType = scheduler_io_q3Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_aluOp = scheduler_io_q3Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_bruOp = scheduler_io_q3Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_lsuOp = scheduler_io_q3Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_csrOp = scheduler_io_q3Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_mulOp = scheduler_io_q3Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_divOp = scheduler_io_q3Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_src1Type = scheduler_io_q3Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_src2Type = scheduler_io_q3Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_immType = scheduler_io_q3Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_rfWen = scheduler_io_q3Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_memRead = scheduler_io_q3Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_memWrite = scheduler_io_q3Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_csrWen = scheduler_io_q3Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isBranch = scheduler_io_q3Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isJump = scheduler_io_q3Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isPriv = scheduler_io_q3Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_excpVec = scheduler_io_q3Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_imm = scheduler_io_q3Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_csrAddress = scheduler_io_q3Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_valid = scheduler_io_q3Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isBr = scheduler_io_q3Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isJal = scheduler_io_q3Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isJalr = scheduler_io_q3Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isCall = scheduler_io_q3Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isRet = scheduler_io_q3Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_jumpTarget = scheduler_io_q3Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_ldst = scheduler_io_q3Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_lrs1 = scheduler_io_q3Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_lrs2 = scheduler_io_q3Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_pdst = scheduler_io_q3Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_prs1 = scheduler_io_q3Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_prs2 = scheduler_io_q3Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_oldPdst = scheduler_io_q3Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_rs1Valid = scheduler_io_q3Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_rs2Valid = scheduler_io_q3Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_rdValid = scheduler_io_q3Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_robIdx = scheduler_io_q3Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_robIdxFull = scheduler_io_q3Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_lqIdx = scheduler_io_q3Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_sqIdx = scheduler_io_q3Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_issueQueue = scheduler_io_q3Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_prs1Busy = scheduler_io_q3Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_prs2Busy = scheduler_io_q3Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_2_bits_isSta = scheduler_io_q3Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 60:26]
  assign regRead_io_iqIssues_3_valid = scheduler_io_q4Issue_valid; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pc = scheduler_io_q4Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_inst = scheduler_io_q4Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_fuType = scheduler_io_q4Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_aluOp = scheduler_io_q4Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_bruOp = scheduler_io_q4Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_lsuOp = scheduler_io_q4Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_csrOp = scheduler_io_q4Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_mulOp = scheduler_io_q4Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_divOp = scheduler_io_q4Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_src1Type = scheduler_io_q4Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_src2Type = scheduler_io_q4Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_immType = scheduler_io_q4Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_rfWen = scheduler_io_q4Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_memRead = scheduler_io_q4Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_memWrite = scheduler_io_q4Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_csrWen = scheduler_io_q4Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isBranch = scheduler_io_q4Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isJump = scheduler_io_q4Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isPriv = scheduler_io_q4Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_excpVec = scheduler_io_q4Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_imm = scheduler_io_q4Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_csrAddress = scheduler_io_q4Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_valid = scheduler_io_q4Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isBr = scheduler_io_q4Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isJal = scheduler_io_q4Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isJalr = scheduler_io_q4Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isCall = scheduler_io_q4Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isRet = scheduler_io_q4Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_jumpTarget = scheduler_io_q4Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_ldst = scheduler_io_q4Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_lrs1 = scheduler_io_q4Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_lrs2 = scheduler_io_q4Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_pdst = scheduler_io_q4Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_prs1 = scheduler_io_q4Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_prs2 = scheduler_io_q4Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_oldPdst = scheduler_io_q4Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_rs1Valid = scheduler_io_q4Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_rs2Valid = scheduler_io_q4Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_rdValid = scheduler_io_q4Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_robIdx = scheduler_io_q4Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_robIdxFull = scheduler_io_q4Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_lqIdx = scheduler_io_q4Issue_bits_lqIdx; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_sqIdx = scheduler_io_q4Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_issueQueue = scheduler_io_q4Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_prs1Busy = scheduler_io_q4Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_prs2Busy = scheduler_io_q4Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_3_bits_isSta = scheduler_io_q4Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 61:26]
  assign regRead_io_iqIssues_4_valid = scheduler_io_q5Issue_valid; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pc = scheduler_io_q5Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_inst = scheduler_io_q5Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_fuType = scheduler_io_q5Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_aluOp = scheduler_io_q5Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_bruOp = scheduler_io_q5Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_lsuOp = scheduler_io_q5Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_csrOp = scheduler_io_q5Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_mulOp = scheduler_io_q5Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_divOp = scheduler_io_q5Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_src1Type = scheduler_io_q5Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_src2Type = scheduler_io_q5Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_immType = scheduler_io_q5Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_rfWen = scheduler_io_q5Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_memRead = scheduler_io_q5Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_memWrite = scheduler_io_q5Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_csrWen = scheduler_io_q5Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isBranch = scheduler_io_q5Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isJump = scheduler_io_q5Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isPriv = scheduler_io_q5Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_excpVec = scheduler_io_q5Issue_bits_excpVec; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_csrAddress = scheduler_io_q5Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_valid = scheduler_io_q5Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isBr = scheduler_io_q5Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isJal = scheduler_io_q5Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isJalr = scheduler_io_q5Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isCall = scheduler_io_q5Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isRet = scheduler_io_q5Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_jumpTarget = scheduler_io_q5Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_ldst = scheduler_io_q5Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_lrs1 = scheduler_io_q5Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_lrs2 = scheduler_io_q5Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_prs1 = scheduler_io_q5Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_prs2 = scheduler_io_q5Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_oldPdst = scheduler_io_q5Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_rs2Valid = scheduler_io_q5Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_robIdx = scheduler_io_q5Issue_bits_robIdx; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_robIdxFull = scheduler_io_q5Issue_bits_robIdxFull; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_sqIdx = scheduler_io_q5Issue_bits_sqIdx; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_issueQueue = scheduler_io_q5Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_prs2Busy = scheduler_io_q5Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_iqIssues_4_bits_isStd = scheduler_io_q5Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:26]
  assign regRead_io_rfReadData_0 = regFile_io_readPorts_0_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_1 = regFile_io_readPorts_1_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_2 = regFile_io_readPorts_2_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_3 = regFile_io_readPorts_3_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_4 = regFile_io_readPorts_4_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_5 = regFile_io_readPorts_5_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_6 = regFile_io_readPorts_6_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_rfReadData_7 = regFile_io_readPorts_7_data; // @[src/main/scala/backend/Backend.scala 69:34]
  assign regRead_io_exeReqs_0_ready = 1'h0; // @[src/main/scala/backend/Backend.scala 104:34]
  assign regRead_io_exeReqs_1_ready = 1'h0; // @[src/main/scala/backend/Backend.scala 104:34]
  assign regRead_io_exeReqs_2_ready = 1'h0; // @[src/main/scala/backend/Backend.scala 104:34]
  assign regRead_io_exeReqs_3_ready = 1'h0; // @[src/main/scala/backend/Backend.scala 104:34]
  assign regRead_io_exeReqs_4_ready = 1'h0; // @[src/main/scala/backend/Backend.scala 104:34]
  assign regRead_io_redirect_valid = io_redirect_valid; // @[src/main/scala/backend/Backend.scala 88:34]
  assign regRead_io_redirect_robIdx = io_redirect_robIdx; // @[src/main/scala/backend/Backend.scala 89:30]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_readPorts_0_addr = regRead_io_rfReadAddrs_0; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_1_addr = regRead_io_rfReadAddrs_1; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_2_addr = regRead_io_rfReadAddrs_2; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_3_addr = regRead_io_rfReadAddrs_3; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_4_addr = regRead_io_rfReadAddrs_4; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_5_addr = regRead_io_rfReadAddrs_5; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_6_addr = regRead_io_rfReadAddrs_6; // @[src/main/scala/backend/Backend.scala 68:34]
  assign regFile_io_readPorts_7_addr = regRead_io_rfReadAddrs_7; // @[src/main/scala/backend/Backend.scala 68:34]
endmodule
