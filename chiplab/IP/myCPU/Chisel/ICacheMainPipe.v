module ICacheMainPipe(
  input          clock,
  input          reset,
  output         io_cpu_req_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_cpu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [31:0]  io_cpu_req_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_0, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_1, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_2, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_3, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_4, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_5, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_0, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_1, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_2, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_3, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_4, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_5, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [3:0]   io_axi_ar_data_arid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_axi_ar_data_araddr, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_axi_ar_data_arlen, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [2:0]   io_axi_ar_data_arsize, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [1:0]   io_axi_ar_data_arburst, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_axi_ar_data_arvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_axi_ar_arready, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [3:0]   io_axi_r_data_rid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [31:0]  io_axi_r_data_rdata, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_axi_r_data_rlast, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_axi_r_data_rvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_axi_r_rready, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_arrays_read_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_arrays_read_req_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_arrays_read_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_arrays_read_resp_data_cacheLine_0_has, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_0_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_0_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_arrays_read_resp_data_cacheLine_1_has, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_1_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_1_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_array_write_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_array_write_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_array_write_way, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [17:0]  io_array_write_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [511:0] io_array_write_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_victim_read_req, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_victim_read_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_victim_read_resp, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_replacer_touch_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_replacer_touch_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_replacer_touch_way, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_mmu_req_vaddr, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_mmu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_mmu_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [31:0]  io_mmu_resp_data_paddr // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
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
  reg [511:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [511:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [511:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [511:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [511:0] _RAND_33;
  reg [511:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [511:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_REG_INIT
  reg  s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 62:25]
  reg  s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 104:25]
  reg  s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 156:25]
  reg [3:0] state; // @[src/main/scala/icache/ICacheMainPipe.scala 254:22]
  reg  s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 184:25]
  reg  s3_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 189:22]
  wire  _s3_ready_T_7 = state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 560:103]
  wire  s3_ready = state == 4'h0 & s3_valid & s3_hit | state == 4'h0 & ~s3_valid | state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 560:93]
  wire  s2_fire = s2_valid & s3_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 169:28]
  wire  s2_ready = s2_fire | ~s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 171:23]
  reg  s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
  reg  s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 134:32]
  wire  _s1_cango_T_1 = s1_mmu_received | io_mmu_resp_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 137:32]
  wire  s1_cango = (s1_array_received | io_arrays_read_resp_valid) & _s1_cango_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 136:54]
  wire  s1_fire = s1_valid & s2_ready & s1_cango; // @[src/main/scala/icache/ICacheMainPipe.scala 113:41]
  wire  s1_ready = s1_fire | ~s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 114:23]
  wire  s0_fire = s0_valid & s1_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 65:29]
  wire  s0_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 66:26]
  wire [7:0] curr_vidx = io_cpu_req_bits_addr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 69:39]
  reg [31:0] s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 74:21]
  reg [7:0] s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 75:21]
  wire  io_fire = s0_ready & io_cpu_req_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 78:26]
  wire  _GEN_0 = s0_fire ? 1'h0 : s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 88:22 89:15 62:25]
  wire  _GEN_1 = io_fire | _GEN_0; // @[src/main/scala/icache/ICacheMainPipe.scala 83:35 84:15]
  reg [31:0] s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 105:21]
  reg [7:0] s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 106:21]
  wire  _GEN_9 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 124:22 125:15 104:25]
  wire  _GEN_10 = s0_fire | _GEN_9; // @[src/main/scala/icache/ICacheMainPipe.scala 119:35 120:14]
  reg  s1_array_received_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg  s1_array_received_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [31:0] s1_mmu_received_data_data_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 140:33]
  wire  _GEN_18 = io_arrays_read_resp_valid | s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 144:31 145:23 135:34]
  wire  _GEN_32 = io_mmu_resp_valid | s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 151:29 152:21 134:32]
  reg [31:0] s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 157:21]
  reg [31:0] s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 158:21]
  reg [7:0] s2_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 161:21]
  reg [17:0] s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 164:21]
  reg  s2_array_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  reg [17:0] s2_array_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  reg [511:0] s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  reg  s2_array_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  reg [17:0] s2_array_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  reg [511:0] s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 166:26]
  wire [17:0] s1_ptag = s1_mmu_received ? s1_mmu_received_data_data_paddr[31:14] : io_mmu_resp_data_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 174:20]
  reg  miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 183:32]
  reg [31:0] s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 185:21]
  reg [31:0] s3_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 186:21]
  reg  s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 191:22]
  reg [511:0] miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 194:29]
  wire [17:0] s3_ptag = s3_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 290:22]
  wire [7:0] s3_pidx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 291:22]
  wire  s1_can_bypass = s1_ptag == s3_ptag & s1_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 196:98]
  reg [511:0] s2_bypass_data_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 199:35]
  reg  s2_can_bypass_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 201:38]
  wire  _GEN_42 = s2_fire ? 1'h0 : s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 226:23 227:14 156:25]
  wire  _GEN_43 = s1_fire | _GEN_42; // @[src/main/scala/icache/ICacheMainPipe.scala 208:36 209:14]
  wire  _tag_hits_0_T = s2_array_data_cacheLine_0_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 234:54]
  wire  tag_hits_0 = s2_array_data_cacheLine_0_has & _tag_hits_0_T; // @[src/main/scala/icache/ICacheMainPipe.scala 233:51]
  wire  _tag_hits_1_T = s2_array_data_cacheLine_1_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 234:54]
  wire  tag_hits_1 = s2_array_data_cacheLine_1_has & _tag_hits_1_T; // @[src/main/scala/icache/ICacheMainPipe.scala 233:51]
  wire [1:0] _s2_hit_T = {tag_hits_1,tag_hits_0}; // @[src/main/scala/icache/ICacheMainPipe.scala 237:37]
  wire  s2_hit = s2_valid & |_s2_hit_T; // @[src/main/scala/icache/ICacheMainPipe.scala 237:25]
  wire  s2_hit_way = _s2_hit_T[1]; // @[src/main/scala/chisel3/util/CircuitMath.scala 28:8]
  wire  s2_cache_miss = s2_valid & ~s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 240:58]
  reg [511:0] s3_cacheLine_data; // @[src/main/scala/icache/ICacheMainPipe.scala 245:31]
  wire  s3_fire = s3_valid & s3_hit | _s3_ready_T_7; // @[src/main/scala/icache/ICacheMainPipe.scala 258:38]
  wire  s2_can_bypass = s2_ptag == s3_ptag & s2_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 261:98]
  wire  _GEN_79 = s3_fire ? 1'h0 : s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 287:23 288:14 184:25]
  wire  _GEN_80 = s2_fire | _GEN_79; // @[src/main/scala/icache/ICacheMainPipe.scala 265:36 266:14]
  wire  _T_10 = 4'h0 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire [3:0] _GEN_98 = s3_hit ? 4'h1 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 342:28 343:22 346:22]
  wire [3:0] _GEN_103 = io_axi_ar_arready ? 4'h3 : 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 360:31 361:20 363:20]
  wire  _T_18 = io_axi_r_data_rvalid & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 369:33]
  wire  _T_19 = io_axi_r_data_rid == 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 369:77]
  wire [3:0] _GEN_104 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'h0 ? 4'h4 : 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 369:100 370:20 372:20]
  wire [3:0] _GEN_105 = io_axi_ar_arready ? 4'h6 : 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 383:31 384:20 386:20]
  wire  _T_25 = io_axi_r_data_rid == 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 392:77]
  wire [3:0] _GEN_106 = _T_18 & io_axi_r_data_rid == 4'h1 ? 4'h7 : 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 392:103 393:20 395:20]
  wire  _T_27 = 4'h8 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire  _T_28 = 4'h7 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire [3:0] _GEN_109 = 4'h8 == state ? 4'h7 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17 401:18]
  wire [3:0] _GEN_110 = 4'h6 == state ? _GEN_106 : _GEN_109; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire [3:0] _GEN_111 = 4'h5 == state ? _GEN_105 : _GEN_110; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire [3:0] _GEN_112 = 4'h4 == state ? 4'h7 : _GEN_111; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17 378:18]
  wire [3:0] _GEN_113 = 4'h3 == state ? _GEN_104 : _GEN_112; // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
  wire [4:0] word_offset = {{1'd0}, s3_vaddr[5:2]}; // @[src/main/scala/icache/ICacheMainPipe.scala 423:25 425:15]
  wire [5:0] _word_offset_i_T = {{1'd0}, word_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [4:0] word_offset_i = _word_offset_i_T[4:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset = word_offset_i * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_0_T = s3_cacheLine_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_0 = _hit_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_0 = word_offset_i < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [4:0] word_offset_i_1 = word_offset + 5'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset_1 = word_offset_i_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_1_T = s3_cacheLine_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_1 = _hit_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_1 = word_offset_i_1 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [4:0] word_offset_i_2 = word_offset + 5'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset_2 = word_offset_i_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_2_T = s3_cacheLine_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_2 = _hit_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_2 = word_offset_i_2 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [4:0] word_offset_i_3 = word_offset + 5'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset_3 = word_offset_i_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_3_T = s3_cacheLine_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_3 = _hit_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_3 = word_offset_i_3 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [4:0] word_offset_i_4 = word_offset + 5'h4; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset_4 = word_offset_i_4 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_4_T = s3_cacheLine_data >> bit_offset_4; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_4 = _hit_instrs_4_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_4 = word_offset_i_4 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [4:0] word_offset_i_5 = word_offset + 5'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 428:38]
  wire [10:0] bit_offset_5 = word_offset_i_5 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 429:36]
  wire [511:0] _hit_instrs_5_T = s3_cacheLine_data >> bit_offset_5; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] hit_instrs_5 = _hit_instrs_5_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire  hit_valids_5 = word_offset_i_5 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 431:41]
  wire [511:0] _miss_instrs_0_T = miss_data_buffer >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_0 = _miss_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  wire [511:0] _miss_instrs_1_T = miss_data_buffer >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_1 = _miss_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  wire [511:0] _miss_instrs_2_T = miss_data_buffer >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_2 = _miss_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  wire [511:0] _miss_instrs_3_T = miss_data_buffer >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_3 = _miss_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  wire [511:0] _miss_instrs_4_T = miss_data_buffer >> bit_offset_4; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_4 = _miss_instrs_4_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  wire [511:0] _miss_instrs_5_T = miss_data_buffer >> bit_offset_5; // @[src/main/scala/icache/ICacheMainPipe.scala 445:41]
  wire [31:0] miss_instrs_5 = _miss_instrs_5_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 445:55]
  reg [31:0] uncache_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 450:32]
  reg  uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 451:35]
  wire  _T_30 = s3_hit & s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 489:19]
  wire [31:0] _GEN_118 = s3_hit & s3_valid ? hit_instrs_0 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire [31:0] _GEN_119 = s3_hit & s3_valid ? hit_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire [31:0] _GEN_120 = s3_hit & s3_valid ? hit_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire [31:0] _GEN_121 = s3_hit & s3_valid ? hit_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire [31:0] _GEN_122 = s3_hit & s3_valid ? hit_instrs_4 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire [31:0] _GEN_123 = s3_hit & s3_valid ? hit_instrs_5 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 466:17 489:32 490:23]
  wire  _GEN_124 = s3_hit & s3_valid & hit_valids_0; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire  _GEN_125 = s3_hit & s3_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire  _GEN_126 = s3_hit & s3_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire  _GEN_127 = s3_hit & s3_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire  _GEN_128 = s3_hit & s3_valid & hit_valids_4; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire  _GEN_129 = s3_hit & s3_valid & hit_valids_5; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 489:32 491:27]
  wire [31:0] _GEN_140 = uncache_data_valid ? uncache_data_buffer : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 506:38 507:23]
  wire [31:0] _GEN_154 = miss_data_valid ? miss_instrs_0 : _GEN_140; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire [31:0] _GEN_155 = miss_data_valid ? miss_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire [31:0] _GEN_156 = miss_data_valid ? miss_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire [31:0] _GEN_157 = miss_data_valid ? miss_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire [31:0] _GEN_158 = miss_data_valid ? miss_instrs_4 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire [31:0] _GEN_159 = miss_data_valid ? miss_instrs_5 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 500:23]
  wire  _GEN_160 = miss_data_valid ? hit_valids_0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 501:27]
  wire  _GEN_161 = miss_data_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 501:27]
  wire  _GEN_162 = miss_data_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 501:27]
  wire  _GEN_163 = miss_data_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 501:27]
  wire  _GEN_164 = miss_data_valid & hit_valids_4; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 499:29 501:27]
  wire  _GEN_165 = miss_data_valid & hit_valids_5; // @[src/main/scala/icache/ICacheMainPipe.scala 467:21 499:29 501:27]
  wire  _GEN_166 = miss_data_valid | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 499:29 502:22]
  wire [31:0] _GEN_178 = _T_28 ? _GEN_154 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _GEN_179 = _T_28 ? _GEN_155 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _GEN_180 = _T_28 ? _GEN_156 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _GEN_181 = _T_28 ? _GEN_157 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _GEN_182 = _T_28 ? _GEN_158 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _GEN_183 = _T_28 ? _GEN_159 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire  _GEN_184 = _T_28 & _GEN_160; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_185 = _T_28 & _GEN_161; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_186 = _T_28 & _GEN_162; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_187 = _T_28 & _GEN_163; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_188 = _T_28 & _GEN_164; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_189 = _T_28 & _GEN_165; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17 467:21]
  wire  _GEN_190 = _T_28 ? _GEN_166 : _T_27; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  wire [31:0] _io_axi_ar_data_araddr_T = {s3_ptag,s3_pidx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 590:34]
  wire  _T_34 = state == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 595:20]
  wire [31:0] _GEN_214 = state == 4'h5 ? s3_paddr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 595:39 598:28 607:28]
  wire [1:0] _GEN_216 = state == 4'h5 ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 595:39 600:28 609:28]
  wire  _GEN_217 = state == 4'h2 ? 1'h0 : _T_34; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 589:28]
  wire [3:0] _GEN_219 = state == 4'h2 ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 591:28]
  wire [1:0] _GEN_220 = state == 4'h2 ? 2'h2 : _GEN_216; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 592:28]
  wire  _GEN_221 = state == 4'h2 | _T_34; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 593:28]
  wire  _io_axi_r_rready_T = state == 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 616:31]
  wire  _io_axi_r_rready_T_1 = state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 616:58]
  reg [3:0] beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 622:31]
  wire [9:0] data_offset = beat_counter * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 627:30]
  wire [1054:0] _GEN_2 = {{1023'd0}, io_axi_r_data_rdata}; // @[src/main/scala/icache/ICacheMainPipe.scala 628:67]
  wire [1054:0] _miss_data_buffer_T = _GEN_2 << data_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 628:67]
  wire [1054:0] _GEN_244 = {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 628:44]
  wire [1054:0] _miss_data_buffer_T_1 = _GEN_244 | _miss_data_buffer_T; // @[src/main/scala/icache/ICacheMainPipe.scala 628:44]
  wire [3:0] _beat_counter_T_1 = beat_counter + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 629:36]
  wire  _GEN_222 = io_axi_r_data_rlast | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 631:33 632:25 183:32]
  wire [1054:0] _GEN_224 = io_axi_r_data_rvalid ? _miss_data_buffer_T_1 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 624:32 628:24 194:29]
  wire [1054:0] _GEN_227 = _io_axi_r_rready_T & io_axi_r_data_rvalid & _T_19 ? _GEN_224 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 194:29 620:98]
  wire  _GEN_237 = _io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_25 | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 673:104 675:24 451:35]
  assign io_cpu_req_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 66:26]
  assign io_cpu_resp_valid = _T_10 ? _T_30 : _GEN_190; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_0 = _T_10 ? _GEN_118 : _GEN_178; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_1 = _T_10 ? _GEN_119 : _GEN_179; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_2 = _T_10 ? _GEN_120 : _GEN_180; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_3 = _T_10 ? _GEN_121 : _GEN_181; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_4 = _T_10 ? _GEN_122 : _GEN_182; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instrs_5 = _T_10 ? _GEN_123 : _GEN_183; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_0 = _T_10 ? _GEN_124 : _GEN_184; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_1 = _T_10 ? _GEN_125 : _GEN_185; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_2 = _T_10 ? _GEN_126 : _GEN_186; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_3 = _T_10 ? _GEN_127 : _GEN_187; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_4 = _T_10 ? _GEN_128 : _GEN_188; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_instvalids_5 = _T_10 ? _GEN_129 : _GEN_189; // @[src/main/scala/icache/ICacheMainPipe.scala 487:17]
  assign io_cpu_resp_addr = s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 477:20]
  assign io_axi_ar_data_arid = {{3'd0}, _GEN_217};
  assign io_axi_ar_data_araddr = state == 4'h2 ? _io_axi_ar_data_araddr_T : _GEN_214; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 590:28]
  assign io_axi_ar_data_arlen = {{4'd0}, _GEN_219};
  assign io_axi_ar_data_arsize = {{1'd0}, _GEN_220};
  assign io_axi_ar_data_arburst = {{1'd0}, _GEN_221};
  assign io_axi_ar_data_arvalid = state == 4'h2 | _T_34; // @[src/main/scala/icache/ICacheMainPipe.scala 587:30 593:28]
  assign io_axi_r_rready = state == 4'h3 | state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 616:48]
  assign io_arrays_read_req_valid = s0_valid & s1_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 65:29]
  assign io_arrays_read_req_idx = s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 96:29]
  assign io_array_write_valid = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 639:31]
  assign io_array_write_idx = state == 4'h4 & miss_data_valid ? s3_pidx : 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 639:64 641:26 656:26]
  assign io_array_write_way = state == 4'h4 & miss_data_valid & io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 639:64 647:26 659:26]
  assign io_array_write_tag = state == 4'h4 & miss_data_valid ? s3_ptag : 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 639:64 642:26 657:26]
  assign io_array_write_data = state == 4'h4 & miss_data_valid ? miss_data_buffer : 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 639:64 643:26 658:26]
  assign io_victim_read_req = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 639:31]
  assign io_victim_read_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 291:22]
  assign io_replacer_touch_valid = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 639:31]
  assign io_replacer_touch_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 291:22]
  assign io_replacer_touch_way = io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 639:64 651:27 666:27]
  assign io_mmu_req_vaddr = s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 99:20]
  assign io_mmu_req_valid = s0_valid & s1_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 65:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 62:25]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 62:25]
    end else begin
      s0_valid <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 104:25]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 104:25]
    end else begin
      s1_valid <= _GEN_10;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 156:25]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 156:25]
    end else begin
      s2_valid <= _GEN_43;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:22]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 254:22]
    end else if (4'h0 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
      if (s3_valid & ~s3_hit) begin // @[src/main/scala/icache/ICacheMainPipe.scala 334:46]
        if (s3_miss) begin // @[src/main/scala/icache/ICacheMainPipe.scala 340:29]
          state <= 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 341:22]
        end else begin
          state <= _GEN_98;
        end
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 349:20]
      end
    end else if (4'h1 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
      state <= 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 355:18]
    end else if (4'h2 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 332:17]
      state <= _GEN_103;
    end else begin
      state <= _GEN_113;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 184:25]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 184:25]
    end else begin
      s3_valid <= _GEN_80;
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 265:36]
      s3_hit <= s2_hit | s2_can_bypass_from_s1 | s2_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 273:12]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
    end else if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 143:23]
    end else begin
      s1_array_received <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:32]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:32]
    end else if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 149:29]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 150:21]
    end else begin
      s1_mmu_received <= _GEN_32;
    end
    if (io_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 83:35]
      s0_vaddr <= io_cpu_req_bits_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 85:14]
    end
    if (io_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 83:35]
      s0_vidx <= curr_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 86:14]
    end
    if (s0_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 119:35]
      s1_vaddr <= s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 121:14]
    end
    if (s0_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 119:35]
      s1_vidx <= s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 122:14]
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 142:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 144:31]
        s1_array_received_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 146:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 149:29]
      if (io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 151:29]
        s1_mmu_received_data_data_paddr <= io_mmu_resp_data_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 153:26]
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      s2_vaddr <= s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 214:14]
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 176:21]
        s2_paddr <= s1_mmu_received_data_data_paddr;
      end else begin
        s2_paddr <= io_mmu_resp_data_paddr;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      s2_vidx <= s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 215:14]
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:20]
        s2_ptag <= s1_mmu_received_data_data_paddr[31:14];
      end else begin
        s2_ptag <= io_mmu_resp_data_paddr[31:14];
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_0_has <= s1_array_received_data_cacheLine_0_has;
      end else begin
        s2_array_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_0_tag <= s1_array_received_data_cacheLine_0_tag;
      end else begin
        s2_array_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_0_data <= s1_array_received_data_cacheLine_0_data;
      end else begin
        s2_array_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_1_has <= s1_array_received_data_cacheLine_1_has;
      end else begin
        s2_array_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_1_tag <= s1_array_received_data_cacheLine_1_tag;
      end else begin
        s2_array_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 175:31]
        s2_array_data_cacheLine_1_data <= s1_array_received_data_cacheLine_1_data;
      end else begin
        s2_array_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data;
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 183:32]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 183:32]
    end else if (_s3_ready_T_7) begin // @[src/main/scala/icache/ICacheMainPipe.scala 685:38]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 687:21]
    end else if (_io_axi_r_rready_T & io_axi_r_data_rvalid & _T_19) begin // @[src/main/scala/icache/ICacheMainPipe.scala 620:98]
      if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 624:32]
        miss_data_valid <= _GEN_222;
      end
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 265:36]
      s3_vaddr <= s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 267:14]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 265:36]
      s3_paddr <= s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 268:14]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 265:36]
      s3_miss <= s2_cache_miss & (~s2_can_bypass_from_s1 & ~s2_can_bypass); // @[src/main/scala/icache/ICacheMainPipe.scala 280:13]
    end
    miss_data_buffer <= _GEN_227[511:0];
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      s2_bypass_data_from_s1 <= miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 222:28]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 201:38]
      s2_can_bypass_from_s1 <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 201:38]
    end else if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 208:36]
      s2_can_bypass_from_s1 <= s1_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 223:27]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 265:36]
      if (s2_can_bypass_from_s1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 281:29]
        s3_cacheLine_data <= s2_bypass_data_from_s1;
      end else if (s2_can_bypass) begin // @[src/main/scala/icache/ICacheMainPipe.scala 283:10]
        s3_cacheLine_data <= miss_data_buffer;
      end else if (s2_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 283:10]
        s3_cacheLine_data <= s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 283:10]
      end else begin
        s3_cacheLine_data <= s2_array_data_cacheLine_0_data;
      end
    end
    if (_io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_25) begin // @[src/main/scala/icache/ICacheMainPipe.scala 673:104]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 674:25]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 451:35]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:35]
    end else if (_s3_ready_T_7) begin // @[src/main/scala/icache/ICacheMainPipe.scala 685:38]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 689:24]
    end else begin
      uncache_data_valid <= _GEN_237;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 622:31]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 622:31]
    end else if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 624:32]
      if (io_axi_r_data_rlast) begin // @[src/main/scala/icache/ICacheMainPipe.scala 631:33]
        beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 633:22]
      end else begin
        beat_counter <= _beat_counter_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 629:20]
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
  s1_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s3_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s3_hit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_array_received = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_mmu_received = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s0_vaddr = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s0_vidx = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  s1_vaddr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_vidx = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_has = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_tag = _RAND_13[17:0];
  _RAND_14 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_0_data = _RAND_14[511:0];
  _RAND_15 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_has = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_tag = _RAND_16[17:0];
  _RAND_17 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_1_data = _RAND_17[511:0];
  _RAND_18 = {1{`RANDOM}};
  s1_mmu_received_data_data_paddr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s2_vaddr = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s2_paddr = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s2_vidx = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  s2_ptag = _RAND_22[17:0];
  _RAND_23 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_has = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_tag = _RAND_24[17:0];
  _RAND_25 = {16{`RANDOM}};
  s2_array_data_cacheLine_0_data = _RAND_25[511:0];
  _RAND_26 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_has = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_tag = _RAND_27[17:0];
  _RAND_28 = {16{`RANDOM}};
  s2_array_data_cacheLine_1_data = _RAND_28[511:0];
  _RAND_29 = {1{`RANDOM}};
  miss_data_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s3_vaddr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s3_paddr = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s3_miss = _RAND_32[0:0];
  _RAND_33 = {16{`RANDOM}};
  miss_data_buffer = _RAND_33[511:0];
  _RAND_34 = {16{`RANDOM}};
  s2_bypass_data_from_s1 = _RAND_34[511:0];
  _RAND_35 = {1{`RANDOM}};
  s2_can_bypass_from_s1 = _RAND_35[0:0];
  _RAND_36 = {16{`RANDOM}};
  s3_cacheLine_data = _RAND_36[511:0];
  _RAND_37 = {1{`RANDOM}};
  uncache_data_buffer = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  uncache_data_valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  beat_counter = _RAND_39[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
