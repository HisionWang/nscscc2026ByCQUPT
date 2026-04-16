module ICacheMissUnit(
  input          clock,
  input          reset,
  input          io_req_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input  [31:0]  io_req_bits_addr, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input  [7:0]   io_req_bits_idx, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input  [17:0]  io_req_bits_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input  [1:0]   io_req_bits_victim_way, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_resp_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [511:0] io_resp_bits_data, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [7:0]   io_resp_bits_idx, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [17:0]  io_resp_bits_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_meta_write_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [7:0]   io_meta_write_idx, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [1:0]   io_meta_write_way, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_meta_write_data_0_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [17:0]  io_meta_write_data_0_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_meta_write_data_1_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [17:0]  io_meta_write_data_1_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_meta_write_data_2_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [17:0]  io_meta_write_data_2_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_meta_write_data_3_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [17:0]  io_meta_write_data_3_tag, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_data_write_valid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [7:0]   io_data_write_idx, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [1:0]   io_data_write_way, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [511:0] io_data_write_data, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [31:0]  io_axi_ar_out_araddr, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [7:0]   io_axi_ar_out_arlen, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [2:0]   io_axi_ar_out_arsize, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output [1:0]   io_axi_ar_out_arburst, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_axi_ar_out_arvalid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input          io_axi_ar_ready, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input  [31:0]  io_axi_r_in_rdata, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input          io_axi_r_in_rlast, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  input          io_axi_r_in_rvalid, // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
  output         io_axi_r_ready // @[src/main/scala/icache/ICacheMissUnit.scala 10:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/icache/ICacheMissUnit.scala 62:22]
  reg [31:0] req_addr; // @[src/main/scala/icache/ICacheMissUnit.scala 66:22]
  reg [7:0] req_idx; // @[src/main/scala/icache/ICacheMissUnit.scala 67:22]
  reg [17:0] req_tag; // @[src/main/scala/icache/ICacheMissUnit.scala 68:22]
  reg [1:0] req_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 69:27]
  reg [31:0] data_buffer_0; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_1; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_2; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_3; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_4; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_5; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_6; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_7; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_8; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_9; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_10; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_11; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_12; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_13; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_14; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [31:0] data_buffer_15; // @[src/main/scala/icache/ICacheMissUnit.scala 72:24]
  reg [4:0] data_count; // @[src/main/scala/icache/ICacheMissUnit.scala 73:24]
  wire [31:0] _GEN_8 = 4'h0 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_0; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_9 = 4'h1 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_1; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_10 = 4'h2 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_2; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_11 = 4'h3 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_3; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_12 = 4'h4 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_4; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_13 = 4'h5 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_5; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_14 = 4'h6 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_6; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_15 = 4'h7 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_7; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_16 = 4'h8 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_8; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_17 = 4'h9 == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_9; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_18 = 4'ha == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_10; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_19 = 4'hb == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_11; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_20 = 4'hc == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_12; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_21 = 4'hd == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_13; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_22 = 4'he == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_14; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [31:0] _GEN_23 = 4'hf == data_count[3:0] ? io_axi_r_in_rdata : data_buffer_15; // @[src/main/scala/icache/ICacheMissUnit.scala 157:{33,33} 72:24]
  wire [4:0] _data_count_T_1 = data_count + 5'h1; // @[src/main/scala/icache/ICacheMissUnit.scala 158:34]
  wire [2:0] _GEN_24 = io_axi_r_in_rlast ? 3'h3 : state; // @[src/main/scala/icache/ICacheMissUnit.scala 160:33 161:17 62:22]
  wire [2:0] _GEN_42 = io_axi_r_in_rvalid ? _GEN_24 : state; // @[src/main/scala/icache/ICacheMissUnit.scala 156:32 62:22]
  wire  _T_5 = 2'h0 == req_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 176:18]
  wire [17:0] _GEN_44 = 2'h0 == req_victim_way ? req_tag : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 176:38 178:39 181:39]
  wire  _T_6 = 2'h1 == req_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 176:18]
  wire [17:0] _GEN_46 = 2'h1 == req_victim_way ? req_tag : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 176:38 178:39 181:39]
  wire  _T_7 = 2'h2 == req_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 176:18]
  wire [17:0] _GEN_48 = 2'h2 == req_victim_way ? req_tag : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 176:38 178:39 181:39]
  wire  _T_8 = 2'h3 == req_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 176:18]
  wire [17:0] _GEN_50 = 2'h3 == req_victim_way ? req_tag : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 176:38 178:39 181:39]
  wire [255:0] io_data_write_data_lo = {data_buffer_7,data_buffer_6,data_buffer_5,data_buffer_4,data_buffer_3,
    data_buffer_2,data_buffer_1,data_buffer_0}; // @[src/main/scala/icache/ICacheMissUnit.scala 189:41]
  wire [511:0] _io_data_write_data_T = {data_buffer_15,data_buffer_14,data_buffer_13,data_buffer_12,data_buffer_11,
    data_buffer_10,data_buffer_9,data_buffer_8,io_data_write_data_lo}; // @[src/main/scala/icache/ICacheMissUnit.scala 189:41]
  wire [511:0] _GEN_52 = 3'h4 == state ? _io_data_write_data_T : 512'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 197:25 83:21]
  wire [7:0] _GEN_53 = 3'h4 == state ? req_idx : 8'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 198:24 84:20]
  wire [17:0] _GEN_54 = 3'h4 == state ? req_tag : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 199:24 85:20]
  wire [2:0] _GEN_55 = 3'h4 == state ? 3'h0 : state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 202:13 62:22]
  wire [31:0] _GEN_57 = 3'h4 == state ? 32'h0 : data_buffer_0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_58 = 3'h4 == state ? 32'h0 : data_buffer_1; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_59 = 3'h4 == state ? 32'h0 : data_buffer_2; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_60 = 3'h4 == state ? 32'h0 : data_buffer_3; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_61 = 3'h4 == state ? 32'h0 : data_buffer_4; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_62 = 3'h4 == state ? 32'h0 : data_buffer_5; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_63 = 3'h4 == state ? 32'h0 : data_buffer_6; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_64 = 3'h4 == state ? 32'h0 : data_buffer_7; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_65 = 3'h4 == state ? 32'h0 : data_buffer_8; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_66 = 3'h4 == state ? 32'h0 : data_buffer_9; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_67 = 3'h4 == state ? 32'h0 : data_buffer_10; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_68 = 3'h4 == state ? 32'h0 : data_buffer_11; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_69 = 3'h4 == state ? 32'h0 : data_buffer_12; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_70 = 3'h4 == state ? 32'h0 : data_buffer_13; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_71 = 3'h4 == state ? 32'h0 : data_buffer_14; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [31:0] _GEN_72 = 3'h4 == state ? 32'h0 : data_buffer_15; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 207:24 72:24]
  wire [7:0] _GEN_74 = 3'h3 == state ? req_idx : 8'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 171:25 89:21]
  wire [1:0] _GEN_75 = 3'h3 == state ? req_victim_way : 2'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 172:25 90:21]
  wire [17:0] _GEN_78 = 3'h3 == state ? _GEN_44 : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [17:0] _GEN_80 = 3'h3 == state ? _GEN_46 : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [17:0] _GEN_82 = 3'h3 == state ? _GEN_48 : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [17:0] _GEN_84 = 3'h3 == state ? _GEN_50 : 18'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [511:0] _GEN_85 = 3'h3 == state ? _io_data_write_data_T : 512'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 101:22 189:26]
  wire [2:0] _GEN_86 = 3'h3 == state ? 3'h4 : _GEN_55; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 191:13]
  wire  _GEN_87 = 3'h3 == state ? 1'h0 : 3'h4 == state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 82:17]
  wire [511:0] _GEN_88 = 3'h3 == state ? 512'h0 : _GEN_52; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 83:21]
  wire [7:0] _GEN_89 = 3'h3 == state ? 8'h0 : _GEN_53; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 84:20]
  wire [17:0] _GEN_90 = 3'h3 == state ? 18'h0 : _GEN_54; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 85:20]
  wire  _GEN_127 = 3'h2 == state ? 1'h0 : 3'h3 == state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 88:23]
  wire [7:0] _GEN_128 = 3'h2 == state ? 8'h0 : _GEN_74; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 89:21]
  wire [1:0] _GEN_129 = 3'h2 == state ? 2'h0 : _GEN_75; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 90:21]
  wire  _GEN_131 = 3'h2 == state ? 1'h0 : 3'h3 == state & _T_5; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_132 = 3'h2 == state ? 18'h0 : _GEN_78; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_133 = 3'h2 == state ? 1'h0 : 3'h3 == state & _T_6; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_134 = 3'h2 == state ? 18'h0 : _GEN_80; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_135 = 3'h2 == state ? 1'h0 : 3'h3 == state & _T_7; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_136 = 3'h2 == state ? 18'h0 : _GEN_82; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_137 = 3'h2 == state ? 1'h0 : 3'h3 == state & _T_8; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_138 = 3'h2 == state ? 18'h0 : _GEN_84; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [511:0] _GEN_139 = 3'h2 == state ? 512'h0 : _GEN_85; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 101:22]
  wire  _GEN_140 = 3'h2 == state ? 1'h0 : _GEN_87; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 82:17]
  wire [511:0] _GEN_141 = 3'h2 == state ? 512'h0 : _GEN_88; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 83:21]
  wire [7:0] _GEN_142 = 3'h2 == state ? 8'h0 : _GEN_89; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 84:20]
  wire [17:0] _GEN_143 = 3'h2 == state ? 18'h0 : _GEN_90; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 85:20]
  wire [31:0] _GEN_146 = 3'h1 == state ? req_addr : 32'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 105:25 137:29]
  wire [3:0] _GEN_147 = 3'h1 == state ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 106:25 138:29]
  wire [1:0] _GEN_148 = 3'h1 == state ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 107:25 139:29]
  wire  _GEN_152 = 3'h1 == state ? 1'h0 : 3'h2 == state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 115:18]
  wire  _GEN_169 = 3'h1 == state ? 1'h0 : _GEN_127; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 88:23]
  wire [7:0] _GEN_170 = 3'h1 == state ? 8'h0 : _GEN_128; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 89:21]
  wire [1:0] _GEN_171 = 3'h1 == state ? 2'h0 : _GEN_129; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 90:21]
  wire  _GEN_173 = 3'h1 == state ? 1'h0 : _GEN_131; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_174 = 3'h1 == state ? 18'h0 : _GEN_132; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_175 = 3'h1 == state ? 1'h0 : _GEN_133; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_176 = 3'h1 == state ? 18'h0 : _GEN_134; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_177 = 3'h1 == state ? 1'h0 : _GEN_135; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_178 = 3'h1 == state ? 18'h0 : _GEN_136; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire  _GEN_179 = 3'h1 == state ? 1'h0 : _GEN_137; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  wire [17:0] _GEN_180 = 3'h1 == state ? 18'h0 : _GEN_138; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  wire [511:0] _GEN_181 = 3'h1 == state ? 512'h0 : _GEN_139; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 101:22]
  wire  _GEN_182 = 3'h1 == state ? 1'h0 : _GEN_140; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 82:17]
  wire [511:0] _GEN_183 = 3'h1 == state ? 512'h0 : _GEN_141; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 83:21]
  wire [7:0] _GEN_184 = 3'h1 == state ? 8'h0 : _GEN_142; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 84:20]
  wire [17:0] _GEN_185 = 3'h1 == state ? 18'h0 : _GEN_143; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 85:20]
  wire [3:0] _GEN_196 = 3'h0 == state ? 4'h0 : _GEN_147; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 106:25]
  wire [1:0] _GEN_197 = 3'h0 == state ? 2'h0 : _GEN_148; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 107:25]
  wire  _GEN_198 = 3'h0 == state ? 1'h0 : 3'h1 == state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 108:25]
  assign io_resp_valid = 3'h0 == state ? 1'h0 : _GEN_182; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 82:17]
  assign io_resp_bits_data = 3'h0 == state ? 512'h0 : _GEN_183; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 83:21]
  assign io_resp_bits_idx = 3'h0 == state ? 8'h0 : _GEN_184; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 84:20]
  assign io_resp_bits_tag = 3'h0 == state ? 18'h0 : _GEN_185; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 85:20]
  assign io_meta_write_valid = 3'h0 == state ? 1'h0 : _GEN_169; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 88:23]
  assign io_meta_write_idx = 3'h0 == state ? 8'h0 : _GEN_170; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 89:21]
  assign io_meta_write_way = 3'h0 == state ? 2'h0 : _GEN_171; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 90:21]
  assign io_meta_write_data_0_valid = 3'h0 == state ? 1'h0 : _GEN_173; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  assign io_meta_write_data_0_tag = 3'h0 == state ? 18'h0 : _GEN_174; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  assign io_meta_write_data_1_valid = 3'h0 == state ? 1'h0 : _GEN_175; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  assign io_meta_write_data_1_tag = 3'h0 == state ? 18'h0 : _GEN_176; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  assign io_meta_write_data_2_valid = 3'h0 == state ? 1'h0 : _GEN_177; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  assign io_meta_write_data_2_tag = 3'h0 == state ? 18'h0 : _GEN_178; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  assign io_meta_write_data_3_valid = 3'h0 == state ? 1'h0 : _GEN_179; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 93:33]
  assign io_meta_write_data_3_tag = 3'h0 == state ? 18'h0 : _GEN_180; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 94:31]
  assign io_data_write_valid = 3'h0 == state ? 1'h0 : _GEN_169; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 88:23]
  assign io_data_write_idx = 3'h0 == state ? 8'h0 : _GEN_170; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 89:21]
  assign io_data_write_way = 3'h0 == state ? 2'h0 : _GEN_171; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 90:21]
  assign io_data_write_data = 3'h0 == state ? 512'h0 : _GEN_181; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 101:22]
  assign io_axi_ar_out_araddr = 3'h0 == state ? 32'h0 : _GEN_146; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 105:25]
  assign io_axi_ar_out_arlen = {{4'd0}, _GEN_196};
  assign io_axi_ar_out_arsize = {{1'd0}, _GEN_197};
  assign io_axi_ar_out_arburst = {{1'd0}, _GEN_198};
  assign io_axi_ar_out_arvalid = 3'h0 == state ? 1'h0 : 3'h1 == state; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 108:25]
  assign io_axi_r_ready = 3'h0 == state ? 1'h0 : _GEN_152; // @[src/main/scala/icache/ICacheMissUnit.scala 118:17 115:18]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheMissUnit.scala 62:22]
      state <= 3'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 62:22]
    end else if (3'h0 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_req_valid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 123:26]
        state <= 3'h1; // @[src/main/scala/icache/ICacheMissUnit.scala 130:15]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_axi_ar_ready) begin // @[src/main/scala/icache/ICacheMissUnit.scala 146:29]
        state <= 3'h2; // @[src/main/scala/icache/ICacheMissUnit.scala 147:15]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      state <= _GEN_42;
    end else begin
      state <= _GEN_86;
    end
    if (3'h0 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_req_valid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 123:26]
        req_addr <= io_req_bits_addr; // @[src/main/scala/icache/ICacheMissUnit.scala 125:19]
      end
    end
    if (3'h0 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_req_valid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 123:26]
        req_idx <= io_req_bits_idx; // @[src/main/scala/icache/ICacheMissUnit.scala 126:19]
      end
    end
    if (3'h0 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_req_valid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 123:26]
        req_tag <= io_req_bits_tag; // @[src/main/scala/icache/ICacheMissUnit.scala 127:19]
      end
    end
    if (3'h0 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (io_req_valid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 123:26]
        req_victim_way <= io_req_bits_victim_way; // @[src/main/scala/icache/ICacheMissUnit.scala 128:24]
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_0 <= _GEN_8;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_0 <= _GEN_57;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_1 <= _GEN_9;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_1 <= _GEN_58;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_2 <= _GEN_10;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_2 <= _GEN_59;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_3 <= _GEN_11;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_3 <= _GEN_60;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_4 <= _GEN_12;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_4 <= _GEN_61;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_5 <= _GEN_13;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_5 <= _GEN_62;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_6 <= _GEN_14;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_6 <= _GEN_63;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_7 <= _GEN_15;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_7 <= _GEN_64;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_8 <= _GEN_16;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_8 <= _GEN_65;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_9 <= _GEN_17;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_9 <= _GEN_66;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_10 <= _GEN_18;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_10 <= _GEN_67;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_11 <= _GEN_19;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_11 <= _GEN_68;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_12 <= _GEN_20;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_12 <= _GEN_69;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_13 <= _GEN_21;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_13 <= _GEN_70;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_14 <= _GEN_22;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_14 <= _GEN_71;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
            data_buffer_15 <= _GEN_23;
          end
        end else if (!(3'h3 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
          data_buffer_15 <= _GEN_72;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
      if (3'h1 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (io_axi_ar_ready) begin // @[src/main/scala/icache/ICacheMissUnit.scala 146:29]
          data_count <= 5'h0; // @[src/main/scala/icache/ICacheMissUnit.scala 148:20]
        end
      end else if (3'h2 == state) begin // @[src/main/scala/icache/ICacheMissUnit.scala 118:17]
        if (io_axi_r_in_rvalid) begin // @[src/main/scala/icache/ICacheMissUnit.scala 156:32]
          data_count <= _data_count_T_1; // @[src/main/scala/icache/ICacheMissUnit.scala 158:20]
        end
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  req_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  req_idx = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  req_tag = _RAND_3[17:0];
  _RAND_4 = {1{`RANDOM}};
  req_victim_way = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  data_buffer_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_buffer_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  data_buffer_2 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  data_buffer_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  data_buffer_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  data_buffer_5 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  data_buffer_6 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  data_buffer_7 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  data_buffer_8 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  data_buffer_9 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  data_buffer_10 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  data_buffer_11 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data_buffer_12 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  data_buffer_13 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  data_buffer_14 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  data_buffer_15 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  data_count = _RAND_21[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
