module ICacheMetaArray(
  input         clock,
  input         io_read_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [7:0]  io_read_idx, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output        io_read_data_0_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output [17:0] io_read_data_0_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output        io_read_data_1_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output [17:0] io_read_data_1_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output        io_read_data_2_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output [17:0] io_read_data_2_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output        io_read_data_3_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  output [17:0] io_read_data_3_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input         io_write_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [7:0]  io_write_idx, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [1:0]  io_write_way, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input         io_write_data_0_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [17:0] io_write_data_0_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input         io_write_data_1_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [17:0] io_write_data_1_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input         io_write_data_2_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [17:0] io_write_data_2_tag, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input         io_write_data_3_valid, // @[src/main/scala/icache/ICacheArrays.scala 10:14]
  input  [17:0] io_write_data_3_tag // @[src/main/scala/icache/ICacheArrays.scala 10:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_REG_INIT
  reg  metaArray_0_valid [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_valid_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_valid_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_valid_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_valid_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_valid_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_0_valid_MPORT_en_pipe_0;
  reg [7:0] metaArray_0_valid_MPORT_addr_pipe_0;
  reg  metaArray_0_valid_current_data_en_pipe_0;
  reg [7:0] metaArray_0_valid_current_data_addr_pipe_0;
  reg [17:0] metaArray_0_tag [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_tag_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_0_tag_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_tag_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_0_tag_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_0_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_tag_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_0_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_0_tag_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_0_tag_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_0_tag_MPORT_en_pipe_0;
  reg [7:0] metaArray_0_tag_MPORT_addr_pipe_0;
  reg  metaArray_0_tag_current_data_en_pipe_0;
  reg [7:0] metaArray_0_tag_current_data_addr_pipe_0;
  reg  metaArray_1_valid [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_valid_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_valid_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_valid_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_valid_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_valid_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_1_valid_MPORT_en_pipe_0;
  reg [7:0] metaArray_1_valid_MPORT_addr_pipe_0;
  reg  metaArray_1_valid_current_data_en_pipe_0;
  reg [7:0] metaArray_1_valid_current_data_addr_pipe_0;
  reg [17:0] metaArray_1_tag [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_tag_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_1_tag_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_tag_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_1_tag_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_1_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_tag_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_1_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_1_tag_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_1_tag_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_1_tag_MPORT_en_pipe_0;
  reg [7:0] metaArray_1_tag_MPORT_addr_pipe_0;
  reg  metaArray_1_tag_current_data_en_pipe_0;
  reg [7:0] metaArray_1_tag_current_data_addr_pipe_0;
  reg  metaArray_2_valid [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_valid_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_valid_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_valid_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_valid_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_valid_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_2_valid_MPORT_en_pipe_0;
  reg [7:0] metaArray_2_valid_MPORT_addr_pipe_0;
  reg  metaArray_2_valid_current_data_en_pipe_0;
  reg [7:0] metaArray_2_valid_current_data_addr_pipe_0;
  reg [17:0] metaArray_2_tag [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_tag_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_2_tag_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_tag_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_2_tag_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_2_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_tag_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_2_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_2_tag_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_2_tag_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_2_tag_MPORT_en_pipe_0;
  reg [7:0] metaArray_2_tag_MPORT_addr_pipe_0;
  reg  metaArray_2_tag_current_data_en_pipe_0;
  reg [7:0] metaArray_2_tag_current_data_addr_pipe_0;
  reg  metaArray_3_valid [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_valid_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_valid_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_valid_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_valid_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_valid_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_3_valid_MPORT_en_pipe_0;
  reg [7:0] metaArray_3_valid_MPORT_addr_pipe_0;
  reg  metaArray_3_valid_current_data_en_pipe_0;
  reg [7:0] metaArray_3_valid_current_data_addr_pipe_0;
  reg [17:0] metaArray_3_tag [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_tag_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_3_tag_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_tag_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_3_tag_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_3_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_tag_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [17:0] metaArray_3_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire [7:0] metaArray_3_tag_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  wire  metaArray_3_tag_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  reg  metaArray_3_tag_MPORT_en_pipe_0;
  reg [7:0] metaArray_3_tag_MPORT_addr_pipe_0;
  reg  metaArray_3_tag_current_data_en_pipe_0;
  reg [7:0] metaArray_3_tag_current_data_addr_pipe_0;
  wire  _T_2 = 2'h0 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 70:16]
  wire  _T_3 = 2'h1 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 70:16]
  wire  _T_4 = 2'h2 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 70:16]
  wire  _T_5 = 2'h3 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 70:16]
  assign metaArray_0_valid_MPORT_en = metaArray_0_valid_MPORT_en_pipe_0;
  assign metaArray_0_valid_MPORT_addr = metaArray_0_valid_MPORT_addr_pipe_0;
  assign metaArray_0_valid_MPORT_data = metaArray_0_valid[metaArray_0_valid_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_0_valid_current_data_en = metaArray_0_valid_current_data_en_pipe_0;
  assign metaArray_0_valid_current_data_addr = metaArray_0_valid_current_data_addr_pipe_0;
  assign metaArray_0_valid_current_data_data = metaArray_0_valid[metaArray_0_valid_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_0_valid_MPORT_1_data = _T_2 ? io_write_data_0_valid : metaArray_0_valid_current_data_data;
  assign metaArray_0_valid_MPORT_1_addr = io_write_idx;
  assign metaArray_0_valid_MPORT_1_mask = 1'h1;
  assign metaArray_0_valid_MPORT_1_en = io_write_valid;
  assign metaArray_0_valid_MPORT_2_data = 1'h0;
  assign metaArray_0_valid_MPORT_2_addr = 8'h0;
  assign metaArray_0_valid_MPORT_2_mask = 1'h1;
  assign metaArray_0_valid_MPORT_2_en = 1'h0;
  assign metaArray_0_tag_MPORT_en = metaArray_0_tag_MPORT_en_pipe_0;
  assign metaArray_0_tag_MPORT_addr = metaArray_0_tag_MPORT_addr_pipe_0;
  assign metaArray_0_tag_MPORT_data = metaArray_0_tag[metaArray_0_tag_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_0_tag_current_data_en = metaArray_0_tag_current_data_en_pipe_0;
  assign metaArray_0_tag_current_data_addr = metaArray_0_tag_current_data_addr_pipe_0;
  assign metaArray_0_tag_current_data_data = metaArray_0_tag[metaArray_0_tag_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_0_tag_MPORT_1_data = _T_2 ? io_write_data_0_tag : metaArray_0_tag_current_data_data;
  assign metaArray_0_tag_MPORT_1_addr = io_write_idx;
  assign metaArray_0_tag_MPORT_1_mask = 1'h1;
  assign metaArray_0_tag_MPORT_1_en = io_write_valid;
  assign metaArray_0_tag_MPORT_2_data = 18'h0;
  assign metaArray_0_tag_MPORT_2_addr = 8'h0;
  assign metaArray_0_tag_MPORT_2_mask = 1'h1;
  assign metaArray_0_tag_MPORT_2_en = 1'h0;
  assign metaArray_1_valid_MPORT_en = metaArray_1_valid_MPORT_en_pipe_0;
  assign metaArray_1_valid_MPORT_addr = metaArray_1_valid_MPORT_addr_pipe_0;
  assign metaArray_1_valid_MPORT_data = metaArray_1_valid[metaArray_1_valid_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_1_valid_current_data_en = metaArray_1_valid_current_data_en_pipe_0;
  assign metaArray_1_valid_current_data_addr = metaArray_1_valid_current_data_addr_pipe_0;
  assign metaArray_1_valid_current_data_data = metaArray_1_valid[metaArray_1_valid_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_1_valid_MPORT_1_data = _T_3 ? io_write_data_1_valid : metaArray_1_valid_current_data_data;
  assign metaArray_1_valid_MPORT_1_addr = io_write_idx;
  assign metaArray_1_valid_MPORT_1_mask = 1'h1;
  assign metaArray_1_valid_MPORT_1_en = io_write_valid;
  assign metaArray_1_valid_MPORT_2_data = 1'h0;
  assign metaArray_1_valid_MPORT_2_addr = 8'h0;
  assign metaArray_1_valid_MPORT_2_mask = 1'h1;
  assign metaArray_1_valid_MPORT_2_en = 1'h0;
  assign metaArray_1_tag_MPORT_en = metaArray_1_tag_MPORT_en_pipe_0;
  assign metaArray_1_tag_MPORT_addr = metaArray_1_tag_MPORT_addr_pipe_0;
  assign metaArray_1_tag_MPORT_data = metaArray_1_tag[metaArray_1_tag_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_1_tag_current_data_en = metaArray_1_tag_current_data_en_pipe_0;
  assign metaArray_1_tag_current_data_addr = metaArray_1_tag_current_data_addr_pipe_0;
  assign metaArray_1_tag_current_data_data = metaArray_1_tag[metaArray_1_tag_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_1_tag_MPORT_1_data = _T_3 ? io_write_data_1_tag : metaArray_1_tag_current_data_data;
  assign metaArray_1_tag_MPORT_1_addr = io_write_idx;
  assign metaArray_1_tag_MPORT_1_mask = 1'h1;
  assign metaArray_1_tag_MPORT_1_en = io_write_valid;
  assign metaArray_1_tag_MPORT_2_data = 18'h0;
  assign metaArray_1_tag_MPORT_2_addr = 8'h0;
  assign metaArray_1_tag_MPORT_2_mask = 1'h1;
  assign metaArray_1_tag_MPORT_2_en = 1'h0;
  assign metaArray_2_valid_MPORT_en = metaArray_2_valid_MPORT_en_pipe_0;
  assign metaArray_2_valid_MPORT_addr = metaArray_2_valid_MPORT_addr_pipe_0;
  assign metaArray_2_valid_MPORT_data = metaArray_2_valid[metaArray_2_valid_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_2_valid_current_data_en = metaArray_2_valid_current_data_en_pipe_0;
  assign metaArray_2_valid_current_data_addr = metaArray_2_valid_current_data_addr_pipe_0;
  assign metaArray_2_valid_current_data_data = metaArray_2_valid[metaArray_2_valid_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_2_valid_MPORT_1_data = _T_4 ? io_write_data_2_valid : metaArray_2_valid_current_data_data;
  assign metaArray_2_valid_MPORT_1_addr = io_write_idx;
  assign metaArray_2_valid_MPORT_1_mask = 1'h1;
  assign metaArray_2_valid_MPORT_1_en = io_write_valid;
  assign metaArray_2_valid_MPORT_2_data = 1'h0;
  assign metaArray_2_valid_MPORT_2_addr = 8'h0;
  assign metaArray_2_valid_MPORT_2_mask = 1'h1;
  assign metaArray_2_valid_MPORT_2_en = 1'h0;
  assign metaArray_2_tag_MPORT_en = metaArray_2_tag_MPORT_en_pipe_0;
  assign metaArray_2_tag_MPORT_addr = metaArray_2_tag_MPORT_addr_pipe_0;
  assign metaArray_2_tag_MPORT_data = metaArray_2_tag[metaArray_2_tag_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_2_tag_current_data_en = metaArray_2_tag_current_data_en_pipe_0;
  assign metaArray_2_tag_current_data_addr = metaArray_2_tag_current_data_addr_pipe_0;
  assign metaArray_2_tag_current_data_data = metaArray_2_tag[metaArray_2_tag_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_2_tag_MPORT_1_data = _T_4 ? io_write_data_2_tag : metaArray_2_tag_current_data_data;
  assign metaArray_2_tag_MPORT_1_addr = io_write_idx;
  assign metaArray_2_tag_MPORT_1_mask = 1'h1;
  assign metaArray_2_tag_MPORT_1_en = io_write_valid;
  assign metaArray_2_tag_MPORT_2_data = 18'h0;
  assign metaArray_2_tag_MPORT_2_addr = 8'h0;
  assign metaArray_2_tag_MPORT_2_mask = 1'h1;
  assign metaArray_2_tag_MPORT_2_en = 1'h0;
  assign metaArray_3_valid_MPORT_en = metaArray_3_valid_MPORT_en_pipe_0;
  assign metaArray_3_valid_MPORT_addr = metaArray_3_valid_MPORT_addr_pipe_0;
  assign metaArray_3_valid_MPORT_data = metaArray_3_valid[metaArray_3_valid_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_3_valid_current_data_en = metaArray_3_valid_current_data_en_pipe_0;
  assign metaArray_3_valid_current_data_addr = metaArray_3_valid_current_data_addr_pipe_0;
  assign metaArray_3_valid_current_data_data = metaArray_3_valid[metaArray_3_valid_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_3_valid_MPORT_1_data = _T_5 ? io_write_data_3_valid : metaArray_3_valid_current_data_data;
  assign metaArray_3_valid_MPORT_1_addr = io_write_idx;
  assign metaArray_3_valid_MPORT_1_mask = 1'h1;
  assign metaArray_3_valid_MPORT_1_en = io_write_valid;
  assign metaArray_3_valid_MPORT_2_data = 1'h0;
  assign metaArray_3_valid_MPORT_2_addr = 8'h0;
  assign metaArray_3_valid_MPORT_2_mask = 1'h1;
  assign metaArray_3_valid_MPORT_2_en = 1'h0;
  assign metaArray_3_tag_MPORT_en = metaArray_3_tag_MPORT_en_pipe_0;
  assign metaArray_3_tag_MPORT_addr = metaArray_3_tag_MPORT_addr_pipe_0;
  assign metaArray_3_tag_MPORT_data = metaArray_3_tag[metaArray_3_tag_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_3_tag_current_data_en = metaArray_3_tag_current_data_en_pipe_0;
  assign metaArray_3_tag_current_data_addr = metaArray_3_tag_current_data_addr_pipe_0;
  assign metaArray_3_tag_current_data_data = metaArray_3_tag[metaArray_3_tag_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
  assign metaArray_3_tag_MPORT_1_data = _T_5 ? io_write_data_3_tag : metaArray_3_tag_current_data_data;
  assign metaArray_3_tag_MPORT_1_addr = io_write_idx;
  assign metaArray_3_tag_MPORT_1_mask = 1'h1;
  assign metaArray_3_tag_MPORT_1_en = io_write_valid;
  assign metaArray_3_tag_MPORT_2_data = 18'h0;
  assign metaArray_3_tag_MPORT_2_addr = 8'h0;
  assign metaArray_3_tag_MPORT_2_mask = 1'h1;
  assign metaArray_3_tag_MPORT_2_en = 1'h0;
  assign io_read_data_0_valid = io_read_valid & metaArray_0_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_0_tag = io_read_valid ? metaArray_0_tag_MPORT_data : 18'h0; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_1_valid = io_read_valid & metaArray_1_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_1_tag = io_read_valid ? metaArray_1_tag_MPORT_data : 18'h0; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_2_valid = io_read_valid & metaArray_2_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_2_tag = io_read_valid ? metaArray_2_tag_MPORT_data : 18'h0; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_3_valid = io_read_valid & metaArray_3_valid_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  assign io_read_data_3_tag = io_read_valid ? metaArray_3_tag_MPORT_data : 18'h0; // @[src/main/scala/icache/ICacheArrays.scala 52:23 53:15 55:15]
  always @(posedge clock) begin
    if (metaArray_0_valid_MPORT_1_en & metaArray_0_valid_MPORT_1_mask) begin
      metaArray_0_valid[metaArray_0_valid_MPORT_1_addr] <= metaArray_0_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_0_valid_MPORT_2_en & metaArray_0_valid_MPORT_2_mask) begin
      metaArray_0_valid[metaArray_0_valid_MPORT_2_addr] <= metaArray_0_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_0_valid_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_0_valid_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_0_valid_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_0_valid_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_0_tag_MPORT_1_en & metaArray_0_tag_MPORT_1_mask) begin
      metaArray_0_tag[metaArray_0_tag_MPORT_1_addr] <= metaArray_0_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_0_tag_MPORT_2_en & metaArray_0_tag_MPORT_2_mask) begin
      metaArray_0_tag[metaArray_0_tag_MPORT_2_addr] <= metaArray_0_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_0_tag_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_0_tag_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_0_tag_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_0_tag_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_1_valid_MPORT_1_en & metaArray_1_valid_MPORT_1_mask) begin
      metaArray_1_valid[metaArray_1_valid_MPORT_1_addr] <= metaArray_1_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_1_valid_MPORT_2_en & metaArray_1_valid_MPORT_2_mask) begin
      metaArray_1_valid[metaArray_1_valid_MPORT_2_addr] <= metaArray_1_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_1_valid_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_1_valid_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_1_valid_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_1_valid_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_1_tag_MPORT_1_en & metaArray_1_tag_MPORT_1_mask) begin
      metaArray_1_tag[metaArray_1_tag_MPORT_1_addr] <= metaArray_1_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_1_tag_MPORT_2_en & metaArray_1_tag_MPORT_2_mask) begin
      metaArray_1_tag[metaArray_1_tag_MPORT_2_addr] <= metaArray_1_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_1_tag_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_1_tag_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_1_tag_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_1_tag_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_2_valid_MPORT_1_en & metaArray_2_valid_MPORT_1_mask) begin
      metaArray_2_valid[metaArray_2_valid_MPORT_1_addr] <= metaArray_2_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_2_valid_MPORT_2_en & metaArray_2_valid_MPORT_2_mask) begin
      metaArray_2_valid[metaArray_2_valid_MPORT_2_addr] <= metaArray_2_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_2_valid_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_2_valid_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_2_valid_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_2_valid_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_2_tag_MPORT_1_en & metaArray_2_tag_MPORT_1_mask) begin
      metaArray_2_tag[metaArray_2_tag_MPORT_1_addr] <= metaArray_2_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_2_tag_MPORT_2_en & metaArray_2_tag_MPORT_2_mask) begin
      metaArray_2_tag[metaArray_2_tag_MPORT_2_addr] <= metaArray_2_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_2_tag_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_2_tag_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_2_tag_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_2_tag_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_3_valid_MPORT_1_en & metaArray_3_valid_MPORT_1_mask) begin
      metaArray_3_valid[metaArray_3_valid_MPORT_1_addr] <= metaArray_3_valid_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_3_valid_MPORT_2_en & metaArray_3_valid_MPORT_2_mask) begin
      metaArray_3_valid[metaArray_3_valid_MPORT_2_addr] <= metaArray_3_valid_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_3_valid_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_3_valid_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_3_valid_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_3_valid_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (metaArray_3_tag_MPORT_1_en & metaArray_3_tag_MPORT_1_mask) begin
      metaArray_3_tag[metaArray_3_tag_MPORT_1_addr] <= metaArray_3_tag_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    if (metaArray_3_tag_MPORT_2_en & metaArray_3_tag_MPORT_2_mask) begin
      metaArray_3_tag[metaArray_3_tag_MPORT_2_addr] <= metaArray_3_tag_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 47:30]
    end
    metaArray_3_tag_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      metaArray_3_tag_MPORT_addr_pipe_0 <= io_read_idx;
    end
    metaArray_3_tag_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      metaArray_3_tag_current_data_addr_pipe_0 <= io_write_idx;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_0_valid[initvar] = _RAND_0[0:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_0_tag[initvar] = _RAND_5[17:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_1_valid[initvar] = _RAND_10[0:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_1_tag[initvar] = _RAND_15[17:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_2_valid[initvar] = _RAND_20[0:0];
  _RAND_25 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_2_tag[initvar] = _RAND_25[17:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_3_valid[initvar] = _RAND_30[0:0];
  _RAND_35 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaArray_3_tag[initvar] = _RAND_35[17:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  metaArray_0_valid_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  metaArray_0_valid_MPORT_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  metaArray_0_valid_current_data_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  metaArray_0_valid_current_data_addr_pipe_0 = _RAND_4[7:0];
  _RAND_6 = {1{`RANDOM}};
  metaArray_0_tag_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  metaArray_0_tag_MPORT_addr_pipe_0 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  metaArray_0_tag_current_data_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  metaArray_0_tag_current_data_addr_pipe_0 = _RAND_9[7:0];
  _RAND_11 = {1{`RANDOM}};
  metaArray_1_valid_MPORT_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  metaArray_1_valid_MPORT_addr_pipe_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  metaArray_1_valid_current_data_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  metaArray_1_valid_current_data_addr_pipe_0 = _RAND_14[7:0];
  _RAND_16 = {1{`RANDOM}};
  metaArray_1_tag_MPORT_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  metaArray_1_tag_MPORT_addr_pipe_0 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  metaArray_1_tag_current_data_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  metaArray_1_tag_current_data_addr_pipe_0 = _RAND_19[7:0];
  _RAND_21 = {1{`RANDOM}};
  metaArray_2_valid_MPORT_en_pipe_0 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  metaArray_2_valid_MPORT_addr_pipe_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  metaArray_2_valid_current_data_en_pipe_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  metaArray_2_valid_current_data_addr_pipe_0 = _RAND_24[7:0];
  _RAND_26 = {1{`RANDOM}};
  metaArray_2_tag_MPORT_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  metaArray_2_tag_MPORT_addr_pipe_0 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  metaArray_2_tag_current_data_en_pipe_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  metaArray_2_tag_current_data_addr_pipe_0 = _RAND_29[7:0];
  _RAND_31 = {1{`RANDOM}};
  metaArray_3_valid_MPORT_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  metaArray_3_valid_MPORT_addr_pipe_0 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  metaArray_3_valid_current_data_en_pipe_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  metaArray_3_valid_current_data_addr_pipe_0 = _RAND_34[7:0];
  _RAND_36 = {1{`RANDOM}};
  metaArray_3_tag_MPORT_en_pipe_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  metaArray_3_tag_MPORT_addr_pipe_0 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  metaArray_3_tag_current_data_en_pipe_0 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  metaArray_3_tag_current_data_addr_pipe_0 = _RAND_39[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
