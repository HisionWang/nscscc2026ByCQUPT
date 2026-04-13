module Core_top(
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
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_icache_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_icache_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_icache_w_out_wdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_w_out_wlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_icache_b_bready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_out_wdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_w_out_wlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache1_w_out_wdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache2_w_out_wdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [7:0] axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_w_out_wid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_r_in_rid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [31:0] axi_crossbar_io_out_r_in_rdata; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_r_in_rresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_r_in_rlast; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [3:0] axi_crossbar_io_out_b_in_bid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire [1:0] axi_crossbar_io_out_b_in_bresp; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 98:28]
  wire  icache_clock; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_reset; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [7:0] icache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [2:0] icache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [2:0] icache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [7:0] icache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [2:0] icache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [2:0] icache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [3:0] icache_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [1:0] icache_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire [31:0] icache_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  icache_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 100:28]
  wire  dcache_clock; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_reset; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [7:0] dcache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] dcache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] dcache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [7:0] dcache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] dcache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [2:0] dcache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [3:0] dcache_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [1:0] dcache_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire [31:0] dcache_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  dcache_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 104:28]
  wire  uncache1_clock; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_reset; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [7:0] uncache1_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [2:0] uncache1_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [2:0] uncache1_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [7:0] uncache1_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [2:0] uncache1_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [2:0] uncache1_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [3:0] uncache1_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [1:0] uncache1_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire [31:0] uncache1_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache1_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 105:28]
  wire  uncache2_clock; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_reset; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [7:0] uncache2_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [2:0] uncache2_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [2:0] uncache2_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [7:0] uncache2_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [2:0] uncache2_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [2:0] uncache2_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [3:0] uncache2_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [1:0] uncache2_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire [31:0] uncache2_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  uncache2_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 106:28]
  wire  difftest_clock; // @[src/main/scala/myCPU_top.scala 194:24]
  wire  difftest_reset; // @[src/main/scala/myCPU_top.scala 194:24]
  wire  difftest_io_inst_valid_diff; // @[src/main/scala/myCPU_top.scala 194:24]
  wire [63:0] difftest_io_debug0_wb_pc; // @[src/main/scala/myCPU_top.scala 194:24]
  wire  _T = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  reg [63:0] reg_; // @[src/main/scala/myCPU_top.scala 188:20]
  wire [63:0] _reg_T_1 = reg_ + 64'h1; // @[src/main/scala/myCPU_top.scala 189:14]
  AXI3Crossbar4to1 axi_crossbar ( // @[src/main/scala/myCPU_top.scala 98:28]
    .io_in_icache_ar_out_arid(axi_crossbar_io_in_icache_ar_out_arid),
    .io_in_icache_ar_out_araddr(axi_crossbar_io_in_icache_ar_out_araddr),
    .io_in_icache_ar_out_arlen(axi_crossbar_io_in_icache_ar_out_arlen),
    .io_in_icache_ar_out_arsize(axi_crossbar_io_in_icache_ar_out_arsize),
    .io_in_icache_ar_out_arburst(axi_crossbar_io_in_icache_ar_out_arburst),
    .io_in_icache_ar_out_arlock(axi_crossbar_io_in_icache_ar_out_arlock),
    .io_in_icache_ar_out_arcache(axi_crossbar_io_in_icache_ar_out_arcache),
    .io_in_icache_ar_out_arprot(axi_crossbar_io_in_icache_ar_out_arprot),
    .io_in_icache_ar_out_arvalid(axi_crossbar_io_in_icache_ar_out_arvalid),
    .io_in_icache_ar_arready(axi_crossbar_io_in_icache_ar_arready),
    .io_in_icache_aw_out_awid(axi_crossbar_io_in_icache_aw_out_awid),
    .io_in_icache_aw_out_awaddr(axi_crossbar_io_in_icache_aw_out_awaddr),
    .io_in_icache_aw_out_awlen(axi_crossbar_io_in_icache_aw_out_awlen),
    .io_in_icache_aw_out_awsize(axi_crossbar_io_in_icache_aw_out_awsize),
    .io_in_icache_aw_out_awburst(axi_crossbar_io_in_icache_aw_out_awburst),
    .io_in_icache_aw_out_awlock(axi_crossbar_io_in_icache_aw_out_awlock),
    .io_in_icache_aw_out_awcache(axi_crossbar_io_in_icache_aw_out_awcache),
    .io_in_icache_aw_out_awprot(axi_crossbar_io_in_icache_aw_out_awprot),
    .io_in_icache_aw_out_awvalid(axi_crossbar_io_in_icache_aw_out_awvalid),
    .io_in_icache_aw_awready(axi_crossbar_io_in_icache_aw_awready),
    .io_in_icache_w_out_wid(axi_crossbar_io_in_icache_w_out_wid),
    .io_in_icache_w_out_wdata(axi_crossbar_io_in_icache_w_out_wdata),
    .io_in_icache_w_out_wstrb(axi_crossbar_io_in_icache_w_out_wstrb),
    .io_in_icache_w_out_wlast(axi_crossbar_io_in_icache_w_out_wlast),
    .io_in_icache_w_out_wvalid(axi_crossbar_io_in_icache_w_out_wvalid),
    .io_in_icache_w_wready(axi_crossbar_io_in_icache_w_wready),
    .io_in_icache_r_in_rid(axi_crossbar_io_in_icache_r_in_rid),
    .io_in_icache_r_in_rdata(axi_crossbar_io_in_icache_r_in_rdata),
    .io_in_icache_r_in_rresp(axi_crossbar_io_in_icache_r_in_rresp),
    .io_in_icache_r_in_rlast(axi_crossbar_io_in_icache_r_in_rlast),
    .io_in_icache_r_in_rvalid(axi_crossbar_io_in_icache_r_in_rvalid),
    .io_in_icache_r_rready(axi_crossbar_io_in_icache_r_rready),
    .io_in_icache_b_in_bid(axi_crossbar_io_in_icache_b_in_bid),
    .io_in_icache_b_in_bresp(axi_crossbar_io_in_icache_b_in_bresp),
    .io_in_icache_b_in_bvalid(axi_crossbar_io_in_icache_b_in_bvalid),
    .io_in_icache_b_bready(axi_crossbar_io_in_icache_b_bready),
    .io_in_dcache_ar_out_arid(axi_crossbar_io_in_dcache_ar_out_arid),
    .io_in_dcache_ar_out_araddr(axi_crossbar_io_in_dcache_ar_out_araddr),
    .io_in_dcache_ar_out_arlen(axi_crossbar_io_in_dcache_ar_out_arlen),
    .io_in_dcache_ar_out_arsize(axi_crossbar_io_in_dcache_ar_out_arsize),
    .io_in_dcache_ar_out_arburst(axi_crossbar_io_in_dcache_ar_out_arburst),
    .io_in_dcache_ar_out_arlock(axi_crossbar_io_in_dcache_ar_out_arlock),
    .io_in_dcache_ar_out_arcache(axi_crossbar_io_in_dcache_ar_out_arcache),
    .io_in_dcache_ar_out_arprot(axi_crossbar_io_in_dcache_ar_out_arprot),
    .io_in_dcache_ar_out_arvalid(axi_crossbar_io_in_dcache_ar_out_arvalid),
    .io_in_dcache_ar_arready(axi_crossbar_io_in_dcache_ar_arready),
    .io_in_dcache_aw_out_awid(axi_crossbar_io_in_dcache_aw_out_awid),
    .io_in_dcache_aw_out_awaddr(axi_crossbar_io_in_dcache_aw_out_awaddr),
    .io_in_dcache_aw_out_awlen(axi_crossbar_io_in_dcache_aw_out_awlen),
    .io_in_dcache_aw_out_awsize(axi_crossbar_io_in_dcache_aw_out_awsize),
    .io_in_dcache_aw_out_awburst(axi_crossbar_io_in_dcache_aw_out_awburst),
    .io_in_dcache_aw_out_awlock(axi_crossbar_io_in_dcache_aw_out_awlock),
    .io_in_dcache_aw_out_awcache(axi_crossbar_io_in_dcache_aw_out_awcache),
    .io_in_dcache_aw_out_awprot(axi_crossbar_io_in_dcache_aw_out_awprot),
    .io_in_dcache_aw_out_awvalid(axi_crossbar_io_in_dcache_aw_out_awvalid),
    .io_in_dcache_aw_awready(axi_crossbar_io_in_dcache_aw_awready),
    .io_in_dcache_w_out_wid(axi_crossbar_io_in_dcache_w_out_wid),
    .io_in_dcache_w_out_wdata(axi_crossbar_io_in_dcache_w_out_wdata),
    .io_in_dcache_w_out_wstrb(axi_crossbar_io_in_dcache_w_out_wstrb),
    .io_in_dcache_w_out_wlast(axi_crossbar_io_in_dcache_w_out_wlast),
    .io_in_dcache_w_out_wvalid(axi_crossbar_io_in_dcache_w_out_wvalid),
    .io_in_dcache_w_wready(axi_crossbar_io_in_dcache_w_wready),
    .io_in_dcache_r_in_rid(axi_crossbar_io_in_dcache_r_in_rid),
    .io_in_dcache_r_in_rdata(axi_crossbar_io_in_dcache_r_in_rdata),
    .io_in_dcache_r_in_rresp(axi_crossbar_io_in_dcache_r_in_rresp),
    .io_in_dcache_r_in_rlast(axi_crossbar_io_in_dcache_r_in_rlast),
    .io_in_dcache_r_in_rvalid(axi_crossbar_io_in_dcache_r_in_rvalid),
    .io_in_dcache_r_rready(axi_crossbar_io_in_dcache_r_rready),
    .io_in_dcache_b_in_bid(axi_crossbar_io_in_dcache_b_in_bid),
    .io_in_dcache_b_in_bresp(axi_crossbar_io_in_dcache_b_in_bresp),
    .io_in_dcache_b_in_bvalid(axi_crossbar_io_in_dcache_b_in_bvalid),
    .io_in_dcache_b_bready(axi_crossbar_io_in_dcache_b_bready),
    .io_in_uncache1_ar_out_arid(axi_crossbar_io_in_uncache1_ar_out_arid),
    .io_in_uncache1_ar_out_araddr(axi_crossbar_io_in_uncache1_ar_out_araddr),
    .io_in_uncache1_ar_out_arlen(axi_crossbar_io_in_uncache1_ar_out_arlen),
    .io_in_uncache1_ar_out_arsize(axi_crossbar_io_in_uncache1_ar_out_arsize),
    .io_in_uncache1_ar_out_arburst(axi_crossbar_io_in_uncache1_ar_out_arburst),
    .io_in_uncache1_ar_out_arlock(axi_crossbar_io_in_uncache1_ar_out_arlock),
    .io_in_uncache1_ar_out_arcache(axi_crossbar_io_in_uncache1_ar_out_arcache),
    .io_in_uncache1_ar_out_arprot(axi_crossbar_io_in_uncache1_ar_out_arprot),
    .io_in_uncache1_ar_out_arvalid(axi_crossbar_io_in_uncache1_ar_out_arvalid),
    .io_in_uncache1_ar_arready(axi_crossbar_io_in_uncache1_ar_arready),
    .io_in_uncache1_aw_out_awid(axi_crossbar_io_in_uncache1_aw_out_awid),
    .io_in_uncache1_aw_out_awaddr(axi_crossbar_io_in_uncache1_aw_out_awaddr),
    .io_in_uncache1_aw_out_awlen(axi_crossbar_io_in_uncache1_aw_out_awlen),
    .io_in_uncache1_aw_out_awsize(axi_crossbar_io_in_uncache1_aw_out_awsize),
    .io_in_uncache1_aw_out_awburst(axi_crossbar_io_in_uncache1_aw_out_awburst),
    .io_in_uncache1_aw_out_awlock(axi_crossbar_io_in_uncache1_aw_out_awlock),
    .io_in_uncache1_aw_out_awcache(axi_crossbar_io_in_uncache1_aw_out_awcache),
    .io_in_uncache1_aw_out_awprot(axi_crossbar_io_in_uncache1_aw_out_awprot),
    .io_in_uncache1_aw_out_awvalid(axi_crossbar_io_in_uncache1_aw_out_awvalid),
    .io_in_uncache1_aw_awready(axi_crossbar_io_in_uncache1_aw_awready),
    .io_in_uncache1_w_out_wid(axi_crossbar_io_in_uncache1_w_out_wid),
    .io_in_uncache1_w_out_wdata(axi_crossbar_io_in_uncache1_w_out_wdata),
    .io_in_uncache1_w_out_wstrb(axi_crossbar_io_in_uncache1_w_out_wstrb),
    .io_in_uncache1_w_out_wlast(axi_crossbar_io_in_uncache1_w_out_wlast),
    .io_in_uncache1_w_out_wvalid(axi_crossbar_io_in_uncache1_w_out_wvalid),
    .io_in_uncache1_w_wready(axi_crossbar_io_in_uncache1_w_wready),
    .io_in_uncache1_r_in_rid(axi_crossbar_io_in_uncache1_r_in_rid),
    .io_in_uncache1_r_in_rdata(axi_crossbar_io_in_uncache1_r_in_rdata),
    .io_in_uncache1_r_in_rresp(axi_crossbar_io_in_uncache1_r_in_rresp),
    .io_in_uncache1_r_in_rlast(axi_crossbar_io_in_uncache1_r_in_rlast),
    .io_in_uncache1_r_in_rvalid(axi_crossbar_io_in_uncache1_r_in_rvalid),
    .io_in_uncache1_r_rready(axi_crossbar_io_in_uncache1_r_rready),
    .io_in_uncache1_b_in_bid(axi_crossbar_io_in_uncache1_b_in_bid),
    .io_in_uncache1_b_in_bresp(axi_crossbar_io_in_uncache1_b_in_bresp),
    .io_in_uncache1_b_in_bvalid(axi_crossbar_io_in_uncache1_b_in_bvalid),
    .io_in_uncache1_b_bready(axi_crossbar_io_in_uncache1_b_bready),
    .io_in_uncache2_ar_out_arid(axi_crossbar_io_in_uncache2_ar_out_arid),
    .io_in_uncache2_ar_out_araddr(axi_crossbar_io_in_uncache2_ar_out_araddr),
    .io_in_uncache2_ar_out_arlen(axi_crossbar_io_in_uncache2_ar_out_arlen),
    .io_in_uncache2_ar_out_arsize(axi_crossbar_io_in_uncache2_ar_out_arsize),
    .io_in_uncache2_ar_out_arburst(axi_crossbar_io_in_uncache2_ar_out_arburst),
    .io_in_uncache2_ar_out_arlock(axi_crossbar_io_in_uncache2_ar_out_arlock),
    .io_in_uncache2_ar_out_arcache(axi_crossbar_io_in_uncache2_ar_out_arcache),
    .io_in_uncache2_ar_out_arprot(axi_crossbar_io_in_uncache2_ar_out_arprot),
    .io_in_uncache2_ar_out_arvalid(axi_crossbar_io_in_uncache2_ar_out_arvalid),
    .io_in_uncache2_ar_arready(axi_crossbar_io_in_uncache2_ar_arready),
    .io_in_uncache2_aw_out_awid(axi_crossbar_io_in_uncache2_aw_out_awid),
    .io_in_uncache2_aw_out_awaddr(axi_crossbar_io_in_uncache2_aw_out_awaddr),
    .io_in_uncache2_aw_out_awlen(axi_crossbar_io_in_uncache2_aw_out_awlen),
    .io_in_uncache2_aw_out_awsize(axi_crossbar_io_in_uncache2_aw_out_awsize),
    .io_in_uncache2_aw_out_awburst(axi_crossbar_io_in_uncache2_aw_out_awburst),
    .io_in_uncache2_aw_out_awlock(axi_crossbar_io_in_uncache2_aw_out_awlock),
    .io_in_uncache2_aw_out_awcache(axi_crossbar_io_in_uncache2_aw_out_awcache),
    .io_in_uncache2_aw_out_awprot(axi_crossbar_io_in_uncache2_aw_out_awprot),
    .io_in_uncache2_aw_out_awvalid(axi_crossbar_io_in_uncache2_aw_out_awvalid),
    .io_in_uncache2_aw_awready(axi_crossbar_io_in_uncache2_aw_awready),
    .io_in_uncache2_w_out_wid(axi_crossbar_io_in_uncache2_w_out_wid),
    .io_in_uncache2_w_out_wdata(axi_crossbar_io_in_uncache2_w_out_wdata),
    .io_in_uncache2_w_out_wstrb(axi_crossbar_io_in_uncache2_w_out_wstrb),
    .io_in_uncache2_w_out_wlast(axi_crossbar_io_in_uncache2_w_out_wlast),
    .io_in_uncache2_w_out_wvalid(axi_crossbar_io_in_uncache2_w_out_wvalid),
    .io_in_uncache2_w_wready(axi_crossbar_io_in_uncache2_w_wready),
    .io_in_uncache2_r_in_rid(axi_crossbar_io_in_uncache2_r_in_rid),
    .io_in_uncache2_r_in_rdata(axi_crossbar_io_in_uncache2_r_in_rdata),
    .io_in_uncache2_r_in_rresp(axi_crossbar_io_in_uncache2_r_in_rresp),
    .io_in_uncache2_r_in_rlast(axi_crossbar_io_in_uncache2_r_in_rlast),
    .io_in_uncache2_r_in_rvalid(axi_crossbar_io_in_uncache2_r_in_rvalid),
    .io_in_uncache2_r_rready(axi_crossbar_io_in_uncache2_r_rready),
    .io_in_uncache2_b_in_bid(axi_crossbar_io_in_uncache2_b_in_bid),
    .io_in_uncache2_b_in_bresp(axi_crossbar_io_in_uncache2_b_in_bresp),
    .io_in_uncache2_b_in_bvalid(axi_crossbar_io_in_uncache2_b_in_bvalid),
    .io_in_uncache2_b_bready(axi_crossbar_io_in_uncache2_b_bready),
    .io_out_ar_out_arid(axi_crossbar_io_out_ar_out_arid),
    .io_out_ar_out_araddr(axi_crossbar_io_out_ar_out_araddr),
    .io_out_ar_out_arlen(axi_crossbar_io_out_ar_out_arlen),
    .io_out_ar_out_arsize(axi_crossbar_io_out_ar_out_arsize),
    .io_out_ar_out_arburst(axi_crossbar_io_out_ar_out_arburst),
    .io_out_ar_out_arlock(axi_crossbar_io_out_ar_out_arlock),
    .io_out_ar_out_arcache(axi_crossbar_io_out_ar_out_arcache),
    .io_out_ar_out_arprot(axi_crossbar_io_out_ar_out_arprot),
    .io_out_ar_out_arvalid(axi_crossbar_io_out_ar_out_arvalid),
    .io_out_ar_arready(axi_crossbar_io_out_ar_arready),
    .io_out_aw_out_awid(axi_crossbar_io_out_aw_out_awid),
    .io_out_aw_out_awaddr(axi_crossbar_io_out_aw_out_awaddr),
    .io_out_aw_out_awlen(axi_crossbar_io_out_aw_out_awlen),
    .io_out_aw_out_awsize(axi_crossbar_io_out_aw_out_awsize),
    .io_out_aw_out_awburst(axi_crossbar_io_out_aw_out_awburst),
    .io_out_aw_out_awlock(axi_crossbar_io_out_aw_out_awlock),
    .io_out_aw_out_awcache(axi_crossbar_io_out_aw_out_awcache),
    .io_out_aw_out_awprot(axi_crossbar_io_out_aw_out_awprot),
    .io_out_aw_out_awvalid(axi_crossbar_io_out_aw_out_awvalid),
    .io_out_aw_awready(axi_crossbar_io_out_aw_awready),
    .io_out_w_out_wid(axi_crossbar_io_out_w_out_wid),
    .io_out_w_out_wdata(axi_crossbar_io_out_w_out_wdata),
    .io_out_w_out_wstrb(axi_crossbar_io_out_w_out_wstrb),
    .io_out_w_out_wlast(axi_crossbar_io_out_w_out_wlast),
    .io_out_w_out_wvalid(axi_crossbar_io_out_w_out_wvalid),
    .io_out_w_wready(axi_crossbar_io_out_w_wready),
    .io_out_r_in_rid(axi_crossbar_io_out_r_in_rid),
    .io_out_r_in_rdata(axi_crossbar_io_out_r_in_rdata),
    .io_out_r_in_rresp(axi_crossbar_io_out_r_in_rresp),
    .io_out_r_in_rlast(axi_crossbar_io_out_r_in_rlast),
    .io_out_r_in_rvalid(axi_crossbar_io_out_r_in_rvalid),
    .io_out_r_rready(axi_crossbar_io_out_r_rready),
    .io_out_b_in_bid(axi_crossbar_io_out_b_in_bid),
    .io_out_b_in_bresp(axi_crossbar_io_out_b_in_bresp),
    .io_out_b_in_bvalid(axi_crossbar_io_out_b_in_bvalid),
    .io_out_b_bready(axi_crossbar_io_out_b_bready)
  );
  MiniICache icache ( // @[src/main/scala/myCPU_top.scala 100:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_axi_master_ar_out_arid(icache_io_axi_master_ar_out_arid),
    .io_axi_master_ar_out_araddr(icache_io_axi_master_ar_out_araddr),
    .io_axi_master_ar_out_arlen(icache_io_axi_master_ar_out_arlen),
    .io_axi_master_ar_out_arsize(icache_io_axi_master_ar_out_arsize),
    .io_axi_master_ar_out_arburst(icache_io_axi_master_ar_out_arburst),
    .io_axi_master_ar_out_arlock(icache_io_axi_master_ar_out_arlock),
    .io_axi_master_ar_out_arcache(icache_io_axi_master_ar_out_arcache),
    .io_axi_master_ar_out_arprot(icache_io_axi_master_ar_out_arprot),
    .io_axi_master_ar_out_arvalid(icache_io_axi_master_ar_out_arvalid),
    .io_axi_master_ar_arready(icache_io_axi_master_ar_arready),
    .io_axi_master_aw_out_awid(icache_io_axi_master_aw_out_awid),
    .io_axi_master_aw_out_awaddr(icache_io_axi_master_aw_out_awaddr),
    .io_axi_master_aw_out_awlen(icache_io_axi_master_aw_out_awlen),
    .io_axi_master_aw_out_awsize(icache_io_axi_master_aw_out_awsize),
    .io_axi_master_aw_out_awburst(icache_io_axi_master_aw_out_awburst),
    .io_axi_master_aw_out_awlock(icache_io_axi_master_aw_out_awlock),
    .io_axi_master_aw_out_awcache(icache_io_axi_master_aw_out_awcache),
    .io_axi_master_aw_out_awprot(icache_io_axi_master_aw_out_awprot),
    .io_axi_master_aw_out_awvalid(icache_io_axi_master_aw_out_awvalid),
    .io_axi_master_aw_awready(icache_io_axi_master_aw_awready),
    .io_axi_master_w_out_wid(icache_io_axi_master_w_out_wid),
    .io_axi_master_w_out_wdata(icache_io_axi_master_w_out_wdata),
    .io_axi_master_w_out_wstrb(icache_io_axi_master_w_out_wstrb),
    .io_axi_master_w_out_wlast(icache_io_axi_master_w_out_wlast),
    .io_axi_master_w_out_wvalid(icache_io_axi_master_w_out_wvalid),
    .io_axi_master_w_wready(icache_io_axi_master_w_wready),
    .io_axi_master_r_in_rid(icache_io_axi_master_r_in_rid),
    .io_axi_master_r_in_rdata(icache_io_axi_master_r_in_rdata),
    .io_axi_master_r_in_rresp(icache_io_axi_master_r_in_rresp),
    .io_axi_master_r_in_rlast(icache_io_axi_master_r_in_rlast),
    .io_axi_master_r_in_rvalid(icache_io_axi_master_r_in_rvalid),
    .io_axi_master_r_rready(icache_io_axi_master_r_rready),
    .io_axi_master_b_in_bid(icache_io_axi_master_b_in_bid),
    .io_axi_master_b_in_bresp(icache_io_axi_master_b_in_bresp),
    .io_axi_master_b_in_bvalid(icache_io_axi_master_b_in_bvalid),
    .io_axi_master_b_bready(icache_io_axi_master_b_bready),
    .io_cpu_if_req_addr(icache_io_cpu_if_req_addr),
    .io_cpu_if_req_valid(icache_io_cpu_if_req_valid),
    .io_cpu_if_resp_data(icache_io_cpu_if_resp_data),
    .io_cpu_if_resp_valid(icache_io_cpu_if_resp_valid)
  );
  MiniICache dcache ( // @[src/main/scala/myCPU_top.scala 104:28]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_axi_master_ar_out_arid(dcache_io_axi_master_ar_out_arid),
    .io_axi_master_ar_out_araddr(dcache_io_axi_master_ar_out_araddr),
    .io_axi_master_ar_out_arlen(dcache_io_axi_master_ar_out_arlen),
    .io_axi_master_ar_out_arsize(dcache_io_axi_master_ar_out_arsize),
    .io_axi_master_ar_out_arburst(dcache_io_axi_master_ar_out_arburst),
    .io_axi_master_ar_out_arlock(dcache_io_axi_master_ar_out_arlock),
    .io_axi_master_ar_out_arcache(dcache_io_axi_master_ar_out_arcache),
    .io_axi_master_ar_out_arprot(dcache_io_axi_master_ar_out_arprot),
    .io_axi_master_ar_out_arvalid(dcache_io_axi_master_ar_out_arvalid),
    .io_axi_master_ar_arready(dcache_io_axi_master_ar_arready),
    .io_axi_master_aw_out_awid(dcache_io_axi_master_aw_out_awid),
    .io_axi_master_aw_out_awaddr(dcache_io_axi_master_aw_out_awaddr),
    .io_axi_master_aw_out_awlen(dcache_io_axi_master_aw_out_awlen),
    .io_axi_master_aw_out_awsize(dcache_io_axi_master_aw_out_awsize),
    .io_axi_master_aw_out_awburst(dcache_io_axi_master_aw_out_awburst),
    .io_axi_master_aw_out_awlock(dcache_io_axi_master_aw_out_awlock),
    .io_axi_master_aw_out_awcache(dcache_io_axi_master_aw_out_awcache),
    .io_axi_master_aw_out_awprot(dcache_io_axi_master_aw_out_awprot),
    .io_axi_master_aw_out_awvalid(dcache_io_axi_master_aw_out_awvalid),
    .io_axi_master_aw_awready(dcache_io_axi_master_aw_awready),
    .io_axi_master_w_out_wid(dcache_io_axi_master_w_out_wid),
    .io_axi_master_w_out_wdata(dcache_io_axi_master_w_out_wdata),
    .io_axi_master_w_out_wstrb(dcache_io_axi_master_w_out_wstrb),
    .io_axi_master_w_out_wlast(dcache_io_axi_master_w_out_wlast),
    .io_axi_master_w_out_wvalid(dcache_io_axi_master_w_out_wvalid),
    .io_axi_master_w_wready(dcache_io_axi_master_w_wready),
    .io_axi_master_r_in_rid(dcache_io_axi_master_r_in_rid),
    .io_axi_master_r_in_rdata(dcache_io_axi_master_r_in_rdata),
    .io_axi_master_r_in_rresp(dcache_io_axi_master_r_in_rresp),
    .io_axi_master_r_in_rlast(dcache_io_axi_master_r_in_rlast),
    .io_axi_master_r_in_rvalid(dcache_io_axi_master_r_in_rvalid),
    .io_axi_master_r_rready(dcache_io_axi_master_r_rready),
    .io_axi_master_b_in_bid(dcache_io_axi_master_b_in_bid),
    .io_axi_master_b_in_bresp(dcache_io_axi_master_b_in_bresp),
    .io_axi_master_b_in_bvalid(dcache_io_axi_master_b_in_bvalid),
    .io_axi_master_b_bready(dcache_io_axi_master_b_bready),
    .io_cpu_if_req_addr(dcache_io_cpu_if_req_addr),
    .io_cpu_if_req_valid(dcache_io_cpu_if_req_valid),
    .io_cpu_if_resp_data(dcache_io_cpu_if_resp_data),
    .io_cpu_if_resp_valid(dcache_io_cpu_if_resp_valid)
  );
  MiniICache uncache1 ( // @[src/main/scala/myCPU_top.scala 105:28]
    .clock(uncache1_clock),
    .reset(uncache1_reset),
    .io_axi_master_ar_out_arid(uncache1_io_axi_master_ar_out_arid),
    .io_axi_master_ar_out_araddr(uncache1_io_axi_master_ar_out_araddr),
    .io_axi_master_ar_out_arlen(uncache1_io_axi_master_ar_out_arlen),
    .io_axi_master_ar_out_arsize(uncache1_io_axi_master_ar_out_arsize),
    .io_axi_master_ar_out_arburst(uncache1_io_axi_master_ar_out_arburst),
    .io_axi_master_ar_out_arlock(uncache1_io_axi_master_ar_out_arlock),
    .io_axi_master_ar_out_arcache(uncache1_io_axi_master_ar_out_arcache),
    .io_axi_master_ar_out_arprot(uncache1_io_axi_master_ar_out_arprot),
    .io_axi_master_ar_out_arvalid(uncache1_io_axi_master_ar_out_arvalid),
    .io_axi_master_ar_arready(uncache1_io_axi_master_ar_arready),
    .io_axi_master_aw_out_awid(uncache1_io_axi_master_aw_out_awid),
    .io_axi_master_aw_out_awaddr(uncache1_io_axi_master_aw_out_awaddr),
    .io_axi_master_aw_out_awlen(uncache1_io_axi_master_aw_out_awlen),
    .io_axi_master_aw_out_awsize(uncache1_io_axi_master_aw_out_awsize),
    .io_axi_master_aw_out_awburst(uncache1_io_axi_master_aw_out_awburst),
    .io_axi_master_aw_out_awlock(uncache1_io_axi_master_aw_out_awlock),
    .io_axi_master_aw_out_awcache(uncache1_io_axi_master_aw_out_awcache),
    .io_axi_master_aw_out_awprot(uncache1_io_axi_master_aw_out_awprot),
    .io_axi_master_aw_out_awvalid(uncache1_io_axi_master_aw_out_awvalid),
    .io_axi_master_aw_awready(uncache1_io_axi_master_aw_awready),
    .io_axi_master_w_out_wid(uncache1_io_axi_master_w_out_wid),
    .io_axi_master_w_out_wdata(uncache1_io_axi_master_w_out_wdata),
    .io_axi_master_w_out_wstrb(uncache1_io_axi_master_w_out_wstrb),
    .io_axi_master_w_out_wlast(uncache1_io_axi_master_w_out_wlast),
    .io_axi_master_w_out_wvalid(uncache1_io_axi_master_w_out_wvalid),
    .io_axi_master_w_wready(uncache1_io_axi_master_w_wready),
    .io_axi_master_r_in_rid(uncache1_io_axi_master_r_in_rid),
    .io_axi_master_r_in_rdata(uncache1_io_axi_master_r_in_rdata),
    .io_axi_master_r_in_rresp(uncache1_io_axi_master_r_in_rresp),
    .io_axi_master_r_in_rlast(uncache1_io_axi_master_r_in_rlast),
    .io_axi_master_r_in_rvalid(uncache1_io_axi_master_r_in_rvalid),
    .io_axi_master_r_rready(uncache1_io_axi_master_r_rready),
    .io_axi_master_b_in_bid(uncache1_io_axi_master_b_in_bid),
    .io_axi_master_b_in_bresp(uncache1_io_axi_master_b_in_bresp),
    .io_axi_master_b_in_bvalid(uncache1_io_axi_master_b_in_bvalid),
    .io_axi_master_b_bready(uncache1_io_axi_master_b_bready),
    .io_cpu_if_req_addr(uncache1_io_cpu_if_req_addr),
    .io_cpu_if_req_valid(uncache1_io_cpu_if_req_valid),
    .io_cpu_if_resp_data(uncache1_io_cpu_if_resp_data),
    .io_cpu_if_resp_valid(uncache1_io_cpu_if_resp_valid)
  );
  MiniICache uncache2 ( // @[src/main/scala/myCPU_top.scala 106:28]
    .clock(uncache2_clock),
    .reset(uncache2_reset),
    .io_axi_master_ar_out_arid(uncache2_io_axi_master_ar_out_arid),
    .io_axi_master_ar_out_araddr(uncache2_io_axi_master_ar_out_araddr),
    .io_axi_master_ar_out_arlen(uncache2_io_axi_master_ar_out_arlen),
    .io_axi_master_ar_out_arsize(uncache2_io_axi_master_ar_out_arsize),
    .io_axi_master_ar_out_arburst(uncache2_io_axi_master_ar_out_arburst),
    .io_axi_master_ar_out_arlock(uncache2_io_axi_master_ar_out_arlock),
    .io_axi_master_ar_out_arcache(uncache2_io_axi_master_ar_out_arcache),
    .io_axi_master_ar_out_arprot(uncache2_io_axi_master_ar_out_arprot),
    .io_axi_master_ar_out_arvalid(uncache2_io_axi_master_ar_out_arvalid),
    .io_axi_master_ar_arready(uncache2_io_axi_master_ar_arready),
    .io_axi_master_aw_out_awid(uncache2_io_axi_master_aw_out_awid),
    .io_axi_master_aw_out_awaddr(uncache2_io_axi_master_aw_out_awaddr),
    .io_axi_master_aw_out_awlen(uncache2_io_axi_master_aw_out_awlen),
    .io_axi_master_aw_out_awsize(uncache2_io_axi_master_aw_out_awsize),
    .io_axi_master_aw_out_awburst(uncache2_io_axi_master_aw_out_awburst),
    .io_axi_master_aw_out_awlock(uncache2_io_axi_master_aw_out_awlock),
    .io_axi_master_aw_out_awcache(uncache2_io_axi_master_aw_out_awcache),
    .io_axi_master_aw_out_awprot(uncache2_io_axi_master_aw_out_awprot),
    .io_axi_master_aw_out_awvalid(uncache2_io_axi_master_aw_out_awvalid),
    .io_axi_master_aw_awready(uncache2_io_axi_master_aw_awready),
    .io_axi_master_w_out_wid(uncache2_io_axi_master_w_out_wid),
    .io_axi_master_w_out_wdata(uncache2_io_axi_master_w_out_wdata),
    .io_axi_master_w_out_wstrb(uncache2_io_axi_master_w_out_wstrb),
    .io_axi_master_w_out_wlast(uncache2_io_axi_master_w_out_wlast),
    .io_axi_master_w_out_wvalid(uncache2_io_axi_master_w_out_wvalid),
    .io_axi_master_w_wready(uncache2_io_axi_master_w_wready),
    .io_axi_master_r_in_rid(uncache2_io_axi_master_r_in_rid),
    .io_axi_master_r_in_rdata(uncache2_io_axi_master_r_in_rdata),
    .io_axi_master_r_in_rresp(uncache2_io_axi_master_r_in_rresp),
    .io_axi_master_r_in_rlast(uncache2_io_axi_master_r_in_rlast),
    .io_axi_master_r_in_rvalid(uncache2_io_axi_master_r_in_rvalid),
    .io_axi_master_r_rready(uncache2_io_axi_master_r_rready),
    .io_axi_master_b_in_bid(uncache2_io_axi_master_b_in_bid),
    .io_axi_master_b_in_bresp(uncache2_io_axi_master_b_in_bresp),
    .io_axi_master_b_in_bvalid(uncache2_io_axi_master_b_in_bvalid),
    .io_axi_master_b_bready(uncache2_io_axi_master_b_bready),
    .io_cpu_if_req_addr(uncache2_io_cpu_if_req_addr),
    .io_cpu_if_req_valid(uncache2_io_cpu_if_req_valid),
    .io_cpu_if_resp_data(uncache2_io_cpu_if_resp_data),
    .io_cpu_if_resp_valid(uncache2_io_cpu_if_resp_valid)
  );
  DifftestInCore difftest ( // @[src/main/scala/myCPU_top.scala 194:24]
    .clock(difftest_clock),
    .reset(difftest_reset),
    .io_inst_valid_diff(difftest_io_inst_valid_diff),
    .io_debug0_wb_pc(difftest_io_debug0_wb_pc)
  );
  assign arid = axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/myCPU_top.scala 136:11]
  assign araddr = axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 137:11]
  assign arlen = axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 138:11]
  assign arsize = axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 139:11]
  assign arburst = axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 140:11]
  assign arlock = axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 141:11]
  assign arcache = axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 142:11]
  assign arprot = axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 143:11]
  assign arvalid = axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 144:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 155:10]
  assign awid = axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/myCPU_top.scala 158:11]
  assign awaddr = axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 159:11]
  assign awlen = axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 160:11]
  assign awsize = axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 161:11]
  assign awburst = axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 162:11]
  assign awlock = axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 163:11]
  assign awcache = axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 164:11]
  assign awprot = axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 165:11]
  assign awvalid = axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 166:11]
  assign wid = axi_crossbar_io_out_w_out_wid; // @[src/main/scala/myCPU_top.scala 170:11]
  assign wdata = axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/myCPU_top.scala 171:11]
  assign wstrb = axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 172:11]
  assign wlast = axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/myCPU_top.scala 173:11]
  assign wvalid = axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 174:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 183:10]
  assign ws_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 89:12]
  assign rf_rdata = 32'h0; // @[src/main/scala/myCPU_top.scala 90:12]
  assign debug0_wb_pc = 32'h0; // @[src/main/scala/myCPU_top.scala 84:16]
  assign debug0_wb_rf_wen = 1'h0; // @[src/main/scala/myCPU_top.scala 85:20]
  assign debug0_wb_rf_wnum = 5'h0; // @[src/main/scala/myCPU_top.scala 86:21]
  assign debug0_wb_rf_wdata = 32'h0; // @[src/main/scala/myCPU_top.scala 87:22]
  assign debug0_wb_inst = 32'h0; // @[src/main/scala/myCPU_top.scala 88:18]
  assign axi_crossbar_io_in_icache_ar_out_arid = icache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_araddr = icache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arlen = icache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arsize = icache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arburst = icache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arlock = icache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arcache = icache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arprot = icache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_ar_out_arvalid = icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awid = icache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awaddr = icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awlen = icache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awsize = icache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awburst = icache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awlock = icache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awcache = icache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awprot = icache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_aw_out_awvalid = icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_w_out_wid = icache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_w_out_wdata = icache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_w_out_wstrb = icache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_w_out_wlast = icache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_w_out_wvalid = icache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_icache_b_bready = icache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_dcache_ar_out_arid = dcache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_araddr = dcache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlen = dcache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arsize = dcache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arburst = dcache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlock = dcache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arcache = dcache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arprot = dcache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_ar_out_arvalid = dcache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awid = dcache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awaddr = dcache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlen = dcache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awsize = dcache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awburst = dcache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlock = dcache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awcache = dcache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awprot = dcache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_aw_out_awvalid = dcache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_w_out_wid = dcache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_w_out_wdata = dcache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_w_out_wstrb = dcache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_w_out_wlast = dcache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_w_out_wvalid = dcache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_r_rready = dcache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_dcache_b_bready = dcache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 130:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arid = uncache1_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_araddr = uncache1_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlen = uncache1_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arsize = uncache1_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arburst = uncache1_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlock = uncache1_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arcache = uncache1_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arprot = uncache1_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arvalid = uncache1_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awid = uncache1_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awaddr = uncache1_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlen = uncache1_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awsize = uncache1_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awburst = uncache1_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlock = uncache1_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awcache = uncache1_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awprot = uncache1_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awvalid = uncache1_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_w_out_wid = uncache1_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_w_out_wdata = uncache1_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_w_out_wstrb = uncache1_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_w_out_wlast = uncache1_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_w_out_wvalid = uncache1_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 131:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arid = uncache2_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_araddr = uncache2_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlen = uncache2_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arsize = uncache2_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arburst = uncache2_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlock = uncache2_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arcache = uncache2_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arprot = uncache2_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arvalid = uncache2_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awid = uncache2_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awaddr = uncache2_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlen = uncache2_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awsize = uncache2_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awburst = uncache2_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlock = uncache2_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awcache = uncache2_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awprot = uncache2_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awvalid = uncache2_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_w_out_wid = uncache2_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_w_out_wdata = uncache2_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_w_out_wstrb = uncache2_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_w_out_wlast = uncache2_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_w_out_wvalid = uncache2_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 132:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/myCPU_top.scala 145:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/myCPU_top.scala 167:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/myCPU_top.scala 175:32]
  assign axi_crossbar_io_out_r_in_rid = rid; // @[src/main/scala/myCPU_top.scala 148:20 149:17]
  assign axi_crossbar_io_out_r_in_rdata = rdata; // @[src/main/scala/myCPU_top.scala 148:20 150:17]
  assign axi_crossbar_io_out_r_in_rresp = rresp; // @[src/main/scala/myCPU_top.scala 148:20 151:17]
  assign axi_crossbar_io_out_r_in_rlast = rlast; // @[src/main/scala/myCPU_top.scala 148:20 152:17]
  assign axi_crossbar_io_out_r_in_rvalid = rvalid; // @[src/main/scala/myCPU_top.scala 148:20 153:17]
  assign axi_crossbar_io_out_b_in_bid = bid; // @[src/main/scala/myCPU_top.scala 178:20 179:17]
  assign axi_crossbar_io_out_b_in_bresp = bresp; // @[src/main/scala/myCPU_top.scala 178:20 180:17]
  assign axi_crossbar_io_out_b_in_bvalid = bvalid; // @[src/main/scala/myCPU_top.scala 178:20 181:17]
  assign icache_clock = aclk;
  assign icache_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign icache_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_aw_awready = axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_w_wready = axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_r_in_rid = axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_r_in_rdata = axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_r_in_rresp = axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_r_in_rlast = axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_r_in_rvalid = axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_b_in_bid = axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_b_in_bresp = axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_axi_master_b_in_bvalid = axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign icache_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 112:30]
  assign icache_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 113:30]
  assign dcache_clock = aclk;
  assign dcache_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign dcache_io_axi_master_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_r_in_rid = axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_r_in_rdata = axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_r_in_rresp = axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_r_in_rlast = axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_r_in_rvalid = axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_b_in_bid = axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_b_in_bresp = axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_axi_master_b_in_bvalid = axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 130:31]
  assign dcache_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 115:30]
  assign dcache_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 116:30]
  assign uncache1_clock = aclk;
  assign uncache1_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign uncache1_io_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_w_wready = axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_r_in_rid = axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_r_in_rdata = axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_r_in_rresp = axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_r_in_rlast = axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_b_in_bid = axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_b_in_bresp = axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 131:31]
  assign uncache1_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 118:32]
  assign uncache1_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 119:32]
  assign uncache2_clock = aclk;
  assign uncache2_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign uncache2_io_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_w_wready = axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_r_in_rid = axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_r_in_rdata = axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_r_in_rresp = axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_r_in_rlast = axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_b_in_bid = axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_b_in_bresp = axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 132:31]
  assign uncache2_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 121:32]
  assign uncache2_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 122:32]
  assign difftest_clock = aclk;
  assign difftest_reset = ~aresetn; // @[src/main/scala/myCPU_top.scala 92:27]
  assign difftest_io_inst_valid_diff = reg_[4]; // @[src/main/scala/myCPU_top.scala 197:37]
  assign difftest_io_debug0_wb_pc = reg_; // @[src/main/scala/myCPU_top.scala 213:28]
  always @(posedge aclk) begin
    if (_T) begin // @[src/main/scala/myCPU_top.scala 188:20]
      reg_ <= 64'h0; // @[src/main/scala/myCPU_top.scala 188:20]
    end else begin
      reg_ <= _reg_T_1; // @[src/main/scala/myCPU_top.scala 189:7]
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
