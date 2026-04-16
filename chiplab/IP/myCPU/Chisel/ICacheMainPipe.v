module ICacheMainPipe(
  input          clock,
  input          reset,
  input  [31:0]  io_cpu_req_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_cpu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_cpu_resp_instrs_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_cpu_resp_instrs_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_cpu_resp_instrs_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_cpu_resp_instrs_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_cpu_resp_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_cpu_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_meta_read_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_meta_read_req_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_meta_read_resp_data_0_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_meta_read_resp_data_0_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_meta_read_resp_data_1_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_meta_read_resp_data_1_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_meta_read_resp_data_2_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_meta_read_resp_data_2_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_meta_read_resp_data_3_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_meta_read_resp_data_3_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_data_read_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_data_read_req_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_data_read_resp_data_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_data_read_resp_data_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_data_read_resp_data_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_data_read_resp_data_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_miss_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_miss_req_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_miss_req_bits_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [17:0]  io_miss_req_bits_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_miss_req_bits_victim_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_miss_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_miss_resp_bits_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [7:0]   io_miss_resp_bits_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_miss_resp_bits_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_replacer_touch_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_replacer_touch_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_replacer_touch_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_replacer_victim_req, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_replacer_victim_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [1:0]   io_replacer_victim_resp // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 119:25]
  reg [31:0] s0_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 120:21]
  wire [7:0] s0_idx = io_cpu_req_addr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 124:28]
  wire [17:0] s0_tag = io_cpu_req_addr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 125:28]
  reg  s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 139:25]
  reg [31:0] s1_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 140:21]
  reg [7:0] s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 141:21]
  reg [17:0] s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 142:21]
  wire  _GEN_4 = s0_valid | s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 149:37 150:14 139:25]
  reg  s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 168:25]
  reg [31:0] s2_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 169:21]
  reg  s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 170:21]
  reg [511:0] s2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 172:21]
  wire  _tag_hits_0_T = io_meta_read_resp_data_0_tag == s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 180:50]
  wire  tag_hits_0 = io_meta_read_resp_data_0_valid & _tag_hits_0_T; // @[src/main/scala/icache/ICacheMainPipe.scala 179:52]
  wire  _tag_hits_1_T = io_meta_read_resp_data_1_tag == s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 180:50]
  wire  tag_hits_1 = io_meta_read_resp_data_1_valid & _tag_hits_1_T; // @[src/main/scala/icache/ICacheMainPipe.scala 179:52]
  wire  _tag_hits_2_T = io_meta_read_resp_data_2_tag == s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 180:50]
  wire  tag_hits_2 = io_meta_read_resp_data_2_valid & _tag_hits_2_T; // @[src/main/scala/icache/ICacheMainPipe.scala 179:52]
  wire  _tag_hits_3_T = io_meta_read_resp_data_3_tag == s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 180:50]
  wire  tag_hits_3 = io_meta_read_resp_data_3_valid & _tag_hits_3_T; // @[src/main/scala/icache/ICacheMainPipe.scala 179:52]
  wire [3:0] _s1_hit_T = {tag_hits_3,tag_hits_2,tag_hits_1,tag_hits_0}; // @[src/main/scala/icache/ICacheMainPipe.scala 182:25]
  wire  s1_hit = |_s1_hit_T; // @[src/main/scala/icache/ICacheMainPipe.scala 182:32]
  wire [1:0] s1_hit_way_hi_1 = _s1_hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] s1_hit_way_lo_1 = _s1_hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _s1_hit_way_T_2 = s1_hit_way_hi_1 | s1_hit_way_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s1_hit_way = {|s1_hit_way_hi_1,_s1_hit_way_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire [511:0] _GEN_13 = 2'h1 == s1_hit_way ? io_data_read_resp_data_1 : io_data_read_resp_data_0; // @[src/main/scala/icache/ICacheMainPipe.scala 194:{14,14}]
  wire  _GEN_16 = s1_valid | s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 189:23 190:14 168:25]
  wire  _GEN_18 = s1_valid ? s1_hit : s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 189:23 192:14 170:21]
  wire  _io_miss_req_valid_T = ~s1_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 200:35]
  wire [3:0] byte_offset = s2_addr[5:2]; // @[src/main/scala/icache/ICacheMainPipe.scala 224:30]
  wire [4:0] _word_offset_T = {{1'd0}, byte_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 228:38]
  wire [4:0] _GEN_0 = {{1'd0}, _word_offset_T[3:0]}; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [4:0] _GEN_1 = _GEN_0 % 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [3:0] word_offset = _GEN_1[3:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [9:0] bit_offset = word_offset * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 229:36]
  wire [511:0] shifted = s2_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 231:29]
  wire [3:0] _word_offset_T_3 = byte_offset + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 228:38]
  wire [4:0] _GEN_2 = {{1'd0}, _word_offset_T_3}; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [4:0] _GEN_3 = _GEN_2 % 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [3:0] word_offset_1 = _GEN_3[3:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [9:0] bit_offset_1 = word_offset_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 229:36]
  wire [511:0] shifted_1 = s2_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 231:29]
  wire [3:0] _word_offset_T_5 = byte_offset + 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 228:38]
  wire [4:0] _GEN_5 = {{1'd0}, _word_offset_T_5}; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [4:0] _GEN_6 = _GEN_5 % 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [3:0] word_offset_2 = _GEN_6[3:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [9:0] bit_offset_2 = word_offset_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 229:36]
  wire [511:0] shifted_2 = s2_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 231:29]
  wire [3:0] _word_offset_T_7 = byte_offset + 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 228:38]
  wire [4:0] _GEN_7 = {{1'd0}, _word_offset_T_7}; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [4:0] _GEN_8 = _GEN_7 % 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [3:0] word_offset_3 = _GEN_8[3:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 228:45]
  wire [9:0] bit_offset_3 = word_offset_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 229:36]
  wire [511:0] shifted_3 = s2_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 231:29]
  wire [31:0] _s2_addr_T = {io_miss_resp_bits_tag,io_miss_resp_bits_idx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 243:20]
  wire  _GEN_35 = io_miss_resp_valid | _GEN_16; // @[src/main/scala/icache/ICacheMainPipe.scala 241:28 242:14]
  assign io_cpu_resp_instrs_0 = io_cpu_resp_valid ? shifted[31:0] : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 219:27 232:29 237:24]
  assign io_cpu_resp_instrs_1 = io_cpu_resp_valid ? shifted_1[31:0] : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 219:27 232:29 237:24]
  assign io_cpu_resp_instrs_2 = io_cpu_resp_valid ? shifted_2[31:0] : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 219:27 232:29 237:24]
  assign io_cpu_resp_instrs_3 = io_cpu_resp_valid ? shifted_3[31:0] : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 219:27 232:29 237:24]
  assign io_cpu_resp_addr = io_cpu_resp_valid ? s2_addr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 219:27 220:22 236:22]
  assign io_cpu_resp_valid = s2_valid & s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 216:33]
  assign io_meta_read_req_valid = s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 157:26]
  assign io_meta_read_req_idx = s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  assign io_data_read_req_valid = s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  assign io_data_read_req_idx = s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 161:26]
  assign io_miss_req_valid = s1_valid & ~s1_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 200:32]
  assign io_miss_req_bits_addr = s1_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 201:25]
  assign io_miss_req_bits_idx = s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 202:25]
  assign io_miss_req_bits_tag = s1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 203:25]
  assign io_miss_req_bits_victim_way = io_replacer_victim_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 204:31]
  assign io_replacer_touch_valid = s1_valid & s1_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 207:38]
  assign io_replacer_touch_idx = s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 208:27]
  assign io_replacer_touch_way = {|s1_hit_way_hi_1,_s1_hit_way_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  assign io_replacer_victim_req = s1_valid & _io_miss_req_valid_T; // @[src/main/scala/icache/ICacheMainPipe.scala 212:37]
  assign io_replacer_victim_idx = s1_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 213:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 119:25]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 119:25]
    end else begin
      s0_valid <= io_cpu_req_valid;
    end
    if (io_cpu_req_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 131:23]
      s0_addr <= io_cpu_req_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 133:14]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 139:25]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 139:25]
    end else begin
      s1_valid <= _GEN_4;
    end
    if (s0_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 149:37]
      s1_addr <= s0_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 151:14]
    end
    if (s0_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 149:37]
      s1_idx <= s0_idx; // @[src/main/scala/icache/ICacheMainPipe.scala 152:14]
    end
    if (s0_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 149:37]
      s1_tag <= s0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 153:14]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:25]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 168:25]
    end else begin
      s2_valid <= _GEN_35;
    end
    if (io_miss_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 241:28]
      s2_addr <= _s2_addr_T; // @[src/main/scala/icache/ICacheMainPipe.scala 243:14]
    end else if (s1_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 189:23]
      s2_addr <= s1_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 191:14]
    end
    s2_hit <= io_miss_resp_valid | _GEN_18; // @[src/main/scala/icache/ICacheMainPipe.scala 241:28 244:14]
    if (io_miss_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 241:28]
      s2_data <= io_miss_resp_bits_data; // @[src/main/scala/icache/ICacheMainPipe.scala 245:14]
    end else if (s1_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 189:23]
      if (2'h3 == s1_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 194:14]
        s2_data <= io_data_read_resp_data_3; // @[src/main/scala/icache/ICacheMainPipe.scala 194:14]
      end else if (2'h2 == s1_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 194:14]
        s2_data <= io_data_read_resp_data_2; // @[src/main/scala/icache/ICacheMainPipe.scala 194:14]
      end else begin
        s2_data <= _GEN_13;
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
  s0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s0_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s1_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s1_idx = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  s1_tag = _RAND_5[17:0];
  _RAND_6 = {1{`RANDOM}};
  s2_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_addr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s2_hit = _RAND_8[0:0];
  _RAND_9 = {16{`RANDOM}};
  s2_data = _RAND_9[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
