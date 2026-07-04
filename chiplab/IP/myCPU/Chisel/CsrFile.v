module CsrFile(
  input         clock,
  input         reset,
  input  [7:0]  io_irqBus, // @[\\src\\main\\scala\\csr\\CsrFile.scala 10:14]
  output [31:0] difftest_estat, // @[\\src\\main\\scala\\csr\\CsrFile.scala 11:45]
  output [63:0] difftest_timer64 // @[\\src\\main\\scala\\csr\\CsrFile.scala 11:45]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] estat_is1_bits; // @[\\src\\main\\scala\\csr\\CsrFile.scala 27:26]
  reg [63:0] timer64; // @[\\src\\main\\scala\\csr\\CsrFile.scala 60:24]
  wire [63:0] _timer64_T_1 = timer64 + 64'h1; // @[\\src\\main\\scala\\csr\\CsrFile.scala 61:22]
  wire [11:0] lo_2 = {2'h0,estat_is1_bits,2'h0}; // @[\\src\\main\\scala\\csr\\CsrBundle.scala 39:25]
  assign difftest_estat = {20'h0,lo_2}; // @[\\src\\main\\scala\\csr\\CsrBundle.scala 39:25]
  assign difftest_timer64 = timer64; // @[\\src\\main\\scala\\csr\\CsrFile.scala 414:18]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\csr\\CsrFile.scala 27:26]
      estat_is1_bits <= 8'h0; // @[\\src\\main\\scala\\csr\\CsrFile.scala 27:26]
    end else begin
      estat_is1_bits <= io_irqBus; // @[\\src\\main\\scala\\csr\\Field.scala 19:35]
    end
    if (reset) begin // @[\\src\\main\\scala\\csr\\CsrFile.scala 60:24]
      timer64 <= 64'h0; // @[\\src\\main\\scala\\csr\\CsrFile.scala 60:24]
    end else begin
      timer64 <= _timer64_T_1; // @[\\src\\main\\scala\\csr\\CsrFile.scala 61:11]
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
  estat_is1_bits = _RAND_0[7:0];
  _RAND_1 = {2{`RANDOM}};
  timer64 = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
