module Predecoder(
  input         clock,
  input         reset,
  input         io_flush, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_icacheResp_ready, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_icacheResp_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_0, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_1, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_2, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_3, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_0, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_1, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_2, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_3, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_addr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_fallThrough, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_bpuInfo_taken, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_target, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input  [1:0]  io_bpuInfo_takenOffset, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_bpuInfoValid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  input         io_out_ready, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_0, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_1, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_2, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_3, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_0, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_1, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_2, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_3, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isBr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isJal, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isJalr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isCall, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isRet, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_0_jumpTarget, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isBr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isJal, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isJalr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isCall, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isRet, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_1_jumpTarget, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isBr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isJal, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isJalr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isCall, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isRet, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_2_jumpTarget, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isBr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isJal, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isJalr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isCall, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isRet, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_3_jumpTarget, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_enqMask_0, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_enqMask_1, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_enqMask_2, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_enqMask_3, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_frontendRedirect_valid, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_frontendRedirect_target, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuUpdate_pc, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuUpdate_target, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isJalr, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isJal, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isCall, // @[src/main/scala/frontend/Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isRet // @[src/main/scala/frontend/Predecoder.scala 13:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  s_pd_valid; // @[src/main/scala/frontend/Predecoder.scala 27:30]
  reg [31:0] s_pd_instrs_0; // @[src/main/scala/frontend/Predecoder.scala 28:26]
  reg [31:0] s_pd_instrs_1; // @[src/main/scala/frontend/Predecoder.scala 28:26]
  reg [31:0] s_pd_instrs_2; // @[src/main/scala/frontend/Predecoder.scala 28:26]
  reg [31:0] s_pd_instrs_3; // @[src/main/scala/frontend/Predecoder.scala 28:26]
  reg  s_pd_valids_0; // @[src/main/scala/frontend/Predecoder.scala 29:26]
  reg  s_pd_valids_1; // @[src/main/scala/frontend/Predecoder.scala 29:26]
  reg  s_pd_valids_2; // @[src/main/scala/frontend/Predecoder.scala 29:26]
  reg  s_pd_valids_3; // @[src/main/scala/frontend/Predecoder.scala 29:26]
  reg [31:0] s_pd_addr; // @[src/main/scala/frontend/Predecoder.scala 30:26]
  reg [31:0] s_pd_bpu_fallThrough; // @[src/main/scala/frontend/Predecoder.scala 34:25]
  reg  s_pd_bpu_taken; // @[src/main/scala/frontend/Predecoder.scala 34:25]
  reg [31:0] s_pd_bpu_target; // @[src/main/scala/frontend/Predecoder.scala 34:25]
  reg [1:0] s_pd_bpu_takenOffset; // @[src/main/scala/frontend/Predecoder.scala 34:25]
  wire  inFire = io_icacheResp_valid & io_icacheResp_ready & io_bpuInfoValid; // @[src/main/scala/frontend/Predecoder.scala 36:60]
  wire  outFire = io_out_valid & io_out_ready; // @[src/main/scala/frontend/Predecoder.scala 37:30]
  wire  _GEN_0 = outFire ? 1'h0 : s_pd_valid; // @[src/main/scala/frontend/Predecoder.scala 54:23 55:16 27:30]
  wire  _GEN_1 = inFire | _GEN_0; // @[src/main/scala/frontend/Predecoder.scala 45:22 46:19]
  wire [32:0] _pc_T = {{1'd0}, s_pd_addr}; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  wire [31:0] pc = _pc_T[31:0]; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  wire [5:0] opcode = s_pd_instrs_0[31:26]; // @[src/main/scala/frontend/Predecoder.scala 116:25]
  wire [4:0] rj = s_pd_instrs_0[9:5]; // @[src/main/scala/frontend/Predecoder.scala 117:25]
  wire [4:0] rd = s_pd_instrs_0[4:0]; // @[src/main/scala/frontend/Predecoder.scala 118:25]
  wire  _isBr_T_5 = opcode == 6'h19; // @[src/main/scala/frontend/FrontendBundle.scala 47:8]
  wire  _isBr_T_6 = opcode == 6'h16 | opcode == 6'h17 | opcode == 6'h18 | _isBr_T_5; // @[src/main/scala/frontend/FrontendBundle.scala 46:56]
  wire  isBr = _isBr_T_6 | opcode == 6'h1a | opcode == 6'h1b; // @[src/main/scala/frontend/FrontendBundle.scala 47:39]
  wire  isB = opcode == 6'h14; // @[src/main/scala/frontend/Predecoder.scala 122:27]
  wire  isBl = opcode == 6'h15; // @[src/main/scala/frontend/Predecoder.scala 123:27]
  wire  isJal = isB | isBl; // @[src/main/scala/frontend/Predecoder.scala 124:24]
  wire  isJirl = opcode == 6'h13; // @[src/main/scala/frontend/Predecoder.scala 125:27]
  wire  isCall = isBl | isJirl & rd == 5'h1; // @[src/main/scala/frontend/Predecoder.scala 126:25]
  wire  isRet = isJirl & rj == 5'h1 & rd == 5'h0; // @[src/main/scala/frontend/Predecoder.scala 127:41]
  wire [15:0] offs16 = s_pd_instrs_0[25:10]; // @[src/main/scala/frontend/Predecoder.scala 136:31]
  wire [17:0] _brOffsetSext_T = {offs16,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:42]
  wire [13:0] _brOffsetSext_T_2 = _brOffsetSext_T[17] ? 14'h3fff : 14'h0; // @[src/main/scala/frontend/Predecoder.scala 137:34]
  wire [31:0] brOffsetSext = {_brOffsetSext_T_2,offs16,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:29]
  wire [31:0] brTarget = pc + brOffsetSext; // @[src/main/scala/frontend/Predecoder.scala 138:29]
  wire [25:0] offs26 = s_pd_instrs_0[25:0]; // @[src/main/scala/frontend/Predecoder.scala 140:31]
  wire [27:0] _jalOffsetSext_T = {offs26,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:41]
  wire [3:0] _jalOffsetSext_T_2 = _jalOffsetSext_T[27] ? 4'hf : 4'h0; // @[src/main/scala/frontend/Predecoder.scala 141:34]
  wire [31:0] jalOffsetSext = {_jalOffsetSext_T_2,offs26,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:29]
  wire [31:0] jalTarget = pc + jalOffsetSext; // @[src/main/scala/frontend/Predecoder.scala 142:29]
  wire [31:0] _pdInfo_0_jumpTarget_T = isJal ? jalTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _pdInfo_0_jumpTarget_T_1 = isBr ? brTarget : _pdInfo_0_jumpTarget_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  predTakenHere = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h0; // @[src/main/scala/frontend/Predecoder.scala 150:42]
  wire  _jalFault_T = isJal | isCall; // @[src/main/scala/frontend/Predecoder.scala 152:32]
  wire  _jalFault_T_1 = ~predTakenHere; // @[src/main/scala/frontend/Predecoder.scala 152:46]
  wire  jalFault = (isJal | isCall) & ~predTakenHere; // @[src/main/scala/frontend/Predecoder.scala 152:43]
  wire  jalrFault = isJirl & _jalFault_T_1; // @[src/main/scala/frontend/Predecoder.scala 153:32]
  wire  notCfiFault = ~isBr & ~isJal & ~isJirl & predTakenHere; // @[src/main/scala/frontend/Predecoder.scala 154:52]
  wire  targetFault = _jalFault_T & predTakenHere & s_pd_bpu_target != jalTarget; // @[src/main/scala/frontend/Predecoder.scala 155:60]
  wire [31:0] _faultTarget_0_T_1 = pc + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 166:28]
  wire [31:0] _faultTarget_0_T_2 = notCfiFault ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_0_T_3 = jalrFault ? _faultTarget_0_T_1 : _faultTarget_0_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_0_T_4 = targetFault ? jalTarget : _faultTarget_0_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_0_T_5 = jalFault ? jalTarget : _faultTarget_0_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_0 = s_pd_valids_0 & isJal; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  wire  faultIsJalr_0 = s_pd_valids_0 & isJirl; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  wire  faultIsCall_0 = s_pd_valids_0 & isCall; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  wire  faultIsRet_0 = s_pd_valids_0 & isRet; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  wire  faultValid_0 = s_pd_valids_0 & (jalFault | jalrFault | notCfiFault | targetFault); // @[src/main/scala/frontend/Predecoder.scala 115:19 108:20 157:22]
  wire [31:0] faultTarget_0 = s_pd_valids_0 ? _faultTarget_0_T_5 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 109:20 163:22]
  wire [31:0] pc_1 = s_pd_addr + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  wire [5:0] opcode_1 = s_pd_instrs_1[31:26]; // @[src/main/scala/frontend/Predecoder.scala 116:25]
  wire [4:0] rj_1 = s_pd_instrs_1[9:5]; // @[src/main/scala/frontend/Predecoder.scala 117:25]
  wire [4:0] rd_1 = s_pd_instrs_1[4:0]; // @[src/main/scala/frontend/Predecoder.scala 118:25]
  wire  _isBr_T_15 = opcode_1 == 6'h19; // @[src/main/scala/frontend/FrontendBundle.scala 47:8]
  wire  _isBr_T_16 = opcode_1 == 6'h16 | opcode_1 == 6'h17 | opcode_1 == 6'h18 | _isBr_T_15; // @[src/main/scala/frontend/FrontendBundle.scala 46:56]
  wire  isBr_1 = _isBr_T_16 | opcode_1 == 6'h1a | opcode_1 == 6'h1b; // @[src/main/scala/frontend/FrontendBundle.scala 47:39]
  wire  isB_1 = opcode_1 == 6'h14; // @[src/main/scala/frontend/Predecoder.scala 122:27]
  wire  isBl_1 = opcode_1 == 6'h15; // @[src/main/scala/frontend/Predecoder.scala 123:27]
  wire  isJal_1 = isB_1 | isBl_1; // @[src/main/scala/frontend/Predecoder.scala 124:24]
  wire  isJirl_1 = opcode_1 == 6'h13; // @[src/main/scala/frontend/Predecoder.scala 125:27]
  wire  isCall_1 = isBl_1 | isJirl_1 & rd_1 == 5'h1; // @[src/main/scala/frontend/Predecoder.scala 126:25]
  wire  isRet_1 = isJirl_1 & rj_1 == 5'h1 & rd_1 == 5'h0; // @[src/main/scala/frontend/Predecoder.scala 127:41]
  wire [15:0] offs16_1 = s_pd_instrs_1[25:10]; // @[src/main/scala/frontend/Predecoder.scala 136:31]
  wire [17:0] _brOffsetSext_T_4 = {offs16_1,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:42]
  wire [13:0] _brOffsetSext_T_6 = _brOffsetSext_T_4[17] ? 14'h3fff : 14'h0; // @[src/main/scala/frontend/Predecoder.scala 137:34]
  wire [31:0] brOffsetSext_1 = {_brOffsetSext_T_6,offs16_1,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:29]
  wire [31:0] brTarget_1 = pc_1 + brOffsetSext_1; // @[src/main/scala/frontend/Predecoder.scala 138:29]
  wire [25:0] offs26_1 = s_pd_instrs_1[25:0]; // @[src/main/scala/frontend/Predecoder.scala 140:31]
  wire [27:0] _jalOffsetSext_T_4 = {offs26_1,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:41]
  wire [3:0] _jalOffsetSext_T_6 = _jalOffsetSext_T_4[27] ? 4'hf : 4'h0; // @[src/main/scala/frontend/Predecoder.scala 141:34]
  wire [31:0] jalOffsetSext_1 = {_jalOffsetSext_T_6,offs26_1,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:29]
  wire [31:0] jalTarget_1 = pc_1 + jalOffsetSext_1; // @[src/main/scala/frontend/Predecoder.scala 142:29]
  wire [31:0] _pdInfo_1_jumpTarget_T = isJal_1 ? jalTarget_1 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _pdInfo_1_jumpTarget_T_1 = isBr_1 ? brTarget_1 : _pdInfo_1_jumpTarget_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  predTakenHere_1 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h1; // @[src/main/scala/frontend/Predecoder.scala 150:42]
  wire  _jalFault_T_2 = isJal_1 | isCall_1; // @[src/main/scala/frontend/Predecoder.scala 152:32]
  wire  _jalFault_T_3 = ~predTakenHere_1; // @[src/main/scala/frontend/Predecoder.scala 152:46]
  wire  jalFault_1 = (isJal_1 | isCall_1) & ~predTakenHere_1; // @[src/main/scala/frontend/Predecoder.scala 152:43]
  wire  jalrFault_1 = isJirl_1 & _jalFault_T_3; // @[src/main/scala/frontend/Predecoder.scala 153:32]
  wire  notCfiFault_1 = ~isBr_1 & ~isJal_1 & ~isJirl_1 & predTakenHere_1; // @[src/main/scala/frontend/Predecoder.scala 154:52]
  wire  targetFault_1 = _jalFault_T_2 & predTakenHere_1 & s_pd_bpu_target != jalTarget_1; // @[src/main/scala/frontend/Predecoder.scala 155:60]
  wire [31:0] _faultTarget_1_T_1 = pc_1 + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 166:28]
  wire [31:0] _faultTarget_1_T_2 = notCfiFault_1 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_1_T_3 = jalrFault_1 ? _faultTarget_1_T_1 : _faultTarget_1_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_1_T_4 = targetFault_1 ? jalTarget_1 : _faultTarget_1_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_1_T_5 = jalFault_1 ? jalTarget_1 : _faultTarget_1_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_1 = s_pd_valids_1 & isJal_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  wire  faultIsJalr_1 = s_pd_valids_1 & isJirl_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  wire  faultIsCall_1 = s_pd_valids_1 & isCall_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  wire  faultIsRet_1 = s_pd_valids_1 & isRet_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  wire  faultValid_1 = s_pd_valids_1 & (jalFault_1 | jalrFault_1 | notCfiFault_1 | targetFault_1); // @[src/main/scala/frontend/Predecoder.scala 115:19 108:20 157:22]
  wire [31:0] faultTarget_1 = s_pd_valids_1 ? _faultTarget_1_T_5 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 109:20 163:22]
  wire [31:0] pc_2 = s_pd_addr + 32'h8; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  wire [5:0] opcode_2 = s_pd_instrs_2[31:26]; // @[src/main/scala/frontend/Predecoder.scala 116:25]
  wire [4:0] rj_2 = s_pd_instrs_2[9:5]; // @[src/main/scala/frontend/Predecoder.scala 117:25]
  wire [4:0] rd_2 = s_pd_instrs_2[4:0]; // @[src/main/scala/frontend/Predecoder.scala 118:25]
  wire  _isBr_T_25 = opcode_2 == 6'h19; // @[src/main/scala/frontend/FrontendBundle.scala 47:8]
  wire  _isBr_T_26 = opcode_2 == 6'h16 | opcode_2 == 6'h17 | opcode_2 == 6'h18 | _isBr_T_25; // @[src/main/scala/frontend/FrontendBundle.scala 46:56]
  wire  isBr_2 = _isBr_T_26 | opcode_2 == 6'h1a | opcode_2 == 6'h1b; // @[src/main/scala/frontend/FrontendBundle.scala 47:39]
  wire  isB_2 = opcode_2 == 6'h14; // @[src/main/scala/frontend/Predecoder.scala 122:27]
  wire  isBl_2 = opcode_2 == 6'h15; // @[src/main/scala/frontend/Predecoder.scala 123:27]
  wire  isJal_2 = isB_2 | isBl_2; // @[src/main/scala/frontend/Predecoder.scala 124:24]
  wire  isJirl_2 = opcode_2 == 6'h13; // @[src/main/scala/frontend/Predecoder.scala 125:27]
  wire  isCall_2 = isBl_2 | isJirl_2 & rd_2 == 5'h1; // @[src/main/scala/frontend/Predecoder.scala 126:25]
  wire  isRet_2 = isJirl_2 & rj_2 == 5'h1 & rd_2 == 5'h0; // @[src/main/scala/frontend/Predecoder.scala 127:41]
  wire [15:0] offs16_2 = s_pd_instrs_2[25:10]; // @[src/main/scala/frontend/Predecoder.scala 136:31]
  wire [17:0] _brOffsetSext_T_8 = {offs16_2,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:42]
  wire [13:0] _brOffsetSext_T_10 = _brOffsetSext_T_8[17] ? 14'h3fff : 14'h0; // @[src/main/scala/frontend/Predecoder.scala 137:34]
  wire [31:0] brOffsetSext_2 = {_brOffsetSext_T_10,offs16_2,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:29]
  wire [31:0] brTarget_2 = pc_2 + brOffsetSext_2; // @[src/main/scala/frontend/Predecoder.scala 138:29]
  wire [25:0] offs26_2 = s_pd_instrs_2[25:0]; // @[src/main/scala/frontend/Predecoder.scala 140:31]
  wire [27:0] _jalOffsetSext_T_8 = {offs26_2,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:41]
  wire [3:0] _jalOffsetSext_T_10 = _jalOffsetSext_T_8[27] ? 4'hf : 4'h0; // @[src/main/scala/frontend/Predecoder.scala 141:34]
  wire [31:0] jalOffsetSext_2 = {_jalOffsetSext_T_10,offs26_2,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:29]
  wire [31:0] jalTarget_2 = pc_2 + jalOffsetSext_2; // @[src/main/scala/frontend/Predecoder.scala 142:29]
  wire [31:0] _pdInfo_2_jumpTarget_T = isJal_2 ? jalTarget_2 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _pdInfo_2_jumpTarget_T_1 = isBr_2 ? brTarget_2 : _pdInfo_2_jumpTarget_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  predTakenHere_2 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h2; // @[src/main/scala/frontend/Predecoder.scala 150:42]
  wire  _jalFault_T_4 = isJal_2 | isCall_2; // @[src/main/scala/frontend/Predecoder.scala 152:32]
  wire  _jalFault_T_5 = ~predTakenHere_2; // @[src/main/scala/frontend/Predecoder.scala 152:46]
  wire  jalFault_2 = (isJal_2 | isCall_2) & ~predTakenHere_2; // @[src/main/scala/frontend/Predecoder.scala 152:43]
  wire  jalrFault_2 = isJirl_2 & _jalFault_T_5; // @[src/main/scala/frontend/Predecoder.scala 153:32]
  wire  notCfiFault_2 = ~isBr_2 & ~isJal_2 & ~isJirl_2 & predTakenHere_2; // @[src/main/scala/frontend/Predecoder.scala 154:52]
  wire  targetFault_2 = _jalFault_T_4 & predTakenHere_2 & s_pd_bpu_target != jalTarget_2; // @[src/main/scala/frontend/Predecoder.scala 155:60]
  wire [31:0] _faultTarget_2_T_1 = pc_2 + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 166:28]
  wire [31:0] _faultTarget_2_T_2 = notCfiFault_2 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_2_T_3 = jalrFault_2 ? _faultTarget_2_T_1 : _faultTarget_2_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_2_T_4 = targetFault_2 ? jalTarget_2 : _faultTarget_2_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_2_T_5 = jalFault_2 ? jalTarget_2 : _faultTarget_2_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_2 = s_pd_valids_2 & isJal_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  wire  faultIsJalr_2 = s_pd_valids_2 & isJirl_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  wire  faultIsCall_2 = s_pd_valids_2 & isCall_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  wire  faultIsRet_2 = s_pd_valids_2 & isRet_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  wire  faultValid_2 = s_pd_valids_2 & (jalFault_2 | jalrFault_2 | notCfiFault_2 | targetFault_2); // @[src/main/scala/frontend/Predecoder.scala 115:19 108:20 157:22]
  wire [31:0] faultTarget_2 = s_pd_valids_2 ? _faultTarget_2_T_5 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 109:20 163:22]
  wire [31:0] pc_3 = s_pd_addr + 32'hc; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  wire [5:0] opcode_3 = s_pd_instrs_3[31:26]; // @[src/main/scala/frontend/Predecoder.scala 116:25]
  wire [4:0] rj_3 = s_pd_instrs_3[9:5]; // @[src/main/scala/frontend/Predecoder.scala 117:25]
  wire [4:0] rd_3 = s_pd_instrs_3[4:0]; // @[src/main/scala/frontend/Predecoder.scala 118:25]
  wire  _isBr_T_35 = opcode_3 == 6'h19; // @[src/main/scala/frontend/FrontendBundle.scala 47:8]
  wire  _isBr_T_36 = opcode_3 == 6'h16 | opcode_3 == 6'h17 | opcode_3 == 6'h18 | _isBr_T_35; // @[src/main/scala/frontend/FrontendBundle.scala 46:56]
  wire  isBr_3 = _isBr_T_36 | opcode_3 == 6'h1a | opcode_3 == 6'h1b; // @[src/main/scala/frontend/FrontendBundle.scala 47:39]
  wire  isB_3 = opcode_3 == 6'h14; // @[src/main/scala/frontend/Predecoder.scala 122:27]
  wire  isBl_3 = opcode_3 == 6'h15; // @[src/main/scala/frontend/Predecoder.scala 123:27]
  wire  isJal_3 = isB_3 | isBl_3; // @[src/main/scala/frontend/Predecoder.scala 124:24]
  wire  isJirl_3 = opcode_3 == 6'h13; // @[src/main/scala/frontend/Predecoder.scala 125:27]
  wire  isCall_3 = isBl_3 | isJirl_3 & rd_3 == 5'h1; // @[src/main/scala/frontend/Predecoder.scala 126:25]
  wire  isRet_3 = isJirl_3 & rj_3 == 5'h1 & rd_3 == 5'h0; // @[src/main/scala/frontend/Predecoder.scala 127:41]
  wire [15:0] offs16_3 = s_pd_instrs_3[25:10]; // @[src/main/scala/frontend/Predecoder.scala 136:31]
  wire [17:0] _brOffsetSext_T_12 = {offs16_3,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:42]
  wire [13:0] _brOffsetSext_T_14 = _brOffsetSext_T_12[17] ? 14'h3fff : 14'h0; // @[src/main/scala/frontend/Predecoder.scala 137:34]
  wire [31:0] brOffsetSext_3 = {_brOffsetSext_T_14,offs16_3,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 137:29]
  wire [31:0] brTarget_3 = pc_3 + brOffsetSext_3; // @[src/main/scala/frontend/Predecoder.scala 138:29]
  wire [25:0] offs26_3 = s_pd_instrs_3[25:0]; // @[src/main/scala/frontend/Predecoder.scala 140:31]
  wire [27:0] _jalOffsetSext_T_12 = {offs26_3,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:41]
  wire [3:0] _jalOffsetSext_T_14 = _jalOffsetSext_T_12[27] ? 4'hf : 4'h0; // @[src/main/scala/frontend/Predecoder.scala 141:34]
  wire [31:0] jalOffsetSext_3 = {_jalOffsetSext_T_14,offs26_3,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 141:29]
  wire [31:0] jalTarget_3 = pc_3 + jalOffsetSext_3; // @[src/main/scala/frontend/Predecoder.scala 142:29]
  wire [31:0] _pdInfo_3_jumpTarget_T = isJal_3 ? jalTarget_3 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _pdInfo_3_jumpTarget_T_1 = isBr_3 ? brTarget_3 : _pdInfo_3_jumpTarget_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  predTakenHere_3 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h3; // @[src/main/scala/frontend/Predecoder.scala 150:42]
  wire  _jalFault_T_6 = isJal_3 | isCall_3; // @[src/main/scala/frontend/Predecoder.scala 152:32]
  wire  _jalFault_T_7 = ~predTakenHere_3; // @[src/main/scala/frontend/Predecoder.scala 152:46]
  wire  jalFault_3 = (isJal_3 | isCall_3) & ~predTakenHere_3; // @[src/main/scala/frontend/Predecoder.scala 152:43]
  wire  jalrFault_3 = isJirl_3 & _jalFault_T_7; // @[src/main/scala/frontend/Predecoder.scala 153:32]
  wire  notCfiFault_3 = ~isBr_3 & ~isJal_3 & ~isJirl_3 & predTakenHere_3; // @[src/main/scala/frontend/Predecoder.scala 154:52]
  wire  targetFault_3 = _jalFault_T_6 & predTakenHere_3 & s_pd_bpu_target != jalTarget_3; // @[src/main/scala/frontend/Predecoder.scala 155:60]
  wire [31:0] _faultTarget_3_T_1 = pc_3 + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 166:28]
  wire [31:0] _faultTarget_3_T_2 = notCfiFault_3 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_3_T_3 = jalrFault_3 ? _faultTarget_3_T_1 : _faultTarget_3_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_3_T_4 = targetFault_3 ? jalTarget_3 : _faultTarget_3_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_3_T_5 = jalFault_3 ? jalTarget_3 : _faultTarget_3_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_3 = s_pd_valids_3 & isJal_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  wire  faultIsJalr_3 = s_pd_valids_3 & isJirl_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  wire  faultIsCall_3 = s_pd_valids_3 & isCall_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  wire  faultIsRet_3 = s_pd_valids_3 & isRet_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  wire  faultValid_3 = s_pd_valids_3 & (jalFault_3 | jalrFault_3 | notCfiFault_3 | targetFault_3); // @[src/main/scala/frontend/Predecoder.scala 115:19 108:20 157:22]
  wire [31:0] faultTarget_3 = s_pd_valids_3 ? _faultTarget_3_T_5 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 109:20 163:22]
  wire  priorFault_2 = faultValid_0 | faultValid_1; // @[src/main/scala/frontend/Predecoder.scala 179:40]
  wire  priorFault_3 = priorFault_2 | faultValid_2; // @[src/main/scala/frontend/Predecoder.scala 179:40]
  wire  isFirstFault_1 = faultValid_1 & ~faultValid_0; // @[src/main/scala/frontend/Predecoder.scala 184:38]
  wire  isFirstFault_2 = faultValid_2 & ~priorFault_2; // @[src/main/scala/frontend/Predecoder.scala 184:38]
  wire  isFirstFault_3 = faultValid_3 & ~priorFault_3; // @[src/main/scala/frontend/Predecoder.scala 184:38]
  wire [31:0] _GEN_93 = faultValid_0 ? faultTarget_0 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 196:27 199:24 188:34]
  wire  _GEN_94 = faultValid_0 & faultIsCall_0; // @[src/main/scala/frontend/Predecoder.scala 196:27 200:24 189:34]
  wire  _GEN_95 = faultValid_0 & faultIsRet_0; // @[src/main/scala/frontend/Predecoder.scala 196:27 201:24 190:34]
  wire  _GEN_96 = faultValid_0 & faultIsJal_0; // @[src/main/scala/frontend/Predecoder.scala 196:27 202:24 191:34]
  wire  _GEN_97 = faultValid_0 & faultIsJalr_0; // @[src/main/scala/frontend/Predecoder.scala 196:27 203:24 192:34]
  wire [1:0] _GEN_99 = isFirstFault_1 ? 2'h1 : 2'h0; // @[src/main/scala/frontend/Predecoder.scala 196:27 198:24]
  wire [31:0] _GEN_100 = isFirstFault_1 ? faultTarget_1 : _GEN_93; // @[src/main/scala/frontend/Predecoder.scala 196:27 199:24]
  wire  _GEN_101 = isFirstFault_1 ? faultIsCall_1 : _GEN_94; // @[src/main/scala/frontend/Predecoder.scala 196:27 200:24]
  wire  _GEN_102 = isFirstFault_1 ? faultIsRet_1 : _GEN_95; // @[src/main/scala/frontend/Predecoder.scala 196:27 201:24]
  wire  _GEN_103 = isFirstFault_1 ? faultIsJal_1 : _GEN_96; // @[src/main/scala/frontend/Predecoder.scala 196:27 202:24]
  wire  _GEN_104 = isFirstFault_1 ? faultIsJalr_1 : _GEN_97; // @[src/main/scala/frontend/Predecoder.scala 196:27 203:24]
  wire [1:0] _GEN_106 = isFirstFault_2 ? 2'h2 : _GEN_99; // @[src/main/scala/frontend/Predecoder.scala 196:27 198:24]
  wire [31:0] _GEN_107 = isFirstFault_2 ? faultTarget_2 : _GEN_100; // @[src/main/scala/frontend/Predecoder.scala 196:27 199:24]
  wire  _GEN_108 = isFirstFault_2 ? faultIsCall_2 : _GEN_101; // @[src/main/scala/frontend/Predecoder.scala 196:27 200:24]
  wire  _GEN_109 = isFirstFault_2 ? faultIsRet_2 : _GEN_102; // @[src/main/scala/frontend/Predecoder.scala 196:27 201:24]
  wire  _GEN_110 = isFirstFault_2 ? faultIsJal_2 : _GEN_103; // @[src/main/scala/frontend/Predecoder.scala 196:27 202:24]
  wire  _GEN_111 = isFirstFault_2 ? faultIsJalr_2 : _GEN_104; // @[src/main/scala/frontend/Predecoder.scala 196:27 203:24]
  wire  anyFault = isFirstFault_3 | (isFirstFault_2 | (isFirstFault_1 | faultValid_0)); // @[src/main/scala/frontend/Predecoder.scala 196:27 197:24]
  wire [1:0] firstFaultIdx = isFirstFault_3 ? 2'h3 : _GEN_106; // @[src/main/scala/frontend/Predecoder.scala 196:27 198:24]
  wire [31:0] firstFaultTarget = isFirstFault_3 ? faultTarget_3 : _GEN_107; // @[src/main/scala/frontend/Predecoder.scala 196:27 199:24]
  wire  _GEN_120 = 2'h1 > firstFaultIdx ? 1'h0 : s_pd_valids_1; // @[src/main/scala/frontend/Predecoder.scala 213:{33,46} 77:16]
  wire  _GEN_121 = 2'h2 > firstFaultIdx ? 1'h0 : s_pd_valids_2; // @[src/main/scala/frontend/Predecoder.scala 213:{33,46} 77:16]
  wire  _GEN_122 = 2'h3 > firstFaultIdx ? 1'h0 : s_pd_valids_3; // @[src/main/scala/frontend/Predecoder.scala 213:{33,46} 77:16]
  wire [3:0] _faultPC_T = {firstFaultIdx,2'h0}; // @[src/main/scala/frontend/Predecoder.scala 218:34]
  wire [31:0] _GEN_139 = {{28'd0}, _faultPC_T}; // @[src/main/scala/frontend/Predecoder.scala 218:29]
  assign io_icacheResp_ready = ~s_pd_valid | outFire; // @[src/main/scala/frontend/Predecoder.scala 40:38]
  assign io_out_valid = s_pd_valid; // @[src/main/scala/frontend/Predecoder.scala 236:30]
  assign io_out_bits_instrs_0 = s_pd_instrs_0; // @[src/main/scala/frontend/Predecoder.scala 237:30]
  assign io_out_bits_instrs_1 = s_pd_instrs_1; // @[src/main/scala/frontend/Predecoder.scala 237:30]
  assign io_out_bits_instrs_2 = s_pd_instrs_2; // @[src/main/scala/frontend/Predecoder.scala 237:30]
  assign io_out_bits_instrs_3 = s_pd_instrs_3; // @[src/main/scala/frontend/Predecoder.scala 237:30]
  assign io_out_bits_pcs_0 = _pc_T[31:0]; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  assign io_out_bits_pcs_1 = s_pd_addr + 32'h4; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  assign io_out_bits_pcs_2 = s_pd_addr + 32'h8; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  assign io_out_bits_pcs_3 = s_pd_addr + 32'hc; // @[src/main/scala/frontend/Predecoder.scala 95:29]
  assign io_out_bits_pdInfo_0_valid = s_pd_valids_0; // @[src/main/scala/frontend/Predecoder.scala 63:21 100:26]
  assign io_out_bits_pdInfo_0_isBr = s_pd_valids_0 & isBr; // @[src/main/scala/frontend/Predecoder.scala 115:19 129:24 101:26]
  assign io_out_bits_pdInfo_0_isJal = s_pd_valids_0 & isJal; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  assign io_out_bits_pdInfo_0_isJalr = s_pd_valids_0 & isJirl; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  assign io_out_bits_pdInfo_0_isCall = s_pd_valids_0 & isCall; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  assign io_out_bits_pdInfo_0_isRet = s_pd_valids_0 & isRet; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  assign io_out_bits_pdInfo_0_jumpTarget = s_pd_valids_0 ? _pdInfo_0_jumpTarget_T_1 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 106:26 144:28]
  assign io_out_bits_pdInfo_1_valid = s_pd_valids_1; // @[src/main/scala/frontend/Predecoder.scala 63:21 100:26]
  assign io_out_bits_pdInfo_1_isBr = s_pd_valids_1 & isBr_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 129:24 101:26]
  assign io_out_bits_pdInfo_1_isJal = s_pd_valids_1 & isJal_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  assign io_out_bits_pdInfo_1_isJalr = s_pd_valids_1 & isJirl_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  assign io_out_bits_pdInfo_1_isCall = s_pd_valids_1 & isCall_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  assign io_out_bits_pdInfo_1_isRet = s_pd_valids_1 & isRet_1; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  assign io_out_bits_pdInfo_1_jumpTarget = s_pd_valids_1 ? _pdInfo_1_jumpTarget_T_1 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 106:26 144:28]
  assign io_out_bits_pdInfo_2_valid = s_pd_valids_2; // @[src/main/scala/frontend/Predecoder.scala 63:21 100:26]
  assign io_out_bits_pdInfo_2_isBr = s_pd_valids_2 & isBr_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 129:24 101:26]
  assign io_out_bits_pdInfo_2_isJal = s_pd_valids_2 & isJal_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  assign io_out_bits_pdInfo_2_isJalr = s_pd_valids_2 & isJirl_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  assign io_out_bits_pdInfo_2_isCall = s_pd_valids_2 & isCall_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  assign io_out_bits_pdInfo_2_isRet = s_pd_valids_2 & isRet_2; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  assign io_out_bits_pdInfo_2_jumpTarget = s_pd_valids_2 ? _pdInfo_2_jumpTarget_T_1 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 106:26 144:28]
  assign io_out_bits_pdInfo_3_valid = s_pd_valids_3; // @[src/main/scala/frontend/Predecoder.scala 63:21 100:26]
  assign io_out_bits_pdInfo_3_isBr = s_pd_valids_3 & isBr_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 129:24 101:26]
  assign io_out_bits_pdInfo_3_isJal = s_pd_valids_3 & isJal_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 130:24 102:26]
  assign io_out_bits_pdInfo_3_isJalr = s_pd_valids_3 & isJirl_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 131:24 103:26]
  assign io_out_bits_pdInfo_3_isCall = s_pd_valids_3 & isCall_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 132:24 104:26]
  assign io_out_bits_pdInfo_3_isRet = s_pd_valids_3 & isRet_3; // @[src/main/scala/frontend/Predecoder.scala 115:19 133:24 105:26]
  assign io_out_bits_pdInfo_3_jumpTarget = s_pd_valids_3 ? _pdInfo_3_jumpTarget_T_1 : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 115:19 106:26 144:28]
  assign io_out_bits_enqMask_0 = s_pd_valids_0; // @[src/main/scala/frontend/Predecoder.scala 211:18 77:16]
  assign io_out_bits_enqMask_1 = anyFault ? _GEN_120 : s_pd_valids_1; // @[src/main/scala/frontend/Predecoder.scala 211:18 77:16]
  assign io_out_bits_enqMask_2 = anyFault ? _GEN_121 : s_pd_valids_2; // @[src/main/scala/frontend/Predecoder.scala 211:18 77:16]
  assign io_out_bits_enqMask_3 = anyFault ? _GEN_122 : s_pd_valids_3; // @[src/main/scala/frontend/Predecoder.scala 211:18 77:16]
  assign io_out_bits_frontendRedirect_valid = isFirstFault_3 | (isFirstFault_2 | (isFirstFault_1 | faultValid_0)); // @[src/main/scala/frontend/Predecoder.scala 196:27 197:24]
  assign io_out_bits_frontendRedirect_target = anyFault ? firstFaultTarget : 32'h0; // @[src/main/scala/frontend/Predecoder.scala 211:18 216:23 83:21]
  assign io_out_bits_bpuUpdate_pc = s_pd_addr + _GEN_139; // @[src/main/scala/frontend/Predecoder.scala 218:29]
  assign io_out_bits_bpuUpdate_target = isFirstFault_3 ? faultTarget_3 : _GEN_107; // @[src/main/scala/frontend/Predecoder.scala 196:27 199:24]
  assign io_out_bits_bpuUpdate_isJalr = isFirstFault_3 ? faultIsJalr_3 : _GEN_111; // @[src/main/scala/frontend/Predecoder.scala 196:27 203:24]
  assign io_out_bits_bpuUpdate_isJal = isFirstFault_3 ? faultIsJal_3 : _GEN_110; // @[src/main/scala/frontend/Predecoder.scala 196:27 202:24]
  assign io_out_bits_bpuUpdate_isCall = isFirstFault_3 ? faultIsCall_3 : _GEN_108; // @[src/main/scala/frontend/Predecoder.scala 196:27 200:24]
  assign io_out_bits_bpuUpdate_isRet = isFirstFault_3 ? faultIsRet_3 : _GEN_109; // @[src/main/scala/frontend/Predecoder.scala 196:27 201:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/Predecoder.scala 27:30]
      s_pd_valid <= 1'h0; // @[src/main/scala/frontend/Predecoder.scala 27:30]
    end else if (io_flush) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      s_pd_valid <= 1'h0; // @[src/main/scala/frontend/Predecoder.scala 44:16]
    end else begin
      s_pd_valid <= _GEN_1;
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_instrs_0 <= io_icacheResp_bits_instrs_0; // @[src/main/scala/frontend/Predecoder.scala 47:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_instrs_1 <= io_icacheResp_bits_instrs_1; // @[src/main/scala/frontend/Predecoder.scala 47:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_instrs_2 <= io_icacheResp_bits_instrs_2; // @[src/main/scala/frontend/Predecoder.scala 47:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_instrs_3 <= io_icacheResp_bits_instrs_3; // @[src/main/scala/frontend/Predecoder.scala 47:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_valids_0 <= io_icacheResp_bits_instvalids_0; // @[src/main/scala/frontend/Predecoder.scala 48:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_valids_1 <= io_icacheResp_bits_instvalids_1; // @[src/main/scala/frontend/Predecoder.scala 48:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_valids_2 <= io_icacheResp_bits_instvalids_2; // @[src/main/scala/frontend/Predecoder.scala 48:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_valids_3 <= io_icacheResp_bits_instvalids_3; // @[src/main/scala/frontend/Predecoder.scala 48:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_addr <= io_icacheResp_bits_addr; // @[src/main/scala/frontend/Predecoder.scala 49:19]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_bpu_fallThrough <= io_bpuInfo_fallThrough; // @[src/main/scala/frontend/Predecoder.scala 53:18]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_bpu_taken <= io_bpuInfo_taken; // @[src/main/scala/frontend/Predecoder.scala 53:18]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_bpu_target <= io_bpuInfo_target; // @[src/main/scala/frontend/Predecoder.scala 53:18]
      end
    end
    if (!(io_flush)) begin // @[src/main/scala/frontend/Predecoder.scala 43:18]
      if (inFire) begin // @[src/main/scala/frontend/Predecoder.scala 45:22]
        s_pd_bpu_takenOffset <= io_bpuInfo_takenOffset; // @[src/main/scala/frontend/Predecoder.scala 53:18]
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
  s_pd_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s_pd_instrs_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s_pd_instrs_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s_pd_instrs_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s_pd_instrs_3 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s_pd_valids_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s_pd_valids_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s_pd_valids_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s_pd_valids_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s_pd_addr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s_pd_bpu_fallThrough = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s_pd_bpu_taken = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s_pd_bpu_target = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s_pd_bpu_takenOffset = _RAND_13[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
