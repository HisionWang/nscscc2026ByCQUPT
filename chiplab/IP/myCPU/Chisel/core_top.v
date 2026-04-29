module core_top(
  input         aclk, // @[src/main/scala/myCPU_top.scala 11:16]
  input         aresetn, // @[src/main/scala/myCPU_top.scala 12:19]
  input  [7:0]  intrpt, // @[src/main/scala/myCPU_top.scala 15:19]
  output [3:0]  arid, // @[src/main/scala/myCPU_top.scala 18:19]
  output [31:0] araddr, // @[src/main/scala/myCPU_top.scala 19:19]
  output [7:0]  arlen, // @[src/main/scala/myCPU_top.scala 20:19]
  output [2:0]  arsize, // @[src/main/scala/myCPU_top.scala 21:19]
  output [1:0]  arburst, // @[src/main/scala/myCPU_top.scala 22:19]
  output [1:0]  arlock, // @[src/main/scala/myCPU_top.scala 23:19]
  output [3:0]  arcache, // @[src/main/scala/myCPU_top.scala 24:19]
  output [2:0]  arprot, // @[src/main/scala/myCPU_top.scala 25:19]
  output        arvalid, // @[src/main/scala/myCPU_top.scala 26:19]
  input         arready, // @[src/main/scala/myCPU_top.scala 27:19]
  input  [3:0]  rid, // @[src/main/scala/myCPU_top.scala 30:19]
  input  [31:0] rdata, // @[src/main/scala/myCPU_top.scala 31:19]
  input  [1:0]  rresp, // @[src/main/scala/myCPU_top.scala 32:19]
  input         rlast, // @[src/main/scala/myCPU_top.scala 33:19]
  input         rvalid, // @[src/main/scala/myCPU_top.scala 34:19]
  output        rready, // @[src/main/scala/myCPU_top.scala 35:19]
  output [3:0]  awid, // @[src/main/scala/myCPU_top.scala 38:19]
  output [31:0] awaddr, // @[src/main/scala/myCPU_top.scala 39:19]
  output [7:0]  awlen, // @[src/main/scala/myCPU_top.scala 40:19]
  output [2:0]  awsize, // @[src/main/scala/myCPU_top.scala 41:19]
  output [1:0]  awburst, // @[src/main/scala/myCPU_top.scala 42:19]
  output [1:0]  awlock, // @[src/main/scala/myCPU_top.scala 43:19]
  output [3:0]  awcache, // @[src/main/scala/myCPU_top.scala 44:19]
  output [2:0]  awprot, // @[src/main/scala/myCPU_top.scala 45:19]
  output        awvalid, // @[src/main/scala/myCPU_top.scala 46:19]
  input         awready, // @[src/main/scala/myCPU_top.scala 47:19]
  output [3:0]  wid, // @[src/main/scala/myCPU_top.scala 50:19]
  output [31:0] wdata, // @[src/main/scala/myCPU_top.scala 51:19]
  output [3:0]  wstrb, // @[src/main/scala/myCPU_top.scala 52:19]
  output        wlast, // @[src/main/scala/myCPU_top.scala 53:19]
  output        wvalid, // @[src/main/scala/myCPU_top.scala 54:19]
  input         wready, // @[src/main/scala/myCPU_top.scala 55:19]
  input  [3:0]  bid, // @[src/main/scala/myCPU_top.scala 58:19]
  input  [1:0]  bresp, // @[src/main/scala/myCPU_top.scala 59:19]
  input         bvalid, // @[src/main/scala/myCPU_top.scala 60:19]
  output        bready, // @[src/main/scala/myCPU_top.scala 61:19]
  input         break_point, // @[src/main/scala/myCPU_top.scala 63:34]
  input         infor_flag, // @[src/main/scala/myCPU_top.scala 64:34]
  input  [4:0]  reg_num, // @[src/main/scala/myCPU_top.scala 65:34]
  output        ws_valid, // @[src/main/scala/myCPU_top.scala 66:34]
  output [31:0] rf_rdata, // @[src/main/scala/myCPU_top.scala 67:34]
  output [31:0] debug0_wb_pc, // @[src/main/scala/myCPU_top.scala 69:30]
  output        debug0_wb_rf_wen, // @[src/main/scala/myCPU_top.scala 70:30]
  output [4:0]  debug0_wb_rf_wnum, // @[src/main/scala/myCPU_top.scala 71:30]
  output [31:0] debug0_wb_rf_wdata, // @[src/main/scala/myCPU_top.scala 72:30]
  output [31:0] debug0_wb_inst // @[src/main/scala/myCPU_top.scala 73:30]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] dcache_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [7:0] dcache_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] dcache_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] dcache_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [7:0] dcache_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] dcache_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] dcache_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] dcache_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] dcache_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] dcache_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  dcache_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [7:0] uncache1_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache1_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache1_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [7:0] uncache1_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache1_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache1_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache1_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache1_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache1_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache1_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [7:0] uncache2_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] uncache2_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] uncache2_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [7:0] uncache2_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] uncache2_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] uncache2_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_r_data_rresp; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] uncache2_axi_master_b_data_bid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] uncache2_axi_master_b_data_bresp; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] uncache2_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache2_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  axi_crossbar_clock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_reset; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_icache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_data_wdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_w_data_wlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_r_data_rresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_dcache_b_data_bresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_data_wid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache1_w_data_wdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_w_data_wlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_r_data_rid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache1_r_data_rdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_r_data_rresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_r_data_rlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache1_b_data_bid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache1_b_data_bresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_data_wid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache2_w_data_wdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_w_data_wlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_r_data_rid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_in_uncache2_r_data_rdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_r_data_rresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_r_data_rlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_in_uncache2_b_data_bid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_in_uncache2_b_data_bresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [7:0] axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_r_data_rid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [31:0] axi_crossbar_io_out_r_data_rdata; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_r_data_rresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_r_data_rlast; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [3:0] axi_crossbar_io_out_b_data_bid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire [1:0] axi_crossbar_io_out_b_data_bresp; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 115:28]
  wire  icache_clock; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_reset; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_req_ready; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_req_valid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_req_bits_addr; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_resp_valid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_resp_instrs_0; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_resp_instrs_1; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_resp_instrs_2; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_resp_instrs_3; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_resp_instvalids_0; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_resp_instvalids_1; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_resp_instvalids_2; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_cpu_resp_instvalids_3; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_cpu_resp_addr; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [3:0] icache_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [7:0] icache_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [2:0] icache_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [1:0] icache_io_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [3:0] icache_io_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire [31:0] icache_io_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 116:28]
  wire  fetch_unit_clock; // @[src/main/scala/myCPU_top.scala 117:26]
  wire  fetch_unit_reset; // @[src/main/scala/myCPU_top.scala 117:26]
  wire [31:0] fetch_unit_io_icache_req_addr; // @[src/main/scala/myCPU_top.scala 117:26]
  wire  fetch_unit_io_icache_req_valid; // @[src/main/scala/myCPU_top.scala 117:26]
  wire  fetch_unit_io_icache_resp_valid; // @[src/main/scala/myCPU_top.scala 117:26]
  wire  fetch_unit_io_start_valid; // @[src/main/scala/myCPU_top.scala 117:26]
  wire  difftest_clock; // @[src/main/scala/myCPU_top.scala 220:24]
  wire  difftest_reset; // @[src/main/scala/myCPU_top.scala 220:24]
  wire  difftest_io_inst_valid_diff; // @[src/main/scala/myCPU_top.scala 220:24]
  wire [63:0] difftest_io_debug0_wb_pc; // @[src/main/scala/myCPU_top.scala 220:24]
  wire [31:0] difftest_io_debug0_wb_inst; // @[src/main/scala/myCPU_top.scala 220:24]
  wire  _T = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  reg [63:0] reg_; // @[src/main/scala/myCPU_top.scala 213:20]
  wire [63:0] _reg_T_1 = reg_ + 64'h1; // @[src/main/scala/myCPU_top.scala 214:14]
  cache_BlackBox dcache ( // @[src/main/scala/myCPU_top.scala 102:28]
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
  cache_BlackBox uncache1 ( // @[src/main/scala/myCPU_top.scala 103:28]
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
  cache_BlackBox uncache2 ( // @[src/main/scala/myCPU_top.scala 104:28]
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
  AXI3Crossbar4to1 axi_crossbar ( // @[src/main/scala/myCPU_top.scala 115:28]
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
  ICache icache ( // @[src/main/scala/myCPU_top.scala 116:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_req_ready(icache_io_cpu_req_ready),
    .io_cpu_req_valid(icache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(icache_io_cpu_req_bits_addr),
    .io_cpu_resp_valid(icache_io_cpu_resp_valid),
    .io_cpu_resp_instrs_0(icache_io_cpu_resp_instrs_0),
    .io_cpu_resp_instrs_1(icache_io_cpu_resp_instrs_1),
    .io_cpu_resp_instrs_2(icache_io_cpu_resp_instrs_2),
    .io_cpu_resp_instrs_3(icache_io_cpu_resp_instrs_3),
    .io_cpu_resp_instvalids_0(icache_io_cpu_resp_instvalids_0),
    .io_cpu_resp_instvalids_1(icache_io_cpu_resp_instvalids_1),
    .io_cpu_resp_instvalids_2(icache_io_cpu_resp_instvalids_2),
    .io_cpu_resp_instvalids_3(icache_io_cpu_resp_instvalids_3),
    .io_cpu_resp_addr(icache_io_cpu_resp_addr),
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
  FetchUnit fetch_unit ( // @[src/main/scala/myCPU_top.scala 117:26]
    .clock(fetch_unit_clock),
    .reset(fetch_unit_reset),
    .io_icache_req_addr(fetch_unit_io_icache_req_addr),
    .io_icache_req_valid(fetch_unit_io_icache_req_valid),
    .io_icache_resp_valid(fetch_unit_io_icache_resp_valid),
    .io_start_valid(fetch_unit_io_start_valid)
  );
  DifftestInCore difftest ( // @[src/main/scala/myCPU_top.scala 220:24]
    .clock(difftest_clock),
    .reset(difftest_reset),
    .io_inst_valid_diff(difftest_io_inst_valid_diff),
    .io_debug0_wb_pc(difftest_io_debug0_wb_pc),
    .io_debug0_wb_inst(difftest_io_debug0_wb_inst)
  );
  assign arid = axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 161:11]
  assign araddr = axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 162:11]
  assign arlen = axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 163:11]
  assign arsize = axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 164:11]
  assign arburst = axi_crossbar_io_out_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 165:11]
  assign arlock = axi_crossbar_io_out_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 166:11]
  assign arcache = axi_crossbar_io_out_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 167:11]
  assign arprot = axi_crossbar_io_out_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 168:11]
  assign arvalid = axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 169:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 180:10]
  assign awid = axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 183:11]
  assign awaddr = axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 184:11]
  assign awlen = axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 185:11]
  assign awsize = axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 186:11]
  assign awburst = axi_crossbar_io_out_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 187:11]
  assign awlock = axi_crossbar_io_out_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 188:11]
  assign awcache = axi_crossbar_io_out_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 189:11]
  assign awprot = axi_crossbar_io_out_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 190:11]
  assign awvalid = axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 191:11]
  assign wid = axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 195:11]
  assign wdata = axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 196:11]
  assign wstrb = axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 197:11]
  assign wlast = axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 198:11]
  assign wvalid = axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 199:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 208:10]
  assign ws_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 89:12]
  assign rf_rdata = 32'h0; // @[src/main/scala/myCPU_top.scala 90:12]
  assign debug0_wb_pc = 32'h0; // @[src/main/scala/myCPU_top.scala 84:16]
  assign debug0_wb_rf_wen = 1'h0; // @[src/main/scala/myCPU_top.scala 85:20]
  assign debug0_wb_rf_wnum = 5'h0; // @[src/main/scala/myCPU_top.scala 86:21]
  assign debug0_wb_rf_wdata = 32'h0; // @[src/main/scala/myCPU_top.scala 87:22]
  assign debug0_wb_inst = 32'h0; // @[src/main/scala/myCPU_top.scala 88:18]
  assign dcache_axi_master_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_r_data_rid = axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_r_data_rdata = axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_r_data_rresp = axi_crossbar_io_in_dcache_r_data_rresp; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_r_data_rlast = axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_r_data_rvalid = axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_b_data_bid = axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_b_data_bresp = axi_crossbar_io_in_dcache_b_data_bresp; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_axi_master_b_data_bvalid = axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign dcache_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 105:30]
  assign dcache_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 106:30]
  assign uncache1_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_w_wready = axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_r_data_rid = axi_crossbar_io_in_uncache1_r_data_rid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_r_data_rdata = axi_crossbar_io_in_uncache1_r_data_rdata; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_r_data_rresp = axi_crossbar_io_in_uncache1_r_data_rresp; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_r_data_rlast = axi_crossbar_io_in_uncache1_r_data_rlast; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_r_data_rvalid = axi_crossbar_io_in_uncache1_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_b_data_bid = axi_crossbar_io_in_uncache1_b_data_bid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_b_data_bresp = axi_crossbar_io_in_uncache1_b_data_bresp; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_axi_master_b_data_bvalid = axi_crossbar_io_in_uncache1_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign uncache1_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 108:32]
  assign uncache1_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 109:32]
  assign uncache2_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_w_wready = axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_r_data_rid = axi_crossbar_io_in_uncache2_r_data_rid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_r_data_rdata = axi_crossbar_io_in_uncache2_r_data_rdata; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_r_data_rresp = axi_crossbar_io_in_uncache2_r_data_rresp; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_r_data_rlast = axi_crossbar_io_in_uncache2_r_data_rlast; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_r_data_rvalid = axi_crossbar_io_in_uncache2_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_b_data_bid = axi_crossbar_io_in_uncache2_b_data_bid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_b_data_bresp = axi_crossbar_io_in_uncache2_b_data_bresp; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_axi_master_b_data_bvalid = axi_crossbar_io_in_uncache2_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign uncache2_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 111:32]
  assign uncache2_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 112:32]
  assign axi_crossbar_clock = aclk;
  assign axi_crossbar_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign axi_crossbar_io_in_icache_ar_data_arid = icache_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_ar_data_araddr = icache_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_ar_data_arlen = icache_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_ar_data_arsize = icache_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_ar_data_arburst = icache_io_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_ar_data_arvalid = icache_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_icache_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 154:31]
  assign axi_crossbar_io_in_dcache_ar_data_arid = dcache_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_araddr = dcache_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlen = dcache_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arsize = dcache_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arburst = dcache_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlock = dcache_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arcache = dcache_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arprot = dcache_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_ar_data_arvalid = dcache_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awid = dcache_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awaddr = dcache_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlen = dcache_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awsize = dcache_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awburst = dcache_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlock = dcache_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awcache = dcache_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awprot = dcache_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_aw_data_awvalid = dcache_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_w_data_wid = dcache_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_w_data_wdata = dcache_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_w_data_wstrb = dcache_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_w_data_wlast = dcache_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_w_data_wvalid = dcache_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_r_rready = dcache_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_dcache_b_bready = dcache_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 155:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arid = uncache1_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_araddr = uncache1_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlen = uncache1_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arsize = uncache1_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arburst = uncache1_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlock = uncache1_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arcache = uncache1_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arprot = uncache1_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arvalid = uncache1_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awid = uncache1_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awaddr = uncache1_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlen = uncache1_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awsize = uncache1_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awburst = uncache1_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlock = uncache1_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awcache = uncache1_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awprot = uncache1_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awvalid = uncache1_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_w_data_wid = uncache1_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_w_data_wdata = uncache1_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_w_data_wstrb = uncache1_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_w_data_wlast = uncache1_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_w_data_wvalid = uncache1_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 156:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arid = uncache2_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_araddr = uncache2_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlen = uncache2_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arsize = uncache2_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arburst = uncache2_axi_master_ar_data_arburst; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlock = uncache2_axi_master_ar_data_arlock; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arcache = uncache2_axi_master_ar_data_arcache; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arprot = uncache2_axi_master_ar_data_arprot; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arvalid = uncache2_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awid = uncache2_axi_master_aw_data_awid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awaddr = uncache2_axi_master_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlen = uncache2_axi_master_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awsize = uncache2_axi_master_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awburst = uncache2_axi_master_aw_data_awburst; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlock = uncache2_axi_master_aw_data_awlock; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awcache = uncache2_axi_master_aw_data_awcache; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awprot = uncache2_axi_master_aw_data_awprot; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awvalid = uncache2_axi_master_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_w_data_wid = uncache2_axi_master_w_data_wid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_w_data_wdata = uncache2_axi_master_w_data_wdata; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_w_data_wstrb = uncache2_axi_master_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_w_data_wlast = uncache2_axi_master_w_data_wlast; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_w_data_wvalid = uncache2_axi_master_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 157:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/myCPU_top.scala 170:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/myCPU_top.scala 192:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/myCPU_top.scala 200:32]
  assign axi_crossbar_io_out_r_data_rid = rid; // @[src/main/scala/myCPU_top.scala 173:20 174:17]
  assign axi_crossbar_io_out_r_data_rdata = rdata; // @[src/main/scala/myCPU_top.scala 173:20 175:17]
  assign axi_crossbar_io_out_r_data_rresp = rresp; // @[src/main/scala/myCPU_top.scala 173:20 176:17]
  assign axi_crossbar_io_out_r_data_rlast = rlast; // @[src/main/scala/myCPU_top.scala 173:20 177:17]
  assign axi_crossbar_io_out_r_data_rvalid = rvalid; // @[src/main/scala/myCPU_top.scala 173:20 178:17]
  assign axi_crossbar_io_out_b_data_bid = bid; // @[src/main/scala/myCPU_top.scala 203:20 204:17]
  assign axi_crossbar_io_out_b_data_bresp = bresp; // @[src/main/scala/myCPU_top.scala 203:20 205:17]
  assign axi_crossbar_io_out_b_data_bvalid = bvalid; // @[src/main/scala/myCPU_top.scala 203:20 206:17]
  assign icache_clock = aclk;
  assign icache_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign icache_io_cpu_req_valid = fetch_unit_io_icache_req_valid; // @[src/main/scala/myCPU_top.scala 121:34]
  assign icache_io_cpu_req_bits_addr = fetch_unit_io_icache_req_addr; // @[src/main/scala/myCPU_top.scala 120:34]
  assign icache_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 154:31]
  assign icache_io_axi_master_r_data_rid = axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 154:31]
  assign icache_io_axi_master_r_data_rdata = axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 154:31]
  assign icache_io_axi_master_r_data_rlast = axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 154:31]
  assign icache_io_axi_master_r_data_rvalid = axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 154:31]
  assign fetch_unit_clock = aclk;
  assign fetch_unit_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign fetch_unit_io_icache_resp_valid = icache_io_cpu_req_ready; // @[src/main/scala/myCPU_top.scala 130:35]
  assign fetch_unit_io_start_valid = reg_ == 64'h58; // @[src/main/scala/myCPU_top.scala 215:36]
  assign difftest_clock = aclk;
  assign difftest_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign difftest_io_inst_valid_diff = reg_ == 64'h666; // @[src/main/scala/myCPU_top.scala 223:39]
  assign difftest_io_debug0_wb_pc = reg_; // @[src/main/scala/myCPU_top.scala 239:28]
  assign difftest_io_debug0_wb_inst = icache_io_cpu_resp_addr; // @[src/main/scala/myCPU_top.scala 240:30]
  always @(posedge aclk) begin
    if (_T) begin // @[src/main/scala/myCPU_top.scala 213:20]
      reg_ <= 64'h0; // @[src/main/scala/myCPU_top.scala 213:20]
    end else begin
      reg_ <= _reg_T_1; // @[src/main/scala/myCPU_top.scala 214:7]
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
  reg_ = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
