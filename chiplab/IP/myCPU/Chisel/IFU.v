module IFU(
  input         clock,
  input         reset,
  input         io_redirect_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_frontendRedirect_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_frontendRedirect_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_predictReq_nextPC, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_predictReq_pc, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_predictFire, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_taken, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_predictResp_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [1:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_btbHit, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_btbIsJalr, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_btbIsJal, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_btbIsCall, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_btbIsRet, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [1:0]  io_predictResp_meta_btbOffset, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [1:0]  io_predictResp_meta_phtCounter, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [2:0]  io_predictResp_meta_rasTop, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_predictResp_meta_predTaken, // @[src/main/scala/frontend/IFU.scala 12:14]
  input  [31:0] io_predictResp_meta_predTarget, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_icache_req_addr, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_icache_req_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_icache_req_flush, // @[src/main/scala/frontend/IFU.scala 12:14]
  input         io_bpuInfoQueuEnq_ready, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_bpuInfoQueuEnq_valid, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_bpuInfoQueuEnq_bits_fallThrough, // @[src/main/scala/frontend/IFU.scala 12:14]
  output        io_bpuInfoQueuEnq_bits_taken, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [31:0] io_bpuInfoQueuEnq_bits_target, // @[src/main/scala/frontend/IFU.scala 12:14]
  output [1:0]  io_bpuInfoQueuEnq_bits_takenOffset // @[src/main/scala/frontend/IFU.scala 12:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/frontend/IFU.scala 34:25]
  wire [5:0] blockOffset = pcReg[5:0]; // @[src/main/scala/frontend/IFU.scala 40:28]
  wire [6:0] _GEN_1 = {{1'd0}, blockOffset}; // @[src/main/scala/frontend/IFU.scala 41:36]
  wire [6:0] bytesInLine = 7'h40 - _GEN_1; // @[src/main/scala/frontend/IFU.scala 41:36]
  wire [4:0] instsInLine = bytesInLine[6:2]; // @[src/main/scala/frontend/IFU.scala 42:35]
  wire  crossLine = instsInLine < 5'h4; // @[src/main/scala/frontend/IFU.scala 43:35]
  wire [25:0] _seqPC_T_2 = pcReg[31:6] + 26'h1; // @[src/main/scala/frontend/IFU.scala 45:55]
  wire [31:0] _seqPC_T_3 = {_seqPC_T_2,6'h0}; // @[src/main/scala/frontend/IFU.scala 45:30]
  wire [31:0] _seqPC_T_5 = pcReg + 32'h10; // @[src/main/scala/frontend/IFU.scala 46:33]
  wire [31:0] seqPC = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 44:26]
  wire [31:0] _nextPC_T = io_predictResp_taken ? io_predictResp_target : seqPC; // @[src/main/scala/frontend/IFU.scala 64:19]
  wire [31:0] _nextPC_T_1 = io_frontendRedirect_valid ? io_frontendRedirect_target : _nextPC_T; // @[src/main/scala/frontend/IFU.scala 63:19]
  wire  _pc_fire_T_1 = ~io_redirect_valid; // @[src/main/scala/frontend/IFU.scala 70:69]
  wire  _pc_fire_T_3 = ~io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 70:94]
  wire  pc_fire = io_icache_req_ready & io_bpuInfoQueuEnq_ready & ~io_redirect_valid & ~io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 70:91]
  wire  pcRegRedirect = io_redirect_valid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 76:44]
  wire [31:0] currentPredInfo_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 93:29 94:31]
  wire [31:0] currentPredInfo_fallThrough = seqPC; // @[src/main/scala/frontend/IFU.scala 44:26]
  wire  currentPredInfo_taken = io_predictResp_taken; // @[src/main/scala/frontend/IFU.scala 93:29 96:31]
  wire [31:0] currentPredInfo_target = io_predictResp_target; // @[src/main/scala/frontend/IFU.scala 93:29 97:31]
  wire [1:0] currentPredInfo_takenOffset = io_predictResp_takenOffset; // @[src/main/scala/frontend/IFU.scala 93:29 98:31]
  wire  currentPredInfo_meta_btbHit = io_predictResp_meta_btbHit; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire  currentPredInfo_meta_btbIsJalr = io_predictResp_meta_btbIsJalr; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire  currentPredInfo_meta_btbIsJal = io_predictResp_meta_btbIsJal; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire  currentPredInfo_meta_btbIsCall = io_predictResp_meta_btbIsCall; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire  currentPredInfo_meta_btbIsRet = io_predictResp_meta_btbIsRet; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire [1:0] currentPredInfo_meta_btbOffset = io_predictResp_meta_btbOffset; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire [1:0] currentPredInfo_meta_phtCounter = io_predictResp_meta_phtCounter; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire [2:0] currentPredInfo_meta_rasTop = io_predictResp_meta_rasTop; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire  currentPredInfo_meta_predTaken = io_predictResp_meta_predTaken; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  wire [31:0] currentPredInfo_meta_predTarget = io_predictResp_meta_predTarget; // @[src/main/scala/frontend/IFU.scala 93:29 99:31]
  assign io_predictReq_nextPC = io_redirect_valid ? 32'h0 : _nextPC_T_1; // @[src/main/scala/frontend/IFU.scala 62:19]
  assign io_predictReq_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 68:20]
  assign io_predictFire = io_icache_req_ready & io_bpuInfoQueuEnq_ready & ~io_redirect_valid & ~
    io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 70:91]
  assign io_icache_req_addr = pcReg; // @[src/main/scala/frontend/IFU.scala 87:23]
  assign io_icache_req_valid = _pc_fire_T_1 & _pc_fire_T_3; // @[src/main/scala/frontend/IFU.scala 88:48]
  assign io_icache_req_flush = io_redirect_valid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 90:48]
  assign io_bpuInfoQueuEnq_valid = pc_fire & pcReg != 32'h1bfffffc; // @[src/main/scala/frontend/IFU.scala 102:38]
  assign io_bpuInfoQueuEnq_bits_fallThrough = currentPredInfo_fallThrough; // @[src/main/scala/frontend/IFU.scala 103:27]
  assign io_bpuInfoQueuEnq_bits_taken = currentPredInfo_taken; // @[src/main/scala/frontend/IFU.scala 103:27]
  assign io_bpuInfoQueuEnq_bits_target = currentPredInfo_target; // @[src/main/scala/frontend/IFU.scala 103:27]
  assign io_bpuInfoQueuEnq_bits_takenOffset = currentPredInfo_takenOffset; // @[src/main/scala/frontend/IFU.scala 103:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/IFU.scala 34:25]
      pcReg <= 32'h1bfffffc; // @[src/main/scala/frontend/IFU.scala 34:25]
    end else if (pc_fire | pcRegRedirect) begin // @[src/main/scala/frontend/IFU.scala 82:34]
      if (io_redirect_valid) begin // @[src/main/scala/frontend/IFU.scala 62:19]
        pcReg <= 32'h0;
      end else if (io_frontendRedirect_valid) begin // @[src/main/scala/frontend/IFU.scala 63:19]
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
