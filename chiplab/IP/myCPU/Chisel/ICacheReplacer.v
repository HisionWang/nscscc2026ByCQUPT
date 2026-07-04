module ICacheReplacer(
  input        clock,
  input        reset,
  input        io_touch_valid, // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
  input  [7:0] io_touch_idx, // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
  input  [1:0] io_touch_way, // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
  input        io_victim_req, // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
  input  [7:0] io_victim_idx, // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
  output [1:0] io_victim_resp // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 9:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] plruTree [0:255]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_currentPLRU_en; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [7:0] plruTree_currentPLRU_addr; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [2:0] plruTree_currentPLRU_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_currentPLRU_1_en; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [7:0] plruTree_currentPLRU_1_addr; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [2:0] plruTree_currentPLRU_1_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [2:0] plruTree_MPORT_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [7:0] plruTree_MPORT_addr; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_MPORT_mask; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_MPORT_en; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [2:0] plruTree_MPORT_1_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire [7:0] plruTree_MPORT_1_addr; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_MPORT_1_mask; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  wire  plruTree_MPORT_1_en; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  reg  plruTree_currentPLRU_en_pipe_0;
  reg [7:0] plruTree_currentPLRU_addr_pipe_0;
  reg  plruTree_currentPLRU_1_en_pipe_0;
  reg [7:0] plruTree_currentPLRU_1_addr_pipe_0;
  wire  _newPLRU_T = 2'h0 == io_touch_way; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 39:17]
  wire [2:0] _newPLRU_newPLRU_T_1 = {2'h3,plruTree_currentPLRU_data[2]}; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 41:23]
  wire [2:0] _newPLRU_newPLRU_T_3 = {2'h2,plruTree_currentPLRU_data[2]}; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 44:23]
  wire [2:0] _newPLRU_newPLRU_T_5 = {1'h0,plruTree_currentPLRU_data[1],1'h1}; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 47:23]
  wire [2:0] _newPLRU_newPLRU_T_7 = {1'h0,plruTree_currentPLRU_data[1],1'h0}; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 50:23]
  wire [2:0] _GEN_4 = 2'h3 == io_touch_way ? _newPLRU_newPLRU_T_7 : 3'h0; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 37:13 39:17 50:17]
  wire [2:0] _GEN_5 = 2'h2 == io_touch_way ? _newPLRU_newPLRU_T_5 : _GEN_4; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 39:17 47:17]
  wire [2:0] _GEN_6 = 2'h1 == io_touch_way ? _newPLRU_newPLRU_T_3 : _GEN_5; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 39:17 44:17]
  reg [1:0] victimRespReg; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 86:30]
  wire  victimRespReg_plru0 = plruTree_currentPLRU_1_data[0]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 61:21]
  wire  victimRespReg_plru1 = plruTree_currentPLRU_1_data[1]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 62:21]
  wire  victimRespReg_plru2 = plruTree_currentPLRU_1_data[2]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 63:21]
  wire  _victimRespReg_victim_T_1 = ~victimRespReg_plru1 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 68:20]
  assign plruTree_currentPLRU_en = plruTree_currentPLRU_en_pipe_0;
  assign plruTree_currentPLRU_addr = plruTree_currentPLRU_addr_pipe_0;
  assign plruTree_currentPLRU_data = plruTree[plruTree_currentPLRU_addr]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  assign plruTree_currentPLRU_1_en = plruTree_currentPLRU_1_en_pipe_0;
  assign plruTree_currentPLRU_1_addr = plruTree_currentPLRU_1_addr_pipe_0;
  assign plruTree_currentPLRU_1_data = plruTree[plruTree_currentPLRU_1_addr]; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
  assign plruTree_MPORT_data = _newPLRU_T ? _newPLRU_newPLRU_T_1 : _GEN_6;
  assign plruTree_MPORT_addr = io_touch_idx;
  assign plruTree_MPORT_mask = 1'h1;
  assign plruTree_MPORT_en = io_touch_valid;
  assign plruTree_MPORT_1_data = 3'h0;
  assign plruTree_MPORT_1_addr = 8'h0;
  assign plruTree_MPORT_1_mask = 1'h1;
  assign plruTree_MPORT_1_en = 1'h0;
  assign io_victim_resp = victimRespReg; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 94:18]
  always @(posedge clock) begin
    if (plruTree_MPORT_en & plruTree_MPORT_mask) begin
      plruTree[plruTree_MPORT_addr] <= plruTree_MPORT_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
    end
    if (plruTree_MPORT_1_en & plruTree_MPORT_1_mask) begin
      plruTree[plruTree_MPORT_1_addr] <= plruTree_MPORT_1_data; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 31:29]
    end
    plruTree_currentPLRU_en_pipe_0 <= io_touch_valid;
    if (io_touch_valid) begin
      plruTree_currentPLRU_addr_pipe_0 <= io_touch_idx;
    end
    plruTree_currentPLRU_1_en_pipe_0 <= io_victim_req;
    if (io_victim_req) begin
      plruTree_currentPLRU_1_addr_pipe_0 <= io_victim_idx;
    end
    if (reset) begin // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 86:30]
      victimRespReg <= 2'h0; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 86:30]
    end else if (io_victim_req) begin // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 88:23]
      if (~victimRespReg_plru0) begin // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 66:25]
        victimRespReg <= {{1'd0}, _victimRespReg_victim_T_1}; // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 68:14]
      end else if (~victimRespReg_plru2) begin // @[\\src\\main\\scala\\icache\\ICacheReplacer.scala 71:20]
        victimRespReg <= 2'h2;
      end else begin
        victimRespReg <= 2'h3;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    plruTree[initvar] = _RAND_0[2:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  plruTree_currentPLRU_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  plruTree_currentPLRU_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  plruTree_currentPLRU_1_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  plruTree_currentPLRU_1_addr_pipe_0 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  victimRespReg = _RAND_5[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
