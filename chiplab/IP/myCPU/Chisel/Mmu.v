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
  output        io_toIcache_bits_error_excpTlbPpi, // @[src/main/scala/mmu/Mmu.scala 15:14]
  output        io_toIcache_bits_error_excpAdef // @[src/main/scala/mmu/Mmu.scala 15:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
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
  wire  isIdle = ~state; // @[src/main/scala/mmu/Mmu.scala 38:22]
  reg [31:0] reqBuffer_vaddr; // @[src/main/scala/mmu/Mmu.scala 41:26]
  wire  _T = io_fromIcache_ready & io_fromIcache_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_1 = io_toIcache_ready & io_toIcache_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_1 = _T_1 ? 1'h0 : state; // @[src/main/scala/mmu/Mmu.scala 51:34 53:13 36:22]
  wire  _GEN_4 = _T | _GEN_1; // @[src/main/scala/mmu/Mmu.scala 47:31 50:13]
  wire [31:0] reqVaddr = isIdle ? io_fromIcache_bits_vaddr : reqBuffer_vaddr; // @[src/main/scala/mmu/Mmu.scala 57:21]
  wire  isPaging = 1'h0; // @[src/main/scala/mmu/Mmu.scala 59:34]
  wire  isDirect = 1'h1; // @[src/main/scala/mmu/Mmu.scala 60:34]
  wire  dmwHit = 1'h0; // @[src/main/scala/mmu/Mmu.scala 65:25]
  wire  needTlb = isPaging & ~isPaging; // @[src/main/scala/mmu/Mmu.scala 66:27]
  wire [31:0] tlbOut_paddr = {20'h0,tlb_io_search_0_resp_bits_offset[11:0]}; // @[src/main/scala/mmu/Mmu.scala 135:10]
  wire [31:0] _io_toIcache_bits_T_paddr = isPaging ? 32'h0 : tlbOut_paddr; // @[src/main/scala/mmu/Mmu.scala 124:27]
  wire  _io_toIcache_bits_T_hasError = isPaging ? 1'h0 : 1'h1; // @[src/main/scala/mmu/Mmu.scala 124:27]
  wire [31:0] directResp_paddr = reqVaddr; // @[src/main/scala/mmu/Mmu.scala 57:21]
  wire  directResp_cacheable = 1'h1; // @[src/main/scala/mmu/Mmu.scala 68:31 73:24]
  wire  directResp_hasError = 1'h0; // @[src/main/scala/mmu/Mmu.scala 68:31 75:24]
  wire  directResp_error_excpTlbRefill = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  directResp_error_excpTlbPif = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  directResp_error_excpTlbPpi = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
  wire  directResp_error_excpAdef = 1'h0; // @[src/main/scala/mmu/Mmu.scala 19:{57,57}]
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
  assign io_fromIcache_ready = isIdle & (~needTlb | tlb_io_search_0_req_ready); // @[src/main/scala/mmu/Mmu.scala 100:33]
  assign io_toIcache_valid = state & (isDirect | tlb_io_search_0_resp_valid | isPaging); // @[src/main/scala/mmu/Mmu.scala 107:31]
  assign io_toIcache_bits_paddr = isDirect ? directResp_paddr : _io_toIcache_bits_T_paddr; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_cacheable = isDirect ? isDirect : 1'h1; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_hasError = isDirect ? isPaging : _io_toIcache_bits_T_hasError; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_error_excpTlbRefill = isDirect ? isPaging : _io_toIcache_bits_T_hasError; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_error_excpTlbPif = isDirect & isPaging; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_error_excpTlbPpi = isDirect & isPaging; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign io_toIcache_bits_error_excpAdef = isDirect & isPaging; // @[src/main/scala/mmu/Mmu.scala 123:27]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_search_0_req_valid = isIdle & io_fromIcache_valid & needTlb; // @[src/main/scala/mmu/Mmu.scala 94:58]
  assign tlb_io_search_0_req_bits_offset = reqVaddr[21:0]; // @[src/main/scala/mmu/Mmu.scala 97:36]
  assign tlb_io_search_0_resp_ready = state & io_toIcache_ready; // @[src/main/scala/mmu/Mmu.scala 102:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 36:22]
      state <= 1'h0; // @[src/main/scala/mmu/Mmu.scala 36:22]
    end else begin
      state <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 41:26]
      reqBuffer_vaddr <= 32'h0; // @[src/main/scala/mmu/Mmu.scala 41:26]
    end else if (_T) begin // @[src/main/scala/mmu/Mmu.scala 47:31]
      reqBuffer_vaddr <= io_fromIcache_bits_vaddr; // @[src/main/scala/mmu/Mmu.scala 48:17]
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
  _RAND_1 = {1{`RANDOM}};
  reqBuffer_vaddr = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
