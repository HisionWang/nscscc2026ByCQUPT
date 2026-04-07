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
module Difftest(
  input   clock,
  input   reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  difftestInstrCommit_clock; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [7:0] difftestInstrCommit_coreid; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [7:0] difftestInstrCommit_index; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_valid; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [63:0] difftestInstrCommit_pc; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [31:0] difftestInstrCommit_instr; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_skip; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_is_TLBFILL; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [4:0] difftestInstrCommit_TLBFILL_index; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_is_CNTinst; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [63:0] difftestInstrCommit_timer_64_value; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_wen; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [7:0] difftestInstrCommit_wdest; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [63:0] difftestInstrCommit_wdata; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestInstrCommit_csr_rstat; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire [63:0] difftestInstrCommit_csr_data; // @[src/main/scala/difftest/Difftest.scala 313:35]
  wire  difftestExcpEvent_clock; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire [7:0] difftestExcpEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire  difftestExcpEvent_excp_valid; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire  difftestExcpEvent_eret; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire [10:0] difftestExcpEvent_intrNo; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire [5:0] difftestExcpEvent_cause; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire [63:0] difftestExcpEvent_exceptionPC; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire [31:0] difftestExcpEvent_exceptionInst; // @[src/main/scala/difftest/Difftest.scala 332:33]
  wire  difftestTrapEvent_clock; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire [7:0] difftestTrapEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire  difftestTrapEvent_valid; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire [7:0] difftestTrapEvent_code; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire [63:0] difftestTrapEvent_pc; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire [63:0] difftestTrapEvent_cycleCnt; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire [63:0] difftestTrapEvent_instrCnt; // @[src/main/scala/difftest/Difftest.scala 342:33]
  wire  difftestStoreEvent_clock; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire [7:0] difftestStoreEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire [7:0] difftestStoreEvent_index; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire  difftestStoreEvent_valid; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire [63:0] difftestStoreEvent_storePAddr; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire [63:0] difftestStoreEvent_storeVAddr; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire [63:0] difftestStoreEvent_storeData; // @[src/main/scala/difftest/Difftest.scala 351:34]
  wire  difftestLoadEvent_clock; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire [7:0] difftestLoadEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire [7:0] difftestLoadEvent_index; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire  difftestLoadEvent_valid; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire [63:0] difftestLoadEvent_paddr; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire [63:0] difftestLoadEvent_vaddr; // @[src/main/scala/difftest/Difftest.scala 360:33]
  wire  difftestCSRRegState_clock; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [7:0] difftestCSRRegState_coreid; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_crmd; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_prmd; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_euen; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_ecfg; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_estat; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_era; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_badv; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_eentry; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_tlbidx; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_tlbehi; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_tlbelo0; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_tlbelo1; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_asid; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_pgdl; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_pgdh; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_save0; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_save1; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_save2; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_save3; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_tid; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_tcfg; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_tval; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_ticlr; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_llbctl; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [63:0] difftestCSRRegState_tlbrentry; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_dmw0; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire [31:0] difftestCSRRegState_dmw1; // @[src/main/scala/difftest/Difftest.scala 368:35]
  wire  difftestGRegState_clock; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [7:0] difftestGRegState_coreid; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_0; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_1; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_2; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_3; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_4; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_5; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_6; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_7; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_8; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_9; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_10; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_11; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_12; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_13; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_14; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_15; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_16; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_17; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_18; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_19; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_20; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_21; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_22; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_23; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_24; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_25; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_26; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_27; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_28; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_29; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_30; // @[src/main/scala/difftest/Difftest.scala 399:33]
  wire [63:0] difftestGRegState_gpr_31; // @[src/main/scala/difftest/Difftest.scala 399:33]
  reg [63:0] cycleCnt; // @[src/main/scala/difftest/Difftest.scala 242:25]
  reg [63:0] instrCnt; // @[src/main/scala/difftest/Difftest.scala 243:25]
  wire [63:0] _cycleCnt_T_1 = cycleCnt + 64'h1; // @[src/main/scala/difftest/Difftest.scala 307:28]
  wire [64:0] _instrCnt_T = {{1'd0}, instrCnt}; // @[src/main/scala/difftest/Difftest.scala 308:28]
  DifftestInstrCommit difftestInstrCommit ( // @[src/main/scala/difftest/Difftest.scala 313:35]
    .clock(difftestInstrCommit_clock),
    .coreid(difftestInstrCommit_coreid),
    .index(difftestInstrCommit_index),
    .valid(difftestInstrCommit_valid),
    .pc(difftestInstrCommit_pc),
    .instr(difftestInstrCommit_instr),
    .skip(difftestInstrCommit_skip),
    .is_TLBFILL(difftestInstrCommit_is_TLBFILL),
    .TLBFILL_index(difftestInstrCommit_TLBFILL_index),
    .is_CNTinst(difftestInstrCommit_is_CNTinst),
    .timer_64_value(difftestInstrCommit_timer_64_value),
    .wen(difftestInstrCommit_wen),
    .wdest(difftestInstrCommit_wdest),
    .wdata(difftestInstrCommit_wdata),
    .csr_rstat(difftestInstrCommit_csr_rstat),
    .csr_data(difftestInstrCommit_csr_data)
  );
  DifftestExcpEvent difftestExcpEvent ( // @[src/main/scala/difftest/Difftest.scala 332:33]
    .clock(difftestExcpEvent_clock),
    .coreid(difftestExcpEvent_coreid),
    .excp_valid(difftestExcpEvent_excp_valid),
    .eret(difftestExcpEvent_eret),
    .intrNo(difftestExcpEvent_intrNo),
    .cause(difftestExcpEvent_cause),
    .exceptionPC(difftestExcpEvent_exceptionPC),
    .exceptionInst(difftestExcpEvent_exceptionInst)
  );
  DifftestTrapEvent difftestTrapEvent ( // @[src/main/scala/difftest/Difftest.scala 342:33]
    .clock(difftestTrapEvent_clock),
    .coreid(difftestTrapEvent_coreid),
    .valid(difftestTrapEvent_valid),
    .code(difftestTrapEvent_code),
    .pc(difftestTrapEvent_pc),
    .cycleCnt(difftestTrapEvent_cycleCnt),
    .instrCnt(difftestTrapEvent_instrCnt)
  );
  DifftestStoreEvent difftestStoreEvent ( // @[src/main/scala/difftest/Difftest.scala 351:34]
    .clock(difftestStoreEvent_clock),
    .coreid(difftestStoreEvent_coreid),
    .index(difftestStoreEvent_index),
    .valid(difftestStoreEvent_valid),
    .storePAddr(difftestStoreEvent_storePAddr),
    .storeVAddr(difftestStoreEvent_storeVAddr),
    .storeData(difftestStoreEvent_storeData)
  );
  DifftestLoadEvent difftestLoadEvent ( // @[src/main/scala/difftest/Difftest.scala 360:33]
    .clock(difftestLoadEvent_clock),
    .coreid(difftestLoadEvent_coreid),
    .index(difftestLoadEvent_index),
    .valid(difftestLoadEvent_valid),
    .paddr(difftestLoadEvent_paddr),
    .vaddr(difftestLoadEvent_vaddr)
  );
  DifftestCSRRegState difftestCSRRegState ( // @[src/main/scala/difftest/Difftest.scala 368:35]
    .clock(difftestCSRRegState_clock),
    .coreid(difftestCSRRegState_coreid),
    .crmd(difftestCSRRegState_crmd),
    .prmd(difftestCSRRegState_prmd),
    .euen(difftestCSRRegState_euen),
    .ecfg(difftestCSRRegState_ecfg),
    .estat(difftestCSRRegState_estat),
    .era(difftestCSRRegState_era),
    .badv(difftestCSRRegState_badv),
    .eentry(difftestCSRRegState_eentry),
    .tlbidx(difftestCSRRegState_tlbidx),
    .tlbehi(difftestCSRRegState_tlbehi),
    .tlbelo0(difftestCSRRegState_tlbelo0),
    .tlbelo1(difftestCSRRegState_tlbelo1),
    .asid(difftestCSRRegState_asid),
    .pgdl(difftestCSRRegState_pgdl),
    .pgdh(difftestCSRRegState_pgdh),
    .save0(difftestCSRRegState_save0),
    .save1(difftestCSRRegState_save1),
    .save2(difftestCSRRegState_save2),
    .save3(difftestCSRRegState_save3),
    .tid(difftestCSRRegState_tid),
    .tcfg(difftestCSRRegState_tcfg),
    .tval(difftestCSRRegState_tval),
    .ticlr(difftestCSRRegState_ticlr),
    .llbctl(difftestCSRRegState_llbctl),
    .tlbrentry(difftestCSRRegState_tlbrentry),
    .dmw0(difftestCSRRegState_dmw0),
    .dmw1(difftestCSRRegState_dmw1)
  );
  DifftestGRegState difftestGRegState ( // @[src/main/scala/difftest/Difftest.scala 399:33]
    .clock(difftestGRegState_clock),
    .coreid(difftestGRegState_coreid),
    .gpr_0(difftestGRegState_gpr_0),
    .gpr_1(difftestGRegState_gpr_1),
    .gpr_2(difftestGRegState_gpr_2),
    .gpr_3(difftestGRegState_gpr_3),
    .gpr_4(difftestGRegState_gpr_4),
    .gpr_5(difftestGRegState_gpr_5),
    .gpr_6(difftestGRegState_gpr_6),
    .gpr_7(difftestGRegState_gpr_7),
    .gpr_8(difftestGRegState_gpr_8),
    .gpr_9(difftestGRegState_gpr_9),
    .gpr_10(difftestGRegState_gpr_10),
    .gpr_11(difftestGRegState_gpr_11),
    .gpr_12(difftestGRegState_gpr_12),
    .gpr_13(difftestGRegState_gpr_13),
    .gpr_14(difftestGRegState_gpr_14),
    .gpr_15(difftestGRegState_gpr_15),
    .gpr_16(difftestGRegState_gpr_16),
    .gpr_17(difftestGRegState_gpr_17),
    .gpr_18(difftestGRegState_gpr_18),
    .gpr_19(difftestGRegState_gpr_19),
    .gpr_20(difftestGRegState_gpr_20),
    .gpr_21(difftestGRegState_gpr_21),
    .gpr_22(difftestGRegState_gpr_22),
    .gpr_23(difftestGRegState_gpr_23),
    .gpr_24(difftestGRegState_gpr_24),
    .gpr_25(difftestGRegState_gpr_25),
    .gpr_26(difftestGRegState_gpr_26),
    .gpr_27(difftestGRegState_gpr_27),
    .gpr_28(difftestGRegState_gpr_28),
    .gpr_29(difftestGRegState_gpr_29),
    .gpr_30(difftestGRegState_gpr_30),
    .gpr_31(difftestGRegState_gpr_31)
  );
  assign difftestInstrCommit_clock = clock; // @[src/main/scala/difftest/Difftest.scala 315:32]
  assign difftestInstrCommit_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 316:33]
  assign difftestInstrCommit_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 317:32]
  assign difftestInstrCommit_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 318:32]
  assign difftestInstrCommit_pc = 64'h0; // @[src/main/scala/difftest/Difftest.scala 319:29]
  assign difftestInstrCommit_instr = 32'h0; // @[src/main/scala/difftest/Difftest.scala 320:32]
  assign difftestInstrCommit_skip = 1'h0; // @[src/main/scala/difftest/Difftest.scala 321:31]
  assign difftestInstrCommit_is_TLBFILL = 1'h0; // @[src/main/scala/difftest/Difftest.scala 322:37]
  assign difftestInstrCommit_TLBFILL_index = 5'h0; // @[src/main/scala/difftest/Difftest.scala 323:40]
  assign difftestInstrCommit_is_CNTinst = 1'h0; // @[src/main/scala/difftest/Difftest.scala 324:37]
  assign difftestInstrCommit_timer_64_value = 64'h0; // @[src/main/scala/difftest/Difftest.scala 325:41]
  assign difftestInstrCommit_wen = 1'h0; // @[src/main/scala/difftest/Difftest.scala 326:30]
  assign difftestInstrCommit_wdest = 8'h0; // @[src/main/scala/difftest/Difftest.scala 327:32]
  assign difftestInstrCommit_wdata = 64'h0; // @[src/main/scala/difftest/Difftest.scala 328:32]
  assign difftestInstrCommit_csr_rstat = 1'h0; // @[src/main/scala/difftest/Difftest.scala 329:36]
  assign difftestInstrCommit_csr_data = 64'h0; // @[src/main/scala/difftest/Difftest.scala 330:35]
  assign difftestExcpEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 333:30]
  assign difftestExcpEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 334:31]
  assign difftestExcpEvent_excp_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 335:35]
  assign difftestExcpEvent_eret = 1'h0; // @[src/main/scala/difftest/Difftest.scala 336:29]
  assign difftestExcpEvent_intrNo = 11'h0; // @[src/main/scala/difftest/Difftest.scala 337:53]
  assign difftestExcpEvent_cause = 6'h0; // @[src/main/scala/difftest/Difftest.scala 338:30]
  assign difftestExcpEvent_exceptionPC = 64'h0; // @[src/main/scala/difftest/Difftest.scala 339:36]
  assign difftestExcpEvent_exceptionInst = 32'h0; // @[src/main/scala/difftest/Difftest.scala 340:38]
  assign difftestTrapEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 343:30]
  assign difftestTrapEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 344:31]
  assign difftestTrapEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 345:30]
  assign difftestTrapEvent_code = 8'h0; // @[src/main/scala/difftest/Difftest.scala 346:29]
  assign difftestTrapEvent_pc = 64'h0; // @[src/main/scala/difftest/Difftest.scala 347:27]
  assign difftestTrapEvent_cycleCnt = cycleCnt; // @[src/main/scala/difftest/Difftest.scala 348:33]
  assign difftestTrapEvent_instrCnt = instrCnt; // @[src/main/scala/difftest/Difftest.scala 349:33]
  assign difftestStoreEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 352:31]
  assign difftestStoreEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 353:32]
  assign difftestStoreEvent_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 354:31]
  assign difftestStoreEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 355:31]
  assign difftestStoreEvent_storePAddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 356:36]
  assign difftestStoreEvent_storeVAddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 357:36]
  assign difftestStoreEvent_storeData = 64'h0; // @[src/main/scala/difftest/Difftest.scala 358:35]
  assign difftestLoadEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 361:30]
  assign difftestLoadEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 362:31]
  assign difftestLoadEvent_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 363:30]
  assign difftestLoadEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 364:30]
  assign difftestLoadEvent_paddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 365:30]
  assign difftestLoadEvent_vaddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 366:30]
  assign difftestCSRRegState_clock = clock; // @[src/main/scala/difftest/Difftest.scala 369:32]
  assign difftestCSRRegState_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 370:33]
  assign difftestCSRRegState_crmd = 32'h0; // @[src/main/scala/difftest/Difftest.scala 371:31]
  assign difftestCSRRegState_prmd = 32'h0; // @[src/main/scala/difftest/Difftest.scala 372:31]
  assign difftestCSRRegState_euen = 32'h0; // @[src/main/scala/difftest/Difftest.scala 373:31]
  assign difftestCSRRegState_ecfg = 32'h0; // @[src/main/scala/difftest/Difftest.scala 374:31]
  assign difftestCSRRegState_estat = 32'h0; // @[src/main/scala/difftest/Difftest.scala 375:32]
  assign difftestCSRRegState_era = 64'h0; // @[src/main/scala/difftest/Difftest.scala 376:30]
  assign difftestCSRRegState_badv = 64'h0; // @[src/main/scala/difftest/Difftest.scala 377:31]
  assign difftestCSRRegState_eentry = 64'h0; // @[src/main/scala/difftest/Difftest.scala 378:33]
  assign difftestCSRRegState_tlbidx = 32'h0; // @[src/main/scala/difftest/Difftest.scala 379:33]
  assign difftestCSRRegState_tlbehi = 64'h0; // @[src/main/scala/difftest/Difftest.scala 380:33]
  assign difftestCSRRegState_tlbelo0 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 381:34]
  assign difftestCSRRegState_tlbelo1 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 382:34]
  assign difftestCSRRegState_asid = 32'h0; // @[src/main/scala/difftest/Difftest.scala 383:31]
  assign difftestCSRRegState_pgdl = 64'h0; // @[src/main/scala/difftest/Difftest.scala 384:31]
  assign difftestCSRRegState_pgdh = 64'h0; // @[src/main/scala/difftest/Difftest.scala 385:31]
  assign difftestCSRRegState_save0 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 386:32]
  assign difftestCSRRegState_save1 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 387:32]
  assign difftestCSRRegState_save2 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 388:32]
  assign difftestCSRRegState_save3 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 389:32]
  assign difftestCSRRegState_tid = 64'h0; // @[src/main/scala/difftest/Difftest.scala 390:30]
  assign difftestCSRRegState_tcfg = 32'h0; // @[src/main/scala/difftest/Difftest.scala 391:31]
  assign difftestCSRRegState_tval = 64'h0; // @[src/main/scala/difftest/Difftest.scala 392:31]
  assign difftestCSRRegState_ticlr = 32'h0; // @[src/main/scala/difftest/Difftest.scala 393:32]
  assign difftestCSRRegState_llbctl = 32'h0; // @[src/main/scala/difftest/Difftest.scala 394:33]
  assign difftestCSRRegState_tlbrentry = 64'h0; // @[src/main/scala/difftest/Difftest.scala 395:36]
  assign difftestCSRRegState_dmw0 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 396:31]
  assign difftestCSRRegState_dmw1 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 397:31]
  assign difftestGRegState_clock = clock; // @[src/main/scala/difftest/Difftest.scala 400:30]
  assign difftestGRegState_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 401:31]
  assign difftestGRegState_gpr_0 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 402:30]
  assign difftestGRegState_gpr_1 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 403:30]
  assign difftestGRegState_gpr_2 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 404:30]
  assign difftestGRegState_gpr_3 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 405:30]
  assign difftestGRegState_gpr_4 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 406:30]
  assign difftestGRegState_gpr_5 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 407:30]
  assign difftestGRegState_gpr_6 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 408:30]
  assign difftestGRegState_gpr_7 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 409:30]
  assign difftestGRegState_gpr_8 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 410:30]
  assign difftestGRegState_gpr_9 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 411:30]
  assign difftestGRegState_gpr_10 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 412:31]
  assign difftestGRegState_gpr_11 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 413:31]
  assign difftestGRegState_gpr_12 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 414:31]
  assign difftestGRegState_gpr_13 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 415:31]
  assign difftestGRegState_gpr_14 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 416:31]
  assign difftestGRegState_gpr_15 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 417:31]
  assign difftestGRegState_gpr_16 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 418:31]
  assign difftestGRegState_gpr_17 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 419:31]
  assign difftestGRegState_gpr_18 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 420:31]
  assign difftestGRegState_gpr_19 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 421:31]
  assign difftestGRegState_gpr_20 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 422:31]
  assign difftestGRegState_gpr_21 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 423:31]
  assign difftestGRegState_gpr_22 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 424:31]
  assign difftestGRegState_gpr_23 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 425:31]
  assign difftestGRegState_gpr_24 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 426:31]
  assign difftestGRegState_gpr_25 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 427:31]
  assign difftestGRegState_gpr_26 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 428:31]
  assign difftestGRegState_gpr_27 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 429:31]
  assign difftestGRegState_gpr_28 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 430:31]
  assign difftestGRegState_gpr_29 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 431:31]
  assign difftestGRegState_gpr_30 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 432:31]
  assign difftestGRegState_gpr_31 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 433:31]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 242:25]
      cycleCnt <= 64'h0; // @[src/main/scala/difftest/Difftest.scala 242:25]
    end else begin
      cycleCnt <= _cycleCnt_T_1;
    end
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 243:25]
      instrCnt <= 64'h0; // @[src/main/scala/difftest/Difftest.scala 243:25]
    end else begin
      instrCnt <= _instrCnt_T[63:0];
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
  cycleCnt = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  instrCnt = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module core_top(
  input         aclk, // @[src/main/scala/myCPU_top.scala 8:16]
  input         aresetn, // @[src/main/scala/myCPU_top.scala 9:19]
  input  [7:0]  intrpt, // @[src/main/scala/myCPU_top.scala 12:19]
  output [3:0]  arid, // @[src/main/scala/myCPU_top.scala 15:19]
  output [31:0] araddr, // @[src/main/scala/myCPU_top.scala 16:19]
  output [7:0]  arlen, // @[src/main/scala/myCPU_top.scala 17:19]
  output [2:0]  arsize, // @[src/main/scala/myCPU_top.scala 18:19]
  output [1:0]  arburst, // @[src/main/scala/myCPU_top.scala 19:19]
  output [1:0]  arlock, // @[src/main/scala/myCPU_top.scala 20:19]
  output [3:0]  arcache, // @[src/main/scala/myCPU_top.scala 21:19]
  output [2:0]  arprot, // @[src/main/scala/myCPU_top.scala 22:19]
  output        arvalid, // @[src/main/scala/myCPU_top.scala 23:19]
  input         arready, // @[src/main/scala/myCPU_top.scala 24:19]
  input  [3:0]  rid, // @[src/main/scala/myCPU_top.scala 27:19]
  input  [31:0] rdata, // @[src/main/scala/myCPU_top.scala 28:19]
  input  [1:0]  rresp, // @[src/main/scala/myCPU_top.scala 29:19]
  input         rlast, // @[src/main/scala/myCPU_top.scala 30:19]
  input         rvalid, // @[src/main/scala/myCPU_top.scala 31:19]
  output        rready, // @[src/main/scala/myCPU_top.scala 32:19]
  output [3:0]  awid, // @[src/main/scala/myCPU_top.scala 35:19]
  output [31:0] awaddr, // @[src/main/scala/myCPU_top.scala 36:19]
  output [7:0]  awlen, // @[src/main/scala/myCPU_top.scala 37:19]
  output [2:0]  awsize, // @[src/main/scala/myCPU_top.scala 38:19]
  output [1:0]  awburst, // @[src/main/scala/myCPU_top.scala 39:19]
  output [1:0]  awlock, // @[src/main/scala/myCPU_top.scala 40:19]
  output [3:0]  awcache, // @[src/main/scala/myCPU_top.scala 41:19]
  output [2:0]  awprot, // @[src/main/scala/myCPU_top.scala 42:19]
  output        awvalid, // @[src/main/scala/myCPU_top.scala 43:19]
  input         awready, // @[src/main/scala/myCPU_top.scala 44:19]
  output [3:0]  wid, // @[src/main/scala/myCPU_top.scala 47:19]
  output [31:0] wdata, // @[src/main/scala/myCPU_top.scala 48:19]
  output [3:0]  wstrb, // @[src/main/scala/myCPU_top.scala 49:19]
  output        wlast, // @[src/main/scala/myCPU_top.scala 50:19]
  output        wvalid, // @[src/main/scala/myCPU_top.scala 51:19]
  input         wready, // @[src/main/scala/myCPU_top.scala 52:19]
  input  [3:0]  bid, // @[src/main/scala/myCPU_top.scala 55:19]
  input  [1:0]  bresp, // @[src/main/scala/myCPU_top.scala 56:19]
  input         bvalid, // @[src/main/scala/myCPU_top.scala 57:19]
  output        bready, // @[src/main/scala/myCPU_top.scala 58:19]
  input         break_point, // @[src/main/scala/myCPU_top.scala 60:34]
  input         infor_flag, // @[src/main/scala/myCPU_top.scala 61:34]
  input  [4:0]  reg_num, // @[src/main/scala/myCPU_top.scala 62:34]
  output        ws_valid, // @[src/main/scala/myCPU_top.scala 63:34]
  output [31:0] rf_rdata, // @[src/main/scala/myCPU_top.scala 64:34]
  output [31:0] debug0_wb_pc, // @[src/main/scala/myCPU_top.scala 66:30]
  output        debug0_wb_rf_wen, // @[src/main/scala/myCPU_top.scala 67:30]
  output [4:0]  debug0_wb_rf_wnum, // @[src/main/scala/myCPU_top.scala 68:30]
  output [31:0] debug0_wb_rf_wdata, // @[src/main/scala/myCPU_top.scala 69:30]
  output [31:0] debug0_wb_inst // @[src/main/scala/myCPU_top.scala 70:30]
);
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_icache_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_icache_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_icache_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_icache_w_out_wdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_w_out_wlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_icache_b_bready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_out_wdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_w_out_wlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache1_w_out_wdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache2_w_out_wdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [7:0] axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [2:0] axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_w_out_wid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_r_in_rid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [31:0] axi_crossbar_io_out_r_in_rdata; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_r_in_rresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_r_in_rlast; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [3:0] axi_crossbar_io_out_b_in_bid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire [1:0] axi_crossbar_io_out_b_in_bresp; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 95:28]
  wire  icache_clock; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_reset; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [7:0] icache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [2:0] icache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [2:0] icache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [7:0] icache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [2:0] icache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [2:0] icache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [3:0] icache_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [1:0] icache_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire [31:0] icache_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  icache_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 97:28]
  wire  dcache_clock; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_reset; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [7:0] dcache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [2:0] dcache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [2:0] dcache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [7:0] dcache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [2:0] dcache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [2:0] dcache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [3:0] dcache_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [1:0] dcache_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire [31:0] dcache_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  dcache_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 101:28]
  wire  uncache1_clock; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_reset; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [7:0] uncache1_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] uncache1_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] uncache1_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [7:0] uncache1_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] uncache1_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [2:0] uncache1_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [3:0] uncache1_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [1:0] uncache1_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire [31:0] uncache1_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache1_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 102:28]
  wire  uncache2_clock; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_reset; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [7:0] uncache2_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache2_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache2_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [7:0] uncache2_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache2_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [2:0] uncache2_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_aw_awready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_w_wready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_r_in_rid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_axi_master_r_in_rdata; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_r_in_rresp; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_r_in_rlast; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [3:0] uncache2_io_axi_master_b_in_bid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [1:0] uncache2_io_axi_master_b_in_bresp; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_cpu_if_req_addr; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_cpu_if_req_valid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire [31:0] uncache2_io_cpu_if_resp_data; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  uncache2_io_cpu_if_resp_valid; // @[src/main/scala/myCPU_top.scala 103:28]
  wire  difftest_clock; // @[src/main/scala/myCPU_top.scala 189:24]
  wire  difftest_reset; // @[src/main/scala/myCPU_top.scala 189:24]
  AXI3Crossbar4to1 axi_crossbar ( // @[src/main/scala/myCPU_top.scala 95:28]
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
  MiniICache icache ( // @[src/main/scala/myCPU_top.scala 97:28]
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
  MiniICache dcache ( // @[src/main/scala/myCPU_top.scala 101:28]
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
  MiniICache uncache1 ( // @[src/main/scala/myCPU_top.scala 102:28]
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
  MiniICache uncache2 ( // @[src/main/scala/myCPU_top.scala 103:28]
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
  Difftest difftest ( // @[src/main/scala/myCPU_top.scala 189:24]
    .clock(difftest_clock),
    .reset(difftest_reset)
  );
  assign arid = axi_crossbar_io_out_ar_out_arid; // @[src/main/scala/myCPU_top.scala 133:11]
  assign araddr = axi_crossbar_io_out_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 134:11]
  assign arlen = axi_crossbar_io_out_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 135:11]
  assign arsize = axi_crossbar_io_out_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 136:11]
  assign arburst = axi_crossbar_io_out_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 137:11]
  assign arlock = axi_crossbar_io_out_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 138:11]
  assign arcache = axi_crossbar_io_out_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 139:11]
  assign arprot = axi_crossbar_io_out_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 140:11]
  assign arvalid = axi_crossbar_io_out_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 141:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 152:10]
  assign awid = axi_crossbar_io_out_aw_out_awid; // @[src/main/scala/myCPU_top.scala 155:11]
  assign awaddr = axi_crossbar_io_out_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 156:11]
  assign awlen = axi_crossbar_io_out_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 157:11]
  assign awsize = axi_crossbar_io_out_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 158:11]
  assign awburst = axi_crossbar_io_out_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 159:11]
  assign awlock = axi_crossbar_io_out_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 160:11]
  assign awcache = axi_crossbar_io_out_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 161:11]
  assign awprot = axi_crossbar_io_out_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 162:11]
  assign awvalid = axi_crossbar_io_out_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 163:11]
  assign wid = axi_crossbar_io_out_w_out_wid; // @[src/main/scala/myCPU_top.scala 167:11]
  assign wdata = axi_crossbar_io_out_w_out_wdata; // @[src/main/scala/myCPU_top.scala 168:11]
  assign wstrb = axi_crossbar_io_out_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 169:11]
  assign wlast = axi_crossbar_io_out_w_out_wlast; // @[src/main/scala/myCPU_top.scala 170:11]
  assign wvalid = axi_crossbar_io_out_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 171:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 180:10]
  assign ws_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 86:12]
  assign rf_rdata = 32'h0; // @[src/main/scala/myCPU_top.scala 87:12]
  assign debug0_wb_pc = 32'h0; // @[src/main/scala/myCPU_top.scala 81:16]
  assign debug0_wb_rf_wen = 1'h0; // @[src/main/scala/myCPU_top.scala 82:20]
  assign debug0_wb_rf_wnum = 5'h0; // @[src/main/scala/myCPU_top.scala 83:21]
  assign debug0_wb_rf_wdata = 32'h0; // @[src/main/scala/myCPU_top.scala 84:22]
  assign debug0_wb_inst = 32'h0; // @[src/main/scala/myCPU_top.scala 85:18]
  assign axi_crossbar_io_in_icache_ar_out_arid = icache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_araddr = icache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arlen = icache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arsize = icache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arburst = icache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arlock = icache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arcache = icache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arprot = icache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_ar_out_arvalid = icache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awid = icache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awaddr = icache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awlen = icache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awsize = icache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awburst = icache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awlock = icache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awcache = icache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awprot = icache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_aw_out_awvalid = icache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_w_out_wid = icache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_w_out_wdata = icache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_w_out_wstrb = icache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_w_out_wlast = icache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_w_out_wvalid = icache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_r_rready = icache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_icache_b_bready = icache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 126:31]
  assign axi_crossbar_io_in_dcache_ar_out_arid = dcache_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_araddr = dcache_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlen = dcache_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arsize = dcache_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arburst = dcache_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arlock = dcache_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arcache = dcache_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arprot = dcache_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_ar_out_arvalid = dcache_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awid = dcache_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awaddr = dcache_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlen = dcache_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awsize = dcache_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awburst = dcache_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awlock = dcache_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awcache = dcache_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awprot = dcache_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_aw_out_awvalid = dcache_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_w_out_wid = dcache_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_w_out_wdata = dcache_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_w_out_wstrb = dcache_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_w_out_wlast = dcache_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_w_out_wvalid = dcache_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_r_rready = dcache_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_dcache_b_bready = dcache_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 127:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arid = uncache1_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_araddr = uncache1_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlen = uncache1_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arsize = uncache1_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arburst = uncache1_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arlock = uncache1_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arcache = uncache1_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arprot = uncache1_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_ar_out_arvalid = uncache1_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awid = uncache1_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awaddr = uncache1_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlen = uncache1_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awsize = uncache1_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awburst = uncache1_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awlock = uncache1_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awcache = uncache1_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awprot = uncache1_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_aw_out_awvalid = uncache1_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_w_out_wid = uncache1_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_w_out_wdata = uncache1_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_w_out_wstrb = uncache1_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_w_out_wlast = uncache1_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_w_out_wvalid = uncache1_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 128:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arid = uncache2_io_axi_master_ar_out_arid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_araddr = uncache2_io_axi_master_ar_out_araddr; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlen = uncache2_io_axi_master_ar_out_arlen; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arsize = uncache2_io_axi_master_ar_out_arsize; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arburst = uncache2_io_axi_master_ar_out_arburst; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arlock = uncache2_io_axi_master_ar_out_arlock; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arcache = uncache2_io_axi_master_ar_out_arcache; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arprot = uncache2_io_axi_master_ar_out_arprot; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_ar_out_arvalid = uncache2_io_axi_master_ar_out_arvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awid = uncache2_io_axi_master_aw_out_awid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awaddr = uncache2_io_axi_master_aw_out_awaddr; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlen = uncache2_io_axi_master_aw_out_awlen; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awsize = uncache2_io_axi_master_aw_out_awsize; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awburst = uncache2_io_axi_master_aw_out_awburst; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awlock = uncache2_io_axi_master_aw_out_awlock; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awcache = uncache2_io_axi_master_aw_out_awcache; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awprot = uncache2_io_axi_master_aw_out_awprot; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_aw_out_awvalid = uncache2_io_axi_master_aw_out_awvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_w_out_wid = uncache2_io_axi_master_w_out_wid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_w_out_wdata = uncache2_io_axi_master_w_out_wdata; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_w_out_wstrb = uncache2_io_axi_master_w_out_wstrb; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_w_out_wlast = uncache2_io_axi_master_w_out_wlast; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_w_out_wvalid = uncache2_io_axi_master_w_out_wvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_io_axi_master_b_bready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/myCPU_top.scala 142:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/myCPU_top.scala 164:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/myCPU_top.scala 172:32]
  assign axi_crossbar_io_out_r_in_rid = rid; // @[src/main/scala/myCPU_top.scala 145:20 146:17]
  assign axi_crossbar_io_out_r_in_rdata = rdata; // @[src/main/scala/myCPU_top.scala 145:20 147:17]
  assign axi_crossbar_io_out_r_in_rresp = rresp; // @[src/main/scala/myCPU_top.scala 145:20 148:17]
  assign axi_crossbar_io_out_r_in_rlast = rlast; // @[src/main/scala/myCPU_top.scala 145:20 149:17]
  assign axi_crossbar_io_out_r_in_rvalid = rvalid; // @[src/main/scala/myCPU_top.scala 145:20 150:17]
  assign axi_crossbar_io_out_b_in_bid = bid; // @[src/main/scala/myCPU_top.scala 175:20 176:17]
  assign axi_crossbar_io_out_b_in_bresp = bresp; // @[src/main/scala/myCPU_top.scala 175:20 177:17]
  assign axi_crossbar_io_out_b_in_bvalid = bvalid; // @[src/main/scala/myCPU_top.scala 175:20 178:17]
  assign icache_clock = aclk;
  assign icache_reset = aresetn;
  assign icache_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_aw_awready = axi_crossbar_io_in_icache_aw_awready; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_w_wready = axi_crossbar_io_in_icache_w_wready; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_r_in_rid = axi_crossbar_io_in_icache_r_in_rid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_r_in_rdata = axi_crossbar_io_in_icache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_r_in_rresp = axi_crossbar_io_in_icache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_r_in_rlast = axi_crossbar_io_in_icache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_r_in_rvalid = axi_crossbar_io_in_icache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_b_in_bid = axi_crossbar_io_in_icache_b_in_bid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_b_in_bresp = axi_crossbar_io_in_icache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_axi_master_b_in_bvalid = axi_crossbar_io_in_icache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 126:31]
  assign icache_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 109:30]
  assign icache_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 110:30]
  assign dcache_clock = aclk;
  assign dcache_reset = aresetn;
  assign dcache_io_axi_master_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_r_in_rid = axi_crossbar_io_in_dcache_r_in_rid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_r_in_rdata = axi_crossbar_io_in_dcache_r_in_rdata; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_r_in_rresp = axi_crossbar_io_in_dcache_r_in_rresp; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_r_in_rlast = axi_crossbar_io_in_dcache_r_in_rlast; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_r_in_rvalid = axi_crossbar_io_in_dcache_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_b_in_bid = axi_crossbar_io_in_dcache_b_in_bid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_b_in_bresp = axi_crossbar_io_in_dcache_b_in_bresp; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_axi_master_b_in_bvalid = axi_crossbar_io_in_dcache_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 127:31]
  assign dcache_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 112:30]
  assign dcache_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 113:30]
  assign uncache1_clock = aclk;
  assign uncache1_reset = aresetn;
  assign uncache1_io_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_w_wready = axi_crossbar_io_in_uncache1_w_wready; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_r_in_rid = axi_crossbar_io_in_uncache1_r_in_rid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_r_in_rdata = axi_crossbar_io_in_uncache1_r_in_rdata; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_r_in_rresp = axi_crossbar_io_in_uncache1_r_in_rresp; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_r_in_rlast = axi_crossbar_io_in_uncache1_r_in_rlast; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache1_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_b_in_bid = axi_crossbar_io_in_uncache1_b_in_bid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_b_in_bresp = axi_crossbar_io_in_uncache1_b_in_bresp; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache1_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 128:31]
  assign uncache1_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 115:32]
  assign uncache1_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 116:32]
  assign uncache2_clock = aclk;
  assign uncache2_reset = aresetn;
  assign uncache2_io_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_w_wready = axi_crossbar_io_in_uncache2_w_wready; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_r_in_rid = axi_crossbar_io_in_uncache2_r_in_rid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_r_in_rdata = axi_crossbar_io_in_uncache2_r_in_rdata; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_r_in_rresp = axi_crossbar_io_in_uncache2_r_in_rresp; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_r_in_rlast = axi_crossbar_io_in_uncache2_r_in_rlast; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_r_in_rvalid = axi_crossbar_io_in_uncache2_r_in_rvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_b_in_bid = axi_crossbar_io_in_uncache2_b_in_bid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_b_in_bresp = axi_crossbar_io_in_uncache2_b_in_bresp; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_axi_master_b_in_bvalid = axi_crossbar_io_in_uncache2_b_in_bvalid; // @[src/main/scala/myCPU_top.scala 129:31]
  assign uncache2_io_cpu_if_req_addr = 32'h0; // @[src/main/scala/myCPU_top.scala 118:32]
  assign uncache2_io_cpu_if_req_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 119:32]
  assign difftest_clock = aclk;
  assign difftest_reset = aresetn;
endmodule
