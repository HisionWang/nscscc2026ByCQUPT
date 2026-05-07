module FetchUnit(
  input         clock,
  input         reset,
  output [31:0] io_icache_req_addr, // @[src/main/scala/FetchUnit.scala 9:14]
  input         io_icache_req_ready, // @[src/main/scala/FetchUnit.scala 9:14]
  output        io_icache_req_valid, // @[src/main/scala/FetchUnit.scala 9:14]
  input         io_start_valid // @[src/main/scala/FetchUnit.scala 9:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc_reg; // @[src/main/scala/FetchUnit.scala 42:23]
  reg  pc_valid; // @[src/main/scala/FetchUnit.scala 43:25]
  wire  _GEN_1 = io_start_valid | pc_valid; // @[src/main/scala/FetchUnit.scala 46:24 48:14 43:25]
  wire  _io_icache_req_valid_T = io_icache_req_ready & pc_valid; // @[src/main/scala/FetchUnit.scala 56:46]
  wire [31:0] _pc_reg_T_1 = pc_reg + 32'h18; // @[src/main/scala/FetchUnit.scala 61:22]
  assign io_icache_req_addr = pc_reg; // @[src/main/scala/FetchUnit.scala 57:22]
  assign io_icache_req_valid = io_icache_req_ready & pc_valid; // @[src/main/scala/FetchUnit.scala 56:46]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FetchUnit.scala 42:23]
      pc_reg <= 32'h1c000000; // @[src/main/scala/FetchUnit.scala 42:23]
    end else if (_io_icache_req_valid_T) begin // @[src/main/scala/FetchUnit.scala 60:41]
      pc_reg <= _pc_reg_T_1; // @[src/main/scala/FetchUnit.scala 61:12]
    end else if (io_start_valid) begin // @[src/main/scala/FetchUnit.scala 46:24]
      pc_reg <= 32'h1c000000; // @[src/main/scala/FetchUnit.scala 47:12]
    end
    if (reset) begin // @[src/main/scala/FetchUnit.scala 43:25]
      pc_valid <= 1'h0; // @[src/main/scala/FetchUnit.scala 43:25]
    end else begin
      pc_valid <= _GEN_1;
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
  pc_reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pc_valid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
