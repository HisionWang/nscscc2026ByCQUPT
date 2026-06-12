module SimpleBlockRAM(
  input         clock,
  input         reset,
  input         io_wr_en, // @[src/main/scala/util/BlockRAM.scala 14:14]
  input  [3:0]  io_wr_addr, // @[src/main/scala/util/BlockRAM.scala 14:14]
  input  [62:0] io_wr_data, // @[src/main/scala/util/BlockRAM.scala 14:14]
  input         io_rd_en, // @[src/main/scala/util/BlockRAM.scala 14:14]
  input  [3:0]  io_rd_addr, // @[src/main/scala/util/BlockRAM.scala 14:14]
  output [62:0] io_rd_data // @[src/main/scala/util/BlockRAM.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [62:0] mem_0; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_1; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_2; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_3; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_4; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_5; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_6; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_7; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_8; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_9; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_10; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_11; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_12; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_13; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_14; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] mem_15; // @[src/main/scala/util/BlockRAM.scala 34:14]
  reg [62:0] dataPipeline_0; // @[src/main/scala/util/BlockRAM.scala 39:25]
  wire [62:0] _GEN_1 = 4'h1 == io_rd_addr ? mem_1 : mem_0; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_2 = 4'h2 == io_rd_addr ? mem_2 : _GEN_1; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_3 = 4'h3 == io_rd_addr ? mem_3 : _GEN_2; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_4 = 4'h4 == io_rd_addr ? mem_4 : _GEN_3; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_5 = 4'h5 == io_rd_addr ? mem_5 : _GEN_4; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_6 = 4'h6 == io_rd_addr ? mem_6 : _GEN_5; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_7 = 4'h7 == io_rd_addr ? mem_7 : _GEN_6; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_8 = 4'h8 == io_rd_addr ? mem_8 : _GEN_7; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_9 = 4'h9 == io_rd_addr ? mem_9 : _GEN_8; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_10 = 4'ha == io_rd_addr ? mem_10 : _GEN_9; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_11 = 4'hb == io_rd_addr ? mem_11 : _GEN_10; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  wire [62:0] _GEN_12 = 4'hc == io_rd_addr ? mem_12 : _GEN_11; // @[src/main/scala/util/BlockRAM.scala 43:{21,21}]
  assign io_rd_data = dataPipeline_0; // @[src/main/scala/util/BlockRAM.scala 53:14]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_0 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h0 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_0 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_1 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h1 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_1 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_2 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h2 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_2 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_3 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h3 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_3 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_4 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h4 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_4 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_5 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h5 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_5 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_6 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h6 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_6 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_7 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h7 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_7 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_8 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h8 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_8 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_9 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'h9 == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_9 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_10 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'ha == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_10 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_11 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'hb == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_11 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_12 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'hc == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_12 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_13 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'hd == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_13 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_14 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'he == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_14 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (reset) begin // @[src/main/scala/util/BlockRAM.scala 34:14]
      mem_15 <= 63'h0; // @[src/main/scala/util/BlockRAM.scala 34:14]
    end else if (io_wr_en) begin // @[src/main/scala/util/BlockRAM.scala 56:18]
      if (4'hf == io_wr_addr) begin // @[src/main/scala/util/BlockRAM.scala 57:21]
        mem_15 <= io_wr_data; // @[src/main/scala/util/BlockRAM.scala 57:21]
      end
    end
    if (io_rd_en) begin // @[src/main/scala/util/BlockRAM.scala 42:18]
      if (4'hf == io_rd_addr) begin // @[src/main/scala/util/BlockRAM.scala 43:21]
        dataPipeline_0 <= mem_15; // @[src/main/scala/util/BlockRAM.scala 43:21]
      end else if (4'he == io_rd_addr) begin // @[src/main/scala/util/BlockRAM.scala 43:21]
        dataPipeline_0 <= mem_14; // @[src/main/scala/util/BlockRAM.scala 43:21]
      end else if (4'hd == io_rd_addr) begin // @[src/main/scala/util/BlockRAM.scala 43:21]
        dataPipeline_0 <= mem_13; // @[src/main/scala/util/BlockRAM.scala 43:21]
      end else begin
        dataPipeline_0 <= _GEN_12;
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
  _RAND_0 = {2{`RANDOM}};
  mem_0 = _RAND_0[62:0];
  _RAND_1 = {2{`RANDOM}};
  mem_1 = _RAND_1[62:0];
  _RAND_2 = {2{`RANDOM}};
  mem_2 = _RAND_2[62:0];
  _RAND_3 = {2{`RANDOM}};
  mem_3 = _RAND_3[62:0];
  _RAND_4 = {2{`RANDOM}};
  mem_4 = _RAND_4[62:0];
  _RAND_5 = {2{`RANDOM}};
  mem_5 = _RAND_5[62:0];
  _RAND_6 = {2{`RANDOM}};
  mem_6 = _RAND_6[62:0];
  _RAND_7 = {2{`RANDOM}};
  mem_7 = _RAND_7[62:0];
  _RAND_8 = {2{`RANDOM}};
  mem_8 = _RAND_8[62:0];
  _RAND_9 = {2{`RANDOM}};
  mem_9 = _RAND_9[62:0];
  _RAND_10 = {2{`RANDOM}};
  mem_10 = _RAND_10[62:0];
  _RAND_11 = {2{`RANDOM}};
  mem_11 = _RAND_11[62:0];
  _RAND_12 = {2{`RANDOM}};
  mem_12 = _RAND_12[62:0];
  _RAND_13 = {2{`RANDOM}};
  mem_13 = _RAND_13[62:0];
  _RAND_14 = {2{`RANDOM}};
  mem_14 = _RAND_14[62:0];
  _RAND_15 = {2{`RANDOM}};
  mem_15 = _RAND_15[62:0];
  _RAND_16 = {2{`RANDOM}};
  dataPipeline_0 = _RAND_16[62:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
