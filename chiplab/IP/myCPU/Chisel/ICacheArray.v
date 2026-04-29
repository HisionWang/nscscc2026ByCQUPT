module ICacheArray(
  input          clock,
  input          reset,
  input          io_read_req_valid, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input  [7:0]   io_read_req_idx, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output         io_read_resp_valid, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output         io_read_resp_data_cacheLine_0_has, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [17:0]  io_read_resp_data_cacheLine_0_tag, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [511:0] io_read_resp_data_cacheLine_0_data, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output         io_read_resp_data_cacheLine_1_has, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [17:0]  io_read_resp_data_cacheLine_1_tag, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [511:0] io_read_resp_data_cacheLine_1_data, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output         io_read_resp_data_cacheLine_2_has, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [17:0]  io_read_resp_data_cacheLine_2_tag, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [511:0] io_read_resp_data_cacheLine_2_data, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output         io_read_resp_data_cacheLine_3_has, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [17:0]  io_read_resp_data_cacheLine_3_tag, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  output [511:0] io_read_resp_data_cacheLine_3_data, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input          io_write_valid, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input  [7:0]   io_write_idx, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input  [1:0]   io_write_way, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input  [17:0]  io_write_tag, // @[src/main/scala/icache/ICacheArray.scala 28:14]
  input  [511:0] io_write_data // @[src/main/scala/icache/ICacheArray.scala 28:14]
);
  wire  SimpleBlockRAM_clock; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_1_clock; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_1_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_1_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_1_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_1_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_1_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_1_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_2_clock; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_2_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_2_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_2_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_2_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_2_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_2_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_3_clock; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_3_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_3_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_3_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_3_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [7:0] SimpleBlockRAM_3_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire [18:0] SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_3_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 44:11]
  wire  SimpleBlockRAM_4_clock; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_4_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_4_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_4_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_4_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_4_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_4_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_5_clock; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_5_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_5_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_5_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_5_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_5_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_5_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_6_clock; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_6_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_6_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_6_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_6_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_6_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_6_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_7_clock; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_7_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_7_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_7_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_7_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [7:0] SimpleBlockRAM_7_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [511:0] SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire  SimpleBlockRAM_7_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 52:11]
  wire [18:0] metaBRAMs_0_rd_data = SimpleBlockRAM_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 43:{26,26}]
  wire [18:0] metaBRAMs_1_rd_data = SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 43:{26,26}]
  wire [18:0] metaBRAMs_2_rd_data = SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 43:{26,26}]
  wire [18:0] metaBRAMs_3_rd_data = SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 43:{26,26}]
  wire  metaBRAMs_0_rd_valid = SimpleBlockRAM_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 43:{26,26}]
  wire  dataBRAMs_0_rd_valid = SimpleBlockRAM_4_io_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 51:{26,26}]
  wire [3:0] writeWayOneHot = 4'h1 << io_write_way; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire  waySel = writeWayOneHot[0]; // @[src/main/scala/icache/ICacheArray.scala 96:32]
  wire  metaBRAMs_0_wr_en = io_write_valid & waySel; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  wire  _T_2 = ~reset; // @[src/main/scala/icache/ICacheArray.scala 113:13]
  wire  waySel_1 = writeWayOneHot[1]; // @[src/main/scala/icache/ICacheArray.scala 96:32]
  wire  metaBRAMs_1_wr_en = io_write_valid & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  wire  waySel_2 = writeWayOneHot[2]; // @[src/main/scala/icache/ICacheArray.scala 96:32]
  wire  metaBRAMs_2_wr_en = io_write_valid & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  wire  waySel_3 = writeWayOneHot[3]; // @[src/main/scala/icache/ICacheArray.scala 96:32]
  wire  metaBRAMs_3_wr_en = io_write_valid & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  wire  _readWriteConflict_0_T_1 = io_read_req_idx == io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 147:48]
  wire  _readWriteConflict_0_T_2 = io_read_req_valid & io_write_valid & _readWriteConflict_0_T_1; // @[src/main/scala/icache/ICacheArray.scala 146:67]
  wire  readWriteConflict_0 = _readWriteConflict_0_T_2 & waySel; // @[src/main/scala/icache/ICacheArray.scala 147:66]
  wire  readWriteConflict_1 = _readWriteConflict_0_T_2 & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 147:66]
  wire  readWriteConflict_2 = _readWriteConflict_0_T_2 & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 147:66]
  wire  readWriteConflict_3 = _readWriteConflict_0_T_2 & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 147:66]
  wire  _T_16 = readWriteConflict_0 | readWriteConflict_1 | readWriteConflict_2 | readWriteConflict_3; // @[src/main/scala/icache/ICacheArray.scala 151:35]
  SimpleBlockRAM SimpleBlockRAM ( // @[src/main/scala/icache/ICacheArray.scala 44:11]
    .clock(SimpleBlockRAM_clock),
    .io_wr_en(SimpleBlockRAM_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_io_wr_data),
    .io_rd_en(SimpleBlockRAM_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_io_rd_valid)
  );
  SimpleBlockRAM SimpleBlockRAM_1 ( // @[src/main/scala/icache/ICacheArray.scala 44:11]
    .clock(SimpleBlockRAM_1_clock),
    .io_wr_en(SimpleBlockRAM_1_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_1_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_1_io_wr_data),
    .io_rd_en(SimpleBlockRAM_1_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_1_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_1_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_1_io_rd_valid)
  );
  SimpleBlockRAM SimpleBlockRAM_2 ( // @[src/main/scala/icache/ICacheArray.scala 44:11]
    .clock(SimpleBlockRAM_2_clock),
    .io_wr_en(SimpleBlockRAM_2_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_2_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_2_io_wr_data),
    .io_rd_en(SimpleBlockRAM_2_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_2_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_2_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_2_io_rd_valid)
  );
  SimpleBlockRAM SimpleBlockRAM_3 ( // @[src/main/scala/icache/ICacheArray.scala 44:11]
    .clock(SimpleBlockRAM_3_clock),
    .io_wr_en(SimpleBlockRAM_3_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_3_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_3_io_wr_data),
    .io_rd_en(SimpleBlockRAM_3_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_3_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_3_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_3_io_rd_valid)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_4 ( // @[src/main/scala/icache/ICacheArray.scala 52:11]
    .clock(SimpleBlockRAM_4_clock),
    .io_wr_en(SimpleBlockRAM_4_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_4_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_4_io_wr_data),
    .io_rd_en(SimpleBlockRAM_4_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_4_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_4_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_4_io_rd_valid)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_5 ( // @[src/main/scala/icache/ICacheArray.scala 52:11]
    .clock(SimpleBlockRAM_5_clock),
    .io_wr_en(SimpleBlockRAM_5_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_5_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_5_io_wr_data),
    .io_rd_en(SimpleBlockRAM_5_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_5_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_5_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_5_io_rd_valid)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_6 ( // @[src/main/scala/icache/ICacheArray.scala 52:11]
    .clock(SimpleBlockRAM_6_clock),
    .io_wr_en(SimpleBlockRAM_6_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_6_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_6_io_wr_data),
    .io_rd_en(SimpleBlockRAM_6_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_6_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_6_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_6_io_rd_valid)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_7 ( // @[src/main/scala/icache/ICacheArray.scala 52:11]
    .clock(SimpleBlockRAM_7_clock),
    .io_wr_en(SimpleBlockRAM_7_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_7_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_7_io_wr_data),
    .io_rd_en(SimpleBlockRAM_7_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_7_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_7_io_rd_data),
    .io_rd_valid(SimpleBlockRAM_7_io_rd_valid)
  );
  assign io_read_resp_valid = metaBRAMs_0_rd_valid & dataBRAMs_0_rd_valid; // @[src/main/scala/icache/ICacheArray.scala 85:42]
  assign io_read_resp_data_cacheLine_0_has = metaBRAMs_0_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 79:49]
  assign io_read_resp_data_cacheLine_0_tag = metaBRAMs_0_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 80:49]
  assign io_read_resp_data_cacheLine_0_data = SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 51:{26,26}]
  assign io_read_resp_data_cacheLine_1_has = metaBRAMs_1_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 79:49]
  assign io_read_resp_data_cacheLine_1_tag = metaBRAMs_1_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 80:49]
  assign io_read_resp_data_cacheLine_1_data = SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 51:{26,26}]
  assign io_read_resp_data_cacheLine_2_has = metaBRAMs_2_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 79:49]
  assign io_read_resp_data_cacheLine_2_tag = metaBRAMs_2_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 80:49]
  assign io_read_resp_data_cacheLine_2_data = SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 51:{26,26}]
  assign io_read_resp_data_cacheLine_3_has = metaBRAMs_3_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 79:49]
  assign io_read_resp_data_cacheLine_3_tag = metaBRAMs_3_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 80:49]
  assign io_read_resp_data_cacheLine_3_data = SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 51:{26,26}]
  assign SimpleBlockRAM_clock = clock;
  assign SimpleBlockRAM_io_wr_en = io_write_valid & waySel; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  assign SimpleBlockRAM_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 100:28]
  assign SimpleBlockRAM_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 43:26 62:28]
  assign SimpleBlockRAM_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 43:26 63:28]
  assign SimpleBlockRAM_1_clock = clock;
  assign SimpleBlockRAM_1_io_wr_en = io_write_valid & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  assign SimpleBlockRAM_1_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_1_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 100:28]
  assign SimpleBlockRAM_1_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 43:26 62:28]
  assign SimpleBlockRAM_1_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 43:26 63:28]
  assign SimpleBlockRAM_2_clock = clock;
  assign SimpleBlockRAM_2_io_wr_en = io_write_valid & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  assign SimpleBlockRAM_2_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_2_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 100:28]
  assign SimpleBlockRAM_2_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 43:26 62:28]
  assign SimpleBlockRAM_2_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 43:26 63:28]
  assign SimpleBlockRAM_3_clock = clock;
  assign SimpleBlockRAM_3_io_wr_en = io_write_valid & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 102:46]
  assign SimpleBlockRAM_3_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_3_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 100:28]
  assign SimpleBlockRAM_3_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 43:26 62:28]
  assign SimpleBlockRAM_3_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 43:26 63:28]
  assign SimpleBlockRAM_4_clock = clock;
  assign SimpleBlockRAM_4_io_wr_en = io_write_valid & waySel; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_4_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_4_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 123:25 109:28 131:30]
  assign SimpleBlockRAM_4_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 51:26 64:28]
  assign SimpleBlockRAM_4_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 51:26 65:28]
  assign SimpleBlockRAM_5_clock = clock;
  assign SimpleBlockRAM_5_io_wr_en = io_write_valid & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_5_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_5_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 123:25 109:28 131:30]
  assign SimpleBlockRAM_5_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 51:26 64:28]
  assign SimpleBlockRAM_5_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 51:26 65:28]
  assign SimpleBlockRAM_6_clock = clock;
  assign SimpleBlockRAM_6_io_wr_en = io_write_valid & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_6_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_6_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 123:25 109:28 131:30]
  assign SimpleBlockRAM_6_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 51:26 64:28]
  assign SimpleBlockRAM_6_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 51:26 65:28]
  assign SimpleBlockRAM_7_clock = clock;
  assign SimpleBlockRAM_7_io_wr_en = io_write_valid & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_7_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 123:25 103:28 125:30]
  assign SimpleBlockRAM_7_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 123:25 109:28 131:30]
  assign SimpleBlockRAM_7_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 51:26 64:28]
  assign SimpleBlockRAM_7_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 51:26 65:28]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (metaBRAMs_0_wr_en & ~reset) begin
          $fwrite(32'h80000002,"[ICache Write] idx=%d, way=0, tag=0x%x, data=0x%x\n",io_write_idx,io_write_tag,
            io_write_data); // @[src/main/scala/icache/ICacheArray.scala 113:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (metaBRAMs_1_wr_en & ~reset) begin
          $fwrite(32'h80000002,"[ICache Write] idx=%d, way=1, tag=0x%x, data=0x%x\n",io_write_idx,io_write_tag,
            io_write_data); // @[src/main/scala/icache/ICacheArray.scala 113:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (metaBRAMs_2_wr_en & ~reset) begin
          $fwrite(32'h80000002,"[ICache Write] idx=%d, way=2, tag=0x%x, data=0x%x\n",io_write_idx,io_write_tag,
            io_write_data); // @[src/main/scala/icache/ICacheArray.scala 113:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (metaBRAMs_3_wr_en & ~reset) begin
          $fwrite(32'h80000002,"[ICache Write] idx=%d, way=3, tag=0x%x, data=0x%x\n",io_write_idx,io_write_tag,
            io_write_data); // @[src/main/scala/icache/ICacheArray.scala 113:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_16 & _T_2) begin
          $fwrite(32'h80000002,"[ICache Conflict] Read-Write conflict at idx=%d\n",io_read_req_idx); // @[src/main/scala/icache/ICacheArray.scala 152:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
