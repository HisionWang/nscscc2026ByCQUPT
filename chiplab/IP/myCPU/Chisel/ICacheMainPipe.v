module ICacheMainPipe(
  input          clock,
  input          reset,
  input          io_cpu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [31:0]  io_cpu_req_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_0, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_1, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_2, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [31:0]  io_cpu_resp_instrs_3, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_0, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_1, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_2, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_cpu_resp_instvalids_3, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
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
  input          io_arrays_read_resp_data_cacheLine_2_has, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_2_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_2_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input          io_arrays_read_resp_data_cacheLine_3_has, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_3_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_3_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_array_write_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_array_write_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [1:0]   io_array_write_way, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [17:0]  io_array_write_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [511:0] io_array_write_data, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_victim_read_req, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_victim_read_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  input  [1:0]   io_victim_read_resp, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output         io_replacer_touch_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [7:0]   io_replacer_touch_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
  output [1:0]   io_replacer_touch_way, // @[src/main/scala/icache/ICacheMainPipe.scala 9:14]
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
  reg [511:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [511:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [511:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [511:0] _RAND_19;
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
  reg [511:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [511:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [511:0] _RAND_40;
  reg [511:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
`endif // RANDOMIZE_REG_INIT
  reg  s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 62:25]
  reg  s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 104:25]
  reg  s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 148:25]
  reg [3:0] state; // @[src/main/scala/icache/ICacheMainPipe.scala 278:22]
  wire  _s3_ready_T_1 = state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 505:44]
  wire  s3_ready = state == 4'h0 | state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 505:34]
  wire  s2_fire = s2_valid & s3_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 161:28]
  wire  s2_ready = s2_fire | ~s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 163:23]
  reg  s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
  wire  _s1_cango_T_1 = io_arrays_read_resp_valid & io_mmu_resp_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 137:32]
  wire  s1_cango = s1_array_received & io_mmu_resp_valid | _s1_cango_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 136:52]
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
  wire  _GEN_9 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 124:22 125:15 104:25]
  wire  _GEN_10 = s0_fire | _GEN_9; // @[src/main/scala/icache/ICacheMainPipe.scala 119:35 120:14]
  reg  s1_array_received_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg  s1_array_received_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg  s1_array_received_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg  s1_array_received_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [17:0] s1_array_received_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  reg [511:0] s1_array_received_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 139:35]
  wire  _GEN_18 = io_arrays_read_resp_valid & ~io_mmu_resp_valid | s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 143:49 144:23 135:34]
  reg [31:0] s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 149:21]
  reg [31:0] s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 150:21]
  reg [17:0] s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 156:21]
  reg  s2_array_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [17:0] s2_array_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [511:0] s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg  s2_array_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [17:0] s2_array_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [511:0] s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg  s2_array_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [17:0] s2_array_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [511:0] s2_array_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg  s2_array_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [17:0] s2_array_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  reg [511:0] s2_array_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 158:26]
  wire [17:0] curr_ptag = io_mmu_resp_data_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 166:41]
  wire  _tag_hits_0_T = s2_array_data_cacheLine_0_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 193:54]
  wire  tag_hits_0 = s2_array_data_cacheLine_0_has & _tag_hits_0_T; // @[src/main/scala/icache/ICacheMainPipe.scala 192:51]
  wire  _tag_hits_1_T = s2_array_data_cacheLine_1_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 193:54]
  wire  tag_hits_1 = s2_array_data_cacheLine_1_has & _tag_hits_1_T; // @[src/main/scala/icache/ICacheMainPipe.scala 192:51]
  wire  _tag_hits_2_T = s2_array_data_cacheLine_2_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 193:54]
  wire  tag_hits_2 = s2_array_data_cacheLine_2_has & _tag_hits_2_T; // @[src/main/scala/icache/ICacheMainPipe.scala 192:51]
  wire  _tag_hits_3_T = s2_array_data_cacheLine_3_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 193:54]
  wire  tag_hits_3 = s2_array_data_cacheLine_3_has & _tag_hits_3_T; // @[src/main/scala/icache/ICacheMainPipe.scala 192:51]
  wire [3:0] _s2_hit_T = {tag_hits_3,tag_hits_2,tag_hits_1,tag_hits_0}; // @[src/main/scala/icache/ICacheMainPipe.scala 196:37]
  wire  s2_hit = s2_valid & |_s2_hit_T; // @[src/main/scala/icache/ICacheMainPipe.scala 196:25]
  wire [1:0] s2_hit_way_hi_1 = _s2_hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] s2_hit_way_lo_1 = _s2_hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _s2_hit_way_T_2 = s2_hit_way_hi_1 | s2_hit_way_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s2_hit_way = {|s2_hit_way_hi_1,_s2_hit_way_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  s2_cache_miss = s2_valid & ~s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 199:58]
  reg  s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 203:25]
  reg [31:0] s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 204:21]
  reg [31:0] s3_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 205:21]
  reg  s3_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 208:22]
  reg  s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 210:22]
  reg [511:0] s3_cacheLine_data; // @[src/main/scala/icache/ICacheMainPipe.scala 211:31]
  wire [17:0] s3_ptag = s3_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 236:25]
  wire [7:0] s3_pidx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 237:25]
  wire [3:0] _GEN_108 = s3_hit ? 4'h1 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 292:28 293:22 296:22]
  wire [3:0] _GEN_113 = io_axi_ar_arready ? 4'h3 : 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 310:31 311:20 313:20]
  wire  _T_17 = io_axi_r_data_rvalid & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 319:33]
  wire  _T_18 = io_axi_r_data_rid == 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 319:77]
  wire [3:0] _GEN_114 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'h0 ? 4'h4 : 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 319:100 320:20 322:20]
  wire [3:0] _GEN_115 = io_axi_ar_arready ? 4'h6 : 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 333:31 334:20 336:20]
  wire  _T_24 = io_axi_r_data_rid == 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 342:77]
  wire [3:0] _GEN_116 = _T_17 & io_axi_r_data_rid == 4'h1 ? 4'h7 : 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 342:103 343:20 345:20]
  wire  _T_26 = 4'h8 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
  wire  _T_27 = 4'h7 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
  wire [3:0] _GEN_119 = 4'h8 == state ? 4'h7 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17 351:18]
  wire [3:0] _GEN_120 = 4'h6 == state ? _GEN_116 : _GEN_119; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
  wire [3:0] _GEN_121 = 4'h5 == state ? _GEN_115 : _GEN_120; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
  wire [3:0] _GEN_122 = 4'h4 == state ? 4'h7 : _GEN_121; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17 328:18]
  wire [3:0] _GEN_123 = 4'h3 == state ? _GEN_114 : _GEN_122; // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
  wire [3:0] word_offset = s3_vaddr[5:2]; // @[src/main/scala/icache/ICacheMainPipe.scala 373:29]
  wire [4:0] _word_offset_i_T = {{1'd0}, word_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 376:38]
  wire [3:0] word_offset_i = _word_offset_i_T[3:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 376:38]
  wire [9:0] bit_offset = word_offset_i * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 377:36]
  wire [511:0] _hit_instrs_0_T = s3_cacheLine_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 378:41]
  wire [31:0] hit_instrs_0 = _hit_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 378:55]
  wire [3:0] word_offset_i_1 = word_offset + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 376:38]
  wire [9:0] bit_offset_1 = word_offset_i_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 377:36]
  wire [511:0] _hit_instrs_1_T = s3_cacheLine_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 378:41]
  wire [31:0] hit_instrs_1 = _hit_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 378:55]
  wire [3:0] word_offset_i_2 = word_offset + 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 376:38]
  wire [9:0] bit_offset_2 = word_offset_i_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 377:36]
  wire [511:0] _hit_instrs_2_T = s3_cacheLine_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 378:41]
  wire [31:0] hit_instrs_2 = _hit_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 378:55]
  wire [3:0] word_offset_i_3 = word_offset + 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 376:38]
  wire [9:0] bit_offset_3 = word_offset_i_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 377:36]
  wire [511:0] _hit_instrs_3_T = s3_cacheLine_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 378:41]
  wire [31:0] hit_instrs_3 = _hit_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 378:55]
  reg [511:0] miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 383:29]
  reg  miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 384:32]
  wire [511:0] _miss_instrs_0_T = miss_data_buffer >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 393:41]
  wire [31:0] miss_instrs_0 = _miss_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 393:55]
  wire [511:0] _miss_instrs_1_T = miss_data_buffer >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 393:41]
  wire [31:0] miss_instrs_1 = _miss_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 393:55]
  wire [511:0] _miss_instrs_2_T = miss_data_buffer >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 393:41]
  wire [31:0] miss_instrs_2 = _miss_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 393:55]
  wire [511:0] _miss_instrs_3_T = miss_data_buffer >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 393:41]
  wire [31:0] miss_instrs_3 = _miss_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 393:55]
  reg [31:0] uncache_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 398:32]
  reg  uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 399:35]
  wire [31:0] _GEN_134 = uncache_data_valid ? uncache_data_buffer : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:38 452:23]
  wire [31:0] _GEN_146 = miss_data_valid ? miss_instrs_0 : _GEN_134; // @[src/main/scala/icache/ICacheMainPipe.scala 444:35 445:23]
  wire [31:0] _GEN_147 = miss_data_valid ? miss_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 444:35 445:23]
  wire [31:0] _GEN_148 = miss_data_valid ? miss_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 444:35 445:23]
  wire [31:0] _GEN_149 = miss_data_valid ? miss_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 444:35 445:23]
  wire  _GEN_150 = miss_data_valid | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 444:35 446:27]
  wire [31:0] _GEN_158 = s3_hit ? hit_instrs_0 : _GEN_146; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 438:23]
  wire [31:0] _GEN_159 = s3_hit ? hit_instrs_1 : _GEN_147; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 438:23]
  wire [31:0] _GEN_160 = s3_hit ? hit_instrs_2 : _GEN_148; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 438:23]
  wire [31:0] _GEN_161 = s3_hit ? hit_instrs_3 : _GEN_149; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 438:23]
  wire  _GEN_162 = s3_hit | _GEN_150; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 439:27]
  wire  _GEN_163 = s3_hit | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 437:20 439:27]
  wire [31:0] _io_axi_ar_data_araddr_T = {s3_ptag,s3_pidx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 535:34]
  wire  _T_32 = state == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 540:20]
  wire [31:0] _GEN_192 = state == 4'h5 ? s3_paddr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 540:39 543:28 552:28]
  wire [1:0] _GEN_194 = state == 4'h5 ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 540:39 545:28 554:28]
  wire  _GEN_195 = state == 4'h2 ? 1'h0 : _T_32; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 534:28]
  wire [3:0] _GEN_197 = state == 4'h2 ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 536:28]
  wire [1:0] _GEN_198 = state == 4'h2 ? 2'h2 : _GEN_194; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 537:28]
  wire  _GEN_199 = state == 4'h2 | _T_32; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 538:28]
  wire  _io_axi_r_rready_T = state == 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 561:31]
  wire  _io_axi_r_rready_T_1 = state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 561:58]
  reg [3:0] beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 567:31]
  wire [9:0] data_offset = beat_counter * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 572:30]
  wire [1054:0] _GEN_2 = {{1023'd0}, io_axi_r_data_rdata}; // @[src/main/scala/icache/ICacheMainPipe.scala 573:67]
  wire [1054:0] _miss_data_buffer_T = _GEN_2 << data_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 573:67]
  wire [1054:0] _GEN_224 = {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 573:44]
  wire [1054:0] _miss_data_buffer_T_1 = _GEN_224 | _miss_data_buffer_T; // @[src/main/scala/icache/ICacheMainPipe.scala 573:44]
  wire [3:0] _beat_counter_T_1 = beat_counter + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 574:36]
  wire  _GEN_200 = io_axi_r_data_rlast | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 576:33 577:25 384:32]
  wire [1054:0] _GEN_202 = io_axi_r_data_rvalid ? _miss_data_buffer_T_1 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 569:32 573:24 383:29]
  wire [1054:0] _GEN_205 = _io_axi_r_rready_T & io_axi_r_data_rvalid & _T_18 ? _GEN_202 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 383:29 565:98]
  wire  _GEN_215 = _io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_24 | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 618:104 620:24 399:35]
  wire [1054:0] _GEN_217 = _s3_ready_T_1 ? 1055'h0 : _GEN_205; // @[src/main/scala/icache/ICacheMainPipe.scala 630:38 633:22]
  assign io_cpu_resp_valid = _T_27 ? _GEN_162 : _T_26; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17]
  assign io_cpu_resp_instrs_0 = _T_27 ? _GEN_158 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17]
  assign io_cpu_resp_instrs_1 = _T_27 ? _GEN_159 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17]
  assign io_cpu_resp_instrs_2 = _T_27 ? _GEN_160 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17]
  assign io_cpu_resp_instrs_3 = _T_27 ? _GEN_161 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17]
  assign io_cpu_resp_instvalids_0 = _T_27 & _GEN_162; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17 415:21]
  assign io_cpu_resp_instvalids_1 = _T_27 & _GEN_163; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17 415:21]
  assign io_cpu_resp_instvalids_2 = _T_27 & _GEN_163; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17 415:21]
  assign io_cpu_resp_instvalids_3 = _T_27 & _GEN_163; // @[src/main/scala/icache/ICacheMainPipe.scala 435:17 415:21]
  assign io_cpu_resp_addr = s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 425:20]
  assign io_axi_ar_data_arid = {{3'd0}, _GEN_195};
  assign io_axi_ar_data_araddr = state == 4'h2 ? _io_axi_ar_data_araddr_T : _GEN_192; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 535:28]
  assign io_axi_ar_data_arlen = {{4'd0}, _GEN_197};
  assign io_axi_ar_data_arsize = {{1'd0}, _GEN_198};
  assign io_axi_ar_data_arburst = {{1'd0}, _GEN_199};
  assign io_axi_ar_data_arvalid = state == 4'h2 | _T_32; // @[src/main/scala/icache/ICacheMainPipe.scala 532:30 538:28]
  assign io_axi_r_rready = state == 4'h3 | state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 561:48]
  assign io_arrays_read_req_valid = s0_valid & s1_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 65:29]
  assign io_arrays_read_req_idx = s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 96:29]
  assign io_array_write_valid = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 584:31]
  assign io_array_write_idx = state == 4'h4 & miss_data_valid ? s3_pidx : 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 584:64 586:26 601:26]
  assign io_array_write_way = state == 4'h4 & miss_data_valid ? io_victim_read_resp : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 584:64 592:26 604:26]
  assign io_array_write_tag = state == 4'h4 & miss_data_valid ? s3_ptag : 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 584:64 587:26 602:26]
  assign io_array_write_data = state == 4'h4 & miss_data_valid ? miss_data_buffer : 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 584:64 588:26 603:26]
  assign io_victim_read_req = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 584:31]
  assign io_victim_read_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 237:25]
  assign io_replacer_touch_valid = state == 4'h4 & miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 584:31]
  assign io_replacer_touch_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 237:25]
  assign io_replacer_touch_way = io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 584:64 596:27 611:27]
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
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 148:25]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 148:25]
    end else begin
      s2_valid <= s1_fire;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 278:22]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 278:22]
    end else if (4'h0 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
      if (s3_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 284:35]
        if (s3_miss) begin // @[src/main/scala/icache/ICacheMainPipe.scala 290:29]
          state <= 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 291:22]
        end else begin
          state <= _GEN_108;
        end
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 299:20]
      end
    end else if (4'h1 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
      state <= 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 305:18]
    end else if (4'h2 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 282:17]
      state <= _GEN_113;
    end else begin
      state <= _GEN_123;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 135:34]
    end else if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 142:23]
    end else begin
      s1_array_received <= _GEN_18;
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
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (!(s1_fire)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 141:29]
      if (io_arrays_read_resp_valid & ~io_mmu_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:49]
        s1_array_received_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 145:28]
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      s2_vaddr <= s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 176:14]
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      s2_paddr <= io_mmu_resp_data_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 179:14]
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      s2_ptag <= curr_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 180:14]
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_0_has <= s1_array_received_data_cacheLine_0_has;
      end else begin
        s2_array_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_0_tag <= s1_array_received_data_cacheLine_0_tag;
      end else begin
        s2_array_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_0_data <= s1_array_received_data_cacheLine_0_data;
      end else begin
        s2_array_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_1_has <= s1_array_received_data_cacheLine_1_has;
      end else begin
        s2_array_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_1_tag <= s1_array_received_data_cacheLine_1_tag;
      end else begin
        s2_array_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_1_data <= s1_array_received_data_cacheLine_1_data;
      end else begin
        s2_array_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_2_has <= s1_array_received_data_cacheLine_2_has;
      end else begin
        s2_array_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_2_tag <= s1_array_received_data_cacheLine_2_tag;
      end else begin
        s2_array_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_2_data <= s1_array_received_data_cacheLine_2_data;
      end else begin
        s2_array_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_3_has <= s1_array_received_data_cacheLine_3_has;
      end else begin
        s2_array_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_3_tag <= s1_array_received_data_cacheLine_3_tag;
      end else begin
        s2_array_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag;
      end
    end
    if (s1_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:36]
      if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 174:25]
        s2_array_data_cacheLine_3_data <= s1_array_received_data_cacheLine_3_data;
      end else begin
        s2_array_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data;
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 203:25]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 203:25]
    end else begin
      s3_valid <= s2_fire;
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 220:36]
      s3_vaddr <= s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 222:14]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 220:36]
      s3_paddr <= s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 223:14]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 220:36]
      s3_hit <= s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 228:12]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 220:36]
      s3_miss <= s2_cache_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 230:13]
    end
    if (s2_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 220:36]
      if (2'h3 == s2_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
        s3_cacheLine_data <= s2_array_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
      end else if (2'h2 == s2_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
        s3_cacheLine_data <= s2_array_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
      end else if (2'h1 == s2_hit_way) begin // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
        s3_cacheLine_data <= s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 231:23]
      end else begin
        s3_cacheLine_data <= s2_array_data_cacheLine_0_data;
      end
    end
    miss_data_buffer <= _GEN_217[511:0];
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 384:32]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 384:32]
    end else if (_s3_ready_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 630:38]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 632:21]
    end else if (_io_axi_r_rready_T & io_axi_r_data_rvalid & _T_18) begin // @[src/main/scala/icache/ICacheMainPipe.scala 565:98]
      if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 569:32]
        miss_data_valid <= _GEN_200;
      end
    end
    if (_s3_ready_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 630:38]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 634:25]
    end else if (_io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_24) begin // @[src/main/scala/icache/ICacheMainPipe.scala 618:104]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 619:25]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 399:35]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 399:35]
    end else if (_s3_ready_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 630:38]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 635:24]
    end else begin
      uncache_data_valid <= _GEN_215;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 567:31]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 567:31]
    end else if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 569:32]
      if (io_axi_r_data_rlast) begin // @[src/main/scala/icache/ICacheMainPipe.scala 576:33]
        beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 578:22]
      end else begin
        beat_counter <= _beat_counter_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 574:20]
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
  s1_array_received = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s0_vaddr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s0_vidx = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  s1_vaddr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_has = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_tag = _RAND_9[17:0];
  _RAND_10 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_0_data = _RAND_10[511:0];
  _RAND_11 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_has = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_tag = _RAND_12[17:0];
  _RAND_13 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_1_data = _RAND_13[511:0];
  _RAND_14 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_2_has = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_2_tag = _RAND_15[17:0];
  _RAND_16 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_2_data = _RAND_16[511:0];
  _RAND_17 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_has = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_tag = _RAND_18[17:0];
  _RAND_19 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_3_data = _RAND_19[511:0];
  _RAND_20 = {1{`RANDOM}};
  s2_vaddr = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s2_paddr = _RAND_21[31:0];
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
  s2_array_data_cacheLine_2_has = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s2_array_data_cacheLine_2_tag = _RAND_30[17:0];
  _RAND_31 = {16{`RANDOM}};
  s2_array_data_cacheLine_2_data = _RAND_31[511:0];
  _RAND_32 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_has = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_tag = _RAND_33[17:0];
  _RAND_34 = {16{`RANDOM}};
  s2_array_data_cacheLine_3_data = _RAND_34[511:0];
  _RAND_35 = {1{`RANDOM}};
  s3_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s3_vaddr = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s3_paddr = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s3_hit = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  s3_miss = _RAND_39[0:0];
  _RAND_40 = {16{`RANDOM}};
  s3_cacheLine_data = _RAND_40[511:0];
  _RAND_41 = {16{`RANDOM}};
  miss_data_buffer = _RAND_41[511:0];
  _RAND_42 = {1{`RANDOM}};
  miss_data_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uncache_data_buffer = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  uncache_data_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  beat_counter = _RAND_45[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
