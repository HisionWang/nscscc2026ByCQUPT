module SimpleBlockRAM_2(
  input          clock,
  input          io_wr_en, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  input  [7:0]   io_wr_addr, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  input  [511:0] io_wr_data, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  input          io_rd_en, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  input  [7:0]   io_rd_addr, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  output [511:0] io_rd_data, // @[src/main/scala/icache/BlockRAM.scala 17:14]
  output         io_rd_valid // @[src/main/scala/icache/BlockRAM.scala 17:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] mem [0:255]; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire  mem_dataPipeline_0_MPORT_en; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [7:0] mem_dataPipeline_0_MPORT_addr; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [511:0] mem_dataPipeline_0_MPORT_data; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire  mem_io_rd_data_MPORT_en; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [7:0] mem_io_rd_data_MPORT_addr; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [511:0] mem_io_rd_data_MPORT_data; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [511:0] mem_MPORT_data; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire [7:0] mem_MPORT_addr; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire  mem_MPORT_mask; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  wire  mem_MPORT_en; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  reg  mem_dataPipeline_0_MPORT_en_pipe_0;
  reg [7:0] mem_dataPipeline_0_MPORT_addr_pipe_0;
  reg  mem_io_rd_data_MPORT_en_pipe_0;
  reg [7:0] mem_io_rd_data_MPORT_addr_pipe_0;
  reg  rdPipeline_0; // @[src/main/scala/icache/BlockRAM.scala 38:23]
  reg  rdPipeline_1; // @[src/main/scala/icache/BlockRAM.scala 38:23]
  assign mem_dataPipeline_0_MPORT_en = mem_dataPipeline_0_MPORT_en_pipe_0;
  assign mem_dataPipeline_0_MPORT_addr = mem_dataPipeline_0_MPORT_addr_pipe_0;
  assign mem_dataPipeline_0_MPORT_data = mem[mem_dataPipeline_0_MPORT_addr]; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  assign mem_io_rd_data_MPORT_en = mem_io_rd_data_MPORT_en_pipe_0;
  assign mem_io_rd_data_MPORT_addr = mem_io_rd_data_MPORT_addr_pipe_0;
  assign mem_io_rd_data_MPORT_data = mem[mem_io_rd_data_MPORT_addr]; // @[src/main/scala/icache/BlockRAM.scala 35:24]
  assign mem_MPORT_data = io_wr_data;
  assign mem_MPORT_addr = io_wr_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wr_en;
  assign io_rd_data = mem_io_rd_data_MPORT_data; // @[src/main/scala/icache/BlockRAM.scala 57:14]
  assign io_rd_valid = rdPipeline_1; // @[src/main/scala/icache/BlockRAM.scala 58:15]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[src/main/scala/icache/BlockRAM.scala 35:24]
    end
    mem_dataPipeline_0_MPORT_en_pipe_0 <= io_rd_en;
    if (io_rd_en) begin
      mem_dataPipeline_0_MPORT_addr_pipe_0 <= io_rd_addr;
    end
    mem_io_rd_data_MPORT_en_pipe_0 <= io_rd_en;
    if (io_rd_en) begin
      mem_io_rd_data_MPORT_addr_pipe_0 <= io_rd_addr;
    end
    rdPipeline_0 <= io_rd_en; // @[src/main/scala/icache/BlockRAM.scala 47:17]
    rdPipeline_1 <= rdPipeline_0; // @[src/main/scala/icache/BlockRAM.scala 52:19]
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
    mem[initvar] = _RAND_0[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_dataPipeline_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_dataPipeline_0_MPORT_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  mem_io_rd_data_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mem_io_rd_data_MPORT_addr_pipe_0 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  rdPipeline_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rdPipeline_1 = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
