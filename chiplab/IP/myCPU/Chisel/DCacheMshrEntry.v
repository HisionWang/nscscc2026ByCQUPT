module DCacheMshrEntry(
  input          clock,
  input          reset,
  input  [1:0]   io_id, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_req_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_req_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [2:0]   io_req_bits_reqType, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [31:0]  io_req_bits_paddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [3:0]   io_req_bits_lqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [3:0]   io_req_bits_sqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [3:0]   io_req_bits_lsuOp, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [31:0]  io_req_bits_storeData, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [1:0]   io_req_bits_victimWay, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_req_bits_victimDirty, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [17:0]  io_req_bits_victimTag, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [511:0] io_req_bits_victimData, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_ar_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_ar_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_ar_bits_arid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [31:0]  io_ar_bits_araddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [7:0]   io_ar_bits_arlen, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [1:0]   io_ar_bits_arburst, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_r_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_r_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input  [31:0]  io_r_bits_rdata, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_r_bits_rlast, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_aw_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_aw_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_aw_bits_awid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [31:0]  io_aw_bits_awaddr, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [7:0]   io_aw_bits_awlen, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [1:0]   io_aw_bits_awburst, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_w_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_w_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_w_bits_wid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [31:0]  io_w_bits_wdata, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_w_bits_wstrb, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_w_bits_wlast, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_b_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_b_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_loadResp_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_loadResp_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_loadResp_bits_lqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [31:0]  io_loadResp_bits_data, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  input          io_storeAck_ready, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_storeAck_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [3:0]   io_storeAck_bits_sqIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_arrayWrite_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [7:0]   io_arrayWrite_idx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [1:0]   io_arrayWrite_way, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [17:0]  io_arrayWrite_tag, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_arrayWrite_dirty, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [511:0] io_arrayWrite_data, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_replacerTouch_valid, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [7:0]   io_replacerTouch_idx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [1:0]   io_replacerTouch_way, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_busy, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_isWriteback, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output [7:0]   io_setIdx, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_blockOthers, // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
  output         io_canAcceptReq // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 13:14]
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
  reg [511:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 60:22]
  reg [2:0] reqReg_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [31:0] reqReg_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [3:0] reqReg_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [3:0] reqReg_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [3:0] reqReg_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [31:0] reqReg_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [1:0] reqReg_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [17:0] reqReg_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [511:0] reqReg_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 63:23]
  reg [4:0] beatCnt; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 65:27]
  reg [31:0] refillBuf_0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_10; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_11; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_12; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_13; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_14; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  reg [31:0] refillBuf_15; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 66:23]
  wire  _io_isWriteback_T = state == 4'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 70:27]
  wire  _io_isWriteback_T_1 = state == 4'h2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 70:48]
  wire  _io_isWriteback_T_3 = state == 4'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 70:68]
  wire  _io_canAcceptReq_T = state == 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 73:28]
  wire  _T_2 = reqReg_reqType == 3'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 77:69]
  wire  _T_3 = reqReg_reqType == 3'h0 | reqReg_reqType == 3'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 77:51]
  wire  _T_9 = io_req_ready & io_req_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _state_T = io_req_bits_victimDirty ? 4'h1 : 4'h4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 90:37]
  wire [3:0] _state_T_3 = 3'h0 == io_req_bits_reqType ? _state_T : 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 89:54]
  wire [3:0] _state_T_5 = 3'h1 == io_req_bits_reqType ? _state_T : _state_T_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 89:54]
  wire [3:0] _state_T_7 = 3'h2 == io_req_bits_reqType ? 4'h1 : _state_T_5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 89:54]
  wire [3:0] _state_T_9 = 3'h3 == io_req_bits_reqType ? 4'h8 : _state_T_7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 89:54]
  wire [3:0] _state_T_11 = 3'h4 == io_req_bits_reqType ? 4'ha : _state_T_9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 89:54]
  wire [4:0] _GEN_16 = _T_9 ? 5'h0 : beatCnt; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21 88:13 65:27]
  wire [3:0] _GEN_17 = _T_9 ? _state_T_11 : state; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21 89:13 60:22]
  wire [31:0] refillAddr = {reqReg_paddr[31:6],6'h0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 99:23]
  wire  _io_ar_valid_T = state == 4'h4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 100:24]
  wire  _io_ar_valid_T_1 = state == 4'h8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 100:49]
  wire [3:0] _io_ar_bits_arlen_T_1 = _io_ar_valid_T_1 ? 4'h0 : 4'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 103:28]
  wire  _io_ar_bits_arburst_T_1 = _io_ar_valid_T_1 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 105:28]
  wire  _T_11 = io_ar_ready & io_ar_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_18 = _io_ar_valid_T & _T_11 ? 4'h5 : _GEN_17; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 112:{45,53}]
  wire [3:0] _GEN_19 = _io_ar_valid_T_1 & _T_11 ? 4'h9 : _GEN_18; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 113:{45,53}]
  wire  _io_r_ready_T = state == 4'h5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 116:23]
  wire  _io_r_ready_T_1 = state == 4'h9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 116:47]
  wire  _T_17 = io_r_ready & io_r_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [4:0] _beatCnt_T_1 = beatCnt + 5'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 120:24]
  wire [4:0] _GEN_36 = io_r_bits_rlast ? 5'h0 : _beatCnt_T_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 120:13 121:27 122:15]
  wire [3:0] _GEN_37 = io_r_bits_rlast ? 4'h6 : _GEN_19; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 121:27 123:13]
  wire [4:0] _GEN_54 = _io_r_ready_T & _T_17 ? _GEN_36 : _GEN_16; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
  wire [3:0] _GEN_55 = _io_r_ready_T & _T_17 ? _GEN_37 : _GEN_19; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
  wire [3:0] _GEN_57 = _io_r_ready_T_1 & _T_17 ? 4'h7 : _GEN_55; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 127:39 129:11]
  wire [31:0] wbAddr = {reqReg_victimTag,reqReg_paddr[13:6],6'h0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 133:19]
  wire  _io_aw_valid_T_1 = state == 4'ha; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 134:45]
  wire [3:0] _io_aw_bits_awlen_T_1 = _io_aw_valid_T_1 ? 4'h0 : 4'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 137:28]
  wire  _io_aw_bits_awburst_T_1 = _io_aw_valid_T_1 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 139:28]
  wire  _T_24 = io_aw_ready & io_aw_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_58 = _io_isWriteback_T & _T_24 ? 4'h2 : _GEN_57; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 144:{41,49}]
  wire [3:0] _GEN_60 = _io_aw_valid_T_1 & _T_24 ? 4'hb : _GEN_58; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 145:{41,49}]
  wire [31:0] wbDataVec_0 = reqReg_victimData[31:0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_1 = reqReg_victimData[63:32]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_2 = reqReg_victimData[95:64]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_3 = reqReg_victimData[127:96]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_4 = reqReg_victimData[159:128]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_5 = reqReg_victimData[191:160]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_6 = reqReg_victimData[223:192]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_7 = reqReg_victimData[255:224]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_8 = reqReg_victimData[287:256]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_9 = reqReg_victimData[319:288]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_10 = reqReg_victimData[351:320]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_11 = reqReg_victimData[383:352]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_12 = reqReg_victimData[415:384]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_13 = reqReg_victimData[447:416]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_14 = reqReg_victimData[479:448]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [31:0] wbDataVec_15 = reqReg_victimData[511:480]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 148:74]
  wire [3:0] _ucWstrb_T_1 = 4'h4 == reqReg_lsuOp ? 4'h1 : 4'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 150:52]
  wire [3:0] _ucWstrb_T_3 = 4'h5 == reqReg_lsuOp ? 4'h3 : _ucWstrb_T_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 150:52]
  wire [3:0] ucWstrb = 4'h6 == reqReg_lsuOp ? 4'hf : _ucWstrb_T_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 150:52]
  wire  _io_w_valid_T_1 = state == 4'hb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 156:43]
  wire  _io_w_valid_T_2 = _io_isWriteback_T_1 | state == 4'hb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 156:34]
  wire [31:0] _GEN_63 = 4'h1 == beatCnt[3:0] ? wbDataVec_1 : wbDataVec_0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_64 = 4'h2 == beatCnt[3:0] ? wbDataVec_2 : _GEN_63; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_65 = 4'h3 == beatCnt[3:0] ? wbDataVec_3 : _GEN_64; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_66 = 4'h4 == beatCnt[3:0] ? wbDataVec_4 : _GEN_65; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_67 = 4'h5 == beatCnt[3:0] ? wbDataVec_5 : _GEN_66; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_68 = 4'h6 == beatCnt[3:0] ? wbDataVec_6 : _GEN_67; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_69 = 4'h7 == beatCnt[3:0] ? wbDataVec_7 : _GEN_68; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_70 = 4'h8 == beatCnt[3:0] ? wbDataVec_8 : _GEN_69; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_71 = 4'h9 == beatCnt[3:0] ? wbDataVec_9 : _GEN_70; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_72 = 4'ha == beatCnt[3:0] ? wbDataVec_10 : _GEN_71; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_73 = 4'hb == beatCnt[3:0] ? wbDataVec_11 : _GEN_72; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_74 = 4'hc == beatCnt[3:0] ? wbDataVec_12 : _GEN_73; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_75 = 4'hd == beatCnt[3:0] ? wbDataVec_13 : _GEN_74; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_76 = 4'he == beatCnt[3:0] ? wbDataVec_14 : _GEN_75; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire [31:0] _GEN_77 = 4'hf == beatCnt[3:0] ? wbDataVec_15 : _GEN_76; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:{25,25}]
  wire  _T_32 = io_w_ready & io_w_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _state_T_13 = _io_w_valid_T_1 ? 4'hc : 4'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 166:19]
  wire [3:0] _GEN_78 = io_w_bits_wlast ? _state_T_13 : _GEN_60; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 165:27 166:13]
  wire [3:0] _GEN_81 = _io_w_valid_T_2 & _T_32 ? _GEN_78 : _GEN_60; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 163:61]
  wire  _io_b_ready_T_1 = state == 4'hc; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 172:43]
  wire  _T_35 = io_b_ready & io_b_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _state_T_15 = reqReg_reqType == 3'h2 ? 4'h0 : 4'h4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 175:17]
  wire [3:0] _GEN_82 = _io_isWriteback_T_3 & _T_35 ? _state_T_15 : _GEN_81; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 174:39 175:11]
  wire [3:0] _GEN_83 = _io_b_ready_T_1 & _T_35 ? 4'h7 : _GEN_82; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 178:39 179:11]
  wire [3:0] storeWordOff = reqReg_paddr[5:2]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 186:34]
  wire  _T_40 = reqReg_reqType == 3'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 191:23]
  wire  _T_41 = storeWordOff == 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_84 = storeWordOff == 4'h0 ? reqReg_storeData : refillBuf_0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_42 = storeWordOff == 4'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_85 = storeWordOff == 4'h1 ? reqReg_storeData : refillBuf_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_43 = storeWordOff == 4'h2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_86 = storeWordOff == 4'h2 ? reqReg_storeData : refillBuf_2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_44 = storeWordOff == 4'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_87 = storeWordOff == 4'h3 ? reqReg_storeData : refillBuf_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_45 = storeWordOff == 4'h4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_88 = storeWordOff == 4'h4 ? reqReg_storeData : refillBuf_4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_46 = storeWordOff == 4'h5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_89 = storeWordOff == 4'h5 ? reqReg_storeData : refillBuf_5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_47 = storeWordOff == 4'h6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_90 = storeWordOff == 4'h6 ? reqReg_storeData : refillBuf_6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_48 = storeWordOff == 4'h7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_91 = storeWordOff == 4'h7 ? reqReg_storeData : refillBuf_7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_49 = storeWordOff == 4'h8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_92 = storeWordOff == 4'h8 ? reqReg_storeData : refillBuf_8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_50 = storeWordOff == 4'h9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_93 = storeWordOff == 4'h9 ? reqReg_storeData : refillBuf_9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_51 = storeWordOff == 4'ha; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_94 = storeWordOff == 4'ha ? reqReg_storeData : refillBuf_10; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_52 = storeWordOff == 4'hb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_95 = storeWordOff == 4'hb ? reqReg_storeData : refillBuf_11; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_53 = storeWordOff == 4'hc; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_96 = storeWordOff == 4'hc ? reqReg_storeData : refillBuf_12; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_54 = storeWordOff == 4'hd; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_97 = storeWordOff == 4'hd ? reqReg_storeData : refillBuf_13; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_55 = storeWordOff == 4'he; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_98 = storeWordOff == 4'he ? reqReg_storeData : refillBuf_14; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire  _T_56 = storeWordOff == 4'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 193:25]
  wire [31:0] _GEN_99 = storeWordOff == 4'hf ? reqReg_storeData : refillBuf_15; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 193:34 194:24]
  wire [31:0] refillWords_0 = reqReg_reqType == 3'h1 ? _GEN_84 : refillBuf_0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_1 = reqReg_reqType == 3'h1 ? _GEN_85 : refillBuf_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_2 = reqReg_reqType == 3'h1 ? _GEN_86 : refillBuf_2; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_3 = reqReg_reqType == 3'h1 ? _GEN_87 : refillBuf_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_4 = reqReg_reqType == 3'h1 ? _GEN_88 : refillBuf_4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_5 = reqReg_reqType == 3'h1 ? _GEN_89 : refillBuf_5; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_6 = reqReg_reqType == 3'h1 ? _GEN_90 : refillBuf_6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_7 = reqReg_reqType == 3'h1 ? _GEN_91 : refillBuf_7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_8 = reqReg_reqType == 3'h1 ? _GEN_92 : refillBuf_8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_9 = reqReg_reqType == 3'h1 ? _GEN_93 : refillBuf_9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_10 = reqReg_reqType == 3'h1 ? _GEN_94 : refillBuf_10; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_11 = reqReg_reqType == 3'h1 ? _GEN_95 : refillBuf_11; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_12 = reqReg_reqType == 3'h1 ? _GEN_96 : refillBuf_12; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_13 = reqReg_reqType == 3'h1 ? _GEN_97 : refillBuf_13; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_14 = reqReg_reqType == 3'h1 ? _GEN_98 : refillBuf_14; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [31:0] refillWords_15 = reqReg_reqType == 3'h1 ? _GEN_99 : refillBuf_15; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 189:20 191:52]
  wire [255:0] mergedLine_lo = {refillWords_7,refillWords_6,refillWords_5,refillWords_4,refillWords_3,refillWords_2,
    refillWords_1,refillWords_0}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 198:23]
  wire [255:0] mergedLine_hi = {refillWords_15,refillWords_14,refillWords_13,refillWords_12,refillWords_11,
    refillWords_10,refillWords_9,refillWords_8}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 198:23]
  wire  _io_arrayWrite_valid_T = state == 4'h6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 200:32]
  wire [3:0] _GEN_116 = _io_arrayWrite_valid_T ? 4'h7 : _GEN_83; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 212:33 213:11]
  wire [31:0] _GEN_117 = _T_41 ? refillBuf_0 : 32'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 219:15 221:31 222:19]
  wire [31:0] _GEN_118 = _T_42 ? refillBuf_1 : _GEN_117; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_119 = _T_43 ? refillBuf_2 : _GEN_118; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_120 = _T_44 ? refillBuf_3 : _GEN_119; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_121 = _T_45 ? refillBuf_4 : _GEN_120; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_122 = _T_46 ? refillBuf_5 : _GEN_121; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_123 = _T_47 ? refillBuf_6 : _GEN_122; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_124 = _T_48 ? refillBuf_7 : _GEN_123; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_125 = _T_49 ? refillBuf_8 : _GEN_124; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_126 = _T_50 ? refillBuf_9 : _GEN_125; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_127 = _T_51 ? refillBuf_10 : _GEN_126; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_128 = _T_52 ? refillBuf_11 : _GEN_127; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_129 = _T_53 ? refillBuf_12 : _GEN_128; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_130 = _T_54 ? refillBuf_13 : _GEN_129; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] _GEN_131 = _T_55 ? refillBuf_14 : _GEN_130; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [31:0] loadRawWord = _T_56 ? refillBuf_15 : _GEN_131; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 221:31 222:19]
  wire [1:0] loadByteOff = reqReg_paddr[1:0]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 226:33]
  wire [31:0] _loadShifted_T_1 = {8'h0,loadRawWord[31:8]}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 229:15]
  wire [31:0] _loadShifted_T_3 = {16'h0,loadRawWord[31:16]}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 230:15]
  wire [31:0] _loadShifted_T_5 = {24'h0,loadRawWord[31:24]}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 231:15]
  wire [31:0] _loadShifted_T_7 = 2'h1 == loadByteOff ? _loadShifted_T_1 : loadRawWord; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 227:56]
  wire [31:0] _loadShifted_T_9 = 2'h2 == loadByteOff ? _loadShifted_T_3 : _loadShifted_T_7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 227:56]
  wire [31:0] loadShifted = 2'h3 == loadByteOff ? _loadShifted_T_5 : _loadShifted_T_9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 227:56]
  wire  isStore = _T_40 | reqReg_reqType == 3'h4; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 235:60]
  wire  _io_loadResp_valid_T = state == 4'h7; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 237:36]
  wire  _T_75 = io_loadResp_ready & io_loadResp_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_77 = io_storeAck_ready & io_storeAck_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign io_req_ready = state == 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 84:25]
  assign io_ar_valid = state == 4'h4 | state == 4'h8; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 100:40]
  assign io_ar_bits_arid = {{2'd0}, io_id}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 101:22]
  assign io_ar_bits_araddr = _io_ar_valid_T_1 ? reqReg_paddr : refillAddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 102:28]
  assign io_ar_bits_arlen = {{4'd0}, _io_ar_bits_arlen_T_1}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 103:22]
  assign io_ar_bits_arburst = {{1'd0}, _io_ar_bits_arburst_T_1}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 105:22]
  assign io_r_ready = state == 4'h5 | state == 4'h9; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 116:38]
  assign io_aw_valid = _io_isWriteback_T | state == 4'ha; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 134:36]
  assign io_aw_bits_awid = {{2'd0}, io_id}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 135:22]
  assign io_aw_bits_awaddr = _io_aw_valid_T_1 ? reqReg_paddr : wbAddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 136:28]
  assign io_aw_bits_awlen = {{4'd0}, _io_aw_bits_awlen_T_1}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 137:22]
  assign io_aw_bits_awburst = {{1'd0}, _io_aw_bits_awburst_T_1}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 139:22]
  assign io_w_valid = _io_isWriteback_T_1 | state == 4'hb; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 156:34]
  assign io_w_bits_wid = {{2'd0}, io_id}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 157:19]
  assign io_w_bits_wdata = _io_w_valid_T_1 ? reqReg_storeData : _GEN_77; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 158:25]
  assign io_w_bits_wstrb = _io_w_valid_T_1 ? ucWstrb : 4'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 159:25]
  assign io_w_bits_wlast = _io_w_valid_T_1 | beatCnt == 5'hf; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 160:25]
  assign io_b_ready = _io_isWriteback_T_3 | state == 4'hc; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 172:34]
  assign io_loadResp_valid = _io_canAcceptReq_T ? 1'h0 : state == 4'h7 & _T_3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 251:26 237:27 254:28]
  assign io_loadResp_bits_lqIdx = reqReg_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 238:27]
  assign io_loadResp_bits_data = _T_2 ? refillBuf_0 : loadShifted; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 239:33]
  assign io_storeAck_valid = _io_canAcceptReq_T ? 1'h0 : _io_loadResp_valid_T & isStore; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 251:26 241:27 255:28]
  assign io_storeAck_bits_sqIdx = reqReg_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 242:27]
  assign io_arrayWrite_valid = _io_canAcceptReq_T ? 1'h0 : state == 4'h6; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 200:23 251:26 252:28]
  assign io_arrayWrite_idx = reqReg_paddr[13:6]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 183:28]
  assign io_arrayWrite_way = reqReg_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 202:23]
  assign io_arrayWrite_tag = reqReg_paddr[31:14]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 203:38]
  assign io_arrayWrite_dirty = reqReg_reqType == 3'h1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 204:41]
  assign io_arrayWrite_data = {mergedLine_hi,mergedLine_lo}; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 198:23]
  assign io_replacerTouch_valid = _io_canAcceptReq_T ? 1'h0 : _io_arrayWrite_valid_T; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 208:26 251:26 253:28]
  assign io_replacerTouch_idx = reqReg_paddr[13:6]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 183:28]
  assign io_replacerTouch_way = reqReg_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 210:26]
  assign io_busy = state != 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 69:27]
  assign io_isWriteback = state == 4'h1 | state == 4'h2 | state == 4'h3; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 70:59]
  assign io_setIdx = reqReg_paddr[13:6]; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 71:33]
  assign io_blockOthers = io_isWriteback; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 72:18]
  assign io_canAcceptReq = state == 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 73:28]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 60:22]
      state <= 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 60:22]
    end else if (_io_loadResp_valid_T) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 244:31]
      if (_T_75 | _T_77) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 245:59]
        state <= 4'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 246:15]
      end else begin
        state <= _GEN_116;
      end
    end else begin
      state <= _GEN_116;
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_reqType <= io_req_bits_reqType; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_paddr <= io_req_bits_paddr; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_lqIdx <= io_req_bits_lqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_sqIdx <= io_req_bits_sqIdx; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_lsuOp <= io_req_bits_lsuOp; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_storeData <= io_req_bits_storeData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_victimWay <= io_req_bits_victimWay; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_victimTag <= io_req_bits_victimTag; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (_T_9) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 85:21]
      reqReg_victimData <= io_req_bits_victimData; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 86:13]
    end
    if (reset) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 65:27]
      beatCnt <= 5'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 65:27]
    end else if (_io_w_valid_T_2 & _T_32) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 163:61]
      if (io_w_bits_wlast) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 165:27]
        beatCnt <= 5'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 167:15]
      end else begin
        beatCnt <= _beatCnt_T_1; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 164:13]
      end
    end else if (_io_aw_valid_T_1 & _T_24) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 145:41]
      beatCnt <= 5'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 145:68]
    end else if (_io_isWriteback_T & _T_24) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 144:41]
      beatCnt <= 5'h0; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 144:68]
    end else begin
      beatCnt <= _GEN_54;
    end
    if (_io_r_ready_T_1 & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 127:39]
      refillBuf_0 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 128:18]
    end else if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h0 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_0 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h1 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_1 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h2 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_2 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h3 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_3 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h4 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_4 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h5 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_5 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h6 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_6 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h7 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_7 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h8 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_8 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'h9 == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_9 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'ha == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_10 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'hb == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_11 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'hc == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_12 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'hd == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_13 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'he == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_14 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
    end
    if (_io_r_ready_T & _T_17) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 118:43]
      if (4'hf == beatCnt[3:0]) begin // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
        refillBuf_15 <= io_r_bits_rdata; // @[\\src\\main\\scala\\memory\\dcache\\DCacheMSHR.scala 119:24]
      end
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
  state = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  reqReg_reqType = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  reqReg_paddr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reqReg_lqIdx = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  reqReg_sqIdx = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  reqReg_lsuOp = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  reqReg_storeData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reqReg_victimWay = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  reqReg_victimTag = _RAND_8[17:0];
  _RAND_9 = {16{`RANDOM}};
  reqReg_victimData = _RAND_9[511:0];
  _RAND_10 = {1{`RANDOM}};
  beatCnt = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  refillBuf_0 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  refillBuf_1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  refillBuf_2 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  refillBuf_3 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  refillBuf_4 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  refillBuf_5 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  refillBuf_6 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  refillBuf_7 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  refillBuf_8 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  refillBuf_9 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  refillBuf_10 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  refillBuf_11 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  refillBuf_12 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  refillBuf_13 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  refillBuf_14 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  refillBuf_15 = _RAND_26[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
