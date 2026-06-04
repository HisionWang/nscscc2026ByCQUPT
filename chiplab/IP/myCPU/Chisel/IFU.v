module IFU(
  input         clock,
  input         reset,
  output [31:0] io_icache_req_addr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_req_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_flush, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_resp_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_resp_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_icache_resp_bits_instrs_0, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_icache_resp_bits_instrs_1, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_icache_resp_bits_instrs_2, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_icache_resp_bits_instrs_3, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_resp_bits_instvalids_0, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_resp_bits_instvalids_1, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_resp_bits_instvalids_2, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_resp_bits_instvalids_3, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_icache_resp_bits_addr, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_out_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_instrs_0, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_instrs_1, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_instrs_2, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_instrs_3, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pcs_0, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pcs_1, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pcs_2, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pcs_3, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_isBr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_isJal, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_isJalr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_isCall, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_0_isRet, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pdInfo_0_jumpTarget, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_isBr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_isJal, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_isJalr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_isCall, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_1_isRet, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pdInfo_1_jumpTarget, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_isBr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_isJal, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_isJalr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_isCall, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_2_isRet, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pdInfo_2_jumpTarget, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_isBr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_isJal, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_isJalr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_isCall, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_pdInfo_3_isRet, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_out_bits_pdInfo_3_jumpTarget, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_enqMask_0, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_enqMask_1, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_enqMask_2, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_out_bits_enqMask_3, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_frontend_redirect_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_frontend_redirect_target // @[src/main/scala/frontend/IFU.scala 12:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  bpu_clock; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_reset; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire [31:0] bpu_io_predictReq_pc; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_predictResp_taken; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire [31:0] bpu_io_predictResp_target; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire [1:0] bpu_io_predictResp_takenOffset; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_predictFire; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_update_pd_valid; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire [31:0] bpu_io_update_pd_pc; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire [31:0] bpu_io_update_pd_target; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_update_pd_isJalr; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_update_pd_isJal; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_update_pd_isCall; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  bpu_io_update_pd_isRet; // @[src/main/scala/frontend/IFU.scala 36:25]
  wire  predecoder_clock; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_reset; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_flush; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_0; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_1; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_2; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_3; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_bits_instvalids_0; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_bits_instvalids_1; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_bits_instvalids_2; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_icacheResp_bits_instvalids_3; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_icacheResp_bits_addr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_bpuInfo_fallThrough; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_bpuInfo_taken; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_bpuInfo_target; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [1:0] predecoder_io_bpuInfo_takenOffset; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_bpuInfoValid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_ready; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_instrs_0; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_instrs_1; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_instrs_2; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_instrs_3; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pcs_0; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pcs_1; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pcs_2; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pcs_3; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_enqMask_0; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_enqMask_1; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_enqMask_2; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_enqMask_3; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_frontendRedirect_target; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_bpuUpdate_pc; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire [31:0] predecoder_io_out_bits_bpuUpdate_target; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_bpuUpdate_isJalr; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_bpuUpdate_isJal; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_bpuUpdate_isCall; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  predecoder_io_out_bits_bpuUpdate_isRet; // @[src/main/scala/frontend/IFU.scala 37:26]
  wire  bpuInfoQueue_clock; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_reset; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_enq_ready; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_enq_valid; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [31:0] bpuInfoQueue_io_enq_bits_fallThrough; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_enq_bits_taken; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [31:0] bpuInfoQueue_io_enq_bits_target; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [1:0] bpuInfoQueue_io_enq_bits_takenOffset; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_deq_ready; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [31:0] bpuInfoQueue_io_deq_bits_fallThrough; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_deq_bits_taken; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [31:0] bpuInfoQueue_io_deq_bits_target; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [1:0] bpuInfoQueue_io_deq_bits_takenOffset; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire  bpuInfoQueue_io_flush; // @[src/main/scala/frontend/IFU.scala 40:28]
  reg [31:0] pcReg; // @[src/main/scala/frontend/IFU.scala 43:25]
  wire [5:0] blockOffset = pcReg[5:0]; // @[src/main/scala/frontend/IFU.scala 47:28]
  wire [6:0] _GEN_1 = {{1'd0}, blockOffset}; // @[src/main/scala/frontend/IFU.scala 48:36]
  wire [6:0] bytesInLine = 7'h40 - _GEN_1; // @[src/main/scala/frontend/IFU.scala 48:36]
  wire [4:0] instsInLine = bytesInLine[6:2]; // @[src/main/scala/frontend/IFU.scala 49:35]
  wire  crossLine = instsInLine < 5'h4; // @[src/main/scala/frontend/IFU.scala 50:35]
  wire [25:0] _seqPC_T_2 = pcReg[31:6] + 26'h1; // @[src/main/scala/frontend/IFU.scala 52:55]
  wire [31:0] _seqPC_T_3 = {_seqPC_T_2,6'h0}; // @[src/main/scala/frontend/IFU.scala 52:30]
  wire [31:0] _seqPC_T_5 = pcReg + 32'h10; // @[src/main/scala/frontend/IFU.scala 53:33]
  wire [31:0] seqPC = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 51:26]
  wire  _pc_fire_T_3 = ~io_frontend_redirect_valid; // @[src/main/scala/frontend/IFU.scala 78:17]
  wire  pc_fire = io_icache_req_ready & bpuInfoQueue_io_enq_ready & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 77:93]
  wire  processResp = io_icache_resp_valid & bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/IFU.scala 118:42]
  BPU bpu ( // @[src/main/scala/frontend/IFU.scala 36:25]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_predictReq_pc(bpu_io_predictReq_pc),
    .io_predictResp_taken(bpu_io_predictResp_taken),
    .io_predictResp_target(bpu_io_predictResp_target),
    .io_predictResp_takenOffset(bpu_io_predictResp_takenOffset),
    .io_predictFire(bpu_io_predictFire),
    .io_update_pd_valid(bpu_io_update_pd_valid),
    .io_update_pd_pc(bpu_io_update_pd_pc),
    .io_update_pd_target(bpu_io_update_pd_target),
    .io_update_pd_isJalr(bpu_io_update_pd_isJalr),
    .io_update_pd_isJal(bpu_io_update_pd_isJal),
    .io_update_pd_isCall(bpu_io_update_pd_isCall),
    .io_update_pd_isRet(bpu_io_update_pd_isRet)
  );
  Predecoder predecoder ( // @[src/main/scala/frontend/IFU.scala 37:26]
    .clock(predecoder_clock),
    .reset(predecoder_reset),
    .io_flush(predecoder_io_flush),
    .io_icacheResp_ready(predecoder_io_icacheResp_ready),
    .io_icacheResp_valid(predecoder_io_icacheResp_valid),
    .io_icacheResp_bits_instrs_0(predecoder_io_icacheResp_bits_instrs_0),
    .io_icacheResp_bits_instrs_1(predecoder_io_icacheResp_bits_instrs_1),
    .io_icacheResp_bits_instrs_2(predecoder_io_icacheResp_bits_instrs_2),
    .io_icacheResp_bits_instrs_3(predecoder_io_icacheResp_bits_instrs_3),
    .io_icacheResp_bits_instvalids_0(predecoder_io_icacheResp_bits_instvalids_0),
    .io_icacheResp_bits_instvalids_1(predecoder_io_icacheResp_bits_instvalids_1),
    .io_icacheResp_bits_instvalids_2(predecoder_io_icacheResp_bits_instvalids_2),
    .io_icacheResp_bits_instvalids_3(predecoder_io_icacheResp_bits_instvalids_3),
    .io_icacheResp_bits_addr(predecoder_io_icacheResp_bits_addr),
    .io_bpuInfo_fallThrough(predecoder_io_bpuInfo_fallThrough),
    .io_bpuInfo_taken(predecoder_io_bpuInfo_taken),
    .io_bpuInfo_target(predecoder_io_bpuInfo_target),
    .io_bpuInfo_takenOffset(predecoder_io_bpuInfo_takenOffset),
    .io_bpuInfoValid(predecoder_io_bpuInfoValid),
    .io_out_ready(predecoder_io_out_ready),
    .io_out_valid(predecoder_io_out_valid),
    .io_out_bits_instrs_0(predecoder_io_out_bits_instrs_0),
    .io_out_bits_instrs_1(predecoder_io_out_bits_instrs_1),
    .io_out_bits_instrs_2(predecoder_io_out_bits_instrs_2),
    .io_out_bits_instrs_3(predecoder_io_out_bits_instrs_3),
    .io_out_bits_pcs_0(predecoder_io_out_bits_pcs_0),
    .io_out_bits_pcs_1(predecoder_io_out_bits_pcs_1),
    .io_out_bits_pcs_2(predecoder_io_out_bits_pcs_2),
    .io_out_bits_pcs_3(predecoder_io_out_bits_pcs_3),
    .io_out_bits_pdInfo_0_valid(predecoder_io_out_bits_pdInfo_0_valid),
    .io_out_bits_pdInfo_0_isBr(predecoder_io_out_bits_pdInfo_0_isBr),
    .io_out_bits_pdInfo_0_isJal(predecoder_io_out_bits_pdInfo_0_isJal),
    .io_out_bits_pdInfo_0_isJalr(predecoder_io_out_bits_pdInfo_0_isJalr),
    .io_out_bits_pdInfo_0_isCall(predecoder_io_out_bits_pdInfo_0_isCall),
    .io_out_bits_pdInfo_0_isRet(predecoder_io_out_bits_pdInfo_0_isRet),
    .io_out_bits_pdInfo_0_jumpTarget(predecoder_io_out_bits_pdInfo_0_jumpTarget),
    .io_out_bits_pdInfo_1_valid(predecoder_io_out_bits_pdInfo_1_valid),
    .io_out_bits_pdInfo_1_isBr(predecoder_io_out_bits_pdInfo_1_isBr),
    .io_out_bits_pdInfo_1_isJal(predecoder_io_out_bits_pdInfo_1_isJal),
    .io_out_bits_pdInfo_1_isJalr(predecoder_io_out_bits_pdInfo_1_isJalr),
    .io_out_bits_pdInfo_1_isCall(predecoder_io_out_bits_pdInfo_1_isCall),
    .io_out_bits_pdInfo_1_isRet(predecoder_io_out_bits_pdInfo_1_isRet),
    .io_out_bits_pdInfo_1_jumpTarget(predecoder_io_out_bits_pdInfo_1_jumpTarget),
    .io_out_bits_pdInfo_2_valid(predecoder_io_out_bits_pdInfo_2_valid),
    .io_out_bits_pdInfo_2_isBr(predecoder_io_out_bits_pdInfo_2_isBr),
    .io_out_bits_pdInfo_2_isJal(predecoder_io_out_bits_pdInfo_2_isJal),
    .io_out_bits_pdInfo_2_isJalr(predecoder_io_out_bits_pdInfo_2_isJalr),
    .io_out_bits_pdInfo_2_isCall(predecoder_io_out_bits_pdInfo_2_isCall),
    .io_out_bits_pdInfo_2_isRet(predecoder_io_out_bits_pdInfo_2_isRet),
    .io_out_bits_pdInfo_2_jumpTarget(predecoder_io_out_bits_pdInfo_2_jumpTarget),
    .io_out_bits_pdInfo_3_valid(predecoder_io_out_bits_pdInfo_3_valid),
    .io_out_bits_pdInfo_3_isBr(predecoder_io_out_bits_pdInfo_3_isBr),
    .io_out_bits_pdInfo_3_isJal(predecoder_io_out_bits_pdInfo_3_isJal),
    .io_out_bits_pdInfo_3_isJalr(predecoder_io_out_bits_pdInfo_3_isJalr),
    .io_out_bits_pdInfo_3_isCall(predecoder_io_out_bits_pdInfo_3_isCall),
    .io_out_bits_pdInfo_3_isRet(predecoder_io_out_bits_pdInfo_3_isRet),
    .io_out_bits_pdInfo_3_jumpTarget(predecoder_io_out_bits_pdInfo_3_jumpTarget),
    .io_out_bits_enqMask_0(predecoder_io_out_bits_enqMask_0),
    .io_out_bits_enqMask_1(predecoder_io_out_bits_enqMask_1),
    .io_out_bits_enqMask_2(predecoder_io_out_bits_enqMask_2),
    .io_out_bits_enqMask_3(predecoder_io_out_bits_enqMask_3),
    .io_out_bits_frontendRedirect_valid(predecoder_io_out_bits_frontendRedirect_valid),
    .io_out_bits_frontendRedirect_target(predecoder_io_out_bits_frontendRedirect_target),
    .io_out_bits_bpuUpdate_pc(predecoder_io_out_bits_bpuUpdate_pc),
    .io_out_bits_bpuUpdate_target(predecoder_io_out_bits_bpuUpdate_target),
    .io_out_bits_bpuUpdate_isJalr(predecoder_io_out_bits_bpuUpdate_isJalr),
    .io_out_bits_bpuUpdate_isJal(predecoder_io_out_bits_bpuUpdate_isJal),
    .io_out_bits_bpuUpdate_isCall(predecoder_io_out_bits_bpuUpdate_isCall),
    .io_out_bits_bpuUpdate_isRet(predecoder_io_out_bits_bpuUpdate_isRet)
  );
  FlushableQueue bpuInfoQueue ( // @[src/main/scala/frontend/IFU.scala 40:28]
    .clock(bpuInfoQueue_clock),
    .reset(bpuInfoQueue_reset),
    .io_enq_ready(bpuInfoQueue_io_enq_ready),
    .io_enq_valid(bpuInfoQueue_io_enq_valid),
    .io_enq_bits_fallThrough(bpuInfoQueue_io_enq_bits_fallThrough),
    .io_enq_bits_taken(bpuInfoQueue_io_enq_bits_taken),
    .io_enq_bits_target(bpuInfoQueue_io_enq_bits_target),
    .io_enq_bits_takenOffset(bpuInfoQueue_io_enq_bits_takenOffset),
    .io_deq_ready(bpuInfoQueue_io_deq_ready),
    .io_deq_valid(bpuInfoQueue_io_deq_valid),
    .io_deq_bits_fallThrough(bpuInfoQueue_io_deq_bits_fallThrough),
    .io_deq_bits_taken(bpuInfoQueue_io_deq_bits_taken),
    .io_deq_bits_target(bpuInfoQueue_io_deq_bits_target),
    .io_deq_bits_takenOffset(bpuInfoQueue_io_deq_bits_takenOffset),
    .io_flush(bpuInfoQueue_io_flush)
  );
  assign io_icache_req_addr = pcReg; // @[src/main/scala/frontend/IFU.scala 95:23]
  assign io_icache_req_valid = ~io_frontend_redirect_valid; // @[src/main/scala/frontend/IFU.scala 97:26]
  assign io_icache_req_flush = io_frontend_redirect_valid; // @[src/main/scala/frontend/IFU.scala 98:48]
  assign io_icache_resp_ready = predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign io_out_valid = predecoder_io_out_valid; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_instrs_0 = predecoder_io_out_bits_instrs_0; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_instrs_1 = predecoder_io_out_bits_instrs_1; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_instrs_2 = predecoder_io_out_bits_instrs_2; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_instrs_3 = predecoder_io_out_bits_instrs_3; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pcs_0 = predecoder_io_out_bits_pcs_0; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pcs_1 = predecoder_io_out_bits_pcs_1; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pcs_2 = predecoder_io_out_bits_pcs_2; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pcs_3 = predecoder_io_out_bits_pcs_3; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_valid = predecoder_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_isBr = predecoder_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_isJal = predecoder_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_isJalr = predecoder_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_isCall = predecoder_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_isRet = predecoder_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_0_jumpTarget = predecoder_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_valid = predecoder_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_isBr = predecoder_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_isJal = predecoder_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_isJalr = predecoder_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_isCall = predecoder_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_isRet = predecoder_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_1_jumpTarget = predecoder_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_valid = predecoder_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_isBr = predecoder_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_isJal = predecoder_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_isJalr = predecoder_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_isCall = predecoder_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_isRet = predecoder_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_2_jumpTarget = predecoder_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_valid = predecoder_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_isBr = predecoder_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_isJal = predecoder_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_isJalr = predecoder_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_isCall = predecoder_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_isRet = predecoder_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_pdInfo_3_jumpTarget = predecoder_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_enqMask_0 = predecoder_io_out_bits_enqMask_0; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_enqMask_1 = predecoder_io_out_bits_enqMask_1; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_enqMask_2 = predecoder_io_out_bits_enqMask_2; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_out_bits_enqMask_3 = predecoder_io_out_bits_enqMask_3; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign io_frontend_redirect_valid = predecoder_io_out_bits_frontendRedirect_valid & predecoder_io_out_valid; // @[src/main/scala/frontend/IFU.scala 141:80]
  assign io_frontend_redirect_target = predecoder_io_out_bits_frontendRedirect_target; // @[src/main/scala/frontend/IFU.scala 143:31]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_predictReq_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 57:24]
  assign bpu_io_predictFire = io_icache_req_ready & bpuInfoQueue_io_enq_ready & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 77:93]
  assign bpu_io_update_pd_valid = predecoder_io_out_ready & predecoder_io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign bpu_io_update_pd_pc = predecoder_io_out_bits_bpuUpdate_pc; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign bpu_io_update_pd_target = predecoder_io_out_bits_bpuUpdate_target; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign bpu_io_update_pd_isJalr = predecoder_io_out_bits_bpuUpdate_isJalr; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign bpu_io_update_pd_isJal = predecoder_io_out_bits_bpuUpdate_isJal; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign bpu_io_update_pd_isCall = predecoder_io_out_bits_bpuUpdate_isCall; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign bpu_io_update_pd_isRet = predecoder_io_out_bits_bpuUpdate_isRet; // @[src/main/scala/frontend/IFU.scala 147:20]
  assign predecoder_clock = clock;
  assign predecoder_reset = reset;
  assign predecoder_io_flush = io_frontend_redirect_valid; // @[src/main/scala/frontend/IFU.scala 132:55]
  assign predecoder_io_icacheResp_valid = io_icache_resp_valid; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instrs_0 = io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instrs_1 = io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instrs_2 = io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instrs_3 = io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instvalids_0 = io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instvalids_1 = io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instvalids_2 = io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_instvalids_3 = io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_icacheResp_bits_addr = io_icache_resp_bits_addr; // @[src/main/scala/frontend/IFU.scala 129:28]
  assign predecoder_io_bpuInfo_fallThrough = bpuInfoQueue_io_deq_bits_fallThrough; // @[src/main/scala/frontend/IFU.scala 130:30]
  assign predecoder_io_bpuInfo_taken = bpuInfoQueue_io_deq_bits_taken; // @[src/main/scala/frontend/IFU.scala 130:30]
  assign predecoder_io_bpuInfo_target = bpuInfoQueue_io_deq_bits_target; // @[src/main/scala/frontend/IFU.scala 130:30]
  assign predecoder_io_bpuInfo_takenOffset = bpuInfoQueue_io_deq_bits_takenOffset; // @[src/main/scala/frontend/IFU.scala 130:30]
  assign predecoder_io_bpuInfoValid = bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/IFU.scala 131:30]
  assign predecoder_io_out_ready = io_out_ready; // @[src/main/scala/frontend/IFU.scala 135:10]
  assign bpuInfoQueue_clock = clock;
  assign bpuInfoQueue_reset = reset;
  assign bpuInfoQueue_io_enq_valid = io_icache_req_ready & bpuInfoQueue_io_enq_ready & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 77:93]
  assign bpuInfoQueue_io_enq_bits_fallThrough = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 51:26]
  assign bpuInfoQueue_io_enq_bits_taken = bpu_io_predictResp_taken; // @[src/main/scala/frontend/IFU.scala 101:29 104:31]
  assign bpuInfoQueue_io_enq_bits_target = bpu_io_predictResp_target; // @[src/main/scala/frontend/IFU.scala 101:29 105:31]
  assign bpuInfoQueue_io_enq_bits_takenOffset = bpu_io_predictResp_takenOffset; // @[src/main/scala/frontend/IFU.scala 101:29 106:31]
  assign bpuInfoQueue_io_deq_ready = processResp & predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/IFU.scala 126:44]
  assign bpuInfoQueue_io_flush = io_frontend_redirect_valid; // @[src/main/scala/frontend/IFU.scala 111:53]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/IFU.scala 43:25]
      pcReg <= 32'h1c000000; // @[src/main/scala/frontend/IFU.scala 43:25]
    end else if (pc_fire | io_frontend_redirect_valid) begin // @[src/main/scala/frontend/IFU.scala 90:34]
      if (io_frontend_redirect_valid) begin // @[src/main/scala/frontend/IFU.scala 72:19]
        pcReg <= io_frontend_redirect_target;
      end else if (bpu_io_predictResp_taken) begin // @[src/main/scala/frontend/IFU.scala 73:19]
        pcReg <= bpu_io_predictResp_target;
      end else begin
        pcReg <= seqPC;
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
  pcReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
