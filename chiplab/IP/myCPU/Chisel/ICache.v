module ICache(
  input         clock,
  input         reset,
  input         io_redirect, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_cpu_req_ready, // @[src/main/scala/icache/Icache.scala 14:14]
  input         io_cpu_req_valid, // @[src/main/scala/icache/Icache.scala 14:14]
  input  [31:0] io_cpu_req_bits_addr, // @[src/main/scala/icache/Icache.scala 14:14]
  input         io_icache_resp_ready, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_valid, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_icache_resp_bits_instrs_0, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_icache_resp_bits_instrs_1, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_icache_resp_bits_instrs_2, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_icache_resp_bits_instrs_3, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_bits_instvalids_0, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_bits_instvalids_1, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_bits_instvalids_2, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_bits_instvalids_3, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_icache_resp_bits_addr, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_icache_resp_bits_uncached, // @[src/main/scala/icache/Icache.scala 14:14]
  output [3:0]  io_axi_master_ar_data_arid, // @[src/main/scala/icache/Icache.scala 14:14]
  output [31:0] io_axi_master_ar_data_araddr, // @[src/main/scala/icache/Icache.scala 14:14]
  output [7:0]  io_axi_master_ar_data_arlen, // @[src/main/scala/icache/Icache.scala 14:14]
  output [2:0]  io_axi_master_ar_data_arsize, // @[src/main/scala/icache/Icache.scala 14:14]
  output [1:0]  io_axi_master_ar_data_arburst, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_axi_master_ar_data_arvalid, // @[src/main/scala/icache/Icache.scala 14:14]
  input         io_axi_master_ar_arready, // @[src/main/scala/icache/Icache.scala 14:14]
  input  [3:0]  io_axi_master_r_data_rid, // @[src/main/scala/icache/Icache.scala 14:14]
  input  [31:0] io_axi_master_r_data_rdata, // @[src/main/scala/icache/Icache.scala 14:14]
  input         io_axi_master_r_data_rlast, // @[src/main/scala/icache/Icache.scala 14:14]
  input         io_axi_master_r_data_rvalid, // @[src/main/scala/icache/Icache.scala 14:14]
  output        io_axi_master_r_rready // @[src/main/scala/icache/Icache.scala 14:14]
);
  wire  mainPipe_clock; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_reset; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_redirect; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_cpu_req_ready; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_cpu_req_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_cpu_req_bits_addr; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_ready; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_icache_resp_bits_instrs_0; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_icache_resp_bits_instrs_1; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_icache_resp_bits_instrs_2; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_icache_resp_bits_instrs_3; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_bits_instvalids_0; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_bits_instvalids_1; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_bits_instvalids_2; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_bits_instvalids_3; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_icache_resp_bits_addr; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_icache_resp_bits_uncached; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [3:0] mainPipe_io_axi_ar_data_arid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_axi_ar_data_araddr; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [7:0] mainPipe_io_axi_ar_data_arlen; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [2:0] mainPipe_io_axi_ar_data_arsize; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [1:0] mainPipe_io_axi_ar_data_arburst; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_axi_ar_data_arvalid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_axi_ar_arready; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [3:0] mainPipe_io_axi_r_data_rid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_axi_r_data_rdata; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_axi_r_data_rlast; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_axi_r_data_rvalid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_axi_r_rready; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_req_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [7:0] mainPipe_io_arrays_read_req_idx; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_resp_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [17:0] mainPipe_io_arrays_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [511:0] mainPipe_io_arrays_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [17:0] mainPipe_io_arrays_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [511:0] mainPipe_io_arrays_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [17:0] mainPipe_io_arrays_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [511:0] mainPipe_io_arrays_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_arrays_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [17:0] mainPipe_io_arrays_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [511:0] mainPipe_io_arrays_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_array_write_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [7:0] mainPipe_io_array_write_idx; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [1:0] mainPipe_io_array_write_way; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [17:0] mainPipe_io_array_write_tag; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [511:0] mainPipe_io_array_write_data; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_victim_read_req; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [7:0] mainPipe_io_victim_read_idx; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [1:0] mainPipe_io_victim_read_resp; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_replacer_touch_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [7:0] mainPipe_io_replacer_touch_idx; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [1:0] mainPipe_io_replacer_touch_way; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_mmu_req_vaddr; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_mmu_req_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  mainPipe_io_mmu_resp_valid; // @[src/main/scala/icache/Icache.scala 29:24]
  wire [31:0] mainPipe_io_mmu_resp_data_paddr; // @[src/main/scala/icache/Icache.scala 29:24]
  wire  array_clock; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_reset; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_req_valid; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [7:0] array_io_read_req_idx; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_resp_valid; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [17:0] array_io_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [511:0] array_io_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [17:0] array_io_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [511:0] array_io_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [17:0] array_io_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [511:0] array_io_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [17:0] array_io_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [511:0] array_io_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  array_io_write_valid; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [7:0] array_io_write_idx; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [1:0] array_io_write_way; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [17:0] array_io_write_tag; // @[src/main/scala/icache/Icache.scala 30:21]
  wire [511:0] array_io_write_data; // @[src/main/scala/icache/Icache.scala 30:21]
  wire  replacer_clock; // @[src/main/scala/icache/Icache.scala 31:24]
  wire  replacer_reset; // @[src/main/scala/icache/Icache.scala 31:24]
  wire  replacer_io_touch_valid; // @[src/main/scala/icache/Icache.scala 31:24]
  wire [7:0] replacer_io_touch_idx; // @[src/main/scala/icache/Icache.scala 31:24]
  wire [1:0] replacer_io_touch_way; // @[src/main/scala/icache/Icache.scala 31:24]
  wire  replacer_io_victim_req; // @[src/main/scala/icache/Icache.scala 31:24]
  wire [7:0] replacer_io_victim_idx; // @[src/main/scala/icache/Icache.scala 31:24]
  wire [1:0] replacer_io_victim_resp; // @[src/main/scala/icache/Icache.scala 31:24]
  wire  simMMU_clock; // @[src/main/scala/icache/Icache.scala 32:22]
  wire  simMMU_reset; // @[src/main/scala/icache/Icache.scala 32:22]
  wire [31:0] simMMU_io_mmu_req_vaddr; // @[src/main/scala/icache/Icache.scala 32:22]
  wire  simMMU_io_mmu_req_valid; // @[src/main/scala/icache/Icache.scala 32:22]
  wire  simMMU_io_mmu_resp_valid; // @[src/main/scala/icache/Icache.scala 32:22]
  wire [31:0] simMMU_io_mmu_resp_data_paddr; // @[src/main/scala/icache/Icache.scala 32:22]
  ICacheMainPipe mainPipe ( // @[src/main/scala/icache/Icache.scala 29:24]
    .clock(mainPipe_clock),
    .reset(mainPipe_reset),
    .io_redirect(mainPipe_io_redirect),
    .io_cpu_req_ready(mainPipe_io_cpu_req_ready),
    .io_cpu_req_valid(mainPipe_io_cpu_req_valid),
    .io_cpu_req_bits_addr(mainPipe_io_cpu_req_bits_addr),
    .io_icache_resp_ready(mainPipe_io_icache_resp_ready),
    .io_icache_resp_valid(mainPipe_io_icache_resp_valid),
    .io_icache_resp_bits_instrs_0(mainPipe_io_icache_resp_bits_instrs_0),
    .io_icache_resp_bits_instrs_1(mainPipe_io_icache_resp_bits_instrs_1),
    .io_icache_resp_bits_instrs_2(mainPipe_io_icache_resp_bits_instrs_2),
    .io_icache_resp_bits_instrs_3(mainPipe_io_icache_resp_bits_instrs_3),
    .io_icache_resp_bits_instvalids_0(mainPipe_io_icache_resp_bits_instvalids_0),
    .io_icache_resp_bits_instvalids_1(mainPipe_io_icache_resp_bits_instvalids_1),
    .io_icache_resp_bits_instvalids_2(mainPipe_io_icache_resp_bits_instvalids_2),
    .io_icache_resp_bits_instvalids_3(mainPipe_io_icache_resp_bits_instvalids_3),
    .io_icache_resp_bits_addr(mainPipe_io_icache_resp_bits_addr),
    .io_icache_resp_bits_uncached(mainPipe_io_icache_resp_bits_uncached),
    .io_axi_ar_data_arid(mainPipe_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(mainPipe_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(mainPipe_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(mainPipe_io_axi_ar_data_arsize),
    .io_axi_ar_data_arburst(mainPipe_io_axi_ar_data_arburst),
    .io_axi_ar_data_arvalid(mainPipe_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(mainPipe_io_axi_ar_arready),
    .io_axi_r_data_rid(mainPipe_io_axi_r_data_rid),
    .io_axi_r_data_rdata(mainPipe_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(mainPipe_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(mainPipe_io_axi_r_data_rvalid),
    .io_axi_r_rready(mainPipe_io_axi_r_rready),
    .io_arrays_read_req_valid(mainPipe_io_arrays_read_req_valid),
    .io_arrays_read_req_idx(mainPipe_io_arrays_read_req_idx),
    .io_arrays_read_resp_valid(mainPipe_io_arrays_read_resp_valid),
    .io_arrays_read_resp_data_cacheLine_0_has(mainPipe_io_arrays_read_resp_data_cacheLine_0_has),
    .io_arrays_read_resp_data_cacheLine_0_tag(mainPipe_io_arrays_read_resp_data_cacheLine_0_tag),
    .io_arrays_read_resp_data_cacheLine_0_data(mainPipe_io_arrays_read_resp_data_cacheLine_0_data),
    .io_arrays_read_resp_data_cacheLine_1_has(mainPipe_io_arrays_read_resp_data_cacheLine_1_has),
    .io_arrays_read_resp_data_cacheLine_1_tag(mainPipe_io_arrays_read_resp_data_cacheLine_1_tag),
    .io_arrays_read_resp_data_cacheLine_1_data(mainPipe_io_arrays_read_resp_data_cacheLine_1_data),
    .io_arrays_read_resp_data_cacheLine_2_has(mainPipe_io_arrays_read_resp_data_cacheLine_2_has),
    .io_arrays_read_resp_data_cacheLine_2_tag(mainPipe_io_arrays_read_resp_data_cacheLine_2_tag),
    .io_arrays_read_resp_data_cacheLine_2_data(mainPipe_io_arrays_read_resp_data_cacheLine_2_data),
    .io_arrays_read_resp_data_cacheLine_3_has(mainPipe_io_arrays_read_resp_data_cacheLine_3_has),
    .io_arrays_read_resp_data_cacheLine_3_tag(mainPipe_io_arrays_read_resp_data_cacheLine_3_tag),
    .io_arrays_read_resp_data_cacheLine_3_data(mainPipe_io_arrays_read_resp_data_cacheLine_3_data),
    .io_array_write_valid(mainPipe_io_array_write_valid),
    .io_array_write_idx(mainPipe_io_array_write_idx),
    .io_array_write_way(mainPipe_io_array_write_way),
    .io_array_write_tag(mainPipe_io_array_write_tag),
    .io_array_write_data(mainPipe_io_array_write_data),
    .io_victim_read_req(mainPipe_io_victim_read_req),
    .io_victim_read_idx(mainPipe_io_victim_read_idx),
    .io_victim_read_resp(mainPipe_io_victim_read_resp),
    .io_replacer_touch_valid(mainPipe_io_replacer_touch_valid),
    .io_replacer_touch_idx(mainPipe_io_replacer_touch_idx),
    .io_replacer_touch_way(mainPipe_io_replacer_touch_way),
    .io_mmu_req_vaddr(mainPipe_io_mmu_req_vaddr),
    .io_mmu_req_valid(mainPipe_io_mmu_req_valid),
    .io_mmu_resp_valid(mainPipe_io_mmu_resp_valid),
    .io_mmu_resp_data_paddr(mainPipe_io_mmu_resp_data_paddr)
  );
  ICacheArray array ( // @[src/main/scala/icache/Icache.scala 30:21]
    .clock(array_clock),
    .reset(array_reset),
    .io_read_req_valid(array_io_read_req_valid),
    .io_read_req_idx(array_io_read_req_idx),
    .io_read_resp_valid(array_io_read_resp_valid),
    .io_read_resp_data_cacheLine_0_has(array_io_read_resp_data_cacheLine_0_has),
    .io_read_resp_data_cacheLine_0_tag(array_io_read_resp_data_cacheLine_0_tag),
    .io_read_resp_data_cacheLine_0_data(array_io_read_resp_data_cacheLine_0_data),
    .io_read_resp_data_cacheLine_1_has(array_io_read_resp_data_cacheLine_1_has),
    .io_read_resp_data_cacheLine_1_tag(array_io_read_resp_data_cacheLine_1_tag),
    .io_read_resp_data_cacheLine_1_data(array_io_read_resp_data_cacheLine_1_data),
    .io_read_resp_data_cacheLine_2_has(array_io_read_resp_data_cacheLine_2_has),
    .io_read_resp_data_cacheLine_2_tag(array_io_read_resp_data_cacheLine_2_tag),
    .io_read_resp_data_cacheLine_2_data(array_io_read_resp_data_cacheLine_2_data),
    .io_read_resp_data_cacheLine_3_has(array_io_read_resp_data_cacheLine_3_has),
    .io_read_resp_data_cacheLine_3_tag(array_io_read_resp_data_cacheLine_3_tag),
    .io_read_resp_data_cacheLine_3_data(array_io_read_resp_data_cacheLine_3_data),
    .io_write_valid(array_io_write_valid),
    .io_write_idx(array_io_write_idx),
    .io_write_way(array_io_write_way),
    .io_write_tag(array_io_write_tag),
    .io_write_data(array_io_write_data)
  );
  ICacheReplacer replacer ( // @[src/main/scala/icache/Icache.scala 31:24]
    .clock(replacer_clock),
    .reset(replacer_reset),
    .io_touch_valid(replacer_io_touch_valid),
    .io_touch_idx(replacer_io_touch_idx),
    .io_touch_way(replacer_io_touch_way),
    .io_victim_req(replacer_io_victim_req),
    .io_victim_idx(replacer_io_victim_idx),
    .io_victim_resp(replacer_io_victim_resp)
  );
  SimpleMMU simMMU ( // @[src/main/scala/icache/Icache.scala 32:22]
    .clock(simMMU_clock),
    .reset(simMMU_reset),
    .io_mmu_req_vaddr(simMMU_io_mmu_req_vaddr),
    .io_mmu_req_valid(simMMU_io_mmu_req_valid),
    .io_mmu_resp_valid(simMMU_io_mmu_resp_valid),
    .io_mmu_resp_data_paddr(simMMU_io_mmu_resp_data_paddr)
  );
  assign io_cpu_req_ready = mainPipe_io_cpu_req_ready; // @[src/main/scala/icache/Icache.scala 37:24]
  assign io_icache_resp_valid = mainPipe_io_icache_resp_valid; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instrs_0 = mainPipe_io_icache_resp_bits_instrs_0; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instrs_1 = mainPipe_io_icache_resp_bits_instrs_1; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instrs_2 = mainPipe_io_icache_resp_bits_instrs_2; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instrs_3 = mainPipe_io_icache_resp_bits_instrs_3; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instvalids_0 = mainPipe_io_icache_resp_bits_instvalids_0; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instvalids_1 = mainPipe_io_icache_resp_bits_instvalids_1; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instvalids_2 = mainPipe_io_icache_resp_bits_instvalids_2; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_instvalids_3 = mainPipe_io_icache_resp_bits_instvalids_3; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_addr = mainPipe_io_icache_resp_bits_addr; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_icache_resp_bits_uncached = mainPipe_io_icache_resp_bits_uncached; // @[src/main/scala/icache/Icache.scala 38:28]
  assign io_axi_master_ar_data_arid = mainPipe_io_axi_ar_data_arid; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_ar_data_araddr = mainPipe_io_axi_ar_data_araddr; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_ar_data_arlen = mainPipe_io_axi_ar_data_arlen; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_ar_data_arsize = mainPipe_io_axi_ar_data_arsize; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_ar_data_arburst = mainPipe_io_axi_ar_data_arburst; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_ar_data_arvalid = mainPipe_io_axi_ar_data_arvalid; // @[src/main/scala/icache/Icache.scala 39:20]
  assign io_axi_master_r_rready = mainPipe_io_axi_r_rready; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_clock = clock;
  assign mainPipe_reset = reset;
  assign mainPipe_io_redirect = io_redirect; // @[src/main/scala/icache/Icache.scala 43:24]
  assign mainPipe_io_cpu_req_valid = io_cpu_req_valid; // @[src/main/scala/icache/Icache.scala 37:24]
  assign mainPipe_io_cpu_req_bits_addr = io_cpu_req_bits_addr; // @[src/main/scala/icache/Icache.scala 37:24]
  assign mainPipe_io_icache_resp_ready = io_icache_resp_ready; // @[src/main/scala/icache/Icache.scala 38:28]
  assign mainPipe_io_axi_ar_arready = io_axi_master_ar_arready; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_io_axi_r_data_rid = io_axi_master_r_data_rid; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_io_axi_r_data_rdata = io_axi_master_r_data_rdata; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_io_axi_r_data_rlast = io_axi_master_r_data_rlast; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_io_axi_r_data_rvalid = io_axi_master_r_data_rvalid; // @[src/main/scala/icache/Icache.scala 39:20]
  assign mainPipe_io_arrays_read_resp_valid = array_io_read_resp_valid; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_0_has = array_io_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_0_tag = array_io_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_0_data = array_io_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_1_has = array_io_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_1_tag = array_io_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_1_data = array_io_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_2_has = array_io_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_2_tag = array_io_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_2_data = array_io_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_3_has = array_io_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_3_tag = array_io_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_arrays_read_resp_data_cacheLine_3_data = array_io_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/Icache.scala 41:28]
  assign mainPipe_io_victim_read_resp = replacer_io_victim_resp; // @[src/main/scala/icache/Icache.scala 50:28]
  assign mainPipe_io_mmu_resp_valid = simMMU_io_mmu_resp_valid; // @[src/main/scala/icache/Icache.scala 52:19]
  assign mainPipe_io_mmu_resp_data_paddr = simMMU_io_mmu_resp_data_paddr; // @[src/main/scala/icache/Icache.scala 52:19]
  assign array_clock = clock;
  assign array_reset = reset;
  assign array_io_read_req_valid = mainPipe_io_arrays_read_req_valid; // @[src/main/scala/icache/Icache.scala 41:28]
  assign array_io_read_req_idx = mainPipe_io_arrays_read_req_idx; // @[src/main/scala/icache/Icache.scala 41:28]
  assign array_io_write_valid = mainPipe_io_array_write_valid; // @[src/main/scala/icache/Icache.scala 42:28]
  assign array_io_write_idx = mainPipe_io_array_write_idx; // @[src/main/scala/icache/Icache.scala 42:28]
  assign array_io_write_way = mainPipe_io_array_write_way; // @[src/main/scala/icache/Icache.scala 42:28]
  assign array_io_write_tag = mainPipe_io_array_write_tag; // @[src/main/scala/icache/Icache.scala 42:28]
  assign array_io_write_data = mainPipe_io_array_write_data; // @[src/main/scala/icache/Icache.scala 42:28]
  assign replacer_clock = clock;
  assign replacer_reset = reset;
  assign replacer_io_touch_valid = mainPipe_io_replacer_touch_valid; // @[src/main/scala/icache/Icache.scala 51:31]
  assign replacer_io_touch_idx = mainPipe_io_replacer_touch_idx; // @[src/main/scala/icache/Icache.scala 51:31]
  assign replacer_io_touch_way = mainPipe_io_replacer_touch_way; // @[src/main/scala/icache/Icache.scala 51:31]
  assign replacer_io_victim_req = mainPipe_io_victim_read_req; // @[src/main/scala/icache/Icache.scala 50:28]
  assign replacer_io_victim_idx = mainPipe_io_victim_read_idx; // @[src/main/scala/icache/Icache.scala 50:28]
  assign simMMU_clock = clock;
  assign simMMU_reset = reset;
  assign simMMU_io_mmu_req_vaddr = mainPipe_io_mmu_req_vaddr; // @[src/main/scala/icache/Icache.scala 52:19]
  assign simMMU_io_mmu_req_valid = mainPipe_io_mmu_req_valid; // @[src/main/scala/icache/Icache.scala 52:19]
endmodule
