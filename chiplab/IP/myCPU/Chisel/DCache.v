module DCache(
  input         clock,
  input         reset,
  output        io_loadReq_ready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_loadReq_valid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_loadReq_bits_lqIdx, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [31:0] io_loadReq_bits_paddr, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_loadReq_bits_cacheable, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_loadReq_bits_lsuOp, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_loadResp_valid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_loadResp_bits_lqIdx, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [31:0] io_loadResp_bits_data, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_storeReq_ready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_storeReq_valid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [31:0] io_storeReq_bits_paddr, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [31:0] io_storeReq_bits_data, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_storeReq_bits_lsuOp, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_storeReq_bits_sqIdx, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_storeAck_valid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_storeAck_bits_sqIdx, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_axi_ar_data_arid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [31:0] io_axi_ar_data_araddr, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [7:0]  io_axi_ar_data_arlen, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [2:0]  io_axi_ar_data_arsize, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [1:0]  io_axi_ar_data_arburst, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_ar_data_arvalid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_ar_arready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_axi_aw_data_awid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [31:0] io_axi_aw_data_awaddr, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [7:0]  io_axi_aw_data_awlen, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [2:0]  io_axi_aw_data_awsize, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [1:0]  io_axi_aw_data_awburst, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_aw_data_awvalid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_aw_awready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_axi_w_data_wid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [31:0] io_axi_w_data_wdata, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output [3:0]  io_axi_w_data_wstrb, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_w_data_wlast, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_w_data_wvalid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_w_wready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_axi_r_data_rid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [31:0] io_axi_r_data_rdata, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_r_data_rlast, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_r_data_rvalid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_r_rready, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input  [3:0]  io_axi_b_data_bid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  input         io_axi_b_data_bvalid, // @[src/main/scala/memory/dcache/DCache.scala 18:14]
  output        io_axi_b_bready // @[src/main/scala/memory/dcache/DCache.scala 18:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [511:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [511:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [511:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [511:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [511:0] _RAND_38;
  reg [511:0] _RAND_39;
  reg [511:0] _RAND_40;
  reg [511:0] _RAND_41;
  reg [511:0] _RAND_42;
  reg [31:0] _RAND_43;
`endif // RANDOMIZE_REG_INIT
  wire  array_clock; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_reset; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [7:0] array_io_read_idx; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_0_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [17:0] array_io_read_resp_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [511:0] array_io_read_resp_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_1_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [17:0] array_io_read_resp_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [511:0] array_io_read_resp_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_2_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [17:0] array_io_read_resp_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [511:0] array_io_read_resp_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_3_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_resp_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [17:0] array_io_read_resp_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [511:0] array_io_read_resp_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_read_validOut; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_write_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [7:0] array_io_write_idx; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [1:0] array_io_write_way; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [17:0] array_io_write_tag; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_write_dirty; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [511:0] array_io_write_data; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_write_wen; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  array_io_metaWrite_valid; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [7:0] array_io_metaWrite_idx; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire [1:0] array_io_metaWrite_way; // @[src/main/scala/memory/dcache/DCache.scala 59:24]
  wire  replacer_clock; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire  replacer_reset; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire  replacer_io_touch_valid; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire [7:0] replacer_io_touch_idx; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire [1:0] replacer_io_touch_way; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire  replacer_io_victim_req; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire [7:0] replacer_io_victim_idx; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire [1:0] replacer_io_victim_resp; // @[src/main/scala/memory/dcache/DCache.scala 60:24]
  wire  mshr_clock; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_reset; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_req_ready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_req_valid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [2:0] mshr_io_req_bits_reqType; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_req_bits_paddr; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_req_bits_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_req_bits_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_req_bits_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_req_bits_storeData; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [1:0] mshr_io_req_bits_victimWay; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_req_bits_victimDirty; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [17:0] mshr_io_req_bits_victimTag; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [511:0] mshr_io_req_bits_victimData; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_ar_data_arid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_axi_ar_data_araddr; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [7:0] mshr_io_axi_ar_data_arlen; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [2:0] mshr_io_axi_ar_data_arsize; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [1:0] mshr_io_axi_ar_data_arburst; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_ar_data_arvalid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_ar_arready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_aw_data_awid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_axi_aw_data_awaddr; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [7:0] mshr_io_axi_aw_data_awlen; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [2:0] mshr_io_axi_aw_data_awsize; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [1:0] mshr_io_axi_aw_data_awburst; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_aw_data_awvalid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_aw_awready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_w_data_wid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_axi_w_data_wdata; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_w_data_wstrb; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_w_data_wlast; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_w_data_wvalid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_w_wready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_r_data_rid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_r_data_rvalid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_r_rready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_axi_b_data_bid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_b_data_bvalid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_axi_b_bready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_loadResp_ready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_loadResp_valid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_loadResp_bits_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [31:0] mshr_io_loadResp_bits_data; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_storeAck_ready; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_storeAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [3:0] mshr_io_storeAck_bits_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_arrayWrite_valid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [7:0] mshr_io_arrayWrite_idx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [1:0] mshr_io_arrayWrite_way; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [17:0] mshr_io_arrayWrite_tag; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_arrayWrite_dirty; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [511:0] mshr_io_arrayWrite_data; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_arrayWrite_wen; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_replacerTouch_valid; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [7:0] mshr_io_replacerTouch_idx; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire [1:0] mshr_io_replacerTouch_way; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  wire  mshr_io_mshrWriting; // @[src/main/scala/memory/dcache/DCache.scala 61:24]
  reg [7:0] storeWaitCnt; // @[src/main/scala/memory/dcache/DCache.scala 66:29]
  wire  storeStarving = storeWaitCnt >= 8'h8; // @[src/main/scala/memory/dcache/DCache.scala 67:62]
  wire  _T = ~io_loadReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 69:29]
  wire  _T_3 = ~storeStarving; // @[src/main/scala/memory/dcache/DCache.scala 71:55]
  wire [7:0] _storeWaitCnt_T_1 = storeWaitCnt + 8'h1; // @[src/main/scala/memory/dcache/DCache.scala 72:34]
  wire  loadSelected = io_loadReq_valid & (~io_storeReq_valid | _T_3); // @[src/main/scala/memory/dcache/DCache.scala 78:40]
  wire  storeSelected = io_storeReq_valid & (_T | storeStarving); // @[src/main/scala/memory/dcache/DCache.scala 79:41]
  reg  s1_valid; // @[src/main/scala/memory/dcache/DCache.scala 86:30]
  reg [31:0] s1_paddr; // @[src/main/scala/memory/dcache/DCache.scala 87:26]
  reg  s1_isLoad; // @[src/main/scala/memory/dcache/DCache.scala 88:26]
  reg [3:0] s1_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 89:26]
  reg [3:0] s1_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 90:26]
  reg [3:0] s1_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 92:26]
  reg  s1_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 93:26]
  reg [31:0] s1_storeData; // @[src/main/scala/memory/dcache/DCache.scala 94:26]
  reg  s1_arrayData_ways_0_valid; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [17:0] s1_arrayData_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [511:0] s1_arrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_1_valid; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [17:0] s1_arrayData_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [511:0] s1_arrayData_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_2_valid; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [17:0] s1_arrayData_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [511:0] s1_arrayData_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_3_valid; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s1_arrayData_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [17:0] s1_arrayData_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg [511:0] s1_arrayData_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 95:26]
  reg  s2_valid; // @[src/main/scala/memory/dcache/DCache.scala 98:30]
  reg [31:0] s2_paddr; // @[src/main/scala/memory/dcache/DCache.scala 99:26]
  reg  s2_isLoad; // @[src/main/scala/memory/dcache/DCache.scala 100:26]
  reg [3:0] s2_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 101:26]
  reg [3:0] s2_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 102:26]
  reg [3:0] s2_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 104:26]
  reg  s2_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 105:26]
  reg [31:0] s2_storeData; // @[src/main/scala/memory/dcache/DCache.scala 106:26]
  reg  s2_hit; // @[src/main/scala/memory/dcache/DCache.scala 107:26]
  reg [1:0] s2_hitWay; // @[src/main/scala/memory/dcache/DCache.scala 108:26]
  reg [1:0] s2_victimWay; // @[src/main/scala/memory/dcache/DCache.scala 109:26]
  reg  s2_victimDirty; // @[src/main/scala/memory/dcache/DCache.scala 110:27]
  reg [17:0] s2_victimTag; // @[src/main/scala/memory/dcache/DCache.scala 111:26]
  reg [511:0] s2_victimData; // @[src/main/scala/memory/dcache/DCache.scala 112:26]
  reg [511:0] s2_arrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 113:26]
  reg [511:0] s2_arrayData_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 113:26]
  reg [511:0] s2_arrayData_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 113:26]
  reg [511:0] s2_arrayData_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 113:26]
  reg  s2_isUncache; // @[src/main/scala/memory/dcache/DCache.scala 114:26]
  wire  _s2_flush_T = s2_valid & s2_isLoad; // @[src/main/scala/memory/dcache/DCache.scala 124:27]
  wire  _s0_ready_T = ~s1_valid; // @[src/main/scala/memory/dcache/DCache.scala 134:15]
  wire  pipeLoadHitValid = _s2_flush_T & s2_hit; // @[src/main/scala/memory/dcache/DCache.scala 250:48]
  wire  _pipeStoreHitValid_T_3 = ~s2_isUncache; // @[src/main/scala/memory/dcache/DCache.scala 260:63]
  wire  pipeStoreHitValid = s2_valid & ~s2_isLoad & s2_hit & ~s2_isUncache; // @[src/main/scala/memory/dcache/DCache.scala 260:60]
  wire  _s2_ready_T = pipeLoadHitValid | pipeStoreHitValid; // @[src/main/scala/memory/dcache/DCache.scala 337:30]
  wire  s2_miss = s2_valid & s2_cacheable & ~s2_hit & _pipeStoreHitValid_T_3; // @[src/main/scala/memory/dcache/DCache.scala 228:55]
  wire  s2_needMshr = s2_valid & (s2_miss | s2_isUncache); // @[src/main/scala/memory/dcache/DCache.scala 280:30]
  wire  _s2_mshrAccepted_T = mshr_io_req_ready & mshr_io_req_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  s2_mshrAccepted = s2_needMshr & _s2_mshrAccepted_T; // @[src/main/scala/memory/dcache/DCache.scala 334:37]
  wire  s2_ready = pipeLoadHitValid | pipeStoreHitValid | s2_mshrAccepted | ~s2_valid; // @[src/main/scala/memory/dcache/DCache.scala 337:82]
  wire  s1_canGo = s2_ready & array_io_read_validOut; // @[src/main/scala/memory/dcache/DCache.scala 195:27]
  wire  s1_ready = _s0_ready_T | s1_canGo; // @[src/main/scala/memory/dcache/DCache.scala 196:25]
  wire  s0_ready = ~s1_valid | s1_ready; // @[src/main/scala/memory/dcache/DCache.scala 134:25]
  wire  _s0_loadFire_T_1 = ~mshr_io_mshrWriting; // @[src/main/scala/memory/dcache/DCache.scala 139:50]
  wire  s0_loadFire = loadSelected & s0_ready & ~mshr_io_mshrWriting; // @[src/main/scala/memory/dcache/DCache.scala 139:47]
  wire  s0_storeFire = storeSelected & s0_ready & _s0_loadFire_T_1; // @[src/main/scala/memory/dcache/DCache.scala 140:48]
  wire  s0_fire = s0_loadFire | s0_storeFire; // @[src/main/scala/memory/dcache/DCache.scala 141:29]
  wire  _io_loadReq_ready_T_1 = s0_ready & _s0_loadFire_T_1; // @[src/main/scala/memory/dcache/DCache.scala 143:33]
  wire [31:0] s0_paddr = loadSelected ? io_loadReq_bits_paddr : io_storeReq_bits_paddr; // @[src/main/scala/memory/dcache/DCache.scala 147:21]
  wire  _array_io_read_valid_T = loadSelected ? io_loadReq_bits_cacheable : 1'h1; // @[src/main/scala/memory/dcache/DCache.scala 150:40]
  wire  _GEN_2 = s1_ready ? 1'h0 : s1_valid; // @[src/main/scala/memory/dcache/DCache.scala 170:24 171:14 86:30]
  wire  _GEN_3 = s0_fire | _GEN_2; // @[src/main/scala/memory/dcache/DCache.scala 160:23 161:18]
  wire [17:0] s1_ptag = s1_paddr[31:14]; // @[src/main/scala/memory/dcache/DCache.scala 178:27]
  wire  s1_isUncache = ~s1_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 179:22]
  wire  s1_tagHits_0 = s1_arrayData_ways_0_valid & s1_arrayData_ways_0_tag == s1_ptag; // @[src/main/scala/memory/dcache/DCache.scala 189:49]
  wire  s1_tagHits_1 = s1_arrayData_ways_1_valid & s1_arrayData_ways_1_tag == s1_ptag; // @[src/main/scala/memory/dcache/DCache.scala 189:49]
  wire  s1_tagHits_2 = s1_arrayData_ways_2_valid & s1_arrayData_ways_2_tag == s1_ptag; // @[src/main/scala/memory/dcache/DCache.scala 189:49]
  wire  s1_tagHits_3 = s1_arrayData_ways_3_valid & s1_arrayData_ways_3_tag == s1_ptag; // @[src/main/scala/memory/dcache/DCache.scala 189:49]
  wire [3:0] _s1_hit_T = {s1_tagHits_3,s1_tagHits_2,s1_tagHits_1,s1_tagHits_0}; // @[src/main/scala/memory/dcache/DCache.scala 191:30]
  wire  s1_hit = |_s1_hit_T & s1_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 191:41]
  wire [1:0] s1_hitWay_hi_1 = _s1_hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] s1_hitWay_lo_1 = _s1_hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _s1_hitWay_T_2 = s1_hitWay_hi_1 | s1_hitWay_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s1_hitWay = {|s1_hitWay_hi_1,_s1_hitWay_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  _GEN_51 = s2_ready ? 1'h0 : s2_valid; // @[src/main/scala/memory/dcache/DCache.scala 219:24 220:14 98:30]
  wire  _GEN_52 = s1_valid & s1_canGo | _GEN_51; // @[src/main/scala/memory/dcache/DCache.scala 201:49 202:20]
  wire [7:0] s2_setIdx = s2_paddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 226:27]
  wire [17:0] s2_ptag = s2_paddr[31:14]; // @[src/main/scala/memory/dcache/DCache.scala 227:27]
  wire [3:0] s2_wordOff = s2_paddr[5:2]; // @[src/main/scala/memory/dcache/DCache.scala 232:28]
  wire  _T_8 = s2_wordOff == 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [511:0] _GEN_119 = 2'h1 == s2_hitWay ? s2_arrayData_ways_1_data : s2_arrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 237:{37,37}]
  wire [511:0] _GEN_120 = 2'h2 == s2_hitWay ? s2_arrayData_ways_2_data : _GEN_119; // @[src/main/scala/memory/dcache/DCache.scala 237:{37,37}]
  wire [511:0] _GEN_121 = 2'h3 == s2_hitWay ? s2_arrayData_ways_3_data : _GEN_120; // @[src/main/scala/memory/dcache/DCache.scala 237:{37,37}]
  wire [31:0] _GEN_122 = s2_wordOff == 4'h0 ? _GEN_121[31:0] : 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 234:14 236:30 237:18]
  wire  _T_9 = s2_wordOff == 4'h1; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_123 = s2_wordOff == 4'h1 ? _GEN_121[63:32] : _GEN_122; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_10 = s2_wordOff == 4'h2; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_124 = s2_wordOff == 4'h2 ? _GEN_121[95:64] : _GEN_123; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_11 = s2_wordOff == 4'h3; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_125 = s2_wordOff == 4'h3 ? _GEN_121[127:96] : _GEN_124; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_12 = s2_wordOff == 4'h4; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_126 = s2_wordOff == 4'h4 ? _GEN_121[159:128] : _GEN_125; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_13 = s2_wordOff == 4'h5; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_127 = s2_wordOff == 4'h5 ? _GEN_121[191:160] : _GEN_126; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_14 = s2_wordOff == 4'h6; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_128 = s2_wordOff == 4'h6 ? _GEN_121[223:192] : _GEN_127; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_15 = s2_wordOff == 4'h7; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_129 = s2_wordOff == 4'h7 ? _GEN_121[255:224] : _GEN_128; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_16 = s2_wordOff == 4'h8; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_130 = s2_wordOff == 4'h8 ? _GEN_121[287:256] : _GEN_129; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_17 = s2_wordOff == 4'h9; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_131 = s2_wordOff == 4'h9 ? _GEN_121[319:288] : _GEN_130; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_18 = s2_wordOff == 4'ha; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_132 = s2_wordOff == 4'ha ? _GEN_121[351:320] : _GEN_131; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_19 = s2_wordOff == 4'hb; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_133 = s2_wordOff == 4'hb ? _GEN_121[383:352] : _GEN_132; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_20 = s2_wordOff == 4'hc; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_134 = s2_wordOff == 4'hc ? _GEN_121[415:384] : _GEN_133; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_21 = s2_wordOff == 4'hd; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_135 = s2_wordOff == 4'hd ? _GEN_121[447:416] : _GEN_134; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_22 = s2_wordOff == 4'he; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] _GEN_136 = s2_wordOff == 4'he ? _GEN_121[479:448] : _GEN_135; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire  _T_23 = s2_wordOff == 4'hf; // @[src/main/scala/memory/dcache/DCache.scala 236:21]
  wire [31:0] s2_rawWord = s2_wordOff == 4'hf ? _GEN_121[511:480] : _GEN_136; // @[src/main/scala/memory/dcache/DCache.scala 236:30 237:18]
  wire [1:0] s2_byteOff = s2_paddr[1:0]; // @[src/main/scala/memory/dcache/DCache.scala 241:28]
  wire [31:0] _s2_shiftedData_T_1 = {8'h0,s2_rawWord[31:8]}; // @[src/main/scala/memory/dcache/DCache.scala 244:15]
  wire [31:0] _s2_shiftedData_T_3 = {16'h0,s2_rawWord[31:16]}; // @[src/main/scala/memory/dcache/DCache.scala 245:15]
  wire [31:0] _s2_shiftedData_T_5 = {24'h0,s2_rawWord[31:24]}; // @[src/main/scala/memory/dcache/DCache.scala 246:15]
  wire [31:0] _s2_shiftedData_T_7 = 2'h1 == s2_byteOff ? _s2_shiftedData_T_1 : s2_rawWord; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _s2_shiftedData_T_9 = 2'h2 == s2_byteOff ? _s2_shiftedData_T_3 : _s2_shiftedData_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] s2_shiftedData = 2'h3 == s2_byteOff ? _s2_shiftedData_T_5 : _s2_shiftedData_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] s2_mergedWords_0 = _T_8 ? s2_storeData : _GEN_121[31:0]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_1 = _T_9 ? s2_storeData : _GEN_121[63:32]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_2 = _T_10 ? s2_storeData : _GEN_121[95:64]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_3 = _T_11 ? s2_storeData : _GEN_121[127:96]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_4 = _T_12 ? s2_storeData : _GEN_121[159:128]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_5 = _T_13 ? s2_storeData : _GEN_121[191:160]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_6 = _T_14 ? s2_storeData : _GEN_121[223:192]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_7 = _T_15 ? s2_storeData : _GEN_121[255:224]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_8 = _T_16 ? s2_storeData : _GEN_121[287:256]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_9 = _T_17 ? s2_storeData : _GEN_121[319:288]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_10 = _T_18 ? s2_storeData : _GEN_121[351:320]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_11 = _T_19 ? s2_storeData : _GEN_121[383:352]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_12 = _T_20 ? s2_storeData : _GEN_121[415:384]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_13 = _T_21 ? s2_storeData : _GEN_121[447:416]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_14 = _T_22 ? s2_storeData : _GEN_121[479:448]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [31:0] s2_mergedWords_15 = _T_23 ? s2_storeData : _GEN_121[511:480]; // @[src/main/scala/memory/dcache/DCache.scala 263:23 266:30 267:25]
  wire [255:0] s2_mergedLine_lo = {s2_mergedWords_7,s2_mergedWords_6,s2_mergedWords_5,s2_mergedWords_4,s2_mergedWords_3,
    s2_mergedWords_2,s2_mergedWords_1,s2_mergedWords_0}; // @[src/main/scala/memory/dcache/DCache.scala 270:26]
  wire [511:0] s2_mergedLine = {s2_mergedWords_15,s2_mergedWords_14,s2_mergedWords_13,s2_mergedWords_12,
    s2_mergedWords_11,s2_mergedWords_10,s2_mergedWords_9,s2_mergedWords_8,s2_mergedLine_lo}; // @[src/main/scala/memory/dcache/DCache.scala 270:26]
  wire [1:0] _mshrReq_reqType_T = {s2_isUncache,s2_isLoad}; // @[src/main/scala/memory/dcache/DCache.scala 294:35]
  wire [2:0] _mshrReq_reqType_T_6 = 2'h3 == _mshrReq_reqType_T ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _mshrReq_reqType_T_8 = 2'h2 == _mshrReq_reqType_T ? 3'h4 : _mshrReq_reqType_T_6; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _mshrReq_reqType_T_10 = 2'h1 == _mshrReq_reqType_T ? 3'h0 : _mshrReq_reqType_T_8; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  DCacheArray array ( // @[src/main/scala/memory/dcache/DCache.scala 59:24]
    .clock(array_clock),
    .reset(array_reset),
    .io_read_valid(array_io_read_valid),
    .io_read_idx(array_io_read_idx),
    .io_read_resp_ways_0_valid(array_io_read_resp_ways_0_valid),
    .io_read_resp_ways_0_dirty(array_io_read_resp_ways_0_dirty),
    .io_read_resp_ways_0_tag(array_io_read_resp_ways_0_tag),
    .io_read_resp_ways_0_data(array_io_read_resp_ways_0_data),
    .io_read_resp_ways_1_valid(array_io_read_resp_ways_1_valid),
    .io_read_resp_ways_1_dirty(array_io_read_resp_ways_1_dirty),
    .io_read_resp_ways_1_tag(array_io_read_resp_ways_1_tag),
    .io_read_resp_ways_1_data(array_io_read_resp_ways_1_data),
    .io_read_resp_ways_2_valid(array_io_read_resp_ways_2_valid),
    .io_read_resp_ways_2_dirty(array_io_read_resp_ways_2_dirty),
    .io_read_resp_ways_2_tag(array_io_read_resp_ways_2_tag),
    .io_read_resp_ways_2_data(array_io_read_resp_ways_2_data),
    .io_read_resp_ways_3_valid(array_io_read_resp_ways_3_valid),
    .io_read_resp_ways_3_dirty(array_io_read_resp_ways_3_dirty),
    .io_read_resp_ways_3_tag(array_io_read_resp_ways_3_tag),
    .io_read_resp_ways_3_data(array_io_read_resp_ways_3_data),
    .io_read_validOut(array_io_read_validOut),
    .io_write_valid(array_io_write_valid),
    .io_write_idx(array_io_write_idx),
    .io_write_way(array_io_write_way),
    .io_write_tag(array_io_write_tag),
    .io_write_dirty(array_io_write_dirty),
    .io_write_data(array_io_write_data),
    .io_write_wen(array_io_write_wen),
    .io_metaWrite_valid(array_io_metaWrite_valid),
    .io_metaWrite_idx(array_io_metaWrite_idx),
    .io_metaWrite_way(array_io_metaWrite_way)
  );
  ICacheReplacer_1 replacer ( // @[src/main/scala/memory/dcache/DCache.scala 60:24]
    .clock(replacer_clock),
    .reset(replacer_reset),
    .io_touch_valid(replacer_io_touch_valid),
    .io_touch_idx(replacer_io_touch_idx),
    .io_touch_way(replacer_io_touch_way),
    .io_victim_req(replacer_io_victim_req),
    .io_victim_idx(replacer_io_victim_idx),
    .io_victim_resp(replacer_io_victim_resp)
  );
  DCacheMSHR mshr ( // @[src/main/scala/memory/dcache/DCache.scala 61:24]
    .clock(mshr_clock),
    .reset(mshr_reset),
    .io_req_ready(mshr_io_req_ready),
    .io_req_valid(mshr_io_req_valid),
    .io_req_bits_reqType(mshr_io_req_bits_reqType),
    .io_req_bits_paddr(mshr_io_req_bits_paddr),
    .io_req_bits_lqIdx(mshr_io_req_bits_lqIdx),
    .io_req_bits_sqIdx(mshr_io_req_bits_sqIdx),
    .io_req_bits_lsuOp(mshr_io_req_bits_lsuOp),
    .io_req_bits_storeData(mshr_io_req_bits_storeData),
    .io_req_bits_victimWay(mshr_io_req_bits_victimWay),
    .io_req_bits_victimDirty(mshr_io_req_bits_victimDirty),
    .io_req_bits_victimTag(mshr_io_req_bits_victimTag),
    .io_req_bits_victimData(mshr_io_req_bits_victimData),
    .io_axi_ar_data_arid(mshr_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(mshr_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(mshr_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(mshr_io_axi_ar_data_arsize),
    .io_axi_ar_data_arburst(mshr_io_axi_ar_data_arburst),
    .io_axi_ar_data_arvalid(mshr_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(mshr_io_axi_ar_arready),
    .io_axi_aw_data_awid(mshr_io_axi_aw_data_awid),
    .io_axi_aw_data_awaddr(mshr_io_axi_aw_data_awaddr),
    .io_axi_aw_data_awlen(mshr_io_axi_aw_data_awlen),
    .io_axi_aw_data_awsize(mshr_io_axi_aw_data_awsize),
    .io_axi_aw_data_awburst(mshr_io_axi_aw_data_awburst),
    .io_axi_aw_data_awvalid(mshr_io_axi_aw_data_awvalid),
    .io_axi_aw_awready(mshr_io_axi_aw_awready),
    .io_axi_w_data_wid(mshr_io_axi_w_data_wid),
    .io_axi_w_data_wdata(mshr_io_axi_w_data_wdata),
    .io_axi_w_data_wstrb(mshr_io_axi_w_data_wstrb),
    .io_axi_w_data_wlast(mshr_io_axi_w_data_wlast),
    .io_axi_w_data_wvalid(mshr_io_axi_w_data_wvalid),
    .io_axi_w_wready(mshr_io_axi_w_wready),
    .io_axi_r_data_rid(mshr_io_axi_r_data_rid),
    .io_axi_r_data_rdata(mshr_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(mshr_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(mshr_io_axi_r_data_rvalid),
    .io_axi_r_rready(mshr_io_axi_r_rready),
    .io_axi_b_data_bid(mshr_io_axi_b_data_bid),
    .io_axi_b_data_bvalid(mshr_io_axi_b_data_bvalid),
    .io_axi_b_bready(mshr_io_axi_b_bready),
    .io_loadResp_ready(mshr_io_loadResp_ready),
    .io_loadResp_valid(mshr_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(mshr_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(mshr_io_loadResp_bits_data),
    .io_storeAck_ready(mshr_io_storeAck_ready),
    .io_storeAck_valid(mshr_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(mshr_io_storeAck_bits_sqIdx),
    .io_arrayWrite_valid(mshr_io_arrayWrite_valid),
    .io_arrayWrite_idx(mshr_io_arrayWrite_idx),
    .io_arrayWrite_way(mshr_io_arrayWrite_way),
    .io_arrayWrite_tag(mshr_io_arrayWrite_tag),
    .io_arrayWrite_dirty(mshr_io_arrayWrite_dirty),
    .io_arrayWrite_data(mshr_io_arrayWrite_data),
    .io_arrayWrite_wen(mshr_io_arrayWrite_wen),
    .io_replacerTouch_valid(mshr_io_replacerTouch_valid),
    .io_replacerTouch_idx(mshr_io_replacerTouch_idx),
    .io_replacerTouch_way(mshr_io_replacerTouch_way),
    .io_mshrWriting(mshr_io_mshrWriting)
  );
  assign io_loadReq_ready = s0_ready & _s0_loadFire_T_1 & loadSelected & _T_3; // @[src/main/scala/memory/dcache/DCache.scala 143:64]
  assign io_loadResp_valid = pipeLoadHitValid | mshr_io_loadResp_valid; // @[src/main/scala/memory/dcache/DCache.scala 356:53]
  assign io_loadResp_bits_lqIdx = pipeLoadHitValid ? s2_lqIdx : mshr_io_loadResp_bits_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 357:37]
  assign io_loadResp_bits_data = pipeLoadHitValid ? s2_shiftedData : mshr_io_loadResp_bits_data; // @[src/main/scala/memory/dcache/DCache.scala 358:37]
  assign io_storeReq_ready = _io_loadReq_ready_T_1 & storeSelected; // @[src/main/scala/memory/dcache/DCache.scala 144:48]
  assign io_storeAck_valid = pipeStoreHitValid | mshr_io_storeAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 363:53]
  assign io_storeAck_bits_sqIdx = pipeStoreHitValid ? s2_sqIdx : mshr_io_storeAck_bits_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 364:37]
  assign io_axi_ar_data_arid = mshr_io_axi_ar_data_arid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_ar_data_araddr = mshr_io_axi_ar_data_araddr; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_ar_data_arlen = mshr_io_axi_ar_data_arlen; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_ar_data_arsize = mshr_io_axi_ar_data_arsize; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_ar_data_arburst = mshr_io_axi_ar_data_arburst; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_ar_data_arvalid = mshr_io_axi_ar_data_arvalid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awid = mshr_io_axi_aw_data_awid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awaddr = mshr_io_axi_aw_data_awaddr; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awlen = mshr_io_axi_aw_data_awlen; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awsize = mshr_io_axi_aw_data_awsize; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awburst = mshr_io_axi_aw_data_awburst; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_aw_data_awvalid = mshr_io_axi_aw_data_awvalid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_w_data_wid = mshr_io_axi_w_data_wid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_w_data_wdata = mshr_io_axi_w_data_wdata; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_w_data_wstrb = mshr_io_axi_w_data_wstrb; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_w_data_wlast = mshr_io_axi_w_data_wlast; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_w_data_wvalid = mshr_io_axi_w_data_wvalid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_r_rready = mshr_io_axi_r_rready; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign io_axi_b_bready = mshr_io_axi_b_bready; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign array_clock = clock;
  assign array_reset = reset;
  assign array_io_read_valid = s0_fire & _array_io_read_valid_T; // @[src/main/scala/memory/dcache/DCache.scala 150:34]
  assign array_io_read_idx = s0_paddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 148:27]
  assign array_io_write_valid = mshr_io_arrayWrite_valid | pipeStoreHitValid; // @[src/main/scala/memory/dcache/DCache.scala 314:24 374:30 375:26]
  assign array_io_write_idx = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_idx : s2_setIdx; // @[src/main/scala/memory/dcache/DCache.scala 315:24 374:30 376:26]
  assign array_io_write_way = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_way : s2_hitWay; // @[src/main/scala/memory/dcache/DCache.scala 316:24 374:30 377:26]
  assign array_io_write_tag = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_tag : s2_ptag; // @[src/main/scala/memory/dcache/DCache.scala 317:24 374:30 378:26]
  assign array_io_write_dirty = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_dirty : 1'h1; // @[src/main/scala/memory/dcache/DCache.scala 318:24 374:30 379:26]
  assign array_io_write_data = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_data : s2_mergedLine; // @[src/main/scala/memory/dcache/DCache.scala 319:24 374:30 380:26]
  assign array_io_write_wen = mshr_io_arrayWrite_valid ? mshr_io_arrayWrite_wen : 1'h1; // @[src/main/scala/memory/dcache/DCache.scala 320:24 374:30 381:26]
  assign array_io_metaWrite_valid = s2_miss & _pipeStoreHitValid_T_3 & mshr_io_req_ready; // @[src/main/scala/memory/dcache/DCache.scala 306:60]
  assign array_io_metaWrite_idx = s2_paddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 226:27]
  assign array_io_metaWrite_way = s2_victimWay; // @[src/main/scala/memory/dcache/DCache.scala 308:32]
  assign replacer_clock = clock;
  assign replacer_reset = reset;
  assign replacer_io_touch_valid = mshr_io_replacerTouch_valid | _s2_ready_T; // @[src/main/scala/memory/dcache/DCache.scala 323:27 385:37 386:29]
  assign replacer_io_touch_idx = mshr_io_replacerTouch_valid ? mshr_io_replacerTouch_idx : s2_setIdx; // @[src/main/scala/memory/dcache/DCache.scala 325:27 385:37 387:29]
  assign replacer_io_touch_way = mshr_io_replacerTouch_valid ? mshr_io_replacerTouch_way : s2_hitWay; // @[src/main/scala/memory/dcache/DCache.scala 326:27 385:37 388:29]
  assign replacer_io_victim_req = s0_loadFire | s0_storeFire; // @[src/main/scala/memory/dcache/DCache.scala 141:29]
  assign replacer_io_victim_idx = s0_paddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 148:27]
  assign mshr_clock = clock;
  assign mshr_reset = reset;
  assign mshr_io_req_valid = s2_valid & (s2_miss | s2_isUncache); // @[src/main/scala/memory/dcache/DCache.scala 280:30]
  assign mshr_io_req_bits_reqType = 2'h0 == _mshrReq_reqType_T ? 3'h1 : _mshrReq_reqType_T_10; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign mshr_io_req_bits_paddr = s2_paddr; // @[src/main/scala/memory/dcache/DCache.scala 281:21 282:23]
  assign mshr_io_req_bits_lqIdx = s2_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 281:21 283:23]
  assign mshr_io_req_bits_sqIdx = s2_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 281:21 284:23]
  assign mshr_io_req_bits_lsuOp = s2_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 281:21 286:23]
  assign mshr_io_req_bits_storeData = s2_storeData; // @[src/main/scala/memory/dcache/DCache.scala 281:21 287:23]
  assign mshr_io_req_bits_victimWay = s2_victimWay; // @[src/main/scala/memory/dcache/DCache.scala 281:21 288:23]
  assign mshr_io_req_bits_victimDirty = s2_victimDirty & s2_miss; // @[src/main/scala/memory/dcache/DCache.scala 289:41]
  assign mshr_io_req_bits_victimTag = s2_victimTag; // @[src/main/scala/memory/dcache/DCache.scala 281:21 290:23]
  assign mshr_io_req_bits_victimData = s2_victimData; // @[src/main/scala/memory/dcache/DCache.scala 281:21 291:23]
  assign mshr_io_axi_ar_arready = io_axi_ar_arready; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_aw_awready = io_axi_aw_awready; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_w_wready = io_axi_w_wready; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_r_data_rid = io_axi_r_data_rid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_r_data_rdata = io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_r_data_rlast = io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_r_data_rvalid = io_axi_r_data_rvalid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_b_data_bid = io_axi_b_data_bid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_axi_b_data_bvalid = io_axi_b_data_bvalid; // @[src/main/scala/memory/dcache/DCache.scala 394:10]
  assign mshr_io_loadResp_ready = ~pipeLoadHitValid; // @[src/main/scala/memory/dcache/DCache.scala 360:55]
  assign mshr_io_storeAck_ready = ~pipeStoreHitValid; // @[src/main/scala/memory/dcache/DCache.scala 366:55]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 66:29]
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 66:29]
    end else if (io_storeReq_valid & ~io_loadReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 69:48]
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:18]
    end else if (io_storeReq_valid & io_loadReq_valid & ~storeStarving) begin // @[src/main/scala/memory/dcache/DCache.scala 71:71]
      storeWaitCnt <= _storeWaitCnt_T_1; // @[src/main/scala/memory/dcache/DCache.scala 72:18]
    end else begin
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 74:18]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 86:30]
      s1_valid <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 86:30]
    end else begin
      s1_valid <= _GEN_3;
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      if (loadSelected) begin // @[src/main/scala/memory/dcache/DCache.scala 147:21]
        s1_paddr <= io_loadReq_bits_paddr;
      end else begin
        s1_paddr <= io_storeReq_bits_paddr;
      end
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      s1_isLoad <= s0_loadFire; // @[src/main/scala/memory/dcache/DCache.scala 163:18]
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      if (s0_loadFire) begin // @[src/main/scala/memory/dcache/DCache.scala 164:24]
        s1_lqIdx <= io_loadReq_bits_lqIdx;
      end else begin
        s1_lqIdx <= 4'h0;
      end
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      if (s0_storeFire) begin // @[src/main/scala/memory/dcache/DCache.scala 165:24]
        s1_sqIdx <= io_storeReq_bits_sqIdx;
      end else begin
        s1_sqIdx <= 4'h0;
      end
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      if (s0_loadFire) begin // @[src/main/scala/memory/dcache/DCache.scala 167:24]
        s1_lsuOp <= io_loadReq_bits_lsuOp;
      end else begin
        s1_lsuOp <= io_storeReq_bits_lsuOp;
      end
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      s1_cacheable <= s0_loadFire & io_loadReq_bits_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 168:18]
    end
    if (s0_fire) begin // @[src/main/scala/memory/dcache/DCache.scala 160:23]
      if (s0_storeFire) begin // @[src/main/scala/memory/dcache/DCache.scala 169:24]
        s1_storeData <= io_storeReq_bits_data;
      end else begin
        s1_storeData <= 32'h0;
      end
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_0_valid <= array_io_read_resp_ways_0_valid; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_0_dirty <= array_io_read_resp_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_0_tag <= array_io_read_resp_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_0_data <= array_io_read_resp_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_1_valid <= array_io_read_resp_ways_1_valid; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_1_dirty <= array_io_read_resp_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_1_tag <= array_io_read_resp_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_1_data <= array_io_read_resp_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_2_valid <= array_io_read_resp_ways_2_valid; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_2_dirty <= array_io_read_resp_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_2_tag <= array_io_read_resp_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_2_data <= array_io_read_resp_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_3_valid <= array_io_read_resp_ways_3_valid; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_3_dirty <= array_io_read_resp_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_3_tag <= array_io_read_resp_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (array_io_read_validOut) begin // @[src/main/scala/memory/dcache/DCache.scala 182:32]
      s1_arrayData_ways_3_data <= array_io_read_resp_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 183:18]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 98:30]
      s2_valid <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 98:30]
    end else begin
      s2_valid <= _GEN_52;
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_paddr <= s1_paddr; // @[src/main/scala/memory/dcache/DCache.scala 203:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_isLoad <= s1_isLoad; // @[src/main/scala/memory/dcache/DCache.scala 204:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_lqIdx <= s1_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 205:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_sqIdx <= s1_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 206:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_lsuOp <= s1_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 208:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_cacheable <= s1_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 209:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_storeData <= s1_storeData; // @[src/main/scala/memory/dcache/DCache.scala 210:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_hit <= s1_hit; // @[src/main/scala/memory/dcache/DCache.scala 211:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_hitWay <= s1_hitWay; // @[src/main/scala/memory/dcache/DCache.scala 212:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_victimWay <= replacer_io_victim_resp; // @[src/main/scala/memory/dcache/DCache.scala 213:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      if (2'h3 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 214:20]
        s2_victimDirty <= s1_arrayData_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 214:20]
      end else if (2'h2 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 214:20]
        s2_victimDirty <= s1_arrayData_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 214:20]
      end else if (2'h1 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 214:20]
        s2_victimDirty <= s1_arrayData_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 214:20]
      end else begin
        s2_victimDirty <= s1_arrayData_ways_0_dirty;
      end
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      if (2'h3 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 215:20]
        s2_victimTag <= s1_arrayData_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
      end else if (2'h2 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 215:20]
        s2_victimTag <= s1_arrayData_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
      end else if (2'h1 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 215:20]
        s2_victimTag <= s1_arrayData_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
      end else begin
        s2_victimTag <= s1_arrayData_ways_0_tag;
      end
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      if (2'h3 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 216:20]
        s2_victimData <= s1_arrayData_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 216:20]
      end else if (2'h2 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 216:20]
        s2_victimData <= s1_arrayData_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 216:20]
      end else if (2'h1 == replacer_io_victim_resp) begin // @[src/main/scala/memory/dcache/DCache.scala 216:20]
        s2_victimData <= s1_arrayData_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 216:20]
      end else begin
        s2_victimData <= s1_arrayData_ways_0_data;
      end
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_arrayData_ways_0_data <= s1_arrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 217:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_arrayData_ways_1_data <= s1_arrayData_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 217:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_arrayData_ways_2_data <= s1_arrayData_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 217:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_arrayData_ways_3_data <= s1_arrayData_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 217:20]
    end
    if (s1_valid & s1_canGo) begin // @[src/main/scala/memory/dcache/DCache.scala 201:49]
      s2_isUncache <= s1_isUncache; // @[src/main/scala/memory/dcache/DCache.scala 218:20]
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
  storeWaitCnt = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  s1_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_paddr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_isLoad = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_lqIdx = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  s1_sqIdx = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  s1_lsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  s1_cacheable = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_storeData = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s1_arrayData_ways_0_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_arrayData_ways_0_dirty = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s1_arrayData_ways_0_tag = _RAND_11[17:0];
  _RAND_12 = {16{`RANDOM}};
  s1_arrayData_ways_0_data = _RAND_12[511:0];
  _RAND_13 = {1{`RANDOM}};
  s1_arrayData_ways_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s1_arrayData_ways_1_dirty = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_arrayData_ways_1_tag = _RAND_15[17:0];
  _RAND_16 = {16{`RANDOM}};
  s1_arrayData_ways_1_data = _RAND_16[511:0];
  _RAND_17 = {1{`RANDOM}};
  s1_arrayData_ways_2_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s1_arrayData_ways_2_dirty = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s1_arrayData_ways_2_tag = _RAND_19[17:0];
  _RAND_20 = {16{`RANDOM}};
  s1_arrayData_ways_2_data = _RAND_20[511:0];
  _RAND_21 = {1{`RANDOM}};
  s1_arrayData_ways_3_valid = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_arrayData_ways_3_dirty = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s1_arrayData_ways_3_tag = _RAND_23[17:0];
  _RAND_24 = {16{`RANDOM}};
  s1_arrayData_ways_3_data = _RAND_24[511:0];
  _RAND_25 = {1{`RANDOM}};
  s2_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s2_paddr = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s2_isLoad = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s2_lqIdx = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  s2_sqIdx = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  s2_lsuOp = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  s2_cacheable = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s2_storeData = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s2_hit = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  s2_hitWay = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  s2_victimWay = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  s2_victimDirty = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  s2_victimTag = _RAND_37[17:0];
  _RAND_38 = {16{`RANDOM}};
  s2_victimData = _RAND_38[511:0];
  _RAND_39 = {16{`RANDOM}};
  s2_arrayData_ways_0_data = _RAND_39[511:0];
  _RAND_40 = {16{`RANDOM}};
  s2_arrayData_ways_1_data = _RAND_40[511:0];
  _RAND_41 = {16{`RANDOM}};
  s2_arrayData_ways_2_data = _RAND_41[511:0];
  _RAND_42 = {16{`RANDOM}};
  s2_arrayData_ways_3_data = _RAND_42[511:0];
  _RAND_43 = {1{`RANDOM}};
  s2_isUncache = _RAND_43[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
