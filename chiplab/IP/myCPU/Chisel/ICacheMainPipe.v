module ICacheMainPipe(
  input          clock,
  input          reset,
  input          io_redirect, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_cpu_req_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_cpu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_cpu_req_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_icache_resp_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_uncached, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbRefill, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbPif, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbPpi, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpAdef, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [3:0]   io_axi_ar_data_arid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_axi_ar_data_araddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_axi_ar_data_arlen, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [2:0]   io_axi_ar_data_arsize, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_axi_ar_data_arburst, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_axi_ar_data_arvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_ar_arready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [3:0]   io_axi_r_data_rid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_axi_r_data_rdata, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_r_data_rlast, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_r_data_rvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_axi_r_rready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_arrays_read_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_arrays_read_req_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_0_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_0_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_0_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_1_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_1_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_1_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_2_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_2_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_2_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_3_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_3_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_3_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_array_write_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_array_write_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_array_write_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [17:0]  io_array_write_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [511:0] io_array_write_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_victim_read_req, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_victim_read_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [1:0]   io_victim_read_resp, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_replacer_touch_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_replacer_touch_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_replacer_touch_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_toMmu_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_mmu_toMmu_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_mmu_toMmu_bits_vaddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_mmu_fromMmu_bits_paddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_cacheable, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbRefill, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbPif, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbPpi, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpAdef // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
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
  reg [511:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [511:0] _RAND_23;
  reg [31:0] _RAND_24;
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
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [511:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [511:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [511:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [511:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [511:0] _RAND_60;
  reg [511:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [511:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
`endif // RANDOMIZE_REG_INIT
  reg  s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
  reg  s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
  reg  s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
  reg [3:0] state; // @[src/main/scala/icache/ICacheMainPipe.scala 248:22]
  reg  s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
  reg  s3_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 183:22]
  wire  _s3_ready_T_7 = state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 554:103]
  wire  _s3_ready_T_8 = state == 4'h7 & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 554:114]
  wire  s3_ready = state == 4'h0 & s3_valid & s3_hit | state == 4'h0 & ~s3_valid | state == 4'h7 & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 554:93]
  wire  s2_fire = s2_valid & s3_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 163:28]
  wire  s2_ready = s2_fire | ~s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 165:23]
  reg  s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
  reg  s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
  wire  _s1_cango_T_1 = s1_mmu_received | io_mmu_fromMmu_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 131:32]
  wire  s1_cango = (s1_array_received | io_arrays_read_resp_valid) & _s1_cango_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 130:54]
  wire  s1_fire = s1_valid & s2_ready & s1_cango; // @[src/main/scala/icache/ICacheMainPipe.scala 107:41]
  wire  s1_ready = s1_fire | ~s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 108:23]
  wire  s0_fire = s0_valid & s1_ready & io_mmu_toMmu_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 59:43]
  wire  s0_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 60:26]
  wire [7:0] curr_vidx = io_cpu_req_bits_addr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 63:39]
  reg [31:0] s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 68:21]
  reg [7:0] s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 69:21]
  wire  io_fire = s0_ready & io_cpu_req_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 72:26]
  wire  _T = ~io_redirect; // @[src/main/scala/icache/ICacheMainPipe.scala 77:25]
  wire  _io_arrays_read_req_valid_T_1 = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 89:40]
  reg [31:0] s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 99:21]
  reg [7:0] s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 100:21]
  wire  _GEN_9 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 118:22 119:15 98:25]
  wire  _GEN_10 = _io_arrays_read_req_valid_T_1 | _GEN_9; // @[src/main/scala/icache/ICacheMainPipe.scala 113:35 114:14]
  reg  s1_array_received_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [17:0] s1_array_received_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [511:0] s1_array_received_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg  s1_array_received_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [17:0] s1_array_received_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [511:0] s1_array_received_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg  s1_array_received_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [17:0] s1_array_received_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [511:0] s1_array_received_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg  s1_array_received_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [17:0] s1_array_received_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [511:0] s1_array_received_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:35]
  reg [31:0] s1_mmu_received_data_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  reg  s1_mmu_received_data_cacheable; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  reg  s1_mmu_received_data_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  reg  s1_mmu_received_data_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  reg  s1_mmu_received_data_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  reg  s1_mmu_received_data_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 134:33]
  wire  _T_4 = s1_fire | io_redirect; // @[src/main/scala/icache/ICacheMainPipe.scala 136:16]
  wire  _GEN_18 = io_arrays_read_resp_valid | s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 138:31 139:23 129:34]
  wire  _GEN_44 = io_mmu_fromMmu_valid | s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 145:29 146:21 128:32]
  reg [31:0] s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 151:21]
  reg [31:0] s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 152:21]
  reg  s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 153:24]
  reg  s2_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 154:25]
  reg  s2_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 154:25]
  reg  s2_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 154:25]
  reg  s2_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 154:25]
  reg [7:0] s2_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 155:21]
  reg [17:0] s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:21]
  reg  s2_array_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [17:0] s2_array_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [511:0] s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg  s2_array_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [17:0] s2_array_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [511:0] s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg  s2_array_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [17:0] s2_array_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [511:0] s2_array_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg  s2_array_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [17:0] s2_array_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  reg [511:0] s2_array_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 160:26]
  wire  _s2_is_uncached_access_T_2 = s2_mmu_error_excpTlbRefill | s2_mmu_error_excpTlbPif | s2_mmu_error_excpTlbPpi |
    s2_mmu_error_excpAdef; // @[src/main/scala/mmu/Bundles.scala 103:69]
  wire  s2_is_uncached_access = _s2_is_uncached_access_T_2 | s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 164:56]
  wire [17:0] s1_ptag = s1_mmu_received ? s1_mmu_received_data_paddr[31:14] : io_mmu_fromMmu_bits_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 168:20]
  reg  miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 177:32]
  reg [31:0] s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 179:21]
  reg [31:0] s3_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 180:21]
  reg  s3_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 181:24]
  reg  s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 182:25]
  reg  s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 182:25]
  reg  s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 182:25]
  reg  s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 182:25]
  reg  s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 185:22]
  reg [511:0] miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 188:29]
  wire [17:0] s3_ptag = s3_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 284:22]
  wire [7:0] s3_pidx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 285:22]
  wire  _s1_can_bypass_T_6 = ~s3_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 190:112]
  wire  _s1_can_bypass_T_10 = s3_mmu_error_excpTlbRefill | s3_mmu_error_excpTlbPif | s3_mmu_error_excpTlbPpi |
    s3_mmu_error_excpAdef; // @[src/main/scala/mmu/Bundles.scala 103:69]
  wire  _s1_can_bypass_T_11 = ~_s1_can_bypass_T_10; // @[src/main/scala/icache/ICacheMainPipe.scala 190:128]
  wire  s1_can_bypass = s1_ptag == s3_ptag & s1_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss & ~s3_uncached &
    ~_s1_can_bypass_T_10; // @[src/main/scala/icache/ICacheMainPipe.scala 190:125]
  reg [511:0] s2_bypass_data_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 193:35]
  reg  s2_can_bypass_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 195:38]
  wire  _GEN_60 = s2_fire ? 1'h0 : s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 220:23 221:14 150:25]
  wire  _GEN_61 = s1_fire & _T | _GEN_60; // @[src/main/scala/icache/ICacheMainPipe.scala 202:36 203:14]
  wire  _tag_hits_0_T = s2_array_data_cacheLine_0_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 228:54]
  wire  tag_hits_0 = s2_array_data_cacheLine_0_has & _tag_hits_0_T; // @[src/main/scala/icache/ICacheMainPipe.scala 227:51]
  wire  _tag_hits_1_T = s2_array_data_cacheLine_1_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 228:54]
  wire  tag_hits_1 = s2_array_data_cacheLine_1_has & _tag_hits_1_T; // @[src/main/scala/icache/ICacheMainPipe.scala 227:51]
  wire  _tag_hits_2_T = s2_array_data_cacheLine_2_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 228:54]
  wire  tag_hits_2 = s2_array_data_cacheLine_2_has & _tag_hits_2_T; // @[src/main/scala/icache/ICacheMainPipe.scala 227:51]
  wire  _tag_hits_3_T = s2_array_data_cacheLine_3_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 228:54]
  wire  tag_hits_3 = s2_array_data_cacheLine_3_has & _tag_hits_3_T; // @[src/main/scala/icache/ICacheMainPipe.scala 227:51]
  wire [3:0] _s2_hit_T = {tag_hits_3,tag_hits_2,tag_hits_1,tag_hits_0}; // @[src/main/scala/icache/ICacheMainPipe.scala 231:37]
  wire  s2_hit = s2_valid & |_s2_hit_T; // @[src/main/scala/icache/ICacheMainPipe.scala 231:25]
  wire [1:0] s2_hit_way_hi_1 = _s2_hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] s2_hit_way_lo_1 = _s2_hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _s2_hit_way_T_2 = s2_hit_way_hi_1 | s2_hit_way_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s2_hit_way = {|s2_hit_way_hi_1,_s2_hit_way_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  s2_cache_miss = s2_valid & ~s2_is_uncached_access & ~s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 234:58]
  reg [511:0] s3_cacheLine_data; // @[src/main/scala/icache/ICacheMainPipe.scala 239:31]
  wire  s3_fire = (s3_valid & s3_hit | _s3_ready_T_7) & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 252:59]
  wire  s2_can_bypass = s2_ptag == s3_ptag & s2_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss &
    _s1_can_bypass_T_6 & _s1_can_bypass_T_11; // @[src/main/scala/icache/ICacheMainPipe.scala 255:125]
  wire [511:0] _GEN_114 = 2'h1 == s2_hit_way ? s2_array_data_cacheLine_1_data : s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 277:{10,10}]
  wire [511:0] _GEN_115 = 2'h2 == s2_hit_way ? s2_array_data_cacheLine_2_data : _GEN_114; // @[src/main/scala/icache/ICacheMainPipe.scala 277:{10,10}]
  wire [511:0] _GEN_116 = 2'h3 == s2_hit_way ? s2_array_data_cacheLine_3_data : _GEN_115; // @[src/main/scala/icache/ICacheMainPipe.scala 277:{10,10}]
  wire  _GEN_117 = s3_fire ? 1'h0 : s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 281:23 282:14 178:25]
  wire  _GEN_118 = s2_fire & _T | _GEN_117; // @[src/main/scala/icache/ICacheMainPipe.scala 259:36 260:14]
  wire  _T_10 = 4'h0 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [3:0] _GEN_142 = s3_hit ? 4'h1 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 336:28 337:22 340:22]
  wire [3:0] _GEN_143 = s3_miss ? 4'h2 : _GEN_142; // @[src/main/scala/icache/ICacheMainPipe.scala 334:29 335:22]
  wire [3:0] _GEN_144 = s3_uncached ? 4'h5 : _GEN_143; // @[src/main/scala/icache/ICacheMainPipe.scala 332:33 333:22]
  wire [3:0] _GEN_145 = _s1_can_bypass_T_10 ? 4'h8 : _GEN_144; // @[src/main/scala/icache/ICacheMainPipe.scala 330:40 331:22]
  wire [3:0] _GEN_147 = io_axi_ar_arready ? 4'h3 : 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 354:31 355:20 357:20]
  wire  _T_21 = io_axi_r_data_rvalid & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 363:33]
  wire  _T_22 = io_axi_r_data_rid == 4'hc; // @[src/main/scala/icache/ICacheMainPipe.scala 363:77]
  wire [3:0] _GEN_148 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'hc ? 4'h4 : 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 363:100 364:20 366:20]
  wire [3:0] _GEN_149 = io_axi_ar_arready ? 4'h6 : 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 377:31 378:20 380:20]
  wire  _T_28 = io_axi_r_data_rid == 4'hd; // @[src/main/scala/icache/ICacheMainPipe.scala 386:77]
  wire [3:0] _GEN_150 = _T_21 & io_axi_r_data_rid == 4'hd ? 4'h7 : 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 386:103 387:20 389:20]
  wire  _T_30 = 4'h8 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire  _T_31 = 4'h7 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [3:0] _GEN_151 = io_icache_resp_ready ? 4'h0 : 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 400:23 401:20 403:20]
  wire [3:0] _GEN_152 = 4'h7 == state ? _GEN_151 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17 249:28]
  wire [3:0] _GEN_153 = 4'h8 == state ? 4'h7 : _GEN_152; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17 395:18]
  wire [3:0] _GEN_154 = 4'h6 == state ? _GEN_150 : _GEN_153; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [3:0] _GEN_155 = 4'h5 == state ? _GEN_149 : _GEN_154; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [3:0] _GEN_156 = 4'h4 == state ? 4'h7 : _GEN_155; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17 372:18]
  wire [3:0] _GEN_157 = 4'h3 == state ? _GEN_148 : _GEN_156; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [3:0] _GEN_158 = 4'h2 == state ? _GEN_147 : _GEN_157; // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
  wire [4:0] word_offset = {{1'd0}, s3_vaddr[5:2]}; // @[src/main/scala/icache/ICacheMainPipe.scala 417:25 419:15]
  wire [5:0] _word_offset_i_T = {{1'd0}, word_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 422:38]
  wire [4:0] word_offset_i = _word_offset_i_T[4:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 422:38]
  wire [10:0] bit_offset = word_offset_i * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 423:36]
  wire [511:0] _hit_instrs_0_T = s3_cacheLine_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 424:41]
  wire [31:0] hit_instrs_0 = _hit_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 424:55]
  wire  hit_valids_0 = word_offset_i < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 425:41]
  wire [4:0] word_offset_i_1 = word_offset + 5'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 422:38]
  wire [10:0] bit_offset_1 = word_offset_i_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 423:36]
  wire [511:0] _hit_instrs_1_T = s3_cacheLine_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 424:41]
  wire [31:0] hit_instrs_1 = _hit_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 424:55]
  wire  hit_valids_1 = word_offset_i_1 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 425:41]
  wire [4:0] word_offset_i_2 = word_offset + 5'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 422:38]
  wire [10:0] bit_offset_2 = word_offset_i_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 423:36]
  wire [511:0] _hit_instrs_2_T = s3_cacheLine_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 424:41]
  wire [31:0] hit_instrs_2 = _hit_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 424:55]
  wire  hit_valids_2 = word_offset_i_2 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 425:41]
  wire [4:0] word_offset_i_3 = word_offset + 5'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 422:38]
  wire [10:0] bit_offset_3 = word_offset_i_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 423:36]
  wire [511:0] _hit_instrs_3_T = s3_cacheLine_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 424:41]
  wire [31:0] hit_instrs_3 = _hit_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 424:55]
  wire  hit_valids_3 = word_offset_i_3 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 425:41]
  wire [511:0] _miss_instrs_0_T = miss_data_buffer >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 439:41]
  wire [31:0] miss_instrs_0 = _miss_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 439:55]
  wire [511:0] _miss_instrs_1_T = miss_data_buffer >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 439:41]
  wire [31:0] miss_instrs_1 = _miss_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 439:55]
  wire [511:0] _miss_instrs_2_T = miss_data_buffer >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 439:41]
  wire [31:0] miss_instrs_2 = _miss_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 439:55]
  wire [511:0] _miss_instrs_3_T = miss_data_buffer >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 439:41]
  wire [31:0] miss_instrs_3 = _miss_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 439:55]
  reg [31:0] uncache_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 444:32]
  reg  uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 445:35]
  wire  _T_33 = s3_hit & s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 483:19]
  wire [31:0] _GEN_162 = s3_hit & s3_valid ? hit_instrs_0 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 460:17 483:32 484:23]
  wire [31:0] _GEN_163 = s3_hit & s3_valid ? hit_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 460:17 483:32 484:23]
  wire [31:0] _GEN_164 = s3_hit & s3_valid ? hit_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 460:17 483:32 484:23]
  wire [31:0] _GEN_165 = s3_hit & s3_valid ? hit_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 460:17 483:32 484:23]
  wire  _GEN_166 = s3_hit & s3_valid & hit_valids_0; // @[src/main/scala/icache/ICacheMainPipe.scala 461:21 483:32 485:27]
  wire  _GEN_167 = s3_hit & s3_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 461:21 483:32 485:27]
  wire  _GEN_168 = s3_hit & s3_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 461:21 483:32 485:27]
  wire  _GEN_169 = s3_hit & s3_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 461:21 483:32 485:27]
  wire  _GEN_182 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 510:44 515:26 521:26]
  wire  _GEN_183 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 510:44 515:26 521:26]
  wire  _GEN_184 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 510:44 515:26 521:26]
  wire  _GEN_185 = _s1_can_bypass_T_10 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 510:44 515:26 521:26]
  wire [31:0] _GEN_186 = uncache_data_valid ? uncache_data_buffer : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 501:23]
  wire  _GEN_194 = uncache_data_valid | _s1_can_bypass_T_10; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 506:22]
  wire  _GEN_197 = uncache_data_valid ? 1'h0 : _GEN_182; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 509:26]
  wire  _GEN_198 = uncache_data_valid ? 1'h0 : _GEN_183; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 509:26]
  wire  _GEN_199 = uncache_data_valid ? 1'h0 : _GEN_184; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 509:26]
  wire  _GEN_200 = uncache_data_valid ? 1'h0 : _GEN_185; // @[src/main/scala/icache/ICacheMainPipe.scala 500:38 509:26]
  wire [31:0] _GEN_201 = miss_data_valid ? miss_instrs_0 : _GEN_186; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 494:23]
  wire [31:0] _GEN_202 = miss_data_valid ? miss_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 494:23]
  wire [31:0] _GEN_203 = miss_data_valid ? miss_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 494:23]
  wire [31:0] _GEN_204 = miss_data_valid ? miss_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 494:23]
  wire  _GEN_205 = miss_data_valid ? hit_valids_0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 495:27]
  wire  _GEN_206 = miss_data_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 495:27]
  wire  _GEN_207 = miss_data_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 495:27]
  wire  _GEN_208 = miss_data_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 495:27]
  wire  _GEN_209 = miss_data_valid | _GEN_194; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 496:22]
  wire  _GEN_211 = miss_data_valid ? 1'h0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 498:25]
  wire  _GEN_212 = miss_data_valid ? 1'h0 : _GEN_197; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 499:26]
  wire  _GEN_213 = miss_data_valid ? 1'h0 : _GEN_198; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 499:26]
  wire  _GEN_214 = miss_data_valid ? 1'h0 : _GEN_199; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 499:26]
  wire  _GEN_215 = miss_data_valid ? 1'h0 : _GEN_200; // @[src/main/scala/icache/ICacheMainPipe.scala 493:29 499:26]
  wire  _GEN_222 = _T_30 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 465:20 530:24]
  wire  _GEN_223 = _T_30 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 465:20 530:24]
  wire  _GEN_224 = _T_30 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 465:20 530:24]
  wire  _GEN_225 = _T_30 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 465:20 530:24]
  wire [31:0] _GEN_226 = _T_31 ? _GEN_201 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire [31:0] _GEN_227 = _T_31 ? _GEN_202 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire [31:0] _GEN_228 = _T_31 ? _GEN_203 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire [31:0] _GEN_229 = _T_31 ? _GEN_204 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire  _GEN_230 = _T_31 & _GEN_205; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 461:21]
  wire  _GEN_231 = _T_31 & _GEN_206; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 461:21]
  wire  _GEN_232 = _T_31 & _GEN_207; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 461:21]
  wire  _GEN_233 = _T_31 & _GEN_208; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17 461:21]
  wire  _GEN_234 = _T_31 ? _GEN_209 : _T_30; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire  _GEN_237 = _T_31 ? _GEN_212 : _GEN_222; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire  _GEN_238 = _T_31 ? _GEN_213 : _GEN_223; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire  _GEN_239 = _T_31 ? _GEN_214 : _GEN_224; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire  _GEN_240 = _T_31 ? _GEN_215 : _GEN_225; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  wire [31:0] _io_axi_ar_data_araddr_T = {s3_ptag,s3_pidx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 584:34]
  wire  _T_40 = state == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 589:20]
  wire [3:0] _GEN_259 = state == 4'h5 ? 4'hd : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 589:39 591:28 599:28]
  wire [31:0] _GEN_260 = state == 4'h5 ? s3_paddr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 589:39 592:28 601:28]
  wire [1:0] _GEN_262 = state == 4'h5 ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 589:39 594:28 603:28]
  wire [3:0] _GEN_266 = state == 4'h2 ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 585:28]
  wire [1:0] _GEN_267 = state == 4'h2 ? 2'h2 : _GEN_262; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 586:28]
  wire  _GEN_268 = state == 4'h2 | _T_40; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 587:28]
  wire  _io_axi_r_rready_T = state == 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 610:31]
  wire  _io_axi_r_rready_T_1 = state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 610:58]
  reg [3:0] beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 616:31]
  wire [9:0] data_offset = beat_counter * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 621:30]
  wire [1054:0] _GEN_4 = {{1023'd0}, io_axi_r_data_rdata}; // @[src/main/scala/icache/ICacheMainPipe.scala 622:67]
  wire [1054:0] _miss_data_buffer_T = _GEN_4 << data_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 622:67]
  wire [1054:0] _GEN_292 = {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 622:44]
  wire [1054:0] _miss_data_buffer_T_1 = _GEN_292 | _miss_data_buffer_T; // @[src/main/scala/icache/ICacheMainPipe.scala 622:44]
  wire [3:0] _beat_counter_T_1 = beat_counter + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 623:36]
  wire  _GEN_269 = io_axi_r_data_rlast | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 625:33 626:25 177:32]
  wire [1054:0] _GEN_271 = io_axi_r_data_rvalid ? _miss_data_buffer_T_1 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 618:32 622:24 188:29]
  wire [1054:0] _GEN_274 = _io_axi_r_rready_T & io_axi_r_data_rvalid & _T_22 ? _GEN_271 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 188:29 614:98]
  wire [1054:0] _GEN_276 = s3_fire ? 1055'h0 : _GEN_274; // @[src/main/scala/icache/ICacheMainPipe.scala 632:17 633:22]
  wire  _GEN_285 = _io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_28 | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 671:104 673:24 445:35]
  assign io_cpu_req_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 60:26]
  assign io_icache_resp_valid = _T_10 ? _T_33 : _GEN_234; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instrs_0 = _T_10 ? _GEN_162 : _GEN_226; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instrs_1 = _T_10 ? _GEN_163 : _GEN_227; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instrs_2 = _T_10 ? _GEN_164 : _GEN_228; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instrs_3 = _T_10 ? _GEN_165 : _GEN_229; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instvalids_0 = _T_10 ? _GEN_166 : _GEN_230; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instvalids_1 = _T_10 ? _GEN_167 : _GEN_231; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instvalids_2 = _T_10 ? _GEN_168 : _GEN_232; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_instvalids_3 = _T_10 ? _GEN_169 : _GEN_233; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_addr = s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 471:28]
  assign io_icache_resp_bits_uncached = _T_10 ? 1'h0 : _T_31 & _GEN_211; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_mmu_error_excpTlbRefill = _T_10 ? 1'h0 : _GEN_237; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPif = _T_10 ? 1'h0 : _GEN_238; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPpi = _T_10 ? 1'h0 : _GEN_239; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_icache_resp_bits_mmu_error_excpAdef = _T_10 ? 1'h0 : _GEN_240; // @[src/main/scala/icache/ICacheMainPipe.scala 481:17]
  assign io_axi_ar_data_arid = state == 4'h2 ? 4'hc : _GEN_259; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 583:28]
  assign io_axi_ar_data_araddr = state == 4'h2 ? _io_axi_ar_data_araddr_T : _GEN_260; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 584:28]
  assign io_axi_ar_data_arlen = {{4'd0}, _GEN_266};
  assign io_axi_ar_data_arsize = {{1'd0}, _GEN_267};
  assign io_axi_ar_data_arburst = {{1'd0}, _GEN_268};
  assign io_axi_ar_data_arvalid = state == 4'h2 | _T_40; // @[src/main/scala/icache/ICacheMainPipe.scala 581:30 587:28]
  assign io_axi_r_rready = state == 4'h3 | state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 610:48]
  assign io_arrays_read_req_valid = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 89:40]
  assign io_arrays_read_req_idx = s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 90:29]
  assign io_array_write_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_array_write_idx = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_pidx : 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 639:26 654:26]
  assign io_array_write_way = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? io_victim_read_resp : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 645:26 657:26]
  assign io_array_write_tag = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_ptag : 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 640:26 655:26]
  assign io_array_write_data = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? miss_data_buffer : 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 641:26 656:26]
  assign io_victim_read_req = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_victim_read_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 285:22]
  assign io_replacer_touch_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_replacer_touch_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 285:22]
  assign io_replacer_touch_way = io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 649:27 664:27]
  assign io_mmu_toMmu_valid = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 92:33]
  assign io_mmu_toMmu_bits_vaddr = s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 93:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 75:15]
    end else if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
      s0_valid <= io_cpu_req_bits_addr != 32'h1bfffffc; // @[src/main/scala/icache/ICacheMainPipe.scala 78:14]
    end else if (s0_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 82:22]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 83:15]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 112:15]
    end else begin
      s1_valid <= _GEN_10;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 201:14]
    end else begin
      s2_valid <= _GEN_61;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 248:22]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 248:22]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 408:18]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 409:11]
    end else if (4'h0 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
      if (s3_valid & _T & ~s3_hit) begin // @[src/main/scala/icache/ICacheMainPipe.scala 328:46]
        state <= _GEN_145;
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 343:20]
      end
    end else if (4'h1 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 326:17]
      state <= 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 349:18]
    end else begin
      state <= _GEN_158;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 258:14]
    end else begin
      s3_valid <= _GEN_118;
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_hit <= s2_hit | s2_can_bypass_from_s1 | s2_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 267:12]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
    end else if (s1_fire | io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 137:23]
    end else begin
      s1_array_received <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
    end else if (_T_4) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 144:21]
    end else begin
      s1_mmu_received <= _GEN_44;
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
        s0_vaddr <= io_cpu_req_bits_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 79:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
        s0_vidx <= curr_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 80:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      if (_io_arrays_read_req_valid_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 113:35]
        s1_vaddr <= s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 115:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      if (_io_arrays_read_req_valid_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 113:35]
        s1_vidx <= s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 116:14]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_paddr <= io_mmu_fromMmu_bits_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_cacheable <= io_mmu_fromMmu_bits_cacheable; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbRefill <= io_mmu_fromMmu_bits_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbPif <= io_mmu_fromMmu_bits_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbPpi <= io_mmu_fromMmu_bits_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpAdef <= io_mmu_fromMmu_bits_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        s2_vaddr <= s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 208:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 170:21]
          s2_paddr <= s1_mmu_received_data_paddr;
        end else begin
          s2_paddr <= io_mmu_fromMmu_bits_paddr;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 213:23]
          s2_uncached <= ~s1_mmu_received_data_cacheable;
        end else begin
          s2_uncached <= ~io_mmu_fromMmu_bits_cacheable;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 214:24]
          s2_mmu_error_excpTlbRefill <= s1_mmu_received_data_error_excpTlbRefill;
        end else begin
          s2_mmu_error_excpTlbRefill <= io_mmu_fromMmu_bits_error_excpTlbRefill;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 214:24]
          s2_mmu_error_excpTlbPif <= s1_mmu_received_data_error_excpTlbPif;
        end else begin
          s2_mmu_error_excpTlbPif <= io_mmu_fromMmu_bits_error_excpTlbPif;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 214:24]
          s2_mmu_error_excpTlbPpi <= s1_mmu_received_data_error_excpTlbPpi;
        end else begin
          s2_mmu_error_excpTlbPpi <= io_mmu_fromMmu_bits_error_excpTlbPpi;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 214:24]
          s2_mmu_error_excpAdef <= s1_mmu_received_data_error_excpAdef;
        end else begin
          s2_mmu_error_excpAdef <= io_mmu_fromMmu_bits_error_excpAdef;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        s2_vidx <= s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 209:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:20]
          s2_ptag <= s1_mmu_received_data_paddr[31:14];
        end else begin
          s2_ptag <= io_mmu_fromMmu_bits_paddr[31:14];
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_0_has <= s1_array_received_data_cacheLine_0_has;
        end else begin
          s2_array_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_0_tag <= s1_array_received_data_cacheLine_0_tag;
        end else begin
          s2_array_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_0_data <= s1_array_received_data_cacheLine_0_data;
        end else begin
          s2_array_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_1_has <= s1_array_received_data_cacheLine_1_has;
        end else begin
          s2_array_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_1_tag <= s1_array_received_data_cacheLine_1_tag;
        end else begin
          s2_array_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_1_data <= s1_array_received_data_cacheLine_1_data;
        end else begin
          s2_array_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_2_has <= s1_array_received_data_cacheLine_2_has;
        end else begin
          s2_array_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_2_tag <= s1_array_received_data_cacheLine_2_tag;
        end else begin
          s2_array_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_2_data <= s1_array_received_data_cacheLine_2_data;
        end else begin
          s2_array_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_3_has <= s1_array_received_data_cacheLine_3_has;
        end else begin
          s2_array_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_3_tag <= s1_array_received_data_cacheLine_3_tag;
        end else begin
          s2_array_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag;
        end
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:31]
          s2_array_data_cacheLine_3_data <= s1_array_received_data_cacheLine_3_data;
        end else begin
          s2_array_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 177:32]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 177:32]
    end else if (_s3_ready_T_8) begin // @[src/main/scala/icache/ICacheMainPipe.scala 683:38]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 685:21]
    end else if (_io_axi_r_rready_T & io_axi_r_data_rvalid & _T_22) begin // @[src/main/scala/icache/ICacheMainPipe.scala 614:98]
      if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 618:32]
        miss_data_valid <= _GEN_269;
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_vaddr <= s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 261:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_paddr <= s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 262:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_uncached <= s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 264:17]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_mmu_error_excpTlbRefill <= s2_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 265:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_mmu_error_excpTlbPif <= s2_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 265:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_mmu_error_excpTlbPpi <= s2_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 265:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_mmu_error_excpAdef <= s2_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 265:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        s3_miss <= s2_cache_miss & (~s2_can_bypass_from_s1 & ~s2_can_bypass); // @[src/main/scala/icache/ICacheMainPipe.scala 274:13]
      end
    end
    miss_data_buffer <= _GEN_276[511:0];
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        s2_bypass_data_from_s1 <= miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 216:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 195:38]
      s2_can_bypass_from_s1 <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 195:38]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 200:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 202:36]
        s2_can_bypass_from_s1 <= s1_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 217:27]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 257:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 259:36]
        if (s2_can_bypass_from_s1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 275:29]
          s3_cacheLine_data <= s2_bypass_data_from_s1;
        end else if (s2_can_bypass) begin // @[src/main/scala/icache/ICacheMainPipe.scala 277:10]
          s3_cacheLine_data <= miss_data_buffer;
        end else begin
          s3_cacheLine_data <= _GEN_116;
        end
      end
    end
    if (_io_axi_r_rready_T_1 & io_axi_r_data_rvalid & _T_28) begin // @[src/main/scala/icache/ICacheMainPipe.scala 671:104]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 672:25]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 445:35]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 445:35]
    end else if (_s3_ready_T_8) begin // @[src/main/scala/icache/ICacheMainPipe.scala 683:38]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 687:24]
    end else begin
      uncache_data_valid <= _GEN_285;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 616:31]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 616:31]
    end else if (io_axi_r_data_rvalid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 618:32]
      if (io_axi_r_data_rlast) begin // @[src/main/scala/icache/ICacheMainPipe.scala 625:33]
        beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 627:22]
      end else begin
        beat_counter <= _beat_counter_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 623:20]
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
  s1_array_received_data_cacheLine_2_has = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_2_tag = _RAND_19[17:0];
  _RAND_20 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_2_data = _RAND_20[511:0];
  _RAND_21 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_has = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_tag = _RAND_22[17:0];
  _RAND_23 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_3_data = _RAND_23[511:0];
  _RAND_24 = {1{`RANDOM}};
  s1_mmu_received_data_paddr = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_mmu_received_data_cacheable = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbRefill = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbPif = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbPpi = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpAdef = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s2_vaddr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s2_paddr = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s2_uncached = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s2_mmu_error_excpTlbRefill = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  s2_mmu_error_excpTlbPif = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  s2_mmu_error_excpTlbPpi = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s2_mmu_error_excpAdef = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  s2_vidx = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  s2_ptag = _RAND_38[17:0];
  _RAND_39 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_has = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_tag = _RAND_40[17:0];
  _RAND_41 = {16{`RANDOM}};
  s2_array_data_cacheLine_0_data = _RAND_41[511:0];
  _RAND_42 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_has = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_tag = _RAND_43[17:0];
  _RAND_44 = {16{`RANDOM}};
  s2_array_data_cacheLine_1_data = _RAND_44[511:0];
  _RAND_45 = {1{`RANDOM}};
  s2_array_data_cacheLine_2_has = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  s2_array_data_cacheLine_2_tag = _RAND_46[17:0];
  _RAND_47 = {16{`RANDOM}};
  s2_array_data_cacheLine_2_data = _RAND_47[511:0];
  _RAND_48 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_has = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_tag = _RAND_49[17:0];
  _RAND_50 = {16{`RANDOM}};
  s2_array_data_cacheLine_3_data = _RAND_50[511:0];
  _RAND_51 = {1{`RANDOM}};
  miss_data_valid = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  s3_vaddr = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  s3_paddr = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  s3_uncached = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  s3_mmu_error_excpTlbRefill = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s3_mmu_error_excpTlbPif = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  s3_mmu_error_excpTlbPpi = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  s3_mmu_error_excpAdef = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  s3_miss = _RAND_59[0:0];
  _RAND_60 = {16{`RANDOM}};
  miss_data_buffer = _RAND_60[511:0];
  _RAND_61 = {16{`RANDOM}};
  s2_bypass_data_from_s1 = _RAND_61[511:0];
  _RAND_62 = {1{`RANDOM}};
  s2_can_bypass_from_s1 = _RAND_62[0:0];
  _RAND_63 = {16{`RANDOM}};
  s3_cacheLine_data = _RAND_63[511:0];
  _RAND_64 = {1{`RANDOM}};
  uncache_data_buffer = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  uncache_data_valid = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  beat_counter = _RAND_66[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
