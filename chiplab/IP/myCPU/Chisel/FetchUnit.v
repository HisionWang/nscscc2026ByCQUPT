module FetchUnit(
  input         clock,
  input         reset,
  output [31:0] io_icache_req_addr, // @[src/main/scala/FetchUnit.scala 9:14]
  output        io_icache_req_valid, // @[src/main/scala/FetchUnit.scala 9:14]
  input         io_icache_resp_valid // @[src/main/scala/FetchUnit.scala 9:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc_reg; // @[src/main/scala/FetchUnit.scala 40:23]
  reg  pc_valid; // @[src/main/scala/FetchUnit.scala 41:25]
  reg [1:0] fetch_state; // @[src/main/scala/FetchUnit.scala 50:28]
  wire [31:0] _pc_reg_T_1 = pc_reg + 32'h10; // @[src/main/scala/FetchUnit.scala 74:26]
  wire [1:0] _GEN_5 = io_icache_resp_valid ? 2'h0 : fetch_state; // @[src/main/scala/FetchUnit.scala 72:34 73:21]
  wire [31:0] _GEN_6 = io_icache_resp_valid ? _pc_reg_T_1 : 32'h1c000000; // @[src/main/scala/FetchUnit.scala 72:34 74:16]
  assign io_icache_req_addr = pc_reg; // @[src/main/scala/FetchUnit.scala 55:22]
  assign io_icache_req_valid = fetch_state == 2'h1 & pc_valid; // @[src/main/scala/FetchUnit.scala 54:50]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FetchUnit.scala 40:23]
      pc_reg <= 32'h1c000000; // @[src/main/scala/FetchUnit.scala 40:23]
    end else if (2'h0 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      pc_reg <= 32'h1c000000;
    end else if (2'h1 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      pc_reg <= 32'h1c000000;
    end else if (2'h2 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      pc_reg <= _GEN_6;
    end else begin
      pc_reg <= 32'h1c000000;
    end
    if (reset) begin // @[src/main/scala/FetchUnit.scala 41:25]
      pc_valid <= 1'h0; // @[src/main/scala/FetchUnit.scala 41:25]
    end else begin
      pc_valid <= 1'h1;
    end
    if (reset) begin // @[src/main/scala/FetchUnit.scala 50:28]
      fetch_state <= 2'h0; // @[src/main/scala/FetchUnit.scala 50:28]
    end else if (2'h0 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      if (pc_valid) begin // @[src/main/scala/FetchUnit.scala 61:35]
        fetch_state <= 2'h1; // @[src/main/scala/FetchUnit.scala 62:21]
      end
    end else if (2'h1 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      if (io_icache_req_valid) begin // @[src/main/scala/FetchUnit.scala 66:46]
        fetch_state <= 2'h2; // @[src/main/scala/FetchUnit.scala 67:21]
      end
    end else if (2'h2 == fetch_state) begin // @[src/main/scala/FetchUnit.scala 59:23]
      fetch_state <= _GEN_5;
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
  _RAND_2 = {1{`RANDOM}};
  fetch_state = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
