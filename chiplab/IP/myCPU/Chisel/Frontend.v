module Frontend(
  input         clock,
  input         reset,
  input         io_out_0_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_0_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_0_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_out_1_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_1_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_1_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_out_2_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_2_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_2_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_redirect_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [3:0]  io_axi_master_ar_data_arid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_axi_master_ar_data_araddr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [7:0]  io_axi_master_ar_data_arlen, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [2:0]  io_axi_master_ar_data_arsize, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [1:0]  io_axi_master_ar_data_arburst, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_axi_master_ar_data_arvalid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_axi_master_ar_arready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input  [3:0]  io_axi_master_r_data_rid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input  [31:0] io_axi_master_r_data_rdata, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_axi_master_r_data_rlast, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_axi_master_r_data_rvalid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_axi_master_r_rready // @[src/main/scala/frontend/Frontend.scala 13:14]
);
  wire  bpu_clock; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_reset; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_predictReq_nextPC; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_predictReq_pc; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_taken; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_predictResp_target; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [1:0] bpu_io_predictResp_takenOffset; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_btbHit; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_btbIsJalr; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_btbIsJal; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_btbIsCall; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_btbIsRet; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [1:0] bpu_io_predictResp_meta_btbOffset; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [1:0] bpu_io_predictResp_meta_phtCounter; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [2:0] bpu_io_predictResp_meta_rasTop; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictResp_meta_predTaken; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_predictResp_meta_predTarget; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_predictFire; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_update_pd_valid; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_update_pd_pc; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire [31:0] bpu_io_update_pd_target; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_update_pd_isJalr; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_update_pd_isJal; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_update_pd_isCall; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_update_pd_isRet; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  bpu_io_rasRestore; // @[src/main/scala/frontend/Frontend.scala 28:25]
  wire  ifu_clock; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_reset; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_redirect_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_frontendRedirect_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_frontendRedirect_target; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_predictReq_nextPC; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_predictReq_pc; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictFire; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_taken; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_predictResp_target; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [1:0] ifu_io_predictResp_takenOffset; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_btbHit; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_btbIsJalr; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_btbIsJal; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_btbIsCall; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_btbIsRet; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [1:0] ifu_io_predictResp_meta_btbOffset; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [1:0] ifu_io_predictResp_meta_phtCounter; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [2:0] ifu_io_predictResp_meta_rasTop; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_predictResp_meta_predTaken; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_predictResp_meta_predTarget; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_icache_req_addr; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_icache_req_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_icache_req_ready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_icache_req_flush; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_bpuInfoQueuEnq_ready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_bpuInfoQueuEnq_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_bpuInfoQueuEnq_bits_fallThrough; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ifu_io_bpuInfoQueuEnq_bits_taken; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] ifu_io_bpuInfoQueuEnq_bits_target; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [1:0] ifu_io_bpuInfoQueuEnq_bits_takenOffset; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  bpuInfoQueue_clock; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_reset; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_enq_ready; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_enq_valid; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [31:0] bpuInfoQueue_io_enq_bits_fallThrough; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_enq_bits_taken; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [31:0] bpuInfoQueue_io_enq_bits_target; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [1:0] bpuInfoQueue_io_enq_bits_takenOffset; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_deq_ready; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [31:0] bpuInfoQueue_io_deq_bits_fallThrough; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_deq_bits_taken; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [31:0] bpuInfoQueue_io_deq_bits_target; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire [1:0] bpuInfoQueue_io_deq_bits_takenOffset; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  bpuInfoQueue_io_flush; // @[src/main/scala/frontend/Frontend.scala 32:28]
  wire  icache_clock; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_reset; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_redirect; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_cpu_req_ready; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_cpu_req_valid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_cpu_req_bits_addr; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_ready; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_valid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_icache_resp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [3:0] icache_io_axi_master_ar_data_arid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_axi_master_ar_data_araddr; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [7:0] icache_io_axi_master_ar_data_arlen; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [2:0] icache_io_axi_master_ar_data_arsize; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [1:0] icache_io_axi_master_ar_data_arburst; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [3:0] icache_io_axi_master_r_data_rid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire [31:0] icache_io_axi_master_r_data_rdata; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_axi_master_r_data_rlast; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_axi_master_r_data_rvalid; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/frontend/Frontend.scala 33:24]
  wire  predecoder_clock; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_reset; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_flush; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_icacheResp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_icacheResp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_icacheResp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_bpuInfo_fallThrough; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_bpuInfo_taken; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_bpuInfo_target; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [1:0] predecoder_io_bpuInfo_takenOffset; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_bpuInfoValid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_ready; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_frontendRedirect_valid; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_frontendRedirect_target; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_bpuUpdate_pc; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire [31:0] predecoder_io_out_bits_bpuUpdate_target; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_bpuUpdate_isJalr; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_bpuUpdate_isJal; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_bpuUpdate_isCall; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  predecoder_io_out_bits_bpuUpdate_isRet; // @[src/main/scala/frontend/Frontend.scala 35:26]
  wire  ibuffer_clock; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_reset; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_ready; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_in_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_ready; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_0_bits_instr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_0_bits_pc; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_ready; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_1_bits_instr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_1_bits_pc; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_ready; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_2_bits_instr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_2_bits_pc; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire [31:0] ibuffer_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  ibuffer_io_flush; // @[src/main/scala/frontend/Frontend.scala 36:24]
  wire  frontendRedirectValid = predecoder_io_out_bits_frontendRedirect_valid & predecoder_io_out_valid; // @[src/main/scala/frontend/Frontend.scala 37:78]
  wire  processResp = icache_io_icache_resp_valid & bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/Frontend.scala 89:51]
  BPU bpu ( // @[src/main/scala/frontend/Frontend.scala 28:25]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_predictReq_nextPC(bpu_io_predictReq_nextPC),
    .io_predictReq_pc(bpu_io_predictReq_pc),
    .io_predictResp_taken(bpu_io_predictResp_taken),
    .io_predictResp_target(bpu_io_predictResp_target),
    .io_predictResp_takenOffset(bpu_io_predictResp_takenOffset),
    .io_predictResp_meta_btbHit(bpu_io_predictResp_meta_btbHit),
    .io_predictResp_meta_btbIsJalr(bpu_io_predictResp_meta_btbIsJalr),
    .io_predictResp_meta_btbIsJal(bpu_io_predictResp_meta_btbIsJal),
    .io_predictResp_meta_btbIsCall(bpu_io_predictResp_meta_btbIsCall),
    .io_predictResp_meta_btbIsRet(bpu_io_predictResp_meta_btbIsRet),
    .io_predictResp_meta_btbOffset(bpu_io_predictResp_meta_btbOffset),
    .io_predictResp_meta_phtCounter(bpu_io_predictResp_meta_phtCounter),
    .io_predictResp_meta_rasTop(bpu_io_predictResp_meta_rasTop),
    .io_predictResp_meta_predTaken(bpu_io_predictResp_meta_predTaken),
    .io_predictResp_meta_predTarget(bpu_io_predictResp_meta_predTarget),
    .io_predictFire(bpu_io_predictFire),
    .io_update_pd_valid(bpu_io_update_pd_valid),
    .io_update_pd_pc(bpu_io_update_pd_pc),
    .io_update_pd_target(bpu_io_update_pd_target),
    .io_update_pd_isJalr(bpu_io_update_pd_isJalr),
    .io_update_pd_isJal(bpu_io_update_pd_isJal),
    .io_update_pd_isCall(bpu_io_update_pd_isCall),
    .io_update_pd_isRet(bpu_io_update_pd_isRet),
    .io_rasRestore(bpu_io_rasRestore)
  );
  IFU ifu ( // @[src/main/scala/frontend/Frontend.scala 29:24]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_redirect_valid(ifu_io_redirect_valid),
    .io_frontendRedirect_valid(ifu_io_frontendRedirect_valid),
    .io_frontendRedirect_target(ifu_io_frontendRedirect_target),
    .io_predictReq_nextPC(ifu_io_predictReq_nextPC),
    .io_predictReq_pc(ifu_io_predictReq_pc),
    .io_predictFire(ifu_io_predictFire),
    .io_predictResp_taken(ifu_io_predictResp_taken),
    .io_predictResp_target(ifu_io_predictResp_target),
    .io_predictResp_takenOffset(ifu_io_predictResp_takenOffset),
    .io_predictResp_meta_btbHit(ifu_io_predictResp_meta_btbHit),
    .io_predictResp_meta_btbIsJalr(ifu_io_predictResp_meta_btbIsJalr),
    .io_predictResp_meta_btbIsJal(ifu_io_predictResp_meta_btbIsJal),
    .io_predictResp_meta_btbIsCall(ifu_io_predictResp_meta_btbIsCall),
    .io_predictResp_meta_btbIsRet(ifu_io_predictResp_meta_btbIsRet),
    .io_predictResp_meta_btbOffset(ifu_io_predictResp_meta_btbOffset),
    .io_predictResp_meta_phtCounter(ifu_io_predictResp_meta_phtCounter),
    .io_predictResp_meta_rasTop(ifu_io_predictResp_meta_rasTop),
    .io_predictResp_meta_predTaken(ifu_io_predictResp_meta_predTaken),
    .io_predictResp_meta_predTarget(ifu_io_predictResp_meta_predTarget),
    .io_icache_req_addr(ifu_io_icache_req_addr),
    .io_icache_req_valid(ifu_io_icache_req_valid),
    .io_icache_req_ready(ifu_io_icache_req_ready),
    .io_icache_req_flush(ifu_io_icache_req_flush),
    .io_bpuInfoQueuEnq_ready(ifu_io_bpuInfoQueuEnq_ready),
    .io_bpuInfoQueuEnq_valid(ifu_io_bpuInfoQueuEnq_valid),
    .io_bpuInfoQueuEnq_bits_fallThrough(ifu_io_bpuInfoQueuEnq_bits_fallThrough),
    .io_bpuInfoQueuEnq_bits_taken(ifu_io_bpuInfoQueuEnq_bits_taken),
    .io_bpuInfoQueuEnq_bits_target(ifu_io_bpuInfoQueuEnq_bits_target),
    .io_bpuInfoQueuEnq_bits_takenOffset(ifu_io_bpuInfoQueuEnq_bits_takenOffset)
  );
  FlushableQueue bpuInfoQueue ( // @[src/main/scala/frontend/Frontend.scala 32:28]
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
  ICache icache ( // @[src/main/scala/frontend/Frontend.scala 33:24]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_redirect(icache_io_redirect),
    .io_cpu_req_ready(icache_io_cpu_req_ready),
    .io_cpu_req_valid(icache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(icache_io_cpu_req_bits_addr),
    .io_icache_resp_ready(icache_io_icache_resp_ready),
    .io_icache_resp_valid(icache_io_icache_resp_valid),
    .io_icache_resp_bits_instrs_0(icache_io_icache_resp_bits_instrs_0),
    .io_icache_resp_bits_instrs_1(icache_io_icache_resp_bits_instrs_1),
    .io_icache_resp_bits_instrs_2(icache_io_icache_resp_bits_instrs_2),
    .io_icache_resp_bits_instrs_3(icache_io_icache_resp_bits_instrs_3),
    .io_icache_resp_bits_instvalids_0(icache_io_icache_resp_bits_instvalids_0),
    .io_icache_resp_bits_instvalids_1(icache_io_icache_resp_bits_instvalids_1),
    .io_icache_resp_bits_instvalids_2(icache_io_icache_resp_bits_instvalids_2),
    .io_icache_resp_bits_instvalids_3(icache_io_icache_resp_bits_instvalids_3),
    .io_icache_resp_bits_addr(icache_io_icache_resp_bits_addr),
    .io_axi_master_ar_data_arid(icache_io_axi_master_ar_data_arid),
    .io_axi_master_ar_data_araddr(icache_io_axi_master_ar_data_araddr),
    .io_axi_master_ar_data_arlen(icache_io_axi_master_ar_data_arlen),
    .io_axi_master_ar_data_arsize(icache_io_axi_master_ar_data_arsize),
    .io_axi_master_ar_data_arburst(icache_io_axi_master_ar_data_arburst),
    .io_axi_master_ar_data_arvalid(icache_io_axi_master_ar_data_arvalid),
    .io_axi_master_ar_arready(icache_io_axi_master_ar_arready),
    .io_axi_master_r_data_rid(icache_io_axi_master_r_data_rid),
    .io_axi_master_r_data_rdata(icache_io_axi_master_r_data_rdata),
    .io_axi_master_r_data_rlast(icache_io_axi_master_r_data_rlast),
    .io_axi_master_r_data_rvalid(icache_io_axi_master_r_data_rvalid),
    .io_axi_master_r_rready(icache_io_axi_master_r_rready)
  );
  Predecoder predecoder ( // @[src/main/scala/frontend/Frontend.scala 35:26]
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
  IBF ibuffer ( // @[src/main/scala/frontend/Frontend.scala 36:24]
    .clock(ibuffer_clock),
    .reset(ibuffer_reset),
    .io_in_ready(ibuffer_io_in_ready),
    .io_in_valid(ibuffer_io_in_valid),
    .io_in_bits_instrs_0(ibuffer_io_in_bits_instrs_0),
    .io_in_bits_instrs_1(ibuffer_io_in_bits_instrs_1),
    .io_in_bits_instrs_2(ibuffer_io_in_bits_instrs_2),
    .io_in_bits_instrs_3(ibuffer_io_in_bits_instrs_3),
    .io_in_bits_pcs_0(ibuffer_io_in_bits_pcs_0),
    .io_in_bits_pcs_1(ibuffer_io_in_bits_pcs_1),
    .io_in_bits_pcs_2(ibuffer_io_in_bits_pcs_2),
    .io_in_bits_pcs_3(ibuffer_io_in_bits_pcs_3),
    .io_in_bits_pdInfo_0_valid(ibuffer_io_in_bits_pdInfo_0_valid),
    .io_in_bits_pdInfo_0_isBr(ibuffer_io_in_bits_pdInfo_0_isBr),
    .io_in_bits_pdInfo_0_isJal(ibuffer_io_in_bits_pdInfo_0_isJal),
    .io_in_bits_pdInfo_0_isJalr(ibuffer_io_in_bits_pdInfo_0_isJalr),
    .io_in_bits_pdInfo_0_isCall(ibuffer_io_in_bits_pdInfo_0_isCall),
    .io_in_bits_pdInfo_0_isRet(ibuffer_io_in_bits_pdInfo_0_isRet),
    .io_in_bits_pdInfo_0_jumpTarget(ibuffer_io_in_bits_pdInfo_0_jumpTarget),
    .io_in_bits_pdInfo_1_valid(ibuffer_io_in_bits_pdInfo_1_valid),
    .io_in_bits_pdInfo_1_isBr(ibuffer_io_in_bits_pdInfo_1_isBr),
    .io_in_bits_pdInfo_1_isJal(ibuffer_io_in_bits_pdInfo_1_isJal),
    .io_in_bits_pdInfo_1_isJalr(ibuffer_io_in_bits_pdInfo_1_isJalr),
    .io_in_bits_pdInfo_1_isCall(ibuffer_io_in_bits_pdInfo_1_isCall),
    .io_in_bits_pdInfo_1_isRet(ibuffer_io_in_bits_pdInfo_1_isRet),
    .io_in_bits_pdInfo_1_jumpTarget(ibuffer_io_in_bits_pdInfo_1_jumpTarget),
    .io_in_bits_pdInfo_2_valid(ibuffer_io_in_bits_pdInfo_2_valid),
    .io_in_bits_pdInfo_2_isBr(ibuffer_io_in_bits_pdInfo_2_isBr),
    .io_in_bits_pdInfo_2_isJal(ibuffer_io_in_bits_pdInfo_2_isJal),
    .io_in_bits_pdInfo_2_isJalr(ibuffer_io_in_bits_pdInfo_2_isJalr),
    .io_in_bits_pdInfo_2_isCall(ibuffer_io_in_bits_pdInfo_2_isCall),
    .io_in_bits_pdInfo_2_isRet(ibuffer_io_in_bits_pdInfo_2_isRet),
    .io_in_bits_pdInfo_2_jumpTarget(ibuffer_io_in_bits_pdInfo_2_jumpTarget),
    .io_in_bits_pdInfo_3_valid(ibuffer_io_in_bits_pdInfo_3_valid),
    .io_in_bits_pdInfo_3_isBr(ibuffer_io_in_bits_pdInfo_3_isBr),
    .io_in_bits_pdInfo_3_isJal(ibuffer_io_in_bits_pdInfo_3_isJal),
    .io_in_bits_pdInfo_3_isJalr(ibuffer_io_in_bits_pdInfo_3_isJalr),
    .io_in_bits_pdInfo_3_isCall(ibuffer_io_in_bits_pdInfo_3_isCall),
    .io_in_bits_pdInfo_3_isRet(ibuffer_io_in_bits_pdInfo_3_isRet),
    .io_in_bits_pdInfo_3_jumpTarget(ibuffer_io_in_bits_pdInfo_3_jumpTarget),
    .io_in_bits_enqMask_0(ibuffer_io_in_bits_enqMask_0),
    .io_in_bits_enqMask_1(ibuffer_io_in_bits_enqMask_1),
    .io_in_bits_enqMask_2(ibuffer_io_in_bits_enqMask_2),
    .io_in_bits_enqMask_3(ibuffer_io_in_bits_enqMask_3),
    .io_out_0_ready(ibuffer_io_out_0_ready),
    .io_out_0_valid(ibuffer_io_out_0_valid),
    .io_out_0_bits_instr(ibuffer_io_out_0_bits_instr),
    .io_out_0_bits_pc(ibuffer_io_out_0_bits_pc),
    .io_out_0_bits_pdInfo_valid(ibuffer_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(ibuffer_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(ibuffer_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(ibuffer_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(ibuffer_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(ibuffer_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(ibuffer_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_1_ready(ibuffer_io_out_1_ready),
    .io_out_1_valid(ibuffer_io_out_1_valid),
    .io_out_1_bits_instr(ibuffer_io_out_1_bits_instr),
    .io_out_1_bits_pc(ibuffer_io_out_1_bits_pc),
    .io_out_1_bits_pdInfo_valid(ibuffer_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(ibuffer_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(ibuffer_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(ibuffer_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(ibuffer_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(ibuffer_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(ibuffer_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_2_ready(ibuffer_io_out_2_ready),
    .io_out_2_valid(ibuffer_io_out_2_valid),
    .io_out_2_bits_instr(ibuffer_io_out_2_bits_instr),
    .io_out_2_bits_pc(ibuffer_io_out_2_bits_pc),
    .io_out_2_bits_pdInfo_valid(ibuffer_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(ibuffer_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(ibuffer_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(ibuffer_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(ibuffer_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(ibuffer_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(ibuffer_io_out_2_bits_pdInfo_jumpTarget),
    .io_flush(ibuffer_io_flush)
  );
  assign io_out_0_valid = ibuffer_io_out_0_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_instr = ibuffer_io_out_0_bits_instr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pc = ibuffer_io_out_0_bits_pc; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_valid = ibuffer_io_out_0_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_isBr = ibuffer_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_isJal = ibuffer_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_isJalr = ibuffer_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_isCall = ibuffer_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_isRet = ibuffer_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_pdInfo_jumpTarget = ibuffer_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_0_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_valid = ibuffer_io_out_1_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_instr = ibuffer_io_out_1_bits_instr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pc = ibuffer_io_out_1_bits_pc; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_valid = ibuffer_io_out_1_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_isBr = ibuffer_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_isJal = ibuffer_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_isJalr = ibuffer_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_isCall = ibuffer_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_isRet = ibuffer_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_pdInfo_jumpTarget = ibuffer_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_1_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_valid = ibuffer_io_out_2_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_instr = ibuffer_io_out_2_bits_instr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pc = ibuffer_io_out_2_bits_pc; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_valid = ibuffer_io_out_2_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_isBr = ibuffer_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_isJal = ibuffer_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_isJalr = ibuffer_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_isCall = ibuffer_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_isRet = ibuffer_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_pdInfo_jumpTarget = ibuffer_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_out_2_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign io_axi_master_ar_data_arid = icache_io_axi_master_ar_data_arid; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_ar_data_araddr = icache_io_axi_master_ar_data_araddr; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_ar_data_arlen = icache_io_axi_master_ar_data_arlen; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_ar_data_arsize = icache_io_axi_master_ar_data_arsize; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_ar_data_arburst = icache_io_axi_master_ar_data_arburst; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_ar_data_arvalid = icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign io_axi_master_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_predictReq_nextPC = ifu_io_predictReq_nextPC; // @[src/main/scala/frontend/Frontend.scala 47:21]
  assign bpu_io_predictReq_pc = ifu_io_predictReq_pc; // @[src/main/scala/frontend/Frontend.scala 47:21]
  assign bpu_io_predictFire = ifu_io_predictFire; // @[src/main/scala/frontend/Frontend.scala 48:22]
  assign bpu_io_update_pd_valid = predecoder_io_out_ready & predecoder_io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign bpu_io_update_pd_pc = predecoder_io_out_bits_bpuUpdate_pc; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_update_pd_target = predecoder_io_out_bits_bpuUpdate_target; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_update_pd_isJalr = predecoder_io_out_bits_bpuUpdate_isJalr; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_update_pd_isJal = predecoder_io_out_bits_bpuUpdate_isJal; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_update_pd_isCall = predecoder_io_out_bits_bpuUpdate_isCall; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_update_pd_isRet = predecoder_io_out_bits_bpuUpdate_isRet; // @[src/main/scala/frontend/Frontend.scala 53:20]
  assign bpu_io_rasRestore = io_redirect_valid; // @[src/main/scala/frontend/Frontend.scala 62:25]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_redirect_valid = io_redirect_valid; // @[src/main/scala/frontend/Frontend.scala 116:25]
  assign ifu_io_frontendRedirect_valid = frontendRedirectValid; // @[src/main/scala/frontend/Frontend.scala 44:33]
  assign ifu_io_frontendRedirect_target = predecoder_io_out_bits_frontendRedirect_target; // @[src/main/scala/frontend/Frontend.scala 45:34]
  assign ifu_io_predictResp_taken = bpu_io_predictResp_taken; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_target = bpu_io_predictResp_target; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_takenOffset = bpu_io_predictResp_takenOffset; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbHit = bpu_io_predictResp_meta_btbHit; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbIsJalr = bpu_io_predictResp_meta_btbIsJalr; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbIsJal = bpu_io_predictResp_meta_btbIsJal; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbIsCall = bpu_io_predictResp_meta_btbIsCall; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbIsRet = bpu_io_predictResp_meta_btbIsRet; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_btbOffset = bpu_io_predictResp_meta_btbOffset; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_phtCounter = bpu_io_predictResp_meta_phtCounter; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_rasTop = bpu_io_predictResp_meta_rasTop; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_predTaken = bpu_io_predictResp_meta_predTaken; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_predictResp_meta_predTarget = bpu_io_predictResp_meta_predTarget; // @[src/main/scala/frontend/Frontend.scala 50:22]
  assign ifu_io_icache_req_ready = icache_io_cpu_req_ready; // @[src/main/scala/frontend/Frontend.scala 74:27]
  assign ifu_io_bpuInfoQueuEnq_ready = bpuInfoQueue_io_enq_ready; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_clock = clock;
  assign bpuInfoQueue_reset = reset;
  assign bpuInfoQueue_io_enq_valid = ifu_io_bpuInfoQueuEnq_valid; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_io_enq_bits_fallThrough = ifu_io_bpuInfoQueuEnq_bits_fallThrough; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_io_enq_bits_taken = ifu_io_bpuInfoQueuEnq_bits_taken; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_io_enq_bits_target = ifu_io_bpuInfoQueuEnq_bits_target; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_io_enq_bits_takenOffset = ifu_io_bpuInfoQueuEnq_bits_takenOffset; // @[src/main/scala/frontend/Frontend.scala 82:23]
  assign bpuInfoQueue_io_deq_ready = processResp & predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/Frontend.scala 90:46]
  assign bpuInfoQueue_io_flush = io_redirect_valid | frontendRedirectValid; // @[src/main/scala/frontend/Frontend.scala 83:49]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_redirect = ifu_io_icache_req_flush; // @[src/main/scala/frontend/Frontend.scala 75:22]
  assign icache_io_cpu_req_valid = ifu_io_icache_req_valid; // @[src/main/scala/frontend/Frontend.scala 72:27]
  assign icache_io_cpu_req_bits_addr = ifu_io_icache_req_addr; // @[src/main/scala/frontend/Frontend.scala 73:31]
  assign icache_io_icache_resp_ready = predecoder_io_icacheResp_ready; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign icache_io_axi_master_ar_arready = io_axi_master_ar_arready; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign icache_io_axi_master_r_data_rid = io_axi_master_r_data_rid; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign icache_io_axi_master_r_data_rdata = io_axi_master_r_data_rdata; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign icache_io_axi_master_r_data_rlast = io_axi_master_r_data_rlast; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign icache_io_axi_master_r_data_rvalid = io_axi_master_r_data_rvalid; // @[src/main/scala/frontend/Frontend.scala 124:17]
  assign predecoder_clock = clock;
  assign predecoder_reset = reset;
  assign predecoder_io_flush = io_redirect_valid | frontendRedirectValid; // @[src/main/scala/frontend/Frontend.scala 105:57]
  assign predecoder_io_icacheResp_valid = icache_io_icache_resp_valid; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instrs_0 = icache_io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instrs_1 = icache_io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instrs_2 = icache_io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instrs_3 = icache_io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instvalids_0 = icache_io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instvalids_1 = icache_io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instvalids_2 = icache_io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_instvalids_3 = icache_io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_icacheResp_bits_addr = icache_io_icache_resp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 100:30]
  assign predecoder_io_bpuInfo_fallThrough = bpuInfoQueue_io_deq_bits_fallThrough; // @[src/main/scala/frontend/Frontend.scala 92:32]
  assign predecoder_io_bpuInfo_taken = bpuInfoQueue_io_deq_bits_taken; // @[src/main/scala/frontend/Frontend.scala 92:32]
  assign predecoder_io_bpuInfo_target = bpuInfoQueue_io_deq_bits_target; // @[src/main/scala/frontend/Frontend.scala 92:32]
  assign predecoder_io_bpuInfo_takenOffset = bpuInfoQueue_io_deq_bits_takenOffset; // @[src/main/scala/frontend/Frontend.scala 92:32]
  assign predecoder_io_bpuInfoValid = bpuInfoQueue_io_deq_valid; // @[src/main/scala/frontend/Frontend.scala 93:32]
  assign predecoder_io_out_ready = ibuffer_io_in_ready; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_clock = clock;
  assign ibuffer_reset = reset;
  assign ibuffer_io_in_valid = predecoder_io_out_valid; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_instrs_0 = predecoder_io_out_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_instrs_1 = predecoder_io_out_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_instrs_2 = predecoder_io_out_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_instrs_3 = predecoder_io_out_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pcs_0 = predecoder_io_out_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pcs_1 = predecoder_io_out_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pcs_2 = predecoder_io_out_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pcs_3 = predecoder_io_out_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_valid = predecoder_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_isBr = predecoder_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_isJal = predecoder_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_isJalr = predecoder_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_isCall = predecoder_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_isRet = predecoder_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_0_jumpTarget = predecoder_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_valid = predecoder_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_isBr = predecoder_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_isJal = predecoder_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_isJalr = predecoder_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_isCall = predecoder_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_isRet = predecoder_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_1_jumpTarget = predecoder_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_valid = predecoder_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_isBr = predecoder_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_isJal = predecoder_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_isJalr = predecoder_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_isCall = predecoder_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_isRet = predecoder_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_2_jumpTarget = predecoder_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_valid = predecoder_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_isBr = predecoder_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_isJal = predecoder_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_isJalr = predecoder_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_isCall = predecoder_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_isRet = predecoder_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_pdInfo_3_jumpTarget = predecoder_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_enqMask_0 = predecoder_io_out_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_enqMask_1 = predecoder_io_out_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_enqMask_2 = predecoder_io_out_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_in_bits_enqMask_3 = predecoder_io_out_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 109:17]
  assign ibuffer_io_out_0_ready = io_out_0_ready; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign ibuffer_io_out_1_ready = io_out_1_ready; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign ibuffer_io_out_2_ready = io_out_2_ready; // @[src/main/scala/frontend/Frontend.scala 112:10]
  assign ibuffer_io_flush = io_redirect_valid; // @[src/main/scala/frontend/Frontend.scala 121:20]
endmodule
