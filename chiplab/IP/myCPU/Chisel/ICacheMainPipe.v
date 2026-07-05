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
  reg [3:0] state; // @[src/main/scala/icache/ICacheMainPipe.scala 249:22]
  reg  s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
  reg  s3_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 183:22]
  wire  _s3_ready_T_7 = state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 581:103]
  wire  _s3_ready_T_8 = state == 4'h7 & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 581:114]
  wire  s3_ready = state == 4'h0 & s3_valid & s3_hit | state == 4'h0 & ~s3_valid | state == 4'h7 & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 581:93]
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
  wire [17:0] s3_ptag = s3_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 285:22]
  wire [7:0] s3_pidx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 286:22]
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
  wire  s3_fire = (s3_valid & s3_hit | _s3_ready_T_7) & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 253:59]
  wire  s2_can_bypass = s2_ptag == s3_ptag & s2_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss &
    _s1_can_bypass_T_6 & _s1_can_bypass_T_11; // @[src/main/scala/icache/ICacheMainPipe.scala 256:125]
  wire [511:0] _GEN_114 = 2'h1 == s2_hit_way ? s2_array_data_cacheLine_1_data : s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 278:{10,10}]
  wire [511:0] _GEN_115 = 2'h2 == s2_hit_way ? s2_array_data_cacheLine_2_data : _GEN_114; // @[src/main/scala/icache/ICacheMainPipe.scala 278:{10,10}]
  wire [511:0] _GEN_116 = 2'h3 == s2_hit_way ? s2_array_data_cacheLine_3_data : _GEN_115; // @[src/main/scala/icache/ICacheMainPipe.scala 278:{10,10}]
  wire  _GEN_117 = s3_fire ? 1'h0 : s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 282:23 283:14 178:25]
  wire  _GEN_118 = s2_fire & _T | _GEN_117; // @[src/main/scala/icache/ICacheMainPipe.scala 260:36 261:14]
  wire  _T_10 = 4'h0 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_142 = s3_hit ? 4'h1 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 337:28 338:22 341:22]
  wire [3:0] _GEN_143 = s3_miss ? 4'h2 : _GEN_142; // @[src/main/scala/icache/ICacheMainPipe.scala 335:29 336:22]
  wire [3:0] _GEN_144 = s3_uncached ? 4'h5 : _GEN_143; // @[src/main/scala/icache/ICacheMainPipe.scala 333:33 334:22]
  wire [3:0] _GEN_145 = _s1_can_bypass_T_10 ? 4'h8 : _GEN_144; // @[src/main/scala/icache/ICacheMainPipe.scala 331:40 332:22]
  wire [3:0] _GEN_147 = io_axi_ar_arready ? 4'h3 : 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 355:31 356:20 358:20]
  wire  _T_21 = io_axi_r_data_rvalid & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 364:33]
  wire  _T_22 = io_axi_r_data_rid == 4'hc; // @[src/main/scala/icache/ICacheMainPipe.scala 364:77]
  wire  _T_23 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'hc; // @[src/main/scala/icache/ICacheMainPipe.scala 364:56]
  wire [3:0] _GEN_148 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'hc ? 4'h4 : 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 364:100 365:20 367:20]
  wire [3:0] _GEN_149 = io_axi_ar_arready ? 4'h6 : 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 378:31 379:20 381:20]
  wire  _T_28 = io_axi_r_data_rid == 4'hd; // @[src/main/scala/icache/ICacheMainPipe.scala 387:77]
  wire  _T_29 = _T_21 & io_axi_r_data_rid == 4'hd; // @[src/main/scala/icache/ICacheMainPipe.scala 387:56]
  wire [3:0] _GEN_150 = _T_21 & io_axi_r_data_rid == 4'hd ? 4'h7 : 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 387:103 388:20 390:20]
  wire  _T_30 = 4'h8 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire  _T_31 = 4'h7 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_151 = io_icache_resp_ready ? 4'h0 : 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 401:23 402:20 404:20]
  wire [3:0] _GEN_152 = _T_23 ? 4'h0 : 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 411:100 412:20 414:20]
  wire [3:0] _GEN_153 = _T_29 ? 4'h0 : 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 420:103 421:20 423:20]
  wire [3:0] _GEN_154 = 4'ha == state ? _GEN_153 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17 250:28]
  wire [3:0] _GEN_155 = 4'h9 == state ? _GEN_152 : _GEN_154; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_156 = 4'h7 == state ? _GEN_151 : _GEN_155; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_157 = 4'h8 == state ? 4'h7 : _GEN_156; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17 396:18]
  wire [3:0] _GEN_158 = 4'h6 == state ? _GEN_150 : _GEN_157; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_159 = 4'h5 == state ? _GEN_149 : _GEN_158; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_160 = 4'h4 == state ? 4'h7 : _GEN_159; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17 373:18]
  wire [3:0] _GEN_161 = 4'h3 == state ? _GEN_148 : _GEN_160; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire [3:0] _GEN_162 = 4'h2 == state ? _GEN_147 : _GEN_161; // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
  wire  _T_40 = state == 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 433:16]
  wire  _T_41 = state == 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 433:41]
  wire  _T_43 = state == 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 433:68]
  wire  _T_47 = state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 435:22]
  wire  _T_48 = state == 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 435:50]
  wire  _T_50 = state == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 435:80]
  wire [4:0] word_offset = {{1'd0}, s3_vaddr[5:2]}; // @[src/main/scala/icache/ICacheMainPipe.scala 447:25 449:15]
  wire [5:0] _word_offset_i_T = {{1'd0}, word_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 452:38]
  wire [4:0] word_offset_i = _word_offset_i_T[4:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 452:38]
  wire [10:0] bit_offset = word_offset_i * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 453:36]
  wire [511:0] _hit_instrs_0_T = s3_cacheLine_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 454:41]
  wire [31:0] hit_instrs_0 = _hit_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 454:55]
  wire  hit_valids_0 = word_offset_i < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 455:41]
  wire [4:0] word_offset_i_1 = word_offset + 5'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 452:38]
  wire [10:0] bit_offset_1 = word_offset_i_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 453:36]
  wire [511:0] _hit_instrs_1_T = s3_cacheLine_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 454:41]
  wire [31:0] hit_instrs_1 = _hit_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 454:55]
  wire  hit_valids_1 = word_offset_i_1 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 455:41]
  wire [4:0] word_offset_i_2 = word_offset + 5'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 452:38]
  wire [10:0] bit_offset_2 = word_offset_i_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 453:36]
  wire [511:0] _hit_instrs_2_T = s3_cacheLine_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 454:41]
  wire [31:0] hit_instrs_2 = _hit_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 454:55]
  wire  hit_valids_2 = word_offset_i_2 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 455:41]
  wire [4:0] word_offset_i_3 = word_offset + 5'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 452:38]
  wire [10:0] bit_offset_3 = word_offset_i_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 453:36]
  wire [511:0] _hit_instrs_3_T = s3_cacheLine_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 454:41]
  wire [31:0] hit_instrs_3 = _hit_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 454:55]
  wire  hit_valids_3 = word_offset_i_3 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 455:41]
  wire [511:0] _miss_instrs_0_T = miss_data_buffer >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 469:41]
  wire [31:0] miss_instrs_0 = _miss_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 469:55]
  wire [511:0] _miss_instrs_1_T = miss_data_buffer >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 469:41]
  wire [31:0] miss_instrs_1 = _miss_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 469:55]
  wire [511:0] _miss_instrs_2_T = miss_data_buffer >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 469:41]
  wire [31:0] miss_instrs_2 = _miss_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 469:55]
  wire [511:0] _miss_instrs_3_T = miss_data_buffer >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 469:41]
  wire [31:0] miss_instrs_3 = _miss_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 469:55]
  reg [31:0] uncache_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 474:32]
  reg  uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 475:35]
  wire  _T_55 = s3_hit & s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 510:19]
  wire [31:0] _GEN_168 = s3_hit & s3_valid ? hit_instrs_0 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 490:17 510:32 511:23]
  wire [31:0] _GEN_169 = s3_hit & s3_valid ? hit_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 490:17 510:32 511:23]
  wire [31:0] _GEN_170 = s3_hit & s3_valid ? hit_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 490:17 510:32 511:23]
  wire [31:0] _GEN_171 = s3_hit & s3_valid ? hit_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 490:17 510:32 511:23]
  wire  _GEN_172 = s3_hit & s3_valid & hit_valids_0; // @[src/main/scala/icache/ICacheMainPipe.scala 491:21 510:32 512:27]
  wire  _GEN_173 = s3_hit & s3_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 491:21 510:32 512:27]
  wire  _GEN_174 = s3_hit & s3_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 491:21 510:32 512:27]
  wire  _GEN_175 = s3_hit & s3_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 491:21 510:32 512:27]
  wire  _GEN_188 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 537:44 542:26 548:26]
  wire  _GEN_189 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 537:44 542:26 548:26]
  wire  _GEN_190 = _s1_can_bypass_T_10 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 537:44 542:26 548:26]
  wire  _GEN_191 = _s1_can_bypass_T_10 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 537:44 542:26 548:26]
  wire [31:0] _GEN_192 = uncache_data_valid ? uncache_data_buffer : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 528:23]
  wire  _GEN_200 = uncache_data_valid | _s1_can_bypass_T_10; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 533:22]
  wire  _GEN_203 = uncache_data_valid ? 1'h0 : _GEN_188; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 536:26]
  wire  _GEN_204 = uncache_data_valid ? 1'h0 : _GEN_189; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 536:26]
  wire  _GEN_205 = uncache_data_valid ? 1'h0 : _GEN_190; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 536:26]
  wire  _GEN_206 = uncache_data_valid ? 1'h0 : _GEN_191; // @[src/main/scala/icache/ICacheMainPipe.scala 527:38 536:26]
  wire [31:0] _GEN_207 = miss_data_valid ? miss_instrs_0 : _GEN_192; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 521:23]
  wire [31:0] _GEN_208 = miss_data_valid ? miss_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 521:23]
  wire [31:0] _GEN_209 = miss_data_valid ? miss_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 521:23]
  wire [31:0] _GEN_210 = miss_data_valid ? miss_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 521:23]
  wire  _GEN_211 = miss_data_valid ? hit_valids_0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 522:27]
  wire  _GEN_212 = miss_data_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 522:27]
  wire  _GEN_213 = miss_data_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 522:27]
  wire  _GEN_214 = miss_data_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 522:27]
  wire  _GEN_215 = miss_data_valid | _GEN_200; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 523:22]
  wire  _GEN_217 = miss_data_valid ? 1'h0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 525:25]
  wire  _GEN_218 = miss_data_valid ? 1'h0 : _GEN_203; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 526:26]
  wire  _GEN_219 = miss_data_valid ? 1'h0 : _GEN_204; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 526:26]
  wire  _GEN_220 = miss_data_valid ? 1'h0 : _GEN_205; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 526:26]
  wire  _GEN_221 = miss_data_valid ? 1'h0 : _GEN_206; // @[src/main/scala/icache/ICacheMainPipe.scala 520:29 526:26]
  wire  _GEN_228 = _T_30 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 495:20 557:24]
  wire  _GEN_229 = _T_30 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 495:20 557:24]
  wire  _GEN_230 = _T_30 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 495:20 557:24]
  wire  _GEN_231 = _T_30 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 495:20 557:24]
  wire [31:0] _GEN_232 = _T_31 ? _GEN_207 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire [31:0] _GEN_233 = _T_31 ? _GEN_208 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire [31:0] _GEN_234 = _T_31 ? _GEN_209 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire [31:0] _GEN_235 = _T_31 ? _GEN_210 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire  _GEN_236 = _T_31 & _GEN_211; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 491:21]
  wire  _GEN_237 = _T_31 & _GEN_212; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 491:21]
  wire  _GEN_238 = _T_31 & _GEN_213; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 491:21]
  wire  _GEN_239 = _T_31 & _GEN_214; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17 491:21]
  wire  _GEN_240 = _T_31 ? _GEN_215 : _T_30; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire  _GEN_243 = _T_31 ? _GEN_218 : _GEN_228; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire  _GEN_244 = _T_31 ? _GEN_219 : _GEN_229; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire  _GEN_245 = _T_31 ? _GEN_220 : _GEN_230; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire  _GEN_246 = _T_31 ? _GEN_221 : _GEN_231; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  wire [31:0] _io_axi_ar_data_araddr_T = {s3_ptag,s3_pidx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 611:34]
  wire [3:0] _GEN_265 = _T_50 ? 4'hd : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 616:39 618:28 626:28]
  wire [31:0] _GEN_266 = _T_50 ? s3_paddr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 616:39 619:28 628:28]
  wire [1:0] _GEN_268 = _T_50 ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 616:39 621:28 630:28]
  wire [3:0] _GEN_272 = _T_43 ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 612:28]
  wire [1:0] _GEN_273 = _T_43 ? 2'h2 : _GEN_268; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 613:28]
  wire  _GEN_274 = _T_43 | _T_50; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 614:28]
  reg [3:0] beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 642:29]
  wire [9:0] data_offset = beat_counter * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 650:30]
  wire [1054:0] _GEN_4 = {{1023'd0}, io_axi_r_data_rdata}; // @[src/main/scala/icache/ICacheMainPipe.scala 651:67]
  wire [1054:0] _miss_data_buffer_T = _GEN_4 << data_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 651:67]
  wire [1054:0] _GEN_304 = {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 651:44]
  wire [1054:0] _miss_data_buffer_T_1 = _GEN_304 | _miss_data_buffer_T; // @[src/main/scala/icache/ICacheMainPipe.scala 651:44]
  wire [3:0] _beat_counter_T_1 = beat_counter + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 652:36]
  wire  _GEN_275 = io_axi_r_data_rlast | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 654:33 655:25 177:32]
  wire [3:0] _GEN_276 = io_axi_r_data_rlast ? 4'h0 : _beat_counter_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 652:20 654:33 656:22]
  wire [1054:0] _GEN_277 = io_axi_r_data_rvalid ? _miss_data_buffer_T_1 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 647:32 651:24 188:29]
  wire [3:0] _GEN_278 = io_axi_r_data_rvalid ? _GEN_276 : beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 642:29 647:32]
  wire  _GEN_279 = io_axi_r_data_rvalid ? _GEN_275 : miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 177:32 647:32]
  wire [1054:0] _GEN_280 = _T_40 & io_axi_r_data_rvalid & _T_22 ? _GEN_277 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 188:29 645:98]
  wire [1054:0] _GEN_284 = s3_fire ? 1055'h0 : _GEN_280; // @[src/main/scala/icache/ICacheMainPipe.scala 666:17 667:22]
  wire  _GEN_293 = _T_47 & io_axi_r_data_rvalid & _T_28 | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 705:104 707:24 475:35]
  wire [1054:0] _GEN_298 = io_redirect ? 1055'h0 : _GEN_284; // @[src/main/scala/icache/ICacheMainPipe.scala 728:18 731:23]
  assign io_cpu_req_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 60:26]
  assign io_icache_resp_valid = _T_10 ? _T_55 : _GEN_240; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instrs_0 = _T_10 ? _GEN_168 : _GEN_232; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instrs_1 = _T_10 ? _GEN_169 : _GEN_233; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instrs_2 = _T_10 ? _GEN_170 : _GEN_234; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instrs_3 = _T_10 ? _GEN_171 : _GEN_235; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instvalids_0 = _T_10 ? _GEN_172 : _GEN_236; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instvalids_1 = _T_10 ? _GEN_173 : _GEN_237; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instvalids_2 = _T_10 ? _GEN_174 : _GEN_238; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_instvalids_3 = _T_10 ? _GEN_175 : _GEN_239; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_addr = s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 501:28]
  assign io_icache_resp_bits_uncached = _T_10 ? 1'h0 : _T_31 & _GEN_217; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_mmu_error_excpTlbRefill = _T_10 ? 1'h0 : _GEN_243; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPif = _T_10 ? 1'h0 : _GEN_244; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPpi = _T_10 ? 1'h0 : _GEN_245; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_icache_resp_bits_mmu_error_excpAdef = _T_10 ? 1'h0 : _GEN_246; // @[src/main/scala/icache/ICacheMainPipe.scala 508:17]
  assign io_axi_ar_data_arid = _T_43 ? 4'hc : _GEN_265; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 610:28]
  assign io_axi_ar_data_araddr = _T_43 ? _io_axi_ar_data_araddr_T : _GEN_266; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 611:28]
  assign io_axi_ar_data_arlen = {{4'd0}, _GEN_272};
  assign io_axi_ar_data_arsize = {{1'd0}, _GEN_273};
  assign io_axi_ar_data_arburst = {{1'd0}, _GEN_274};
  assign io_axi_ar_data_arvalid = _T_43 | _T_50; // @[src/main/scala/icache/ICacheMainPipe.scala 608:30 614:28]
  assign io_axi_r_rready = _T_40 | _T_47 | _T_41 | _T_48; // @[src/main/scala/icache/ICacheMainPipe.scala 638:106]
  assign io_arrays_read_req_valid = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 89:40]
  assign io_arrays_read_req_idx = s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 90:29]
  assign io_array_write_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 671:50]
  assign io_array_write_idx = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_pidx : 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 671:64 673:26 688:26]
  assign io_array_write_way = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? io_victim_read_resp : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 671:64 679:26 691:26]
  assign io_array_write_tag = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_ptag : 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 671:64 674:26 689:26]
  assign io_array_write_data = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? miss_data_buffer : 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 671:64 675:26 690:26]
  assign io_victim_read_req = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 671:50]
  assign io_victim_read_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 286:22]
  assign io_replacer_touch_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 671:50]
  assign io_replacer_touch_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 286:22]
  assign io_replacer_touch_way = io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 671:64 683:27 698:27]
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
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 249:22]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 249:22]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 432:18]
      if (state == 4'h3 | state == 4'h9 | state == 4'h2 & io_axi_ar_data_arvalid & io_axi_ar_arready) begin // @[src/main/scala/icache/ICacheMainPipe.scala 433:132]
        state <= 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 434:13]
      end else if (state == 4'h6 | state == 4'ha | state == 4'h5 & io_axi_ar_data_arvalid & io_axi_ar_arready) begin // @[src/main/scala/icache/ICacheMainPipe.scala 435:147]
        state <= 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 436:13]
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 438:13]
      end
    end else if (4'h0 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
      if (s3_valid & _T & ~s3_hit) begin // @[src/main/scala/icache/ICacheMainPipe.scala 329:46]
        state <= _GEN_145;
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 344:20]
      end
    end else if (4'h1 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 327:17]
      state <= 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 350:18]
    end else begin
      state <= _GEN_162;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 178:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 259:14]
    end else begin
      s3_valid <= _GEN_118;
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_hit <= s2_hit | s2_can_bypass_from_s1 | s2_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 268:12]
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
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 728:18]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 729:23]
    end else if (_s3_ready_T_8) begin // @[src/main/scala/icache/ICacheMainPipe.scala 717:38]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 719:21]
    end else if (_T_40 & io_axi_r_data_rvalid & _T_22) begin // @[src/main/scala/icache/ICacheMainPipe.scala 645:98]
      miss_data_valid <= _GEN_279;
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_vaddr <= s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 262:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_paddr <= s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 263:14]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_uncached <= s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 265:17]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_mmu_error_excpTlbRefill <= s2_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 266:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_mmu_error_excpTlbPif <= s2_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 266:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_mmu_error_excpTlbPpi <= s2_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 266:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_mmu_error_excpAdef <= s2_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 266:18]
      end
    end
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        s3_miss <= s2_cache_miss & (~s2_can_bypass_from_s1 & ~s2_can_bypass); // @[src/main/scala/icache/ICacheMainPipe.scala 275:13]
      end
    end
    miss_data_buffer <= _GEN_298[511:0];
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
    if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 258:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 260:36]
        if (s2_can_bypass_from_s1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 276:29]
          s3_cacheLine_data <= s2_bypass_data_from_s1;
        end else if (s2_can_bypass) begin // @[src/main/scala/icache/ICacheMainPipe.scala 278:10]
          s3_cacheLine_data <= miss_data_buffer;
        end else begin
          s3_cacheLine_data <= _GEN_116;
        end
      end
    end
    if (_T_47 & io_axi_r_data_rvalid & _T_28) begin // @[src/main/scala/icache/ICacheMainPipe.scala 705:104]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 706:25]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 475:35]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 475:35]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 728:18]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 730:24]
    end else if (_s3_ready_T_8) begin // @[src/main/scala/icache/ICacheMainPipe.scala 717:38]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 721:24]
    end else begin
      uncache_data_valid <= _GEN_293;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 642:29]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 642:29]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 728:18]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 732:23]
    end else if (_T_41 & io_axi_r_data_rvalid & _T_22 & io_axi_r_data_rlast) begin // @[src/main/scala/icache/ICacheMainPipe.scala 662:122]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 663:18]
    end else if (_T_40 & io_axi_r_data_rvalid & _T_22) begin // @[src/main/scala/icache/ICacheMainPipe.scala 645:98]
      beat_counter <= _GEN_278;
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
