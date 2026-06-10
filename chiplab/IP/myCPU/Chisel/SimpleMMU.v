module SimpleMMU(
  input         clock,
  input         reset,
  input         io_mmu_toMmu_valid, // @[src/main/scala/icache/SimpleMMU.scala 10:14]
  input  [31:0] io_mmu_toMmu_bits_vaddr, // @[src/main/scala/icache/SimpleMMU.scala 10:14]
  output        io_mmu_fromMmu_valid, // @[src/main/scala/icache/SimpleMMU.scala 10:14]
  output [31:0] io_mmu_fromMmu_bits_paddr // @[src/main/scala/icache/SimpleMMU.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stage1_valid; // @[src/main/scala/icache/SimpleMMU.scala 15:29]
  reg [31:0] stage1_vaddr; // @[src/main/scala/icache/SimpleMMU.scala 16:25]
  assign io_mmu_fromMmu_valid = stage1_valid; // @[src/main/scala/icache/SimpleMMU.scala 34:24]
  assign io_mmu_fromMmu_bits_paddr = stage1_vaddr; // @[src/main/scala/icache/SimpleMMU.scala 35:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/SimpleMMU.scala 15:29]
      stage1_valid <= 1'h0; // @[src/main/scala/icache/SimpleMMU.scala 15:29]
    end else begin
      stage1_valid <= io_mmu_toMmu_valid;
    end
    if (io_mmu_toMmu_valid) begin // @[src/main/scala/icache/SimpleMMU.scala 22:28]
      stage1_vaddr <= io_mmu_toMmu_bits_vaddr; // @[src/main/scala/icache/SimpleMMU.scala 24:18]
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
  stage1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stage1_vaddr = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
