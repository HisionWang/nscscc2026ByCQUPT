module AXI3Crossbar4to1(
  input         clock,
  input         reset,
  input  [3:0]  io_in_icache_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_icache_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_icache_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_icache_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_icache_ar_data_arburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_icache_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_icache_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_in_icache_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [31:0] io_in_icache_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_icache_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_icache_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_icache_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_dcache_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_dcache_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_dcache_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_dcache_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_dcache_ar_data_arburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_dcache_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_dcache_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_dcache_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_dcache_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_dcache_aw_data_awburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_dcache_w_data_wid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_dcache_w_data_wdata, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_dcache_w_data_wstrb, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_w_data_wlast, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_w_data_wvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_w_wready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_in_dcache_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [31:0] io_in_dcache_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_in_dcache_b_data_bid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_dcache_b_data_bvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_dcache_b_bready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache1_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_uncache1_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_uncache1_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache1_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache1_ar_data_arburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache1_ar_data_arlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache1_ar_data_arcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache1_ar_data_arprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache1_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_uncache1_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache1_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_uncache1_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_uncache1_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache1_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache1_aw_data_awburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache1_aw_data_awlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache1_aw_data_awcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache1_aw_data_awprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache1_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_uncache1_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache1_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache1_b_bready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache2_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_uncache2_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_uncache2_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache2_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache2_ar_data_arburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache2_ar_data_arlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache2_ar_data_arcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache2_ar_data_arprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache2_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_uncache2_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache2_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_in_uncache2_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [7:0]  io_in_uncache2_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache2_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache2_aw_data_awburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [1:0]  io_in_uncache2_aw_data_awlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_in_uncache2_aw_data_awcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [2:0]  io_in_uncache2_aw_data_awprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache2_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_in_uncache2_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache2_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_in_uncache2_b_bready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [31:0] io_out_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [7:0]  io_out_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [2:0]  io_out_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [1:0]  io_out_ar_data_arburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [1:0]  io_out_ar_data_arlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_ar_data_arcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [2:0]  io_out_ar_data_arprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [31:0] io_out_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [7:0]  io_out_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [2:0]  io_out_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [1:0]  io_out_aw_data_awburst, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [1:0]  io_out_aw_data_awlock, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_aw_data_awcache, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [2:0]  io_out_aw_data_awprot, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_w_data_wid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [31:0] io_out_w_data_wdata, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output [3:0]  io_out_w_data_wstrb, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_w_data_wlast, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_w_data_wvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_w_wready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_out_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [31:0] io_out_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input  [3:0]  io_out_b_data_bid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  input         io_out_b_data_bvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
  output        io_out_b_bready // @[src/main/scala/axi/AXI3Crossbar.scala 12:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  ar_arbiter_io_in_0_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_0_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_0_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [31:0] ar_arbiter_io_in_0_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [7:0] ar_arbiter_io_in_0_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_0_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_0_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_1_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_1_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [31:0] ar_arbiter_io_in_1_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [7:0] ar_arbiter_io_in_1_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_1_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_1_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_2_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_2_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_2_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [31:0] ar_arbiter_io_in_2_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [7:0] ar_arbiter_io_in_2_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_2_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_2_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_2_bits_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_2_bits_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_2_bits_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_3_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_in_3_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_3_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [31:0] ar_arbiter_io_in_3_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [7:0] ar_arbiter_io_in_3_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_3_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_3_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_in_3_bits_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_in_3_bits_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_in_3_bits_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_out_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  ar_arbiter_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_out_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [31:0] ar_arbiter_io_out_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [7:0] ar_arbiter_io_out_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_out_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_out_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [1:0] ar_arbiter_io_out_bits_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [3:0] ar_arbiter_io_out_bits_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire [2:0] ar_arbiter_io_out_bits_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
  wire  aw_arbiter_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_in_1_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_in_1_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [31:0] aw_arbiter_io_in_1_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [7:0] aw_arbiter_io_in_1_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_in_1_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_in_1_bits_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_in_2_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_in_2_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_in_2_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [31:0] aw_arbiter_io_in_2_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [7:0] aw_arbiter_io_in_2_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_in_2_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_in_2_bits_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_in_2_bits_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_in_2_bits_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_in_2_bits_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_in_3_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_in_3_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_in_3_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [31:0] aw_arbiter_io_in_3_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [7:0] aw_arbiter_io_in_3_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_in_3_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_in_3_bits_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_in_3_bits_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_in_3_bits_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_in_3_bits_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_out_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire  aw_arbiter_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_out_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [31:0] aw_arbiter_io_out_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [7:0] aw_arbiter_io_out_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_out_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_out_bits_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_out_bits_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] aw_arbiter_io_out_bits_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [2:0] aw_arbiter_io_out_bits_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [1:0] aw_arbiter_io_chosen; // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
  wire [3:0] _GEN_0 = 4'hd == io_out_r_data_rid ? io_out_r_data_rid : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 119:29 77:30]
  wire [31:0] _GEN_1 = 4'hd == io_out_r_data_rid ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 119:29 82:30]
  wire  _GEN_3 = 4'hd == io_out_r_data_rid & io_out_r_data_rlast; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 119:29 92:30]
  wire  _GEN_4 = 4'hd == io_out_r_data_rid & io_out_r_data_rvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 119:29 71:32]
  wire [3:0] _GEN_5 = 4'hc == io_out_r_data_rid ? io_out_r_data_rid : _GEN_0; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 116:29]
  wire [31:0] _GEN_6 = 4'hc == io_out_r_data_rid ? io_out_r_data_rdata : _GEN_1; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 116:29]
  wire  _GEN_8 = 4'hc == io_out_r_data_rid ? io_out_r_data_rlast : _GEN_3; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 116:29]
  wire  _GEN_9 = 4'hc == io_out_r_data_rid ? io_out_r_data_rvalid : _GEN_4; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 116:29]
  wire [3:0] _GEN_10 = 4'h3 == io_out_r_data_rid ? io_out_r_data_rid : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 112:29 78:30]
  wire [31:0] _GEN_11 = 4'h3 == io_out_r_data_rid ? io_out_r_data_rdata : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 112:29 83:30]
  wire  _GEN_13 = 4'h3 == io_out_r_data_rid & io_out_r_data_rlast; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 112:29 93:30]
  wire  _GEN_14 = 4'h3 == io_out_r_data_rid & io_out_r_data_rvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 112:29 72:32]
  wire [3:0] _GEN_15 = 4'h3 == io_out_r_data_rid ? 4'h0 : _GEN_5; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 77:30]
  wire [31:0] _GEN_16 = 4'h3 == io_out_r_data_rid ? 32'h0 : _GEN_6; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 82:30]
  wire  _GEN_18 = 4'h3 == io_out_r_data_rid ? 1'h0 : _GEN_8; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 92:30]
  wire  _GEN_19 = 4'h3 == io_out_r_data_rid ? 1'h0 : _GEN_9; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 71:32]
  wire [3:0] _GEN_20 = 4'h2 == io_out_r_data_rid ? io_out_r_data_rid : _GEN_10; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 109:29]
  wire [31:0] _GEN_21 = 4'h2 == io_out_r_data_rid ? io_out_r_data_rdata : _GEN_11; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 109:29]
  wire  _GEN_23 = 4'h2 == io_out_r_data_rid ? io_out_r_data_rlast : _GEN_13; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 109:29]
  wire  _GEN_24 = 4'h2 == io_out_r_data_rid ? io_out_r_data_rvalid : _GEN_14; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 109:29]
  wire [3:0] _GEN_25 = 4'h2 == io_out_r_data_rid ? 4'h0 : _GEN_15; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 77:30]
  wire [31:0] _GEN_26 = 4'h2 == io_out_r_data_rid ? 32'h0 : _GEN_16; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 82:30]
  wire  _GEN_28 = 4'h2 == io_out_r_data_rid ? 1'h0 : _GEN_18; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 92:30]
  wire  _GEN_29 = 4'h2 == io_out_r_data_rid ? 1'h0 : _GEN_19; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 71:32]
  wire [3:0] _GEN_30 = 4'h1 == io_out_r_data_rid ? io_out_r_data_rid : _GEN_20; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 106:29]
  wire [31:0] _GEN_31 = 4'h1 == io_out_r_data_rid ? io_out_r_data_rdata : _GEN_21; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 106:29]
  wire  _GEN_33 = 4'h1 == io_out_r_data_rid ? io_out_r_data_rlast : _GEN_23; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 106:29]
  wire  _GEN_34 = 4'h1 == io_out_r_data_rid ? io_out_r_data_rvalid : _GEN_24; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 106:29]
  wire [3:0] _GEN_35 = 4'h1 == io_out_r_data_rid ? 4'h0 : _GEN_25; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 77:30]
  wire [31:0] _GEN_36 = 4'h1 == io_out_r_data_rid ? 32'h0 : _GEN_26; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 82:30]
  wire  _GEN_38 = 4'h1 == io_out_r_data_rid ? 1'h0 : _GEN_28; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 92:30]
  wire  _GEN_39 = 4'h1 == io_out_r_data_rid ? 1'h0 : _GEN_29; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 71:32]
  wire [3:0] _GEN_40 = 4'h0 == io_out_r_data_rid ? io_out_r_data_rid : _GEN_30; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 103:29]
  wire [31:0] _GEN_41 = 4'h0 == io_out_r_data_rid ? io_out_r_data_rdata : _GEN_31; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 103:29]
  wire  _GEN_43 = 4'h0 == io_out_r_data_rid ? io_out_r_data_rlast : _GEN_33; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 103:29]
  wire  _GEN_44 = 4'h0 == io_out_r_data_rid ? io_out_r_data_rvalid : _GEN_34; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 103:29]
  wire [3:0] _GEN_45 = 4'h0 == io_out_r_data_rid ? 4'h0 : _GEN_35; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 77:30]
  wire [31:0] _GEN_46 = 4'h0 == io_out_r_data_rid ? 32'h0 : _GEN_36; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 82:30]
  wire  _GEN_48 = 4'h0 == io_out_r_data_rid ? 1'h0 : _GEN_38; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 92:30]
  wire  _GEN_49 = 4'h0 == io_out_r_data_rid ? 1'h0 : _GEN_39; // @[src/main/scala/axi/AXI3Crossbar.scala 101:24 71:32]
  wire  _io_out_r_rready_T_2 = io_out_r_data_rid == 4'hc | io_out_r_data_rid == 4'hd; // @[src/main/scala/axi/AXI3Crossbar.scala 130:41]
  wire  _io_out_r_rready_T_3 = io_out_r_data_rid < 4'hd; // @[src/main/scala/axi/AXI3Crossbar.scala 131:19]
  wire  _io_out_r_rready_T_4 = io_out_r_data_rid == 4'he; // @[src/main/scala/axi/AXI3Crossbar.scala 132:19]
  wire  _io_out_r_rready_T_5 = io_out_r_data_rid == 4'hf; // @[src/main/scala/axi/AXI3Crossbar.scala 133:19]
  reg  aw_master_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 167:32]
  reg [1:0] aw_master_idx; // @[src/main/scala/axi/AXI3Crossbar.scala 168:26]
  wire  _T_6 = aw_arbiter_io_out_ready & aw_arbiter_io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_60 = io_out_w_data_wlast & io_out_w_data_wvalid & io_out_w_wready ? 1'h0 : aw_master_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 173:78 174:21 167:32]
  wire  _GEN_61 = _T_6 | _GEN_60; // @[src/main/scala/axi/AXI3Crossbar.scala 170:32 171:21]
  wire [3:0] _GEN_75 = 2'h3 == aw_master_idx ? io_in_dcache_w_data_wid : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 210:23]
  wire [31:0] _GEN_76 = 2'h3 == aw_master_idx ? io_in_dcache_w_data_wdata : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 210:23]
  wire [3:0] _GEN_77 = 2'h3 == aw_master_idx ? io_in_dcache_w_data_wstrb : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 210:23]
  wire  _GEN_78 = 2'h3 == aw_master_idx & io_in_dcache_w_data_wlast; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 210:23]
  wire  _GEN_79 = 2'h3 == aw_master_idx & io_in_dcache_w_data_wvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 210:23]
  wire  _GEN_80 = 2'h3 == aw_master_idx & io_out_w_wready; // @[src/main/scala/axi/AXI3Crossbar.scala 189:27 195:27 211:31]
  wire [3:0] _GEN_82 = 2'h2 == aw_master_idx ? io_in_dcache_w_data_wid : _GEN_75; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 206:23]
  wire [31:0] _GEN_83 = 2'h2 == aw_master_idx ? io_in_dcache_w_data_wdata : _GEN_76; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 206:23]
  wire [3:0] _GEN_84 = 2'h2 == aw_master_idx ? io_in_dcache_w_data_wstrb : _GEN_77; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 206:23]
  wire  _GEN_85 = 2'h2 == aw_master_idx ? io_in_dcache_w_data_wlast : _GEN_78; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 206:23]
  wire  _GEN_86 = 2'h2 == aw_master_idx ? io_in_dcache_w_data_wvalid : _GEN_79; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 206:23]
  wire  _GEN_87 = 2'h2 == aw_master_idx ? io_out_w_wready : _GEN_80; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 207:31]
  wire [3:0] _GEN_89 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wid : _GEN_82; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 202:23]
  wire [31:0] _GEN_90 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wdata : _GEN_83; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 202:23]
  wire [3:0] _GEN_91 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wstrb : _GEN_84; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 202:23]
  wire  _GEN_92 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wlast : _GEN_85; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 202:23]
  wire  _GEN_93 = 2'h1 == aw_master_idx ? io_in_dcache_w_data_wvalid : _GEN_86; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 202:23]
  wire  _GEN_94 = 2'h1 == aw_master_idx ? io_out_w_wready : _GEN_87; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 203:31]
  wire [3:0] _GEN_96 = 2'h0 == aw_master_idx ? io_in_dcache_w_data_wid : _GEN_89; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 198:23]
  wire [31:0] _GEN_97 = 2'h0 == aw_master_idx ? io_in_dcache_w_data_wdata : _GEN_90; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 198:23]
  wire [3:0] _GEN_98 = 2'h0 == aw_master_idx ? io_in_dcache_w_data_wstrb : _GEN_91; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 198:23]
  wire  _GEN_99 = 2'h0 == aw_master_idx ? io_in_dcache_w_data_wlast : _GEN_92; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 198:23]
  wire  _GEN_100 = 2'h0 == aw_master_idx ? io_in_dcache_w_data_wvalid : _GEN_93; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 198:23]
  wire  _GEN_101 = 2'h0 == aw_master_idx ? io_out_w_wready : _GEN_94; // @[src/main/scala/axi/AXI3Crossbar.scala 195:27 199:31]
  wire [1:0] b_id_route = io_out_b_data_bid[3:2]; // @[src/main/scala/axi/AXI3Crossbar.scala 229:37]
  wire [3:0] _GEN_148 = {{2'd0}, b_id_route}; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24]
  wire [3:0] _GEN_116 = 2'h3 == b_id_route ? io_out_b_data_bid : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 264:29 242:30]
  wire  _GEN_118 = 2'h3 == b_id_route & io_out_b_data_bvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 264:29 236:32]
  wire [3:0] _GEN_122 = 2'h2 == b_id_route ? io_out_b_data_bid : _GEN_116; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 261:29]
  wire  _GEN_124 = 2'h2 == b_id_route ? io_out_b_data_bvalid : _GEN_118; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 261:29]
  wire [3:0] _GEN_128 = 2'h1 == b_id_route ? io_out_b_data_bid : _GEN_122; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 258:29]
  wire  _GEN_130 = 2'h1 == b_id_route ? io_out_b_data_bvalid : _GEN_124; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 258:29]
  wire [3:0] _GEN_134 = 2'h0 == b_id_route ? io_out_b_data_bid : _GEN_128; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 255:29]
  wire  _GEN_136 = 2'h0 == b_id_route ? io_out_b_data_bvalid : _GEN_130; // @[src/main/scala/axi/AXI3Crossbar.scala 253:24 255:29]
  wire  _io_out_b_bready_T_4 = _GEN_148 == 4'he; // @[src/main/scala/axi/AXI3Crossbar.scala 281:19]
  wire  _io_out_b_bready_T_5 = _GEN_148 == 4'hf; // @[src/main/scala/axi/AXI3Crossbar.scala 282:19]
  Arbiter ar_arbiter ( // @[src/main/scala/axi/AXI3Crossbar.scala 35:26]
    .io_in_0_ready(ar_arbiter_io_in_0_ready),
    .io_in_0_valid(ar_arbiter_io_in_0_valid),
    .io_in_0_bits_arid(ar_arbiter_io_in_0_bits_arid),
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
  Arbiter_1 aw_arbiter ( // @[src/main/scala/axi/AXI3Crossbar.scala 139:26]
    .io_in_1_ready(aw_arbiter_io_in_1_ready),
    .io_in_1_valid(aw_arbiter_io_in_1_valid),
    .io_in_1_bits_awid(aw_arbiter_io_in_1_bits_awid),
    .io_in_1_bits_awaddr(aw_arbiter_io_in_1_bits_awaddr),
    .io_in_1_bits_awlen(aw_arbiter_io_in_1_bits_awlen),
    .io_in_1_bits_awsize(aw_arbiter_io_in_1_bits_awsize),
    .io_in_1_bits_awburst(aw_arbiter_io_in_1_bits_awburst),
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
  assign io_in_icache_ar_arready = ar_arbiter_io_in_0_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 57:29]
  assign io_in_icache_r_data_rid = io_out_r_data_rvalid ? _GEN_45 : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 77:30]
  assign io_in_icache_r_data_rdata = io_out_r_data_rvalid ? _GEN_46 : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 82:30]
  assign io_in_icache_r_data_rlast = io_out_r_data_rvalid & _GEN_48; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 92:30]
  assign io_in_icache_r_data_rvalid = io_out_r_data_rvalid & _GEN_49; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 71:32]
  assign io_in_dcache_ar_arready = ar_arbiter_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 58:29]
  assign io_in_dcache_aw_awready = aw_arbiter_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 160:29]
  assign io_in_dcache_w_wready = aw_master_valid & _GEN_101; // @[src/main/scala/axi/AXI3Crossbar.scala 194:25 189:27]
  assign io_in_dcache_r_data_rid = io_out_r_data_rvalid ? _GEN_40 : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 78:30]
  assign io_in_dcache_r_data_rdata = io_out_r_data_rvalid ? _GEN_41 : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 83:30]
  assign io_in_dcache_r_data_rlast = io_out_r_data_rvalid & _GEN_43; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 93:30]
  assign io_in_dcache_r_data_rvalid = io_out_r_data_rvalid & _GEN_44; // @[src/main/scala/axi/AXI3Crossbar.scala 100:30 72:32]
  assign io_in_dcache_b_data_bid = io_out_b_data_bvalid ? _GEN_134 : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 242:30 252:30]
  assign io_in_dcache_b_data_bvalid = io_out_b_data_bvalid & _GEN_136; // @[src/main/scala/axi/AXI3Crossbar.scala 252:30 236:32]
  assign io_in_uncache1_ar_arready = ar_arbiter_io_in_2_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 59:29]
  assign io_in_uncache1_aw_awready = aw_arbiter_io_in_2_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 161:29]
  assign io_in_uncache2_ar_arready = ar_arbiter_io_in_3_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 60:29]
  assign io_in_uncache2_aw_awready = aw_arbiter_io_in_3_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 162:29]
  assign io_out_ar_data_arid = ar_arbiter_io_out_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_araddr = ar_arbiter_io_out_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arlen = ar_arbiter_io_out_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arsize = ar_arbiter_io_out_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arburst = ar_arbiter_io_out_bits_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arlock = ar_arbiter_io_out_bits_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arcache = ar_arbiter_io_out_bits_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arprot = ar_arbiter_io_out_bits_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 49:18]
  assign io_out_ar_data_arvalid = ar_arbiter_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 51:26]
  assign io_out_aw_data_awid = aw_arbiter_io_out_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awaddr = aw_arbiter_io_out_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awlen = aw_arbiter_io_out_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awsize = aw_arbiter_io_out_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awburst = aw_arbiter_io_out_bits_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awlock = aw_arbiter_io_out_bits_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awcache = aw_arbiter_io_out_bits_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awprot = aw_arbiter_io_out_bits_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 153:18]
  assign io_out_aw_data_awvalid = aw_arbiter_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 154:26]
  assign io_out_w_data_wid = aw_master_valid ? _GEN_96 : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 181:24 194:25]
  assign io_out_w_data_wdata = aw_master_valid ? _GEN_97 : 32'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 182:24 194:25]
  assign io_out_w_data_wstrb = aw_master_valid ? _GEN_98 : 4'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 183:24 194:25]
  assign io_out_w_data_wlast = aw_master_valid & _GEN_99; // @[src/main/scala/axi/AXI3Crossbar.scala 184:24 194:25]
  assign io_out_w_data_wvalid = aw_master_valid & _GEN_100; // @[src/main/scala/axi/AXI3Crossbar.scala 185:24 194:25]
  assign io_out_r_rready = _io_out_r_rready_T_2 & io_in_icache_r_rready | _io_out_r_rready_T_3 & io_in_dcache_r_rready
     | _io_out_r_rready_T_4 & io_in_uncache1_r_rready | _io_out_r_rready_T_5 & io_in_uncache2_r_rready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_out_b_bready = io_in_dcache_b_bready | _io_out_b_bready_T_4 & io_in_uncache1_b_bready | _io_out_b_bready_T_5
     & io_in_uncache2_b_bready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign ar_arbiter_io_in_0_valid = io_in_icache_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 39:29]
  assign ar_arbiter_io_in_0_bits_arid = io_in_icache_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_0_bits_araddr = io_in_icache_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_0_bits_arlen = io_in_icache_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_0_bits_arsize = io_in_icache_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_0_bits_arburst = io_in_icache_ar_data_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 40:29]
  assign ar_arbiter_io_in_1_valid = io_in_dcache_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 41:29]
  assign ar_arbiter_io_in_1_bits_arid = io_in_dcache_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_1_bits_araddr = io_in_dcache_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_1_bits_arlen = io_in_dcache_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_1_bits_arsize = io_in_dcache_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_1_bits_arburst = io_in_dcache_ar_data_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 42:29]
  assign ar_arbiter_io_in_2_valid = io_in_uncache1_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 43:29]
  assign ar_arbiter_io_in_2_bits_arid = io_in_uncache1_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_araddr = io_in_uncache1_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arlen = io_in_uncache1_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arsize = io_in_uncache1_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arburst = io_in_uncache1_ar_data_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arlock = io_in_uncache1_ar_data_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arcache = io_in_uncache1_ar_data_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_2_bits_arprot = io_in_uncache1_ar_data_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 44:29]
  assign ar_arbiter_io_in_3_valid = io_in_uncache2_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 45:29]
  assign ar_arbiter_io_in_3_bits_arid = io_in_uncache2_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_araddr = io_in_uncache2_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arlen = io_in_uncache2_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arsize = io_in_uncache2_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arburst = io_in_uncache2_ar_data_arburst; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arlock = io_in_uncache2_ar_data_arlock; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arcache = io_in_uncache2_ar_data_arcache; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_in_3_bits_arprot = io_in_uncache2_ar_data_arprot; // @[src/main/scala/axi/AXI3Crossbar.scala 46:29]
  assign ar_arbiter_io_out_ready = io_out_ar_arready; // @[src/main/scala/axi/AXI3Crossbar.scala 55:27]
  assign aw_arbiter_io_in_1_valid = io_in_dcache_aw_data_awvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 145:29]
  assign aw_arbiter_io_in_1_bits_awid = io_in_dcache_aw_data_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 146:29]
  assign aw_arbiter_io_in_1_bits_awaddr = io_in_dcache_aw_data_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 146:29]
  assign aw_arbiter_io_in_1_bits_awlen = io_in_dcache_aw_data_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 146:29]
  assign aw_arbiter_io_in_1_bits_awsize = io_in_dcache_aw_data_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 146:29]
  assign aw_arbiter_io_in_1_bits_awburst = io_in_dcache_aw_data_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 146:29]
  assign aw_arbiter_io_in_2_valid = io_in_uncache1_aw_data_awvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 147:29]
  assign aw_arbiter_io_in_2_bits_awid = io_in_uncache1_aw_data_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awaddr = io_in_uncache1_aw_data_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awlen = io_in_uncache1_aw_data_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awsize = io_in_uncache1_aw_data_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awburst = io_in_uncache1_aw_data_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awlock = io_in_uncache1_aw_data_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awcache = io_in_uncache1_aw_data_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_2_bits_awprot = io_in_uncache1_aw_data_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 148:29]
  assign aw_arbiter_io_in_3_valid = io_in_uncache2_aw_data_awvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 149:29]
  assign aw_arbiter_io_in_3_bits_awid = io_in_uncache2_aw_data_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awaddr = io_in_uncache2_aw_data_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awlen = io_in_uncache2_aw_data_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awsize = io_in_uncache2_aw_data_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awburst = io_in_uncache2_aw_data_awburst; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awlock = io_in_uncache2_aw_data_awlock; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awcache = io_in_uncache2_aw_data_awcache; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_in_3_bits_awprot = io_in_uncache2_aw_data_awprot; // @[src/main/scala/axi/AXI3Crossbar.scala 150:29]
  assign aw_arbiter_io_out_ready = io_out_aw_awready; // @[src/main/scala/axi/AXI3Crossbar.scala 157:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/axi/AXI3Crossbar.scala 167:32]
      aw_master_valid <= 1'h0; // @[src/main/scala/axi/AXI3Crossbar.scala 167:32]
    end else begin
      aw_master_valid <= _GEN_61;
    end
    if (_T_6) begin // @[src/main/scala/axi/AXI3Crossbar.scala 170:32]
      aw_master_idx <= aw_arbiter_io_chosen; // @[src/main/scala/axi/AXI3Crossbar.scala 172:19]
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
