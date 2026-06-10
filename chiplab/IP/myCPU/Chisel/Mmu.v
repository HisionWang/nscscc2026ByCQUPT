module Mmu(
  input         clock,
  input         reset,
  output        io_fromIcache_ready, // @[src/main/scala/mmu/Mmu.scala 15:14]
  input         io_fromIcache_valid, // @[src/main/scala/mmu/Mmu.scala 15:14]
  input  [31:0] io_fromIcache_bits_vaddr, // @[src/main/scala/mmu/Mmu.scala 15:14]
  input         io_toIcache_ready, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_valid, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output [31:0] io_toIcache_bits_paddr, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_cacheable, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_hasError, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_error_excpTlbRefill, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_error_excpTlbPif, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_error_excpTlbPpi // @[src/main/scala/mmu/Mmu.scala 15:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  tlb_clock; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire  tlb_reset; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire  tlb_io_search_0_req_ready; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire  tlb_io_search_0_req_valid; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire [21:0] tlb_io_search_0_req_bits_offset; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire  tlb_io_search_0_resp_ready; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire  tlb_io_search_0_resp_valid; // @[src/main/scala/mmu/Mmu.scala 17:19]
  wire [21:0] tlb_io_search_0_resp_bits_offset; // @[src/main/scala/mmu/Mmu.scala 17:19]
  reg  state; // @[src/main/scala/mmu/Mmu.scala 36:22]
  wire  isPaging = 1'h0; // @[src/main/scala/mmu/Mmu.scala 44:34]
  wire  isDirect = 1'h1; // @[src/main/scala/mmu/Mmu.scala 45:34]
  wire  dmwHit = 1'h0; // @[src/main/scala/mmu/Mmu.scala 50:25]
  wire  useTlb = isPaging & ~isPaging; // @[src/main/scala/mmu/Mmu.scala 51:26]
  wire [31:0] _directResp_paddr_T_6 = io_fromIcache_bits_vaddr; // @[src/main/scala/mmu/Mmu.scala 55:26]
  wire [31:0] tlbOut_paddr = {20'h0,tlb_io_search_0_resp_bits_offset[11:0]}; // @[src/main/scala/mmu/Mmu.scala 110:10]
  wire [31:0] directResp_paddr = io_fromIcache_bits_vaddr; // @[src/main/scala/mmu/Mmu.scala 54:26]
  wire  directResp_cacheable = 1'h1; // @[src/main/scala/mmu/Mmu.scala 53:31 60:24]
  wire  directResp_hasError = 1'h0; // @[src/main/scala/mmu/Mmu.scala 53:31 62:23]
  wire  directResp_error_excpTlbRefill = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  directResp_error_excpTlbPif = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  directResp_error_excpTlbPpi = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  _T = tlb_io_search_0_resp_ready & tlb_io_search_0_resp_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_0 = _T & state ? 1'h0 : state; // @[src/main/scala/mmu/Mmu.scala 120:42 121:13 36:22]
  wire  _GEN_1 = useTlb | _GEN_0; // @[src/main/scala/mmu/Mmu.scala 118:19 119:13]
  Tlb tlb ( // @[src/main/scala/mmu/Mmu.scala 17:19]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_search_0_req_ready(tlb_io_search_0_req_ready),
    .io_search_0_req_valid(tlb_io_search_0_req_valid),
    .io_search_0_req_bits_offset(tlb_io_search_0_req_bits_offset),
    .io_search_0_resp_ready(tlb_io_search_0_resp_ready),
    .io_search_0_resp_valid(tlb_io_search_0_resp_valid),
    .io_search_0_resp_bits_offset(tlb_io_search_0_resp_bits_offset)
  );
  assign io_fromIcache_ready = ~state; // @[src/main/scala/mmu/Mmu.scala 38:22]
  assign io_toIcache_valid = tlb_io_search_0_resp_valid | isPaging; // @[src/main/scala/mmu/Mmu.scala 83:41]
  assign io_toIcache_bits_paddr = isPaging ? _directResp_paddr_T_6 : tlbOut_paddr; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign io_toIcache_bits_cacheable = isPaging ? isDirect : 1'h1; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign io_toIcache_bits_hasError = isPaging ? isPaging : 1'h1; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign io_toIcache_bits_error_excpTlbRefill = isPaging ? isPaging : 1'h1; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign io_toIcache_bits_error_excpTlbPif = isPaging & isPaging; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign io_toIcache_bits_error_excpTlbPpi = isPaging & isPaging; // @[src/main/scala/mmu/Mmu.scala 99:27]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_search_0_req_valid = io_fromIcache_valid & useTlb; // @[src/main/scala/mmu/Mmu.scala 70:48]
  assign tlb_io_search_0_req_bits_offset = io_fromIcache_bits_vaddr[21:0]; // @[src/main/scala/mmu/Mmu.scala 73:25]
  assign tlb_io_search_0_resp_ready = io_fromIcache_ready; // @[src/main/scala/mmu/Mmu.scala 78:42]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 36:22]
      state <= 1'h0; // @[src/main/scala/mmu/Mmu.scala 36:22]
    end else begin
      state <= _GEN_1;
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
  state = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
