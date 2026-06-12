module DecodeStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_in_1_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_in_2_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_0_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_mulDivOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [9:0]  io_out_0_bits_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_1_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_mulDivOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [9:0]  io_out_1_bits_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_2_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_mulDivOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [9:0]  io_out_2_bits_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_0_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_0_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_1_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_1_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_2_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_2_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_extInt, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_flush // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] decoder_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [13:0] decoder_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [9:0] decoder_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_1_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_1_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_1_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [13:0] decoder_1_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_1_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_1_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_1_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_1_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_1_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_1_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_1_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_1_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_1_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [9:0] decoder_1_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_1_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_1_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_2_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_2_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_2_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [13:0] decoder_2_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_2_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [4:0] decoder_2_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_2_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_2_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_2_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_2_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_2_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [2:0] decoder_2_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [3:0] decoder_2_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [9:0] decoder_2_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire  decoder_2_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  wire [31:0] decoder_2_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
  reg  stgValid; // @[src/main/scala/backend/decode/DecodeStage.scala 15:26]
  reg  laneValid_0; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
  reg  laneValid_1; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
  reg  laneValid_2; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
  reg [31:0] stgData_0_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_0_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_1_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_1_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_2_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  reg  stgData_2_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 17:22]
  wire  outReadyAll = (~laneValid_0 | io_out_0_ready) & (~laneValid_1 | io_out_1_ready) & (~laneValid_2 | io_out_2_ready
    ); // @[src/main/scala/backend/decode/DecodeStage.scala 22:98]
  wire  outFire = stgValid & outReadyAll; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 27:28]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 31:45]
  wire  inFire = inValid & stgReady; // @[src/main/scala/backend/decode/DecodeStage.scala 32:25]
  wire  _GEN_0 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/decode/DecodeStage.scala 51:24 53:14 15:26]
  wire  _GEN_4 = inFire | _GEN_0; // @[src/main/scala/backend/decode/DecodeStage.scala 45:23 46:14]
  Decoder decoder ( // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
    .io_inData_instr(decoder_io_inData_instr),
    .io_inData_pc(decoder_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_io_inData_pdInfo_jumpTarget),
    .io_inData_exception_excpTlbRefill(decoder_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_io_inData_exception_excpAdef),
    .io_extInt(decoder_io_extInt),
    .io_out_pc(decoder_io_out_pc),
    .io_out_inst(decoder_io_out_inst),
    .io_out_rd(decoder_io_out_rd),
    .io_out_rj(decoder_io_out_rj),
    .io_out_rk(decoder_io_out_rk),
    .io_out_rs1Valid(decoder_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_io_out_rs2Valid),
    .io_out_rdValid(decoder_io_out_rdValid),
    .io_out_csrAddress(decoder_io_out_csrAddress),
    .io_out_imm(decoder_io_out_imm),
    .io_out_ctrl_fuType(decoder_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_io_out_ctrl_csrOp),
    .io_out_ctrl_mulDivOp(decoder_io_out_ctrl_mulDivOp),
    .io_out_ctrl_src1Type(decoder_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_io_out_ctrl_isPriv),
    .io_out_excpVec(decoder_io_out_excpVec),
    .io_out_pdInfo_valid(decoder_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_io_out_pdInfo_jumpTarget)
  );
  Decoder decoder_1 ( // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
    .io_inData_instr(decoder_1_io_inData_instr),
    .io_inData_pc(decoder_1_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_1_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_1_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_1_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_1_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_1_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_1_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_1_io_inData_pdInfo_jumpTarget),
    .io_inData_exception_excpTlbRefill(decoder_1_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_1_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_1_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_1_io_inData_exception_excpAdef),
    .io_extInt(decoder_1_io_extInt),
    .io_out_pc(decoder_1_io_out_pc),
    .io_out_inst(decoder_1_io_out_inst),
    .io_out_rd(decoder_1_io_out_rd),
    .io_out_rj(decoder_1_io_out_rj),
    .io_out_rk(decoder_1_io_out_rk),
    .io_out_rs1Valid(decoder_1_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_1_io_out_rs2Valid),
    .io_out_rdValid(decoder_1_io_out_rdValid),
    .io_out_csrAddress(decoder_1_io_out_csrAddress),
    .io_out_imm(decoder_1_io_out_imm),
    .io_out_ctrl_fuType(decoder_1_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_1_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_1_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_1_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_1_io_out_ctrl_csrOp),
    .io_out_ctrl_mulDivOp(decoder_1_io_out_ctrl_mulDivOp),
    .io_out_ctrl_src1Type(decoder_1_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_1_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_1_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_1_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_1_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_1_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_1_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_1_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_1_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_1_io_out_ctrl_isPriv),
    .io_out_excpVec(decoder_1_io_out_excpVec),
    .io_out_pdInfo_valid(decoder_1_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_1_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_1_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_1_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_1_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_1_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_1_io_out_pdInfo_jumpTarget)
  );
  Decoder decoder_2 ( // @[src/main/scala/backend/decode/DecodeStage.scala 64:25]
    .io_inData_instr(decoder_2_io_inData_instr),
    .io_inData_pc(decoder_2_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_2_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_2_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_2_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_2_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_2_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_2_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_2_io_inData_pdInfo_jumpTarget),
    .io_inData_exception_excpTlbRefill(decoder_2_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_2_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_2_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_2_io_inData_exception_excpAdef),
    .io_extInt(decoder_2_io_extInt),
    .io_out_pc(decoder_2_io_out_pc),
    .io_out_inst(decoder_2_io_out_inst),
    .io_out_rd(decoder_2_io_out_rd),
    .io_out_rj(decoder_2_io_out_rj),
    .io_out_rk(decoder_2_io_out_rk),
    .io_out_rs1Valid(decoder_2_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_2_io_out_rs2Valid),
    .io_out_rdValid(decoder_2_io_out_rdValid),
    .io_out_csrAddress(decoder_2_io_out_csrAddress),
    .io_out_imm(decoder_2_io_out_imm),
    .io_out_ctrl_fuType(decoder_2_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_2_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_2_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_2_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_2_io_out_ctrl_csrOp),
    .io_out_ctrl_mulDivOp(decoder_2_io_out_ctrl_mulDivOp),
    .io_out_ctrl_src1Type(decoder_2_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_2_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_2_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_2_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_2_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_2_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_2_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_2_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_2_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_2_io_out_ctrl_isPriv),
    .io_out_excpVec(decoder_2_io_out_excpVec),
    .io_out_pdInfo_valid(decoder_2_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_2_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_2_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_2_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_2_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_2_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_2_io_out_pdInfo_jumpTarget)
  );
  assign io_in_0_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 27:28]
  assign io_in_1_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 27:28]
  assign io_in_2_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 27:28]
  assign io_out_0_valid = stgValid & laneValid_0; // @[src/main/scala/backend/decode/DecodeStage.scala 71:33]
  assign io_out_0_bits_pc = decoder_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_inst = decoder_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rd = decoder_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rj = decoder_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rk = decoder_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rs1Valid = decoder_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rs2Valid = decoder_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_rdValid = decoder_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_csrAddress = decoder_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_imm = decoder_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_fuType = decoder_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_aluOp = decoder_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_bruOp = decoder_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_lsuOp = decoder_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_csrOp = decoder_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_mulDivOp = decoder_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_src1Type = decoder_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_src2Type = decoder_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_immType = decoder_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_rfWen = decoder_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_memRead = decoder_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_memWrite = decoder_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_csrWen = decoder_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_isBranch = decoder_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_isJump = decoder_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_ctrl_isPriv = decoder_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_excpVec = decoder_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_valid = decoder_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_isBr = decoder_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_isJal = decoder_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_isJalr = decoder_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_isCall = decoder_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_isRet = decoder_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_0_bits_pdInfo_jumpTarget = decoder_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_valid = stgValid & laneValid_1; // @[src/main/scala/backend/decode/DecodeStage.scala 71:33]
  assign io_out_1_bits_pc = decoder_1_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_inst = decoder_1_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rd = decoder_1_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rj = decoder_1_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rk = decoder_1_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rs1Valid = decoder_1_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rs2Valid = decoder_1_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_rdValid = decoder_1_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_csrAddress = decoder_1_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_imm = decoder_1_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_fuType = decoder_1_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_aluOp = decoder_1_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_bruOp = decoder_1_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_lsuOp = decoder_1_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_csrOp = decoder_1_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_mulDivOp = decoder_1_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_src1Type = decoder_1_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_src2Type = decoder_1_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_immType = decoder_1_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_rfWen = decoder_1_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_memRead = decoder_1_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_memWrite = decoder_1_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_csrWen = decoder_1_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_isBranch = decoder_1_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_isJump = decoder_1_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_ctrl_isPriv = decoder_1_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_excpVec = decoder_1_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_valid = decoder_1_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_isBr = decoder_1_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_isJal = decoder_1_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_isJalr = decoder_1_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_isCall = decoder_1_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_isRet = decoder_1_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_1_bits_pdInfo_jumpTarget = decoder_1_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_valid = stgValid & laneValid_2; // @[src/main/scala/backend/decode/DecodeStage.scala 71:33]
  assign io_out_2_bits_pc = decoder_2_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_inst = decoder_2_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rd = decoder_2_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rj = decoder_2_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rk = decoder_2_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rs1Valid = decoder_2_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rs2Valid = decoder_2_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_rdValid = decoder_2_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_csrAddress = decoder_2_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_imm = decoder_2_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_fuType = decoder_2_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_aluOp = decoder_2_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_bruOp = decoder_2_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_lsuOp = decoder_2_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_csrOp = decoder_2_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_mulDivOp = decoder_2_io_out_ctrl_mulDivOp; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_src1Type = decoder_2_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_src2Type = decoder_2_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_immType = decoder_2_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_rfWen = decoder_2_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_memRead = decoder_2_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_memWrite = decoder_2_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_csrWen = decoder_2_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_isBranch = decoder_2_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_isJump = decoder_2_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_ctrl_isPriv = decoder_2_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_excpVec = decoder_2_io_out_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_valid = decoder_2_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_isBr = decoder_2_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_isJal = decoder_2_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_isJalr = decoder_2_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_isCall = decoder_2_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_isRet = decoder_2_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_out_2_bits_pdInfo_jumpTarget = decoder_2_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 72:21]
  assign io_ratRead_0_rs1 = decoder_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 75:28]
  assign io_ratRead_0_rs2 = decoder_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 76:28]
  assign io_ratRead_1_rs1 = decoder_1_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 75:28]
  assign io_ratRead_1_rs2 = decoder_1_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 76:28]
  assign io_ratRead_2_rs1 = decoder_2_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 75:28]
  assign io_ratRead_2_rs2 = decoder_2_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 76:28]
  assign decoder_io_inData_instr = stgData_0_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pc = stgData_0_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_valid = stgData_0_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_isBr = stgData_0_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_isJal = stgData_0_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_isJalr = stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_isCall = stgData_0_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_isRet = stgData_0_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_pdInfo_jumpTarget = stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_exception_excpTlbRefill = stgData_0_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_exception_excpTlbPif = stgData_0_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_exception_excpTlbPpi = stgData_0_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_inData_exception_excpAdef = stgData_0_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 68:23]
  assign decoder_1_io_inData_instr = stgData_1_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pc = stgData_1_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_valid = stgData_1_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_isBr = stgData_1_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_isJal = stgData_1_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_isJalr = stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_isCall = stgData_1_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_isRet = stgData_1_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_pdInfo_jumpTarget = stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_exception_excpTlbRefill = stgData_1_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_exception_excpTlbPif = stgData_1_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_exception_excpTlbPpi = stgData_1_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_inData_exception_excpAdef = stgData_1_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_1_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 68:23]
  assign decoder_2_io_inData_instr = stgData_2_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pc = stgData_2_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_valid = stgData_2_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_isBr = stgData_2_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_isJal = stgData_2_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_isJalr = stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_isCall = stgData_2_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_isRet = stgData_2_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_pdInfo_jumpTarget = stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_exception_excpTlbRefill = stgData_2_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_exception_excpTlbPif = stgData_2_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_exception_excpTlbPpi = stgData_2_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_inData_exception_excpAdef = stgData_2_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 67:23]
  assign decoder_2_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 68:23]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 15:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 15:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      stgValid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 41:14]
    end else begin
      stgValid <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 43:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 48:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 51:24]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 43:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 48:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 51:24]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 16:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 43:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 48:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 51:24]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_instr <= io_in_0_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_exception_excpTlbRefill <= io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_exception_excpTlbPif <= io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_exception_excpTlbPpi <= io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_0_exception_excpAdef <= io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_instr <= io_in_1_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_exception_excpTlbRefill <= io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_exception_excpTlbPif <= io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_exception_excpTlbPpi <= io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_1_exception_excpAdef <= io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_instr <= io_in_2_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_exception_excpTlbRefill <= io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_exception_excpTlbPif <= io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_exception_excpTlbPpi <= io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 40:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 45:23]
        stgData_2_exception_excpAdef <= io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 49:20]
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
  stgData_0_instr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stgData_0_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_exception_excpTlbRefill = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_exception_excpTlbPif = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_exception_excpTlbPpi = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_exception_excpAdef = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_1_instr = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_1_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_1_exception_excpTlbRefill = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_1_exception_excpTlbPif = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_1_exception_excpTlbPpi = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_1_exception_excpAdef = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_2_instr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_2_pc = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_2_exception_excpTlbRefill = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_2_exception_excpTlbPif = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_2_exception_excpTlbPpi = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_2_exception_excpAdef = _RAND_42[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
