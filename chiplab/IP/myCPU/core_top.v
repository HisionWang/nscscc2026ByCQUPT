module AXI3Crossbar4to1(
  input  [3:0]  io_in_icache_ar_out_arid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_icache_ar_out_araddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_icache_ar_out_arlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_icache_ar_out_arsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_icache_ar_out_arburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_icache_ar_out_arlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_icache_ar_out_arcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_icache_ar_out_arprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_ar_out_arvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_icache_aw_out_awid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_icache_aw_out_awaddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_icache_aw_out_awlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_icache_aw_out_awsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_icache_aw_out_awburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_icache_aw_out_awlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_icache_aw_out_awcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_icache_aw_out_awprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_aw_out_awvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_icache_w_out_wid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_icache_w_out_wdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_icache_w_out_wstrb, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_w_out_wlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_w_out_wvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_w_wready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_icache_r_in_rid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_in_icache_r_in_rdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_icache_r_in_rresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_r_in_rlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_r_in_rvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_r_rready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_icache_b_in_bid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_icache_b_in_bresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_icache_b_in_bvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_icache_b_bready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_ar_out_arid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_dcache_ar_out_araddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_dcache_ar_out_arlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_dcache_ar_out_arsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_dcache_ar_out_arburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_dcache_ar_out_arlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_ar_out_arcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_dcache_ar_out_arprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_ar_out_arvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_aw_out_awid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_dcache_aw_out_awaddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_dcache_aw_out_awlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_dcache_aw_out_awsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_dcache_aw_out_awburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_dcache_aw_out_awlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_aw_out_awcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_dcache_aw_out_awprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_aw_out_awvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_w_out_wid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_dcache_w_out_wdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_dcache_w_out_wstrb, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_w_out_wlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_w_out_wvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_w_wready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_dcache_r_in_rid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_in_dcache_r_in_rdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_dcache_r_in_rresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_r_in_rlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_r_in_rvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_r_rready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_dcache_b_in_bid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_dcache_b_in_bresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_dcache_b_in_bvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_dcache_b_bready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_ar_out_arid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache1_ar_out_araddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_uncache1_ar_out_arlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache1_ar_out_arsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache1_ar_out_arburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache1_ar_out_arlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_ar_out_arcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache1_ar_out_arprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_ar_out_arvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_aw_out_awid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache1_aw_out_awaddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_uncache1_aw_out_awlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache1_aw_out_awsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache1_aw_out_awburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache1_aw_out_awlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_aw_out_awcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache1_aw_out_awprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_aw_out_awvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_w_out_wid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache1_w_out_wdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache1_w_out_wstrb, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_w_out_wlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_w_out_wvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_w_wready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_uncache1_r_in_rid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_in_uncache1_r_in_rdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_uncache1_r_in_rresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_r_in_rlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_r_in_rvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_r_rready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_uncache1_b_in_bid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_uncache1_b_in_bresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache1_b_in_bvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache1_b_bready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_ar_out_arid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache2_ar_out_araddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_uncache2_ar_out_arlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache2_ar_out_arsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache2_ar_out_arburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache2_ar_out_arlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_ar_out_arcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache2_ar_out_arprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_ar_out_arvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_aw_out_awid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache2_aw_out_awaddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [7:0]  io_in_uncache2_aw_out_awlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache2_aw_out_awsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache2_aw_out_awburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_in_uncache2_aw_out_awlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_aw_out_awcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [2:0]  io_in_uncache2_aw_out_awprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_aw_out_awvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_w_out_wid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_in_uncache2_w_out_wdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_in_uncache2_w_out_wstrb, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_w_out_wlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_w_out_wvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_w_wready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_uncache2_r_in_rid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_in_uncache2_r_in_rdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_uncache2_r_in_rresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_r_in_rlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_r_in_rvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_r_rready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_in_uncache2_b_in_bid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_in_uncache2_b_in_bresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_in_uncache2_b_in_bvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_in_uncache2_b_bready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_ar_out_arid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_out_ar_out_araddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [7:0]  io_out_ar_out_arlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [2:0]  io_out_ar_out_arsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_out_ar_out_arburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_out_ar_out_arlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_ar_out_arcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [2:0]  io_out_ar_out_arprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_ar_out_arvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_ar_arready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_aw_out_awid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_out_aw_out_awaddr, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [7:0]  io_out_aw_out_awlen, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [2:0]  io_out_aw_out_awsize, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_out_aw_out_awburst, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [1:0]  io_out_aw_out_awlock, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_aw_out_awcache, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [2:0]  io_out_aw_out_awprot, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_aw_out_awvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_aw_awready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_w_out_wid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [31:0] io_out_w_out_wdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output [3:0]  io_out_w_out_wstrb, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_w_out_wlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_w_out_wvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_w_wready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_out_r_in_rid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [31:0] io_out_r_in_rdata, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_out_r_in_rresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_r_in_rlast, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_r_in_rvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_r_rready, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [3:0]  io_out_b_in_bid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input  [1:0]  io_out_b_in_bresp, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  input         io_out_b_in_bvalid, // @[src/main/scala/AXI3Crossbar.scala 7:14]
  output        io_out_b_bready // @[src/main/scala/AXI3Crossbar.scala 7:14]
);
  wire  req_valid_0 = io_in_icache_ar_out_arvalid | io_in_icache_aw_out_awvalid; // @[src/main/scala/AXI3Crossbar.scala 27:33]
  wire  req_valid_1 = io_in_dcache_ar_out_arvalid | io_in_dcache_aw_out_awvalid; // @[src/main/scala/AXI3Crossbar.scala 28:33]
  wire  req_valid_2 = io_in_uncache1_ar_out_arvalid | io_in_uncache1_aw_out_awvalid; // @[src/main/scala/AXI3Crossbar.scala 29:35]
  wire [1:0] _sel_idx_T = req_valid_2 ? 2'h2 : 2'h3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _sel_idx_T_1 = req_valid_1 ? 2'h1 : _sel_idx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] sel_idx = req_valid_0 ? 2'h0 : _sel_idx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  _ar_sel_data_T = 2'h1 == sel_idx; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [3:0] _ar_sel_data_T_1_arid = 2'h1 == sel_idx ? io_in_dcache_ar_out_arid : io_in_icache_ar_out_arid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [31:0] _ar_sel_data_T_1_araddr = 2'h1 == sel_idx ? io_in_dcache_ar_out_araddr : io_in_icache_ar_out_araddr; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [7:0] _ar_sel_data_T_1_arlen = 2'h1 == sel_idx ? io_in_dcache_ar_out_arlen : io_in_icache_ar_out_arlen; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [2:0] _ar_sel_data_T_1_arsize = 2'h1 == sel_idx ? io_in_dcache_ar_out_arsize : io_in_icache_ar_out_arsize; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [1:0] _ar_sel_data_T_1_arburst = 2'h1 == sel_idx ? io_in_dcache_ar_out_arburst : io_in_icache_ar_out_arburst; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [1:0] _ar_sel_data_T_1_arlock = 2'h1 == sel_idx ? io_in_dcache_ar_out_arlock : io_in_icache_ar_out_arlock; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [3:0] _ar_sel_data_T_1_arcache = 2'h1 == sel_idx ? io_in_dcache_ar_out_arcache : io_in_icache_ar_out_arcache; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [2:0] _ar_sel_data_T_1_arprot = 2'h1 == sel_idx ? io_in_dcache_ar_out_arprot : io_in_icache_ar_out_arprot; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire  _ar_sel_data_T_1_arvalid = 2'h1 == sel_idx ? io_in_dcache_ar_out_arvalid : io_in_icache_ar_out_arvalid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire  _ar_sel_data_T_2 = 2'h2 == sel_idx; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [3:0] _ar_sel_data_T_3_arid = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arid : _ar_sel_data_T_1_arid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [31:0] _ar_sel_data_T_3_araddr = 2'h2 == sel_idx ? io_in_uncache1_ar_out_araddr : _ar_sel_data_T_1_araddr; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [7:0] _ar_sel_data_T_3_arlen = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arlen : _ar_sel_data_T_1_arlen; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [2:0] _ar_sel_data_T_3_arsize = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arsize : _ar_sel_data_T_1_arsize; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [1:0] _ar_sel_data_T_3_arburst = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arburst : _ar_sel_data_T_1_arburst; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [1:0] _ar_sel_data_T_3_arlock = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arlock : _ar_sel_data_T_1_arlock; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [3:0] _ar_sel_data_T_3_arcache = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arcache : _ar_sel_data_T_1_arcache; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire [2:0] _ar_sel_data_T_3_arprot = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arprot : _ar_sel_data_T_1_arprot; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire  _ar_sel_data_T_3_arvalid = 2'h2 == sel_idx ? io_in_uncache1_ar_out_arvalid : _ar_sel_data_T_1_arvalid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire  _ar_sel_data_T_4 = 2'h3 == sel_idx; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  wire  _io_in_icache_ar_arready_T = sel_idx == 2'h0; // @[src/main/scala/AXI3Crossbar.scala 57:44]
  wire  _io_in_dcache_ar_arready_T = sel_idx == 2'h1; // @[src/main/scala/AXI3Crossbar.scala 58:44]
  wire  _io_in_uncache1_ar_arready_T = sel_idx == 2'h2; // @[src/main/scala/AXI3Crossbar.scala 59:44]
  wire  _io_in_uncache2_ar_arready_T = sel_idx == 2'h3; // @[src/main/scala/AXI3Crossbar.scala 60:44]
  wire [3:0] _aw_sel_data_T_1_awid = _ar_sel_data_T ? io_in_dcache_aw_out_awid : io_in_icache_aw_out_awid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [31:0] _aw_sel_data_T_1_awaddr = _ar_sel_data_T ? io_in_dcache_aw_out_awaddr : io_in_icache_aw_out_awaddr; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [7:0] _aw_sel_data_T_1_awlen = _ar_sel_data_T ? io_in_dcache_aw_out_awlen : io_in_icache_aw_out_awlen; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [2:0] _aw_sel_data_T_1_awsize = _ar_sel_data_T ? io_in_dcache_aw_out_awsize : io_in_icache_aw_out_awsize; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [1:0] _aw_sel_data_T_1_awburst = _ar_sel_data_T ? io_in_dcache_aw_out_awburst : io_in_icache_aw_out_awburst; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [1:0] _aw_sel_data_T_1_awlock = _ar_sel_data_T ? io_in_dcache_aw_out_awlock : io_in_icache_aw_out_awlock; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [3:0] _aw_sel_data_T_1_awcache = _ar_sel_data_T ? io_in_dcache_aw_out_awcache : io_in_icache_aw_out_awcache; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [2:0] _aw_sel_data_T_1_awprot = _ar_sel_data_T ? io_in_dcache_aw_out_awprot : io_in_icache_aw_out_awprot; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire  _aw_sel_data_T_1_awvalid = _ar_sel_data_T ? io_in_dcache_aw_out_awvalid : io_in_icache_aw_out_awvalid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [3:0] _aw_sel_data_T_3_awid = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awid : _aw_sel_data_T_1_awid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [31:0] _aw_sel_data_T_3_awaddr = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awaddr : _aw_sel_data_T_1_awaddr; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [7:0] _aw_sel_data_T_3_awlen = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awlen : _aw_sel_data_T_1_awlen; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [2:0] _aw_sel_data_T_3_awsize = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awsize : _aw_sel_data_T_1_awsize; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [1:0] _aw_sel_data_T_3_awburst = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awburst : _aw_sel_data_T_1_awburst; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [1:0] _aw_sel_data_T_3_awlock = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awlock : _aw_sel_data_T_1_awlock; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [3:0] _aw_sel_data_T_3_awcache = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awcache : _aw_sel_data_T_1_awcache; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [2:0] _aw_sel_data_T_3_awprot = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awprot : _aw_sel_data_T_1_awprot; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire  _aw_sel_data_T_3_awvalid = _ar_sel_data_T_2 ? io_in_uncache1_aw_out_awvalid : _aw_sel_data_T_1_awvalid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  wire [3:0] _w_sel_data_T_1_wid = _ar_sel_data_T ? io_in_dcache_w_out_wid : io_in_icache_w_out_wid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire [31:0] _w_sel_data_T_1_wdata = _ar_sel_data_T ? io_in_dcache_w_out_wdata : io_in_icache_w_out_wdata; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire [3:0] _w_sel_data_T_1_wstrb = _ar_sel_data_T ? io_in_dcache_w_out_wstrb : io_in_icache_w_out_wstrb; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire  _w_sel_data_T_1_wlast = _ar_sel_data_T ? io_in_dcache_w_out_wlast : io_in_icache_w_out_wlast; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire  _w_sel_data_T_1_wvalid = _ar_sel_data_T ? io_in_dcache_w_out_wvalid : io_in_icache_w_out_wvalid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire [3:0] _w_sel_data_T_3_wid = _ar_sel_data_T_2 ? io_in_uncache1_w_out_wid : _w_sel_data_T_1_wid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire [31:0] _w_sel_data_T_3_wdata = _ar_sel_data_T_2 ? io_in_uncache1_w_out_wdata : _w_sel_data_T_1_wdata; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire [3:0] _w_sel_data_T_3_wstrb = _ar_sel_data_T_2 ? io_in_uncache1_w_out_wstrb : _w_sel_data_T_1_wstrb; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire  _w_sel_data_T_3_wlast = _ar_sel_data_T_2 ? io_in_uncache1_w_out_wlast : _w_sel_data_T_1_wlast; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire  _w_sel_data_T_3_wvalid = _ar_sel_data_T_2 ? io_in_uncache1_w_out_wvalid : _w_sel_data_T_1_wvalid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  wire  _io_out_r_rready_T_1 = _ar_sel_data_T ? io_in_dcache_r_rready : io_in_icache_r_rready; // @[src/main/scala/AXI3Crossbar.scala 108:63]
  wire  _io_out_r_rready_T_3 = _ar_sel_data_T_2 ? io_in_uncache1_r_rready : _io_out_r_rready_T_1; // @[src/main/scala/AXI3Crossbar.scala 108:63]
  wire  _io_out_b_bready_T_1 = _ar_sel_data_T ? io_in_dcache_b_bready : io_in_icache_b_bready; // @[src/main/scala/AXI3Crossbar.scala 125:63]
  wire  _io_out_b_bready_T_3 = _ar_sel_data_T_2 ? io_in_uncache1_b_bready : _io_out_b_bready_T_1; // @[src/main/scala/AXI3Crossbar.scala 125:63]
  assign io_in_icache_ar_arready = sel_idx == 2'h0 & io_out_ar_arready; // @[src/main/scala/AXI3Crossbar.scala 57:35]
  assign io_in_icache_aw_awready = _io_in_icache_ar_arready_T & io_out_aw_awready; // @[src/main/scala/AXI3Crossbar.scala 78:35]
  assign io_in_icache_w_wready = _io_in_icache_ar_arready_T & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 99:33]
  assign io_in_icache_r_in_rid = _io_in_icache_ar_arready_T ? io_out_r_in_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 116:27]
  assign io_in_icache_r_in_rdata = _io_in_icache_ar_arready_T ? io_out_r_in_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 116:27]
  assign io_in_icache_r_in_rresp = _io_in_icache_ar_arready_T ? io_out_r_in_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 116:27]
  assign io_in_icache_r_in_rlast = _io_in_icache_ar_arready_T & io_out_r_in_rlast; // @[src/main/scala/AXI3Crossbar.scala 116:27]
  assign io_in_icache_r_in_rvalid = _io_in_icache_ar_arready_T & io_out_r_in_rvalid; // @[src/main/scala/AXI3Crossbar.scala 116:27]
  assign io_in_icache_b_in_bid = _io_in_icache_ar_arready_T ? io_out_b_in_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 133:27]
  assign io_in_icache_b_in_bresp = _io_in_icache_ar_arready_T ? io_out_b_in_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 133:27]
  assign io_in_icache_b_in_bvalid = _io_in_icache_ar_arready_T & io_out_b_in_bvalid; // @[src/main/scala/AXI3Crossbar.scala 133:27]
  assign io_in_dcache_ar_arready = sel_idx == 2'h1 & io_out_ar_arready; // @[src/main/scala/AXI3Crossbar.scala 58:35]
  assign io_in_dcache_aw_awready = _io_in_dcache_ar_arready_T & io_out_aw_awready; // @[src/main/scala/AXI3Crossbar.scala 79:35]
  assign io_in_dcache_w_wready = _io_in_dcache_ar_arready_T & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 100:33]
  assign io_in_dcache_r_in_rid = _io_in_dcache_ar_arready_T ? io_out_r_in_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 117:27]
  assign io_in_dcache_r_in_rdata = _io_in_dcache_ar_arready_T ? io_out_r_in_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 117:27]
  assign io_in_dcache_r_in_rresp = _io_in_dcache_ar_arready_T ? io_out_r_in_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 117:27]
  assign io_in_dcache_r_in_rlast = _io_in_dcache_ar_arready_T & io_out_r_in_rlast; // @[src/main/scala/AXI3Crossbar.scala 117:27]
  assign io_in_dcache_r_in_rvalid = _io_in_dcache_ar_arready_T & io_out_r_in_rvalid; // @[src/main/scala/AXI3Crossbar.scala 117:27]
  assign io_in_dcache_b_in_bid = _io_in_dcache_ar_arready_T ? io_out_b_in_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 134:27]
  assign io_in_dcache_b_in_bresp = _io_in_dcache_ar_arready_T ? io_out_b_in_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 134:27]
  assign io_in_dcache_b_in_bvalid = _io_in_dcache_ar_arready_T & io_out_b_in_bvalid; // @[src/main/scala/AXI3Crossbar.scala 134:27]
  assign io_in_uncache1_ar_arready = sel_idx == 2'h2 & io_out_ar_arready; // @[src/main/scala/AXI3Crossbar.scala 59:35]
  assign io_in_uncache1_aw_awready = _io_in_uncache1_ar_arready_T & io_out_aw_awready; // @[src/main/scala/AXI3Crossbar.scala 80:35]
  assign io_in_uncache1_w_wready = _io_in_uncache1_ar_arready_T & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 101:33]
  assign io_in_uncache1_r_in_rid = _io_in_uncache1_ar_arready_T ? io_out_r_in_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 118:29]
  assign io_in_uncache1_r_in_rdata = _io_in_uncache1_ar_arready_T ? io_out_r_in_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 118:29]
  assign io_in_uncache1_r_in_rresp = _io_in_uncache1_ar_arready_T ? io_out_r_in_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 118:29]
  assign io_in_uncache1_r_in_rlast = _io_in_uncache1_ar_arready_T & io_out_r_in_rlast; // @[src/main/scala/AXI3Crossbar.scala 118:29]
  assign io_in_uncache1_r_in_rvalid = _io_in_uncache1_ar_arready_T & io_out_r_in_rvalid; // @[src/main/scala/AXI3Crossbar.scala 118:29]
  assign io_in_uncache1_b_in_bid = _io_in_uncache1_ar_arready_T ? io_out_b_in_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 135:29]
  assign io_in_uncache1_b_in_bresp = _io_in_uncache1_ar_arready_T ? io_out_b_in_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 135:29]
  assign io_in_uncache1_b_in_bvalid = _io_in_uncache1_ar_arready_T & io_out_b_in_bvalid; // @[src/main/scala/AXI3Crossbar.scala 135:29]
  assign io_in_uncache2_ar_arready = sel_idx == 2'h3 & io_out_ar_arready; // @[src/main/scala/AXI3Crossbar.scala 60:35]
  assign io_in_uncache2_aw_awready = _io_in_uncache2_ar_arready_T & io_out_aw_awready; // @[src/main/scala/AXI3Crossbar.scala 81:35]
  assign io_in_uncache2_w_wready = _io_in_uncache2_ar_arready_T & io_out_w_wready; // @[src/main/scala/AXI3Crossbar.scala 102:33]
  assign io_in_uncache2_r_in_rid = _io_in_uncache2_ar_arready_T ? io_out_r_in_rid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 119:29]
  assign io_in_uncache2_r_in_rdata = _io_in_uncache2_ar_arready_T ? io_out_r_in_rdata : 32'h0; // @[src/main/scala/AXI3Crossbar.scala 119:29]
  assign io_in_uncache2_r_in_rresp = _io_in_uncache2_ar_arready_T ? io_out_r_in_rresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 119:29]
  assign io_in_uncache2_r_in_rlast = _io_in_uncache2_ar_arready_T & io_out_r_in_rlast; // @[src/main/scala/AXI3Crossbar.scala 119:29]
  assign io_in_uncache2_r_in_rvalid = _io_in_uncache2_ar_arready_T & io_out_r_in_rvalid; // @[src/main/scala/AXI3Crossbar.scala 119:29]
  assign io_in_uncache2_b_in_bid = _io_in_uncache2_ar_arready_T ? io_out_b_in_bid : 4'h0; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign io_in_uncache2_b_in_bresp = _io_in_uncache2_ar_arready_T ? io_out_b_in_bresp : 2'h0; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign io_in_uncache2_b_in_bvalid = _io_in_uncache2_ar_arready_T & io_out_b_in_bvalid; // @[src/main/scala/AXI3Crossbar.scala 136:29]
  assign io_out_ar_out_arid = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arid : _ar_sel_data_T_3_arid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_araddr = 2'h3 == sel_idx ? io_in_uncache2_ar_out_araddr : _ar_sel_data_T_3_araddr; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arlen = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arlen : _ar_sel_data_T_3_arlen; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arsize = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arsize : _ar_sel_data_T_3_arsize; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arburst = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arburst : _ar_sel_data_T_3_arburst; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arlock = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arlock : _ar_sel_data_T_3_arlock; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arcache = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arcache : _ar_sel_data_T_3_arcache; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arprot = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arprot : _ar_sel_data_T_3_arprot; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_ar_out_arvalid = 2'h3 == sel_idx ? io_in_uncache2_ar_out_arvalid : _ar_sel_data_T_3_arvalid; // @[src/main/scala/AXI3Crossbar.scala 47:55]
  assign io_out_aw_out_awid = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awid : _aw_sel_data_T_3_awid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awaddr = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awaddr : _aw_sel_data_T_3_awaddr; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awlen = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awlen : _aw_sel_data_T_3_awlen; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awsize = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awsize : _aw_sel_data_T_3_awsize; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awburst = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awburst : _aw_sel_data_T_3_awburst; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awlock = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awlock : _aw_sel_data_T_3_awlock; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awcache = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awcache : _aw_sel_data_T_3_awcache; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awprot = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awprot : _aw_sel_data_T_3_awprot; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_aw_out_awvalid = _ar_sel_data_T_4 ? io_in_uncache2_aw_out_awvalid : _aw_sel_data_T_3_awvalid; // @[src/main/scala/AXI3Crossbar.scala 70:55]
  assign io_out_w_out_wid = _ar_sel_data_T_4 ? io_in_uncache2_w_out_wid : _w_sel_data_T_3_wid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  assign io_out_w_out_wdata = _ar_sel_data_T_4 ? io_in_uncache2_w_out_wdata : _w_sel_data_T_3_wdata; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  assign io_out_w_out_wstrb = _ar_sel_data_T_4 ? io_in_uncache2_w_out_wstrb : _w_sel_data_T_3_wstrb; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  assign io_out_w_out_wlast = _ar_sel_data_T_4 ? io_in_uncache2_w_out_wlast : _w_sel_data_T_3_wlast; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  assign io_out_w_out_wvalid = _ar_sel_data_T_4 ? io_in_uncache2_w_out_wvalid : _w_sel_data_T_3_wvalid; // @[src/main/scala/AXI3Crossbar.scala 91:53]
  assign io_out_r_rready = _ar_sel_data_T_4 ? io_in_uncache2_r_rready : _io_out_r_rready_T_3; // @[src/main/scala/AXI3Crossbar.scala 108:63]
  assign io_out_b_bready = _ar_sel_data_T_4 ? io_in_uncache2_b_bready : _io_out_b_bready_T_3; // @[src/main/scala/AXI3Crossbar.scala 125:63]
endmodule
module MiniICache(
  input         clock,
  input         reset,
  output [3:0]  io_axi_master_ar_out_arid, // @[src/main/scala/icache.scala 7:14]
  output [31:0] io_axi_master_ar_out_araddr, // @[src/main/scala/icache.scala 7:14]
  output [7:0]  io_axi_master_ar_out_arlen, // @[src/main/scala/icache.scala 7:14]
  output [2:0]  io_axi_master_ar_out_arsize, // @[src/main/scala/icache.scala 7:14]
  output [1:0]  io_axi_master_ar_out_arburst, // @[src/main/scala/icache.scala 7:14]
  output [1:0]  io_axi_master_ar_out_arlock, // @[src/main/scala/icache.scala 7:14]
  output [3:0]  io_axi_master_ar_out_arcache, // @[src/main/scala/icache.scala 7:14]
  output [2:0]  io_axi_master_ar_out_arprot, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_ar_out_arvalid, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_ar_arready, // @[src/main/scala/icache.scala 7:14]
  output [3:0]  io_axi_master_aw_out_awid, // @[src/main/scala/icache.scala 7:14]
  output [31:0] io_axi_master_aw_out_awaddr, // @[src/main/scala/icache.scala 7:14]
  output [7:0]  io_axi_master_aw_out_awlen, // @[src/main/scala/icache.scala 7:14]
  output [2:0]  io_axi_master_aw_out_awsize, // @[src/main/scala/icache.scala 7:14]
  output [1:0]  io_axi_master_aw_out_awburst, // @[src/main/scala/icache.scala 7:14]
  output [1:0]  io_axi_master_aw_out_awlock, // @[src/main/scala/icache.scala 7:14]
  output [3:0]  io_axi_master_aw_out_awcache, // @[src/main/scala/icache.scala 7:14]
  output [2:0]  io_axi_master_aw_out_awprot, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_aw_out_awvalid, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_aw_awready, // @[src/main/scala/icache.scala 7:14]
  output [3:0]  io_axi_master_w_out_wid, // @[src/main/scala/icache.scala 7:14]
  output [31:0] io_axi_master_w_out_wdata, // @[src/main/scala/icache.scala 7:14]
  output [3:0]  io_axi_master_w_out_wstrb, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_w_out_wlast, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_w_out_wvalid, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_w_wready, // @[src/main/scala/icache.scala 7:14]
  input  [3:0]  io_axi_master_r_in_rid, // @[src/main/scala/icache.scala 7:14]
  input  [31:0] io_axi_master_r_in_rdata, // @[src/main/scala/icache.scala 7:14]
  input  [1:0]  io_axi_master_r_in_rresp, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_r_in_rlast, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_r_in_rvalid, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_r_rready, // @[src/main/scala/icache.scala 7:14]
  input  [3:0]  io_axi_master_b_in_bid, // @[src/main/scala/icache.scala 7:14]
  input  [1:0]  io_axi_master_b_in_bresp, // @[src/main/scala/icache.scala 7:14]
  input         io_axi_master_b_in_bvalid, // @[src/main/scala/icache.scala 7:14]
  output        io_axi_master_b_bready, // @[src/main/scala/icache.scala 7:14]
  input  [31:0] io_cpu_if_req_addr, // @[src/main/scala/icache.scala 7:14]
  input         io_cpu_if_req_valid, // @[src/main/scala/icache.scala 7:14]
  output [31:0] io_cpu_if_resp_data, // @[src/main/scala/icache.scala 7:14]
  output        io_cpu_if_resp_valid // @[src/main/scala/icache.scala 7:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [21:0] cache_tag [0:255]; // @[src/main/scala/icache.scala 46:33]
  wire  cache_tag_rd_tag_en; // @[src/main/scala/icache.scala 46:33]
  wire [7:0] cache_tag_rd_tag_addr; // @[src/main/scala/icache.scala 46:33]
  wire [21:0] cache_tag_rd_tag_data; // @[src/main/scala/icache.scala 46:33]
  wire [21:0] cache_tag_MPORT_data; // @[src/main/scala/icache.scala 46:33]
  wire [7:0] cache_tag_MPORT_addr; // @[src/main/scala/icache.scala 46:33]
  wire  cache_tag_MPORT_mask; // @[src/main/scala/icache.scala 46:33]
  wire  cache_tag_MPORT_en; // @[src/main/scala/icache.scala 46:33]
  reg  cache_tag_rd_tag_en_pipe_0;
  reg [7:0] cache_tag_rd_tag_addr_pipe_0;
  reg  cache_valid [0:255]; // @[src/main/scala/icache.scala 47:33]
  wire  cache_valid_rd_valid_en; // @[src/main/scala/icache.scala 47:33]
  wire [7:0] cache_valid_rd_valid_addr; // @[src/main/scala/icache.scala 47:33]
  wire  cache_valid_rd_valid_data; // @[src/main/scala/icache.scala 47:33]
  wire  cache_valid_MPORT_1_data; // @[src/main/scala/icache.scala 47:33]
  wire [7:0] cache_valid_MPORT_1_addr; // @[src/main/scala/icache.scala 47:33]
  wire  cache_valid_MPORT_1_mask; // @[src/main/scala/icache.scala 47:33]
  wire  cache_valid_MPORT_1_en; // @[src/main/scala/icache.scala 47:33]
  reg  cache_valid_rd_valid_en_pipe_0;
  reg [7:0] cache_valid_rd_valid_addr_pipe_0;
  reg [31:0] cache_data [0:255]; // @[src/main/scala/icache.scala 48:33]
  wire  cache_data_io_cpu_if_resp_data_MPORT_en; // @[src/main/scala/icache.scala 48:33]
  wire [7:0] cache_data_io_cpu_if_resp_data_MPORT_addr; // @[src/main/scala/icache.scala 48:33]
  wire [31:0] cache_data_io_cpu_if_resp_data_MPORT_data; // @[src/main/scala/icache.scala 48:33]
  wire [31:0] cache_data_MPORT_2_data; // @[src/main/scala/icache.scala 48:33]
  wire [7:0] cache_data_MPORT_2_addr; // @[src/main/scala/icache.scala 48:33]
  wire  cache_data_MPORT_2_mask; // @[src/main/scala/icache.scala 48:33]
  wire  cache_data_MPORT_2_en; // @[src/main/scala/icache.scala 48:33]
  reg  cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0;
  reg [7:0] cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0;
  wire [21:0] req_tag = io_cpu_if_req_addr[31:10]; // @[src/main/scala/icache.scala 54:27]
  wire  hit = cache_valid_rd_valid_data & cache_tag_rd_tag_data == req_tag; // @[src/main/scala/icache.scala 63:28]
  reg [31:0] miss_addr; // @[src/main/scala/icache.scala 69:25]
  reg [1:0] state; // @[src/main/scala/icache.scala 75:22]
  wire  _T = 2'h0 == state; // @[src/main/scala/icache.scala 81:17]
  wire [31:0] _GEN_12 = hit ? cache_data_io_cpu_if_resp_data_MPORT_data : 32'h0; // @[src/main/scala/icache.scala 84:19 22:24 86:32]
  wire  _GEN_17 = io_cpu_if_req_valid & hit; // @[src/main/scala/icache.scala 48:33 83:33]
  wire [31:0] _GEN_20 = io_cpu_if_req_valid ? _GEN_12 : 32'h0; // @[src/main/scala/icache.scala 83:33 97:30]
  wire [31:0] _GEN_32 = io_axi_master_r_in_rvalid ? io_axi_master_r_in_rdata : 32'h0; // @[src/main/scala/icache.scala 125:39 132:30 22:24]
  wire [1:0] _GEN_34 = io_axi_master_r_in_rvalid ? 2'h0 : state; // @[src/main/scala/icache.scala 125:39 137:22 75:22]
  wire [31:0] _GEN_42 = 2'h2 == state ? _GEN_32 : 32'h0; // @[src/main/scala/icache.scala 81:17 22:24]
  wire [31:0] _GEN_46 = 2'h1 == state ? miss_addr : 32'h0; // @[src/main/scala/icache.scala 81:17 114:28 79:24]
  wire [2:0] _GEN_48 = 2'h1 == state ? 3'h2 : 3'h0; // @[src/main/scala/icache.scala 81:17 114:28 79:24]
  wire [1:0] _GEN_49 = 2'h1 == state ? 2'h1 : 2'h0; // @[src/main/scala/icache.scala 81:17 114:28 79:24]
  wire  _GEN_55 = 2'h1 == state ? 1'h0 : 2'h2 == state; // @[src/main/scala/icache.scala 81:17 24:26]
  wire  _GEN_58 = 2'h1 == state ? 1'h0 : 2'h2 == state & io_axi_master_r_in_rvalid; // @[src/main/scala/icache.scala 81:17 46:33]
  wire [31:0] _GEN_62 = 2'h1 == state ? 32'h0 : _GEN_42; // @[src/main/scala/icache.scala 81:17 22:24]
  assign cache_tag_rd_tag_en = cache_tag_rd_tag_en_pipe_0;
  assign cache_tag_rd_tag_addr = cache_tag_rd_tag_addr_pipe_0;
  assign cache_tag_rd_tag_data = cache_tag[cache_tag_rd_tag_addr]; // @[src/main/scala/icache.scala 46:33]
  assign cache_tag_MPORT_data = io_cpu_if_req_addr[31:10];
  assign cache_tag_MPORT_addr = io_cpu_if_req_addr[9:2];
  assign cache_tag_MPORT_mask = 1'h1;
  assign cache_tag_MPORT_en = _T ? 1'h0 : _GEN_58;
  assign cache_valid_rd_valid_en = cache_valid_rd_valid_en_pipe_0;
  assign cache_valid_rd_valid_addr = cache_valid_rd_valid_addr_pipe_0;
  assign cache_valid_rd_valid_data = cache_valid[cache_valid_rd_valid_addr]; // @[src/main/scala/icache.scala 47:33]
  assign cache_valid_MPORT_1_data = 1'h1;
  assign cache_valid_MPORT_1_addr = io_cpu_if_req_addr[9:2];
  assign cache_valid_MPORT_1_mask = 1'h1;
  assign cache_valid_MPORT_1_en = _T ? 1'h0 : _GEN_58;
  assign cache_data_io_cpu_if_resp_data_MPORT_en = cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0;
  assign cache_data_io_cpu_if_resp_data_MPORT_addr = cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0;
  assign cache_data_io_cpu_if_resp_data_MPORT_data = cache_data[cache_data_io_cpu_if_resp_data_MPORT_addr]; // @[src/main/scala/icache.scala 48:33]
  assign cache_data_MPORT_2_data = io_axi_master_r_in_rdata;
  assign cache_data_MPORT_2_addr = io_cpu_if_req_addr[9:2];
  assign cache_data_MPORT_2_mask = 1'h1;
  assign cache_data_MPORT_2_en = _T ? 1'h0 : _GEN_58;
  assign io_axi_master_ar_out_arid = 4'h0; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_araddr = 2'h0 == state ? 32'h0 : _GEN_46; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arlen = 8'h0; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arsize = 2'h0 == state ? 3'h0 : _GEN_48; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arburst = 2'h0 == state ? 2'h0 : _GEN_49; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arlock = 2'h0; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arcache = 4'h0; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arprot = 3'h0; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_ar_out_arvalid = 2'h0 == state ? 1'h0 : 2'h1 == state; // @[src/main/scala/icache.scala 81:17 79:24]
  assign io_axi_master_aw_out_awid = 4'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awaddr = 32'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awlen = 8'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awsize = 3'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awburst = 2'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awlock = 2'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awcache = 4'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awprot = 3'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_aw_out_awvalid = 1'h0; // @[src/main/scala/icache.scala 28:{37,37}]
  assign io_axi_master_w_out_wid = 4'h0; // @[src/main/scala/icache.scala 29:{37,37}]
  assign io_axi_master_w_out_wdata = 32'h0; // @[src/main/scala/icache.scala 29:{37,37}]
  assign io_axi_master_w_out_wstrb = 4'h0; // @[src/main/scala/icache.scala 29:{37,37}]
  assign io_axi_master_w_out_wlast = 1'h0; // @[src/main/scala/icache.scala 29:{37,37}]
  assign io_axi_master_w_out_wvalid = 1'h0; // @[src/main/scala/icache.scala 29:{37,37}]
  assign io_axi_master_r_rready = 2'h0 == state ? 1'h0 : _GEN_55; // @[src/main/scala/icache.scala 81:17 24:26]
  assign io_axi_master_b_bready = 1'h0; // @[src/main/scala/icache.scala 25:26]
  assign io_cpu_if_resp_data = 2'h0 == state ? _GEN_20 : _GEN_62; // @[src/main/scala/icache.scala 81:17]
  assign io_cpu_if_resp_valid = 2'h0 == state ? _GEN_17 : _GEN_58; // @[src/main/scala/icache.scala 81:17]
  always @(posedge clock) begin
    if (cache_tag_MPORT_en & cache_tag_MPORT_mask) begin
      cache_tag[cache_tag_MPORT_addr] <= cache_tag_MPORT_data; // @[src/main/scala/icache.scala 46:33]
    end
    cache_tag_rd_tag_en_pipe_0 <= io_cpu_if_req_valid;
    if (io_cpu_if_req_valid) begin
      cache_tag_rd_tag_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (cache_valid_MPORT_1_en & cache_valid_MPORT_1_mask) begin
      cache_valid[cache_valid_MPORT_1_addr] <= cache_valid_MPORT_1_data; // @[src/main/scala/icache.scala 47:33]
    end
    cache_valid_rd_valid_en_pipe_0 <= io_cpu_if_req_valid;
    if (io_cpu_if_req_valid) begin
      cache_valid_rd_valid_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (cache_data_MPORT_2_en & cache_data_MPORT_2_mask) begin
      cache_data[cache_data_MPORT_2_addr] <= cache_data_MPORT_2_data; // @[src/main/scala/icache.scala 48:33]
    end
    cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 <= _T & _GEN_17;
    if (_T & _GEN_17) begin
      cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (2'h0 == state) begin // @[src/main/scala/icache.scala 81:17]
      if (io_cpu_if_req_valid) begin // @[src/main/scala/icache.scala 83:33]
        if (!(hit)) begin // @[src/main/scala/icache.scala 84:19]
          miss_addr <= io_cpu_if_req_addr; // @[src/main/scala/icache.scala 91:24]
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache.scala 75:22]
      state <= 2'h0; // @[src/main/scala/icache.scala 75:22]
    end else if (2'h0 == state) begin // @[src/main/scala/icache.scala 81:17]
      if (io_cpu_if_req_valid) begin // @[src/main/scala/icache.scala 83:33]
        if (!(hit)) begin // @[src/main/scala/icache.scala 84:19]
          state <= 2'h1; // @[src/main/scala/icache.scala 92:24]
        end
      end
    end else if (2'h1 == state) begin // @[src/main/scala/icache.scala 81:17]
      if (io_axi_master_ar_arready) begin // @[src/main/scala/icache.scala 116:38]
        state <= 2'h2; // @[src/main/scala/icache.scala 118:15]
      end
    end else if (2'h2 == state) begin // @[src/main/scala/icache.scala 81:17]
      state <= _GEN_34;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_tag[initvar] = _RAND_0[21:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_valid[initvar] = _RAND_3[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_data[initvar] = _RAND_6[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cache_tag_rd_tag_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cache_tag_rd_tag_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  cache_valid_rd_valid_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cache_valid_rd_valid_addr_pipe_0 = _RAND_5[7:0];
  _RAND_7 = {1{`RANDOM}};
  cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  miss_addr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module core_top(
  input         aclk, // @[src/main/scala/core_top.scala 8:16]
  input         aresetn, // @[src/main/scala/core_top.scala 9:19]
  input  [7:0]  intrpt, // @[src/main/scala/core_top.scala 12:19]
  output [3:0]  arid, // @[src/main/scala/core_top.scala 15:19]
  output [31:0] araddr, // @[src/main/scala/core_top.scala 16:19]
  output [7:0]  arlen, // @[src/main/scala/core_top.scala 17:19]
  output [2:0]  arsize, // @[src/main/scala/core_top.scala 18:19]
  output [1:0]  arburst, // @[src/main/scala/core_top.scala 19:19]
  output [1:0]  arlock, // @[src/main/scala/core_top.scala 20:19]
  output [3:0]  arcache, // @[src/main/scala/core_top.scala 21:19]
  output [2:0]  arprot, // @[src/main/scala/core_top.scala 22:19]
  output        arvalid, // @[src/main/scala/core_top.scala 23:19]
  input         arready, // @[src/main/scala/core_top.scala 24:19]
  input  [3:0]  rid, // @[src/main/scala/core_top.scala 27:19]
  input  [31:0] rdata, // @[src/main/scala/core_top.scala 28:19]
  input  [1:0]  rresp, // @[src/main/scala/core_top.scala 29:19]
  input         rlast, // @[src/main/scala/core_top.scala 30:19]
  input         rvalid, // @[src/main/scala/core_top.scala 31:19]
  output        rready, // @[src/main/scala/core_top.scala 32:19]
  output [3:0]  awid, // @[src/main/scala/core_top.scala 35:19]
  output [31:0] awaddr, // @[src/main/scala/core_top.scala 36:19]
  output [7:0]  awlen, // @[src/main/scala/core_top.scala 37:19]
  output [2:0]  awsize, // @[src/main/scala/core_top.scala 38:19]
  output [1:0]  awburst, // @[src/main/scala/core_top.scala 39:19]
  output [1:0]  awlock, // @[src/main/scala/core_top.scala 40:19]
  output [3:0]  awcache, // @[src/main/scala/core_top.scala 41:19]
  output [2:0]  awprot, // @[src/main/scala/core_top.scala 42:19]
  output        awvalid, // @[src/main/scala/core_top.scala 43:19]
  input         awready, // @[src/main/scala/core_top.scala 44:19]
  output [3:0]  wid, // @[src/main/scala/core_top.scala 47:19]
  output [31:0] wdata, // @[src/main/scala/core_top.scala 48:19]
  output [3:0]  wstrb, // @[src/main/scala/core_top.scala 49:19]
  output        wlast, // @[src/main/scala/core_top.scala 50:19]
  output        wvalid, // @[src/main/scala/core_top.scala 51:19]
  input         wready, // @[src/main/scala/core_top.scala 52:19]
  input  [3:0]  bid, // @[src/main/scala/core_top.scala 55:19]
  input  [1:0]  bresp, // @[src/main/scala/core_top.scala 56:19]
  input         bvalid, // @[src/main/scala/core_top.scala 57:19]
  output        bready // @[src/main/scala/core_top.scala 58:19]
);
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_out_araddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_out_arlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_ar_out_arvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_icache_aw_out_awaddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_icache_aw_out_awlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_aw_out_awvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_icache_w_out_wdata; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wstrb; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_w_out_wlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_w_out_wvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_icache_b_bready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_out_araddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_out_arlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_ar_out_arvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_out_awaddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_out_awlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_aw_out_awvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_out_wdata; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wstrb; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_w_out_wlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_w_out_wvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_out_araddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_out_arlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_ar_out_arvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_out_awaddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_out_awlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_aw_out_awvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache1_w_out_wdata; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wstrb; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_out_araddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_out_arlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_ar_out_arvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_out_awaddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_out_awlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_aw_out_awvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache2_w_out_wdata; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wstrb; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/core_top.scala 68:28]
  wire [7:0] axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/core_top.scala 68:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_w_out_wid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_r_in_rid; // @[src/main/scala/core_top.scala 68:28]
  wire [31:0] axi_crossbar_io_out_r_in_rdata; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_r_in_rresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_r_in_rlast; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_r_in_rvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/core_top.scala 68:28]
  wire [3:0] axi_crossbar_io_out_b_in_bid; // @[src/main/scala/core_top.scala 68:28]
  wire [1:0] axi_crossbar_io_out_b_in_bresp; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_b_in_bvalid; // @[src/main/scala/core_top.scala 68:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/core_top.scala 68:28]
  wire  icache_clock; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_reset; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 70:28]
  wire [7:0] icache_io_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 70:28]
  wire [2:0] icache_io_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 70:28]
  wire [2:0] icache_io_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 70:28]
  wire [7:0] icache_io_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 70:28]
  wire [2:0] icache_io_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 70:28]
  wire [2:0] icache_io_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_aw_awready; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_w_wready; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_r_in_rid; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_axi_master_r_in_rdata; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_r_in_rresp; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_r_in_rlast; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_r_in_rvalid; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] icache_io_axi_master_b_in_bid; // @[src/main/scala/core_top.scala 70:28]
  wire [1:0] icache_io_axi_master_b_in_bresp; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_b_in_bvalid; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_axi_master_b_bready; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_cpu_if_req_addr; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_cpu_if_req_valid; // @[src/main/scala/core_top.scala 70:28]
  wire [31:0] icache_io_cpu_if_resp_data; // @[src/main/scala/core_top.scala 70:28]
  wire  icache_io_cpu_if_resp_valid; // @[src/main/scala/core_top.scala 70:28]
  wire [3:0] dcache_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 74:28]
  wire [7:0] dcache_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 74:28]
  wire [2:0] dcache_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 74:28]
  wire [2:0] dcache_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_ar_arready; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 74:28]
  wire [7:0] dcache_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 74:28]
  wire [2:0] dcache_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 74:28]
  wire [2:0] dcache_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_aw_awready; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_w_wready; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_r_in_rid; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_axi_master_r_in_rdata; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_r_in_rresp; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_r_in_rlast; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_r_in_rvalid; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_r_rready; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] dcache_axi_master_b_in_bid; // @[src/main/scala/core_top.scala 74:28]
  wire [1:0] dcache_axi_master_b_in_bresp; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_b_in_bvalid; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_axi_master_b_bready; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_cpu_if_req_addr; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_cpu_if_req_valid; // @[src/main/scala/core_top.scala 74:28]
  wire [31:0] dcache_cpu_if_resp_data; // @[src/main/scala/core_top.scala 74:28]
  wire  dcache_cpu_if_resp_valid; // @[src/main/scala/core_top.scala 74:28]
  wire [3:0] uncache1_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 75:28]
  wire [7:0] uncache1_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 75:28]
  wire [2:0] uncache1_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 75:28]
  wire [2:0] uncache1_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_ar_arready; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 75:28]
  wire [7:0] uncache1_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 75:28]
  wire [2:0] uncache1_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 75:28]
  wire [2:0] uncache1_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_aw_awready; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_w_wready; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_r_in_rid; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_axi_master_r_in_rdata; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_r_in_rresp; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_r_in_rlast; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_r_in_rvalid; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_r_rready; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache1_axi_master_b_in_bid; // @[src/main/scala/core_top.scala 75:28]
  wire [1:0] uncache1_axi_master_b_in_bresp; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_b_in_bvalid; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_axi_master_b_bready; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_cpu_if_req_addr; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_cpu_if_req_valid; // @[src/main/scala/core_top.scala 75:28]
  wire [31:0] uncache1_cpu_if_resp_data; // @[src/main/scala/core_top.scala 75:28]
  wire  uncache1_cpu_if_resp_valid; // @[src/main/scala/core_top.scala 75:28]
  wire [3:0] uncache2_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 76:28]
  wire [7:0] uncache2_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 76:28]
  wire [2:0] uncache2_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 76:28]
  wire [2:0] uncache2_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_ar_arready; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 76:28]
  wire [7:0] uncache2_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 76:28]
  wire [2:0] uncache2_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 76:28]
  wire [2:0] uncache2_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_aw_awready; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_w_wready; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_r_in_rid; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_axi_master_r_in_rdata; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_r_in_rresp; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_r_in_rlast; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_r_in_rvalid; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_r_rready; // @[src/main/scala/core_top.scala 76:28]
  wire [3:0] uncache2_axi_master_b_in_bid; // @[src/main/scala/core_top.scala 76:28]
  wire [1:0] uncache2_axi_master_b_in_bresp; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_b_in_bvalid; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_axi_master_b_bready; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_cpu_if_req_addr; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_cpu_if_req_valid; // @[src/main/scala/core_top.scala 76:28]
  wire [31:0] uncache2_cpu_if_resp_data; // @[src/main/scala/core_top.scala 76:28]
  wire  uncache2_cpu_if_resp_valid; // @[src/main/scala/core_top.scala 76:28]
  AXI3Crossbar4to1 axi_crossbar ( // @[src/main/scala/core_top.scala 68:28]
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
  MiniICache icache ( // @[src/main/scala/core_top.scala 70:28]
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
  dcache_BlackBox dcache ( // @[src/main/scala/core_top.scala 74:28]
    .axi_master_ar_out_arid(dcache_axi_master_ar_out_arid),
    .axi_master_ar_out_araddr(dcache_axi_master_ar_out_araddr),
    .axi_master_ar_out_arlen(dcache_axi_master_ar_out_arlen),
    .axi_master_ar_out_arsize(dcache_axi_master_ar_out_arsize),
    .axi_master_ar_out_arburst(dcache_axi_master_ar_out_arburst),
    .axi_master_ar_out_arlock(dcache_axi_master_ar_out_arlock),
    .axi_master_ar_out_arcache(dcache_axi_master_ar_out_arcache),
    .axi_master_ar_out_arprot(dcache_axi_master_ar_out_arprot),
    .axi_master_ar_out_arvalid(dcache_axi_master_ar_out_arvalid),
    .axi_master_ar_arready(dcache_axi_master_ar_arready),
    .axi_master_aw_out_awid(dcache_axi_master_aw_out_awid),
    .axi_master_aw_out_awaddr(dcache_axi_master_aw_out_awaddr),
    .axi_master_aw_out_awlen(dcache_axi_master_aw_out_awlen),
    .axi_master_aw_out_awsize(dcache_axi_master_aw_out_awsize),
    .axi_master_aw_out_awburst(dcache_axi_master_aw_out_awburst),
    .axi_master_aw_out_awlock(dcache_axi_master_aw_out_awlock),
    .axi_master_aw_out_awcache(dcache_axi_master_aw_out_awcache),
    .axi_master_aw_out_awprot(dcache_axi_master_aw_out_awprot),
    .axi_master_aw_out_awvalid(dcache_axi_master_aw_out_awvalid),
    .axi_master_aw_awready(dcache_axi_master_aw_awready),
    .axi_master_w_out_wid(dcache_axi_master_w_out_wid),
    .axi_master_w_out_wdata(dcache_axi_master_w_out_wdata),
    .axi_master_w_out_wstrb(dcache_axi_master_w_out_wstrb),
    .axi_master_w_out_wlast(dcache_axi_master_w_out_wlast),
    .axi_master_w_out_wvalid(dcache_axi_master_w_out_wvalid),
    .axi_master_w_wready(dcache_axi_master_w_wready),
    .axi_master_r_in_rid(dcache_axi_master_r_in_rid),
    .axi_master_r_in_rdata(dcache_axi_master_r_in_rdata),
    .axi_master_r_in_rresp(dcache_axi_master_r_in_rresp),
    .axi_master_r_in_rlast(dcache_axi_master_r_in_rlast),
    .axi_master_r_in_rvalid(dcache_axi_master_r_in_rvalid),
    .axi_master_r_rready(dcache_axi_master_r_rready),
    .axi_master_b_in_bid(dcache_axi_master_b_in_bid),
    .axi_master_b_in_bresp(dcache_axi_master_b_in_bresp),
    .axi_master_b_in_bvalid(dcache_axi_master_b_in_bvalid),
    .axi_master_b_bready(dcache_axi_master_b_bready),
    .cpu_if_req_addr(dcache_cpu_if_req_addr),
    .cpu_if_req_valid(dcache_cpu_if_req_valid),
    .cpu_if_resp_data(dcache_cpu_if_resp_data),
    .cpu_if_resp_valid(dcache_cpu_if_resp_valid)
  );
  uncache1_BlackBox uncache1 ( // @[src/main/scala/core_top.scala 75:28]
    .axi_master_ar_out_arid(uncache1_axi_master_ar_out_arid),
    .axi_master_ar_out_araddr(uncache1_axi_master_ar_out_araddr),
    .axi_master_ar_out_arlen(uncache1_axi_master_ar_out_arlen),
    .axi_master_ar_out_arsize(uncache1_axi_master_ar_out_arsize),
    .axi_master_ar_out_arburst(uncache1_axi_master_ar_out_arburst),
    .axi_master_ar_out_arlock(uncache1_axi_master_ar_out_arlock),
    .axi_master_ar_out_arcache(uncache1_axi_master_ar_out_arcache),
    .axi_master_ar_out_arprot(uncache1_axi_master_ar_out_arprot),
    .axi_master_ar_out_arvalid(uncache1_axi_master_ar_out_arvalid),
    .axi_master_ar_arready(uncache1_axi_master_ar_arready),
    .axi_master_aw_out_awid(uncache1_axi_master_aw_out_awid),
    .axi_master_aw_out_awaddr(uncache1_axi_master_aw_out_awaddr),
    .axi_master_aw_out_awlen(uncache1_axi_master_aw_out_awlen),
    .axi_master_aw_out_awsize(uncache1_axi_master_aw_out_awsize),
    .axi_master_aw_out_awburst(uncache1_axi_master_aw_out_awburst),
    .axi_master_aw_out_awlock(uncache1_axi_master_aw_out_awlock),
    .axi_master_aw_out_awcache(uncache1_axi_master_aw_out_awcache),
    .axi_master_aw_out_awprot(uncache1_axi_master_aw_out_awprot),
    .axi_master_aw_out_awvalid(uncache1_axi_master_aw_out_awvalid),
    .axi_master_aw_awready(uncache1_axi_master_aw_awready),
    .axi_master_w_out_wid(uncache1_axi_master_w_out_wid),
    .axi_master_w_out_wdata(uncache1_axi_master_w_out_wdata),
    .axi_master_w_out_wstrb(uncache1_axi_master_w_out_wstrb),
    .axi_master_w_out_wlast(uncache1_axi_master_w_out_wlast),
    .axi_master_w_out_wvalid(uncache1_axi_master_w_out_wvalid),
    .axi_master_w_wready(uncache1_axi_master_w_wready),
    .axi_master_r_in_rid(uncache1_axi_master_r_in_rid),
    .axi_master_r_in_rdata(uncache1_axi_master_r_in_rdata),
    .axi_master_r_in_rresp(uncache1_axi_master_r_in_rresp),
    .axi_master_r_in_rlast(uncache1_axi_master_r_in_rlast),
    .axi_master_r_in_rvalid(uncache1_axi_master_r_in_rvalid),
    .axi_master_r_rready(uncache1_axi_master_r_rready),
    .axi_master_b_in_bid(uncache1_axi_master_b_in_bid),
    .axi_master_b_in_bresp(uncache1_axi_master_b_in_bresp),
    .axi_master_b_in_bvalid(uncache1_axi_master_b_in_bvalid),
    .axi_master_b_bready(uncache1_axi_master_b_bready),
    .cpu_if_req_addr(uncache1_cpu_if_req_addr),
    .cpu_if_req_valid(uncache1_cpu_if_req_valid),
    .cpu_if_resp_data(uncache1_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache1_cpu_if_resp_valid)
  );
  uncache2_BlackBox uncache2 ( // @[src/main/scala/core_top.scala 76:28]
    .axi_master_ar_out_arid(uncache2_axi_master_ar_out_arid),
    .axi_master_ar_out_araddr(uncache2_axi_master_ar_out_araddr),
    .axi_master_ar_out_arlen(uncache2_axi_master_ar_out_arlen),
    .axi_master_ar_out_arsize(uncache2_axi_master_ar_out_arsize),
    .axi_master_ar_out_arburst(uncache2_axi_master_ar_out_arburst),
    .axi_master_ar_out_arlock(uncache2_axi_master_ar_out_arlock),
    .axi_master_ar_out_arcache(uncache2_axi_master_ar_out_arcache),
    .axi_master_ar_out_arprot(uncache2_axi_master_ar_out_arprot),
    .axi_master_ar_out_arvalid(uncache2_axi_master_ar_out_arvalid),
    .axi_master_ar_arready(uncache2_axi_master_ar_arready),
    .axi_master_aw_out_awid(uncache2_axi_master_aw_out_awid),
    .axi_master_aw_out_awaddr(uncache2_axi_master_aw_out_awaddr),
    .axi_master_aw_out_awlen(uncache2_axi_master_aw_out_awlen),
    .axi_master_aw_out_awsize(uncache2_axi_master_aw_out_awsize),
    .axi_master_aw_out_awburst(uncache2_axi_master_aw_out_awburst),
    .axi_master_aw_out_awlock(uncache2_axi_master_aw_out_awlock),
    .axi_master_aw_out_awcache(uncache2_axi_master_aw_out_awcache),
    .axi_master_aw_out_awprot(uncache2_axi_master_aw_out_awprot),
    .axi_master_aw_out_awvalid(uncache2_axi_master_aw_out_awvalid),
    .axi_master_aw_awready(uncache2_axi_master_aw_awready),
    .axi_master_w_out_wid(uncache2_axi_master_w_out_wid),
    .axi_master_w_out_wdata(uncache2_axi_master_w_out_wdata),
    .axi_master_w_out_wstrb(uncache2_axi_master_w_out_wstrb),
    .axi_master_w_out_wlast(uncache2_axi_master_w_out_wlast),
    .axi_master_w_out_wvalid(uncache2_axi_master_w_out_wvalid),
    .axi_master_w_wready(uncache2_axi_master_w_wready),
    .axi_master_r_in_rid(uncache2_axi_master_r_in_rid),
    .axi_master_r_in_rdata(uncache2_axi_master_r_in_rdata),
    .axi_master_r_in_rresp(uncache2_axi_master_r_in_rresp),
    .axi_master_r_in_rlast(uncache2_axi_master_r_in_rlast),
    .axi_master_r_in_rvalid(uncache2_axi_master_r_in_rvalid),
    .axi_master_r_rready(uncache2_axi_master_r_rready),
    .axi_master_b_in_bid(uncache2_axi_master_b_in_bid),
    .axi_master_b_in_bresp(uncache2_axi_master_b_in_bresp),
    .axi_master_b_in_bvalid(uncache2_axi_master_b_in_bvalid),
    .axi_master_b_bready(uncache2_axi_master_b_bready),
    .cpu_if_req_addr(uncache2_cpu_if_req_addr),
    .cpu_if_req_valid(uncache2_cpu_if_req_valid),
    .cpu_if_resp_data(uncache2_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache2_cpu_if_resp_valid)
  );
  assign arid = axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/core_top.scala 106:11]
  assign araddr = axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/core_top.scala 107:11]
  assign arlen = axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/core_top.scala 108:11]
  assign arsize = axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/core_top.scala 109:11]
  assign arburst = axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/core_top.scala 110:11]
  assign arlock = axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/core_top.scala 111:11]
  assign arcache = axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/core_top.scala 112:11]
  assign arprot = axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/core_top.scala 113:11]
  assign arvalid = axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/core_top.scala 114:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/core_top.scala 125:10]
  assign awid = axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/core_top.scala 128:11]
  assign awaddr = axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/core_top.scala 129:11]
  assign awlen = axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/core_top.scala 130:11]
  assign awsize = axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/core_top.scala 131:11]
  assign awburst = axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/core_top.scala 132:11]
  assign awlock = axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/core_top.scala 133:11]
  assign awcache = axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/core_top.scala 134:11]
  assign awprot = axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/core_top.scala 135:11]
  assign awvalid = axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/core_top.scala 136:11]
  assign wid = axi_crossbar_io_out_w_out_wid; // @[src/main/scala/core_top.scala 140:11]
  assign wdata = axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/core_top.scala 141:11]
  assign wstrb = axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/core_top.scala 142:11]
  assign wlast = axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/core_top.scala 143:11]
  assign wvalid = axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/core_top.scala 144:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/core_top.scala 153:10]
  assign axi_crossbar_io_in_icache_ar_out_arid = icache_io_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_araddr = icache_io_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arlen = icache_io_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arsize = icache_io_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arburst = icache_io_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arlock = icache_io_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arcache = icache_io_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arprot = icache_io_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_ar_out_arvalid = icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awid = icache_io_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awaddr = icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awlen = icache_io_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awsize = icache_io_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awburst = icache_io_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awlock = icache_io_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awcache = icache_io_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awprot = icache_io_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_aw_out_awvalid = icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_w_out_wid = icache_io_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_w_out_wdata = icache_io_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_w_out_wstrb = icache_io_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_w_out_wlast = icache_io_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_w_out_wvalid = icache_io_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_icache_b_bready = icache_io_axi_master_b_bready; // @[src/main/scala/core_top.scala 99:31]
  assign axi_crossbar_io_in_dcache_ar_out_arid = dcache_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_araddr = dcache_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlen = dcache_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arsize = dcache_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arburst = dcache_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlock = dcache_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arcache = dcache_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arprot = dcache_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_ar_out_arvalid = dcache_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awid = dcache_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awaddr = dcache_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlen = dcache_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awsize = dcache_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awburst = dcache_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlock = dcache_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awcache = dcache_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awprot = dcache_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_aw_out_awvalid = dcache_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_w_out_wid = dcache_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_w_out_wdata = dcache_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_w_out_wstrb = dcache_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_w_out_wlast = dcache_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_w_out_wvalid = dcache_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_r_rready = dcache_axi_master_r_rready; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_dcache_b_bready = dcache_axi_master_b_bready; // @[src/main/scala/core_top.scala 100:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arid = uncache1_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_araddr = uncache1_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlen = uncache1_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arsize = uncache1_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arburst = uncache1_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlock = uncache1_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arcache = uncache1_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arprot = uncache1_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arvalid = uncache1_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awid = uncache1_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awaddr = uncache1_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlen = uncache1_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awsize = uncache1_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awburst = uncache1_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlock = uncache1_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awcache = uncache1_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awprot = uncache1_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awvalid = uncache1_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_w_out_wid = uncache1_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_w_out_wdata = uncache1_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_w_out_wstrb = uncache1_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_w_out_wlast = uncache1_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_w_out_wvalid = uncache1_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_axi_master_r_rready; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_axi_master_b_bready; // @[src/main/scala/core_top.scala 101:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arid = uncache2_axi_master_ar_out_arid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_araddr = uncache2_axi_master_ar_out_araddr; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlen = uncache2_axi_master_ar_out_arlen; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arsize = uncache2_axi_master_ar_out_arsize; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arburst = uncache2_axi_master_ar_out_arburst; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlock = uncache2_axi_master_ar_out_arlock; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arcache = uncache2_axi_master_ar_out_arcache; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arprot = uncache2_axi_master_ar_out_arprot; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arvalid = uncache2_axi_master_ar_out_arvalid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awid = uncache2_axi_master_aw_out_awid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awaddr = uncache2_axi_master_aw_out_awaddr; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlen = uncache2_axi_master_aw_out_awlen; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awsize = uncache2_axi_master_aw_out_awsize; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awburst = uncache2_axi_master_aw_out_awburst; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlock = uncache2_axi_master_aw_out_awlock; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awcache = uncache2_axi_master_aw_out_awcache; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awprot = uncache2_axi_master_aw_out_awprot; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awvalid = uncache2_axi_master_aw_out_awvalid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_w_out_wid = uncache2_axi_master_w_out_wid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_w_out_wdata = uncache2_axi_master_w_out_wdata; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_w_out_wstrb = uncache2_axi_master_w_out_wstrb; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_w_out_wlast = uncache2_axi_master_w_out_wlast; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_w_out_wvalid = uncache2_axi_master_w_out_wvalid; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_axi_master_r_rready; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_axi_master_b_bready; // @[src/main/scala/core_top.scala 102:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/core_top.scala 115:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/core_top.scala 137:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/core_top.scala 145:32]
  assign axi_crossbar_io_out_r_in_rid = rid; // @[src/main/scala/core_top.scala 118:20 119:17]
  assign axi_crossbar_io_out_r_in_rdata = rdata; // @[src/main/scala/core_top.scala 118:20 120:17]
  assign axi_crossbar_io_out_r_in_rresp = rresp; // @[src/main/scala/core_top.scala 118:20 121:17]
  assign axi_crossbar_io_out_r_in_rlast = rlast; // @[src/main/scala/core_top.scala 118:20 122:17]
  assign axi_crossbar_io_out_r_in_rvalid = rvalid; // @[src/main/scala/core_top.scala 118:20 123:17]
  assign axi_crossbar_io_out_b_in_bid = bid; // @[src/main/scala/core_top.scala 148:20 149:17]
  assign axi_crossbar_io_out_b_in_bresp = bresp; // @[src/main/scala/core_top.scala 148:20 150:17]
  assign axi_crossbar_io_out_b_in_bvalid = bvalid; // @[src/main/scala/core_top.scala 148:20 151:17]
  assign icache_clock = aclk;
  assign icache_reset = aresetn;
  assign icache_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_aw_awready = axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_w_wready = axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_r_in_rid = axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_r_in_rdata = axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_r_in_rresp = axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_r_in_rlast = axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_r_in_rvalid = axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_b_in_bid = axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_b_in_bresp = axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_axi_master_b_in_bvalid = axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/core_top.scala 99:31]
  assign icache_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/core_top.scala 82:30]
  assign icache_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/core_top.scala 83:30]
  assign dcache_axi_master_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_r_in_rid = axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_r_in_rdata = axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_r_in_rresp = axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_r_in_rlast = axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_r_in_rvalid = axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_b_in_bid = axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_b_in_bresp = axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_axi_master_b_in_bvalid = axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/core_top.scala 100:31]
  assign dcache_cpu_if_req_addr = 32'h0; // @[src/main/scala/core_top.scala 85:30]
  assign dcache_cpu_if_req_valid = 1'h0; // @[src/main/scala/core_top.scala 86:30]
  assign uncache1_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_w_wready = axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_r_in_rid = axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_r_in_rdata = axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_r_in_rresp = axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_r_in_rlast = axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_b_in_bid = axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_b_in_bresp = axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/core_top.scala 101:31]
  assign uncache1_cpu_if_req_addr = 32'h0; // @[src/main/scala/core_top.scala 88:32]
  assign uncache1_cpu_if_req_valid = 1'h0; // @[src/main/scala/core_top.scala 89:32]
  assign uncache2_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_w_wready = axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_r_in_rid = axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_r_in_rdata = axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_r_in_rresp = axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_r_in_rlast = axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_b_in_bid = axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_b_in_bresp = axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/core_top.scala 102:31]
  assign uncache2_cpu_if_req_addr = 32'h0; // @[src/main/scala/core_top.scala 91:32]
  assign uncache2_cpu_if_req_valid = 1'h0; // @[src/main/scala/core_top.scala 92:32]
endmodule
