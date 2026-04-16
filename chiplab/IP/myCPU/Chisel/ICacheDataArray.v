module ICacheDataArray(
  input          clock,
  input          io_read_valid, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  input  [7:0]   io_read_idx, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  output [511:0] io_read_data_0, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  output [511:0] io_read_data_1, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  output [511:0] io_read_data_2, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  output [511:0] io_read_data_3, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  input          io_write_valid, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  input  [7:0]   io_write_idx, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  input  [1:0]   io_write_way, // @[src/main/scala/icache/ICacheArrays.scala 100:14]
  input  [511:0] io_write_data // @[src/main/scala/icache/ICacheArrays.scala 100:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
  reg [511:0] _RAND_5;
  reg [511:0] _RAND_10;
  reg [511:0] _RAND_15;
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
`endif // RANDOMIZE_REG_INIT
  reg [511:0] dataArray_0 [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_0_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_0_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_0_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_0_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_0_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_0_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_0_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_0_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_0_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  reg  dataArray_0_MPORT_en_pipe_0;
  reg [7:0] dataArray_0_MPORT_addr_pipe_0;
  reg  dataArray_0_current_data_en_pipe_0;
  reg [7:0] dataArray_0_current_data_addr_pipe_0;
  reg [511:0] dataArray_1 [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_1_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_1_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_1_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_1_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_1_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_1_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_1_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_1_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_1_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  reg  dataArray_1_MPORT_en_pipe_0;
  reg [7:0] dataArray_1_MPORT_addr_pipe_0;
  reg  dataArray_1_current_data_en_pipe_0;
  reg [7:0] dataArray_1_current_data_addr_pipe_0;
  reg [511:0] dataArray_2 [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_2_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_2_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_2_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_2_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_2_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_2_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_2_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_2_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_2_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  reg  dataArray_2_MPORT_en_pipe_0;
  reg [7:0] dataArray_2_MPORT_addr_pipe_0;
  reg  dataArray_2_current_data_en_pipe_0;
  reg [7:0] dataArray_2_current_data_addr_pipe_0;
  reg [511:0] dataArray_3 [0:255]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_MPORT_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_3_MPORT_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_3_MPORT_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_current_data_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_3_current_data_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_3_current_data_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_3_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_3_MPORT_1_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_MPORT_1_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_MPORT_1_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [511:0] dataArray_3_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire [7:0] dataArray_3_MPORT_2_addr; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_MPORT_2_mask; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  wire  dataArray_3_MPORT_2_en; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  reg  dataArray_3_MPORT_en_pipe_0;
  reg [7:0] dataArray_3_MPORT_addr_pipe_0;
  reg  dataArray_3_current_data_en_pipe_0;
  reg [7:0] dataArray_3_current_data_addr_pipe_0;
  wire  _T_2 = 2'h0 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 143:16]
  wire  _T_3 = 2'h1 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 143:16]
  wire  _T_4 = 2'h2 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 143:16]
  wire  _T_5 = 2'h3 == io_write_way; // @[src/main/scala/icache/ICacheArrays.scala 143:16]
  assign dataArray_0_MPORT_en = dataArray_0_MPORT_en_pipe_0;
  assign dataArray_0_MPORT_addr = dataArray_0_MPORT_addr_pipe_0;
  assign dataArray_0_MPORT_data = dataArray_0[dataArray_0_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_0_current_data_en = dataArray_0_current_data_en_pipe_0;
  assign dataArray_0_current_data_addr = dataArray_0_current_data_addr_pipe_0;
  assign dataArray_0_current_data_data = dataArray_0[dataArray_0_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_0_MPORT_1_data = _T_2 ? io_write_data : dataArray_0_current_data_data;
  assign dataArray_0_MPORT_1_addr = io_write_idx;
  assign dataArray_0_MPORT_1_mask = 1'h1;
  assign dataArray_0_MPORT_1_en = io_write_valid;
  assign dataArray_0_MPORT_2_data = 512'h0;
  assign dataArray_0_MPORT_2_addr = 8'h0;
  assign dataArray_0_MPORT_2_mask = 1'h1;
  assign dataArray_0_MPORT_2_en = 1'h0;
  assign dataArray_1_MPORT_en = dataArray_1_MPORT_en_pipe_0;
  assign dataArray_1_MPORT_addr = dataArray_1_MPORT_addr_pipe_0;
  assign dataArray_1_MPORT_data = dataArray_1[dataArray_1_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_1_current_data_en = dataArray_1_current_data_en_pipe_0;
  assign dataArray_1_current_data_addr = dataArray_1_current_data_addr_pipe_0;
  assign dataArray_1_current_data_data = dataArray_1[dataArray_1_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_1_MPORT_1_data = _T_3 ? io_write_data : dataArray_1_current_data_data;
  assign dataArray_1_MPORT_1_addr = io_write_idx;
  assign dataArray_1_MPORT_1_mask = 1'h1;
  assign dataArray_1_MPORT_1_en = io_write_valid;
  assign dataArray_1_MPORT_2_data = 512'h0;
  assign dataArray_1_MPORT_2_addr = 8'h0;
  assign dataArray_1_MPORT_2_mask = 1'h1;
  assign dataArray_1_MPORT_2_en = 1'h0;
  assign dataArray_2_MPORT_en = dataArray_2_MPORT_en_pipe_0;
  assign dataArray_2_MPORT_addr = dataArray_2_MPORT_addr_pipe_0;
  assign dataArray_2_MPORT_data = dataArray_2[dataArray_2_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_2_current_data_en = dataArray_2_current_data_en_pipe_0;
  assign dataArray_2_current_data_addr = dataArray_2_current_data_addr_pipe_0;
  assign dataArray_2_current_data_data = dataArray_2[dataArray_2_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_2_MPORT_1_data = _T_4 ? io_write_data : dataArray_2_current_data_data;
  assign dataArray_2_MPORT_1_addr = io_write_idx;
  assign dataArray_2_MPORT_1_mask = 1'h1;
  assign dataArray_2_MPORT_1_en = io_write_valid;
  assign dataArray_2_MPORT_2_data = 512'h0;
  assign dataArray_2_MPORT_2_addr = 8'h0;
  assign dataArray_2_MPORT_2_mask = 1'h1;
  assign dataArray_2_MPORT_2_en = 1'h0;
  assign dataArray_3_MPORT_en = dataArray_3_MPORT_en_pipe_0;
  assign dataArray_3_MPORT_addr = dataArray_3_MPORT_addr_pipe_0;
  assign dataArray_3_MPORT_data = dataArray_3[dataArray_3_MPORT_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_3_current_data_en = dataArray_3_current_data_en_pipe_0;
  assign dataArray_3_current_data_addr = dataArray_3_current_data_addr_pipe_0;
  assign dataArray_3_current_data_data = dataArray_3[dataArray_3_current_data_addr]; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
  assign dataArray_3_MPORT_1_data = _T_5 ? io_write_data : dataArray_3_current_data_data;
  assign dataArray_3_MPORT_1_addr = io_write_idx;
  assign dataArray_3_MPORT_1_mask = 1'h1;
  assign dataArray_3_MPORT_1_en = io_write_valid;
  assign dataArray_3_MPORT_2_data = 512'h0;
  assign dataArray_3_MPORT_2_addr = 8'h0;
  assign dataArray_3_MPORT_2_mask = 1'h1;
  assign dataArray_3_MPORT_2_en = 1'h0;
  assign io_read_data_0 = io_read_valid ? dataArray_0_MPORT_data : 512'h0; // @[src/main/scala/icache/ICacheArrays.scala 129:23 130:15 132:15]
  assign io_read_data_1 = io_read_valid ? dataArray_1_MPORT_data : 512'h0; // @[src/main/scala/icache/ICacheArrays.scala 129:23 130:15 132:15]
  assign io_read_data_2 = io_read_valid ? dataArray_2_MPORT_data : 512'h0; // @[src/main/scala/icache/ICacheArrays.scala 129:23 130:15 132:15]
  assign io_read_data_3 = io_read_valid ? dataArray_3_MPORT_data : 512'h0; // @[src/main/scala/icache/ICacheArrays.scala 129:23 130:15 132:15]
  always @(posedge clock) begin
    if (dataArray_0_MPORT_1_en & dataArray_0_MPORT_1_mask) begin
      dataArray_0[dataArray_0_MPORT_1_addr] <= dataArray_0_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    if (dataArray_0_MPORT_2_en & dataArray_0_MPORT_2_mask) begin
      dataArray_0[dataArray_0_MPORT_2_addr] <= dataArray_0_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    dataArray_0_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      dataArray_0_MPORT_addr_pipe_0 <= io_read_idx;
    end
    dataArray_0_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      dataArray_0_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (dataArray_1_MPORT_1_en & dataArray_1_MPORT_1_mask) begin
      dataArray_1[dataArray_1_MPORT_1_addr] <= dataArray_1_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    if (dataArray_1_MPORT_2_en & dataArray_1_MPORT_2_mask) begin
      dataArray_1[dataArray_1_MPORT_2_addr] <= dataArray_1_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    dataArray_1_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      dataArray_1_MPORT_addr_pipe_0 <= io_read_idx;
    end
    dataArray_1_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      dataArray_1_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (dataArray_2_MPORT_1_en & dataArray_2_MPORT_1_mask) begin
      dataArray_2[dataArray_2_MPORT_1_addr] <= dataArray_2_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    if (dataArray_2_MPORT_2_en & dataArray_2_MPORT_2_mask) begin
      dataArray_2[dataArray_2_MPORT_2_addr] <= dataArray_2_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    dataArray_2_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      dataArray_2_MPORT_addr_pipe_0 <= io_read_idx;
    end
    dataArray_2_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      dataArray_2_current_data_addr_pipe_0 <= io_write_idx;
    end
    if (dataArray_3_MPORT_1_en & dataArray_3_MPORT_1_mask) begin
      dataArray_3[dataArray_3_MPORT_1_addr] <= dataArray_3_MPORT_1_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    if (dataArray_3_MPORT_2_en & dataArray_3_MPORT_2_mask) begin
      dataArray_3[dataArray_3_MPORT_2_addr] <= dataArray_3_MPORT_2_data; // @[src/main/scala/icache/ICacheArrays.scala 124:30]
    end
    dataArray_3_MPORT_en_pipe_0 <= io_read_valid;
    if (io_read_valid) begin
      dataArray_3_MPORT_addr_pipe_0 <= io_read_idx;
    end
    dataArray_3_current_data_en_pipe_0 <= 1'h0;
    if (1'h0) begin
      dataArray_3_current_data_addr_pipe_0 <= io_write_idx;
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
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataArray_0[initvar] = _RAND_0[511:0];
  _RAND_5 = {16{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataArray_1[initvar] = _RAND_5[511:0];
  _RAND_10 = {16{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataArray_2[initvar] = _RAND_10[511:0];
  _RAND_15 = {16{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataArray_3[initvar] = _RAND_15[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dataArray_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  dataArray_0_MPORT_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  dataArray_0_current_data_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  dataArray_0_current_data_addr_pipe_0 = _RAND_4[7:0];
  _RAND_6 = {1{`RANDOM}};
  dataArray_1_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  dataArray_1_MPORT_addr_pipe_0 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  dataArray_1_current_data_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  dataArray_1_current_data_addr_pipe_0 = _RAND_9[7:0];
  _RAND_11 = {1{`RANDOM}};
  dataArray_2_MPORT_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  dataArray_2_MPORT_addr_pipe_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  dataArray_2_current_data_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  dataArray_2_current_data_addr_pipe_0 = _RAND_14[7:0];
  _RAND_16 = {1{`RANDOM}};
  dataArray_3_MPORT_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  dataArray_3_MPORT_addr_pipe_0 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  dataArray_3_current_data_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  dataArray_3_current_data_addr_pipe_0 = _RAND_19[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
