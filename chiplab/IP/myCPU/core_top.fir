FIRRTL version 1.2.0
circuit core_top :
  module AXI3Crossbar4to1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_icache : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, flip in_dcache : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, flip in_uncache1 : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, flip in_uncache2 : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, out : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}} @[src/main/scala/AXI3Crossbar.scala 7:14]

    node _req_valid_T = or(io.in_icache.ar.out.arvalid, io.in_icache.aw.out.awvalid) @[src/main/scala/AXI3Crossbar.scala 27:33]
    node _req_valid_T_1 = or(io.in_dcache.ar.out.arvalid, io.in_dcache.aw.out.awvalid) @[src/main/scala/AXI3Crossbar.scala 28:33]
    node _req_valid_T_2 = or(io.in_uncache1.ar.out.arvalid, io.in_uncache1.aw.out.awvalid) @[src/main/scala/AXI3Crossbar.scala 29:35]
    node _req_valid_T_3 = or(io.in_uncache2.ar.out.arvalid, io.in_uncache2.aw.out.awvalid) @[src/main/scala/AXI3Crossbar.scala 30:35]
    wire req_valid : UInt<1>[4] @[src/main/scala/AXI3Crossbar.scala 26:26]
    req_valid[0] <= _req_valid_T @[src/main/scala/AXI3Crossbar.scala 26:26]
    req_valid[1] <= _req_valid_T_1 @[src/main/scala/AXI3Crossbar.scala 26:26]
    req_valid[2] <= _req_valid_T_2 @[src/main/scala/AXI3Crossbar.scala 26:26]
    req_valid[3] <= _req_valid_T_3 @[src/main/scala/AXI3Crossbar.scala 26:26]
    wire req_prio : UInt<2>[4] @[src/main/scala/AXI3Crossbar.scala 32:25]
    req_prio[0] <= UInt<2>("h3") @[src/main/scala/AXI3Crossbar.scala 32:25]
    req_prio[1] <= UInt<2>("h2") @[src/main/scala/AXI3Crossbar.scala 32:25]
    req_prio[2] <= UInt<2>("h1") @[src/main/scala/AXI3Crossbar.scala 32:25]
    req_prio[3] <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 32:25]
    node _sel_idx_T = mux(req_valid[2], UInt<2>("h2"), UInt<2>("h3")) @[src/main/scala/chisel3/util/Mux.scala 50:70]
    node _sel_idx_T_1 = mux(req_valid[1], UInt<1>("h1"), _sel_idx_T) @[src/main/scala/chisel3/util/Mux.scala 50:70]
    node sel_idx = mux(req_valid[0], UInt<1>("h0"), _sel_idx_T_1) @[src/main/scala/chisel3/util/Mux.scala 50:70]
    node _ar_sel_data_T = eq(UInt<1>("h1"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 47:55]
    node _ar_sel_data_T_1 = mux(_ar_sel_data_T, io.in_dcache.ar.out, io.in_icache.ar.out) @[src/main/scala/AXI3Crossbar.scala 47:55]
    node _ar_sel_data_T_2 = eq(UInt<2>("h2"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 47:55]
    node _ar_sel_data_T_3 = mux(_ar_sel_data_T_2, io.in_uncache1.ar.out, _ar_sel_data_T_1) @[src/main/scala/AXI3Crossbar.scala 47:55]
    node _ar_sel_data_T_4 = eq(UInt<2>("h3"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 47:55]
    node ar_sel_data = mux(_ar_sel_data_T_4, io.in_uncache2.ar.out, _ar_sel_data_T_3) @[src/main/scala/AXI3Crossbar.scala 47:55]
    io.out.ar.out <= ar_sel_data @[src/main/scala/AXI3Crossbar.scala 55:17]
    node _io_in_icache_ar_arready_T = eq(sel_idx, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 57:44]
    node _io_in_icache_ar_arready_T_1 = mux(_io_in_icache_ar_arready_T, io.out.ar.arready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 57:35]
    io.in_icache.ar.arready <= _io_in_icache_ar_arready_T_1 @[src/main/scala/AXI3Crossbar.scala 57:29]
    node _io_in_dcache_ar_arready_T = eq(sel_idx, UInt<1>("h1")) @[src/main/scala/AXI3Crossbar.scala 58:44]
    node _io_in_dcache_ar_arready_T_1 = mux(_io_in_dcache_ar_arready_T, io.out.ar.arready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 58:35]
    io.in_dcache.ar.arready <= _io_in_dcache_ar_arready_T_1 @[src/main/scala/AXI3Crossbar.scala 58:29]
    node _io_in_uncache1_ar_arready_T = eq(sel_idx, UInt<2>("h2")) @[src/main/scala/AXI3Crossbar.scala 59:44]
    node _io_in_uncache1_ar_arready_T_1 = mux(_io_in_uncache1_ar_arready_T, io.out.ar.arready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 59:35]
    io.in_uncache1.ar.arready <= _io_in_uncache1_ar_arready_T_1 @[src/main/scala/AXI3Crossbar.scala 59:29]
    node _io_in_uncache2_ar_arready_T = eq(sel_idx, UInt<2>("h3")) @[src/main/scala/AXI3Crossbar.scala 60:44]
    node _io_in_uncache2_ar_arready_T_1 = mux(_io_in_uncache2_ar_arready_T, io.out.ar.arready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 60:35]
    io.in_uncache2.ar.arready <= _io_in_uncache2_ar_arready_T_1 @[src/main/scala/AXI3Crossbar.scala 60:29]
    node _aw_sel_data_T = eq(UInt<1>("h1"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 70:55]
    node _aw_sel_data_T_1 = mux(_aw_sel_data_T, io.in_dcache.aw.out, io.in_icache.aw.out) @[src/main/scala/AXI3Crossbar.scala 70:55]
    node _aw_sel_data_T_2 = eq(UInt<2>("h2"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 70:55]
    node _aw_sel_data_T_3 = mux(_aw_sel_data_T_2, io.in_uncache1.aw.out, _aw_sel_data_T_1) @[src/main/scala/AXI3Crossbar.scala 70:55]
    node _aw_sel_data_T_4 = eq(UInt<2>("h3"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 70:55]
    node aw_sel_data = mux(_aw_sel_data_T_4, io.in_uncache2.aw.out, _aw_sel_data_T_3) @[src/main/scala/AXI3Crossbar.scala 70:55]
    io.out.aw.out <= aw_sel_data @[src/main/scala/AXI3Crossbar.scala 77:17]
    node _io_in_icache_aw_awready_T = eq(sel_idx, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 78:44]
    node _io_in_icache_aw_awready_T_1 = mux(_io_in_icache_aw_awready_T, io.out.aw.awready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 78:35]
    io.in_icache.aw.awready <= _io_in_icache_aw_awready_T_1 @[src/main/scala/AXI3Crossbar.scala 78:29]
    node _io_in_dcache_aw_awready_T = eq(sel_idx, UInt<1>("h1")) @[src/main/scala/AXI3Crossbar.scala 79:44]
    node _io_in_dcache_aw_awready_T_1 = mux(_io_in_dcache_aw_awready_T, io.out.aw.awready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 79:35]
    io.in_dcache.aw.awready <= _io_in_dcache_aw_awready_T_1 @[src/main/scala/AXI3Crossbar.scala 79:29]
    node _io_in_uncache1_aw_awready_T = eq(sel_idx, UInt<2>("h2")) @[src/main/scala/AXI3Crossbar.scala 80:44]
    node _io_in_uncache1_aw_awready_T_1 = mux(_io_in_uncache1_aw_awready_T, io.out.aw.awready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 80:35]
    io.in_uncache1.aw.awready <= _io_in_uncache1_aw_awready_T_1 @[src/main/scala/AXI3Crossbar.scala 80:29]
    node _io_in_uncache2_aw_awready_T = eq(sel_idx, UInt<2>("h3")) @[src/main/scala/AXI3Crossbar.scala 81:44]
    node _io_in_uncache2_aw_awready_T_1 = mux(_io_in_uncache2_aw_awready_T, io.out.aw.awready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 81:35]
    io.in_uncache2.aw.awready <= _io_in_uncache2_aw_awready_T_1 @[src/main/scala/AXI3Crossbar.scala 81:29]
    node _w_sel_data_T = eq(UInt<1>("h1"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 91:53]
    node _w_sel_data_T_1 = mux(_w_sel_data_T, io.in_dcache.w.out, io.in_icache.w.out) @[src/main/scala/AXI3Crossbar.scala 91:53]
    node _w_sel_data_T_2 = eq(UInt<2>("h2"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 91:53]
    node _w_sel_data_T_3 = mux(_w_sel_data_T_2, io.in_uncache1.w.out, _w_sel_data_T_1) @[src/main/scala/AXI3Crossbar.scala 91:53]
    node _w_sel_data_T_4 = eq(UInt<2>("h3"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 91:53]
    node w_sel_data = mux(_w_sel_data_T_4, io.in_uncache2.w.out, _w_sel_data_T_3) @[src/main/scala/AXI3Crossbar.scala 91:53]
    io.out.w.out <= w_sel_data @[src/main/scala/AXI3Crossbar.scala 98:16]
    node _io_in_icache_w_wready_T = eq(sel_idx, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 99:42]
    node _io_in_icache_w_wready_T_1 = mux(_io_in_icache_w_wready_T, io.out.w.wready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 99:33]
    io.in_icache.w.wready <= _io_in_icache_w_wready_T_1 @[src/main/scala/AXI3Crossbar.scala 99:27]
    node _io_in_dcache_w_wready_T = eq(sel_idx, UInt<1>("h1")) @[src/main/scala/AXI3Crossbar.scala 100:42]
    node _io_in_dcache_w_wready_T_1 = mux(_io_in_dcache_w_wready_T, io.out.w.wready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 100:33]
    io.in_dcache.w.wready <= _io_in_dcache_w_wready_T_1 @[src/main/scala/AXI3Crossbar.scala 100:27]
    node _io_in_uncache1_w_wready_T = eq(sel_idx, UInt<2>("h2")) @[src/main/scala/AXI3Crossbar.scala 101:42]
    node _io_in_uncache1_w_wready_T_1 = mux(_io_in_uncache1_w_wready_T, io.out.w.wready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 101:33]
    io.in_uncache1.w.wready <= _io_in_uncache1_w_wready_T_1 @[src/main/scala/AXI3Crossbar.scala 101:27]
    node _io_in_uncache2_w_wready_T = eq(sel_idx, UInt<2>("h3")) @[src/main/scala/AXI3Crossbar.scala 102:42]
    node _io_in_uncache2_w_wready_T_1 = mux(_io_in_uncache2_w_wready_T, io.out.w.wready, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 102:33]
    io.in_uncache2.w.wready <= _io_in_uncache2_w_wready_T_1 @[src/main/scala/AXI3Crossbar.scala 102:27]
    node _io_out_r_rready_T = eq(UInt<1>("h1"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 108:63]
    node _io_out_r_rready_T_1 = mux(_io_out_r_rready_T, io.in_dcache.r.rready, io.in_icache.r.rready) @[src/main/scala/AXI3Crossbar.scala 108:63]
    node _io_out_r_rready_T_2 = eq(UInt<2>("h2"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 108:63]
    node _io_out_r_rready_T_3 = mux(_io_out_r_rready_T_2, io.in_uncache1.r.rready, _io_out_r_rready_T_1) @[src/main/scala/AXI3Crossbar.scala 108:63]
    node _io_out_r_rready_T_4 = eq(UInt<2>("h3"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 108:63]
    node _io_out_r_rready_T_5 = mux(_io_out_r_rready_T_4, io.in_uncache2.r.rready, _io_out_r_rready_T_3) @[src/main/scala/AXI3Crossbar.scala 108:63]
    io.out.r.rready <= _io_out_r_rready_T_5 @[src/main/scala/AXI3Crossbar.scala 108:19]
    node _io_in_icache_r_in_T = eq(sel_idx, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 116:36]
    wire _io_in_icache_r_in_WIRE : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 116:70]
    _io_in_icache_r_in_WIRE.rvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 116:70]
    _io_in_icache_r_in_WIRE.rlast <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 116:70]
    _io_in_icache_r_in_WIRE.rresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 116:70]
    _io_in_icache_r_in_WIRE.rdata <= UInt<32>("h0") @[src/main/scala/AXI3Crossbar.scala 116:70]
    _io_in_icache_r_in_WIRE.rid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 116:70]
    node _io_in_icache_r_in_T_1 = mux(_io_in_icache_r_in_T, io.out.r.in, _io_in_icache_r_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 116:27]
    io.in_icache.r.in <= _io_in_icache_r_in_T_1 @[src/main/scala/AXI3Crossbar.scala 116:21]
    node _io_in_dcache_r_in_T = eq(sel_idx, UInt<1>("h1")) @[src/main/scala/AXI3Crossbar.scala 117:36]
    wire _io_in_dcache_r_in_WIRE : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 117:70]
    _io_in_dcache_r_in_WIRE.rvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 117:70]
    _io_in_dcache_r_in_WIRE.rlast <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 117:70]
    _io_in_dcache_r_in_WIRE.rresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 117:70]
    _io_in_dcache_r_in_WIRE.rdata <= UInt<32>("h0") @[src/main/scala/AXI3Crossbar.scala 117:70]
    _io_in_dcache_r_in_WIRE.rid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 117:70]
    node _io_in_dcache_r_in_T_1 = mux(_io_in_dcache_r_in_T, io.out.r.in, _io_in_dcache_r_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 117:27]
    io.in_dcache.r.in <= _io_in_dcache_r_in_T_1 @[src/main/scala/AXI3Crossbar.scala 117:21]
    node _io_in_uncache1_r_in_T = eq(sel_idx, UInt<2>("h2")) @[src/main/scala/AXI3Crossbar.scala 118:38]
    wire _io_in_uncache1_r_in_WIRE : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 118:72]
    _io_in_uncache1_r_in_WIRE.rvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 118:72]
    _io_in_uncache1_r_in_WIRE.rlast <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 118:72]
    _io_in_uncache1_r_in_WIRE.rresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 118:72]
    _io_in_uncache1_r_in_WIRE.rdata <= UInt<32>("h0") @[src/main/scala/AXI3Crossbar.scala 118:72]
    _io_in_uncache1_r_in_WIRE.rid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 118:72]
    node _io_in_uncache1_r_in_T_1 = mux(_io_in_uncache1_r_in_T, io.out.r.in, _io_in_uncache1_r_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 118:29]
    io.in_uncache1.r.in <= _io_in_uncache1_r_in_T_1 @[src/main/scala/AXI3Crossbar.scala 118:23]
    node _io_in_uncache2_r_in_T = eq(sel_idx, UInt<2>("h3")) @[src/main/scala/AXI3Crossbar.scala 119:38]
    wire _io_in_uncache2_r_in_WIRE : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 119:72]
    _io_in_uncache2_r_in_WIRE.rvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 119:72]
    _io_in_uncache2_r_in_WIRE.rlast <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 119:72]
    _io_in_uncache2_r_in_WIRE.rresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 119:72]
    _io_in_uncache2_r_in_WIRE.rdata <= UInt<32>("h0") @[src/main/scala/AXI3Crossbar.scala 119:72]
    _io_in_uncache2_r_in_WIRE.rid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 119:72]
    node _io_in_uncache2_r_in_T_1 = mux(_io_in_uncache2_r_in_T, io.out.r.in, _io_in_uncache2_r_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 119:29]
    io.in_uncache2.r.in <= _io_in_uncache2_r_in_T_1 @[src/main/scala/AXI3Crossbar.scala 119:23]
    node _io_out_b_bready_T = eq(UInt<1>("h1"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 125:63]
    node _io_out_b_bready_T_1 = mux(_io_out_b_bready_T, io.in_dcache.b.bready, io.in_icache.b.bready) @[src/main/scala/AXI3Crossbar.scala 125:63]
    node _io_out_b_bready_T_2 = eq(UInt<2>("h2"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 125:63]
    node _io_out_b_bready_T_3 = mux(_io_out_b_bready_T_2, io.in_uncache1.b.bready, _io_out_b_bready_T_1) @[src/main/scala/AXI3Crossbar.scala 125:63]
    node _io_out_b_bready_T_4 = eq(UInt<2>("h3"), sel_idx) @[src/main/scala/AXI3Crossbar.scala 125:63]
    node _io_out_b_bready_T_5 = mux(_io_out_b_bready_T_4, io.in_uncache2.b.bready, _io_out_b_bready_T_3) @[src/main/scala/AXI3Crossbar.scala 125:63]
    io.out.b.bready <= _io_out_b_bready_T_5 @[src/main/scala/AXI3Crossbar.scala 125:19]
    node _io_in_icache_b_in_T = eq(sel_idx, UInt<1>("h0")) @[src/main/scala/AXI3Crossbar.scala 133:36]
    wire _io_in_icache_b_in_WIRE : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 133:70]
    _io_in_icache_b_in_WIRE.bvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 133:70]
    _io_in_icache_b_in_WIRE.bresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 133:70]
    _io_in_icache_b_in_WIRE.bid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 133:70]
    node _io_in_icache_b_in_T_1 = mux(_io_in_icache_b_in_T, io.out.b.in, _io_in_icache_b_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 133:27]
    io.in_icache.b.in <= _io_in_icache_b_in_T_1 @[src/main/scala/AXI3Crossbar.scala 133:21]
    node _io_in_dcache_b_in_T = eq(sel_idx, UInt<1>("h1")) @[src/main/scala/AXI3Crossbar.scala 134:36]
    wire _io_in_dcache_b_in_WIRE : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 134:70]
    _io_in_dcache_b_in_WIRE.bvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 134:70]
    _io_in_dcache_b_in_WIRE.bresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 134:70]
    _io_in_dcache_b_in_WIRE.bid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 134:70]
    node _io_in_dcache_b_in_T_1 = mux(_io_in_dcache_b_in_T, io.out.b.in, _io_in_dcache_b_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 134:27]
    io.in_dcache.b.in <= _io_in_dcache_b_in_T_1 @[src/main/scala/AXI3Crossbar.scala 134:21]
    node _io_in_uncache1_b_in_T = eq(sel_idx, UInt<2>("h2")) @[src/main/scala/AXI3Crossbar.scala 135:38]
    wire _io_in_uncache1_b_in_WIRE : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 135:72]
    _io_in_uncache1_b_in_WIRE.bvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 135:72]
    _io_in_uncache1_b_in_WIRE.bresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 135:72]
    _io_in_uncache1_b_in_WIRE.bid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 135:72]
    node _io_in_uncache1_b_in_T_1 = mux(_io_in_uncache1_b_in_T, io.out.b.in, _io_in_uncache1_b_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 135:29]
    io.in_uncache1.b.in <= _io_in_uncache1_b_in_T_1 @[src/main/scala/AXI3Crossbar.scala 135:23]
    node _io_in_uncache2_b_in_T = eq(sel_idx, UInt<2>("h3")) @[src/main/scala/AXI3Crossbar.scala 136:38]
    wire _io_in_uncache2_b_in_WIRE : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>} @[src/main/scala/AXI3Crossbar.scala 136:72]
    _io_in_uncache2_b_in_WIRE.bvalid <= UInt<1>("h0") @[src/main/scala/AXI3Crossbar.scala 136:72]
    _io_in_uncache2_b_in_WIRE.bresp <= UInt<2>("h0") @[src/main/scala/AXI3Crossbar.scala 136:72]
    _io_in_uncache2_b_in_WIRE.bid <= UInt<4>("h0") @[src/main/scala/AXI3Crossbar.scala 136:72]
    node _io_in_uncache2_b_in_T_1 = mux(_io_in_uncache2_b_in_T, io.out.b.in, _io_in_uncache2_b_in_WIRE) @[src/main/scala/AXI3Crossbar.scala 136:29]
    io.in_uncache2.b.in <= _io_in_uncache2_b_in_T_1 @[src/main/scala/AXI3Crossbar.scala 136:23]

  module MiniICache :
    input clock : Clock
    input reset : Reset
    output io : { axi_master : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, cpu_if : { flip req_addr : UInt<32>, flip req_valid : UInt<1>, resp_data : UInt<32>, resp_valid : UInt<1>}} @[src/main/scala/icache.scala 7:14]

    io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 22:24]
    io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 23:24]
    io.axi_master.r.rready <= UInt<1>("h0") @[src/main/scala/icache.scala 24:26]
    io.axi_master.b.bready <= UInt<1>("h0") @[src/main/scala/icache.scala 25:26]
    wire default_aw_data : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>} @[src/main/scala/icache.scala 28:37]
    default_aw_data.awvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awprot <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awcache <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlock <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awburst <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awsize <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlen <= UInt<8>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awaddr <= UInt<32>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awid <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    wire default_w_data : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>} @[src/main/scala/icache.scala 29:37]
    default_w_data.wvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wlast <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wstrb <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wdata <= UInt<32>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wid <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    io.axi_master.aw.out <= default_aw_data @[src/main/scala/icache.scala 30:24]
    io.axi_master.w.out <= default_w_data @[src/main/scala/icache.scala 31:24]
    smem cache_tag : UInt<22> [256] @[src/main/scala/icache.scala 46:33]
    smem cache_valid : UInt<1> [256] @[src/main/scala/icache.scala 47:33]
    smem cache_data : UInt<32> [256] @[src/main/scala/icache.scala 48:33]
    node req_tag = bits(io.cpu_if.req_addr, 31, 10) @[src/main/scala/icache.scala 54:27]
    node req_index = bits(io.cpu_if.req_addr, 9, 2) @[src/main/scala/icache.scala 55:27]
    node req_offset = bits(io.cpu_if.req_addr, 1, 0) @[src/main/scala/icache.scala 56:27]
    wire _rd_tag_WIRE : UInt @[src/main/scala/icache.scala 61:33]
    _rd_tag_WIRE is invalid @[src/main/scala/icache.scala 61:33]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 61:33]
      _rd_tag_WIRE <= req_index @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T = or(_rd_tag_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T_1 = bits(_rd_tag_T, 7, 0) @[src/main/scala/icache.scala 61:33]
      read mport rd_tag = cache_tag[_rd_tag_T_1], clock @[src/main/scala/icache.scala 61:33]
    wire _rd_valid_WIRE : UInt @[src/main/scala/icache.scala 62:35]
    _rd_valid_WIRE is invalid @[src/main/scala/icache.scala 62:35]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 62:35]
      _rd_valid_WIRE <= req_index @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T = or(_rd_valid_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T_1 = bits(_rd_valid_T, 7, 0) @[src/main/scala/icache.scala 62:35]
      read mport rd_valid = cache_valid[_rd_valid_T_1], clock @[src/main/scala/icache.scala 62:35]
    node _hit_T = eq(rd_tag, req_tag) @[src/main/scala/icache.scala 63:39]
    node hit = and(rd_valid, _hit_T) @[src/main/scala/icache.scala 63:28]
    reg miss_pending : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/icache.scala 68:29]
    reg miss_addr : UInt<32>, clock with :
      reset => (UInt<1>("h0"), miss_addr) @[src/main/scala/icache.scala 69:25]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/icache.scala 75:22]
    wire default_ar_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 78:37]
    default_ar_data.arvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arprot <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arcache <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlock <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arburst <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arsize <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlen <= UInt<8>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.araddr <= UInt<32>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arid <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    io.axi_master.ar.out <= default_ar_data @[src/main/scala/icache.scala 79:24]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/icache.scala 81:17]
    when _T : @[src/main/scala/icache.scala 81:17]
      when io.cpu_if.req_valid : @[src/main/scala/icache.scala 83:33]
        when hit : @[src/main/scala/icache.scala 84:19]
          wire _io_cpu_if_resp_data_WIRE : UInt @[src/main/scala/icache.scala 86:50]
          _io_cpu_if_resp_data_WIRE is invalid @[src/main/scala/icache.scala 86:50]
          when UInt<1>("h1") : @[src/main/scala/icache.scala 86:50]
            _io_cpu_if_resp_data_WIRE <= req_index @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T = or(_io_cpu_if_resp_data_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T_1 = bits(_io_cpu_if_resp_data_T, 7, 0) @[src/main/scala/icache.scala 86:50]
            read mport io_cpu_if_resp_data_MPORT = cache_data[_io_cpu_if_resp_data_T_1], clock @[src/main/scala/icache.scala 86:50]
          io.cpu_if.resp_data <= io_cpu_if_resp_data_MPORT @[src/main/scala/icache.scala 86:32]
          io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 87:32]
        else :
          miss_pending <= UInt<1>("h1") @[src/main/scala/icache.scala 90:24]
          miss_addr <= io.cpu_if.req_addr @[src/main/scala/icache.scala 91:24]
          state <= UInt<2>("h1") @[src/main/scala/icache.scala 92:24]
      else :
        io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 96:30]
        io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 97:30]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/icache.scala 81:17]
      when _T_1 : @[src/main/scala/icache.scala 81:17]
        wire ar_req_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 103:29]
        ar_req_data.arid <= UInt<1>("h0") @[src/main/scala/icache.scala 104:27]
        ar_req_data.araddr <= miss_addr @[src/main/scala/icache.scala 105:27]
        ar_req_data.arlen <= UInt<1>("h0") @[src/main/scala/icache.scala 106:27]
        ar_req_data.arsize <= UInt<2>("h2") @[src/main/scala/icache.scala 107:27]
        ar_req_data.arburst <= UInt<1>("h1") @[src/main/scala/icache.scala 108:27]
        ar_req_data.arlock <= UInt<1>("h0") @[src/main/scala/icache.scala 109:27]
        ar_req_data.arcache <= UInt<1>("h0") @[src/main/scala/icache.scala 110:27]
        ar_req_data.arprot <= UInt<1>("h0") @[src/main/scala/icache.scala 111:27]
        ar_req_data.arvalid <= UInt<1>("h1") @[src/main/scala/icache.scala 112:27]
        io.axi_master.ar.out <= ar_req_data @[src/main/scala/icache.scala 114:28]
        when io.axi_master.ar.arready : @[src/main/scala/icache.scala 116:38]
          state <= UInt<2>("h2") @[src/main/scala/icache.scala 118:15]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/icache.scala 81:17]
        when _T_2 : @[src/main/scala/icache.scala 81:17]
          io.axi_master.r.rready <= UInt<1>("h1") @[src/main/scala/icache.scala 124:30]
          when io.axi_master.r.in.rvalid : @[src/main/scala/icache.scala 125:39]
            write mport MPORT = cache_tag[req_index], clock
            MPORT <= req_tag
            write mport MPORT_1 = cache_valid[req_index], clock
            MPORT_1 <= UInt<1>("h1")
            write mport MPORT_2 = cache_data[req_index], clock
            MPORT_2 <= io.axi_master.r.in.rdata
            io.cpu_if.resp_data <= io.axi_master.r.in.rdata @[src/main/scala/icache.scala 132:30]
            io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 133:30]
            miss_pending <= UInt<1>("h0") @[src/main/scala/icache.scala 136:22]
            state <= UInt<2>("h0") @[src/main/scala/icache.scala 137:22]
          else :
            io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 140:30]


  module MiniICache_1 :
    input clock : Clock
    input reset : Reset
    output io : { axi_master : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, cpu_if : { flip req_addr : UInt<32>, flip req_valid : UInt<1>, resp_data : UInt<32>, resp_valid : UInt<1>}} @[src/main/scala/icache.scala 7:14]

    io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 22:24]
    io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 23:24]
    io.axi_master.r.rready <= UInt<1>("h0") @[src/main/scala/icache.scala 24:26]
    io.axi_master.b.bready <= UInt<1>("h0") @[src/main/scala/icache.scala 25:26]
    wire default_aw_data : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>} @[src/main/scala/icache.scala 28:37]
    default_aw_data.awvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awprot <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awcache <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlock <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awburst <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awsize <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlen <= UInt<8>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awaddr <= UInt<32>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awid <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    wire default_w_data : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>} @[src/main/scala/icache.scala 29:37]
    default_w_data.wvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wlast <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wstrb <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wdata <= UInt<32>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wid <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    io.axi_master.aw.out <= default_aw_data @[src/main/scala/icache.scala 30:24]
    io.axi_master.w.out <= default_w_data @[src/main/scala/icache.scala 31:24]
    smem cache_tag : UInt<22> [256] @[src/main/scala/icache.scala 46:33]
    smem cache_valid : UInt<1> [256] @[src/main/scala/icache.scala 47:33]
    smem cache_data : UInt<32> [256] @[src/main/scala/icache.scala 48:33]
    node req_tag = bits(io.cpu_if.req_addr, 31, 10) @[src/main/scala/icache.scala 54:27]
    node req_index = bits(io.cpu_if.req_addr, 9, 2) @[src/main/scala/icache.scala 55:27]
    node req_offset = bits(io.cpu_if.req_addr, 1, 0) @[src/main/scala/icache.scala 56:27]
    wire _rd_tag_WIRE : UInt @[src/main/scala/icache.scala 61:33]
    _rd_tag_WIRE is invalid @[src/main/scala/icache.scala 61:33]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 61:33]
      _rd_tag_WIRE <= req_index @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T = or(_rd_tag_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T_1 = bits(_rd_tag_T, 7, 0) @[src/main/scala/icache.scala 61:33]
      read mport rd_tag = cache_tag[_rd_tag_T_1], clock @[src/main/scala/icache.scala 61:33]
    wire _rd_valid_WIRE : UInt @[src/main/scala/icache.scala 62:35]
    _rd_valid_WIRE is invalid @[src/main/scala/icache.scala 62:35]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 62:35]
      _rd_valid_WIRE <= req_index @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T = or(_rd_valid_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T_1 = bits(_rd_valid_T, 7, 0) @[src/main/scala/icache.scala 62:35]
      read mport rd_valid = cache_valid[_rd_valid_T_1], clock @[src/main/scala/icache.scala 62:35]
    node _hit_T = eq(rd_tag, req_tag) @[src/main/scala/icache.scala 63:39]
    node hit = and(rd_valid, _hit_T) @[src/main/scala/icache.scala 63:28]
    reg miss_pending : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/icache.scala 68:29]
    reg miss_addr : UInt<32>, clock with :
      reset => (UInt<1>("h0"), miss_addr) @[src/main/scala/icache.scala 69:25]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/icache.scala 75:22]
    wire default_ar_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 78:37]
    default_ar_data.arvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arprot <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arcache <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlock <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arburst <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arsize <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlen <= UInt<8>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.araddr <= UInt<32>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arid <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    io.axi_master.ar.out <= default_ar_data @[src/main/scala/icache.scala 79:24]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/icache.scala 81:17]
    when _T : @[src/main/scala/icache.scala 81:17]
      when io.cpu_if.req_valid : @[src/main/scala/icache.scala 83:33]
        when hit : @[src/main/scala/icache.scala 84:19]
          wire _io_cpu_if_resp_data_WIRE : UInt @[src/main/scala/icache.scala 86:50]
          _io_cpu_if_resp_data_WIRE is invalid @[src/main/scala/icache.scala 86:50]
          when UInt<1>("h1") : @[src/main/scala/icache.scala 86:50]
            _io_cpu_if_resp_data_WIRE <= req_index @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T = or(_io_cpu_if_resp_data_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T_1 = bits(_io_cpu_if_resp_data_T, 7, 0) @[src/main/scala/icache.scala 86:50]
            read mport io_cpu_if_resp_data_MPORT = cache_data[_io_cpu_if_resp_data_T_1], clock @[src/main/scala/icache.scala 86:50]
          io.cpu_if.resp_data <= io_cpu_if_resp_data_MPORT @[src/main/scala/icache.scala 86:32]
          io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 87:32]
        else :
          miss_pending <= UInt<1>("h1") @[src/main/scala/icache.scala 90:24]
          miss_addr <= io.cpu_if.req_addr @[src/main/scala/icache.scala 91:24]
          state <= UInt<2>("h1") @[src/main/scala/icache.scala 92:24]
      else :
        io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 96:30]
        io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 97:30]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/icache.scala 81:17]
      when _T_1 : @[src/main/scala/icache.scala 81:17]
        wire ar_req_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 103:29]
        ar_req_data.arid <= UInt<1>("h0") @[src/main/scala/icache.scala 104:27]
        ar_req_data.araddr <= miss_addr @[src/main/scala/icache.scala 105:27]
        ar_req_data.arlen <= UInt<1>("h0") @[src/main/scala/icache.scala 106:27]
        ar_req_data.arsize <= UInt<2>("h2") @[src/main/scala/icache.scala 107:27]
        ar_req_data.arburst <= UInt<1>("h1") @[src/main/scala/icache.scala 108:27]
        ar_req_data.arlock <= UInt<1>("h0") @[src/main/scala/icache.scala 109:27]
        ar_req_data.arcache <= UInt<1>("h0") @[src/main/scala/icache.scala 110:27]
        ar_req_data.arprot <= UInt<1>("h0") @[src/main/scala/icache.scala 111:27]
        ar_req_data.arvalid <= UInt<1>("h1") @[src/main/scala/icache.scala 112:27]
        io.axi_master.ar.out <= ar_req_data @[src/main/scala/icache.scala 114:28]
        when io.axi_master.ar.arready : @[src/main/scala/icache.scala 116:38]
          state <= UInt<2>("h2") @[src/main/scala/icache.scala 118:15]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/icache.scala 81:17]
        when _T_2 : @[src/main/scala/icache.scala 81:17]
          io.axi_master.r.rready <= UInt<1>("h1") @[src/main/scala/icache.scala 124:30]
          when io.axi_master.r.in.rvalid : @[src/main/scala/icache.scala 125:39]
            write mport MPORT = cache_tag[req_index], clock
            MPORT <= req_tag
            write mport MPORT_1 = cache_valid[req_index], clock
            MPORT_1 <= UInt<1>("h1")
            write mport MPORT_2 = cache_data[req_index], clock
            MPORT_2 <= io.axi_master.r.in.rdata
            io.cpu_if.resp_data <= io.axi_master.r.in.rdata @[src/main/scala/icache.scala 132:30]
            io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 133:30]
            miss_pending <= UInt<1>("h0") @[src/main/scala/icache.scala 136:22]
            state <= UInt<2>("h0") @[src/main/scala/icache.scala 137:22]
          else :
            io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 140:30]


  module MiniICache_2 :
    input clock : Clock
    input reset : Reset
    output io : { axi_master : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, cpu_if : { flip req_addr : UInt<32>, flip req_valid : UInt<1>, resp_data : UInt<32>, resp_valid : UInt<1>}} @[src/main/scala/icache.scala 7:14]

    io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 22:24]
    io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 23:24]
    io.axi_master.r.rready <= UInt<1>("h0") @[src/main/scala/icache.scala 24:26]
    io.axi_master.b.bready <= UInt<1>("h0") @[src/main/scala/icache.scala 25:26]
    wire default_aw_data : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>} @[src/main/scala/icache.scala 28:37]
    default_aw_data.awvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awprot <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awcache <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlock <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awburst <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awsize <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlen <= UInt<8>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awaddr <= UInt<32>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awid <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    wire default_w_data : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>} @[src/main/scala/icache.scala 29:37]
    default_w_data.wvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wlast <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wstrb <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wdata <= UInt<32>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wid <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    io.axi_master.aw.out <= default_aw_data @[src/main/scala/icache.scala 30:24]
    io.axi_master.w.out <= default_w_data @[src/main/scala/icache.scala 31:24]
    smem cache_tag : UInt<22> [256] @[src/main/scala/icache.scala 46:33]
    smem cache_valid : UInt<1> [256] @[src/main/scala/icache.scala 47:33]
    smem cache_data : UInt<32> [256] @[src/main/scala/icache.scala 48:33]
    node req_tag = bits(io.cpu_if.req_addr, 31, 10) @[src/main/scala/icache.scala 54:27]
    node req_index = bits(io.cpu_if.req_addr, 9, 2) @[src/main/scala/icache.scala 55:27]
    node req_offset = bits(io.cpu_if.req_addr, 1, 0) @[src/main/scala/icache.scala 56:27]
    wire _rd_tag_WIRE : UInt @[src/main/scala/icache.scala 61:33]
    _rd_tag_WIRE is invalid @[src/main/scala/icache.scala 61:33]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 61:33]
      _rd_tag_WIRE <= req_index @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T = or(_rd_tag_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T_1 = bits(_rd_tag_T, 7, 0) @[src/main/scala/icache.scala 61:33]
      read mport rd_tag = cache_tag[_rd_tag_T_1], clock @[src/main/scala/icache.scala 61:33]
    wire _rd_valid_WIRE : UInt @[src/main/scala/icache.scala 62:35]
    _rd_valid_WIRE is invalid @[src/main/scala/icache.scala 62:35]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 62:35]
      _rd_valid_WIRE <= req_index @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T = or(_rd_valid_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T_1 = bits(_rd_valid_T, 7, 0) @[src/main/scala/icache.scala 62:35]
      read mport rd_valid = cache_valid[_rd_valid_T_1], clock @[src/main/scala/icache.scala 62:35]
    node _hit_T = eq(rd_tag, req_tag) @[src/main/scala/icache.scala 63:39]
    node hit = and(rd_valid, _hit_T) @[src/main/scala/icache.scala 63:28]
    reg miss_pending : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/icache.scala 68:29]
    reg miss_addr : UInt<32>, clock with :
      reset => (UInt<1>("h0"), miss_addr) @[src/main/scala/icache.scala 69:25]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/icache.scala 75:22]
    wire default_ar_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 78:37]
    default_ar_data.arvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arprot <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arcache <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlock <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arburst <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arsize <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlen <= UInt<8>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.araddr <= UInt<32>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arid <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    io.axi_master.ar.out <= default_ar_data @[src/main/scala/icache.scala 79:24]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/icache.scala 81:17]
    when _T : @[src/main/scala/icache.scala 81:17]
      when io.cpu_if.req_valid : @[src/main/scala/icache.scala 83:33]
        when hit : @[src/main/scala/icache.scala 84:19]
          wire _io_cpu_if_resp_data_WIRE : UInt @[src/main/scala/icache.scala 86:50]
          _io_cpu_if_resp_data_WIRE is invalid @[src/main/scala/icache.scala 86:50]
          when UInt<1>("h1") : @[src/main/scala/icache.scala 86:50]
            _io_cpu_if_resp_data_WIRE <= req_index @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T = or(_io_cpu_if_resp_data_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T_1 = bits(_io_cpu_if_resp_data_T, 7, 0) @[src/main/scala/icache.scala 86:50]
            read mport io_cpu_if_resp_data_MPORT = cache_data[_io_cpu_if_resp_data_T_1], clock @[src/main/scala/icache.scala 86:50]
          io.cpu_if.resp_data <= io_cpu_if_resp_data_MPORT @[src/main/scala/icache.scala 86:32]
          io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 87:32]
        else :
          miss_pending <= UInt<1>("h1") @[src/main/scala/icache.scala 90:24]
          miss_addr <= io.cpu_if.req_addr @[src/main/scala/icache.scala 91:24]
          state <= UInt<2>("h1") @[src/main/scala/icache.scala 92:24]
      else :
        io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 96:30]
        io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 97:30]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/icache.scala 81:17]
      when _T_1 : @[src/main/scala/icache.scala 81:17]
        wire ar_req_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 103:29]
        ar_req_data.arid <= UInt<1>("h0") @[src/main/scala/icache.scala 104:27]
        ar_req_data.araddr <= miss_addr @[src/main/scala/icache.scala 105:27]
        ar_req_data.arlen <= UInt<1>("h0") @[src/main/scala/icache.scala 106:27]
        ar_req_data.arsize <= UInt<2>("h2") @[src/main/scala/icache.scala 107:27]
        ar_req_data.arburst <= UInt<1>("h1") @[src/main/scala/icache.scala 108:27]
        ar_req_data.arlock <= UInt<1>("h0") @[src/main/scala/icache.scala 109:27]
        ar_req_data.arcache <= UInt<1>("h0") @[src/main/scala/icache.scala 110:27]
        ar_req_data.arprot <= UInt<1>("h0") @[src/main/scala/icache.scala 111:27]
        ar_req_data.arvalid <= UInt<1>("h1") @[src/main/scala/icache.scala 112:27]
        io.axi_master.ar.out <= ar_req_data @[src/main/scala/icache.scala 114:28]
        when io.axi_master.ar.arready : @[src/main/scala/icache.scala 116:38]
          state <= UInt<2>("h2") @[src/main/scala/icache.scala 118:15]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/icache.scala 81:17]
        when _T_2 : @[src/main/scala/icache.scala 81:17]
          io.axi_master.r.rready <= UInt<1>("h1") @[src/main/scala/icache.scala 124:30]
          when io.axi_master.r.in.rvalid : @[src/main/scala/icache.scala 125:39]
            write mport MPORT = cache_tag[req_index], clock
            MPORT <= req_tag
            write mport MPORT_1 = cache_valid[req_index], clock
            MPORT_1 <= UInt<1>("h1")
            write mport MPORT_2 = cache_data[req_index], clock
            MPORT_2 <= io.axi_master.r.in.rdata
            io.cpu_if.resp_data <= io.axi_master.r.in.rdata @[src/main/scala/icache.scala 132:30]
            io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 133:30]
            miss_pending <= UInt<1>("h0") @[src/main/scala/icache.scala 136:22]
            state <= UInt<2>("h0") @[src/main/scala/icache.scala 137:22]
          else :
            io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 140:30]


  module MiniICache_3 :
    input clock : Clock
    input reset : Reset
    output io : { axi_master : { ar : { out : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>}, flip arready : UInt<1>}, aw : { out : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>}, flip awready : UInt<1>}, w : { out : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>}, flip wready : UInt<1>}, r : { flip in : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>}, rready : UInt<1>}, b : { flip in : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>}, bready : UInt<1>}}, cpu_if : { flip req_addr : UInt<32>, flip req_valid : UInt<1>, resp_data : UInt<32>, resp_valid : UInt<1>}} @[src/main/scala/icache.scala 7:14]

    io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 22:24]
    io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 23:24]
    io.axi_master.r.rready <= UInt<1>("h0") @[src/main/scala/icache.scala 24:26]
    io.axi_master.b.bready <= UInt<1>("h0") @[src/main/scala/icache.scala 25:26]
    wire default_aw_data : { awid : UInt<4>, awaddr : UInt<32>, awlen : UInt<8>, awsize : UInt<3>, awburst : UInt<2>, awlock : UInt<2>, awcache : UInt<4>, awprot : UInt<3>, awvalid : UInt<1>} @[src/main/scala/icache.scala 28:37]
    default_aw_data.awvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awprot <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awcache <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlock <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awburst <= UInt<2>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awsize <= UInt<3>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awlen <= UInt<8>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awaddr <= UInt<32>("h0") @[src/main/scala/icache.scala 28:37]
    default_aw_data.awid <= UInt<4>("h0") @[src/main/scala/icache.scala 28:37]
    wire default_w_data : { wid : UInt<4>, wdata : UInt<32>, wstrb : UInt<4>, wlast : UInt<1>, wvalid : UInt<1>} @[src/main/scala/icache.scala 29:37]
    default_w_data.wvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wlast <= UInt<1>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wstrb <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wdata <= UInt<32>("h0") @[src/main/scala/icache.scala 29:37]
    default_w_data.wid <= UInt<4>("h0") @[src/main/scala/icache.scala 29:37]
    io.axi_master.aw.out <= default_aw_data @[src/main/scala/icache.scala 30:24]
    io.axi_master.w.out <= default_w_data @[src/main/scala/icache.scala 31:24]
    smem cache_tag : UInt<22> [256] @[src/main/scala/icache.scala 46:33]
    smem cache_valid : UInt<1> [256] @[src/main/scala/icache.scala 47:33]
    smem cache_data : UInt<32> [256] @[src/main/scala/icache.scala 48:33]
    node req_tag = bits(io.cpu_if.req_addr, 31, 10) @[src/main/scala/icache.scala 54:27]
    node req_index = bits(io.cpu_if.req_addr, 9, 2) @[src/main/scala/icache.scala 55:27]
    node req_offset = bits(io.cpu_if.req_addr, 1, 0) @[src/main/scala/icache.scala 56:27]
    wire _rd_tag_WIRE : UInt @[src/main/scala/icache.scala 61:33]
    _rd_tag_WIRE is invalid @[src/main/scala/icache.scala 61:33]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 61:33]
      _rd_tag_WIRE <= req_index @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T = or(_rd_tag_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 61:33]
      node _rd_tag_T_1 = bits(_rd_tag_T, 7, 0) @[src/main/scala/icache.scala 61:33]
      read mport rd_tag = cache_tag[_rd_tag_T_1], clock @[src/main/scala/icache.scala 61:33]
    wire _rd_valid_WIRE : UInt @[src/main/scala/icache.scala 62:35]
    _rd_valid_WIRE is invalid @[src/main/scala/icache.scala 62:35]
    when io.cpu_if.req_valid : @[src/main/scala/icache.scala 62:35]
      _rd_valid_WIRE <= req_index @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T = or(_rd_valid_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 62:35]
      node _rd_valid_T_1 = bits(_rd_valid_T, 7, 0) @[src/main/scala/icache.scala 62:35]
      read mport rd_valid = cache_valid[_rd_valid_T_1], clock @[src/main/scala/icache.scala 62:35]
    node _hit_T = eq(rd_tag, req_tag) @[src/main/scala/icache.scala 63:39]
    node hit = and(rd_valid, _hit_T) @[src/main/scala/icache.scala 63:28]
    reg miss_pending : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/icache.scala 68:29]
    reg miss_addr : UInt<32>, clock with :
      reset => (UInt<1>("h0"), miss_addr) @[src/main/scala/icache.scala 69:25]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/icache.scala 75:22]
    wire default_ar_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 78:37]
    default_ar_data.arvalid <= UInt<1>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arprot <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arcache <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlock <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arburst <= UInt<2>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arsize <= UInt<3>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arlen <= UInt<8>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.araddr <= UInt<32>("h0") @[src/main/scala/icache.scala 78:37]
    default_ar_data.arid <= UInt<4>("h0") @[src/main/scala/icache.scala 78:37]
    io.axi_master.ar.out <= default_ar_data @[src/main/scala/icache.scala 79:24]
    node _T = eq(UInt<2>("h0"), state) @[src/main/scala/icache.scala 81:17]
    when _T : @[src/main/scala/icache.scala 81:17]
      when io.cpu_if.req_valid : @[src/main/scala/icache.scala 83:33]
        when hit : @[src/main/scala/icache.scala 84:19]
          wire _io_cpu_if_resp_data_WIRE : UInt @[src/main/scala/icache.scala 86:50]
          _io_cpu_if_resp_data_WIRE is invalid @[src/main/scala/icache.scala 86:50]
          when UInt<1>("h1") : @[src/main/scala/icache.scala 86:50]
            _io_cpu_if_resp_data_WIRE <= req_index @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T = or(_io_cpu_if_resp_data_WIRE, UInt<8>("h0")) @[src/main/scala/icache.scala 86:50]
            node _io_cpu_if_resp_data_T_1 = bits(_io_cpu_if_resp_data_T, 7, 0) @[src/main/scala/icache.scala 86:50]
            read mport io_cpu_if_resp_data_MPORT = cache_data[_io_cpu_if_resp_data_T_1], clock @[src/main/scala/icache.scala 86:50]
          io.cpu_if.resp_data <= io_cpu_if_resp_data_MPORT @[src/main/scala/icache.scala 86:32]
          io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 87:32]
        else :
          miss_pending <= UInt<1>("h1") @[src/main/scala/icache.scala 90:24]
          miss_addr <= io.cpu_if.req_addr @[src/main/scala/icache.scala 91:24]
          state <= UInt<2>("h1") @[src/main/scala/icache.scala 92:24]
      else :
        io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 96:30]
        io.cpu_if.resp_data <= UInt<1>("h0") @[src/main/scala/icache.scala 97:30]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[src/main/scala/icache.scala 81:17]
      when _T_1 : @[src/main/scala/icache.scala 81:17]
        wire ar_req_data : { arid : UInt<4>, araddr : UInt<32>, arlen : UInt<8>, arsize : UInt<3>, arburst : UInt<2>, arlock : UInt<2>, arcache : UInt<4>, arprot : UInt<3>, arvalid : UInt<1>} @[src/main/scala/icache.scala 103:29]
        ar_req_data.arid <= UInt<1>("h0") @[src/main/scala/icache.scala 104:27]
        ar_req_data.araddr <= miss_addr @[src/main/scala/icache.scala 105:27]
        ar_req_data.arlen <= UInt<1>("h0") @[src/main/scala/icache.scala 106:27]
        ar_req_data.arsize <= UInt<2>("h2") @[src/main/scala/icache.scala 107:27]
        ar_req_data.arburst <= UInt<1>("h1") @[src/main/scala/icache.scala 108:27]
        ar_req_data.arlock <= UInt<1>("h0") @[src/main/scala/icache.scala 109:27]
        ar_req_data.arcache <= UInt<1>("h0") @[src/main/scala/icache.scala 110:27]
        ar_req_data.arprot <= UInt<1>("h0") @[src/main/scala/icache.scala 111:27]
        ar_req_data.arvalid <= UInt<1>("h1") @[src/main/scala/icache.scala 112:27]
        io.axi_master.ar.out <= ar_req_data @[src/main/scala/icache.scala 114:28]
        when io.axi_master.ar.arready : @[src/main/scala/icache.scala 116:38]
          state <= UInt<2>("h2") @[src/main/scala/icache.scala 118:15]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[src/main/scala/icache.scala 81:17]
        when _T_2 : @[src/main/scala/icache.scala 81:17]
          io.axi_master.r.rready <= UInt<1>("h1") @[src/main/scala/icache.scala 124:30]
          when io.axi_master.r.in.rvalid : @[src/main/scala/icache.scala 125:39]
            write mport MPORT = cache_tag[req_index], clock
            MPORT <= req_tag
            write mport MPORT_1 = cache_valid[req_index], clock
            MPORT_1 <= UInt<1>("h1")
            write mport MPORT_2 = cache_data[req_index], clock
            MPORT_2 <= io.axi_master.r.in.rdata
            io.cpu_if.resp_data <= io.axi_master.r.in.rdata @[src/main/scala/icache.scala 132:30]
            io.cpu_if.resp_valid <= UInt<1>("h1") @[src/main/scala/icache.scala 133:30]
            miss_pending <= UInt<1>("h0") @[src/main/scala/icache.scala 136:22]
            state <= UInt<2>("h0") @[src/main/scala/icache.scala 137:22]
          else :
            io.cpu_if.resp_valid <= UInt<1>("h0") @[src/main/scala/icache.scala 140:30]


  extmodule DifftestInstrCommit :
    input clock : Clock
    input coreid : UInt<8>
    input index : UInt<8>
    input valid : UInt<1>
    input pc : UInt<64>
    input instr : UInt<32>
    input skip : UInt<1>
    input is_TLBFILL : UInt<1>
    input TLBFILL_index : UInt<5>
    input is_CNTinst : UInt<1>
    input timer_64_value : UInt<64>
    input wen : UInt<1>
    input wdest : UInt<8>
    input wdata : UInt<64>
    input csr_rstat : UInt<1>
    input csr_data : UInt<64>
    defname = DifftestInstrCommit

  extmodule DifftestExcpEvent :
    input clock : Clock
    input coreid : UInt<8>
    input excp_valid : UInt<1>
    input eret : UInt<1>
    input intrNo : UInt<11>
    input cause : UInt<6>
    input exceptionPC : UInt<64>
    input exceptionInst : UInt<32>
    defname = DifftestExcpEvent

  extmodule DifftestTrapEvent :
    input clock : Clock
    input coreid : UInt<8>
    input valid : UInt<1>
    input code : UInt<8>
    input pc : UInt<64>
    input cycleCnt : UInt<64>
    input instrCnt : UInt<64>
    defname = DifftestTrapEvent

  extmodule DifftestStoreEvent :
    input clock : Clock
    input coreid : UInt<8>
    input index : UInt<8>
    input valid : UInt<1>
    input storePAddr : UInt<64>
    input storeVAddr : UInt<64>
    input storeData : UInt<64>
    defname = DifftestStoreEvent

  extmodule DifftestLoadEvent :
    input clock : Clock
    input coreid : UInt<8>
    input index : UInt<8>
    input valid : UInt<1>
    input paddr : UInt<64>
    input vaddr : UInt<64>
    defname = DifftestLoadEvent

  extmodule DifftestCSRRegState :
    input clock : Clock
    input coreid : UInt<8>
    input crmd : UInt<32>
    input prmd : UInt<32>
    input euen : UInt<32>
    input ecfg : UInt<32>
    input estat : UInt<32>
    input era : UInt<64>
    input badv : UInt<64>
    input eentry : UInt<64>
    input tlbidx : UInt<32>
    input tlbehi : UInt<64>
    input tlbelo0 : UInt<32>
    input tlbelo1 : UInt<32>
    input asid : UInt<32>
    input pgdl : UInt<64>
    input pgdh : UInt<64>
    input save0 : UInt<64>
    input save1 : UInt<64>
    input save2 : UInt<64>
    input save3 : UInt<64>
    input tid : UInt<64>
    input tcfg : UInt<32>
    input tval : UInt<64>
    input ticlr : UInt<32>
    input llbctl : UInt<32>
    input tlbrentry : UInt<64>
    input dmw0 : UInt<32>
    input dmw1 : UInt<32>
    defname = DifftestCSRRegState

  extmodule DifftestGRegState :
    input clock : Clock
    input coreid : UInt<8>
    input gpr_0 : UInt<64>
    input gpr_1 : UInt<64>
    input gpr_2 : UInt<64>
    input gpr_3 : UInt<64>
    input gpr_4 : UInt<64>
    input gpr_5 : UInt<64>
    input gpr_6 : UInt<64>
    input gpr_7 : UInt<64>
    input gpr_8 : UInt<64>
    input gpr_9 : UInt<64>
    input gpr_10 : UInt<64>
    input gpr_11 : UInt<64>
    input gpr_12 : UInt<64>
    input gpr_13 : UInt<64>
    input gpr_14 : UInt<64>
    input gpr_15 : UInt<64>
    input gpr_16 : UInt<64>
    input gpr_17 : UInt<64>
    input gpr_18 : UInt<64>
    input gpr_19 : UInt<64>
    input gpr_20 : UInt<64>
    input gpr_21 : UInt<64>
    input gpr_22 : UInt<64>
    input gpr_23 : UInt<64>
    input gpr_24 : UInt<64>
    input gpr_25 : UInt<64>
    input gpr_26 : UInt<64>
    input gpr_27 : UInt<64>
    input gpr_28 : UInt<64>
    input gpr_29 : UInt<64>
    input gpr_30 : UInt<64>
    input gpr_31 : UInt<64>
    defname = DifftestGRegState

  module Difftest :
    input clock : Clock
    input reset : Reset
    output io : { flip inst_valid_diff : UInt<1>, flip cnt_inst_diff : UInt<1>, flip timer_64_diff : UInt<64>, flip inst_ld_en_diff : UInt<1>, flip ld_paddr_diff : UInt<64>, flip ld_vaddr_diff : UInt<64>, flip inst_st_en_diff : UInt<1>, flip st_paddr_diff : UInt<64>, flip st_vaddr_diff : UInt<64>, flip st_data_diff : UInt<64>, flip csr_rstat_en_diff : UInt<1>, flip csr_data_diff : UInt<64>, flip debug0_wb_rf_wen : UInt<1>, flip debug0_wb_rf_wnum : UInt<5>, flip debug0_wb_rf_wdata : UInt<64>, flip debug0_wb_pc : UInt<64>, flip debug0_wb_inst : UInt<32>, flip excp_flush : UInt<1>, flip ertn_flush : UInt<1>, flip ws_csr_ecode : UInt<6>, flip tlbfill_en : UInt<1>, flip rand_index : UInt<5>, flip csr_estat_diff_0 : UInt<32>, flip csr_crmd_diff_0 : UInt<32>, flip csr_prmd_diff_0 : UInt<32>, flip csr_ectl_diff_0 : UInt<32>, flip csr_era_diff_0 : UInt<64>, flip csr_badv_diff_0 : UInt<64>, flip csr_eentry_diff_0 : UInt<64>, flip csr_tlbidx_diff_0 : UInt<32>, flip csr_tlbehi_diff_0 : UInt<64>, flip csr_tlbelo0_diff_0 : UInt<32>, flip csr_tlbelo1_diff_0 : UInt<32>, flip csr_asid_diff_0 : UInt<32>, flip csr_pgdl_diff_0 : UInt<64>, flip csr_pgdh_diff_0 : UInt<64>, flip csr_save0_diff_0 : UInt<64>, flip csr_save1_diff_0 : UInt<64>, flip csr_save2_diff_0 : UInt<64>, flip csr_save3_diff_0 : UInt<64>, flip csr_tid_diff_0 : UInt<64>, flip csr_tcfg_diff_0 : UInt<32>, flip csr_tval_diff_0 : UInt<64>, flip csr_ticlr_diff_0 : UInt<32>, flip csr_llbctl_diff_0 : UInt<32>, flip csr_tlbrentry_diff_0 : UInt<64>, flip csr_dmw0_diff_0 : UInt<32>, flip csr_dmw1_diff_0 : UInt<32>, flip regs : UInt<64>[32]} @[src/main/scala/difftest/Difftest.scala 156:14]

    reg cmt_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 215:26]
    reg cmt_cnt_inst : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 216:29]
    reg cmt_timer_64 : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 217:29]
    reg cmt_inst_ld_en : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 218:31]
    reg cmt_ld_paddr : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 219:29]
    reg cmt_ld_vaddr : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 220:29]
    reg cmt_inst_st_en : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 221:31]
    reg cmt_st_paddr : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 222:29]
    reg cmt_st_vaddr : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 223:29]
    reg cmt_st_data : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 224:28]
    reg cmt_csr_rstat_en : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 225:33]
    reg cmt_csr_data : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 226:29]
    reg cmt_wen : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 228:24]
    reg cmt_wdest : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/difftest/Difftest.scala 229:26]
    reg cmt_wdata : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 230:26]
    reg cmt_pc : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 231:23]
    reg cmt_inst : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/difftest/Difftest.scala 232:25]
    reg cmt_excp_flush : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 234:31]
    reg cmt_ertn : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 235:25]
    reg cmt_csr_ecode : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[src/main/scala/difftest/Difftest.scala 236:30]
    reg cmt_tlbfill_en : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 237:31]
    reg cmt_rand_index : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[src/main/scala/difftest/Difftest.scala 238:31]
    reg trap : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 240:21]
    reg trap_code : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/difftest/Difftest.scala 241:26]
    reg cycleCnt : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 242:25]
    reg instrCnt : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[src/main/scala/difftest/Difftest.scala 243:25]
    node _T = eq(trap, UInt<1>("h0")) @[src/main/scala/difftest/Difftest.scala 279:10]
    when _T : @[src/main/scala/difftest/Difftest.scala 279:17]
      cmt_valid <= io.inst_valid_diff @[src/main/scala/difftest/Difftest.scala 280:17]
      cmt_cnt_inst <= io.cnt_inst_diff @[src/main/scala/difftest/Difftest.scala 281:20]
      cmt_timer_64 <= io.timer_64_diff @[src/main/scala/difftest/Difftest.scala 282:20]
      cmt_inst_ld_en <= io.inst_ld_en_diff @[src/main/scala/difftest/Difftest.scala 283:22]
      cmt_ld_paddr <= io.ld_paddr_diff @[src/main/scala/difftest/Difftest.scala 284:20]
      cmt_ld_vaddr <= io.ld_vaddr_diff @[src/main/scala/difftest/Difftest.scala 285:20]
      cmt_inst_st_en <= io.inst_st_en_diff @[src/main/scala/difftest/Difftest.scala 286:22]
      cmt_st_paddr <= io.st_paddr_diff @[src/main/scala/difftest/Difftest.scala 287:20]
      cmt_st_vaddr <= io.st_vaddr_diff @[src/main/scala/difftest/Difftest.scala 288:20]
      cmt_st_data <= io.st_data_diff @[src/main/scala/difftest/Difftest.scala 289:19]
      cmt_csr_rstat_en <= io.csr_rstat_en_diff @[src/main/scala/difftest/Difftest.scala 290:24]
      cmt_csr_data <= io.csr_data_diff @[src/main/scala/difftest/Difftest.scala 291:20]
      cmt_wen <= io.debug0_wb_rf_wen @[src/main/scala/difftest/Difftest.scala 293:15]
      node _cmt_wdest_T = cat(UInt<3>("h0"), io.debug0_wb_rf_wnum) @[src/main/scala/difftest/Difftest.scala 294:23]
      cmt_wdest <= _cmt_wdest_T @[src/main/scala/difftest/Difftest.scala 294:17]
      cmt_wdata <= io.debug0_wb_rf_wdata @[src/main/scala/difftest/Difftest.scala 295:17]
      cmt_pc <= io.debug0_wb_pc @[src/main/scala/difftest/Difftest.scala 296:14]
      cmt_inst <= io.debug0_wb_inst @[src/main/scala/difftest/Difftest.scala 297:16]
      cmt_excp_flush <= io.excp_flush @[src/main/scala/difftest/Difftest.scala 299:22]
      cmt_ertn <= io.ertn_flush @[src/main/scala/difftest/Difftest.scala 300:16]
      cmt_csr_ecode <= io.ws_csr_ecode @[src/main/scala/difftest/Difftest.scala 301:21]
      cmt_tlbfill_en <= io.tlbfill_en @[src/main/scala/difftest/Difftest.scala 302:22]
      cmt_rand_index <= io.rand_index @[src/main/scala/difftest/Difftest.scala 303:22]
      trap <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 305:12]
      node _trap_code_T = bits(io.regs[10], 7, 0) @[src/main/scala/difftest/Difftest.scala 306:31]
      trap_code <= _trap_code_T @[src/main/scala/difftest/Difftest.scala 306:17]
      node _cycleCnt_T = add(cycleCnt, UInt<1>("h1")) @[src/main/scala/difftest/Difftest.scala 307:28]
      node _cycleCnt_T_1 = tail(_cycleCnt_T, 1) @[src/main/scala/difftest/Difftest.scala 307:28]
      cycleCnt <= _cycleCnt_T_1 @[src/main/scala/difftest/Difftest.scala 307:16]
      node _instrCnt_T = add(instrCnt, io.inst_valid_diff) @[src/main/scala/difftest/Difftest.scala 308:28]
      node _instrCnt_T_1 = tail(_instrCnt_T, 1) @[src/main/scala/difftest/Difftest.scala 308:28]
      instrCnt <= _instrCnt_T_1 @[src/main/scala/difftest/Difftest.scala 308:16]
    inst difftestInstrCommit of DifftestInstrCommit @[src/main/scala/difftest/Difftest.scala 313:35]
    difftestInstrCommit.clock <= clock @[src/main/scala/difftest/Difftest.scala 315:32]
    difftestInstrCommit.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 316:33]
    difftestInstrCommit.index <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 317:32]
    difftestInstrCommit.valid <= cmt_valid @[src/main/scala/difftest/Difftest.scala 318:32]
    difftestInstrCommit.pc <= cmt_pc @[src/main/scala/difftest/Difftest.scala 319:29]
    difftestInstrCommit.instr <= cmt_inst @[src/main/scala/difftest/Difftest.scala 320:32]
    difftestInstrCommit.skip <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 321:31]
    difftestInstrCommit.is_TLBFILL <= cmt_tlbfill_en @[src/main/scala/difftest/Difftest.scala 322:37]
    difftestInstrCommit.TLBFILL_index <= cmt_rand_index @[src/main/scala/difftest/Difftest.scala 323:40]
    difftestInstrCommit.is_CNTinst <= cmt_cnt_inst @[src/main/scala/difftest/Difftest.scala 324:37]
    difftestInstrCommit.timer_64_value <= cmt_timer_64 @[src/main/scala/difftest/Difftest.scala 325:41]
    difftestInstrCommit.wen <= cmt_wen @[src/main/scala/difftest/Difftest.scala 326:30]
    difftestInstrCommit.wdest <= cmt_wdest @[src/main/scala/difftest/Difftest.scala 327:32]
    difftestInstrCommit.wdata <= cmt_wdata @[src/main/scala/difftest/Difftest.scala 328:32]
    difftestInstrCommit.csr_rstat <= cmt_csr_rstat_en @[src/main/scala/difftest/Difftest.scala 329:36]
    difftestInstrCommit.csr_data <= cmt_csr_data @[src/main/scala/difftest/Difftest.scala 330:35]
    inst difftestExcpEvent of DifftestExcpEvent @[src/main/scala/difftest/Difftest.scala 332:33]
    difftestExcpEvent.clock <= clock @[src/main/scala/difftest/Difftest.scala 333:30]
    difftestExcpEvent.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 334:31]
    difftestExcpEvent.excp_valid <= cmt_excp_flush @[src/main/scala/difftest/Difftest.scala 335:35]
    difftestExcpEvent.eret <= cmt_ertn @[src/main/scala/difftest/Difftest.scala 336:29]
    node _difftestExcpEvent_io_intrNo_T = bits(io.csr_estat_diff_0, 12, 2) @[src/main/scala/difftest/Difftest.scala 337:53]
    difftestExcpEvent.intrNo <= _difftestExcpEvent_io_intrNo_T @[src/main/scala/difftest/Difftest.scala 337:31]
    difftestExcpEvent.cause <= cmt_csr_ecode @[src/main/scala/difftest/Difftest.scala 338:30]
    difftestExcpEvent.exceptionPC <= cmt_pc @[src/main/scala/difftest/Difftest.scala 339:36]
    difftestExcpEvent.exceptionInst <= cmt_inst @[src/main/scala/difftest/Difftest.scala 340:38]
    inst difftestTrapEvent of DifftestTrapEvent @[src/main/scala/difftest/Difftest.scala 342:33]
    difftestTrapEvent.clock <= clock @[src/main/scala/difftest/Difftest.scala 343:30]
    difftestTrapEvent.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 344:31]
    difftestTrapEvent.valid <= trap @[src/main/scala/difftest/Difftest.scala 345:30]
    difftestTrapEvent.code <= trap_code @[src/main/scala/difftest/Difftest.scala 346:29]
    difftestTrapEvent.pc <= cmt_pc @[src/main/scala/difftest/Difftest.scala 347:27]
    difftestTrapEvent.cycleCnt <= cycleCnt @[src/main/scala/difftest/Difftest.scala 348:33]
    difftestTrapEvent.instrCnt <= instrCnt @[src/main/scala/difftest/Difftest.scala 349:33]
    inst difftestStoreEvent of DifftestStoreEvent @[src/main/scala/difftest/Difftest.scala 351:34]
    difftestStoreEvent.clock <= clock @[src/main/scala/difftest/Difftest.scala 352:31]
    difftestStoreEvent.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 353:32]
    difftestStoreEvent.index <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 354:31]
    difftestStoreEvent.valid <= cmt_inst_st_en @[src/main/scala/difftest/Difftest.scala 355:31]
    difftestStoreEvent.storePAddr <= cmt_st_paddr @[src/main/scala/difftest/Difftest.scala 356:36]
    difftestStoreEvent.storeVAddr <= cmt_st_vaddr @[src/main/scala/difftest/Difftest.scala 357:36]
    difftestStoreEvent.storeData <= cmt_st_data @[src/main/scala/difftest/Difftest.scala 358:35]
    inst difftestLoadEvent of DifftestLoadEvent @[src/main/scala/difftest/Difftest.scala 360:33]
    difftestLoadEvent.clock <= clock @[src/main/scala/difftest/Difftest.scala 361:30]
    difftestLoadEvent.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 362:31]
    difftestLoadEvent.index <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 363:30]
    difftestLoadEvent.valid <= cmt_inst_ld_en @[src/main/scala/difftest/Difftest.scala 364:30]
    difftestLoadEvent.paddr <= cmt_ld_paddr @[src/main/scala/difftest/Difftest.scala 365:30]
    difftestLoadEvent.vaddr <= cmt_ld_vaddr @[src/main/scala/difftest/Difftest.scala 366:30]
    inst difftestCSRRegState of DifftestCSRRegState @[src/main/scala/difftest/Difftest.scala 368:35]
    difftestCSRRegState.clock <= clock @[src/main/scala/difftest/Difftest.scala 369:32]
    difftestCSRRegState.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 370:33]
    difftestCSRRegState.crmd <= io.csr_crmd_diff_0 @[src/main/scala/difftest/Difftest.scala 371:31]
    difftestCSRRegState.prmd <= io.csr_prmd_diff_0 @[src/main/scala/difftest/Difftest.scala 372:31]
    difftestCSRRegState.euen <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 373:31]
    difftestCSRRegState.ecfg <= io.csr_ectl_diff_0 @[src/main/scala/difftest/Difftest.scala 374:31]
    difftestCSRRegState.estat <= io.csr_estat_diff_0 @[src/main/scala/difftest/Difftest.scala 375:32]
    difftestCSRRegState.era <= io.csr_era_diff_0 @[src/main/scala/difftest/Difftest.scala 376:30]
    difftestCSRRegState.badv <= io.csr_badv_diff_0 @[src/main/scala/difftest/Difftest.scala 377:31]
    difftestCSRRegState.eentry <= io.csr_eentry_diff_0 @[src/main/scala/difftest/Difftest.scala 378:33]
    difftestCSRRegState.tlbidx <= io.csr_tlbidx_diff_0 @[src/main/scala/difftest/Difftest.scala 379:33]
    difftestCSRRegState.tlbehi <= io.csr_tlbehi_diff_0 @[src/main/scala/difftest/Difftest.scala 380:33]
    difftestCSRRegState.tlbelo0 <= io.csr_tlbelo0_diff_0 @[src/main/scala/difftest/Difftest.scala 381:34]
    difftestCSRRegState.tlbelo1 <= io.csr_tlbelo1_diff_0 @[src/main/scala/difftest/Difftest.scala 382:34]
    difftestCSRRegState.asid <= io.csr_asid_diff_0 @[src/main/scala/difftest/Difftest.scala 383:31]
    difftestCSRRegState.pgdl <= io.csr_pgdl_diff_0 @[src/main/scala/difftest/Difftest.scala 384:31]
    difftestCSRRegState.pgdh <= io.csr_pgdh_diff_0 @[src/main/scala/difftest/Difftest.scala 385:31]
    difftestCSRRegState.save0 <= io.csr_save0_diff_0 @[src/main/scala/difftest/Difftest.scala 386:32]
    difftestCSRRegState.save1 <= io.csr_save1_diff_0 @[src/main/scala/difftest/Difftest.scala 387:32]
    difftestCSRRegState.save2 <= io.csr_save2_diff_0 @[src/main/scala/difftest/Difftest.scala 388:32]
    difftestCSRRegState.save3 <= io.csr_save3_diff_0 @[src/main/scala/difftest/Difftest.scala 389:32]
    difftestCSRRegState.tid <= io.csr_tid_diff_0 @[src/main/scala/difftest/Difftest.scala 390:30]
    difftestCSRRegState.tcfg <= io.csr_tcfg_diff_0 @[src/main/scala/difftest/Difftest.scala 391:31]
    difftestCSRRegState.tval <= io.csr_tval_diff_0 @[src/main/scala/difftest/Difftest.scala 392:31]
    difftestCSRRegState.ticlr <= io.csr_ticlr_diff_0 @[src/main/scala/difftest/Difftest.scala 393:32]
    difftestCSRRegState.llbctl <= io.csr_llbctl_diff_0 @[src/main/scala/difftest/Difftest.scala 394:33]
    difftestCSRRegState.tlbrentry <= io.csr_tlbrentry_diff_0 @[src/main/scala/difftest/Difftest.scala 395:36]
    difftestCSRRegState.dmw0 <= io.csr_dmw0_diff_0 @[src/main/scala/difftest/Difftest.scala 396:31]
    difftestCSRRegState.dmw1 <= io.csr_dmw1_diff_0 @[src/main/scala/difftest/Difftest.scala 397:31]
    inst difftestGRegState of DifftestGRegState @[src/main/scala/difftest/Difftest.scala 399:33]
    difftestGRegState.clock <= clock @[src/main/scala/difftest/Difftest.scala 400:30]
    difftestGRegState.coreid <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 401:31]
    difftestGRegState.gpr_0 <= UInt<1>("h0") @[src/main/scala/difftest/Difftest.scala 402:30]
    difftestGRegState.gpr_1 <= io.regs[1] @[src/main/scala/difftest/Difftest.scala 403:30]
    difftestGRegState.gpr_2 <= io.regs[2] @[src/main/scala/difftest/Difftest.scala 404:30]
    difftestGRegState.gpr_3 <= io.regs[3] @[src/main/scala/difftest/Difftest.scala 405:30]
    difftestGRegState.gpr_4 <= io.regs[4] @[src/main/scala/difftest/Difftest.scala 406:30]
    difftestGRegState.gpr_5 <= io.regs[5] @[src/main/scala/difftest/Difftest.scala 407:30]
    difftestGRegState.gpr_6 <= io.regs[6] @[src/main/scala/difftest/Difftest.scala 408:30]
    difftestGRegState.gpr_7 <= io.regs[7] @[src/main/scala/difftest/Difftest.scala 409:30]
    difftestGRegState.gpr_8 <= io.regs[8] @[src/main/scala/difftest/Difftest.scala 410:30]
    difftestGRegState.gpr_9 <= io.regs[9] @[src/main/scala/difftest/Difftest.scala 411:30]
    difftestGRegState.gpr_10 <= io.regs[10] @[src/main/scala/difftest/Difftest.scala 412:31]
    difftestGRegState.gpr_11 <= io.regs[11] @[src/main/scala/difftest/Difftest.scala 413:31]
    difftestGRegState.gpr_12 <= io.regs[12] @[src/main/scala/difftest/Difftest.scala 414:31]
    difftestGRegState.gpr_13 <= io.regs[13] @[src/main/scala/difftest/Difftest.scala 415:31]
    difftestGRegState.gpr_14 <= io.regs[14] @[src/main/scala/difftest/Difftest.scala 416:31]
    difftestGRegState.gpr_15 <= io.regs[15] @[src/main/scala/difftest/Difftest.scala 417:31]
    difftestGRegState.gpr_16 <= io.regs[16] @[src/main/scala/difftest/Difftest.scala 418:31]
    difftestGRegState.gpr_17 <= io.regs[17] @[src/main/scala/difftest/Difftest.scala 419:31]
    difftestGRegState.gpr_18 <= io.regs[18] @[src/main/scala/difftest/Difftest.scala 420:31]
    difftestGRegState.gpr_19 <= io.regs[19] @[src/main/scala/difftest/Difftest.scala 421:31]
    difftestGRegState.gpr_20 <= io.regs[20] @[src/main/scala/difftest/Difftest.scala 422:31]
    difftestGRegState.gpr_21 <= io.regs[21] @[src/main/scala/difftest/Difftest.scala 423:31]
    difftestGRegState.gpr_22 <= io.regs[22] @[src/main/scala/difftest/Difftest.scala 424:31]
    difftestGRegState.gpr_23 <= io.regs[23] @[src/main/scala/difftest/Difftest.scala 425:31]
    difftestGRegState.gpr_24 <= io.regs[24] @[src/main/scala/difftest/Difftest.scala 426:31]
    difftestGRegState.gpr_25 <= io.regs[25] @[src/main/scala/difftest/Difftest.scala 427:31]
    difftestGRegState.gpr_26 <= io.regs[26] @[src/main/scala/difftest/Difftest.scala 428:31]
    difftestGRegState.gpr_27 <= io.regs[27] @[src/main/scala/difftest/Difftest.scala 429:31]
    difftestGRegState.gpr_28 <= io.regs[28] @[src/main/scala/difftest/Difftest.scala 430:31]
    difftestGRegState.gpr_29 <= io.regs[29] @[src/main/scala/difftest/Difftest.scala 431:31]
    difftestGRegState.gpr_30 <= io.regs[30] @[src/main/scala/difftest/Difftest.scala 432:31]
    difftestGRegState.gpr_31 <= io.regs[31] @[src/main/scala/difftest/Difftest.scala 433:31]

  module core_top :
    input aclk : Clock @[src/main/scala/myCPU_top.scala 8:16]
    input aresetn : UInt<1> @[src/main/scala/myCPU_top.scala 9:19]
    input intrpt : UInt<8> @[src/main/scala/myCPU_top.scala 12:19]
    output arid : UInt<4> @[src/main/scala/myCPU_top.scala 15:19]
    output araddr : UInt<32> @[src/main/scala/myCPU_top.scala 16:19]
    output arlen : UInt<8> @[src/main/scala/myCPU_top.scala 17:19]
    output arsize : UInt<3> @[src/main/scala/myCPU_top.scala 18:19]
    output arburst : UInt<2> @[src/main/scala/myCPU_top.scala 19:19]
    output arlock : UInt<2> @[src/main/scala/myCPU_top.scala 20:19]
    output arcache : UInt<4> @[src/main/scala/myCPU_top.scala 21:19]
    output arprot : UInt<3> @[src/main/scala/myCPU_top.scala 22:19]
    output arvalid : UInt<1> @[src/main/scala/myCPU_top.scala 23:19]
    input arready : UInt<1> @[src/main/scala/myCPU_top.scala 24:19]
    input rid : UInt<4> @[src/main/scala/myCPU_top.scala 27:19]
    input rdata : UInt<32> @[src/main/scala/myCPU_top.scala 28:19]
    input rresp : UInt<2> @[src/main/scala/myCPU_top.scala 29:19]
    input rlast : UInt<1> @[src/main/scala/myCPU_top.scala 30:19]
    input rvalid : UInt<1> @[src/main/scala/myCPU_top.scala 31:19]
    output rready : UInt<1> @[src/main/scala/myCPU_top.scala 32:19]
    output awid : UInt<4> @[src/main/scala/myCPU_top.scala 35:19]
    output awaddr : UInt<32> @[src/main/scala/myCPU_top.scala 36:19]
    output awlen : UInt<8> @[src/main/scala/myCPU_top.scala 37:19]
    output awsize : UInt<3> @[src/main/scala/myCPU_top.scala 38:19]
    output awburst : UInt<2> @[src/main/scala/myCPU_top.scala 39:19]
    output awlock : UInt<2> @[src/main/scala/myCPU_top.scala 40:19]
    output awcache : UInt<4> @[src/main/scala/myCPU_top.scala 41:19]
    output awprot : UInt<3> @[src/main/scala/myCPU_top.scala 42:19]
    output awvalid : UInt<1> @[src/main/scala/myCPU_top.scala 43:19]
    input awready : UInt<1> @[src/main/scala/myCPU_top.scala 44:19]
    output wid : UInt<4> @[src/main/scala/myCPU_top.scala 47:19]
    output wdata : UInt<32> @[src/main/scala/myCPU_top.scala 48:19]
    output wstrb : UInt<4> @[src/main/scala/myCPU_top.scala 49:19]
    output wlast : UInt<1> @[src/main/scala/myCPU_top.scala 50:19]
    output wvalid : UInt<1> @[src/main/scala/myCPU_top.scala 51:19]
    input wready : UInt<1> @[src/main/scala/myCPU_top.scala 52:19]
    input bid : UInt<4> @[src/main/scala/myCPU_top.scala 55:19]
    input bresp : UInt<2> @[src/main/scala/myCPU_top.scala 56:19]
    input bvalid : UInt<1> @[src/main/scala/myCPU_top.scala 57:19]
    output bready : UInt<1> @[src/main/scala/myCPU_top.scala 58:19]
    input break_point : UInt<1> @[src/main/scala/myCPU_top.scala 60:34]
    input infor_flag : UInt<1> @[src/main/scala/myCPU_top.scala 61:34]
    input reg_num : UInt<5> @[src/main/scala/myCPU_top.scala 62:34]
    output ws_valid : UInt<1> @[src/main/scala/myCPU_top.scala 63:34]
    output rf_rdata : UInt<32> @[src/main/scala/myCPU_top.scala 64:34]
    output debug0_wb_pc : UInt<32> @[src/main/scala/myCPU_top.scala 66:30]
    output debug0_wb_rf_wen : UInt<1> @[src/main/scala/myCPU_top.scala 67:30]
    output debug0_wb_rf_wnum : UInt<5> @[src/main/scala/myCPU_top.scala 68:30]
    output debug0_wb_rf_wdata : UInt<32> @[src/main/scala/myCPU_top.scala 69:30]
    output debug0_wb_inst : UInt<32> @[src/main/scala/myCPU_top.scala 70:30]

    debug0_wb_pc <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 81:16]
    debug0_wb_rf_wen <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 82:20]
    debug0_wb_rf_wnum <= UInt<5>("h0") @[src/main/scala/myCPU_top.scala 83:21]
    debug0_wb_rf_wdata <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 84:22]
    debug0_wb_inst <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 85:18]
    ws_valid <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 86:12]
    rf_rdata <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 87:12]
    inst axi_crossbar of AXI3Crossbar4to1 @[src/main/scala/myCPU_top.scala 95:28]
    axi_crossbar.clock <= aclk
    axi_crossbar.reset <= aresetn
    inst icache of MiniICache @[src/main/scala/myCPU_top.scala 97:28]
    icache.clock <= aclk
    icache.reset <= aresetn
    inst dcache of MiniICache_1 @[src/main/scala/myCPU_top.scala 101:28]
    dcache.clock <= aclk
    dcache.reset <= aresetn
    inst uncache1 of MiniICache_2 @[src/main/scala/myCPU_top.scala 102:28]
    uncache1.clock <= aclk
    uncache1.reset <= aresetn
    inst uncache2 of MiniICache_3 @[src/main/scala/myCPU_top.scala 103:28]
    uncache2.clock <= aclk
    uncache2.reset <= aresetn
    icache.io.cpu_if.req_addr <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 109:30]
    icache.io.cpu_if.req_valid <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 110:30]
    dcache.io.cpu_if.req_addr <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 112:30]
    dcache.io.cpu_if.req_valid <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 113:30]
    uncache1.io.cpu_if.req_addr <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 115:32]
    uncache1.io.cpu_if.req_valid <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 116:32]
    uncache2.io.cpu_if.req_addr <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 118:32]
    uncache2.io.cpu_if.req_valid <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 119:32]
    axi_crossbar.io.in_icache <= icache.io.axi_master @[src/main/scala/myCPU_top.scala 126:31]
    axi_crossbar.io.in_dcache <= dcache.io.axi_master @[src/main/scala/myCPU_top.scala 127:31]
    axi_crossbar.io.in_uncache1 <= uncache1.io.axi_master @[src/main/scala/myCPU_top.scala 128:31]
    axi_crossbar.io.in_uncache2 <= uncache2.io.axi_master @[src/main/scala/myCPU_top.scala 129:31]
    arid <= axi_crossbar.io.out.ar.out.arid @[src/main/scala/myCPU_top.scala 133:11]
    araddr <= axi_crossbar.io.out.ar.out.araddr @[src/main/scala/myCPU_top.scala 134:11]
    arlen <= axi_crossbar.io.out.ar.out.arlen @[src/main/scala/myCPU_top.scala 135:11]
    arsize <= axi_crossbar.io.out.ar.out.arsize @[src/main/scala/myCPU_top.scala 136:11]
    arburst <= axi_crossbar.io.out.ar.out.arburst @[src/main/scala/myCPU_top.scala 137:11]
    arlock <= axi_crossbar.io.out.ar.out.arlock @[src/main/scala/myCPU_top.scala 138:11]
    arcache <= axi_crossbar.io.out.ar.out.arcache @[src/main/scala/myCPU_top.scala 139:11]
    arprot <= axi_crossbar.io.out.ar.out.arprot @[src/main/scala/myCPU_top.scala 140:11]
    arvalid <= axi_crossbar.io.out.ar.out.arvalid @[src/main/scala/myCPU_top.scala 141:11]
    axi_crossbar.io.out.ar.arready <= arready @[src/main/scala/myCPU_top.scala 142:34]
    wire r_data : { rid : UInt<4>, rdata : UInt<32>, rresp : UInt<2>, rlast : UInt<1>, rvalid : UInt<1>} @[src/main/scala/myCPU_top.scala 145:20]
    r_data.rid <= rid @[src/main/scala/myCPU_top.scala 146:17]
    r_data.rdata <= rdata @[src/main/scala/myCPU_top.scala 147:17]
    r_data.rresp <= rresp @[src/main/scala/myCPU_top.scala 148:17]
    r_data.rlast <= rlast @[src/main/scala/myCPU_top.scala 149:17]
    r_data.rvalid <= rvalid @[src/main/scala/myCPU_top.scala 150:17]
    axi_crossbar.io.out.r.in.rvalid <= r_data.rvalid @[src/main/scala/myCPU_top.scala 151:28]
    axi_crossbar.io.out.r.in.rlast <= r_data.rlast @[src/main/scala/myCPU_top.scala 151:28]
    axi_crossbar.io.out.r.in.rresp <= r_data.rresp @[src/main/scala/myCPU_top.scala 151:28]
    axi_crossbar.io.out.r.in.rdata <= r_data.rdata @[src/main/scala/myCPU_top.scala 151:28]
    axi_crossbar.io.out.r.in.rid <= r_data.rid @[src/main/scala/myCPU_top.scala 151:28]
    rready <= axi_crossbar.io.out.r.rready @[src/main/scala/myCPU_top.scala 152:10]
    awid <= axi_crossbar.io.out.aw.out.awid @[src/main/scala/myCPU_top.scala 155:11]
    awaddr <= axi_crossbar.io.out.aw.out.awaddr @[src/main/scala/myCPU_top.scala 156:11]
    awlen <= axi_crossbar.io.out.aw.out.awlen @[src/main/scala/myCPU_top.scala 157:11]
    awsize <= axi_crossbar.io.out.aw.out.awsize @[src/main/scala/myCPU_top.scala 158:11]
    awburst <= axi_crossbar.io.out.aw.out.awburst @[src/main/scala/myCPU_top.scala 159:11]
    awlock <= axi_crossbar.io.out.aw.out.awlock @[src/main/scala/myCPU_top.scala 160:11]
    awcache <= axi_crossbar.io.out.aw.out.awcache @[src/main/scala/myCPU_top.scala 161:11]
    awprot <= axi_crossbar.io.out.aw.out.awprot @[src/main/scala/myCPU_top.scala 162:11]
    awvalid <= axi_crossbar.io.out.aw.out.awvalid @[src/main/scala/myCPU_top.scala 163:11]
    axi_crossbar.io.out.aw.awready <= awready @[src/main/scala/myCPU_top.scala 164:34]
    wid <= axi_crossbar.io.out.w.out.wid @[src/main/scala/myCPU_top.scala 167:11]
    wdata <= axi_crossbar.io.out.w.out.wdata @[src/main/scala/myCPU_top.scala 168:11]
    wstrb <= axi_crossbar.io.out.w.out.wstrb @[src/main/scala/myCPU_top.scala 169:11]
    wlast <= axi_crossbar.io.out.w.out.wlast @[src/main/scala/myCPU_top.scala 170:11]
    wvalid <= axi_crossbar.io.out.w.out.wvalid @[src/main/scala/myCPU_top.scala 171:11]
    axi_crossbar.io.out.w.wready <= wready @[src/main/scala/myCPU_top.scala 172:32]
    wire b_data : { bid : UInt<4>, bresp : UInt<2>, bvalid : UInt<1>} @[src/main/scala/myCPU_top.scala 175:20]
    b_data.bid <= bid @[src/main/scala/myCPU_top.scala 176:17]
    b_data.bresp <= bresp @[src/main/scala/myCPU_top.scala 177:17]
    b_data.bvalid <= bvalid @[src/main/scala/myCPU_top.scala 178:17]
    axi_crossbar.io.out.b.in.bvalid <= b_data.bvalid @[src/main/scala/myCPU_top.scala 179:28]
    axi_crossbar.io.out.b.in.bresp <= b_data.bresp @[src/main/scala/myCPU_top.scala 179:28]
    axi_crossbar.io.out.b.in.bid <= b_data.bid @[src/main/scala/myCPU_top.scala 179:28]
    bready <= axi_crossbar.io.out.b.bready @[src/main/scala/myCPU_top.scala 180:10]
    inst difftest of Difftest @[src/main/scala/myCPU_top.scala 189:24]
    difftest.clock <= aclk
    difftest.reset <= aresetn
    difftest.io.inst_valid_diff <= UInt<1>("h1") @[src/main/scala/myCPU_top.scala 191:31]
    difftest.io.cnt_inst_diff <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 192:29]
    difftest.io.timer_64_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 193:29]
    difftest.io.inst_ld_en_diff <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 194:31]
    difftest.io.ld_paddr_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 195:29]
    difftest.io.ld_vaddr_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 196:29]
    difftest.io.inst_st_en_diff <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 197:31]
    difftest.io.st_paddr_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 198:29]
    difftest.io.st_vaddr_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 199:29]
    difftest.io.st_data_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 200:28]
    difftest.io.csr_rstat_en_diff <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 201:33]
    difftest.io.csr_data_diff <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 202:29]
    difftest.io.debug0_wb_rf_wen <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 204:32]
    difftest.io.debug0_wb_rf_wnum <= UInt<5>("h0") @[src/main/scala/myCPU_top.scala 205:33]
    difftest.io.debug0_wb_rf_wdata <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 206:34]
    difftest.io.debug0_wb_pc <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 207:28]
    difftest.io.debug0_wb_inst <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 208:30]
    difftest.io.excp_flush <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 210:26]
    difftest.io.ertn_flush <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 211:26]
    difftest.io.ws_csr_ecode <= UInt<6>("h0") @[src/main/scala/myCPU_top.scala 212:28]
    difftest.io.tlbfill_en <= UInt<1>("h0") @[src/main/scala/myCPU_top.scala 213:26]
    difftest.io.rand_index <= UInt<5>("h0") @[src/main/scala/myCPU_top.scala 214:26]
    difftest.io.csr_estat_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 216:32]
    difftest.io.csr_crmd_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 217:31]
    difftest.io.csr_prmd_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 218:31]
    difftest.io.csr_ectl_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 219:31]
    difftest.io.csr_era_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 220:30]
    difftest.io.csr_badv_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 221:31]
    difftest.io.csr_eentry_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 222:33]
    difftest.io.csr_tlbidx_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 223:33]
    difftest.io.csr_tlbehi_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 224:33]
    difftest.io.csr_tlbelo0_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 225:34]
    difftest.io.csr_tlbelo1_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 226:34]
    difftest.io.csr_asid_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 227:31]
    difftest.io.csr_pgdl_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 228:31]
    difftest.io.csr_pgdh_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 229:31]
    difftest.io.csr_save0_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 230:32]
    difftest.io.csr_save1_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 231:32]
    difftest.io.csr_save2_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 232:32]
    difftest.io.csr_save3_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 233:32]
    difftest.io.csr_tid_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 234:30]
    difftest.io.csr_tcfg_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 235:31]
    difftest.io.csr_tval_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 236:31]
    difftest.io.csr_ticlr_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 237:32]
    difftest.io.csr_llbctl_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 238:33]
    difftest.io.csr_tlbrentry_diff_0 <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 239:36]
    difftest.io.csr_dmw0_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 240:31]
    difftest.io.csr_dmw1_diff_0 <= UInt<32>("h0") @[src/main/scala/myCPU_top.scala 241:31]
    difftest.io.regs[0] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[1] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[2] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[3] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[4] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[5] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[6] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[7] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[8] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[9] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[10] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[11] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[12] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[13] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[14] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[15] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[16] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[17] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[18] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[19] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[20] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[21] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[22] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[23] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[24] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[25] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[26] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[27] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[28] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[29] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[30] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]
    difftest.io.regs[31] <= UInt<64>("h0") @[src/main/scala/myCPU_top.scala 244:25]

