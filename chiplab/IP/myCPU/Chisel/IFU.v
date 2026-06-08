module IFU(
  input         clock,
  input         reset,
  input         io_redirect_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_frontendRedirect_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_frontendRedirect_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_predictReq_pc, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_predictFire, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_taken, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_predictResp_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [2:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_icache_req_addr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_req_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_flush, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_bpuInfoQueuEnq_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_bpuInfoQueuEnq_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_bpuInfoQueuEnq_bits_fallThrough, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_bpuInfoQueuEnq_bits_taken, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_bpuInfoQueuEnq_bits_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [2:0]  io_bpuInfoQueuEnq_bits_takenOffset // @[src/main/scala/frontend/IFU.scala 12:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/frontend/IFU.scala 49:25]
  wire [5:0] blockOffset = pcReg[5:0]; // @[src/main/scala/frontend/IFU.scala 53:28]
  wire [6:0] _GEN_1 = {{1'd0}, blockOffset}; // @[src/main/scala/frontend/IFU.scala 54:36]
  wire [6:0] bytesInLine = 7'h40 - _GEN_1; // @[src/main/scala/frontend/IFU.scala 54:36]
  wire [4:0] instsInLine = bytesInLine[6:2]; // @[src/main/scala/frontend/IFU.scala 55:35]
  wire  crossLine = instsInLine < 5'h5; // @[src/main/scala/frontend/IFU.scala 56:35]
  wire [25:0] _seqPC_T_2 = pcReg[31:6] + 26'h1; // @[src/main/scala/frontend/IFU.scala 58:55]
  wire [31:0] _seqPC_T_3 = {_seqPC_T_2,6'h0}; // @[src/main/scala/frontend/IFU.scala 58:30]
  wire [31:0] _seqPC_T_5 = pcReg + 32'h14; // @[src/main/scala/frontend/IFU.scala 59:33]
  wire [31:0] seqPC = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 57:26]
  wire [31:0] _nextPC_T = io_predictResp_taken ? io_predictResp_target : seqPC; // @[src/main/scala/frontend/IFU.scala 80:19]
  wire  _pc_fire_T_1 = ~io_redirect_valid; // @[src/main/scala/frontend/IFU.scala 84:69]
  wire  _pc_fire_T_3 = ~io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 85:17]
  wire  pc_fire = io_icache_req_ready & io_bpuInfoQueuEnq_ready & ~io_redirect_valid & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 84:91]
  wire  pcRegRedirect = io_redirect_valid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 91:44]
  assign io_predictReq_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 63:20]
  assign io_predictFire = io_icache_req_ready & io_bpuInfoQueuEnq_ready & ~io_redirect_valid & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 84:91]
  assign io_icache_req_addr = pcReg; // @[src/main/scala/frontend/IFU.scala 102:23]
  assign io_icache_req_valid = _pc_fire_T_1 & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 103:48]
  assign io_icache_req_flush = io_redirect_valid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 105:48]
  assign io_bpuInfoQueuEnq_valid = io_icache_req_ready & io_bpuInfoQueuEnq_ready & ~io_redirect_valid & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 84:91]
  assign io_bpuInfoQueuEnq_bits_fallThrough = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 57:26]
  assign io_bpuInfoQueuEnq_bits_taken = io_predictResp_taken; // @[src/main/scala/frontend/IFU.scala 108:29 111:31]
  assign io_bpuInfoQueuEnq_bits_target = io_predictResp_target; // @[src/main/scala/frontend/IFU.scala 108:29 112:31]
  assign io_bpuInfoQueuEnq_bits_takenOffset = io_predictResp_takenOffset; // @[src/main/scala/frontend/IFU.scala 108:29 113:31]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/IFU.scala 49:25]
      pcReg <= 32'h1c000000; // @[src/main/scala/frontend/IFU.scala 49:25]
    end else if (pc_fire | pcRegRedirect) begin // @[src/main/scala/frontend/IFU.scala 97:34]
      if (io_redirect_valid) begin // @[src/main/scala/frontend/IFU.scala 78:19]
        pcReg <= 32'h0;
      end else if (io_frontendRedirect_valid) begin // @[src/main/scala/frontend/IFU.scala 79:19]
        pcReg <= io_frontendRedirect_target;
      end else begin
        pcReg <= _nextPC_T;
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
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
