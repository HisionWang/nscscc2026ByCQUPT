module RegFile(
  input         clock,
  input         reset,
  input  [6:0]  io_readPorts_0_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_0_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_1_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_1_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_2_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_2_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_3_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_3_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_4_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_4_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_5_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_5_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_6_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_6_data, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  input  [6:0]  io_readPorts_7_addr, // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
  output [31:0] io_readPorts_7_data // @[src/main/scala/backend/regfile/RegFile.scala 32:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regfile [0:127]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_0_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_0_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_0_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_1_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_1_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_1_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_2_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_2_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_2_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_3_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_3_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_3_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_4_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_4_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_4_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_5_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_5_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_5_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_6_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_6_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_6_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_readDataRaw_7_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_readDataRaw_7_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_readDataRaw_7_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_MPORT_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_mask; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_MPORT_1_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_MPORT_1_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_1_mask; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_1_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_MPORT_2_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_MPORT_2_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_2_mask; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_2_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_MPORT_3_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_MPORT_3_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_3_mask; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_3_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [31:0] regfile_MPORT_4_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire [6:0] regfile_MPORT_4_addr; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_4_mask; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  wire  regfile_MPORT_4_en; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  reg [6:0] readAddrs_0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_1; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_2; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_3; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_4; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_5; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_6; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  reg [6:0] readAddrs_7; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
  wire [31:0] readDataRaw_0 = regfile_readDataRaw_0_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_1 = regfile_readDataRaw_1_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_2 = regfile_readDataRaw_2_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_3 = regfile_readDataRaw_3_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_4 = regfile_readDataRaw_4_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_5 = regfile_readDataRaw_5_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_6 = regfile_readDataRaw_6_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  wire [31:0] readDataRaw_7 = regfile_readDataRaw_7_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 43:25 45:20]
  assign regfile_readDataRaw_0_MPORT_en = 1'h1;
  assign regfile_readDataRaw_0_MPORT_addr = readAddrs_0;
  assign regfile_readDataRaw_0_MPORT_data = regfile[regfile_readDataRaw_0_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_1_MPORT_en = 1'h1;
  assign regfile_readDataRaw_1_MPORT_addr = readAddrs_1;
  assign regfile_readDataRaw_1_MPORT_data = regfile[regfile_readDataRaw_1_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_2_MPORT_en = 1'h1;
  assign regfile_readDataRaw_2_MPORT_addr = readAddrs_2;
  assign regfile_readDataRaw_2_MPORT_data = regfile[regfile_readDataRaw_2_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_3_MPORT_en = 1'h1;
  assign regfile_readDataRaw_3_MPORT_addr = readAddrs_3;
  assign regfile_readDataRaw_3_MPORT_data = regfile[regfile_readDataRaw_3_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_4_MPORT_en = 1'h1;
  assign regfile_readDataRaw_4_MPORT_addr = readAddrs_4;
  assign regfile_readDataRaw_4_MPORT_data = regfile[regfile_readDataRaw_4_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_5_MPORT_en = 1'h1;
  assign regfile_readDataRaw_5_MPORT_addr = readAddrs_5;
  assign regfile_readDataRaw_5_MPORT_data = regfile[regfile_readDataRaw_5_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_6_MPORT_en = 1'h1;
  assign regfile_readDataRaw_6_MPORT_addr = readAddrs_6;
  assign regfile_readDataRaw_6_MPORT_data = regfile[regfile_readDataRaw_6_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_readDataRaw_7_MPORT_en = 1'h1;
  assign regfile_readDataRaw_7_MPORT_addr = readAddrs_7;
  assign regfile_readDataRaw_7_MPORT_data = regfile[regfile_readDataRaw_7_MPORT_addr]; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
  assign regfile_MPORT_data = 32'h0;
  assign regfile_MPORT_addr = 7'h0;
  assign regfile_MPORT_mask = 1'h1;
  assign regfile_MPORT_en = 1'h0;
  assign regfile_MPORT_1_data = 32'h0;
  assign regfile_MPORT_1_addr = 7'h0;
  assign regfile_MPORT_1_mask = 1'h1;
  assign regfile_MPORT_1_en = 1'h0;
  assign regfile_MPORT_2_data = 32'h0;
  assign regfile_MPORT_2_addr = 7'h0;
  assign regfile_MPORT_2_mask = 1'h1;
  assign regfile_MPORT_2_en = 1'h0;
  assign regfile_MPORT_3_data = 32'h0;
  assign regfile_MPORT_3_addr = 7'h0;
  assign regfile_MPORT_3_mask = 1'h1;
  assign regfile_MPORT_3_en = 1'h0;
  assign regfile_MPORT_4_data = 32'h0;
  assign regfile_MPORT_4_addr = 7'h0;
  assign regfile_MPORT_4_mask = 1'h1;
  assign regfile_MPORT_4_en = 1'h0;
  assign io_readPorts_0_data = readAddrs_0 == 7'h0 ? 32'h0 : readDataRaw_0; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_1_data = readAddrs_1 == 7'h0 ? 32'h0 : readDataRaw_1; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_2_data = readAddrs_2 == 7'h0 ? 32'h0 : readDataRaw_2; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_3_data = readAddrs_3 == 7'h0 ? 32'h0 : readDataRaw_3; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_4_data = readAddrs_4 == 7'h0 ? 32'h0 : readDataRaw_4; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_5_data = readAddrs_5 == 7'h0 ? 32'h0 : readDataRaw_5; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_6_data = readAddrs_6 == 7'h0 ? 32'h0 : readDataRaw_6; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  assign io_readPorts_7_data = readAddrs_7 == 7'h0 ? 32'h0 : readDataRaw_7; // @[src/main/scala/backend/regfile/RegFile.scala 59:32]
  always @(posedge clock) begin
    if (regfile_MPORT_en & regfile_MPORT_mask) begin
      regfile[regfile_MPORT_addr] <= regfile_MPORT_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
    end
    if (regfile_MPORT_1_en & regfile_MPORT_1_mask) begin
      regfile[regfile_MPORT_1_addr] <= regfile_MPORT_1_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
    end
    if (regfile_MPORT_2_en & regfile_MPORT_2_mask) begin
      regfile[regfile_MPORT_2_addr] <= regfile_MPORT_2_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
    end
    if (regfile_MPORT_3_en & regfile_MPORT_3_mask) begin
      regfile[regfile_MPORT_3_addr] <= regfile_MPORT_3_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
    end
    if (regfile_MPORT_4_en & regfile_MPORT_4_mask) begin
      regfile[regfile_MPORT_4_addr] <= regfile_MPORT_4_data; // @[src/main/scala/backend/regfile/RegFile.scala 37:20]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_0 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_0 <= io_readPorts_0_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_1 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_1 <= io_readPorts_1_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_2 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_2 <= io_readPorts_2_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_3 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_3 <= io_readPorts_3_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_4 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_4 <= io_readPorts_4_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_5 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_5 <= io_readPorts_5_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_6 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_6 <= io_readPorts_6_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
      readAddrs_7 <= 7'h0; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
    end else begin
      readAddrs_7 <= io_readPorts_7_addr; // @[src/main/scala/backend/regfile/RegFile.scala 40:48]
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
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    regfile[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readAddrs_0 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  readAddrs_1 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  readAddrs_2 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  readAddrs_3 = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  readAddrs_4 = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  readAddrs_5 = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  readAddrs_6 = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  readAddrs_7 = _RAND_8[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
