module core_top(
  input         aclk, // @[src/main/scala/myCPU_top.scala 20:19]
  input         aresetn, // @[src/main/scala/myCPU_top.scala 21:19]
  input  [7:0]  intrpt, // @[src/main/scala/myCPU_top.scala 24:18]
  output [3:0]  arid, // @[src/main/scala/myCPU_top.scala 27:19]
  output [31:0] araddr, // @[src/main/scala/myCPU_top.scala 28:19]
  output [7:0]  arlen, // @[src/main/scala/myCPU_top.scala 29:19]
  output [2:0]  arsize, // @[src/main/scala/myCPU_top.scala 30:19]
  output [1:0]  arburst, // @[src/main/scala/myCPU_top.scala 31:19]
  output [1:0]  arlock, // @[src/main/scala/myCPU_top.scala 32:19]
  output [3:0]  arcache, // @[src/main/scala/myCPU_top.scala 33:19]
  output [2:0]  arprot, // @[src/main/scala/myCPU_top.scala 34:19]
  output        arvalid, // @[src/main/scala/myCPU_top.scala 35:19]
  input         arready, // @[src/main/scala/myCPU_top.scala 36:19]
  input  [3:0]  rid, // @[src/main/scala/myCPU_top.scala 39:18]
  input  [31:0] rdata, // @[src/main/scala/myCPU_top.scala 40:18]
  input  [1:0]  rresp, // @[src/main/scala/myCPU_top.scala 41:18]
  input         rlast, // @[src/main/scala/myCPU_top.scala 42:18]
  input         rvalid, // @[src/main/scala/myCPU_top.scala 43:18]
  output        rready, // @[src/main/scala/myCPU_top.scala 44:18]
  output [3:0]  awid, // @[src/main/scala/myCPU_top.scala 47:19]
  output [31:0] awaddr, // @[src/main/scala/myCPU_top.scala 48:19]
  output [7:0]  awlen, // @[src/main/scala/myCPU_top.scala 49:19]
  output [2:0]  awsize, // @[src/main/scala/myCPU_top.scala 50:19]
  output [1:0]  awburst, // @[src/main/scala/myCPU_top.scala 51:19]
  output [1:0]  awlock, // @[src/main/scala/myCPU_top.scala 52:19]
  output [3:0]  awcache, // @[src/main/scala/myCPU_top.scala 53:19]
  output [2:0]  awprot, // @[src/main/scala/myCPU_top.scala 54:19]
  output        awvalid, // @[src/main/scala/myCPU_top.scala 55:19]
  input         awready, // @[src/main/scala/myCPU_top.scala 56:19]
  output [3:0]  wid, // @[src/main/scala/myCPU_top.scala 59:18]
  output [31:0] wdata, // @[src/main/scala/myCPU_top.scala 60:18]
  output [3:0]  wstrb, // @[src/main/scala/myCPU_top.scala 61:18]
  output        wlast, // @[src/main/scala/myCPU_top.scala 62:18]
  output        wvalid, // @[src/main/scala/myCPU_top.scala 63:18]
  input         wready, // @[src/main/scala/myCPU_top.scala 64:18]
  input  [3:0]  bid, // @[src/main/scala/myCPU_top.scala 67:18]
  input  [1:0]  bresp, // @[src/main/scala/myCPU_top.scala 68:18]
  input         bvalid, // @[src/main/scala/myCPU_top.scala 69:18]
  output        bready, // @[src/main/scala/myCPU_top.scala 70:18]
  input         break_point, // @[src/main/scala/myCPU_top.scala 73:29]
  input         infor_flag, // @[src/main/scala/myCPU_top.scala 74:29]
  input  [4:0]  reg_num, // @[src/main/scala/myCPU_top.scala 75:29]
  output        ws_valid, // @[src/main/scala/myCPU_top.scala 76:29]
  output [31:0] rf_rdata, // @[src/main/scala/myCPU_top.scala 77:29]
  output [31:0] debug0_wb_pc, // @[src/main/scala/myCPU_top.scala 78:29]
  output        debug0_wb_rf_wen, // @[src/main/scala/myCPU_top.scala 79:29]
  output [4:0]  debug0_wb_rf_wnum, // @[src/main/scala/myCPU_top.scala 80:29]
  output [31:0] debug0_wb_rf_wdata, // @[src/main/scala/myCPU_top.scala 81:29]
  output [31:0] debug0_wb_inst // @[src/main/scala/myCPU_top.scala 82:29]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  frontend_clock; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_reset; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_ready; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_0_bits_instr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_0_bits_pc; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_ready; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_1_bits_instr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_1_bits_pc; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_ready; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_2_bits_instr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_2_bits_pc; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_redirect_valid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [3:0] frontend_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [7:0] frontend_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [2:0] frontend_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [1:0] frontend_io_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [3:0] frontend_io_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [31:0] frontend_io_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 100:24]
  wire  frontend_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 100:24]
  wire [3:0] dcache_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [7:0] dcache_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [2:0] dcache_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [2:0] dcache_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [7:0] dcache_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [2:0] dcache_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [2:0] dcache_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] dcache_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [1:0] dcache_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [31:0] dcache_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 109:24]
  wire  dcache_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 109:24]
  wire [3:0] uncache1_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [7:0] uncache1_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [2:0] uncache1_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [2:0] uncache1_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [7:0] uncache1_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [2:0] uncache1_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [2:0] uncache1_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache1_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [1:0] uncache1_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [31:0] uncache1_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 110:24]
  wire  uncache1_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 110:24]
  wire [3:0] uncache2_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [7:0] uncache2_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [2:0] uncache2_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [2:0] uncache2_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [7:0] uncache2_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [2:0] uncache2_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [2:0] uncache2_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [3:0] uncache2_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [1:0] uncache2_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire [31:0] uncache2_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  uncache2_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 111:24]
  wire  axi_crossbar_clock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_reset; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_icache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_data_wdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_w_data_wlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_r_data_rresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_dcache_b_data_bresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_data_wid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache1_w_data_wdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_w_data_wlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_r_data_rid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache1_r_data_rdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_r_data_rresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_r_data_rlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache1_b_data_bid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache1_b_data_bresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_data_wid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache2_w_data_wdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_w_data_wlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_r_data_rid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_in_uncache2_r_data_rdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_r_data_rresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_r_data_rlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_in_uncache2_b_data_bid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_in_uncache2_b_data_bresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [7:0] axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_r_data_rid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [31:0] axi_crossbar_io_out_r_data_rdata; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_r_data_rresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_r_data_rlast; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [3:0] axi_crossbar_io_out_b_data_bid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire [1:0] axi_crossbar_io_out_b_data_bresp; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 121:28]
  wire  difftest_clock; // @[src/main/scala/myCPU_top.scala 289:24]
  wire  difftest_reset; // @[src/main/scala/myCPU_top.scala 289:24]
  wire  difftest_io_inst_valid_diff; // @[src/main/scala/myCPU_top.scala 289:24]
  wire  difftest_io_cnt_inst_diff; // @[src/main/scala/myCPU_top.scala 289:24]
  wire [63:0] difftest_io_timer_64_diff; // @[src/main/scala/myCPU_top.scala 289:24]
  wire  _T = ~aresetn; // @[src/main/scala/myCPU_top.scala 93:27]
  wire  dbgFirstValid = frontend_io_out_0_ready & frontend_io_out_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [31:0] _debug0_wb_inst_T = frontend_io_out_0_bits_instr; // @[src/main/scala/myCPU_top.scala 271:56]
  reg [63:0] cycleCount; // @[src/main/scala/myCPU_top.scala 286:27]
  wire [63:0] _cycleCount_T_1 = cycleCount + 64'h1; // @[src/main/scala/myCPU_top.scala 287:28]
  Frontend frontend ( // @[src/main/scala/myCPU_top.scala 100:24]
    .clock(frontend_clock),
    .reset(frontend_reset),
    .io_out_0_ready(frontend_io_out_0_ready),
    .io_out_0_valid(frontend_io_out_0_valid),
    .io_out_0_bits_instr(frontend_io_out_0_bits_instr),
    .io_out_0_bits_pc(frontend_io_out_0_bits_pc),
    .io_out_0_bits_pdInfo_valid(frontend_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(frontend_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(frontend_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(frontend_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(frontend_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(frontend_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(frontend_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_exception_excpTlbRefill(frontend_io_out_0_bits_exception_excpTlbRefill),
    .io_out_0_bits_exception_excpTlbPif(frontend_io_out_0_bits_exception_excpTlbPif),
    .io_out_0_bits_exception_excpTlbPpi(frontend_io_out_0_bits_exception_excpTlbPpi),
    .io_out_1_ready(frontend_io_out_1_ready),
    .io_out_1_valid(frontend_io_out_1_valid),
    .io_out_1_bits_instr(frontend_io_out_1_bits_instr),
    .io_out_1_bits_pc(frontend_io_out_1_bits_pc),
    .io_out_1_bits_pdInfo_valid(frontend_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(frontend_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(frontend_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(frontend_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(frontend_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(frontend_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(frontend_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_exception_excpTlbRefill(frontend_io_out_1_bits_exception_excpTlbRefill),
    .io_out_1_bits_exception_excpTlbPif(frontend_io_out_1_bits_exception_excpTlbPif),
    .io_out_1_bits_exception_excpTlbPpi(frontend_io_out_1_bits_exception_excpTlbPpi),
    .io_out_2_ready(frontend_io_out_2_ready),
    .io_out_2_valid(frontend_io_out_2_valid),
    .io_out_2_bits_instr(frontend_io_out_2_bits_instr),
    .io_out_2_bits_pc(frontend_io_out_2_bits_pc),
    .io_out_2_bits_pdInfo_valid(frontend_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(frontend_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(frontend_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(frontend_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(frontend_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(frontend_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(frontend_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_exception_excpTlbRefill(frontend_io_out_2_bits_exception_excpTlbRefill),
    .io_out_2_bits_exception_excpTlbPif(frontend_io_out_2_bits_exception_excpTlbPif),
    .io_out_2_bits_exception_excpTlbPpi(frontend_io_out_2_bits_exception_excpTlbPpi),
    .io_redirect_valid(frontend_io_redirect_valid),
    .io_axi_master_ar_data_arid(frontend_io_axi_master_ar_data_arid),
    .io_axi_master_ar_data_araddr(frontend_io_axi_master_ar_data_araddr),
    .io_axi_master_ar_data_arlen(frontend_io_axi_master_ar_data_arlen),
    .io_axi_master_ar_data_arsize(frontend_io_axi_master_ar_data_arsize),
    .io_axi_master_ar_data_arburst(frontend_io_axi_master_ar_data_arburst),
    .io_axi_master_ar_data_arvalid(frontend_io_axi_master_ar_data_arvalid),
    .io_axi_master_ar_arready(frontend_io_axi_master_ar_arready),
    .io_axi_master_r_data_rid(frontend_io_axi_master_r_data_rid),
    .io_axi_master_r_data_rdata(frontend_io_axi_master_r_data_rdata),
    .io_axi_master_r_data_rlast(frontend_io_axi_master_r_data_rlast),
    .io_axi_master_r_data_rvalid(frontend_io_axi_master_r_data_rvalid),
    .io_axi_master_r_rready(frontend_io_axi_master_r_rready)
  );
  cache_BlackBox dcache ( // @[src/main/scala/myCPU_top.scala 109:24]
    .axi_master_ar_data_arid(dcache_axi_master_ar_data_arid),
    .axi_master_ar_data_araddr(dcache_axi_master_ar_data_araddr),
    .axi_master_ar_data_arlen(dcache_axi_master_ar_data_arlen),
    .axi_master_ar_data_arsize(dcache_axi_master_ar_data_arsize),
    .axi_master_ar_data_arburst(dcache_axi_master_ar_data_arburst),
    .axi_master_ar_data_arlock(dcache_axi_master_ar_data_arlock),
    .axi_master_ar_data_arcache(dcache_axi_master_ar_data_arcache),
    .axi_master_ar_data_arprot(dcache_axi_master_ar_data_arprot),
    .axi_master_ar_data_arvalid(dcache_axi_master_ar_data_arvalid),
    .axi_master_ar_arready(dcache_axi_master_ar_arready),
    .axi_master_aw_data_awid(dcache_axi_master_aw_data_awid),
    .axi_master_aw_data_awaddr(dcache_axi_master_aw_data_awaddr),
    .axi_master_aw_data_awlen(dcache_axi_master_aw_data_awlen),
    .axi_master_aw_data_awsize(dcache_axi_master_aw_data_awsize),
    .axi_master_aw_data_awburst(dcache_axi_master_aw_data_awburst),
    .axi_master_aw_data_awlock(dcache_axi_master_aw_data_awlock),
    .axi_master_aw_data_awcache(dcache_axi_master_aw_data_awcache),
    .axi_master_aw_data_awprot(dcache_axi_master_aw_data_awprot),
    .axi_master_aw_data_awvalid(dcache_axi_master_aw_data_awvalid),
    .axi_master_aw_awready(dcache_axi_master_aw_awready),
    .axi_master_w_data_wid(dcache_axi_master_w_data_wid),
    .axi_master_w_data_wdata(dcache_axi_master_w_data_wdata),
    .axi_master_w_data_wstrb(dcache_axi_master_w_data_wstrb),
    .axi_master_w_data_wlast(dcache_axi_master_w_data_wlast),
    .axi_master_w_data_wvalid(dcache_axi_master_w_data_wvalid),
    .axi_master_w_wready(dcache_axi_master_w_wready),
    .axi_master_r_data_rid(dcache_axi_master_r_data_rid),
    .axi_master_r_data_rdata(dcache_axi_master_r_data_rdata),
    .axi_master_r_data_rresp(dcache_axi_master_r_data_rresp),
    .axi_master_r_data_rlast(dcache_axi_master_r_data_rlast),
    .axi_master_r_data_rvalid(dcache_axi_master_r_data_rvalid),
    .axi_master_r_rready(dcache_axi_master_r_rready),
    .axi_master_b_data_bid(dcache_axi_master_b_data_bid),
    .axi_master_b_data_bresp(dcache_axi_master_b_data_bresp),
    .axi_master_b_data_bvalid(dcache_axi_master_b_data_bvalid),
    .axi_master_b_bready(dcache_axi_master_b_bready),
    .cpu_if_req_addr(dcache_cpu_if_req_addr),
    .cpu_if_req_valid(dcache_cpu_if_req_valid),
    .cpu_if_resp_data(dcache_cpu_if_resp_data),
    .cpu_if_resp_valid(dcache_cpu_if_resp_valid)
  );
  cache_BlackBox uncache1 ( // @[src/main/scala/myCPU_top.scala 110:24]
    .axi_master_ar_data_arid(uncache1_axi_master_ar_data_arid),
    .axi_master_ar_data_araddr(uncache1_axi_master_ar_data_araddr),
    .axi_master_ar_data_arlen(uncache1_axi_master_ar_data_arlen),
    .axi_master_ar_data_arsize(uncache1_axi_master_ar_data_arsize),
    .axi_master_ar_data_arburst(uncache1_axi_master_ar_data_arburst),
    .axi_master_ar_data_arlock(uncache1_axi_master_ar_data_arlock),
    .axi_master_ar_data_arcache(uncache1_axi_master_ar_data_arcache),
    .axi_master_ar_data_arprot(uncache1_axi_master_ar_data_arprot),
    .axi_master_ar_data_arvalid(uncache1_axi_master_ar_data_arvalid),
    .axi_master_ar_arready(uncache1_axi_master_ar_arready),
    .axi_master_aw_data_awid(uncache1_axi_master_aw_data_awid),
    .axi_master_aw_data_awaddr(uncache1_axi_master_aw_data_awaddr),
    .axi_master_aw_data_awlen(uncache1_axi_master_aw_data_awlen),
    .axi_master_aw_data_awsize(uncache1_axi_master_aw_data_awsize),
    .axi_master_aw_data_awburst(uncache1_axi_master_aw_data_awburst),
    .axi_master_aw_data_awlock(uncache1_axi_master_aw_data_awlock),
    .axi_master_aw_data_awcache(uncache1_axi_master_aw_data_awcache),
    .axi_master_aw_data_awprot(uncache1_axi_master_aw_data_awprot),
    .axi_master_aw_data_awvalid(uncache1_axi_master_aw_data_awvalid),
    .axi_master_aw_awready(uncache1_axi_master_aw_awready),
    .axi_master_w_data_wid(uncache1_axi_master_w_data_wid),
    .axi_master_w_data_wdata(uncache1_axi_master_w_data_wdata),
    .axi_master_w_data_wstrb(uncache1_axi_master_w_data_wstrb),
    .axi_master_w_data_wlast(uncache1_axi_master_w_data_wlast),
    .axi_master_w_data_wvalid(uncache1_axi_master_w_data_wvalid),
    .axi_master_w_wready(uncache1_axi_master_w_wready),
    .axi_master_r_data_rid(uncache1_axi_master_r_data_rid),
    .axi_master_r_data_rdata(uncache1_axi_master_r_data_rdata),
    .axi_master_r_data_rresp(uncache1_axi_master_r_data_rresp),
    .axi_master_r_data_rlast(uncache1_axi_master_r_data_rlast),
    .axi_master_r_data_rvalid(uncache1_axi_master_r_data_rvalid),
    .axi_master_r_rready(uncache1_axi_master_r_rready),
    .axi_master_b_data_bid(uncache1_axi_master_b_data_bid),
    .axi_master_b_data_bresp(uncache1_axi_master_b_data_bresp),
    .axi_master_b_data_bvalid(uncache1_axi_master_b_data_bvalid),
    .axi_master_b_bready(uncache1_axi_master_b_bready),
    .cpu_if_req_addr(uncache1_cpu_if_req_addr),
    .cpu_if_req_valid(uncache1_cpu_if_req_valid),
    .cpu_if_resp_data(uncache1_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache1_cpu_if_resp_valid)
  );
  cache_BlackBox uncache2 ( // @[src/main/scala/myCPU_top.scala 111:24]
    .axi_master_ar_data_arid(uncache2_axi_master_ar_data_arid),
    .axi_master_ar_data_araddr(uncache2_axi_master_ar_data_araddr),
    .axi_master_ar_data_arlen(uncache2_axi_master_ar_data_arlen),
    .axi_master_ar_data_arsize(uncache2_axi_master_ar_data_arsize),
    .axi_master_ar_data_arburst(uncache2_axi_master_ar_data_arburst),
    .axi_master_ar_data_arlock(uncache2_axi_master_ar_data_arlock),
    .axi_master_ar_data_arcache(uncache2_axi_master_ar_data_arcache),
    .axi_master_ar_data_arprot(uncache2_axi_master_ar_data_arprot),
    .axi_master_ar_data_arvalid(uncache2_axi_master_ar_data_arvalid),
    .axi_master_ar_arready(uncache2_axi_master_ar_arready),
    .axi_master_aw_data_awid(uncache2_axi_master_aw_data_awid),
    .axi_master_aw_data_awaddr(uncache2_axi_master_aw_data_awaddr),
    .axi_master_aw_data_awlen(uncache2_axi_master_aw_data_awlen),
    .axi_master_aw_data_awsize(uncache2_axi_master_aw_data_awsize),
    .axi_master_aw_data_awburst(uncache2_axi_master_aw_data_awburst),
    .axi_master_aw_data_awlock(uncache2_axi_master_aw_data_awlock),
    .axi_master_aw_data_awcache(uncache2_axi_master_aw_data_awcache),
    .axi_master_aw_data_awprot(uncache2_axi_master_aw_data_awprot),
    .axi_master_aw_data_awvalid(uncache2_axi_master_aw_data_awvalid),
    .axi_master_aw_awready(uncache2_axi_master_aw_awready),
    .axi_master_w_data_wid(uncache2_axi_master_w_data_wid),
    .axi_master_w_data_wdata(uncache2_axi_master_w_data_wdata),
    .axi_master_w_data_wstrb(uncache2_axi_master_w_data_wstrb),
    .axi_master_w_data_wlast(uncache2_axi_master_w_data_wlast),
    .axi_master_w_data_wvalid(uncache2_axi_master_w_data_wvalid),
    .axi_master_w_wready(uncache2_axi_master_w_wready),
    .axi_master_r_data_rid(uncache2_axi_master_r_data_rid),
    .axi_master_r_data_rdata(uncache2_axi_master_r_data_rdata),
    .axi_master_r_data_rresp(uncache2_axi_master_r_data_rresp),
    .axi_master_r_data_rlast(uncache2_axi_master_r_data_rlast),
    .axi_master_r_data_rvalid(uncache2_axi_master_r_data_rvalid),
    .axi_master_r_rready(uncache2_axi_master_r_rready),
    .axi_master_b_data_bid(uncache2_axi_master_b_data_bid),
    .axi_master_b_data_bresp(uncache2_axi_master_b_data_bresp),
    .axi_master_b_data_bvalid(uncache2_axi_master_b_data_bvalid),
    .axi_master_b_bready(uncache2_axi_master_b_bready),
    .cpu_if_req_addr(uncache2_cpu_if_req_addr),
    .cpu_if_req_valid(uncache2_cpu_if_req_valid),
    .cpu_if_resp_data(uncache2_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache2_cpu_if_resp_valid)
  );
  AXI3Crossbar4to1 axi_crossbar ( // @[src/main/scala/myCPU_top.scala 121:28]
    .clock(axi_crossbar_clock),
    .reset(axi_crossbar_reset),
    .io_in_icache_ar_data_arid(axi_crossbar_io_in_icache_ar_data_arid),
    .io_in_icache_ar_data_araddr(axi_crossbar_io_in_icache_ar_data_araddr),
    .io_in_icache_ar_data_arlen(axi_crossbar_io_in_icache_ar_data_arlen),
    .io_in_icache_ar_data_arsize(axi_crossbar_io_in_icache_ar_data_arsize),
    .io_in_icache_ar_data_arburst(axi_crossbar_io_in_icache_ar_data_arburst),
    .io_in_icache_ar_data_arvalid(axi_crossbar_io_in_icache_ar_data_arvalid),
    .io_in_icache_ar_arready(axi_crossbar_io_in_icache_ar_arready),
    .io_in_icache_r_data_rid(axi_crossbar_io_in_icache_r_data_rid),
    .io_in_icache_r_data_rdata(axi_crossbar_io_in_icache_r_data_rdata),
    .io_in_icache_r_data_rlast(axi_crossbar_io_in_icache_r_data_rlast),
    .io_in_icache_r_data_rvalid(axi_crossbar_io_in_icache_r_data_rvalid),
    .io_in_icache_r_rready(axi_crossbar_io_in_icache_r_rready),
    .io_in_dcache_ar_data_arid(axi_crossbar_io_in_dcache_ar_data_arid),
    .io_in_dcache_ar_data_araddr(axi_crossbar_io_in_dcache_ar_data_araddr),
    .io_in_dcache_ar_data_arlen(axi_crossbar_io_in_dcache_ar_data_arlen),
    .io_in_dcache_ar_data_arsize(axi_crossbar_io_in_dcache_ar_data_arsize),
    .io_in_dcache_ar_data_arburst(axi_crossbar_io_in_dcache_ar_data_arburst),
    .io_in_dcache_ar_data_arlock(axi_crossbar_io_in_dcache_ar_data_arlock),
    .io_in_dcache_ar_data_arcache(axi_crossbar_io_in_dcache_ar_data_arcache),
    .io_in_dcache_ar_data_arprot(axi_crossbar_io_in_dcache_ar_data_arprot),
    .io_in_dcache_ar_data_arvalid(axi_crossbar_io_in_dcache_ar_data_arvalid),
    .io_in_dcache_ar_arready(axi_crossbar_io_in_dcache_ar_arready),
    .io_in_dcache_aw_data_awid(axi_crossbar_io_in_dcache_aw_data_awid),
    .io_in_dcache_aw_data_awaddr(axi_crossbar_io_in_dcache_aw_data_awaddr),
    .io_in_dcache_aw_data_awlen(axi_crossbar_io_in_dcache_aw_data_awlen),
    .io_in_dcache_aw_data_awsize(axi_crossbar_io_in_dcache_aw_data_awsize),
    .io_in_dcache_aw_data_awburst(axi_crossbar_io_in_dcache_aw_data_awburst),
    .io_in_dcache_aw_data_awlock(axi_crossbar_io_in_dcache_aw_data_awlock),
    .io_in_dcache_aw_data_awcache(axi_crossbar_io_in_dcache_aw_data_awcache),
    .io_in_dcache_aw_data_awprot(axi_crossbar_io_in_dcache_aw_data_awprot),
    .io_in_dcache_aw_data_awvalid(axi_crossbar_io_in_dcache_aw_data_awvalid),
    .io_in_dcache_aw_awready(axi_crossbar_io_in_dcache_aw_awready),
    .io_in_dcache_w_data_wid(axi_crossbar_io_in_dcache_w_data_wid),
    .io_in_dcache_w_data_wdata(axi_crossbar_io_in_dcache_w_data_wdata),
    .io_in_dcache_w_data_wstrb(axi_crossbar_io_in_dcache_w_data_wstrb),
    .io_in_dcache_w_data_wlast(axi_crossbar_io_in_dcache_w_data_wlast),
    .io_in_dcache_w_data_wvalid(axi_crossbar_io_in_dcache_w_data_wvalid),
    .io_in_dcache_w_wready(axi_crossbar_io_in_dcache_w_wready),
    .io_in_dcache_r_data_rid(axi_crossbar_io_in_dcache_r_data_rid),
    .io_in_dcache_r_data_rdata(axi_crossbar_io_in_dcache_r_data_rdata),
    .io_in_dcache_r_data_rresp(axi_crossbar_io_in_dcache_r_data_rresp),
    .io_in_dcache_r_data_rlast(axi_crossbar_io_in_dcache_r_data_rlast),
    .io_in_dcache_r_data_rvalid(axi_crossbar_io_in_dcache_r_data_rvalid),
    .io_in_dcache_r_rready(axi_crossbar_io_in_dcache_r_rready),
    .io_in_dcache_b_data_bid(axi_crossbar_io_in_dcache_b_data_bid),
    .io_in_dcache_b_data_bresp(axi_crossbar_io_in_dcache_b_data_bresp),
    .io_in_dcache_b_data_bvalid(axi_crossbar_io_in_dcache_b_data_bvalid),
    .io_in_dcache_b_bready(axi_crossbar_io_in_dcache_b_bready),
    .io_in_uncache1_ar_data_arid(axi_crossbar_io_in_uncache1_ar_data_arid),
    .io_in_uncache1_ar_data_araddr(axi_crossbar_io_in_uncache1_ar_data_araddr),
    .io_in_uncache1_ar_data_arlen(axi_crossbar_io_in_uncache1_ar_data_arlen),
    .io_in_uncache1_ar_data_arsize(axi_crossbar_io_in_uncache1_ar_data_arsize),
    .io_in_uncache1_ar_data_arburst(axi_crossbar_io_in_uncache1_ar_data_arburst),
    .io_in_uncache1_ar_data_arlock(axi_crossbar_io_in_uncache1_ar_data_arlock),
    .io_in_uncache1_ar_data_arcache(axi_crossbar_io_in_uncache1_ar_data_arcache),
    .io_in_uncache1_ar_data_arprot(axi_crossbar_io_in_uncache1_ar_data_arprot),
    .io_in_uncache1_ar_data_arvalid(axi_crossbar_io_in_uncache1_ar_data_arvalid),
    .io_in_uncache1_ar_arready(axi_crossbar_io_in_uncache1_ar_arready),
    .io_in_uncache1_aw_data_awid(axi_crossbar_io_in_uncache1_aw_data_awid),
    .io_in_uncache1_aw_data_awaddr(axi_crossbar_io_in_uncache1_aw_data_awaddr),
    .io_in_uncache1_aw_data_awlen(axi_crossbar_io_in_uncache1_aw_data_awlen),
    .io_in_uncache1_aw_data_awsize(axi_crossbar_io_in_uncache1_aw_data_awsize),
    .io_in_uncache1_aw_data_awburst(axi_crossbar_io_in_uncache1_aw_data_awburst),
    .io_in_uncache1_aw_data_awlock(axi_crossbar_io_in_uncache1_aw_data_awlock),
    .io_in_uncache1_aw_data_awcache(axi_crossbar_io_in_uncache1_aw_data_awcache),
    .io_in_uncache1_aw_data_awprot(axi_crossbar_io_in_uncache1_aw_data_awprot),
    .io_in_uncache1_aw_data_awvalid(axi_crossbar_io_in_uncache1_aw_data_awvalid),
    .io_in_uncache1_aw_awready(axi_crossbar_io_in_uncache1_aw_awready),
    .io_in_uncache1_w_data_wid(axi_crossbar_io_in_uncache1_w_data_wid),
    .io_in_uncache1_w_data_wdata(axi_crossbar_io_in_uncache1_w_data_wdata),
    .io_in_uncache1_w_data_wstrb(axi_crossbar_io_in_uncache1_w_data_wstrb),
    .io_in_uncache1_w_data_wlast(axi_crossbar_io_in_uncache1_w_data_wlast),
    .io_in_uncache1_w_data_wvalid(axi_crossbar_io_in_uncache1_w_data_wvalid),
    .io_in_uncache1_w_wready(axi_crossbar_io_in_uncache1_w_wready),
    .io_in_uncache1_r_data_rid(axi_crossbar_io_in_uncache1_r_data_rid),
    .io_in_uncache1_r_data_rdata(axi_crossbar_io_in_uncache1_r_data_rdata),
    .io_in_uncache1_r_data_rresp(axi_crossbar_io_in_uncache1_r_data_rresp),
    .io_in_uncache1_r_data_rlast(axi_crossbar_io_in_uncache1_r_data_rlast),
    .io_in_uncache1_r_data_rvalid(axi_crossbar_io_in_uncache1_r_data_rvalid),
    .io_in_uncache1_r_rready(axi_crossbar_io_in_uncache1_r_rready),
    .io_in_uncache1_b_data_bid(axi_crossbar_io_in_uncache1_b_data_bid),
    .io_in_uncache1_b_data_bresp(axi_crossbar_io_in_uncache1_b_data_bresp),
    .io_in_uncache1_b_data_bvalid(axi_crossbar_io_in_uncache1_b_data_bvalid),
    .io_in_uncache1_b_bready(axi_crossbar_io_in_uncache1_b_bready),
    .io_in_uncache2_ar_data_arid(axi_crossbar_io_in_uncache2_ar_data_arid),
    .io_in_uncache2_ar_data_araddr(axi_crossbar_io_in_uncache2_ar_data_araddr),
    .io_in_uncache2_ar_data_arlen(axi_crossbar_io_in_uncache2_ar_data_arlen),
    .io_in_uncache2_ar_data_arsize(axi_crossbar_io_in_uncache2_ar_data_arsize),
    .io_in_uncache2_ar_data_arburst(axi_crossbar_io_in_uncache2_ar_data_arburst),
    .io_in_uncache2_ar_data_arlock(axi_crossbar_io_in_uncache2_ar_data_arlock),
    .io_in_uncache2_ar_data_arcache(axi_crossbar_io_in_uncache2_ar_data_arcache),
    .io_in_uncache2_ar_data_arprot(axi_crossbar_io_in_uncache2_ar_data_arprot),
    .io_in_uncache2_ar_data_arvalid(axi_crossbar_io_in_uncache2_ar_data_arvalid),
    .io_in_uncache2_ar_arready(axi_crossbar_io_in_uncache2_ar_arready),
    .io_in_uncache2_aw_data_awid(axi_crossbar_io_in_uncache2_aw_data_awid),
    .io_in_uncache2_aw_data_awaddr(axi_crossbar_io_in_uncache2_aw_data_awaddr),
    .io_in_uncache2_aw_data_awlen(axi_crossbar_io_in_uncache2_aw_data_awlen),
    .io_in_uncache2_aw_data_awsize(axi_crossbar_io_in_uncache2_aw_data_awsize),
    .io_in_uncache2_aw_data_awburst(axi_crossbar_io_in_uncache2_aw_data_awburst),
    .io_in_uncache2_aw_data_awlock(axi_crossbar_io_in_uncache2_aw_data_awlock),
    .io_in_uncache2_aw_data_awcache(axi_crossbar_io_in_uncache2_aw_data_awcache),
    .io_in_uncache2_aw_data_awprot(axi_crossbar_io_in_uncache2_aw_data_awprot),
    .io_in_uncache2_aw_data_awvalid(axi_crossbar_io_in_uncache2_aw_data_awvalid),
    .io_in_uncache2_aw_awready(axi_crossbar_io_in_uncache2_aw_awready),
    .io_in_uncache2_w_data_wid(axi_crossbar_io_in_uncache2_w_data_wid),
    .io_in_uncache2_w_data_wdata(axi_crossbar_io_in_uncache2_w_data_wdata),
    .io_in_uncache2_w_data_wstrb(axi_crossbar_io_in_uncache2_w_data_wstrb),
    .io_in_uncache2_w_data_wlast(axi_crossbar_io_in_uncache2_w_data_wlast),
    .io_in_uncache2_w_data_wvalid(axi_crossbar_io_in_uncache2_w_data_wvalid),
    .io_in_uncache2_w_wready(axi_crossbar_io_in_uncache2_w_wready),
    .io_in_uncache2_r_data_rid(axi_crossbar_io_in_uncache2_r_data_rid),
    .io_in_uncache2_r_data_rdata(axi_crossbar_io_in_uncache2_r_data_rdata),
    .io_in_uncache2_r_data_rresp(axi_crossbar_io_in_uncache2_r_data_rresp),
    .io_in_uncache2_r_data_rlast(axi_crossbar_io_in_uncache2_r_data_rlast),
    .io_in_uncache2_r_data_rvalid(axi_crossbar_io_in_uncache2_r_data_rvalid),
    .io_in_uncache2_r_rready(axi_crossbar_io_in_uncache2_r_rready),
    .io_in_uncache2_b_data_bid(axi_crossbar_io_in_uncache2_b_data_bid),
    .io_in_uncache2_b_data_bresp(axi_crossbar_io_in_uncache2_b_data_bresp),
    .io_in_uncache2_b_data_bvalid(axi_crossbar_io_in_uncache2_b_data_bvalid),
    .io_in_uncache2_b_bready(axi_crossbar_io_in_uncache2_b_bready),
    .io_out_ar_data_arid(axi_crossbar_io_out_ar_data_arid),
    .io_out_ar_data_araddr(axi_crossbar_io_out_ar_data_araddr),
    .io_out_ar_data_arlen(axi_crossbar_io_out_ar_data_arlen),
    .io_out_ar_data_arsize(axi_crossbar_io_out_ar_data_arsize),
    .io_out_ar_data_arburst(axi_crossbar_io_out_ar_data_arburst),
    .io_out_ar_data_arlock(axi_crossbar_io_out_ar_data_arlock),
    .io_out_ar_data_arcache(axi_crossbar_io_out_ar_data_arcache),
    .io_out_ar_data_arprot(axi_crossbar_io_out_ar_data_arprot),
    .io_out_ar_data_arvalid(axi_crossbar_io_out_ar_data_arvalid),
    .io_out_ar_arready(axi_crossbar_io_out_ar_arready),
    .io_out_aw_data_awid(axi_crossbar_io_out_aw_data_awid),
    .io_out_aw_data_awaddr(axi_crossbar_io_out_aw_data_awaddr),
    .io_out_aw_data_awlen(axi_crossbar_io_out_aw_data_awlen),
    .io_out_aw_data_awsize(axi_crossbar_io_out_aw_data_awsize),
    .io_out_aw_data_awburst(axi_crossbar_io_out_aw_data_awburst),
    .io_out_aw_data_awlock(axi_crossbar_io_out_aw_data_awlock),
    .io_out_aw_data_awcache(axi_crossbar_io_out_aw_data_awcache),
    .io_out_aw_data_awprot(axi_crossbar_io_out_aw_data_awprot),
    .io_out_aw_data_awvalid(axi_crossbar_io_out_aw_data_awvalid),
    .io_out_aw_awready(axi_crossbar_io_out_aw_awready),
    .io_out_w_data_wid(axi_crossbar_io_out_w_data_wid),
    .io_out_w_data_wdata(axi_crossbar_io_out_w_data_wdata),
    .io_out_w_data_wstrb(axi_crossbar_io_out_w_data_wstrb),
    .io_out_w_data_wlast(axi_crossbar_io_out_w_data_wlast),
    .io_out_w_data_wvalid(axi_crossbar_io_out_w_data_wvalid),
    .io_out_w_wready(axi_crossbar_io_out_w_wready),
    .io_out_r_data_rid(axi_crossbar_io_out_r_data_rid),
    .io_out_r_data_rdata(axi_crossbar_io_out_r_data_rdata),
    .io_out_r_data_rresp(axi_crossbar_io_out_r_data_rresp),
    .io_out_r_data_rlast(axi_crossbar_io_out_r_data_rlast),
    .io_out_r_data_rvalid(axi_crossbar_io_out_r_data_rvalid),
    .io_out_r_rready(axi_crossbar_io_out_r_rready),
    .io_out_b_data_bid(axi_crossbar_io_out_b_data_bid),
    .io_out_b_data_bresp(axi_crossbar_io_out_b_data_bresp),
    .io_out_b_data_bvalid(axi_crossbar_io_out_b_data_bvalid),
    .io_out_b_bready(axi_crossbar_io_out_b_bready)
  );
  DifftestInCore difftest ( // @[src/main/scala/myCPU_top.scala 289:24]
    .clock(difftest_clock),
    .reset(difftest_reset),
    .io_inst_valid_diff(difftest_io_inst_valid_diff),
    .io_cnt_inst_diff(difftest_io_cnt_inst_diff),
    .io_timer_64_diff(difftest_io_timer_64_diff)
  );
  assign arid = axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 215:11]
  assign araddr = axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 216:11]
  assign arlen = axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 217:11]
  assign arsize = axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 218:11]
  assign arburst = axi_crossbar_io_out_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 219:11]
  assign arlock = axi_crossbar_io_out_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 220:11]
  assign arcache = axi_crossbar_io_out_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 221:11]
  assign arprot = axi_crossbar_io_out_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 222:11]
  assign arvalid = axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 223:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 234:10]
  assign awid = axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 237:11]
  assign awaddr = axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 238:11]
  assign awlen = axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 239:11]
  assign awsize = axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 240:11]
  assign awburst = axi_crossbar_io_out_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 241:11]
  assign awlock = axi_crossbar_io_out_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 242:11]
  assign awcache = axi_crossbar_io_out_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 243:11]
  assign awprot = axi_crossbar_io_out_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 244:11]
  assign awvalid = axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 245:11]
  assign wid = axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 249:11]
  assign wdata = axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 250:11]
  assign wstrb = axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 251:11]
  assign wlast = axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 252:11]
  assign wvalid = axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 253:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 262:10]
  assign ws_valid = frontend_io_out_0_ready & frontend_io_out_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign rf_rdata = 32'h0; // @[src/main/scala/myCPU_top.scala 281:12]
  assign debug0_wb_pc = dbgFirstValid ? frontend_io_out_0_bits_pc : 32'h0; // @[src/main/scala/myCPU_top.scala 269:23 270:24 85:22]
  assign debug0_wb_rf_wen = 1'h0; // @[src/main/scala/myCPU_top.scala 269:23 272:24 86:22]
  assign debug0_wb_rf_wnum = 5'h0;
  assign debug0_wb_rf_wdata = 32'h0;
  assign debug0_wb_inst = dbgFirstValid ? _debug0_wb_inst_T : 32'h0; // @[src/main/scala/myCPU_top.scala 269:23 271:24 89:22]
  assign frontend_clock = aclk;
  assign frontend_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 93:27]
  assign frontend_io_out_0_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 136:30]
  assign frontend_io_out_1_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 136:30]
  assign frontend_io_out_2_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 136:30]
  assign frontend_io_redirect_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 128:31]
  assign frontend_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 202:31]
  assign frontend_io_axi_master_r_data_rid = axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 202:31]
  assign frontend_io_axi_master_r_data_rdata = axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 202:31]
  assign frontend_io_axi_master_r_data_rlast = axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 202:31]
  assign frontend_io_axi_master_r_data_rvalid = axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 202:31]
  assign dcache_axi_master_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_r_data_rid = axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_r_data_rdata = axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_r_data_rresp = axi_crossbar_io_in_dcache_r_data_rresp; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_r_data_rlast = axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_r_data_rvalid = axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_b_data_bid = axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_b_data_bresp = axi_crossbar_io_in_dcache_b_data_bresp; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_axi_master_b_data_bvalid = axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign dcache_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 113:30]
  assign dcache_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 114:30]
  assign uncache1_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_w_wready = axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_r_data_rid = axi_crossbar_io_in_uncache1_r_data_rid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_r_data_rdata = axi_crossbar_io_in_uncache1_r_data_rdata; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_r_data_rresp = axi_crossbar_io_in_uncache1_r_data_rresp; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_r_data_rlast = axi_crossbar_io_in_uncache1_r_data_rlast; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_r_data_rvalid = axi_crossbar_io_in_uncache1_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_b_data_bid = axi_crossbar_io_in_uncache1_b_data_bid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_b_data_bresp = axi_crossbar_io_in_uncache1_b_data_bresp; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_axi_master_b_data_bvalid = axi_crossbar_io_in_uncache1_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign uncache1_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 115:32]
  assign uncache1_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 116:32]
  assign uncache2_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_w_wready = axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_r_data_rid = axi_crossbar_io_in_uncache2_r_data_rid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_r_data_rdata = axi_crossbar_io_in_uncache2_r_data_rdata; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_r_data_rresp = axi_crossbar_io_in_uncache2_r_data_rresp; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_r_data_rlast = axi_crossbar_io_in_uncache2_r_data_rlast; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_r_data_rvalid = axi_crossbar_io_in_uncache2_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_b_data_bid = axi_crossbar_io_in_uncache2_b_data_bid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_b_data_bresp = axi_crossbar_io_in_uncache2_b_data_bresp; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_axi_master_b_data_bvalid = axi_crossbar_io_in_uncache2_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign uncache2_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 117:32]
  assign uncache2_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 118:32]
  assign axi_crossbar_clock = aclk;
  assign axi_crossbar_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 93:27]
  assign axi_crossbar_io_in_icache_ar_data_arid = frontend_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_ar_data_araddr = frontend_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_ar_data_arlen = frontend_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_ar_data_arsize = frontend_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_ar_data_arburst = frontend_io_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_ar_data_arvalid = frontend_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_icache_r_rready = frontend_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 202:31]
  assign axi_crossbar_io_in_dcache_ar_data_arid = dcache_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_araddr = dcache_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlen = dcache_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arsize = dcache_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arburst = dcache_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlock = dcache_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arcache = dcache_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arprot = dcache_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_ar_data_arvalid = dcache_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awid = dcache_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awaddr = dcache_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlen = dcache_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awsize = dcache_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awburst = dcache_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlock = dcache_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awcache = dcache_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awprot = dcache_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_aw_data_awvalid = dcache_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_w_data_wid = dcache_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_w_data_wdata = dcache_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_w_data_wstrb = dcache_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_w_data_wlast = dcache_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_w_data_wvalid = dcache_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_r_rready = dcache_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_dcache_b_bready = dcache_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 205:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arid = uncache1_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_araddr = uncache1_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlen = uncache1_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arsize = uncache1_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arburst = uncache1_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlock = uncache1_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arcache = uncache1_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arprot = uncache1_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arvalid = uncache1_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awid = uncache1_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awaddr = uncache1_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlen = uncache1_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awsize = uncache1_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awburst = uncache1_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlock = uncache1_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awcache = uncache1_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awprot = uncache1_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awvalid = uncache1_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_w_data_wid = uncache1_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_w_data_wdata = uncache1_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_w_data_wstrb = uncache1_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_w_data_wlast = uncache1_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_w_data_wvalid = uncache1_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 208:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arid = uncache2_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_araddr = uncache2_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlen = uncache2_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arsize = uncache2_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arburst = uncache2_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlock = uncache2_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arcache = uncache2_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arprot = uncache2_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arvalid = uncache2_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awid = uncache2_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awaddr = uncache2_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlen = uncache2_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awsize = uncache2_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awburst = uncache2_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlock = uncache2_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awcache = uncache2_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awprot = uncache2_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awvalid = uncache2_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_w_data_wid = uncache2_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_w_data_wdata = uncache2_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_w_data_wstrb = uncache2_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_w_data_wlast = uncache2_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_w_data_wvalid = uncache2_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 211:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/myCPU_top.scala 224:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/myCPU_top.scala 246:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/myCPU_top.scala 254:32]
  assign axi_crossbar_io_out_r_data_rid = rid; // @[src/main/scala/myCPU_top.scala 227:20 228:17]
  assign axi_crossbar_io_out_r_data_rdata = rdata; // @[src/main/scala/myCPU_top.scala 227:20 229:17]
  assign axi_crossbar_io_out_r_data_rresp = rresp; // @[src/main/scala/myCPU_top.scala 227:20 230:17]
  assign axi_crossbar_io_out_r_data_rlast = rlast; // @[src/main/scala/myCPU_top.scala 227:20 231:17]
  assign axi_crossbar_io_out_r_data_rvalid = rvalid; // @[src/main/scala/myCPU_top.scala 227:20 232:17]
  assign axi_crossbar_io_out_b_data_bid = bid; // @[src/main/scala/myCPU_top.scala 257:20 258:17]
  assign axi_crossbar_io_out_b_data_bresp = bresp; // @[src/main/scala/myCPU_top.scala 257:20 259:17]
  assign axi_crossbar_io_out_b_data_bvalid = bvalid; // @[src/main/scala/myCPU_top.scala 257:20 260:17]
  assign difftest_clock = aclk;
  assign difftest_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 93:27]
  assign difftest_io_inst_valid_diff = cycleCount == 64'h1587c; // @[src/main/scala/myCPU_top.scala 292:47]
  assign difftest_io_cnt_inst_diff = cycleCount == 64'hbc; // @[src/main/scala/myCPU_top.scala 293:47]
  assign difftest_io_timer_64_diff = cycleCount; // @[src/main/scala/myCPU_top.scala 294:33]
  always @(posedge aclk) begin
    if (_T) begin // @[src/main/scala/myCPU_top.scala 286:27]
      cycleCount <= 64'h0; // @[src/main/scala/myCPU_top.scala 286:27]
    end else begin
      cycleCount <= _cycleCount_T_1; // @[src/main/scala/myCPU_top.scala 287:14]
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
  _RAND_0 = {2{`RANDOM}};
  cycleCount = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
