module Predecoder(
  input         clock,
  input         reset,
  input         io_flush, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_icacheResp_ready, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_instrs_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_instvalids_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_icacheResp_bits_addr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_uncached, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_mmu_error_excpTlbRefill, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_mmu_error_excpTlbPif, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_mmu_error_excpTlbPpi, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_icacheResp_bits_mmu_error_excpAdef, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_fallThrough, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [1:0]  io_bpuInfo_takenOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_btbHit, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_btbIsJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_btbIsJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_btbIsCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_btbIsRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [1:0]  io_bpuInfo_meta_btbOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [1:0]  io_bpuInfo_meta_phtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [2:0]  io_bpuInfo_meta_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfo_meta_predTaken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input  [31:0] io_bpuInfo_meta_predTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_bpuInfoValid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  input         io_out_ready, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_instrs_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pcs_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_instvalids_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_instvalids_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_instvalids_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_instvalids_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isBr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_0_isRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_0_jumpTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isBr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_1_isRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_1_jumpTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isBr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_2_isRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_2_jumpTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isBr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_pdInfo_3_isRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_pdInfo_3_jumpTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_0_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_0_fallThrough, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_0_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_0_takenOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_btbHit, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_btbIsJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_btbIsJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_btbIsCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_btbIsRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_0_meta_btbOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_0_meta_phtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [2:0]  io_out_bits_bpuInfo_0_meta_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_0_meta_predTaken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_0_meta_predTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_1_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_1_fallThrough, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_1_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_1_takenOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_btbHit, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_btbIsJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_btbIsJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_btbIsCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_btbIsRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_1_meta_btbOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_1_meta_phtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [2:0]  io_out_bits_bpuInfo_1_meta_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_1_meta_predTaken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_1_meta_predTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_2_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_2_fallThrough, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_2_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_2_takenOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_btbHit, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_btbIsJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_btbIsJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_btbIsCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_btbIsRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_2_meta_btbOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_2_meta_phtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [2:0]  io_out_bits_bpuInfo_2_meta_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_2_meta_predTaken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_2_meta_predTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_3_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_3_fallThrough, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_3_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_3_takenOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_btbHit, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_btbIsJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_btbIsJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_btbIsCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_btbIsRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_3_meta_btbOffset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuInfo_3_meta_phtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [2:0]  io_out_bits_bpuInfo_3_meta_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuInfo_3_meta_predTaken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuInfo_3_meta_predTarget, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_enqMask_0, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_enqMask_1, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_enqMask_2, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_enqMask_3, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_frontendRedirect_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_frontendRedirect_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_valid, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuUpdate_pc, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_taken, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_bpuUpdate_target, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuUpdate_oldPhtCounter, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isJalr, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isJal, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isCall, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_bpuUpdate_isRet, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [1:0]  io_out_bits_bpuUpdate_offset, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [2:0]  io_out_bits_bpuUpdate_rasTop, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_uncached, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_mmu_error_excpTlbRefill, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_mmu_error_excpTlbPif, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_mmu_error_excpTlbPpi, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output        io_out_bits_mmu_error_excpAdef, // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
  output [31:0] io_out_bits_addr // @[\\src\\main\\scala\\frontend\\Predecoder.scala 13:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  s_pd_valid; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 30:30]
  reg [31:0] s_pd_instrs_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 31:26]
  reg [31:0] s_pd_instrs_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 31:26]
  reg [31:0] s_pd_instrs_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 31:26]
  reg [31:0] s_pd_instrs_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 31:26]
  reg  s_pd_valids_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 32:26]
  reg  s_pd_valids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 32:26]
  reg  s_pd_valids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 32:26]
  reg  s_pd_valids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 32:26]
  reg [31:0] s_pd_addr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 33:26]
  reg  s_pd_uncached; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 35:26]
  reg  s_pd_mmuError_excpTlbRefill; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 36:26]
  reg  s_pd_mmuError_excpTlbPif; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 36:26]
  reg  s_pd_mmuError_excpTlbPpi; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 36:26]
  reg  s_pd_mmuError_excpAdef; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 36:26]
  reg [31:0] s_pd_bpu_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [31:0] s_pd_bpu_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [31:0] s_pd_bpu_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [1:0] s_pd_bpu_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [1:0] s_pd_bpu_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [1:0] s_pd_bpu_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [2:0] s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg  s_pd_bpu_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  reg [31:0] s_pd_bpu_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 37:25]
  wire  inFire = io_icacheResp_valid & io_icacheResp_ready & io_bpuInfoValid; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 39:60]
  wire  outFire = io_out_valid & io_out_ready; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 40:30]
  wire  _GEN_0 = outFire ? 1'h0 : s_pd_valid; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 57:23 58:16 30:30]
  wire  _GEN_1 = inFire | _GEN_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22 49:19]
  wire [32:0] _pc_T = {{1'd0}, s_pd_addr}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  wire [31:0] pc = _pc_T[31:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  wire [5:0] opcode = s_pd_instrs_0[31:26]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 119:25]
  wire [4:0] rj = s_pd_instrs_0[9:5]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 120:25]
  wire [4:0] rd = s_pd_instrs_0[4:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 121:25]
  wire  _isBr_T_5 = opcode == 6'h19; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:8]
  wire  _isBr_T_6 = opcode == 6'h16 | opcode == 6'h17 | opcode == 6'h18 | _isBr_T_5; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 46:56]
  wire  isBr = _isBr_T_6 | opcode == 6'h1a | opcode == 6'h1b; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:39]
  wire  isB = opcode == 6'h14; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 125:27]
  wire  isBl = opcode == 6'h15; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 126:27]
  wire  isJirl = opcode == 6'h13; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 127:27]
  wire  isJal = isB | isBl; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 129:24]
  wire  isCall = isBl | isJirl & rd == 5'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 130:25]
  wire  isRet = isJirl & rj == 5'h1 & rd == 5'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 131:41]
  wire [27:0] _jalOffsetSext_T = {s_pd_instrs_0[9:0],s_pd_instrs_0[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:41]
  wire [3:0] _jalOffsetSext_T_2 = _jalOffsetSext_T[27] ? 4'hf : 4'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:34]
  wire [31:0] jalOffsetSext = {_jalOffsetSext_T_2,s_pd_instrs_0[9:0],s_pd_instrs_0[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:29]
  wire [31:0] jalTarget = pc + jalOffsetSext; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 146:29]
  wire  predTakenHere = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 156:42]
  wire  jalFault = isJal & ~predTakenHere; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 158:31]
  wire  targetFault = isJal & predTakenHere & s_pd_bpu_target != jalTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 159:48]
  wire  notCfiFault = ~isBr & ~isJal & ~isJirl & predTakenHere; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 161:52]
  wire [31:0] _faultTarget_0_T = notCfiFault ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_0_T_1 = targetFault ? jalTarget : _faultTarget_0_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_0_T_2 = jalFault ? jalTarget : _faultTarget_0_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_0 = s_pd_valids_0 & isJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  wire  faultIsJalr_0 = s_pd_valids_0 & isJirl; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  wire  faultIsCall_0 = s_pd_valids_0 & isCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  wire  faultIsRet_0 = s_pd_valids_0 & isRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  wire  faultValid_0 = s_pd_valids_0 & (jalFault | notCfiFault | targetFault); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 111:20 164:22]
  wire [31:0] faultTarget_0 = s_pd_valids_0 ? _faultTarget_0_T_2 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 112:20 170:22]
  wire [31:0] pc_1 = s_pd_addr + 32'h4; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  wire [5:0] opcode_1 = s_pd_instrs_1[31:26]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 119:25]
  wire [4:0] rj_1 = s_pd_instrs_1[9:5]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 120:25]
  wire [4:0] rd_1 = s_pd_instrs_1[4:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 121:25]
  wire  _isBr_T_15 = opcode_1 == 6'h19; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:8]
  wire  _isBr_T_16 = opcode_1 == 6'h16 | opcode_1 == 6'h17 | opcode_1 == 6'h18 | _isBr_T_15; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 46:56]
  wire  isBr_1 = _isBr_T_16 | opcode_1 == 6'h1a | opcode_1 == 6'h1b; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:39]
  wire  isB_1 = opcode_1 == 6'h14; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 125:27]
  wire  isBl_1 = opcode_1 == 6'h15; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 126:27]
  wire  isJirl_1 = opcode_1 == 6'h13; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 127:27]
  wire  isJal_1 = isB_1 | isBl_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 129:24]
  wire  isCall_1 = isBl_1 | isJirl_1 & rd_1 == 5'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 130:25]
  wire  isRet_1 = isJirl_1 & rj_1 == 5'h1 & rd_1 == 5'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 131:41]
  wire [27:0] _jalOffsetSext_T_4 = {s_pd_instrs_1[9:0],s_pd_instrs_1[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:41]
  wire [3:0] _jalOffsetSext_T_6 = _jalOffsetSext_T_4[27] ? 4'hf : 4'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:34]
  wire [31:0] jalOffsetSext_1 = {_jalOffsetSext_T_6,s_pd_instrs_1[9:0],s_pd_instrs_1[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:29]
  wire [31:0] jalTarget_1 = pc_1 + jalOffsetSext_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 146:29]
  wire  predTakenHere_1 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 156:42]
  wire  jalFault_1 = isJal_1 & ~predTakenHere_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 158:31]
  wire  targetFault_1 = isJal_1 & predTakenHere_1 & s_pd_bpu_target != jalTarget_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 159:48]
  wire  notCfiFault_1 = ~isBr_1 & ~isJal_1 & ~isJirl_1 & predTakenHere_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 161:52]
  wire [31:0] _faultTarget_1_T = notCfiFault_1 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_1_T_1 = targetFault_1 ? jalTarget_1 : _faultTarget_1_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_1_T_2 = jalFault_1 ? jalTarget_1 : _faultTarget_1_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_1 = s_pd_valids_1 & isJal_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  wire  faultIsJalr_1 = s_pd_valids_1 & isJirl_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  wire  faultIsCall_1 = s_pd_valids_1 & isCall_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  wire  faultIsRet_1 = s_pd_valids_1 & isRet_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  wire  faultValid_1 = s_pd_valids_1 & (jalFault_1 | notCfiFault_1 | targetFault_1); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 111:20 164:22]
  wire [31:0] faultTarget_1 = s_pd_valids_1 ? _faultTarget_1_T_2 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 112:20 170:22]
  wire [31:0] pc_2 = s_pd_addr + 32'h8; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  wire [5:0] opcode_2 = s_pd_instrs_2[31:26]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 119:25]
  wire [4:0] rj_2 = s_pd_instrs_2[9:5]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 120:25]
  wire [4:0] rd_2 = s_pd_instrs_2[4:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 121:25]
  wire  _isBr_T_25 = opcode_2 == 6'h19; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:8]
  wire  _isBr_T_26 = opcode_2 == 6'h16 | opcode_2 == 6'h17 | opcode_2 == 6'h18 | _isBr_T_25; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 46:56]
  wire  isBr_2 = _isBr_T_26 | opcode_2 == 6'h1a | opcode_2 == 6'h1b; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:39]
  wire  isB_2 = opcode_2 == 6'h14; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 125:27]
  wire  isBl_2 = opcode_2 == 6'h15; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 126:27]
  wire  isJirl_2 = opcode_2 == 6'h13; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 127:27]
  wire  isJal_2 = isB_2 | isBl_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 129:24]
  wire  isCall_2 = isBl_2 | isJirl_2 & rd_2 == 5'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 130:25]
  wire  isRet_2 = isJirl_2 & rj_2 == 5'h1 & rd_2 == 5'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 131:41]
  wire [27:0] _jalOffsetSext_T_8 = {s_pd_instrs_2[9:0],s_pd_instrs_2[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:41]
  wire [3:0] _jalOffsetSext_T_10 = _jalOffsetSext_T_8[27] ? 4'hf : 4'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:34]
  wire [31:0] jalOffsetSext_2 = {_jalOffsetSext_T_10,s_pd_instrs_2[9:0],s_pd_instrs_2[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:29]
  wire [31:0] jalTarget_2 = pc_2 + jalOffsetSext_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 146:29]
  wire  predTakenHere_2 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 156:42]
  wire  jalFault_2 = isJal_2 & ~predTakenHere_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 158:31]
  wire  targetFault_2 = isJal_2 & predTakenHere_2 & s_pd_bpu_target != jalTarget_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 159:48]
  wire  notCfiFault_2 = ~isBr_2 & ~isJal_2 & ~isJirl_2 & predTakenHere_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 161:52]
  wire [31:0] _faultTarget_2_T = notCfiFault_2 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_2_T_1 = targetFault_2 ? jalTarget_2 : _faultTarget_2_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_2_T_2 = jalFault_2 ? jalTarget_2 : _faultTarget_2_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_2 = s_pd_valids_2 & isJal_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  wire  faultIsJalr_2 = s_pd_valids_2 & isJirl_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  wire  faultIsCall_2 = s_pd_valids_2 & isCall_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  wire  faultIsRet_2 = s_pd_valids_2 & isRet_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  wire  faultValid_2 = s_pd_valids_2 & (jalFault_2 | notCfiFault_2 | targetFault_2); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 111:20 164:22]
  wire [31:0] faultTarget_2 = s_pd_valids_2 ? _faultTarget_2_T_2 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 112:20 170:22]
  wire [31:0] pc_3 = s_pd_addr + 32'hc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  wire [5:0] opcode_3 = s_pd_instrs_3[31:26]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 119:25]
  wire [4:0] rj_3 = s_pd_instrs_3[9:5]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 120:25]
  wire [4:0] rd_3 = s_pd_instrs_3[4:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 121:25]
  wire  _isBr_T_35 = opcode_3 == 6'h19; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:8]
  wire  _isBr_T_36 = opcode_3 == 6'h16 | opcode_3 == 6'h17 | opcode_3 == 6'h18 | _isBr_T_35; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 46:56]
  wire  isBr_3 = _isBr_T_36 | opcode_3 == 6'h1a | opcode_3 == 6'h1b; // @[\\src\\main\\scala\\frontend\\FrontendBundle.scala 47:39]
  wire  isB_3 = opcode_3 == 6'h14; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 125:27]
  wire  isBl_3 = opcode_3 == 6'h15; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 126:27]
  wire  isJirl_3 = opcode_3 == 6'h13; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 127:27]
  wire  isJal_3 = isB_3 | isBl_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 129:24]
  wire  isCall_3 = isBl_3 | isJirl_3 & rd_3 == 5'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 130:25]
  wire  isRet_3 = isJirl_3 & rj_3 == 5'h1 & rd_3 == 5'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 131:41]
  wire [27:0] _jalOffsetSext_T_12 = {s_pd_instrs_3[9:0],s_pd_instrs_3[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:41]
  wire [3:0] _jalOffsetSext_T_14 = _jalOffsetSext_T_12[27] ? 4'hf : 4'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:34]
  wire [31:0] jalOffsetSext_3 = {_jalOffsetSext_T_14,s_pd_instrs_3[9:0],s_pd_instrs_3[25:10],2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 145:29]
  wire [31:0] jalTarget_3 = pc_3 + jalOffsetSext_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 146:29]
  wire  predTakenHere_3 = s_pd_bpu_taken & s_pd_bpu_takenOffset == 2'h3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 156:42]
  wire  jalFault_3 = isJal_3 & ~predTakenHere_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 158:31]
  wire  targetFault_3 = isJal_3 & predTakenHere_3 & s_pd_bpu_target != jalTarget_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 159:48]
  wire  notCfiFault_3 = ~isBr_3 & ~isJal_3 & ~isJirl_3 & predTakenHere_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 161:52]
  wire [31:0] _faultTarget_3_T = notCfiFault_3 ? s_pd_bpu_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_3_T_1 = targetFault_3 ? jalTarget_3 : _faultTarget_3_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _faultTarget_3_T_2 = jalFault_3 ? jalTarget_3 : _faultTarget_3_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  faultIsJal_3 = s_pd_valids_3 & isJal_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  wire  faultIsJalr_3 = s_pd_valids_3 & isJirl_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  wire  faultIsCall_3 = s_pd_valids_3 & isCall_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  wire  faultIsRet_3 = s_pd_valids_3 & isRet_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  wire  faultValid_3 = s_pd_valids_3 & (jalFault_3 | notCfiFault_3 | targetFault_3); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 111:20 164:22]
  wire [31:0] faultTarget_3 = s_pd_valids_3 ? _faultTarget_3_T_2 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 112:20 170:22]
  wire  priorFault_2 = faultValid_0 | faultValid_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 186:40]
  wire  priorFault_3 = priorFault_2 | faultValid_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 186:40]
  wire  isFirstFault_1 = faultValid_1 & ~faultValid_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 191:38]
  wire  isFirstFault_2 = faultValid_2 & ~priorFault_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 191:38]
  wire  isFirstFault_3 = faultValid_3 & ~priorFault_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 191:38]
  wire [31:0] _GEN_95 = faultValid_0 ? faultTarget_0 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 206:24 195:34]
  wire  _GEN_96 = faultValid_0 & faultIsCall_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 207:24 196:34]
  wire  _GEN_97 = faultValid_0 & faultIsRet_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 208:24 197:34]
  wire  _GEN_98 = faultValid_0 & faultIsJal_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 209:24 198:34]
  wire  _GEN_99 = faultValid_0 & faultIsJalr_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 210:24 199:34]
  wire [1:0] _GEN_101 = isFirstFault_1 ? 2'h1 : 2'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 205:24]
  wire [31:0] _GEN_102 = isFirstFault_1 ? faultTarget_1 : _GEN_95; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 206:24]
  wire  _GEN_103 = isFirstFault_1 ? faultIsCall_1 : _GEN_96; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 207:24]
  wire  _GEN_104 = isFirstFault_1 ? faultIsRet_1 : _GEN_97; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 208:24]
  wire  _GEN_105 = isFirstFault_1 ? faultIsJal_1 : _GEN_98; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 209:24]
  wire  _GEN_106 = isFirstFault_1 ? faultIsJalr_1 : _GEN_99; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 210:24]
  wire [1:0] _GEN_108 = isFirstFault_2 ? 2'h2 : _GEN_101; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 205:24]
  wire [31:0] _GEN_109 = isFirstFault_2 ? faultTarget_2 : _GEN_102; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 206:24]
  wire  _GEN_110 = isFirstFault_2 ? faultIsCall_2 : _GEN_103; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 207:24]
  wire  _GEN_111 = isFirstFault_2 ? faultIsRet_2 : _GEN_104; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 208:24]
  wire  _GEN_112 = isFirstFault_2 ? faultIsJal_2 : _GEN_105; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 209:24]
  wire  _GEN_113 = isFirstFault_2 ? faultIsJalr_2 : _GEN_106; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 210:24]
  wire  anyFault = isFirstFault_3 | (isFirstFault_2 | (isFirstFault_1 | faultValid_0)); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 204:24]
  wire [1:0] firstFaultIdx = isFirstFault_3 ? 2'h3 : _GEN_108; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 205:24]
  wire [31:0] firstFaultTarget = isFirstFault_3 ? faultTarget_3 : _GEN_109; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 206:24]
  wire  _GEN_122 = 2'h1 > firstFaultIdx ? 1'h0 : s_pd_valids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 220:{33,46} 80:16]
  wire  _GEN_123 = 2'h2 > firstFaultIdx ? 1'h0 : s_pd_valids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 220:{33,46} 80:16]
  wire  _GEN_124 = 2'h3 > firstFaultIdx ? 1'h0 : s_pd_valids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 220:{33,46} 80:16]
  wire [3:0] _faultPC_T = {firstFaultIdx,2'h0}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 225:34]
  wire [31:0] _GEN_142 = {{28'd0}, _faultPC_T}; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 225:29]
  wire [31:0] faultPC = s_pd_addr + _GEN_142; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 225:29]
  assign io_icacheResp_ready = ~s_pd_valid | outFire; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 43:38]
  assign io_out_valid = s_pd_valid; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 246:30]
  assign io_out_bits_instrs_0 = s_pd_instrs_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 247:30]
  assign io_out_bits_instrs_1 = s_pd_instrs_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 247:30]
  assign io_out_bits_instrs_2 = s_pd_instrs_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 247:30]
  assign io_out_bits_instrs_3 = s_pd_instrs_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 247:30]
  assign io_out_bits_pcs_0 = _pc_T[31:0]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  assign io_out_bits_pcs_1 = s_pd_addr + 32'h4; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  assign io_out_bits_pcs_2 = s_pd_addr + 32'h8; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  assign io_out_bits_pcs_3 = s_pd_addr + 32'hc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 98:29]
  assign io_out_bits_instvalids_0 = s_pd_valids_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 248:30]
  assign io_out_bits_instvalids_1 = s_pd_valids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 248:30]
  assign io_out_bits_instvalids_2 = s_pd_valids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 248:30]
  assign io_out_bits_instvalids_3 = s_pd_valids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 248:30]
  assign io_out_bits_pdInfo_0_valid = s_pd_valids_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 66:21 103:26]
  assign io_out_bits_pdInfo_0_isBr = s_pd_valids_0 & isBr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 133:24 104:26]
  assign io_out_bits_pdInfo_0_isJal = s_pd_valids_0 & isJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  assign io_out_bits_pdInfo_0_isJalr = s_pd_valids_0 & isJirl; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  assign io_out_bits_pdInfo_0_isCall = s_pd_valids_0 & isCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  assign io_out_bits_pdInfo_0_isRet = s_pd_valids_0 & isRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  assign io_out_bits_pdInfo_0_jumpTarget = s_pd_valids_0 ? jalTarget : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 109:26 148:28]
  assign io_out_bits_pdInfo_1_valid = s_pd_valids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 66:21 103:26]
  assign io_out_bits_pdInfo_1_isBr = s_pd_valids_1 & isBr_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 133:24 104:26]
  assign io_out_bits_pdInfo_1_isJal = s_pd_valids_1 & isJal_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  assign io_out_bits_pdInfo_1_isJalr = s_pd_valids_1 & isJirl_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  assign io_out_bits_pdInfo_1_isCall = s_pd_valids_1 & isCall_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  assign io_out_bits_pdInfo_1_isRet = s_pd_valids_1 & isRet_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  assign io_out_bits_pdInfo_1_jumpTarget = s_pd_valids_1 ? jalTarget_1 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 109:26 148:28]
  assign io_out_bits_pdInfo_2_valid = s_pd_valids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 66:21 103:26]
  assign io_out_bits_pdInfo_2_isBr = s_pd_valids_2 & isBr_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 133:24 104:26]
  assign io_out_bits_pdInfo_2_isJal = s_pd_valids_2 & isJal_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  assign io_out_bits_pdInfo_2_isJalr = s_pd_valids_2 & isJirl_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  assign io_out_bits_pdInfo_2_isCall = s_pd_valids_2 & isCall_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  assign io_out_bits_pdInfo_2_isRet = s_pd_valids_2 & isRet_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  assign io_out_bits_pdInfo_2_jumpTarget = s_pd_valids_2 ? jalTarget_2 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 109:26 148:28]
  assign io_out_bits_pdInfo_3_valid = s_pd_valids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 66:21 103:26]
  assign io_out_bits_pdInfo_3_isBr = s_pd_valids_3 & isBr_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 133:24 104:26]
  assign io_out_bits_pdInfo_3_isJal = s_pd_valids_3 & isJal_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 134:24 105:26]
  assign io_out_bits_pdInfo_3_isJalr = s_pd_valids_3 & isJirl_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 135:24 106:26]
  assign io_out_bits_pdInfo_3_isCall = s_pd_valids_3 & isCall_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 136:24 107:26]
  assign io_out_bits_pdInfo_3_isRet = s_pd_valids_3 & isRet_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 137:24 108:26]
  assign io_out_bits_pdInfo_3_jumpTarget = s_pd_valids_3 ? jalTarget_3 : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 118:19 109:26 148:28]
  assign io_out_bits_bpuInfo_0_pc = s_pd_bpu_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_fallThrough = s_pd_bpu_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_taken = s_pd_bpu_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_target = s_pd_bpu_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_takenOffset = s_pd_bpu_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbHit = s_pd_bpu_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbIsJalr = s_pd_bpu_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbIsJal = s_pd_bpu_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbIsCall = s_pd_bpu_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbIsRet = s_pd_bpu_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_btbOffset = s_pd_bpu_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_phtCounter = s_pd_bpu_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_rasTop = s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_predTaken = s_pd_bpu_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_0_meta_predTarget = s_pd_bpu_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_pc = s_pd_bpu_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_fallThrough = s_pd_bpu_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_taken = s_pd_bpu_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_target = s_pd_bpu_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_takenOffset = s_pd_bpu_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbHit = s_pd_bpu_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbIsJalr = s_pd_bpu_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbIsJal = s_pd_bpu_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbIsCall = s_pd_bpu_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbIsRet = s_pd_bpu_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_btbOffset = s_pd_bpu_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_phtCounter = s_pd_bpu_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_rasTop = s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_predTaken = s_pd_bpu_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_1_meta_predTarget = s_pd_bpu_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_pc = s_pd_bpu_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_fallThrough = s_pd_bpu_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_taken = s_pd_bpu_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_target = s_pd_bpu_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_takenOffset = s_pd_bpu_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbHit = s_pd_bpu_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbIsJalr = s_pd_bpu_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbIsJal = s_pd_bpu_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbIsCall = s_pd_bpu_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbIsRet = s_pd_bpu_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_btbOffset = s_pd_bpu_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_phtCounter = s_pd_bpu_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_rasTop = s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_predTaken = s_pd_bpu_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_2_meta_predTarget = s_pd_bpu_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_pc = s_pd_bpu_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_fallThrough = s_pd_bpu_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_taken = s_pd_bpu_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_target = s_pd_bpu_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_takenOffset = s_pd_bpu_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbHit = s_pd_bpu_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbIsJalr = s_pd_bpu_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbIsJal = s_pd_bpu_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbIsCall = s_pd_bpu_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbIsRet = s_pd_bpu_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_btbOffset = s_pd_bpu_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_phtCounter = s_pd_bpu_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_rasTop = s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_predTaken = s_pd_bpu_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_bpuInfo_3_meta_predTarget = s_pd_bpu_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 256:36]
  assign io_out_bits_enqMask_0 = s_pd_valids_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 80:16]
  assign io_out_bits_enqMask_1 = anyFault ? _GEN_122 : s_pd_valids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 80:16]
  assign io_out_bits_enqMask_2 = anyFault ? _GEN_123 : s_pd_valids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 80:16]
  assign io_out_bits_enqMask_3 = anyFault ? _GEN_124 : s_pd_valids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 80:16]
  assign io_out_bits_frontendRedirect_valid = anyFault & s_pd_valid; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 222:23 238:23]
  assign io_out_bits_frontendRedirect_target = anyFault ? firstFaultTarget : 32'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 223:23 86:21]
  assign io_out_bits_bpuUpdate_valid = isFirstFault_3 | (isFirstFault_2 | (isFirstFault_1 | faultValid_0)); // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 204:24]
  assign io_out_bits_bpuUpdate_pc = s_pd_addr + _GEN_142; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 225:29]
  assign io_out_bits_bpuUpdate_taken = 1'h1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 234:22]
  assign io_out_bits_bpuUpdate_target = isFirstFault_3 ? faultTarget_3 : _GEN_109; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 206:24]
  assign io_out_bits_bpuUpdate_oldPhtCounter = 2'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 88:23]
  assign io_out_bits_bpuUpdate_isJalr = isFirstFault_3 ? faultIsJalr_3 : _GEN_113; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 210:24]
  assign io_out_bits_bpuUpdate_isJal = isFirstFault_3 ? faultIsJal_3 : _GEN_112; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 209:24]
  assign io_out_bits_bpuUpdate_isCall = isFirstFault_3 ? faultIsCall_3 : _GEN_110; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 207:24]
  assign io_out_bits_bpuUpdate_isRet = isFirstFault_3 ? faultIsRet_3 : _GEN_111; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 203:27 208:24]
  assign io_out_bits_bpuUpdate_offset = faultPC[3:2]; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 233:32]
  assign io_out_bits_bpuUpdate_rasTop = s_pd_bpu_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 218:18 235:22]
  assign io_out_bits_uncached = s_pd_uncached; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 252:30]
  assign io_out_bits_mmu_error_excpTlbRefill = s_pd_mmuError_excpTlbRefill; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 253:30]
  assign io_out_bits_mmu_error_excpTlbPif = s_pd_mmuError_excpTlbPif; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 253:30]
  assign io_out_bits_mmu_error_excpTlbPpi = s_pd_mmuError_excpTlbPpi; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 253:30]
  assign io_out_bits_mmu_error_excpAdef = s_pd_mmuError_excpAdef; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 253:30]
  assign io_out_bits_addr = s_pd_addr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 250:30]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 30:30]
      s_pd_valid <= 1'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 30:30]
    end else if (io_flush) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      s_pd_valid <= 1'h0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 47:16]
    end else begin
      s_pd_valid <= _GEN_1;
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_instrs_0 <= io_icacheResp_bits_instrs_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 50:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_instrs_1 <= io_icacheResp_bits_instrs_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 50:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_instrs_2 <= io_icacheResp_bits_instrs_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 50:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_instrs_3 <= io_icacheResp_bits_instrs_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 50:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_valids_0 <= io_icacheResp_bits_instvalids_0; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 51:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_valids_1 <= io_icacheResp_bits_instvalids_1; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 51:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_valids_2 <= io_icacheResp_bits_instvalids_2; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 51:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_valids_3 <= io_icacheResp_bits_instvalids_3; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 51:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_addr <= io_icacheResp_bits_addr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 52:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_uncached <= io_icacheResp_bits_uncached; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 54:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_mmuError_excpTlbRefill <= io_icacheResp_bits_mmu_error_excpTlbRefill; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 55:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_mmuError_excpTlbPif <= io_icacheResp_bits_mmu_error_excpTlbPif; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 55:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_mmuError_excpTlbPpi <= io_icacheResp_bits_mmu_error_excpTlbPpi; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 55:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_mmuError_excpAdef <= io_icacheResp_bits_mmu_error_excpAdef; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 55:19]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_pc <= io_bpuInfo_pc; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_fallThrough <= io_bpuInfo_fallThrough; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_taken <= io_bpuInfo_taken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_target <= io_bpuInfo_target; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_takenOffset <= io_bpuInfo_takenOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbHit <= io_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbIsJalr <= io_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbIsJal <= io_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbIsCall <= io_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbIsRet <= io_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_btbOffset <= io_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_phtCounter <= io_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_rasTop <= io_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_predTaken <= io_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
      end
    end
    if (!(io_flush)) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 46:18]
      if (inFire) begin // @[\\src\\main\\scala\\frontend\\Predecoder.scala 48:22]
        s_pd_bpu_meta_predTarget <= io_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\frontend\\Predecoder.scala 56:18]
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
  s_pd_uncached = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s_pd_mmuError_excpTlbRefill = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s_pd_mmuError_excpTlbPif = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s_pd_mmuError_excpTlbPpi = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s_pd_mmuError_excpAdef = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s_pd_bpu_pc = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s_pd_bpu_fallThrough = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s_pd_bpu_taken = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s_pd_bpu_target = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s_pd_bpu_takenOffset = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  s_pd_bpu_meta_btbHit = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  s_pd_bpu_meta_btbIsJalr = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s_pd_bpu_meta_btbIsJal = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s_pd_bpu_meta_btbIsCall = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s_pd_bpu_meta_btbIsRet = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  s_pd_bpu_meta_btbOffset = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  s_pd_bpu_meta_phtCounter = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  s_pd_bpu_meta_rasTop = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  s_pd_bpu_meta_predTaken = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  s_pd_bpu_meta_predTarget = _RAND_29[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
