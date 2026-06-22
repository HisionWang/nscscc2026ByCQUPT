module ExeUnit(
  input         clock,
  input         reset,
  output        io_inReq_ready, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_uop_pc, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_uop_inst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [4:0]  io_inReq_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [9:0]  io_inReq_bits_uop_excpVec, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_uop_imm, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [13:0] io_inReq_bits_uop_csrAddress, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [4:0]  io_inReq_bits_uop_ldst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [4:0]  io_inReq_bits_uop_lrs1, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [4:0]  io_inReq_bits_uop_lrs2, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [6:0]  io_inReq_bits_uop_pdst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [6:0]  io_inReq_bits_uop_prs1, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [6:0]  io_inReq_bits_uop_prs2, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [6:0]  io_inReq_bits_uop_oldPdst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_rdValid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [5:0]  io_inReq_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [5:0]  io_inReq_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_lqIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_lqIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [3:0]  io_inReq_bits_uop_sqIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_sqIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [2:0]  io_inReq_bits_uop_issueQueue, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_isSta, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_inReq_bits_uop_isStd, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_rs1Data, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input  [31:0] io_inReq_bits_rs2Data, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  input         io_outResult_ready, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [31:0] io_outResult_bits_uop_pc, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [31:0] io_outResult_bits_uop_inst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [4:0]  io_outResult_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [9:0]  io_outResult_bits_uop_excpVec, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [31:0] io_outResult_bits_uop_imm, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [13:0] io_outResult_bits_uop_csrAddress, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [31:0] io_outResult_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [4:0]  io_outResult_bits_uop_ldst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [4:0]  io_outResult_bits_uop_lrs1, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [4:0]  io_outResult_bits_uop_lrs2, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [6:0]  io_outResult_bits_uop_pdst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [6:0]  io_outResult_bits_uop_prs1, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [6:0]  io_outResult_bits_uop_prs2, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [6:0]  io_outResult_bits_uop_oldPdst, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_rdValid, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [5:0]  io_outResult_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [5:0]  io_outResult_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_lqIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_lqIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [3:0]  io_outResult_bits_uop_sqIdx_value, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_sqIdx_flag, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [2:0]  io_outResult_bits_uop_issueQueue, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_isSta, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output        io_outResult_bits_uop_isStd, // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
  output [31:0] io_outResult_bits_data // @[src/main/scala/backend/execute/ExeUnit.scala 48:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_uop_pc; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [4:0] alu_io_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [2:0] alu_io_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [2:0] alu_io_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [31:0] alu_io_uop_imm; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [31:0] alu_io_rs1; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [31:0] alu_io_rs2; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  wire [31:0] alu_io_result; // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
  reg  stgValid; // @[src/main/scala/backend/execute/ExeUnit.scala 58:25]
  reg [31:0] stgReq_uop_pc; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [31:0] stgReq_uop_inst; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_ctrl_fuType; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [4:0] stgReq_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_ctrl_divOp; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_ctrl_immType; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_memRead; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_isJump; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [9:0] stgReq_uop_excpVec; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [31:0] stgReq_uop_imm; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [13:0] stgReq_uop_csrAddress; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_valid; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [31:0] stgReq_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [4:0] stgReq_uop_ldst; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [4:0] stgReq_uop_lrs1; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [4:0] stgReq_uop_lrs2; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [6:0] stgReq_uop_pdst; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [6:0] stgReq_uop_prs1; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [6:0] stgReq_uop_prs2; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [6:0] stgReq_uop_oldPdst; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_rs1Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_rs2Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_rdValid; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [5:0] stgReq_uop_robIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_robIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [5:0] stgReq_uop_robIdxFull_value; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_lqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_lqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [3:0] stgReq_uop_sqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_sqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [2:0] stgReq_uop_issueQueue; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_prs1Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_prs2Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_isSta; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg  stgReq_uop_isStd; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [31:0] stgReq_rs1Data; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  reg [31:0] stgReq_rs2Data; // @[src/main/scala/backend/execute/ExeUnit.scala 59:21]
  wire  outFire = stgValid & io_outResult_ready; // @[src/main/scala/backend/execute/ExeUnit.scala 67:37]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/execute/ExeUnit.scala 70:28]
  wire  inFire = io_inReq_valid & stgReady; // @[src/main/scala/backend/execute/ExeUnit.scala 73:31]
  wire  _GEN_0 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/execute/ExeUnit.scala 86:23 88:14 58:25]
  wire  _GEN_1 = inFire | _GEN_0; // @[src/main/scala/backend/execute/ExeUnit.scala 82:22 84:14]
  wire  aluValid = stgValid & stgReq_uop_ctrl_fuType == 4'h1; // @[src/main/scala/backend/execute/ExeUnit.scala 99:46]
  ALU alu ( // @[src/main/scala/backend/execute/ExeUnit.scala 100:38]
    .io_uop_pc(alu_io_uop_pc),
    .io_uop_ctrl_aluOp(alu_io_uop_ctrl_aluOp),
    .io_uop_ctrl_src1Type(alu_io_uop_ctrl_src1Type),
    .io_uop_ctrl_src2Type(alu_io_uop_ctrl_src2Type),
    .io_uop_imm(alu_io_uop_imm),
    .io_rs1(alu_io_rs1),
    .io_rs2(alu_io_rs2),
    .io_result(alu_io_result)
  );
  assign io_inReq_ready = ~stgValid | outFire; // @[src/main/scala/backend/execute/ExeUnit.scala 70:28]
  assign io_outResult_valid = stgValid; // @[src/main/scala/backend/execute/ExeUnit.scala 136:38]
  assign io_outResult_bits_uop_pc = stgReq_uop_pc; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_inst = stgReq_uop_inst; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_fuType = stgReq_uop_ctrl_fuType; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_aluOp = stgReq_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_bruOp = stgReq_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_lsuOp = stgReq_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_csrOp = stgReq_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_mulOp = stgReq_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_divOp = stgReq_uop_ctrl_divOp; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_src1Type = stgReq_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_src2Type = stgReq_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_immType = stgReq_uop_ctrl_immType; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_rfWen = stgReq_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_memRead = stgReq_uop_ctrl_memRead; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_memWrite = stgReq_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_csrWen = stgReq_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_isBranch = stgReq_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_isJump = stgReq_uop_ctrl_isJump; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ctrl_isPriv = stgReq_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_excpVec = stgReq_uop_excpVec; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_imm = stgReq_uop_imm; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_csrAddress = stgReq_uop_csrAddress; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_valid = stgReq_uop_pdInfo_valid; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_isBr = stgReq_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_isJal = stgReq_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_isJalr = stgReq_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_isCall = stgReq_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_isRet = stgReq_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdInfo_jumpTarget = stgReq_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_ldst = stgReq_uop_ldst; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_lrs1 = stgReq_uop_lrs1; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_lrs2 = stgReq_uop_lrs2; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_pdst = stgReq_uop_pdst; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_prs1 = stgReq_uop_prs1; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_prs2 = stgReq_uop_prs2; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_oldPdst = stgReq_uop_oldPdst; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_rs1Valid = stgReq_uop_rs1Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_rs2Valid = stgReq_uop_rs2Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_rdValid = stgReq_uop_rdValid; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_robIdx_value = stgReq_uop_robIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_robIdx_flag = stgReq_uop_robIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_robIdxFull_value = stgReq_uop_robIdxFull_value; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_robIdxFull_flag = stgReq_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_lqIdx_value = stgReq_uop_lqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_lqIdx_flag = stgReq_uop_lqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_sqIdx_value = stgReq_uop_sqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_sqIdx_flag = stgReq_uop_sqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_issueQueue = stgReq_uop_issueQueue; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_prs1Busy = stgReq_uop_prs1Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_prs2Busy = stgReq_uop_prs2Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_isSta = stgReq_uop_isSta; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_uop_isStd = stgReq_uop_isStd; // @[src/main/scala/backend/execute/ExeUnit.scala 139:26]
  assign io_outResult_bits_data = aluValid ? alu_io_result : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign alu_io_uop_pc = stgReq_uop_pc; // @[src/main/scala/backend/execute/ExeUnit.scala 104:18]
  assign alu_io_uop_ctrl_aluOp = stgReq_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/ExeUnit.scala 104:18]
  assign alu_io_uop_ctrl_src1Type = stgReq_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/ExeUnit.scala 104:18]
  assign alu_io_uop_ctrl_src2Type = stgReq_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/ExeUnit.scala 104:18]
  assign alu_io_uop_imm = stgReq_uop_imm; // @[src/main/scala/backend/execute/ExeUnit.scala 104:18]
  assign alu_io_rs1 = stgReq_rs1Data; // @[src/main/scala/backend/execute/ExeUnit.scala 105:18]
  assign alu_io_rs2 = stgReq_rs2Data; // @[src/main/scala/backend/execute/ExeUnit.scala 106:18]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/execute/ExeUnit.scala 58:25]
      stgValid <= 1'h0; // @[src/main/scala/backend/execute/ExeUnit.scala 58:25]
    end else begin
      stgValid <= _GEN_1;
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pc <= io_inReq_bits_uop_pc; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_inst <= io_inReq_bits_uop_inst; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_fuType <= io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_aluOp <= io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_bruOp <= io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_lsuOp <= io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_csrOp <= io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_mulOp <= io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_divOp <= io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_src1Type <= io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_src2Type <= io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_immType <= io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_rfWen <= io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_memRead <= io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_memWrite <= io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_csrWen <= io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_isBranch <= io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_isJump <= io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ctrl_isPriv <= io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_excpVec <= io_inReq_bits_uop_excpVec; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_imm <= io_inReq_bits_uop_imm; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_csrAddress <= io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_valid <= io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_isBr <= io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_isJal <= io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_isJalr <= io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_isCall <= io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_isRet <= io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdInfo_jumpTarget <= io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_ldst <= io_inReq_bits_uop_ldst; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_lrs1 <= io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_lrs2 <= io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_pdst <= io_inReq_bits_uop_pdst; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_prs1 <= io_inReq_bits_uop_prs1; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_prs2 <= io_inReq_bits_uop_prs2; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_oldPdst <= io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_rs1Valid <= io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_rs2Valid <= io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_rdValid <= io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_robIdx_value <= io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_robIdx_flag <= io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_robIdxFull_value <= io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_robIdxFull_flag <= io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_lqIdx_value <= io_inReq_bits_uop_lqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_lqIdx_flag <= io_inReq_bits_uop_lqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_sqIdx_value <= io_inReq_bits_uop_sqIdx_value; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_sqIdx_flag <= io_inReq_bits_uop_sqIdx_flag; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_issueQueue <= io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_prs1Busy <= io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_prs2Busy <= io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_isSta <= io_inReq_bits_uop_isSta; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_uop_isStd <= io_inReq_bits_uop_isStd; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_rs1Data <= io_inReq_bits_rs1Data; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/ExeUnit.scala 82:22]
      stgReq_rs2Data <= io_inReq_bits_rs2Data; // @[src/main/scala/backend/execute/ExeUnit.scala 85:14]
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
  stgReq_uop_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  stgReq_uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stgReq_uop_ctrl_fuType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  stgReq_uop_ctrl_aluOp = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  stgReq_uop_ctrl_bruOp = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  stgReq_uop_ctrl_lsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  stgReq_uop_ctrl_csrOp = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  stgReq_uop_ctrl_mulOp = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  stgReq_uop_ctrl_divOp = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  stgReq_uop_ctrl_src1Type = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  stgReq_uop_ctrl_src2Type = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  stgReq_uop_ctrl_immType = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  stgReq_uop_ctrl_rfWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stgReq_uop_ctrl_memRead = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  stgReq_uop_ctrl_memWrite = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stgReq_uop_ctrl_csrWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  stgReq_uop_ctrl_isBranch = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stgReq_uop_ctrl_isJump = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stgReq_uop_ctrl_isPriv = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgReq_uop_excpVec = _RAND_20[9:0];
  _RAND_21 = {1{`RANDOM}};
  stgReq_uop_imm = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stgReq_uop_csrAddress = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  stgReq_uop_pdInfo_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stgReq_uop_pdInfo_isBr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgReq_uop_pdInfo_isJal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgReq_uop_pdInfo_isJalr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgReq_uop_pdInfo_isCall = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgReq_uop_pdInfo_isRet = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgReq_uop_pdInfo_jumpTarget = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  stgReq_uop_ldst = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  stgReq_uop_lrs1 = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  stgReq_uop_lrs2 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  stgReq_uop_pdst = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  stgReq_uop_prs1 = _RAND_34[6:0];
  _RAND_35 = {1{`RANDOM}};
  stgReq_uop_prs2 = _RAND_35[6:0];
  _RAND_36 = {1{`RANDOM}};
  stgReq_uop_oldPdst = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  stgReq_uop_rs1Valid = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  stgReq_uop_rs2Valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  stgReq_uop_rdValid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgReq_uop_robIdx_value = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  stgReq_uop_robIdx_flag = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  stgReq_uop_robIdxFull_value = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  stgReq_uop_robIdxFull_flag = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  stgReq_uop_lqIdx_value = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  stgReq_uop_lqIdx_flag = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  stgReq_uop_sqIdx_value = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  stgReq_uop_sqIdx_flag = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  stgReq_uop_issueQueue = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  stgReq_uop_prs1Busy = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgReq_uop_prs2Busy = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  stgReq_uop_isSta = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  stgReq_uop_isStd = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  stgReq_rs1Data = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stgReq_rs2Data = _RAND_54[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
