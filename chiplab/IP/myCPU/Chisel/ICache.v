module ICache(
  input         clock,
  input         reset,
  input  [31:0] io_cpu_if_req_addr, // @[src/main/scala/icache/icache.scala 12:14]
  input         io_cpu_if_req_valid, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_cpu_if_resp_instrs_0, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_cpu_if_resp_instrs_1, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_cpu_if_resp_instrs_2, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_cpu_if_resp_instrs_3, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_cpu_if_resp_addr, // @[src/main/scala/icache/icache.scala 12:14]
  output        io_cpu_if_resp_valid, // @[src/main/scala/icache/icache.scala 12:14]
  output [31:0] io_axi_master_ar_data_araddr, // @[src/main/scala/icache/icache.scala 12:14]
  output [7:0]  io_axi_master_ar_data_arlen, // @[src/main/scala/icache/icache.scala 12:14]
  output [2:0]  io_axi_master_ar_data_arsize, // @[src/main/scala/icache/icache.scala 12:14]
  output [1:0]  io_axi_master_ar_data_arburst, // @[src/main/scala/icache/icache.scala 12:14]
  output        io_axi_master_ar_data_arvalid, // @[src/main/scala/icache/icache.scala 12:14]
  input         io_axi_master_ar_arready, // @[src/main/scala/icache/icache.scala 12:14]
  input  [31:0] io_axi_master_r_data_rdata, // @[src/main/scala/icache/icache.scala 12:14]
  input         io_axi_master_r_data_rlast, // @[src/main/scala/icache/icache.scala 12:14]
  input         io_axi_master_r_data_rvalid, // @[src/main/scala/icache/icache.scala 12:14]
  output        io_axi_master_r_rready // @[src/main/scala/icache/icache.scala 12:14]
);
  wire  mainPipe_clock; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_reset; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_req_addr; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_cpu_req_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_resp_instrs_0; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_resp_instrs_1; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_resp_instrs_2; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_resp_instrs_3; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_cpu_resp_addr; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_cpu_resp_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_meta_read_req_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_meta_read_req_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_meta_read_resp_data_0_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_meta_read_resp_data_0_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_meta_read_resp_data_1_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_meta_read_resp_data_1_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_meta_read_resp_data_2_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_meta_read_resp_data_2_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_meta_read_resp_data_3_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_meta_read_resp_data_3_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_data_read_req_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_data_read_req_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire [511:0] mainPipe_io_data_read_resp_data_0; // @[src/main/scala/icache/icache.scala 35:24]
  wire [511:0] mainPipe_io_data_read_resp_data_1; // @[src/main/scala/icache/icache.scala 35:24]
  wire [511:0] mainPipe_io_data_read_resp_data_2; // @[src/main/scala/icache/icache.scala 35:24]
  wire [511:0] mainPipe_io_data_read_resp_data_3; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_miss_req_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [31:0] mainPipe_io_miss_req_bits_addr; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_miss_req_bits_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_miss_req_bits_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire [1:0] mainPipe_io_miss_req_bits_victim_way; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_miss_resp_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [511:0] mainPipe_io_miss_resp_bits_data; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_miss_resp_bits_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire [17:0] mainPipe_io_miss_resp_bits_tag; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_replacer_touch_valid; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_replacer_touch_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire [1:0] mainPipe_io_replacer_touch_way; // @[src/main/scala/icache/icache.scala 35:24]
  wire  mainPipe_io_replacer_victim_req; // @[src/main/scala/icache/icache.scala 35:24]
  wire [7:0] mainPipe_io_replacer_victim_idx; // @[src/main/scala/icache/icache.scala 35:24]
  wire [1:0] mainPipe_io_replacer_victim_resp; // @[src/main/scala/icache/icache.scala 35:24]
  wire  missUnit_clock; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_reset; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_req_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [31:0] missUnit_io_req_bits_addr; // @[src/main/scala/icache/icache.scala 36:24]
  wire [7:0] missUnit_io_req_bits_idx; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_req_bits_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire [1:0] missUnit_io_req_bits_victim_way; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_resp_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [511:0] missUnit_io_resp_bits_data; // @[src/main/scala/icache/icache.scala 36:24]
  wire [7:0] missUnit_io_resp_bits_idx; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_resp_bits_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_meta_write_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [7:0] missUnit_io_meta_write_idx; // @[src/main/scala/icache/icache.scala 36:24]
  wire [1:0] missUnit_io_meta_write_way; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_meta_write_data_0_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_meta_write_data_0_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_meta_write_data_1_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_meta_write_data_1_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_meta_write_data_2_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_meta_write_data_2_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_meta_write_data_3_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [17:0] missUnit_io_meta_write_data_3_tag; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_data_write_valid; // @[src/main/scala/icache/icache.scala 36:24]
  wire [7:0] missUnit_io_data_write_idx; // @[src/main/scala/icache/icache.scala 36:24]
  wire [1:0] missUnit_io_data_write_way; // @[src/main/scala/icache/icache.scala 36:24]
  wire [511:0] missUnit_io_data_write_data; // @[src/main/scala/icache/icache.scala 36:24]
  wire [31:0] missUnit_io_axi_ar_out_araddr; // @[src/main/scala/icache/icache.scala 36:24]
  wire [7:0] missUnit_io_axi_ar_out_arlen; // @[src/main/scala/icache/icache.scala 36:24]
  wire [2:0] missUnit_io_axi_ar_out_arsize; // @[src/main/scala/icache/icache.scala 36:24]
  wire [1:0] missUnit_io_axi_ar_out_arburst; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_axi_ar_out_arvalid; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_axi_ar_ready; // @[src/main/scala/icache/icache.scala 36:24]
  wire [31:0] missUnit_io_axi_r_in_rdata; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_axi_r_in_rlast; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_axi_r_in_rvalid; // @[src/main/scala/icache/icache.scala 36:24]
  wire  missUnit_io_axi_r_ready; // @[src/main/scala/icache/icache.scala 36:24]
  wire  metaArray_clock; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_read_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [7:0] metaArray_io_read_idx; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_read_data_0_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_read_data_0_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_read_data_1_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_read_data_1_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_read_data_2_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_read_data_2_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_read_data_3_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_read_data_3_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_write_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [7:0] metaArray_io_write_idx; // @[src/main/scala/icache/icache.scala 37:25]
  wire [1:0] metaArray_io_write_way; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_write_data_0_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_write_data_0_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_write_data_1_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_write_data_1_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_write_data_2_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_write_data_2_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  metaArray_io_write_data_3_valid; // @[src/main/scala/icache/icache.scala 37:25]
  wire [17:0] metaArray_io_write_data_3_tag; // @[src/main/scala/icache/icache.scala 37:25]
  wire  dataArray_clock; // @[src/main/scala/icache/icache.scala 38:25]
  wire  dataArray_io_read_valid; // @[src/main/scala/icache/icache.scala 38:25]
  wire [7:0] dataArray_io_read_idx; // @[src/main/scala/icache/icache.scala 38:25]
  wire [511:0] dataArray_io_read_data_0; // @[src/main/scala/icache/icache.scala 38:25]
  wire [511:0] dataArray_io_read_data_1; // @[src/main/scala/icache/icache.scala 38:25]
  wire [511:0] dataArray_io_read_data_2; // @[src/main/scala/icache/icache.scala 38:25]
  wire [511:0] dataArray_io_read_data_3; // @[src/main/scala/icache/icache.scala 38:25]
  wire  dataArray_io_write_valid; // @[src/main/scala/icache/icache.scala 38:25]
  wire [7:0] dataArray_io_write_idx; // @[src/main/scala/icache/icache.scala 38:25]
  wire [1:0] dataArray_io_write_way; // @[src/main/scala/icache/icache.scala 38:25]
  wire [511:0] dataArray_io_write_data; // @[src/main/scala/icache/icache.scala 38:25]
  wire  replacer_clock; // @[src/main/scala/icache/icache.scala 39:24]
  wire  replacer_reset; // @[src/main/scala/icache/icache.scala 39:24]
  wire  replacer_io_touch_valid; // @[src/main/scala/icache/icache.scala 39:24]
  wire [7:0] replacer_io_touch_idx; // @[src/main/scala/icache/icache.scala 39:24]
  wire [1:0] replacer_io_touch_way; // @[src/main/scala/icache/icache.scala 39:24]
  wire  replacer_io_victim_req; // @[src/main/scala/icache/icache.scala 39:24]
  wire [7:0] replacer_io_victim_idx; // @[src/main/scala/icache/icache.scala 39:24]
  wire [1:0] replacer_io_victim_resp; // @[src/main/scala/icache/icache.scala 39:24]
  ICacheMainPipe mainPipe ( // @[src/main/scala/icache/icache.scala 35:24]
    .clock(mainPipe_clock),
    .reset(mainPipe_reset),
    .io_cpu_req_addr(mainPipe_io_cpu_req_addr),
    .io_cpu_req_valid(mainPipe_io_cpu_req_valid),
    .io_cpu_resp_instrs_0(mainPipe_io_cpu_resp_instrs_0),
    .io_cpu_resp_instrs_1(mainPipe_io_cpu_resp_instrs_1),
    .io_cpu_resp_instrs_2(mainPipe_io_cpu_resp_instrs_2),
    .io_cpu_resp_instrs_3(mainPipe_io_cpu_resp_instrs_3),
    .io_cpu_resp_addr(mainPipe_io_cpu_resp_addr),
    .io_cpu_resp_valid(mainPipe_io_cpu_resp_valid),
    .io_meta_read_req_valid(mainPipe_io_meta_read_req_valid),
    .io_meta_read_req_idx(mainPipe_io_meta_read_req_idx),
    .io_meta_read_resp_data_0_valid(mainPipe_io_meta_read_resp_data_0_valid),
    .io_meta_read_resp_data_0_tag(mainPipe_io_meta_read_resp_data_0_tag),
    .io_meta_read_resp_data_1_valid(mainPipe_io_meta_read_resp_data_1_valid),
    .io_meta_read_resp_data_1_tag(mainPipe_io_meta_read_resp_data_1_tag),
    .io_meta_read_resp_data_2_valid(mainPipe_io_meta_read_resp_data_2_valid),
    .io_meta_read_resp_data_2_tag(mainPipe_io_meta_read_resp_data_2_tag),
    .io_meta_read_resp_data_3_valid(mainPipe_io_meta_read_resp_data_3_valid),
    .io_meta_read_resp_data_3_tag(mainPipe_io_meta_read_resp_data_3_tag),
    .io_data_read_req_valid(mainPipe_io_data_read_req_valid),
    .io_data_read_req_idx(mainPipe_io_data_read_req_idx),
    .io_data_read_resp_data_0(mainPipe_io_data_read_resp_data_0),
    .io_data_read_resp_data_1(mainPipe_io_data_read_resp_data_1),
    .io_data_read_resp_data_2(mainPipe_io_data_read_resp_data_2),
    .io_data_read_resp_data_3(mainPipe_io_data_read_resp_data_3),
    .io_miss_req_valid(mainPipe_io_miss_req_valid),
    .io_miss_req_bits_addr(mainPipe_io_miss_req_bits_addr),
    .io_miss_req_bits_idx(mainPipe_io_miss_req_bits_idx),
    .io_miss_req_bits_tag(mainPipe_io_miss_req_bits_tag),
    .io_miss_req_bits_victim_way(mainPipe_io_miss_req_bits_victim_way),
    .io_miss_resp_valid(mainPipe_io_miss_resp_valid),
    .io_miss_resp_bits_data(mainPipe_io_miss_resp_bits_data),
    .io_miss_resp_bits_idx(mainPipe_io_miss_resp_bits_idx),
    .io_miss_resp_bits_tag(mainPipe_io_miss_resp_bits_tag),
    .io_replacer_touch_valid(mainPipe_io_replacer_touch_valid),
    .io_replacer_touch_idx(mainPipe_io_replacer_touch_idx),
    .io_replacer_touch_way(mainPipe_io_replacer_touch_way),
    .io_replacer_victim_req(mainPipe_io_replacer_victim_req),
    .io_replacer_victim_idx(mainPipe_io_replacer_victim_idx),
    .io_replacer_victim_resp(mainPipe_io_replacer_victim_resp)
  );
  ICacheMissUnit missUnit ( // @[src/main/scala/icache/icache.scala 36:24]
    .clock(missUnit_clock),
    .reset(missUnit_reset),
    .io_req_valid(missUnit_io_req_valid),
    .io_req_bits_addr(missUnit_io_req_bits_addr),
    .io_req_bits_idx(missUnit_io_req_bits_idx),
    .io_req_bits_tag(missUnit_io_req_bits_tag),
    .io_req_bits_victim_way(missUnit_io_req_bits_victim_way),
    .io_resp_valid(missUnit_io_resp_valid),
    .io_resp_bits_data(missUnit_io_resp_bits_data),
    .io_resp_bits_idx(missUnit_io_resp_bits_idx),
    .io_resp_bits_tag(missUnit_io_resp_bits_tag),
    .io_meta_write_valid(missUnit_io_meta_write_valid),
    .io_meta_write_idx(missUnit_io_meta_write_idx),
    .io_meta_write_way(missUnit_io_meta_write_way),
    .io_meta_write_data_0_valid(missUnit_io_meta_write_data_0_valid),
    .io_meta_write_data_0_tag(missUnit_io_meta_write_data_0_tag),
    .io_meta_write_data_1_valid(missUnit_io_meta_write_data_1_valid),
    .io_meta_write_data_1_tag(missUnit_io_meta_write_data_1_tag),
    .io_meta_write_data_2_valid(missUnit_io_meta_write_data_2_valid),
    .io_meta_write_data_2_tag(missUnit_io_meta_write_data_2_tag),
    .io_meta_write_data_3_valid(missUnit_io_meta_write_data_3_valid),
    .io_meta_write_data_3_tag(missUnit_io_meta_write_data_3_tag),
    .io_data_write_valid(missUnit_io_data_write_valid),
    .io_data_write_idx(missUnit_io_data_write_idx),
    .io_data_write_way(missUnit_io_data_write_way),
    .io_data_write_data(missUnit_io_data_write_data),
    .io_axi_ar_out_araddr(missUnit_io_axi_ar_out_araddr),
    .io_axi_ar_out_arlen(missUnit_io_axi_ar_out_arlen),
    .io_axi_ar_out_arsize(missUnit_io_axi_ar_out_arsize),
    .io_axi_ar_out_arburst(missUnit_io_axi_ar_out_arburst),
    .io_axi_ar_out_arvalid(missUnit_io_axi_ar_out_arvalid),
    .io_axi_ar_ready(missUnit_io_axi_ar_ready),
    .io_axi_r_in_rdata(missUnit_io_axi_r_in_rdata),
    .io_axi_r_in_rlast(missUnit_io_axi_r_in_rlast),
    .io_axi_r_in_rvalid(missUnit_io_axi_r_in_rvalid),
    .io_axi_r_ready(missUnit_io_axi_r_ready)
  );
  ICacheMetaArray metaArray ( // @[src/main/scala/icache/icache.scala 37:25]
    .clock(metaArray_clock),
    .io_read_valid(metaArray_io_read_valid),
    .io_read_idx(metaArray_io_read_idx),
    .io_read_data_0_valid(metaArray_io_read_data_0_valid),
    .io_read_data_0_tag(metaArray_io_read_data_0_tag),
    .io_read_data_1_valid(metaArray_io_read_data_1_valid),
    .io_read_data_1_tag(metaArray_io_read_data_1_tag),
    .io_read_data_2_valid(metaArray_io_read_data_2_valid),
    .io_read_data_2_tag(metaArray_io_read_data_2_tag),
    .io_read_data_3_valid(metaArray_io_read_data_3_valid),
    .io_read_data_3_tag(metaArray_io_read_data_3_tag),
    .io_write_valid(metaArray_io_write_valid),
    .io_write_idx(metaArray_io_write_idx),
    .io_write_way(metaArray_io_write_way),
    .io_write_data_0_valid(metaArray_io_write_data_0_valid),
    .io_write_data_0_tag(metaArray_io_write_data_0_tag),
    .io_write_data_1_valid(metaArray_io_write_data_1_valid),
    .io_write_data_1_tag(metaArray_io_write_data_1_tag),
    .io_write_data_2_valid(metaArray_io_write_data_2_valid),
    .io_write_data_2_tag(metaArray_io_write_data_2_tag),
    .io_write_data_3_valid(metaArray_io_write_data_3_valid),
    .io_write_data_3_tag(metaArray_io_write_data_3_tag)
  );
  ICacheDataArray dataArray ( // @[src/main/scala/icache/icache.scala 38:25]
    .clock(dataArray_clock),
    .io_read_valid(dataArray_io_read_valid),
    .io_read_idx(dataArray_io_read_idx),
    .io_read_data_0(dataArray_io_read_data_0),
    .io_read_data_1(dataArray_io_read_data_1),
    .io_read_data_2(dataArray_io_read_data_2),
    .io_read_data_3(dataArray_io_read_data_3),
    .io_write_valid(dataArray_io_write_valid),
    .io_write_idx(dataArray_io_write_idx),
    .io_write_way(dataArray_io_write_way),
    .io_write_data(dataArray_io_write_data)
  );
  ICacheReplacer replacer ( // @[src/main/scala/icache/icache.scala 39:24]
    .clock(replacer_clock),
    .reset(replacer_reset),
    .io_touch_valid(replacer_io_touch_valid),
    .io_touch_idx(replacer_io_touch_idx),
    .io_touch_way(replacer_io_touch_way),
    .io_victim_req(replacer_io_victim_req),
    .io_victim_idx(replacer_io_victim_idx),
    .io_victim_resp(replacer_io_victim_resp)
  );
  assign io_cpu_if_resp_instrs_0 = mainPipe_io_cpu_resp_instrs_0; // @[src/main/scala/icache/icache.scala 52:25]
  assign io_cpu_if_resp_instrs_1 = mainPipe_io_cpu_resp_instrs_1; // @[src/main/scala/icache/icache.scala 52:25]
  assign io_cpu_if_resp_instrs_2 = mainPipe_io_cpu_resp_instrs_2; // @[src/main/scala/icache/icache.scala 52:25]
  assign io_cpu_if_resp_instrs_3 = mainPipe_io_cpu_resp_instrs_3; // @[src/main/scala/icache/icache.scala 52:25]
  assign io_cpu_if_resp_addr = mainPipe_io_cpu_resp_addr; // @[src/main/scala/icache/icache.scala 53:25]
  assign io_cpu_if_resp_valid = mainPipe_io_cpu_resp_valid; // @[src/main/scala/icache/icache.scala 54:25]
  assign io_axi_master_ar_data_araddr = missUnit_io_axi_ar_out_araddr; // @[src/main/scala/icache/icache.scala 118:33]
  assign io_axi_master_ar_data_arlen = missUnit_io_axi_ar_out_arlen; // @[src/main/scala/icache/icache.scala 119:33]
  assign io_axi_master_ar_data_arsize = missUnit_io_axi_ar_out_arsize; // @[src/main/scala/icache/icache.scala 120:33]
  assign io_axi_master_ar_data_arburst = missUnit_io_axi_ar_out_arburst; // @[src/main/scala/icache/icache.scala 121:33]
  assign io_axi_master_ar_data_arvalid = missUnit_io_axi_ar_out_arvalid; // @[src/main/scala/icache/icache.scala 125:33]
  assign io_axi_master_r_rready = missUnit_io_axi_r_ready; // @[src/main/scala/icache/icache.scala 136:26]
  assign mainPipe_clock = clock;
  assign mainPipe_reset = reset;
  assign mainPipe_io_cpu_req_addr = io_cpu_if_req_addr; // @[src/main/scala/icache/icache.scala 44:30]
  assign mainPipe_io_cpu_req_valid = io_cpu_if_req_valid; // @[src/main/scala/icache/icache.scala 45:30]
  assign mainPipe_io_meta_read_resp_data_0_valid = metaArray_io_read_data_0_valid; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_0_tag = metaArray_io_read_data_0_tag; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_1_valid = metaArray_io_read_data_1_valid; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_1_tag = metaArray_io_read_data_1_tag; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_2_valid = metaArray_io_read_data_2_valid; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_2_tag = metaArray_io_read_data_2_tag; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_3_valid = metaArray_io_read_data_3_valid; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_meta_read_resp_data_3_tag = metaArray_io_read_data_3_tag; // @[src/main/scala/icache/icache.scala 62:35]
  assign mainPipe_io_data_read_resp_data_0 = dataArray_io_read_data_0; // @[src/main/scala/icache/icache.scala 80:35]
  assign mainPipe_io_data_read_resp_data_1 = dataArray_io_read_data_1; // @[src/main/scala/icache/icache.scala 80:35]
  assign mainPipe_io_data_read_resp_data_2 = dataArray_io_read_data_2; // @[src/main/scala/icache/icache.scala 80:35]
  assign mainPipe_io_data_read_resp_data_3 = dataArray_io_read_data_3; // @[src/main/scala/icache/icache.scala 80:35]
  assign mainPipe_io_miss_resp_valid = missUnit_io_resp_valid; // @[src/main/scala/icache/icache.scala 98:31]
  assign mainPipe_io_miss_resp_bits_data = missUnit_io_resp_bits_data; // @[src/main/scala/icache/icache.scala 99:30]
  assign mainPipe_io_miss_resp_bits_idx = missUnit_io_resp_bits_idx; // @[src/main/scala/icache/icache.scala 99:30]
  assign mainPipe_io_miss_resp_bits_tag = missUnit_io_resp_bits_tag; // @[src/main/scala/icache/icache.scala 99:30]
  assign mainPipe_io_replacer_victim_resp = replacer_io_victim_resp; // @[src/main/scala/icache/icache.scala 109:36]
  assign missUnit_clock = clock;
  assign missUnit_reset = reset;
  assign missUnit_io_req_valid = mainPipe_io_miss_req_valid; // @[src/main/scala/icache/icache.scala 94:25]
  assign missUnit_io_req_bits_addr = mainPipe_io_miss_req_bits_addr; // @[src/main/scala/icache/icache.scala 95:24]
  assign missUnit_io_req_bits_idx = mainPipe_io_miss_req_bits_idx; // @[src/main/scala/icache/icache.scala 95:24]
  assign missUnit_io_req_bits_tag = mainPipe_io_miss_req_bits_tag; // @[src/main/scala/icache/icache.scala 95:24]
  assign missUnit_io_req_bits_victim_way = mainPipe_io_miss_req_bits_victim_way; // @[src/main/scala/icache/icache.scala 95:24]
  assign missUnit_io_axi_ar_ready = io_axi_master_ar_arready; // @[src/main/scala/icache/icache.scala 127:28]
  assign missUnit_io_axi_r_in_rdata = io_axi_master_r_data_rdata; // @[src/main/scala/icache/icache.scala 131:31]
  assign missUnit_io_axi_r_in_rlast = io_axi_master_r_data_rlast; // @[src/main/scala/icache/icache.scala 133:31]
  assign missUnit_io_axi_r_in_rvalid = io_axi_master_r_data_rvalid; // @[src/main/scala/icache/icache.scala 134:31]
  assign metaArray_clock = clock;
  assign metaArray_io_read_valid = mainPipe_io_meta_read_req_valid; // @[src/main/scala/icache/icache.scala 60:27]
  assign metaArray_io_read_idx = mainPipe_io_meta_read_req_idx; // @[src/main/scala/icache/icache.scala 61:27]
  assign metaArray_io_write_valid = missUnit_io_meta_write_valid; // @[src/main/scala/icache/icache.scala 65:28]
  assign metaArray_io_write_idx = missUnit_io_meta_write_idx; // @[src/main/scala/icache/icache.scala 66:28]
  assign metaArray_io_write_way = missUnit_io_meta_write_way; // @[src/main/scala/icache/icache.scala 67:28]
  assign metaArray_io_write_data_0_valid = missUnit_io_meta_write_data_0_valid; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_0_tag = missUnit_io_meta_write_data_0_tag; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_1_valid = missUnit_io_meta_write_data_1_valid; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_1_tag = missUnit_io_meta_write_data_1_tag; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_2_valid = missUnit_io_meta_write_data_2_valid; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_2_tag = missUnit_io_meta_write_data_2_tag; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_3_valid = missUnit_io_meta_write_data_3_valid; // @[src/main/scala/icache/icache.scala 69:28]
  assign metaArray_io_write_data_3_tag = missUnit_io_meta_write_data_3_tag; // @[src/main/scala/icache/icache.scala 69:28]
  assign dataArray_clock = clock;
  assign dataArray_io_read_valid = mainPipe_io_data_read_req_valid; // @[src/main/scala/icache/icache.scala 78:27]
  assign dataArray_io_read_idx = mainPipe_io_data_read_req_idx; // @[src/main/scala/icache/icache.scala 79:27]
  assign dataArray_io_write_valid = missUnit_io_data_write_valid; // @[src/main/scala/icache/icache.scala 83:28]
  assign dataArray_io_write_idx = missUnit_io_data_write_idx; // @[src/main/scala/icache/icache.scala 84:28]
  assign dataArray_io_write_way = missUnit_io_data_write_way; // @[src/main/scala/icache/icache.scala 85:28]
  assign dataArray_io_write_data = missUnit_io_data_write_data; // @[src/main/scala/icache/icache.scala 86:28]
  assign replacer_clock = clock;
  assign replacer_reset = reset;
  assign replacer_io_touch_valid = mainPipe_io_replacer_touch_valid; // @[src/main/scala/icache/icache.scala 103:27]
  assign replacer_io_touch_idx = mainPipe_io_replacer_touch_idx; // @[src/main/scala/icache/icache.scala 104:27]
  assign replacer_io_touch_way = mainPipe_io_replacer_touch_way; // @[src/main/scala/icache/icache.scala 105:27]
  assign replacer_io_victim_req = mainPipe_io_replacer_victim_req; // @[src/main/scala/icache/icache.scala 107:26]
  assign replacer_io_victim_idx = mainPipe_io_replacer_victim_idx; // @[src/main/scala/icache/icache.scala 108:26]
endmodule
