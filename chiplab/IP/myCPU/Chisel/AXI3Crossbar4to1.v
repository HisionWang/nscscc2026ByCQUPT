module AXI3Crossbar4to1(
  input         clock,
  input         reset,
  input  [31:0] io_in_icache_ar_data_araddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_icache_ar_data_arlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_icache_ar_data_arsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_icache_ar_data_arburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_icache_ar_data_arvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_icache_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_in_icache_r_data_rdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_icache_r_data_rlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_icache_r_data_rvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_icache_r_rready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_ar_data_arid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_dcache_ar_data_araddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_dcache_ar_data_arlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_dcache_ar_data_arsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_dcache_ar_data_arburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_dcache_ar_data_arlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_ar_data_arcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_dcache_ar_data_arprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_ar_data_arvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_aw_data_awid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_dcache_aw_data_awaddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_dcache_aw_data_awlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_dcache_aw_data_awsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_dcache_aw_data_awburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_dcache_aw_data_awlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_aw_data_awcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_dcache_aw_data_awprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_aw_data_awvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_w_data_wid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_dcache_w_data_wdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_dcache_w_data_wstrb, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_w_data_wlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_w_data_wvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_w_wready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_dcache_r_data_rid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_in_dcache_r_data_rdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_dcache_r_data_rresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_r_data_rlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_r_data_rvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_r_rready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_dcache_b_data_bid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_dcache_b_data_bresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_dcache_b_data_bvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_dcache_b_bready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_ar_data_arid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache1_ar_data_araddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_uncache1_ar_data_arlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache1_ar_data_arsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache1_ar_data_arburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache1_ar_data_arlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_ar_data_arcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache1_ar_data_arprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_ar_data_arvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_aw_data_awid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache1_aw_data_awaddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_uncache1_aw_data_awlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache1_aw_data_awsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache1_aw_data_awburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache1_aw_data_awlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_aw_data_awcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache1_aw_data_awprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_aw_data_awvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_w_data_wid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache1_w_data_wdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache1_w_data_wstrb, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_w_data_wlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_w_data_wvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_w_wready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_uncache1_r_data_rid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_in_uncache1_r_data_rdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_uncache1_r_data_rresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_r_data_rlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_r_data_rvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_r_rready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_uncache1_b_data_bid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_uncache1_b_data_bresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache1_b_data_bvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache1_b_bready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_ar_data_arid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache2_ar_data_araddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_uncache2_ar_data_arlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache2_ar_data_arsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache2_ar_data_arburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache2_ar_data_arlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_ar_data_arcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache2_ar_data_arprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_ar_data_arvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_aw_data_awid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache2_aw_data_awaddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [7:0]  io_in_uncache2_aw_data_awlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache2_aw_data_awsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache2_aw_data_awburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_in_uncache2_aw_data_awlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_aw_data_awcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [2:0]  io_in_uncache2_aw_data_awprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_aw_data_awvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_w_data_wid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_in_uncache2_w_data_wdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_in_uncache2_w_data_wstrb, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_w_data_wlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_w_data_wvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_w_wready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_uncache2_r_data_rid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_in_uncache2_r_data_rdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_uncache2_r_data_rresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_r_data_rlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_r_data_rvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_r_rready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_in_uncache2_b_data_bid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_in_uncache2_b_data_bresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_in_uncache2_b_data_bvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_in_uncache2_b_bready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_ar_data_arid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_out_ar_data_araddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [7:0]  io_out_ar_data_arlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [2:0]  io_out_ar_data_arsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_out_ar_data_arburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_out_ar_data_arlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_ar_data_arcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [2:0]  io_out_ar_data_arprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_ar_data_arvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_aw_data_awid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_out_aw_data_awaddr, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [7:0]  io_out_aw_data_awlen, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [2:0]  io_out_aw_data_awsize, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_out_aw_data_awburst, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [1:0]  io_out_aw_data_awlock, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_aw_data_awcache, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [2:0]  io_out_aw_data_awprot, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_aw_data_awvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_w_data_wid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [31:0] io_out_w_data_wdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output [3:0]  io_out_w_data_wstrb, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_w_data_wlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_w_data_wvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_w_wready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_out_r_data_rid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [31:0] io_out_r_data_rdata, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_out_r_data_rresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_r_data_rlast, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_r_data_rvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_r_rready, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [3:0]  io_out_b_data_bid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input  [1:0]  io_out_b_data_bresp, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  input         io_out_b_data_bvalid, // @[src/main/scala/AXI3Crossbar.scala 10:14]
  output        io_out_b_bready // @[src/main/scala/AXI3Crossbar.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  ar_arbiter_io_in_0_ready; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_0_valid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [31:0] ar_arbiter_io_in_0_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [7:0] ar_arbiter_io_in_0_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_0_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_0_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_1_ready; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_1_valid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_1_bits_arid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [31:0] ar_arbiter_io_in_1_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [7:0] ar_arbiter_io_in_1_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_1_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_1_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_1_bits_arlock; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_1_bits_arcache; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_1_bits_arprot; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_2_ready; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_2_valid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_2_bits_arid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [31:0] ar_arbiter_io_in_2_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [7:0] ar_arbiter_io_in_2_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_2_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_2_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_2_bits_arlock; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_2_bits_arcache; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_2_bits_arprot; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_3_ready; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_in_3_valid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_3_bits_arid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [31:0] ar_arbiter_io_in_3_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [7:0] ar_arbiter_io_in_3_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_3_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_3_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_in_3_bits_arlock; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_in_3_bits_arcache; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_in_3_bits_arprot; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_out_ready; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  ar_arbiter_io_out_valid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_out_bits_arid; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [31:0] ar_arbiter_io_out_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [7:0] ar_arbiter_io_out_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_out_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_out_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [1:0] ar_arbiter_io_out_bits_arlock; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [3:0] ar_arbiter_io_out_bits_arcache; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire [2:0] ar_arbiter_io_out_bits_arprot; // @[src/main/scala/AXI3Crossbar.scala 33:26]
  wire  aw_arbiter_io_in_1_ready; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_in_1_valid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_1_bits_awid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [31:0] aw_arbiter_io_in_1_bits_awaddr; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [7:0] aw_arbiter_io_in_1_bits_awlen; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_1_bits_awsize; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_1_bits_awburst; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_1_bits_awlock; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_1_bits_awcache; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_1_bits_awprot; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_in_2_ready; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_in_2_valid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_2_bits_awid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [31:0] aw_arbiter_io_in_2_bits_awaddr; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [7:0] aw_arbiter_io_in_2_bits_awlen; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_2_bits_awsize; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_2_bits_awburst; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_2_bits_awlock; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_2_bits_awcache; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_2_bits_awprot; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_in_3_ready; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_in_3_valid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_3_bits_awid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [31:0] aw_arbiter_io_in_3_bits_awaddr; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [7:0] aw_arbiter_io_in_3_bits_awlen; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_3_bits_awsize; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_3_bits_awburst; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_in_3_bits_awlock; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_in_3_bits_awcache; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_in_3_bits_awprot; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_out_ready; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire  aw_arbiter_io_out_valid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_out_bits_awid; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [31:0] aw_arbiter_io_out_bits_awaddr; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [7:0] aw_arbiter_io_out_bits_awlen; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_out_bits_awsize; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_out_bits_awburst; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_out_bits_awlock; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [3:0] aw_arbiter_io_out_bits_awcache; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [2:0] aw_arbiter_io_out_bits_awprot; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] aw_arbiter_io_chosen; // @[src/main/scala/AXI3Crossbar.scala 125:26]
  wire [1:0] r_id_route = io_out_r_data_rid[3:2]; // @[src/main/scala/AXI3Crossbar.scala 63:37]
  wire [3:0] _GEN_0 = 2'h3 == r_id_route ? io_out_r_data_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 108:31 78:30]
  wire [31:0] _GEN_1 = 2'h3 == r_id_route ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 108:31 83:31]
  wire [1:0] _GEN_2 = 2'h3 == r_id_route ? io_out_r_data_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 108:31 88:31]
  wire  _GEN_3 = 2'h3 == r_id_route & io_out_r_data_rlast; // @[src/main/scala/AXI3Crossbar.scala 97:24 108:31 93:31]
  wire  _GEN_4 = 2'h3 == r_id_route & io_out_r_data_rvalid; // @[src/main/scala/AXI3Crossbar.scala 97:24 108:31 72:32]
  wire [3:0] _GEN_5 = 2'h2 == r_id_route ? io_out_r_data_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 105:31 77:30]
  wire [31:0] _GEN_6 = 2'h2 == r_id_route ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 105:31 82:31]
  wire [1:0] _GEN_7 = 2'h2 == r_id_route ? io_out_r_data_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 105:31 87:31]
  wire  _GEN_8 = 2'h2 == r_id_route & io_out_r_data_rlast; // @[src/main/scala/AXI3Crossbar.scala 97:24 105:31 92:31]
  wire  _GEN_9 = 2'h2 == r_id_route & io_out_r_data_rvalid; // @[src/main/scala/AXI3Crossbar.scala 97:24 105:31 71:32]
  wire [3:0] _GEN_10 = 2'h2 == r_id_route ? 4'h0 : _GEN_0; // @[src/main/scala/AXI3Crossbar.scala 97:24 78:30]
  wire [31:0] _GEN_11 = 2'h2 == r_id_route ? 32'h0 : _GEN_1; // @[src/main/scala/AXI3Crossbar.scala 97:24 83:31]
  wire [1:0] _GEN_12 = 2'h2 == r_id_route ? 2'h0 : _GEN_2; // @[src/main/scala/AXI3Crossbar.scala 97:24 88:31]
  wire  _GEN_13 = 2'h2 == r_id_route ? 1'h0 : _GEN_3; // @[src/main/scala/AXI3Crossbar.scala 97:24 93:31]
  wire  _GEN_14 = 2'h2 == r_id_route ? 1'h0 : _GEN_4; // @[src/main/scala/AXI3Crossbar.scala 97:24 72:32]
  wire [3:0] _GEN_15 = 2'h1 == r_id_route ? io_out_r_data_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 102:29 76:30]
  wire [31:0] _GEN_16 = 2'h1 == r_id_route ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 102:29 81:30]
  wire [1:0] _GEN_17 = 2'h1 == r_id_route ? io_out_r_data_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 102:29 86:30]
  wire  _GEN_18 = 2'h1 == r_id_route & io_out_r_data_rlast; // @[src/main/scala/AXI3Crossbar.scala 97:24 102:29 91:30]
  wire  _GEN_19 = 2'h1 == r_id_route & io_out_r_data_rvalid; // @[src/main/scala/AXI3Crossbar.scala 97:24 102:29 70:32]
  wire [3:0] _GEN_20 = 2'h1 == r_id_route ? 4'h0 : _GEN_5; // @[src/main/scala/AXI3Crossbar.scala 97:24 77:30]
  wire [31:0] _GEN_21 = 2'h1 == r_id_route ? 32'h0 : _GEN_6; // @[src/main/scala/AXI3Crossbar.scala 97:24 82:31]
  wire [1:0] _GEN_22 = 2'h1 == r_id_route ? 2'h0 : _GEN_7; // @[src/main/scala/AXI3Crossbar.scala 97:24 87:31]
  wire  _GEN_23 = 2'h1 == r_id_route ? 1'h0 : _GEN_8; // @[src/main/scala/AXI3Crossbar.scala 97:24 92:31]
  wire  _GEN_24 = 2'h1 == r_id_route ? 1'h0 : _GEN_9; // @[src/main/scala/AXI3Crossbar.scala 97:24 71:32]
  wire [3:0] _GEN_25 = 2'h1 == r_id_route ? 4'h0 : _GEN_10; // @[src/main/scala/AXI3Crossbar.scala 97:24 78:30]
  wire [31:0] _GEN_26 = 2'h1 == r_id_route ? 32'h0 : _GEN_11; // @[src/main/scala/AXI3Crossbar.scala 97:24 83:31]
  wire [1:0] _GEN_27 = 2'h1 == r_id_route ? 2'h0 : _GEN_12; // @[src/main/scala/AXI3Crossbar.scala 97:24 88:31]
  wire  _GEN_28 = 2'h1 == r_id_route ? 1'h0 : _GEN_13; // @[src/main/scala/AXI3Crossbar.scala 97:24 93:31]
  wire  _GEN_29 = 2'h1 == r_id_route ? 1'h0 : _GEN_14; // @[src/main/scala/AXI3Crossbar.scala 97:24 72:32]
  wire [31:0] _GEN_31 = 2'h0 == r_id_route ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 97:24 99:29 80:30]
  wire  _GEN_33 = 2'h0 == r_id_route & io_out_r_data_rlast; // @[src/main/scala/AXI3Crossbar.scala 97:24 99:29 90:30]
  wire  _GEN_34 = 2'h0 == r_id_route & io_out_r_data_rvalid; // @[src/main/scala/AXI3Crossbar.scala 97:24 99:29 69:32]
  wire [3:0] _GEN_35 = 2'h0 == r_id_route ? 4'h0 : _GEN_15; // @[src/main/scala/AXI3Crossbar.scala 97:24 76:30]
  wire [31:0] _GEN_36 = 2'h0 == r_id_route ? 32'h0 : _GEN_16; // @[src/main/scala/AXI3Crossbar.scala 97:24 81:30]
  wire [1:0] _GEN_37 = 2'h0 == r_id_route ? 2'h0 : _GEN_17; // @[src/main/scala/AXI3Crossbar.scala 97:24 86:30]
  wire  _GEN_38 = 2'h0 == r_id_route ? 1'h0 : _GEN_18; // @[src/main/scala/AXI3Crossbar.scala 97:24 91:30]
  wire  _GEN_39 = 2'h0 == r_id_route ? 1'h0 : _GEN_19; // @[src/main/scala/AXI3Crossbar.scala 97:24 70:32]
  wire [3:0] _GEN_40 = 2'h0 == r_id_route ? 4'h0 : _GEN_20; // @[src/main/scala/AXI3Crossbar.scala 97:24 77:30]
  wire [31:0] _GEN_41 = 2'h0 == r_id_route ? 32'h0 : _GEN_21; // @[src/main/scala/AXI3Crossbar.scala 97:24 82:31]
  wire [1:0] _GEN_42 = 2'h0 == r_id_route ? 2'h0 : _GEN_22; // @[src/main/scala/AXI3Crossbar.scala 97:24 87:31]
  wire  _GEN_43 = 2'h0 == r_id_route ? 1'h0 : _GEN_23; // @[src/main/scala/AXI3Crossbar.scala 97:24 92:31]
  wire  _GEN_44 = 2'h0 == r_id_route ? 1'h0 : _GEN_24; // @[src/main/scala/AXI3Crossbar.scala 97:24 71:32]
  wire [3:0] _GEN_45 = 2'h0 == r_id_route ? 4'h0 : _GEN_25; // @[src/main/scala/AXI3Crossbar.scala 97:24 78:30]
  wire [31:0] _GEN_46 = 2'h0 == r_id_route ? 32'h0 : _GEN_26; // @[src/main/scala/AXI3Crossbar.scala 97:24 83:31]
  wire [1:0] _GEN_47 = 2'h0 == r_id_route ? 2'h0 : _GEN_27; // @[src/main/scala/AXI3Crossbar.scala 97:24 88:31]
  wire  _GEN_48 = 2'h0 == r_id_route ? 1'h0 : _GEN_28; // @[src/main/scala/AXI3Crossbar.scala 97:24 93:31]
  wire  _GEN_49 = 2'h0 == r_id_route ? 1'h0 : _GEN_29; // @[src/main/scala/AXI3Crossbar.scala 97:24 72:32]
  wire  _io_out_r_rready_T = r_id_route == 2'h0; // @[src/main/scala/AXI3Crossbar.scala 116:19]
  wire  _io_out_r_rready_T_1 = r_id_route == 2'h1; // @[src/main/scala/AXI3Crossbar.scala 117:19]
  wire  _io_out_r_rready_T_2 = r_id_route == 2'h2; // @[src/main/scala/AXI3Crossbar.scala 118:19]
  wire  _io_out_r_rready_T_3 = r_id_route == 2'h3; // @[src/main/scala/AXI3Crossbar.scala 119:19]
  reg  aw_master_valid; // @[src/main/scala/AXI3Crossbar.scala 153:32]
  reg [1:0] aw_master_idx; // @[src/main/scala/AXI3Crossbar.scala 154:26]
  wire  _T_4 = aw_arbiter_io_out_ready & aw_arbiter_io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_70 = io_out_w_data_wlast & io_out_w_data_wvalid & io_out_w_wready ? 1'h0 : aw_master_valid; // @[src/main/scala/AXI3Crossbar.scala 159:78 160:21 153:32]
  wire  _GEN_71 = _T_4 | _GEN_70; // @[src/main/scala/AXI3Crossbar.scala 156:34 157:21]
  wire [3:0] _GEN_73 = 2'h3 == aw_master_idx ? io_in_uncache2_w_data_wid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 181:27 195:23 167:24]
  wire [31:0] _GEN_74 = 2'h3 == aw_master_idx ? io_in_uncache2_w_data_wdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 181:27 195:23 168:24]
  wire [3:0] _GEN_75 = 2'h3 == aw_master_idx ? io_in_uncache2_w_data_wstrb : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 181:27 195:23 169:24]
  wire  _GEN_76 = 2'h3 == aw_master_idx & io_in_uncache2_w_data_wlast; // @[src/main/scala/AXI3Crossbar.scala 181:27 195:23 170:24]
  wire  _GEN_77 = 2'h3 == aw_master_idx & io_in_uncache2_w_data_wvalid; // @[src/main/scala/AXI3Crossbar.scala 181:27 195:23 171:24]
  wire  _GEN_78 = 2'h3 == aw_master_idx & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 177:27 181:27 196:33]
  wire [3:0] _GEN_79 = 2'h2 == aw_master_idx ? io_in_uncache1_w_data_wid : _GEN_73; // @[src/main/scala/AXI3Crossbar.scala 181:27 191:23]
  wire [31:0] _GEN_80 = 2'h2 == aw_master_idx ? io_in_uncache1_w_data_wdata : _GEN_74; // @[src/main/scala/AXI3Crossbar.scala 181:27 191:23]
  wire [3:0] _GEN_81 = 2'h2 == aw_master_idx ? io_in_uncache1_w_data_wstrb : _GEN_75; // @[src/main/scala/AXI3Crossbar.scala 181:27 191:23]
  wire  _GEN_82 = 2'h2 == aw_master_idx ? io_in_uncache1_w_data_wlast : _GEN_76; // @[src/main/scala/AXI3Crossbar.scala 181:27 191:23]
  wire  _GEN_83 = 2'h2 == aw_master_idx ? io_in_uncache1_w_data_wvalid : _GEN_77; // @[src/main/scala/AXI3Crossbar.scala 181:27 191:23]
  wire  _GEN_84 = 2'h2 == aw_master_idx & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 176:27 181:27 192:33]
  wire  _GEN_85 = 2'h2 == aw_master_idx ? 1'h0 : _GEN_78; // @[src/main/scala/AXI3Crossbar.scala 177:27 181:27]
  wire [3:0] _GEN_86 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wid : _GEN_79; // @[src/main/scala/AXI3Crossbar.scala 181:27 187:23]
  wire [31:0] _GEN_87 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wdata : _GEN_80; // @[src/main/scala/AXI3Crossbar.scala 181:27 187:23]
  wire [3:0] _GEN_88 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wstrb : _GEN_81; // @[src/main/scala/AXI3Crossbar.scala 181:27 187:23]
  wire  _GEN_89 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wlast : _GEN_82; // @[src/main/scala/AXI3Crossbar.scala 181:27 187:23]
  wire  _GEN_90 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wvalid : _GEN_83; // @[src/main/scala/AXI3Crossbar.scala 181:27 187:23]
  wire  _GEN_91 = 2'h1 == aw_master_idx & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 175:27 181:27 188:31]
  wire  _GEN_92 = 2'h1 == aw_master_idx ? 1'h0 : _GEN_84; // @[src/main/scala/AXI3Crossbar.scala 176:27 181:27]
  wire  _GEN_93 = 2'h1 == aw_master_idx ? 1'h0 : _GEN_85; // @[src/main/scala/AXI3Crossbar.scala 177:27 181:27]
  wire [3:0] _GEN_94 = 2'h0 == aw_master_idx ? 4'h0 : _GEN_86; // @[src/main/scala/AXI3Crossbar.scala 181:27 183:23]
  wire [31:0] _GEN_95 = 2'h0 == aw_master_idx ? 32'h0 : _GEN_87; // @[src/main/scala/AXI3Crossbar.scala 181:27 183:23]
  wire [3:0] _GEN_96 = 2'h0 == aw_master_idx ? 4'h0 : _GEN_88; // @[src/main/scala/AXI3Crossbar.scala 181:27 183:23]
  wire  _GEN_97 = 2'h0 == aw_master_idx ? 1'h0 : _GEN_89; // @[src/main/scala/AXI3Crossbar.scala 181:27 183:23]
  wire  _GEN_98 = 2'h0 == aw_master_idx ? 1'h0 : _GEN_90; // @[src/main/scala/AXI3Crossbar.scala 181:27 183:23]
  wire  _GEN_100 = 2'h0 == aw_master_idx ? 1'h0 : _GEN_91; // @[src/main/scala/AXI3Crossbar.scala 175:27 181:27]
  wire  _GEN_101 = 2'h0 == aw_master_idx ? 1'h0 : _GEN_92; // @[src/main/scala/AXI3Crossbar.scala 176:27 181:27]
  wire  _GEN_102 = 2'h0 == aw_master_idx ? 1'h0 : _GEN_93; // @[src/main/scala/AXI3Crossbar.scala 177:27 181:27]
  wire [1:0] b_id_route = io_out_b_data_bid[3:2]; // @[src/main/scala/AXI3Crossbar.scala 203:37]
  wire [3:0] _GEN_112 = 2'h3 == b_id_route ? io_out_b_data_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 218:30 238:31]
  wire [1:0] _GEN_113 = 2'h3 == b_id_route ? io_out_b_data_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 223:31 238:31]
  wire  _GEN_114 = 2'h3 == b_id_route & io_out_b_data_bvalid; // @[src/main/scala/AXI3Crossbar.scala 227:24 238:31 212:32]
  wire [3:0] _GEN_115 = 2'h2 == b_id_route ? io_out_b_data_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 217:30 235:31]
  wire [1:0] _GEN_116 = 2'h2 == b_id_route ? io_out_b_data_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 222:31 235:31]
  wire  _GEN_117 = 2'h2 == b_id_route & io_out_b_data_bvalid; // @[src/main/scala/AXI3Crossbar.scala 227:24 235:31 211:32]
  wire [3:0] _GEN_118 = 2'h2 == b_id_route ? 4'h0 : _GEN_112; // @[src/main/scala/AXI3Crossbar.scala 227:24 218:30]
  wire [1:0] _GEN_119 = 2'h2 == b_id_route ? 2'h0 : _GEN_113; // @[src/main/scala/AXI3Crossbar.scala 227:24 223:31]
  wire  _GEN_120 = 2'h2 == b_id_route ? 1'h0 : _GEN_114; // @[src/main/scala/AXI3Crossbar.scala 227:24 212:32]
  wire [3:0] _GEN_121 = 2'h1 == b_id_route ? io_out_b_data_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 232:29 216:30]
  wire [1:0] _GEN_122 = 2'h1 == b_id_route ? io_out_b_data_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 227:24 232:29 221:30]
  wire  _GEN_123 = 2'h1 == b_id_route & io_out_b_data_bvalid; // @[src/main/scala/AXI3Crossbar.scala 227:24 232:29 210:32]
  wire [3:0] _GEN_124 = 2'h1 == b_id_route ? 4'h0 : _GEN_115; // @[src/main/scala/AXI3Crossbar.scala 227:24 217:30]
  wire [1:0] _GEN_125 = 2'h1 == b_id_route ? 2'h0 : _GEN_116; // @[src/main/scala/AXI3Crossbar.scala 227:24 222:31]
  wire  _GEN_126 = 2'h1 == b_id_route ? 1'h0 : _GEN_117; // @[src/main/scala/AXI3Crossbar.scala 227:24 211:32]
  wire [3:0] _GEN_127 = 2'h1 == b_id_route ? 4'h0 : _GEN_118; // @[src/main/scala/AXI3Crossbar.scala 227:24 218:30]
  wire [1:0] _GEN_128 = 2'h1 == b_id_route ? 2'h0 : _GEN_119; // @[src/main/scala/AXI3Crossbar.scala 227:24 223:31]
  wire  _GEN_129 = 2'h1 == b_id_route ? 1'h0 : _GEN_120; // @[src/main/scala/AXI3Crossbar.scala 227:24 212:32]
  wire [3:0] _GEN_133 = 2'h0 == b_id_route ? 4'h0 : _GEN_121; // @[src/main/scala/AXI3Crossbar.scala 227:24 216:30]
  wire [1:0] _GEN_134 = 2'h0 == b_id_route ? 2'h0 : _GEN_122; // @[src/main/scala/AXI3Crossbar.scala 227:24 221:30]
  wire  _GEN_135 = 2'h0 == b_id_route ? 1'h0 : _GEN_123; // @[src/main/scala/AXI3Crossbar.scala 227:24 210:32]
  wire [3:0] _GEN_136 = 2'h0 == b_id_route ? 4'h0 : _GEN_124; // @[src/main/scala/AXI3Crossbar.scala 227:24 217:30]
  wire [1:0] _GEN_137 = 2'h0 == b_id_route ? 2'h0 : _GEN_125; // @[src/main/scala/AXI3Crossbar.scala 227:24 222:31]
  wire  _GEN_138 = 2'h0 == b_id_route ? 1'h0 : _GEN_126; // @[src/main/scala/AXI3Crossbar.scala 227:24 211:32]
  wire [3:0] _GEN_139 = 2'h0 == b_id_route ? 4'h0 : _GEN_127; // @[src/main/scala/AXI3Crossbar.scala 227:24 218:30]
  wire [1:0] _GEN_140 = 2'h0 == b_id_route ? 2'h0 : _GEN_128; // @[src/main/scala/AXI3Crossbar.scala 227:24 223:31]
  wire  _GEN_141 = 2'h0 == b_id_route ? 1'h0 : _GEN_129; // @[src/main/scala/AXI3Crossbar.scala 227:24 212:32]
  wire  _io_out_b_bready_T = b_id_route == 2'h0; // @[src/main/scala/AXI3Crossbar.scala 246:19]
  wire  _io_out_b_bready_T_1 = b_id_route == 2'h1; // @[src/main/scala/AXI3Crossbar.scala 247:19]
  wire  _io_out_b_bready_T_2 = b_id_route == 2'h2; // @[src/main/scala/AXI3Crossbar.scala 248:19]
  wire  _io_out_b_bready_T_3 = b_id_route == 2'h3; // @[src/main/scala/AXI3Crossbar.scala 249:19]
  Arbiter ar_arbiter ( // @[src/main/scala/AXI3Crossbar.scala 33:26]
    .io_in_0_ready(ar_arbiter_io_in_0_ready),
    .io_in_0_valid(ar_arbiter_io_in_0_valid),
    .io_in_0_bits_araddr(ar_arbiter_io_in_0_bits_araddr),
    .io_in_0_bits_arlen(ar_arbiter_io_in_0_bits_arlen),
    .io_in_0_bits_arsize(ar_arbiter_io_in_0_bits_arsize),
    .io_in_0_bits_arburst(ar_arbiter_io_in_0_bits_arburst),
    .io_in_1_ready(ar_arbiter_io_in_1_ready),
    .io_in_1_valid(ar_arbiter_io_in_1_valid),
    .io_in_1_bits_arid(ar_arbiter_io_in_1_bits_arid),
    .io_in_1_bits_araddr(ar_arbiter_io_in_1_bits_araddr),
    .io_in_1_bits_arlen(ar_arbiter_io_in_1_bits_arlen),
    .io_in_1_bits_arsize(ar_arbiter_io_in_1_bits_arsize),
    .io_in_1_bits_arburst(ar_arbiter_io_in_1_bits_arburst),
    .io_in_1_bits_arlock(ar_arbiter_io_in_1_bits_arlock),
    .io_in_1_bits_arcache(ar_arbiter_io_in_1_bits_arcache),
    .io_in_1_bits_arprot(ar_arbiter_io_in_1_bits_arprot),
    .io_in_2_ready(ar_arbiter_io_in_2_ready),
    .io_in_2_valid(ar_arbiter_io_in_2_valid),
    .io_in_2_bits_arid(ar_arbiter_io_in_2_bits_arid),
    .io_in_2_bits_araddr(ar_arbiter_io_in_2_bits_araddr),
    .io_in_2_bits_arlen(ar_arbiter_io_in_2_bits_arlen),
    .io_in_2_bits_arsize(ar_arbiter_io_in_2_bits_arsize),
    .io_in_2_bits_arburst(ar_arbiter_io_in_2_bits_arburst),
    .io_in_2_bits_arlock(ar_arbiter_io_in_2_bits_arlock),
    .io_in_2_bits_arcache(ar_arbiter_io_in_2_bits_arcache),
    .io_in_2_bits_arprot(ar_arbiter_io_in_2_bits_arprot),
    .io_in_3_ready(ar_arbiter_io_in_3_ready),
    .io_in_3_valid(ar_arbiter_io_in_3_valid),
    .io_in_3_bits_arid(ar_arbiter_io_in_3_bits_arid),
    .io_in_3_bits_araddr(ar_arbiter_io_in_3_bits_araddr),
    .io_in_3_bits_arlen(ar_arbiter_io_in_3_bits_arlen),
    .io_in_3_bits_arsize(ar_arbiter_io_in_3_bits_arsize),
    .io_in_3_bits_arburst(ar_arbiter_io_in_3_bits_arburst),
    .io_in_3_bits_arlock(ar_arbiter_io_in_3_bits_arlock),
    .io_in_3_bits_arcache(ar_arbiter_io_in_3_bits_arcache),
    .io_in_3_bits_arprot(ar_arbiter_io_in_3_bits_arprot),
    .io_out_ready(ar_arbiter_io_out_ready),
    .io_out_valid(ar_arbiter_io_out_valid),
    .io_out_bits_arid(ar_arbiter_io_out_bits_arid),
    .io_out_bits_araddr(ar_arbiter_io_out_bits_araddr),
    .io_out_bits_arlen(ar_arbiter_io_out_bits_arlen),
    .io_out_bits_arsize(ar_arbiter_io_out_bits_arsize),
    .io_out_bits_arburst(ar_arbiter_io_out_bits_arburst),
    .io_out_bits_arlock(ar_arbiter_io_out_bits_arlock),
    .io_out_bits_arcache(ar_arbiter_io_out_bits_arcache),
    .io_out_bits_arprot(ar_arbiter_io_out_bits_arprot)
  );
  Arbiter_1 aw_arbiter ( // @[src/main/scala/AXI3Crossbar.scala 125:26]
    .io_in_1_ready(aw_arbiter_io_in_1_ready),
    .io_in_1_valid(aw_arbiter_io_in_1_valid),
    .io_in_1_bits_awid(aw_arbiter_io_in_1_bits_awid),
    .io_in_1_bits_awaddr(aw_arbiter_io_in_1_bits_awaddr),
    .io_in_1_bits_awlen(aw_arbiter_io_in_1_bits_awlen),
    .io_in_1_bits_awsize(aw_arbiter_io_in_1_bits_awsize),
    .io_in_1_bits_awburst(aw_arbiter_io_in_1_bits_awburst),
    .io_in_1_bits_awlock(aw_arbiter_io_in_1_bits_awlock),
    .io_in_1_bits_awcache(aw_arbiter_io_in_1_bits_awcache),
    .io_in_1_bits_awprot(aw_arbiter_io_in_1_bits_awprot),
    .io_in_2_ready(aw_arbiter_io_in_2_ready),
    .io_in_2_valid(aw_arbiter_io_in_2_valid),
    .io_in_2_bits_awid(aw_arbiter_io_in_2_bits_awid),
    .io_in_2_bits_awaddr(aw_arbiter_io_in_2_bits_awaddr),
    .io_in_2_bits_awlen(aw_arbiter_io_in_2_bits_awlen),
    .io_in_2_bits_awsize(aw_arbiter_io_in_2_bits_awsize),
    .io_in_2_bits_awburst(aw_arbiter_io_in_2_bits_awburst),
    .io_in_2_bits_awlock(aw_arbiter_io_in_2_bits_awlock),
    .io_in_2_bits_awcache(aw_arbiter_io_in_2_bits_awcache),
    .io_in_2_bits_awprot(aw_arbiter_io_in_2_bits_awprot),
    .io_in_3_ready(aw_arbiter_io_in_3_ready),
    .io_in_3_valid(aw_arbiter_io_in_3_valid),
    .io_in_3_bits_awid(aw_arbiter_io_in_3_bits_awid),
    .io_in_3_bits_awaddr(aw_arbiter_io_in_3_bits_awaddr),
    .io_in_3_bits_awlen(aw_arbiter_io_in_3_bits_awlen),
    .io_in_3_bits_awsize(aw_arbiter_io_in_3_bits_awsize),
    .io_in_3_bits_awburst(aw_arbiter_io_in_3_bits_awburst),
    .io_in_3_bits_awlock(aw_arbiter_io_in_3_bits_awlock),
    .io_in_3_bits_awcache(aw_arbiter_io_in_3_bits_awcache),
    .io_in_3_bits_awprot(aw_arbiter_io_in_3_bits_awprot),
    .io_out_ready(aw_arbiter_io_out_ready),
    .io_out_valid(aw_arbiter_io_out_valid),
    .io_out_bits_awid(aw_arbiter_io_out_bits_awid),
    .io_out_bits_awaddr(aw_arbiter_io_out_bits_awaddr),
    .io_out_bits_awlen(aw_arbiter_io_out_bits_awlen),
    .io_out_bits_awsize(aw_arbiter_io_out_bits_awsize),
    .io_out_bits_awburst(aw_arbiter_io_out_bits_awburst),
    .io_out_bits_awlock(aw_arbiter_io_out_bits_awlock),
    .io_out_bits_awcache(aw_arbiter_io_out_bits_awcache),
    .io_out_bits_awprot(aw_arbiter_io_out_bits_awprot),
    .io_chosen(aw_arbiter_io_chosen)
  );
  assign io_in_icache_ar_arready = ar_arbiter_io_in_0_ready; // @[src/main/scala/AXI3Crossbar.scala 55:29]
  assign io_in_icache_r_data_rdata = io_out_r_data_rvalid ? _GEN_31 : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 80:30 96:30]
  assign io_in_icache_r_data_rlast = io_out_r_data_rvalid & _GEN_33; // @[src/main/scala/AXI3Crossbar.scala 90:30 96:30]
  assign io_in_icache_r_data_rvalid = io_out_r_data_rvalid & _GEN_34; // @[src/main/scala/AXI3Crossbar.scala 96:30 69:32]
  assign io_in_dcache_ar_arready = ar_arbiter_io_in_1_ready; // @[src/main/scala/AXI3Crossbar.scala 56:29]
  assign io_in_dcache_aw_awready = aw_arbiter_io_in_1_ready; // @[src/main/scala/AXI3Crossbar.scala 146:29]
  assign io_in_dcache_w_wready = aw_master_valid & _GEN_100; // @[src/main/scala/AXI3Crossbar.scala 180:25 175:27]
  assign io_in_dcache_r_data_rid = io_out_r_data_rvalid ? _GEN_35 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 76:30 96:30]
  assign io_in_dcache_r_data_rdata = io_out_r_data_rvalid ? _GEN_36 : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 81:30 96:30]
  assign io_in_dcache_r_data_rresp = io_out_r_data_rvalid ? _GEN_37 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 86:30 96:30]
  assign io_in_dcache_r_data_rlast = io_out_r_data_rvalid & _GEN_38; // @[src/main/scala/AXI3Crossbar.scala 91:30 96:30]
  assign io_in_dcache_r_data_rvalid = io_out_r_data_rvalid & _GEN_39; // @[src/main/scala/AXI3Crossbar.scala 96:30 70:32]
  assign io_in_dcache_b_data_bid = io_out_b_data_bvalid ? _GEN_133 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 216:30 226:30]
  assign io_in_dcache_b_data_bresp = io_out_b_data_bvalid ? _GEN_134 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 221:30 226:30]
  assign io_in_dcache_b_data_bvalid = io_out_b_data_bvalid & _GEN_135; // @[src/main/scala/AXI3Crossbar.scala 226:30 210:32]
  assign io_in_uncache1_ar_arready = ar_arbiter_io_in_2_ready; // @[src/main/scala/AXI3Crossbar.scala 57:29]
  assign io_in_uncache1_aw_awready = aw_arbiter_io_in_2_ready; // @[src/main/scala/AXI3Crossbar.scala 147:29]
  assign io_in_uncache1_w_wready = aw_master_valid & _GEN_101; // @[src/main/scala/AXI3Crossbar.scala 180:25 176:27]
  assign io_in_uncache1_r_data_rid = io_out_r_data_rvalid ? _GEN_40 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 77:30 96:30]
  assign io_in_uncache1_r_data_rdata = io_out_r_data_rvalid ? _GEN_41 : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 96:30 82:31]
  assign io_in_uncache1_r_data_rresp = io_out_r_data_rvalid ? _GEN_42 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 96:30 87:31]
  assign io_in_uncache1_r_data_rlast = io_out_r_data_rvalid & _GEN_43; // @[src/main/scala/AXI3Crossbar.scala 96:30 92:31]
  assign io_in_uncache1_r_data_rvalid = io_out_r_data_rvalid & _GEN_44; // @[src/main/scala/AXI3Crossbar.scala 96:30 71:32]
  assign io_in_uncache1_b_data_bid = io_out_b_data_bvalid ? _GEN_136 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 217:30 226:30]
  assign io_in_uncache1_b_data_bresp = io_out_b_data_bvalid ? _GEN_137 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 226:30 222:31]
  assign io_in_uncache1_b_data_bvalid = io_out_b_data_bvalid & _GEN_138; // @[src/main/scala/AXI3Crossbar.scala 226:30 211:32]
  assign io_in_uncache2_ar_arready = ar_arbiter_io_in_3_ready; // @[src/main/scala/AXI3Crossbar.scala 58:29]
  assign io_in_uncache2_aw_awready = aw_arbiter_io_in_3_ready; // @[src/main/scala/AXI3Crossbar.scala 148:29]
  assign io_in_uncache2_w_wready = aw_master_valid & _GEN_102; // @[src/main/scala/AXI3Crossbar.scala 180:25 177:27]
  assign io_in_uncache2_r_data_rid = io_out_r_data_rvalid ? _GEN_45 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 78:30 96:30]
  assign io_in_uncache2_r_data_rdata = io_out_r_data_rvalid ? _GEN_46 : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 96:30 83:31]
  assign io_in_uncache2_r_data_rresp = io_out_r_data_rvalid ? _GEN_47 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 96:30 88:31]
  assign io_in_uncache2_r_data_rlast = io_out_r_data_rvalid & _GEN_48; // @[src/main/scala/AXI3Crossbar.scala 96:30 93:31]
  assign io_in_uncache2_r_data_rvalid = io_out_r_data_rvalid & _GEN_49; // @[src/main/scala/AXI3Crossbar.scala 96:30 72:32]
  assign io_in_uncache2_b_data_bid = io_out_b_data_bvalid ? _GEN_139 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 218:30 226:30]
  assign io_in_uncache2_b_data_bresp = io_out_b_data_bvalid ? _GEN_140 : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 226:30 223:31]
  assign io_in_uncache2_b_data_bvalid = io_out_b_data_bvalid & _GEN_141; // @[src/main/scala/AXI3Crossbar.scala 226:30 212:32]
  assign io_out_ar_data_arid = ar_arbiter_io_out_bits_arid; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_araddr = ar_arbiter_io_out_bits_araddr; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arlen = ar_arbiter_io_out_bits_arlen; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arsize = ar_arbiter_io_out_bits_arsize; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arburst = ar_arbiter_io_out_bits_arburst; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arlock = ar_arbiter_io_out_bits_arlock; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arcache = ar_arbiter_io_out_bits_arcache; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arprot = ar_arbiter_io_out_bits_arprot; // @[src/main/scala/AXI3Crossbar.scala 47:18]
  assign io_out_ar_data_arvalid = ar_arbiter_io_out_valid; // @[src/main/scala/AXI3Crossbar.scala 49:26]
  assign io_out_aw_data_awid = aw_arbiter_io_out_bits_awid; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awaddr = aw_arbiter_io_out_bits_awaddr; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awlen = aw_arbiter_io_out_bits_awlen; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awsize = aw_arbiter_io_out_bits_awsize; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awburst = aw_arbiter_io_out_bits_awburst; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awlock = aw_arbiter_io_out_bits_awlock; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awcache = aw_arbiter_io_out_bits_awcache; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awprot = aw_arbiter_io_out_bits_awprot; // @[src/main/scala/AXI3Crossbar.scala 139:18]
  assign io_out_aw_data_awvalid = aw_arbiter_io_out_valid; // @[src/main/scala/AXI3Crossbar.scala 140:26]
  assign io_out_w_data_wid = aw_master_valid ? _GEN_94 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 167:24 180:25]
  assign io_out_w_data_wdata = aw_master_valid ? _GEN_95 : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 168:24 180:25]
  assign io_out_w_data_wstrb = aw_master_valid ? _GEN_96 : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 169:24 180:25]
  assign io_out_w_data_wlast = aw_master_valid & _GEN_97; // @[src/main/scala/AXI3Crossbar.scala 170:24 180:25]
  assign io_out_w_data_wvalid = aw_master_valid & _GEN_98; // @[src/main/scala/AXI3Crossbar.scala 171:24 180:25]
  assign io_out_r_rready = _io_out_r_rready_T & io_in_icache_r_rready | _io_out_r_rready_T_1 & io_in_dcache_r_rready |
    _io_out_r_rready_T_2 & io_in_uncache1_r_rready | _io_out_r_rready_T_3 & io_in_uncache2_r_rready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_out_b_bready = _io_out_b_bready_T | _io_out_b_bready_T_1 & io_in_dcache_b_bready | _io_out_b_bready_T_2 &
    io_in_uncache1_b_bready | _io_out_b_bready_T_3 & io_in_uncache2_b_bready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign ar_arbiter_io_in_0_valid = io_in_icache_ar_data_arvalid; // @[src/main/scala/AXI3Crossbar.scala 37:29]
  assign ar_arbiter_io_in_0_bits_araddr = io_in_icache_ar_data_araddr; // @[src/main/scala/AXI3Crossbar.scala 38:29]
  assign ar_arbiter_io_in_0_bits_arlen = io_in_icache_ar_data_arlen; // @[src/main/scala/AXI3Crossbar.scala 38:29]
  assign ar_arbiter_io_in_0_bits_arsize = io_in_icache_ar_data_arsize; // @[src/main/scala/AXI3Crossbar.scala 38:29]
  assign ar_arbiter_io_in_0_bits_arburst = io_in_icache_ar_data_arburst; // @[src/main/scala/AXI3Crossbar.scala 38:29]
  assign ar_arbiter_io_in_1_valid = io_in_dcache_ar_data_arvalid; // @[src/main/scala/AXI3Crossbar.scala 39:29]
  assign ar_arbiter_io_in_1_bits_arid = io_in_dcache_ar_data_arid; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_araddr = io_in_dcache_ar_data_araddr; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arlen = io_in_dcache_ar_data_arlen; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arsize = io_in_dcache_ar_data_arsize; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arburst = io_in_dcache_ar_data_arburst; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arlock = io_in_dcache_ar_data_arlock; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arcache = io_in_dcache_ar_data_arcache; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_bits_arprot = io_in_dcache_ar_data_arprot; // @[src/main/scala/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_2_valid = io_in_uncache1_ar_data_arvalid; // @[src/main/scala/AXI3Crossbar.scala 41:29]
  assign ar_arbiter_io_in_2_bits_arid = io_in_uncache1_ar_data_arid; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_araddr = io_in_uncache1_ar_data_araddr; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arlen = io_in_uncache1_ar_data_arlen; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arsize = io_in_uncache1_ar_data_arsize; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arburst = io_in_uncache1_ar_data_arburst; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arlock = io_in_uncache1_ar_data_arlock; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arcache = io_in_uncache1_ar_data_arcache; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_bits_arprot = io_in_uncache1_ar_data_arprot; // @[src/main/scala/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_3_valid = io_in_uncache2_ar_data_arvalid; // @[src/main/scala/AXI3Crossbar.scala 43:29]
  assign ar_arbiter_io_in_3_bits_arid = io_in_uncache2_ar_data_arid; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_araddr = io_in_uncache2_ar_data_araddr; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arlen = io_in_uncache2_ar_data_arlen; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arsize = io_in_uncache2_ar_data_arsize; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arburst = io_in_uncache2_ar_data_arburst; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arlock = io_in_uncache2_ar_data_arlock; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arcache = io_in_uncache2_ar_data_arcache; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_bits_arprot = io_in_uncache2_ar_data_arprot; // @[src/main/scala/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_out_ready = io_out_ar_arready; // @[src/main/scala/AXI3Crossbar.scala 53:27]
  assign aw_arbiter_io_in_1_valid = io_in_dcache_aw_data_awvalid; // @[src/main/scala/AXI3Crossbar.scala 131:29]
  assign aw_arbiter_io_in_1_bits_awid = io_in_dcache_aw_data_awid; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awaddr = io_in_dcache_aw_data_awaddr; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awlen = io_in_dcache_aw_data_awlen; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awsize = io_in_dcache_aw_data_awsize; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awburst = io_in_dcache_aw_data_awburst; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awlock = io_in_dcache_aw_data_awlock; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awcache = io_in_dcache_aw_data_awcache; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_1_bits_awprot = io_in_dcache_aw_data_awprot; // @[src/main/scala/AXI3Crossbar.scala 132:29]
  assign aw_arbiter_io_in_2_valid = io_in_uncache1_aw_data_awvalid; // @[src/main/scala/AXI3Crossbar.scala 133:29]
  assign aw_arbiter_io_in_2_bits_awid = io_in_uncache1_aw_data_awid; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awaddr = io_in_uncache1_aw_data_awaddr; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awlen = io_in_uncache1_aw_data_awlen; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awsize = io_in_uncache1_aw_data_awsize; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awburst = io_in_uncache1_aw_data_awburst; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awlock = io_in_uncache1_aw_data_awlock; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awcache = io_in_uncache1_aw_data_awcache; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_2_bits_awprot = io_in_uncache1_aw_data_awprot; // @[src/main/scala/AXI3Crossbar.scala 134:29]
  assign aw_arbiter_io_in_3_valid = io_in_uncache2_aw_data_awvalid; // @[src/main/scala/AXI3Crossbar.scala 135:29]
  assign aw_arbiter_io_in_3_bits_awid = io_in_uncache2_aw_data_awid; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awaddr = io_in_uncache2_aw_data_awaddr; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awlen = io_in_uncache2_aw_data_awlen; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awsize = io_in_uncache2_aw_data_awsize; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awburst = io_in_uncache2_aw_data_awburst; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awlock = io_in_uncache2_aw_data_awlock; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awcache = io_in_uncache2_aw_data_awcache; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_in_3_bits_awprot = io_in_uncache2_aw_data_awprot; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign aw_arbiter_io_out_ready = io_out_aw_awready; // @[src/main/scala/AXI3Crossbar.scala 143:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/AXI3Crossbar.scala 153:32]
      aw_master_valid <= 1'h0; // @[src/main/scala/AXI3Crossbar.scala 153:32]
    end else begin
      aw_master_valid <= _GEN_71;
    end
    if (_T_4) begin // @[src/main/scala/AXI3Crossbar.scala 156:34]
      aw_master_idx <= aw_arbiter_io_chosen; // @[src/main/scala/AXI3Crossbar.scala 158:19]
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
  aw_master_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  aw_master_idx = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
