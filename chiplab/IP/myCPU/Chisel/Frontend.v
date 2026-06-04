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
  input         io_out_3_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_3_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_3_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_3_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_3_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_out_4_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_4_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_4_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_4_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_4_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
  input         io_out_5_ready, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_5_bits_instr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_5_bits_pc, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_valid, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_isBr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_isJal, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_isJalr, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_isCall, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_pdInfo_isRet, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output [31:0] io_out_5_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_exception_excpTlbPif, // @[src/main/scala/frontend/Frontend.scala 13:14]
  output        io_out_5_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/Frontend.scala 13:14]
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
  wire  ifu_clock; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_reset; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_req_addr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_req_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_req_ready; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_req_flush; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_ready; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_icache_resp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_ready; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_out_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  ifu_io_frontend_redirect_valid; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire [31:0] ifu_io_frontend_redirect_target; // @[src/main/scala/frontend/Frontend.scala 28:24]
  wire  icache_clock; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_reset; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_redirect; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_cpu_req_ready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_cpu_req_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_cpu_req_bits_addr; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_ready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_valid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_icache_resp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [3:0] icache_io_axi_master_ar_data_arid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_axi_master_ar_data_araddr; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [7:0] icache_io_axi_master_ar_data_arlen; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [2:0] icache_io_axi_master_ar_data_arsize; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [1:0] icache_io_axi_master_ar_data_arburst; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [3:0] icache_io_axi_master_r_data_rid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire [31:0] icache_io_axi_master_r_data_rdata; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_axi_master_r_data_rlast; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_axi_master_r_data_rvalid; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/frontend/Frontend.scala 29:24]
  wire  ibuffer_clock; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_reset; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_in_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_0_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_0_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_1_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_1_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_2_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_2_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_3_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_3_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_3_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_3_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_4_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_4_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_4_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_4_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_ready; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_5_bits_instr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_5_bits_pc; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire  ibuffer_io_out_5_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 30:24]
  wire [31:0] ibuffer_io_out_5_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 30:24]
  IFU ifu ( // @[src/main/scala/frontend/Frontend.scala 28:24]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_icache_req_addr(ifu_io_icache_req_addr),
    .io_icache_req_valid(ifu_io_icache_req_valid),
    .io_icache_req_ready(ifu_io_icache_req_ready),
    .io_icache_req_flush(ifu_io_icache_req_flush),
    .io_icache_resp_ready(ifu_io_icache_resp_ready),
    .io_icache_resp_valid(ifu_io_icache_resp_valid),
    .io_icache_resp_bits_instrs_0(ifu_io_icache_resp_bits_instrs_0),
    .io_icache_resp_bits_instrs_1(ifu_io_icache_resp_bits_instrs_1),
    .io_icache_resp_bits_instrs_2(ifu_io_icache_resp_bits_instrs_2),
    .io_icache_resp_bits_instrs_3(ifu_io_icache_resp_bits_instrs_3),
    .io_icache_resp_bits_instvalids_0(ifu_io_icache_resp_bits_instvalids_0),
    .io_icache_resp_bits_instvalids_1(ifu_io_icache_resp_bits_instvalids_1),
    .io_icache_resp_bits_instvalids_2(ifu_io_icache_resp_bits_instvalids_2),
    .io_icache_resp_bits_instvalids_3(ifu_io_icache_resp_bits_instvalids_3),
    .io_icache_resp_bits_addr(ifu_io_icache_resp_bits_addr),
    .io_out_ready(ifu_io_out_ready),
    .io_out_valid(ifu_io_out_valid),
    .io_out_bits_instrs_0(ifu_io_out_bits_instrs_0),
    .io_out_bits_instrs_1(ifu_io_out_bits_instrs_1),
    .io_out_bits_instrs_2(ifu_io_out_bits_instrs_2),
    .io_out_bits_instrs_3(ifu_io_out_bits_instrs_3),
    .io_out_bits_pcs_0(ifu_io_out_bits_pcs_0),
    .io_out_bits_pcs_1(ifu_io_out_bits_pcs_1),
    .io_out_bits_pcs_2(ifu_io_out_bits_pcs_2),
    .io_out_bits_pcs_3(ifu_io_out_bits_pcs_3),
    .io_out_bits_pdInfo_0_valid(ifu_io_out_bits_pdInfo_0_valid),
    .io_out_bits_pdInfo_0_isBr(ifu_io_out_bits_pdInfo_0_isBr),
    .io_out_bits_pdInfo_0_isJal(ifu_io_out_bits_pdInfo_0_isJal),
    .io_out_bits_pdInfo_0_isJalr(ifu_io_out_bits_pdInfo_0_isJalr),
    .io_out_bits_pdInfo_0_isCall(ifu_io_out_bits_pdInfo_0_isCall),
    .io_out_bits_pdInfo_0_isRet(ifu_io_out_bits_pdInfo_0_isRet),
    .io_out_bits_pdInfo_0_jumpTarget(ifu_io_out_bits_pdInfo_0_jumpTarget),
    .io_out_bits_pdInfo_1_valid(ifu_io_out_bits_pdInfo_1_valid),
    .io_out_bits_pdInfo_1_isBr(ifu_io_out_bits_pdInfo_1_isBr),
    .io_out_bits_pdInfo_1_isJal(ifu_io_out_bits_pdInfo_1_isJal),
    .io_out_bits_pdInfo_1_isJalr(ifu_io_out_bits_pdInfo_1_isJalr),
    .io_out_bits_pdInfo_1_isCall(ifu_io_out_bits_pdInfo_1_isCall),
    .io_out_bits_pdInfo_1_isRet(ifu_io_out_bits_pdInfo_1_isRet),
    .io_out_bits_pdInfo_1_jumpTarget(ifu_io_out_bits_pdInfo_1_jumpTarget),
    .io_out_bits_pdInfo_2_valid(ifu_io_out_bits_pdInfo_2_valid),
    .io_out_bits_pdInfo_2_isBr(ifu_io_out_bits_pdInfo_2_isBr),
    .io_out_bits_pdInfo_2_isJal(ifu_io_out_bits_pdInfo_2_isJal),
    .io_out_bits_pdInfo_2_isJalr(ifu_io_out_bits_pdInfo_2_isJalr),
    .io_out_bits_pdInfo_2_isCall(ifu_io_out_bits_pdInfo_2_isCall),
    .io_out_bits_pdInfo_2_isRet(ifu_io_out_bits_pdInfo_2_isRet),
    .io_out_bits_pdInfo_2_jumpTarget(ifu_io_out_bits_pdInfo_2_jumpTarget),
    .io_out_bits_pdInfo_3_valid(ifu_io_out_bits_pdInfo_3_valid),
    .io_out_bits_pdInfo_3_isBr(ifu_io_out_bits_pdInfo_3_isBr),
    .io_out_bits_pdInfo_3_isJal(ifu_io_out_bits_pdInfo_3_isJal),
    .io_out_bits_pdInfo_3_isJalr(ifu_io_out_bits_pdInfo_3_isJalr),
    .io_out_bits_pdInfo_3_isCall(ifu_io_out_bits_pdInfo_3_isCall),
    .io_out_bits_pdInfo_3_isRet(ifu_io_out_bits_pdInfo_3_isRet),
    .io_out_bits_pdInfo_3_jumpTarget(ifu_io_out_bits_pdInfo_3_jumpTarget),
    .io_out_bits_enqMask_0(ifu_io_out_bits_enqMask_0),
    .io_out_bits_enqMask_1(ifu_io_out_bits_enqMask_1),
    .io_out_bits_enqMask_2(ifu_io_out_bits_enqMask_2),
    .io_out_bits_enqMask_3(ifu_io_out_bits_enqMask_3),
    .io_frontend_redirect_valid(ifu_io_frontend_redirect_valid),
    .io_frontend_redirect_target(ifu_io_frontend_redirect_target)
  );
  ICache icache ( // @[src/main/scala/frontend/Frontend.scala 29:24]
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
  IBF ibuffer ( // @[src/main/scala/frontend/Frontend.scala 30:24]
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
    .io_out_3_ready(ibuffer_io_out_3_ready),
    .io_out_3_valid(ibuffer_io_out_3_valid),
    .io_out_3_bits_instr(ibuffer_io_out_3_bits_instr),
    .io_out_3_bits_pc(ibuffer_io_out_3_bits_pc),
    .io_out_3_bits_pdInfo_valid(ibuffer_io_out_3_bits_pdInfo_valid),
    .io_out_3_bits_pdInfo_isBr(ibuffer_io_out_3_bits_pdInfo_isBr),
    .io_out_3_bits_pdInfo_isJal(ibuffer_io_out_3_bits_pdInfo_isJal),
    .io_out_3_bits_pdInfo_isJalr(ibuffer_io_out_3_bits_pdInfo_isJalr),
    .io_out_3_bits_pdInfo_isCall(ibuffer_io_out_3_bits_pdInfo_isCall),
    .io_out_3_bits_pdInfo_isRet(ibuffer_io_out_3_bits_pdInfo_isRet),
    .io_out_3_bits_pdInfo_jumpTarget(ibuffer_io_out_3_bits_pdInfo_jumpTarget),
    .io_out_4_ready(ibuffer_io_out_4_ready),
    .io_out_4_valid(ibuffer_io_out_4_valid),
    .io_out_4_bits_instr(ibuffer_io_out_4_bits_instr),
    .io_out_4_bits_pc(ibuffer_io_out_4_bits_pc),
    .io_out_4_bits_pdInfo_valid(ibuffer_io_out_4_bits_pdInfo_valid),
    .io_out_4_bits_pdInfo_isBr(ibuffer_io_out_4_bits_pdInfo_isBr),
    .io_out_4_bits_pdInfo_isJal(ibuffer_io_out_4_bits_pdInfo_isJal),
    .io_out_4_bits_pdInfo_isJalr(ibuffer_io_out_4_bits_pdInfo_isJalr),
    .io_out_4_bits_pdInfo_isCall(ibuffer_io_out_4_bits_pdInfo_isCall),
    .io_out_4_bits_pdInfo_isRet(ibuffer_io_out_4_bits_pdInfo_isRet),
    .io_out_4_bits_pdInfo_jumpTarget(ibuffer_io_out_4_bits_pdInfo_jumpTarget),
    .io_out_5_ready(ibuffer_io_out_5_ready),
    .io_out_5_valid(ibuffer_io_out_5_valid),
    .io_out_5_bits_instr(ibuffer_io_out_5_bits_instr),
    .io_out_5_bits_pc(ibuffer_io_out_5_bits_pc),
    .io_out_5_bits_pdInfo_valid(ibuffer_io_out_5_bits_pdInfo_valid),
    .io_out_5_bits_pdInfo_isBr(ibuffer_io_out_5_bits_pdInfo_isBr),
    .io_out_5_bits_pdInfo_isJal(ibuffer_io_out_5_bits_pdInfo_isJal),
    .io_out_5_bits_pdInfo_isJalr(ibuffer_io_out_5_bits_pdInfo_isJalr),
    .io_out_5_bits_pdInfo_isCall(ibuffer_io_out_5_bits_pdInfo_isCall),
    .io_out_5_bits_pdInfo_isRet(ibuffer_io_out_5_bits_pdInfo_isRet),
    .io_out_5_bits_pdInfo_jumpTarget(ibuffer_io_out_5_bits_pdInfo_jumpTarget)
  );
  assign io_out_0_valid = ibuffer_io_out_0_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_instr = ibuffer_io_out_0_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pc = ibuffer_io_out_0_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_valid = ibuffer_io_out_0_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_isBr = ibuffer_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_isJal = ibuffer_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_isJalr = ibuffer_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_isCall = ibuffer_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_isRet = ibuffer_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_pdInfo_jumpTarget = ibuffer_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_0_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_valid = ibuffer_io_out_1_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_instr = ibuffer_io_out_1_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pc = ibuffer_io_out_1_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_valid = ibuffer_io_out_1_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_isBr = ibuffer_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_isJal = ibuffer_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_isJalr = ibuffer_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_isCall = ibuffer_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_isRet = ibuffer_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_pdInfo_jumpTarget = ibuffer_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_1_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_valid = ibuffer_io_out_2_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_instr = ibuffer_io_out_2_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pc = ibuffer_io_out_2_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_valid = ibuffer_io_out_2_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_isBr = ibuffer_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_isJal = ibuffer_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_isJalr = ibuffer_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_isCall = ibuffer_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_isRet = ibuffer_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_pdInfo_jumpTarget = ibuffer_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_2_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_valid = ibuffer_io_out_3_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_instr = ibuffer_io_out_3_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pc = ibuffer_io_out_3_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_valid = ibuffer_io_out_3_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_isBr = ibuffer_io_out_3_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_isJal = ibuffer_io_out_3_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_isJalr = ibuffer_io_out_3_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_isCall = ibuffer_io_out_3_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_isRet = ibuffer_io_out_3_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_pdInfo_jumpTarget = ibuffer_io_out_3_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_3_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_valid = ibuffer_io_out_4_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_instr = ibuffer_io_out_4_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pc = ibuffer_io_out_4_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_valid = ibuffer_io_out_4_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_isBr = ibuffer_io_out_4_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_isJal = ibuffer_io_out_4_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_isJalr = ibuffer_io_out_4_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_isCall = ibuffer_io_out_4_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_isRet = ibuffer_io_out_4_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_pdInfo_jumpTarget = ibuffer_io_out_4_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_4_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_valid = ibuffer_io_out_5_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_instr = ibuffer_io_out_5_bits_instr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pc = ibuffer_io_out_5_bits_pc; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_valid = ibuffer_io_out_5_bits_pdInfo_valid; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_isBr = ibuffer_io_out_5_bits_pdInfo_isBr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_isJal = ibuffer_io_out_5_bits_pdInfo_isJal; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_isJalr = ibuffer_io_out_5_bits_pdInfo_isJalr; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_isCall = ibuffer_io_out_5_bits_pdInfo_isCall; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_isRet = ibuffer_io_out_5_bits_pdInfo_isRet; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_pdInfo_jumpTarget = ibuffer_io_out_5_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_exception_excpTlbRefill = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_exception_excpTlbPif = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_out_5_bits_exception_excpTlbPpi = 1'h0; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign io_axi_master_ar_data_arid = icache_io_axi_master_ar_data_arid; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_ar_data_araddr = icache_io_axi_master_ar_data_araddr; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_ar_data_arlen = icache_io_axi_master_ar_data_arlen; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_ar_data_arsize = icache_io_axi_master_ar_data_arsize; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_ar_data_arburst = icache_io_axi_master_ar_data_arburst; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_ar_data_arvalid = icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign io_axi_master_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_icache_req_ready = icache_io_cpu_req_ready; // @[src/main/scala/frontend/Frontend.scala 36:27]
  assign ifu_io_icache_resp_valid = icache_io_icache_resp_valid; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instrs_0 = icache_io_icache_resp_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instrs_1 = icache_io_icache_resp_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instrs_2 = icache_io_icache_resp_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instrs_3 = icache_io_icache_resp_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instvalids_0 = icache_io_icache_resp_bits_instvalids_0; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instvalids_1 = icache_io_icache_resp_bits_instvalids_1; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instvalids_2 = icache_io_icache_resp_bits_instvalids_2; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_instvalids_3 = icache_io_icache_resp_bits_instvalids_3; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_icache_resp_bits_addr = icache_io_icache_resp_bits_addr; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign ifu_io_out_ready = ibuffer_io_in_ready; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_redirect = ifu_io_icache_req_flush; // @[src/main/scala/frontend/Frontend.scala 37:22]
  assign icache_io_cpu_req_valid = ifu_io_icache_req_valid; // @[src/main/scala/frontend/Frontend.scala 34:27]
  assign icache_io_cpu_req_bits_addr = ifu_io_icache_req_addr; // @[src/main/scala/frontend/Frontend.scala 35:31]
  assign icache_io_icache_resp_ready = ifu_io_icache_resp_ready; // @[src/main/scala/frontend/Frontend.scala 40:22]
  assign icache_io_axi_master_ar_arready = io_axi_master_ar_arready; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign icache_io_axi_master_r_data_rid = io_axi_master_r_data_rid; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign icache_io_axi_master_r_data_rdata = io_axi_master_r_data_rdata; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign icache_io_axi_master_r_data_rlast = io_axi_master_r_data_rlast; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign icache_io_axi_master_r_data_rvalid = io_axi_master_r_data_rvalid; // @[src/main/scala/frontend/Frontend.scala 61:17]
  assign ibuffer_clock = clock;
  assign ibuffer_reset = reset;
  assign ibuffer_io_in_valid = ifu_io_out_valid; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_instrs_0 = ifu_io_out_bits_instrs_0; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_instrs_1 = ifu_io_out_bits_instrs_1; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_instrs_2 = ifu_io_out_bits_instrs_2; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_instrs_3 = ifu_io_out_bits_instrs_3; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pcs_0 = ifu_io_out_bits_pcs_0; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pcs_1 = ifu_io_out_bits_pcs_1; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pcs_2 = ifu_io_out_bits_pcs_2; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pcs_3 = ifu_io_out_bits_pcs_3; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_valid = ifu_io_out_bits_pdInfo_0_valid; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_isBr = ifu_io_out_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_isJal = ifu_io_out_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_isJalr = ifu_io_out_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_isCall = ifu_io_out_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_isRet = ifu_io_out_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_0_jumpTarget = ifu_io_out_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_valid = ifu_io_out_bits_pdInfo_1_valid; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_isBr = ifu_io_out_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_isJal = ifu_io_out_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_isJalr = ifu_io_out_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_isCall = ifu_io_out_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_isRet = ifu_io_out_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_1_jumpTarget = ifu_io_out_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_valid = ifu_io_out_bits_pdInfo_2_valid; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_isBr = ifu_io_out_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_isJal = ifu_io_out_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_isJalr = ifu_io_out_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_isCall = ifu_io_out_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_isRet = ifu_io_out_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_2_jumpTarget = ifu_io_out_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_valid = ifu_io_out_bits_pdInfo_3_valid; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_isBr = ifu_io_out_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_isJal = ifu_io_out_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_isJalr = ifu_io_out_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_isCall = ifu_io_out_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_isRet = ifu_io_out_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_pdInfo_3_jumpTarget = ifu_io_out_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_enqMask_0 = ifu_io_out_bits_enqMask_0; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_enqMask_1 = ifu_io_out_bits_enqMask_1; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_enqMask_2 = ifu_io_out_bits_enqMask_2; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_in_bits_enqMask_3 = ifu_io_out_bits_enqMask_3; // @[src/main/scala/frontend/Frontend.scala 44:17]
  assign ibuffer_io_out_0_ready = io_out_0_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign ibuffer_io_out_1_ready = io_out_1_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign ibuffer_io_out_2_ready = io_out_2_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign ibuffer_io_out_3_ready = io_out_3_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign ibuffer_io_out_4_ready = io_out_4_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
  assign ibuffer_io_out_5_ready = io_out_5_ready; // @[src/main/scala/frontend/Frontend.scala 47:10]
endmodule
