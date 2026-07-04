module DCacheMSHR(
  input          clock,
  input          reset,
  output         io_req_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_req_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [2:0]   io_req_bits_reqType, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [31:0]  io_req_bits_paddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [3:0]   io_req_bits_lqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [3:0]   io_req_bits_sqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [3:0]   io_req_bits_lsuOp, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [31:0]  io_req_bits_storeData, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [1:0]   io_req_bits_victimWay, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_req_bits_victimDirty, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [17:0]  io_req_bits_victimTag, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [511:0] io_req_bits_victimData, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_axi_ar_data_arid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [31:0]  io_axi_ar_data_araddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [7:0]   io_axi_ar_data_arlen, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [2:0]   io_axi_ar_data_arsize, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [1:0]   io_axi_ar_data_arburst, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_ar_data_arvalid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_ar_arready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_axi_aw_data_awid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [31:0]  io_axi_aw_data_awaddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [7:0]   io_axi_aw_data_awlen, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [2:0]   io_axi_aw_data_awsize, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [1:0]   io_axi_aw_data_awburst, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_aw_data_awvalid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_aw_awready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_axi_w_data_wid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [31:0]  io_axi_w_data_wdata, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_axi_w_data_wstrb, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_w_data_wlast, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_w_data_wvalid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_w_wready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [3:0]   io_axi_r_data_rid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [31:0]  io_axi_r_data_rdata, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_r_data_rlast, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_r_data_rvalid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_r_rready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input  [3:0]   io_axi_b_data_bid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_axi_b_data_bvalid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_axi_b_bready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_loadResp_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_loadResp_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_loadResp_bits_lqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [31:0]  io_loadResp_bits_data, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  input          io_storeAck_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_storeAck_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [3:0]   io_storeAck_bits_sqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_arrayWrite_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [7:0]   io_arrayWrite_idx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [1:0]   io_arrayWrite_way, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [17:0]  io_arrayWrite_tag, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_arrayWrite_dirty, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [511:0] io_arrayWrite_data, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_arrayWrite_wen, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_replacerTouch_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [7:0]   io_replacerTouch_idx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output [1:0]   io_replacerTouch_way, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
  output         io_mshrWriting // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 263:14]
);
  wire  entries_0_clock; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_reset; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_id; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_req_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_req_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [2:0] entries_0_io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_0_io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_0_io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_ar_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_ar_bits_arid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_ar_bits_araddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_0_io_ar_bits_arlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_ar_bits_arburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_r_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_r_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_r_bits_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_aw_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_aw_bits_awid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_aw_bits_awaddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_0_io_aw_bits_awlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_aw_bits_awburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_w_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_w_bits_wid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_w_bits_wdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_w_bits_wstrb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_w_bits_wlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_b_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_b_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_loadResp_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_loadResp_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_0_io_loadResp_bits_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_storeAck_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_0_io_storeAck_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_0_io_arrayWrite_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_arrayWrite_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_0_io_arrayWrite_tag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_arrayWrite_dirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_0_io_arrayWrite_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_0_io_replacerTouch_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_0_io_replacerTouch_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_busy; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_isWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_0_io_setIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_0_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_clock; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_reset; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_id; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_req_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_req_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [2:0] entries_1_io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_1_io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_1_io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_ar_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_ar_bits_arid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_ar_bits_araddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_1_io_ar_bits_arlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_ar_bits_arburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_r_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_r_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_r_bits_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_aw_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_aw_bits_awid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_aw_bits_awaddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_1_io_aw_bits_awlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_aw_bits_awburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_w_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_w_bits_wid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_w_bits_wdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_w_bits_wstrb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_w_bits_wlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_b_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_b_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_loadResp_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_loadResp_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_1_io_loadResp_bits_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_storeAck_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_1_io_storeAck_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_1_io_arrayWrite_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_arrayWrite_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_1_io_arrayWrite_tag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_arrayWrite_dirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_1_io_arrayWrite_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_1_io_replacerTouch_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_1_io_replacerTouch_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_busy; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_isWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_1_io_setIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_1_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_clock; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_reset; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_id; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_req_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_req_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [2:0] entries_2_io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_2_io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_2_io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_ar_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_ar_bits_arid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_ar_bits_araddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_2_io_ar_bits_arlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_ar_bits_arburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_r_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_r_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_r_bits_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_aw_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_aw_bits_awid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_aw_bits_awaddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_2_io_aw_bits_awlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_aw_bits_awburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_w_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_w_bits_wid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_w_bits_wdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_w_bits_wstrb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_w_bits_wlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_b_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_b_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_loadResp_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_loadResp_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_2_io_loadResp_bits_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_storeAck_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_2_io_storeAck_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_2_io_arrayWrite_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_arrayWrite_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_2_io_arrayWrite_tag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_arrayWrite_dirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_2_io_arrayWrite_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_2_io_replacerTouch_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_2_io_replacerTouch_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_busy; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_isWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_2_io_setIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_2_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_clock; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_reset; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_id; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_req_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_req_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [2:0] entries_3_io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_3_io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_3_io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_ar_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_ar_bits_arid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_ar_bits_araddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_3_io_ar_bits_arlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_ar_bits_arburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_r_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_r_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_r_bits_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_aw_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_aw_bits_awid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_aw_bits_awaddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_3_io_aw_bits_awlen; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_aw_bits_awburst; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_w_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_w_bits_wid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_w_bits_wdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_w_bits_wstrb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_w_bits_wlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_b_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_b_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_loadResp_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_loadResp_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [31:0] entries_3_io_loadResp_bits_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_storeAck_ready; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [3:0] entries_3_io_storeAck_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_3_io_arrayWrite_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_arrayWrite_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [17:0] entries_3_io_arrayWrite_tag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_arrayWrite_dirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [511:0] entries_3_io_arrayWrite_data; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_3_io_replacerTouch_idx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [1:0] entries_3_io_replacerTouch_way; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_busy; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_isWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire [7:0] entries_3_io_setIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  entries_3_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
  wire  _freeMask_WIRE_1 = entries_1_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 302:{25,25}]
  wire  _freeMask_WIRE_0 = entries_0_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 302:{25,25}]
  wire  _freeMask_WIRE_3 = entries_3_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 302:{25,25}]
  wire  _freeMask_WIRE_2 = entries_2_io_canAcceptReq; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 302:{25,25}]
  wire [3:0] freeMask = {_freeMask_WIRE_3,_freeMask_WIRE_2,_freeMask_WIRE_1,_freeMask_WIRE_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 302:58]
  wire  hasFree = |freeMask; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 303:27]
  wire [1:0] _allocIdx_T_4 = freeMask[2] ? 2'h2 : 2'h3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _allocIdx_T_5 = freeMask[1] ? 2'h1 : _allocIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] allocIdx = freeMask[0] ? 2'h0 : _allocIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  _anyWriteback_WIRE_1 = entries_1_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:{29,29}]
  wire  _anyWriteback_WIRE_0 = entries_0_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:{29,29}]
  wire  _anyWriteback_WIRE_3 = entries_3_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:{29,29}]
  wire  _anyWriteback_WIRE_2 = entries_2_io_blockOthers; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:{29,29}]
  wire [3:0] _anyWriteback_T = {_anyWriteback_WIRE_3,_anyWriteback_WIRE_2,_anyWriteback_WIRE_1,_anyWriteback_WIRE_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:61]
  wire  anyWriteback = |_anyWriteback_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 306:68]
  wire [7:0] reqSetIdx = io_req_bits_paddr[13:6]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 309:36]
  wire  _setConflict_T_1 = entries_0_io_busy & entries_0_io_setIdx == reqSetIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:56]
  wire  _setConflict_T_3 = entries_1_io_busy & entries_1_io_setIdx == reqSetIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:56]
  wire  _setConflict_T_5 = entries_2_io_busy & entries_2_io_setIdx == reqSetIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:56]
  wire  _setConflict_T_7 = entries_3_io_busy & entries_3_io_setIdx == reqSetIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:56]
  wire [3:0] _setConflict_T_8 = {_setConflict_T_7,_setConflict_T_5,_setConflict_T_3,_setConflict_T_1}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:87]
  wire  setConflict = |_setConflict_T_8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 310:94]
  wire  canAlloc = hasFree & ~anyWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 312:26]
  wire  _io_req_ready_T = ~setConflict; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 313:31]
  wire  arValids_2 = entries_2_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 325:{25,25}]
  wire [3:0] _arSelectOH_T_8 = arValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  arValids_1 = entries_1_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 325:{25,25}]
  wire [3:0] _arSelectOH_T_9 = arValids_1 ? 4'h2 : _arSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  arValids_0 = entries_0_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 325:{25,25}]
  wire [3:0] arSelectOH = arValids_0 ? 4'h1 : _arSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  arValids_3 = entries_3_io_ar_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 325:{25,25}]
  wire [3:0] _arHasValid_T = {arValids_3,arValids_2,arValids_1,arValids_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 327:29]
  wire [3:0] _io_axi_ar_data_arid_T_4 = arSelectOH[0] ? entries_0_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_5 = arSelectOH[1] ? entries_1_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_6 = arSelectOH[2] ? entries_2_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_7 = arSelectOH[3] ? entries_3_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_8 = _io_axi_ar_data_arid_T_4 | _io_axi_ar_data_arid_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_9 = _io_axi_ar_data_arid_T_8 | _io_axi_ar_data_arid_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_4 = arSelectOH[0] ? entries_0_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_5 = arSelectOH[1] ? entries_1_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_6 = arSelectOH[2] ? entries_2_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_7 = arSelectOH[3] ? entries_3_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_8 = _io_axi_ar_data_araddr_T_4 | _io_axi_ar_data_araddr_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_9 = _io_axi_ar_data_araddr_T_8 | _io_axi_ar_data_araddr_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_4 = arSelectOH[0] ? entries_0_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_5 = arSelectOH[1] ? entries_1_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_6 = arSelectOH[2] ? entries_2_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_7 = arSelectOH[3] ? entries_3_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_8 = _io_axi_ar_data_arlen_T_4 | _io_axi_ar_data_arlen_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_9 = _io_axi_ar_data_arlen_T_8 | _io_axi_ar_data_arlen_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_4 = arSelectOH[0] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_5 = arSelectOH[1] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_6 = arSelectOH[2] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_7 = arSelectOH[3] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_8 = _io_axi_ar_data_arsize_T_4 | _io_axi_ar_data_arsize_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_9 = _io_axi_ar_data_arsize_T_8 | _io_axi_ar_data_arsize_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_4 = arSelectOH[0] ? entries_0_io_ar_bits_arburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_5 = arSelectOH[1] ? entries_1_io_ar_bits_arburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_6 = arSelectOH[2] ? entries_2_io_ar_bits_arburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_7 = arSelectOH[3] ? entries_3_io_ar_bits_arburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_8 = _io_axi_ar_data_arburst_T_4 | _io_axi_ar_data_arburst_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_ar_data_arburst_T_9 = _io_axi_ar_data_arburst_T_8 | _io_axi_ar_data_arburst_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] rId = io_axi_r_data_rid[1:0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 345:30]
  wire [3:0] rIdOH = 4'h1 << rId; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire  awValids_2 = entries_2_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 354:{25,25}]
  wire [3:0] _awSelectOH_T_8 = awValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids_1 = entries_1_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 354:{25,25}]
  wire [3:0] _awSelectOH_T_9 = awValids_1 ? 4'h2 : _awSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids_0 = entries_0_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 354:{25,25}]
  wire [3:0] awSelectOH = awValids_0 ? 4'h1 : _awSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids_3 = entries_3_io_aw_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 354:{25,25}]
  wire [3:0] _awHasValid_T = {awValids_3,awValids_2,awValids_1,awValids_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 356:29]
  wire [3:0] _io_axi_aw_data_awid_T_4 = awSelectOH[0] ? entries_0_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_5 = awSelectOH[1] ? entries_1_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_6 = awSelectOH[2] ? entries_2_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_7 = awSelectOH[3] ? entries_3_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_8 = _io_axi_aw_data_awid_T_4 | _io_axi_aw_data_awid_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_9 = _io_axi_aw_data_awid_T_8 | _io_axi_aw_data_awid_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_4 = awSelectOH[0] ? entries_0_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_5 = awSelectOH[1] ? entries_1_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_6 = awSelectOH[2] ? entries_2_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_7 = awSelectOH[3] ? entries_3_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_8 = _io_axi_aw_data_awaddr_T_4 | _io_axi_aw_data_awaddr_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_9 = _io_axi_aw_data_awaddr_T_8 | _io_axi_aw_data_awaddr_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_4 = awSelectOH[0] ? entries_0_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_5 = awSelectOH[1] ? entries_1_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_6 = awSelectOH[2] ? entries_2_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_7 = awSelectOH[3] ? entries_3_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_8 = _io_axi_aw_data_awlen_T_4 | _io_axi_aw_data_awlen_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_9 = _io_axi_aw_data_awlen_T_8 | _io_axi_aw_data_awlen_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_4 = awSelectOH[0] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_5 = awSelectOH[1] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_6 = awSelectOH[2] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_7 = awSelectOH[3] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_8 = _io_axi_aw_data_awsize_T_4 | _io_axi_aw_data_awsize_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_9 = _io_axi_aw_data_awsize_T_8 | _io_axi_aw_data_awsize_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_4 = awSelectOH[0] ? entries_0_io_aw_bits_awburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_5 = awSelectOH[1] ? entries_1_io_aw_bits_awburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_6 = awSelectOH[2] ? entries_2_io_aw_bits_awburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_7 = awSelectOH[3] ? entries_3_io_aw_bits_awburst : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_8 = _io_axi_aw_data_awburst_T_4 | _io_axi_aw_data_awburst_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_axi_aw_data_awburst_T_9 = _io_axi_aw_data_awburst_T_8 | _io_axi_aw_data_awburst_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  wValids_2 = entries_2_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 374:{24,24}]
  wire [3:0] _wSelectOH_T_8 = wValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  wValids_1 = entries_1_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 374:{24,24}]
  wire [3:0] _wSelectOH_T_9 = wValids_1 ? 4'h2 : _wSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  wValids_0 = entries_0_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 374:{24,24}]
  wire [3:0] wSelectOH = wValids_0 ? 4'h1 : _wSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  wValids_3 = entries_3_io_w_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 374:{24,24}]
  wire [3:0] _wHasValid_T = {wValids_3,wValids_2,wValids_1,wValids_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 376:27]
  wire [3:0] _io_axi_w_data_wid_T_4 = wSelectOH[0] ? entries_0_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_5 = wSelectOH[1] ? entries_1_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_6 = wSelectOH[2] ? entries_2_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_7 = wSelectOH[3] ? entries_3_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_8 = _io_axi_w_data_wid_T_4 | _io_axi_w_data_wid_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_9 = _io_axi_w_data_wid_T_8 | _io_axi_w_data_wid_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_4 = wSelectOH[0] ? entries_0_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_5 = wSelectOH[1] ? entries_1_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_6 = wSelectOH[2] ? entries_2_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_7 = wSelectOH[3] ? entries_3_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_8 = _io_axi_w_data_wdata_T_4 | _io_axi_w_data_wdata_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_9 = _io_axi_w_data_wdata_T_8 | _io_axi_w_data_wdata_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_4 = wSelectOH[0] ? entries_0_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_5 = wSelectOH[1] ? entries_1_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_6 = wSelectOH[2] ? entries_2_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_7 = wSelectOH[3] ? entries_3_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_8 = _io_axi_w_data_wstrb_T_4 | _io_axi_w_data_wstrb_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_9 = _io_axi_w_data_wstrb_T_8 | _io_axi_w_data_wstrb_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] bId = io_axi_b_data_bid[1:0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 390:30]
  wire [3:0] bIdOH = 4'h1 << bId; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire  lrValids_2 = entries_2_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 399:{25,25}]
  wire [3:0] _lrSelectOH_T_8 = lrValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  lrValids_1 = entries_1_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 399:{25,25}]
  wire [3:0] _lrSelectOH_T_9 = lrValids_1 ? 4'h2 : _lrSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  lrValids_0 = entries_0_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 399:{25,25}]
  wire [3:0] lrSelectOH = lrValids_0 ? 4'h1 : _lrSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  lrValids_3 = entries_3_io_loadResp_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 399:{25,25}]
  wire [3:0] _lrHasValid_T = {lrValids_3,lrValids_2,lrValids_1,lrValids_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 401:29]
  wire [3:0] _io_loadResp_bits_lqIdx_T_4 = lrSelectOH[0] ? entries_0_io_loadResp_bits_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadResp_bits_lqIdx_T_5 = lrSelectOH[1] ? entries_1_io_loadResp_bits_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadResp_bits_lqIdx_T_6 = lrSelectOH[2] ? entries_2_io_loadResp_bits_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadResp_bits_lqIdx_T_7 = lrSelectOH[3] ? entries_3_io_loadResp_bits_lqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadResp_bits_lqIdx_T_8 = _io_loadResp_bits_lqIdx_T_4 | _io_loadResp_bits_lqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_loadResp_bits_lqIdx_T_9 = _io_loadResp_bits_lqIdx_T_8 | _io_loadResp_bits_lqIdx_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_4 = lrSelectOH[0] ? entries_0_io_loadResp_bits_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_5 = lrSelectOH[1] ? entries_1_io_loadResp_bits_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_6 = lrSelectOH[2] ? entries_2_io_loadResp_bits_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_7 = lrSelectOH[3] ? entries_3_io_loadResp_bits_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_8 = _io_loadResp_bits_data_T_4 | _io_loadResp_bits_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_loadResp_bits_data_T_9 = _io_loadResp_bits_data_T_8 | _io_loadResp_bits_data_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  saValids_2 = entries_2_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 412:{25,25}]
  wire [3:0] _saSelectOH_T_8 = saValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  saValids_1 = entries_1_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 412:{25,25}]
  wire [3:0] _saSelectOH_T_9 = saValids_1 ? 4'h2 : _saSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  saValids_0 = entries_0_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 412:{25,25}]
  wire [3:0] saSelectOH = saValids_0 ? 4'h1 : _saSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  saValids_3 = entries_3_io_storeAck_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 412:{25,25}]
  wire [3:0] _saHasValid_T = {saValids_3,saValids_2,saValids_1,saValids_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 414:29]
  wire [3:0] _io_storeAck_bits_sqIdx_T_4 = saSelectOH[0] ? entries_0_io_storeAck_bits_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_storeAck_bits_sqIdx_T_5 = saSelectOH[1] ? entries_1_io_storeAck_bits_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_storeAck_bits_sqIdx_T_6 = saSelectOH[2] ? entries_2_io_storeAck_bits_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_storeAck_bits_sqIdx_T_7 = saSelectOH[3] ? entries_3_io_storeAck_bits_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_storeAck_bits_sqIdx_T_8 = _io_storeAck_bits_sqIdx_T_4 | _io_storeAck_bits_sqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_storeAck_bits_sqIdx_T_9 = _io_storeAck_bits_sqIdx_T_8 | _io_storeAck_bits_sqIdx_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  awValids2_2 = entries_2_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 424:{26,26}]
  wire [3:0] _awSelectOH2_T_8 = awValids2_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids2_1 = entries_1_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 424:{26,26}]
  wire [3:0] _awSelectOH2_T_9 = awValids2_1 ? 4'h2 : _awSelectOH2_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids2_0 = entries_0_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 424:{26,26}]
  wire [3:0] awSelectOH2 = awValids2_0 ? 4'h1 : _awSelectOH2_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  awValids2_3 = entries_3_io_arrayWrite_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 424:{26,26}]
  wire [3:0] _awHasValid2_T = {awValids2_3,awValids2_2,awValids2_1,awValids2_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 426:31]
  wire  _io_arrayWrite_valid_T_10 = awSelectOH2[0] & entries_0_io_arrayWrite_valid | awSelectOH2[1] &
    entries_1_io_arrayWrite_valid | awSelectOH2[2] & entries_2_io_arrayWrite_valid | awSelectOH2[3] &
    entries_3_io_arrayWrite_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_4 = awSelectOH2[0] ? entries_0_io_arrayWrite_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_5 = awSelectOH2[1] ? entries_1_io_arrayWrite_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_6 = awSelectOH2[2] ? entries_2_io_arrayWrite_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_7 = awSelectOH2[3] ? entries_3_io_arrayWrite_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_8 = _io_arrayWrite_idx_T_4 | _io_arrayWrite_idx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_arrayWrite_idx_T_9 = _io_arrayWrite_idx_T_8 | _io_arrayWrite_idx_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_4 = awSelectOH2[0] ? entries_0_io_arrayWrite_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_5 = awSelectOH2[1] ? entries_1_io_arrayWrite_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_6 = awSelectOH2[2] ? entries_2_io_arrayWrite_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_7 = awSelectOH2[3] ? entries_3_io_arrayWrite_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_8 = _io_arrayWrite_way_T_4 | _io_arrayWrite_way_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_arrayWrite_way_T_9 = _io_arrayWrite_way_T_8 | _io_arrayWrite_way_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_4 = awSelectOH2[0] ? entries_0_io_arrayWrite_tag : 18'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_5 = awSelectOH2[1] ? entries_1_io_arrayWrite_tag : 18'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_6 = awSelectOH2[2] ? entries_2_io_arrayWrite_tag : 18'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_7 = awSelectOH2[3] ? entries_3_io_arrayWrite_tag : 18'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_8 = _io_arrayWrite_tag_T_4 | _io_arrayWrite_tag_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [17:0] _io_arrayWrite_tag_T_9 = _io_arrayWrite_tag_T_8 | _io_arrayWrite_tag_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_4 = awSelectOH2[0] ? entries_0_io_arrayWrite_data : 512'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_5 = awSelectOH2[1] ? entries_1_io_arrayWrite_data : 512'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_6 = awSelectOH2[2] ? entries_2_io_arrayWrite_data : 512'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_7 = awSelectOH2[3] ? entries_3_io_arrayWrite_data : 512'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_8 = _io_arrayWrite_data_T_4 | _io_arrayWrite_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [511:0] _io_arrayWrite_data_T_9 = _io_arrayWrite_data_T_8 | _io_arrayWrite_data_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  rtValids_2 = entries_2_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 438:{25,25}]
  wire [3:0] _rtSelectOH_T_8 = rtValids_2 ? 4'h4 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  rtValids_1 = entries_1_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 438:{25,25}]
  wire [3:0] _rtSelectOH_T_9 = rtValids_1 ? 4'h2 : _rtSelectOH_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  rtValids_0 = entries_0_io_replacerTouch_valid; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 438:{25,25}]
  wire [3:0] rtSelectOH = rtValids_0 ? 4'h1 : _rtSelectOH_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  _io_replacerTouch_valid_T_10 = rtSelectOH[0] & entries_0_io_replacerTouch_valid | rtSelectOH[1] &
    entries_1_io_replacerTouch_valid | rtSelectOH[2] & entries_2_io_replacerTouch_valid | rtSelectOH[3] &
    entries_3_io_replacerTouch_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_4 = rtSelectOH[0] ? entries_0_io_replacerTouch_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_5 = rtSelectOH[1] ? entries_1_io_replacerTouch_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_6 = rtSelectOH[2] ? entries_2_io_replacerTouch_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_7 = rtSelectOH[3] ? entries_3_io_replacerTouch_idx : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_8 = _io_replacerTouch_idx_T_4 | _io_replacerTouch_idx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_replacerTouch_idx_T_9 = _io_replacerTouch_idx_T_8 | _io_replacerTouch_idx_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_4 = rtSelectOH[0] ? entries_0_io_replacerTouch_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_5 = rtSelectOH[1] ? entries_1_io_replacerTouch_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_6 = rtSelectOH[2] ? entries_2_io_replacerTouch_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_7 = rtSelectOH[3] ? entries_3_io_replacerTouch_way : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_8 = _io_replacerTouch_way_T_4 | _io_replacerTouch_way_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_replacerTouch_way_T_9 = _io_replacerTouch_way_T_8 | _io_replacerTouch_way_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  DCacheMshrEntry entries_0 ( // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
    .clock(entries_0_clock),
    .reset(entries_0_reset),
    .io_id(entries_0_io_id),
    .io_req_ready(entries_0_io_req_ready),
    .io_req_valid(entries_0_io_req_valid),
    .io_req_bits_reqType(entries_0_io_req_bits_reqType),
    .io_req_bits_paddr(entries_0_io_req_bits_paddr),
    .io_req_bits_lqIdx(entries_0_io_req_bits_lqIdx),
    .io_req_bits_sqIdx(entries_0_io_req_bits_sqIdx),
    .io_req_bits_lsuOp(entries_0_io_req_bits_lsuOp),
    .io_req_bits_storeData(entries_0_io_req_bits_storeData),
    .io_req_bits_victimWay(entries_0_io_req_bits_victimWay),
    .io_req_bits_victimDirty(entries_0_io_req_bits_victimDirty),
    .io_req_bits_victimTag(entries_0_io_req_bits_victimTag),
    .io_req_bits_victimData(entries_0_io_req_bits_victimData),
    .io_ar_ready(entries_0_io_ar_ready),
    .io_ar_valid(entries_0_io_ar_valid),
    .io_ar_bits_arid(entries_0_io_ar_bits_arid),
    .io_ar_bits_araddr(entries_0_io_ar_bits_araddr),
    .io_ar_bits_arlen(entries_0_io_ar_bits_arlen),
    .io_ar_bits_arburst(entries_0_io_ar_bits_arburst),
    .io_r_ready(entries_0_io_r_ready),
    .io_r_valid(entries_0_io_r_valid),
    .io_r_bits_rdata(entries_0_io_r_bits_rdata),
    .io_r_bits_rlast(entries_0_io_r_bits_rlast),
    .io_aw_ready(entries_0_io_aw_ready),
    .io_aw_valid(entries_0_io_aw_valid),
    .io_aw_bits_awid(entries_0_io_aw_bits_awid),
    .io_aw_bits_awaddr(entries_0_io_aw_bits_awaddr),
    .io_aw_bits_awlen(entries_0_io_aw_bits_awlen),
    .io_aw_bits_awburst(entries_0_io_aw_bits_awburst),
    .io_w_ready(entries_0_io_w_ready),
    .io_w_valid(entries_0_io_w_valid),
    .io_w_bits_wid(entries_0_io_w_bits_wid),
    .io_w_bits_wdata(entries_0_io_w_bits_wdata),
    .io_w_bits_wstrb(entries_0_io_w_bits_wstrb),
    .io_w_bits_wlast(entries_0_io_w_bits_wlast),
    .io_b_ready(entries_0_io_b_ready),
    .io_b_valid(entries_0_io_b_valid),
    .io_loadResp_ready(entries_0_io_loadResp_ready),
    .io_loadResp_valid(entries_0_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(entries_0_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(entries_0_io_loadResp_bits_data),
    .io_storeAck_ready(entries_0_io_storeAck_ready),
    .io_storeAck_valid(entries_0_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(entries_0_io_storeAck_bits_sqIdx),
    .io_arrayWrite_valid(entries_0_io_arrayWrite_valid),
    .io_arrayWrite_idx(entries_0_io_arrayWrite_idx),
    .io_arrayWrite_way(entries_0_io_arrayWrite_way),
    .io_arrayWrite_tag(entries_0_io_arrayWrite_tag),
    .io_arrayWrite_dirty(entries_0_io_arrayWrite_dirty),
    .io_arrayWrite_data(entries_0_io_arrayWrite_data),
    .io_replacerTouch_valid(entries_0_io_replacerTouch_valid),
    .io_replacerTouch_idx(entries_0_io_replacerTouch_idx),
    .io_replacerTouch_way(entries_0_io_replacerTouch_way),
    .io_busy(entries_0_io_busy),
    .io_isWriteback(entries_0_io_isWriteback),
    .io_setIdx(entries_0_io_setIdx),
    .io_blockOthers(entries_0_io_blockOthers),
    .io_canAcceptReq(entries_0_io_canAcceptReq)
  );
  DCacheMshrEntry entries_1 ( // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
    .clock(entries_1_clock),
    .reset(entries_1_reset),
    .io_id(entries_1_io_id),
    .io_req_ready(entries_1_io_req_ready),
    .io_req_valid(entries_1_io_req_valid),
    .io_req_bits_reqType(entries_1_io_req_bits_reqType),
    .io_req_bits_paddr(entries_1_io_req_bits_paddr),
    .io_req_bits_lqIdx(entries_1_io_req_bits_lqIdx),
    .io_req_bits_sqIdx(entries_1_io_req_bits_sqIdx),
    .io_req_bits_lsuOp(entries_1_io_req_bits_lsuOp),
    .io_req_bits_storeData(entries_1_io_req_bits_storeData),
    .io_req_bits_victimWay(entries_1_io_req_bits_victimWay),
    .io_req_bits_victimDirty(entries_1_io_req_bits_victimDirty),
    .io_req_bits_victimTag(entries_1_io_req_bits_victimTag),
    .io_req_bits_victimData(entries_1_io_req_bits_victimData),
    .io_ar_ready(entries_1_io_ar_ready),
    .io_ar_valid(entries_1_io_ar_valid),
    .io_ar_bits_arid(entries_1_io_ar_bits_arid),
    .io_ar_bits_araddr(entries_1_io_ar_bits_araddr),
    .io_ar_bits_arlen(entries_1_io_ar_bits_arlen),
    .io_ar_bits_arburst(entries_1_io_ar_bits_arburst),
    .io_r_ready(entries_1_io_r_ready),
    .io_r_valid(entries_1_io_r_valid),
    .io_r_bits_rdata(entries_1_io_r_bits_rdata),
    .io_r_bits_rlast(entries_1_io_r_bits_rlast),
    .io_aw_ready(entries_1_io_aw_ready),
    .io_aw_valid(entries_1_io_aw_valid),
    .io_aw_bits_awid(entries_1_io_aw_bits_awid),
    .io_aw_bits_awaddr(entries_1_io_aw_bits_awaddr),
    .io_aw_bits_awlen(entries_1_io_aw_bits_awlen),
    .io_aw_bits_awburst(entries_1_io_aw_bits_awburst),
    .io_w_ready(entries_1_io_w_ready),
    .io_w_valid(entries_1_io_w_valid),
    .io_w_bits_wid(entries_1_io_w_bits_wid),
    .io_w_bits_wdata(entries_1_io_w_bits_wdata),
    .io_w_bits_wstrb(entries_1_io_w_bits_wstrb),
    .io_w_bits_wlast(entries_1_io_w_bits_wlast),
    .io_b_ready(entries_1_io_b_ready),
    .io_b_valid(entries_1_io_b_valid),
    .io_loadResp_ready(entries_1_io_loadResp_ready),
    .io_loadResp_valid(entries_1_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(entries_1_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(entries_1_io_loadResp_bits_data),
    .io_storeAck_ready(entries_1_io_storeAck_ready),
    .io_storeAck_valid(entries_1_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(entries_1_io_storeAck_bits_sqIdx),
    .io_arrayWrite_valid(entries_1_io_arrayWrite_valid),
    .io_arrayWrite_idx(entries_1_io_arrayWrite_idx),
    .io_arrayWrite_way(entries_1_io_arrayWrite_way),
    .io_arrayWrite_tag(entries_1_io_arrayWrite_tag),
    .io_arrayWrite_dirty(entries_1_io_arrayWrite_dirty),
    .io_arrayWrite_data(entries_1_io_arrayWrite_data),
    .io_replacerTouch_valid(entries_1_io_replacerTouch_valid),
    .io_replacerTouch_idx(entries_1_io_replacerTouch_idx),
    .io_replacerTouch_way(entries_1_io_replacerTouch_way),
    .io_busy(entries_1_io_busy),
    .io_isWriteback(entries_1_io_isWriteback),
    .io_setIdx(entries_1_io_setIdx),
    .io_blockOthers(entries_1_io_blockOthers),
    .io_canAcceptReq(entries_1_io_canAcceptReq)
  );
  DCacheMshrEntry entries_2 ( // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
    .clock(entries_2_clock),
    .reset(entries_2_reset),
    .io_id(entries_2_io_id),
    .io_req_ready(entries_2_io_req_ready),
    .io_req_valid(entries_2_io_req_valid),
    .io_req_bits_reqType(entries_2_io_req_bits_reqType),
    .io_req_bits_paddr(entries_2_io_req_bits_paddr),
    .io_req_bits_lqIdx(entries_2_io_req_bits_lqIdx),
    .io_req_bits_sqIdx(entries_2_io_req_bits_sqIdx),
    .io_req_bits_lsuOp(entries_2_io_req_bits_lsuOp),
    .io_req_bits_storeData(entries_2_io_req_bits_storeData),
    .io_req_bits_victimWay(entries_2_io_req_bits_victimWay),
    .io_req_bits_victimDirty(entries_2_io_req_bits_victimDirty),
    .io_req_bits_victimTag(entries_2_io_req_bits_victimTag),
    .io_req_bits_victimData(entries_2_io_req_bits_victimData),
    .io_ar_ready(entries_2_io_ar_ready),
    .io_ar_valid(entries_2_io_ar_valid),
    .io_ar_bits_arid(entries_2_io_ar_bits_arid),
    .io_ar_bits_araddr(entries_2_io_ar_bits_araddr),
    .io_ar_bits_arlen(entries_2_io_ar_bits_arlen),
    .io_ar_bits_arburst(entries_2_io_ar_bits_arburst),
    .io_r_ready(entries_2_io_r_ready),
    .io_r_valid(entries_2_io_r_valid),
    .io_r_bits_rdata(entries_2_io_r_bits_rdata),
    .io_r_bits_rlast(entries_2_io_r_bits_rlast),
    .io_aw_ready(entries_2_io_aw_ready),
    .io_aw_valid(entries_2_io_aw_valid),
    .io_aw_bits_awid(entries_2_io_aw_bits_awid),
    .io_aw_bits_awaddr(entries_2_io_aw_bits_awaddr),
    .io_aw_bits_awlen(entries_2_io_aw_bits_awlen),
    .io_aw_bits_awburst(entries_2_io_aw_bits_awburst),
    .io_w_ready(entries_2_io_w_ready),
    .io_w_valid(entries_2_io_w_valid),
    .io_w_bits_wid(entries_2_io_w_bits_wid),
    .io_w_bits_wdata(entries_2_io_w_bits_wdata),
    .io_w_bits_wstrb(entries_2_io_w_bits_wstrb),
    .io_w_bits_wlast(entries_2_io_w_bits_wlast),
    .io_b_ready(entries_2_io_b_ready),
    .io_b_valid(entries_2_io_b_valid),
    .io_loadResp_ready(entries_2_io_loadResp_ready),
    .io_loadResp_valid(entries_2_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(entries_2_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(entries_2_io_loadResp_bits_data),
    .io_storeAck_ready(entries_2_io_storeAck_ready),
    .io_storeAck_valid(entries_2_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(entries_2_io_storeAck_bits_sqIdx),
    .io_arrayWrite_valid(entries_2_io_arrayWrite_valid),
    .io_arrayWrite_idx(entries_2_io_arrayWrite_idx),
    .io_arrayWrite_way(entries_2_io_arrayWrite_way),
    .io_arrayWrite_tag(entries_2_io_arrayWrite_tag),
    .io_arrayWrite_dirty(entries_2_io_arrayWrite_dirty),
    .io_arrayWrite_data(entries_2_io_arrayWrite_data),
    .io_replacerTouch_valid(entries_2_io_replacerTouch_valid),
    .io_replacerTouch_idx(entries_2_io_replacerTouch_idx),
    .io_replacerTouch_way(entries_2_io_replacerTouch_way),
    .io_busy(entries_2_io_busy),
    .io_isWriteback(entries_2_io_isWriteback),
    .io_setIdx(entries_2_io_setIdx),
    .io_blockOthers(entries_2_io_blockOthers),
    .io_canAcceptReq(entries_2_io_canAcceptReq)
  );
  DCacheMshrEntry entries_3 ( // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 299:55]
    .clock(entries_3_clock),
    .reset(entries_3_reset),
    .io_id(entries_3_io_id),
    .io_req_ready(entries_3_io_req_ready),
    .io_req_valid(entries_3_io_req_valid),
    .io_req_bits_reqType(entries_3_io_req_bits_reqType),
    .io_req_bits_paddr(entries_3_io_req_bits_paddr),
    .io_req_bits_lqIdx(entries_3_io_req_bits_lqIdx),
    .io_req_bits_sqIdx(entries_3_io_req_bits_sqIdx),
    .io_req_bits_lsuOp(entries_3_io_req_bits_lsuOp),
    .io_req_bits_storeData(entries_3_io_req_bits_storeData),
    .io_req_bits_victimWay(entries_3_io_req_bits_victimWay),
    .io_req_bits_victimDirty(entries_3_io_req_bits_victimDirty),
    .io_req_bits_victimTag(entries_3_io_req_bits_victimTag),
    .io_req_bits_victimData(entries_3_io_req_bits_victimData),
    .io_ar_ready(entries_3_io_ar_ready),
    .io_ar_valid(entries_3_io_ar_valid),
    .io_ar_bits_arid(entries_3_io_ar_bits_arid),
    .io_ar_bits_araddr(entries_3_io_ar_bits_araddr),
    .io_ar_bits_arlen(entries_3_io_ar_bits_arlen),
    .io_ar_bits_arburst(entries_3_io_ar_bits_arburst),
    .io_r_ready(entries_3_io_r_ready),
    .io_r_valid(entries_3_io_r_valid),
    .io_r_bits_rdata(entries_3_io_r_bits_rdata),
    .io_r_bits_rlast(entries_3_io_r_bits_rlast),
    .io_aw_ready(entries_3_io_aw_ready),
    .io_aw_valid(entries_3_io_aw_valid),
    .io_aw_bits_awid(entries_3_io_aw_bits_awid),
    .io_aw_bits_awaddr(entries_3_io_aw_bits_awaddr),
    .io_aw_bits_awlen(entries_3_io_aw_bits_awlen),
    .io_aw_bits_awburst(entries_3_io_aw_bits_awburst),
    .io_w_ready(entries_3_io_w_ready),
    .io_w_valid(entries_3_io_w_valid),
    .io_w_bits_wid(entries_3_io_w_bits_wid),
    .io_w_bits_wdata(entries_3_io_w_bits_wdata),
    .io_w_bits_wstrb(entries_3_io_w_bits_wstrb),
    .io_w_bits_wlast(entries_3_io_w_bits_wlast),
    .io_b_ready(entries_3_io_b_ready),
    .io_b_valid(entries_3_io_b_valid),
    .io_loadResp_ready(entries_3_io_loadResp_ready),
    .io_loadResp_valid(entries_3_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(entries_3_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(entries_3_io_loadResp_bits_data),
    .io_storeAck_ready(entries_3_io_storeAck_ready),
    .io_storeAck_valid(entries_3_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(entries_3_io_storeAck_bits_sqIdx),
    .io_arrayWrite_valid(entries_3_io_arrayWrite_valid),
    .io_arrayWrite_idx(entries_3_io_arrayWrite_idx),
    .io_arrayWrite_way(entries_3_io_arrayWrite_way),
    .io_arrayWrite_tag(entries_3_io_arrayWrite_tag),
    .io_arrayWrite_dirty(entries_3_io_arrayWrite_dirty),
    .io_arrayWrite_data(entries_3_io_arrayWrite_data),
    .io_replacerTouch_valid(entries_3_io_replacerTouch_valid),
    .io_replacerTouch_idx(entries_3_io_replacerTouch_idx),
    .io_replacerTouch_way(entries_3_io_replacerTouch_way),
    .io_busy(entries_3_io_busy),
    .io_isWriteback(entries_3_io_isWriteback),
    .io_setIdx(entries_3_io_setIdx),
    .io_blockOthers(entries_3_io_blockOthers),
    .io_canAcceptReq(entries_3_io_canAcceptReq)
  );
  assign io_req_ready = canAlloc & ~setConflict; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 313:28]
  assign io_axi_ar_data_arid = _io_axi_ar_data_arid_T_9 | _io_axi_ar_data_arid_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_araddr = _io_axi_ar_data_araddr_T_9 | _io_axi_ar_data_araddr_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arlen = _io_axi_ar_data_arlen_T_9 | _io_axi_ar_data_arlen_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arsize = _io_axi_ar_data_arsize_T_9 | _io_axi_ar_data_arsize_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arburst = _io_axi_ar_data_arburst_T_9 | _io_axi_ar_data_arburst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arvalid = |_arHasValid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 327:36]
  assign io_axi_aw_data_awid = _io_axi_aw_data_awid_T_9 | _io_axi_aw_data_awid_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awaddr = _io_axi_aw_data_awaddr_T_9 | _io_axi_aw_data_awaddr_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awlen = _io_axi_aw_data_awlen_T_9 | _io_axi_aw_data_awlen_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awsize = _io_axi_aw_data_awsize_T_9 | _io_axi_aw_data_awsize_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awburst = _io_axi_aw_data_awburst_T_9 | _io_axi_aw_data_awburst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awvalid = |_awHasValid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 356:36]
  assign io_axi_w_data_wid = _io_axi_w_data_wid_T_9 | _io_axi_w_data_wid_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wdata = _io_axi_w_data_wdata_T_9 | _io_axi_w_data_wdata_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wstrb = _io_axi_w_data_wstrb_T_9 | _io_axi_w_data_wstrb_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wlast = wSelectOH[0] & entries_0_io_w_bits_wlast | wSelectOH[1] & entries_1_io_w_bits_wlast |
    wSelectOH[2] & entries_2_io_w_bits_wlast | wSelectOH[3] & entries_3_io_w_bits_wlast; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wvalid = |_wHasValid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 376:34]
  assign io_axi_r_rready = rIdOH[0] & entries_0_io_r_ready | rIdOH[1] & entries_1_io_r_ready | rIdOH[2] &
    entries_2_io_r_ready | rIdOH[3] & entries_3_io_r_ready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_b_bready = bIdOH[0] & entries_0_io_b_ready | bIdOH[1] & entries_1_io_b_ready | bIdOH[2] &
    entries_2_io_b_ready | bIdOH[3] & entries_3_io_b_ready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadResp_valid = |_lrHasValid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 401:36]
  assign io_loadResp_bits_lqIdx = _io_loadResp_bits_lqIdx_T_9 | _io_loadResp_bits_lqIdx_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_loadResp_bits_data = _io_loadResp_bits_data_T_9 | _io_loadResp_bits_data_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_storeAck_valid = |_saHasValid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 414:36]
  assign io_storeAck_bits_sqIdx = _io_storeAck_bits_sqIdx_T_9 | _io_storeAck_bits_sqIdx_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_valid = |_io_arrayWrite_valid_T_10; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 429:88]
  assign io_arrayWrite_idx = _io_arrayWrite_idx_T_9 | _io_arrayWrite_idx_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_way = _io_arrayWrite_way_T_9 | _io_arrayWrite_way_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_tag = _io_arrayWrite_tag_T_9 | _io_arrayWrite_tag_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_dirty = awSelectOH2[0] & entries_0_io_arrayWrite_dirty | awSelectOH2[1] &
    entries_1_io_arrayWrite_dirty | awSelectOH2[2] & entries_2_io_arrayWrite_dirty | awSelectOH2[3] &
    entries_3_io_arrayWrite_dirty; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_data = _io_arrayWrite_data_T_9 | _io_arrayWrite_data_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_arrayWrite_wen = awSelectOH2[0] | awSelectOH2[1] | awSelectOH2[2] | awSelectOH2[3]; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_replacerTouch_valid = |_io_replacerTouch_valid_T_10; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 441:93]
  assign io_replacerTouch_idx = _io_replacerTouch_idx_T_9 | _io_replacerTouch_idx_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_replacerTouch_way = _io_replacerTouch_way_T_9 | _io_replacerTouch_way_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_mshrWriting = |_awHasValid2_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 426:38]
  assign entries_0_clock = clock;
  assign entries_0_reset = reset;
  assign entries_0_io_id = 2'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 317:23]
  assign entries_0_io_req_valid = io_req_valid & canAlloc & _io_req_ready_T & allocIdx == 2'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 320:68]
  assign entries_0_io_req_bits_reqType = io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_paddr = io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_lqIdx = io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_sqIdx = io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_lsuOp = io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_storeData = io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_victimWay = io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_victimDirty = io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_victimTag = io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_req_bits_victimData = io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_0_io_ar_ready = io_axi_ar_arready & arSelectOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 341:36]
  assign entries_0_io_r_valid = io_axi_r_data_rvalid & rIdOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 348:46]
  assign entries_0_io_r_bits_rdata = io_axi_r_data_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_0_io_r_bits_rlast = io_axi_r_data_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_0_io_aw_ready = io_axi_aw_awready & awSelectOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 370:36]
  assign entries_0_io_w_ready = io_axi_w_wready & wSelectOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 386:34]
  assign entries_0_io_b_valid = io_axi_b_data_bvalid & bIdOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 393:46]
  assign entries_0_io_loadResp_ready = io_loadResp_ready & lrSelectOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 408:50]
  assign entries_0_io_storeAck_ready = io_storeAck_ready & saSelectOH[0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 420:50]
  assign entries_1_clock = clock;
  assign entries_1_reset = reset;
  assign entries_1_io_id = 2'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 317:23]
  assign entries_1_io_req_valid = io_req_valid & canAlloc & _io_req_ready_T & allocIdx == 2'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 320:68]
  assign entries_1_io_req_bits_reqType = io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_paddr = io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_lqIdx = io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_sqIdx = io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_lsuOp = io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_storeData = io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_victimWay = io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_victimDirty = io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_victimTag = io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_req_bits_victimData = io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_1_io_ar_ready = io_axi_ar_arready & arSelectOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 341:36]
  assign entries_1_io_r_valid = io_axi_r_data_rvalid & rIdOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 348:46]
  assign entries_1_io_r_bits_rdata = io_axi_r_data_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_1_io_r_bits_rlast = io_axi_r_data_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_1_io_aw_ready = io_axi_aw_awready & awSelectOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 370:36]
  assign entries_1_io_w_ready = io_axi_w_wready & wSelectOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 386:34]
  assign entries_1_io_b_valid = io_axi_b_data_bvalid & bIdOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 393:46]
  assign entries_1_io_loadResp_ready = io_loadResp_ready & lrSelectOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 408:50]
  assign entries_1_io_storeAck_ready = io_storeAck_ready & saSelectOH[1]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 420:50]
  assign entries_2_clock = clock;
  assign entries_2_reset = reset;
  assign entries_2_io_id = 2'h2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 317:23]
  assign entries_2_io_req_valid = io_req_valid & canAlloc & _io_req_ready_T & allocIdx == 2'h2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 320:68]
  assign entries_2_io_req_bits_reqType = io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_paddr = io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_lqIdx = io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_sqIdx = io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_lsuOp = io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_storeData = io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_victimWay = io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_victimDirty = io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_victimTag = io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_req_bits_victimData = io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_2_io_ar_ready = io_axi_ar_arready & arSelectOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 341:36]
  assign entries_2_io_r_valid = io_axi_r_data_rvalid & rIdOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 348:46]
  assign entries_2_io_r_bits_rdata = io_axi_r_data_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_2_io_r_bits_rlast = io_axi_r_data_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_2_io_aw_ready = io_axi_aw_awready & awSelectOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 370:36]
  assign entries_2_io_w_ready = io_axi_w_wready & wSelectOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 386:34]
  assign entries_2_io_b_valid = io_axi_b_data_bvalid & bIdOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 393:46]
  assign entries_2_io_loadResp_ready = io_loadResp_ready & lrSelectOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 408:50]
  assign entries_2_io_storeAck_ready = io_storeAck_ready & saSelectOH[2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 420:50]
  assign entries_3_clock = clock;
  assign entries_3_reset = reset;
  assign entries_3_io_id = 2'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 317:23]
  assign entries_3_io_req_valid = io_req_valid & canAlloc & _io_req_ready_T & allocIdx == 2'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 320:68]
  assign entries_3_io_req_bits_reqType = io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_paddr = io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_lqIdx = io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_sqIdx = io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_lsuOp = io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_storeData = io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_victimWay = io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_victimDirty = io_req_bits_victimDirty; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_victimTag = io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_req_bits_victimData = io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 321:24]
  assign entries_3_io_ar_ready = io_axi_ar_arready & arSelectOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 341:36]
  assign entries_3_io_r_valid = io_axi_r_data_rvalid & rIdOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 348:46]
  assign entries_3_io_r_bits_rdata = io_axi_r_data_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_3_io_r_bits_rlast = io_axi_r_data_rlast; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 349:22]
  assign entries_3_io_aw_ready = io_axi_aw_awready & awSelectOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 370:36]
  assign entries_3_io_w_ready = io_axi_w_wready & wSelectOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 386:34]
  assign entries_3_io_b_valid = io_axi_b_data_bvalid & bIdOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 393:46]
  assign entries_3_io_loadResp_ready = io_loadResp_ready & lrSelectOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 408:50]
  assign entries_3_io_storeAck_ready = io_storeAck_ready & saSelectOH[3]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 420:50]
endmodule
