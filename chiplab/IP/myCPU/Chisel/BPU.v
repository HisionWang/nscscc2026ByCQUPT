module BPU(
  input         clock,
  input         reset,
  input  [31:0] io_predictReq_nextPC, // @[src/main/scala/frontend/BPU.scala 12:14]
  input  [31:0] io_predictReq_pc, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_taken, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [31:0] io_predictResp_target, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [1:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_btbHit, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_btbIsJalr, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_btbIsJal, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_btbIsCall, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_btbIsRet, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [1:0]  io_predictResp_meta_btbOffset, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [1:0]  io_predictResp_meta_phtCounter, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [2:0]  io_predictResp_meta_rasTop, // @[src/main/scala/frontend/BPU.scala 12:14]
  output        io_predictResp_meta_predTaken, // @[src/main/scala/frontend/BPU.scala 12:14]
  output [31:0] io_predictResp_meta_predTarget, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_predictFire, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_update_pd_valid, // @[src/main/scala/frontend/BPU.scala 12:14]
  input  [31:0] io_update_pd_pc, // @[src/main/scala/frontend/BPU.scala 12:14]
  input  [31:0] io_update_pd_target, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_update_pd_isJalr, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_update_pd_isJal, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_update_pd_isCall, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_update_pd_isRet, // @[src/main/scala/frontend/BPU.scala 12:14]
  input         io_rasRestore // @[src/main/scala/frontend/BPU.scala 12:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  btbMem_clock; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire  btbMem_reset; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire  btbMem_io_wr_en; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire [3:0] btbMem_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire [62:0] btbMem_io_wr_data; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire [3:0] btbMem_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire [62:0] btbMem_io_rd_data; // @[src/main/scala/frontend/BPU.scala 36:22]
  wire  phtMem_clock; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire  phtMem_reset; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire  phtMem_io_wr_en; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire [5:0] phtMem_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire [1:0] phtMem_io_wr_data; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire [5:0] phtMem_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 60:22]
  wire [1:0] phtMem_io_rd_data; // @[src/main/scala/frontend/BPU.scala 60:22]
  reg [31:0] rasStack [0:7]; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire  rasStack_rasTarget_MPORT_en; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [2:0] rasStack_rasTarget_MPORT_addr; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [31:0] rasStack_rasTarget_MPORT_data; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [31:0] rasStack_MPORT_data; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [2:0] rasStack_MPORT_addr; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire  rasStack_MPORT_mask; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire  rasStack_MPORT_en; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [31:0] rasStack_MPORT_1_data; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [2:0] rasStack_MPORT_1_addr; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire  rasStack_MPORT_1_mask; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire  rasStack_MPORT_1_en; // @[src/main/scala/frontend/BPU.scala 76:21]
  wire [23:0] btbTag = io_predictReq_pc[31:8]; // @[src/main/scala/frontend/BPU.scala 45:32]
  wire [62:0] _btbEntry_WIRE = btbMem_io_rd_data; // @[src/main/scala/frontend/BPU.scala 52:{44,44}]
  wire [1:0] btbEntry_offset = _btbEntry_WIRE[1:0]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbEntry_isRet = _btbEntry_WIRE[2]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbEntry_isCall = _btbEntry_WIRE[3]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbEntry_isJal = _btbEntry_WIRE[4]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbEntry_isJalr = _btbEntry_WIRE[5]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire [31:0] btbEntry_target = _btbEntry_WIRE[37:6]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire [23:0] btbEntry_tag = _btbEntry_WIRE[61:38]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbEntry_valid = _btbEntry_WIRE[62]; // @[src/main/scala/frontend/BPU.scala 52:44]
  wire  btbHit = btbEntry_valid & btbEntry_tag == btbTag; // @[src/main/scala/frontend/BPU.scala 53:33]
  wire [62:0] btbEntrydebug = {btbEntry_valid,btbEntry_tag,btbEntry_target,btbEntry_isJalr,btbEntry_isJal,
    btbEntry_isCall,btbEntry_isRet,btbEntry_offset}; // @[src/main/scala/frontend/BPU.scala 55:32]
  wire  phtTaken = phtMem_io_rd_data[1]; // @[src/main/scala/frontend/BPU.scala 73:30]
  reg [2:0] rasTop; // @[src/main/scala/frontend/BPU.scala 77:25]
  wire [2:0] _GEN_0 = io_rasRestore ? 3'h0 : rasTop; // @[src/main/scala/frontend/BPU.scala 80:23 81:12 77:25]
  wire  _rasTarget_T = rasTop == 3'h0; // @[src/main/scala/frontend/BPU.scala 94:32]
  wire [2:0] _rasTarget_T_2 = rasTop - 3'h1; // @[src/main/scala/frontend/BPU.scala 94:62]
  wire [31:0] rasTarget = rasTop == 3'h0 ? 32'h0 : rasStack_rasTarget_MPORT_data; // @[src/main/scala/frontend/BPU.scala 94:24]
  wire [31:0] finalTarget = btbEntry_isJalr ? rasTarget : btbEntry_target; // @[src/main/scala/frontend/BPU.scala 95:24]
  wire [3:0] updateIdx = io_update_pd_pc[7:4]; // @[src/main/scala/frontend/BPU.scala 128:33]
  wire [23:0] updateTag = io_update_pd_pc[31:8]; // @[src/main/scala/frontend/BPU.scala 129:33]
  wire [1:0] updateOffset = io_update_pd_pc[3:2]; // @[src/main/scala/frontend/BPU.scala 130:33]
  wire [62:0] _btbMem_io_wr_data_T = {1'h1,updateTag,io_update_pd_target,io_update_pd_isJalr,io_update_pd_isJal,
    io_update_pd_isCall,io_update_pd_isRet,updateOffset}; // @[src/main/scala/frontend/BPU.scala 145:35]
  wire [5:0] updatePhtIdx = io_update_pd_pc[9:4]; // @[src/main/scala/frontend/BPU.scala 149:33]
  wire [2:0] _nextTop_T_2 = rasTop + 3'h1; // @[src/main/scala/frontend/BPU.scala 167:67]
  wire [2:0] nextTop = rasTop == 3'h7 ? 3'h0 : _nextTop_T_2; // @[src/main/scala/frontend/BPU.scala 167:26]
  wire  _T_7 = io_predictFire & btbHit; // @[src/main/scala/frontend/BPU.scala 178:23]
  wire [1:0] _returnAddr_T_1 = btbEntry_offset + 2'h1; // @[src/main/scala/frontend/BPU.scala 180:54]
  wire [4:0] _returnAddr_T_2 = _returnAddr_T_1 * 3'h4; // @[src/main/scala/frontend/BPU.scala 180:61]
  wire [31:0] _GEN_40 = {{27'd0}, _returnAddr_T_2}; // @[src/main/scala/frontend/BPU.scala 180:41]
  SimpleBlockRAM btbMem ( // @[src/main/scala/frontend/BPU.scala 36:22]
    .clock(btbMem_clock),
    .reset(btbMem_reset),
    .io_wr_en(btbMem_io_wr_en),
    .io_wr_addr(btbMem_io_wr_addr),
    .io_wr_data(btbMem_io_wr_data),
    .io_rd_addr(btbMem_io_rd_addr),
    .io_rd_data(btbMem_io_rd_data)
  );
  SimpleBlockRAM_1 phtMem ( // @[src/main/scala/frontend/BPU.scala 60:22]
    .clock(phtMem_clock),
    .reset(phtMem_reset),
    .io_wr_en(phtMem_io_wr_en),
    .io_wr_addr(phtMem_io_wr_addr),
    .io_wr_data(phtMem_io_wr_data),
    .io_rd_addr(phtMem_io_rd_addr),
    .io_rd_data(phtMem_io_rd_data)
  );
  assign rasStack_rasTarget_MPORT_en = 1'h1;
  assign rasStack_rasTarget_MPORT_addr = rasTop - 3'h1;
  assign rasStack_rasTarget_MPORT_data = rasStack[rasStack_rasTarget_MPORT_addr]; // @[src/main/scala/frontend/BPU.scala 76:21]
  assign rasStack_MPORT_data = io_update_pd_pc + 32'h4;
  assign rasStack_MPORT_addr = rasTop;
  assign rasStack_MPORT_mask = 1'h1;
  assign rasStack_MPORT_en = 1'h0;
  assign rasStack_MPORT_1_data = io_predictReq_pc + _GEN_40;
  assign rasStack_MPORT_1_addr = rasTop;
  assign rasStack_MPORT_1_mask = 1'h1;
  assign rasStack_MPORT_1_en = _T_7 & btbEntry_isCall;
  assign io_predictResp_taken = btbHit & (btbEntry_isJalr | btbEntry_isJal | phtTaken); // @[src/main/scala/frontend/BPU.scala 93:28]
  assign io_predictResp_target = btbHit ? finalTarget : 32'h0; // @[src/main/scala/frontend/BPU.scala 99:36]
  assign io_predictResp_takenOffset = btbHit ? btbEntry_offset : 2'h0; // @[src/main/scala/frontend/BPU.scala 100:36]
  assign io_predictResp_meta_btbHit = btbEntry_valid & btbEntry_tag == btbTag; // @[src/main/scala/frontend/BPU.scala 53:33]
  assign io_predictResp_meta_btbIsJalr = _btbEntry_WIRE[5]; // @[src/main/scala/frontend/BPU.scala 52:44]
  assign io_predictResp_meta_btbIsJal = _btbEntry_WIRE[4]; // @[src/main/scala/frontend/BPU.scala 52:44]
  assign io_predictResp_meta_btbIsCall = _btbEntry_WIRE[3]; // @[src/main/scala/frontend/BPU.scala 52:44]
  assign io_predictResp_meta_btbIsRet = _btbEntry_WIRE[2]; // @[src/main/scala/frontend/BPU.scala 52:44]
  assign io_predictResp_meta_btbOffset = _btbEntry_WIRE[1:0]; // @[src/main/scala/frontend/BPU.scala 52:44]
  assign io_predictResp_meta_phtCounter = phtMem_io_rd_data; // @[src/main/scala/frontend/BPU.scala 109:34]
  assign io_predictResp_meta_rasTop = rasTop; // @[src/main/scala/frontend/BPU.scala 110:34]
  assign io_predictResp_meta_predTaken = btbHit & (btbEntry_isJalr | btbEntry_isJal | phtTaken); // @[src/main/scala/frontend/BPU.scala 93:28]
  assign io_predictResp_meta_predTarget = btbHit ? finalTarget : 32'h0; // @[src/main/scala/frontend/BPU.scala 112:40]
  assign btbMem_clock = clock;
  assign btbMem_reset = reset;
  assign btbMem_io_wr_en = io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 115:37]
  assign btbMem_io_wr_addr = io_update_pd_valid ? updateIdx : 4'h0; // @[src/main/scala/frontend/BPU.scala 127:18 120:21 144:23]
  assign btbMem_io_wr_data = io_update_pd_valid ? _btbMem_io_wr_data_T : 63'h0; // @[src/main/scala/frontend/BPU.scala 127:18 121:21 145:23]
  assign btbMem_io_rd_addr = io_predictReq_nextPC[7:4]; // @[src/main/scala/frontend/BPU.scala 44:36]
  assign phtMem_clock = clock;
  assign phtMem_reset = reset;
  assign phtMem_io_wr_en = io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 115:37]
  assign phtMem_io_wr_addr = io_update_pd_valid ? updatePhtIdx : 6'h0; // @[src/main/scala/frontend/BPU.scala 127:18 124:21 160:23]
  assign phtMem_io_wr_data = io_update_pd_valid ? 2'h1 : 2'h0; // @[src/main/scala/frontend/BPU.scala 127:18 125:21 161:23]
  assign phtMem_io_rd_addr = io_predictReq_nextPC[9:4]; // @[src/main/scala/frontend/BPU.scala 66:36]
  always @(posedge clock) begin
    if (rasStack_MPORT_en & rasStack_MPORT_mask) begin
      rasStack[rasStack_MPORT_addr] <= rasStack_MPORT_data; // @[src/main/scala/frontend/BPU.scala 76:21]
    end
    if (rasStack_MPORT_1_en & rasStack_MPORT_1_mask) begin
      rasStack[rasStack_MPORT_1_addr] <= rasStack_MPORT_1_data; // @[src/main/scala/frontend/BPU.scala 76:21]
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 77:25]
      rasTop <= 3'h0; // @[src/main/scala/frontend/BPU.scala 77:25]
    end else if (io_predictFire & btbHit) begin // @[src/main/scala/frontend/BPU.scala 178:34]
      if (btbEntry_isRet) begin // @[src/main/scala/frontend/BPU.scala 185:20]
        if (_rasTarget_T) begin // @[src/main/scala/frontend/BPU.scala 171:26]
          rasTop <= 3'h7;
        end else begin
          rasTop <= _rasTarget_T_2;
        end
      end else if (btbEntry_isCall) begin // @[src/main/scala/frontend/BPU.scala 179:21]
        rasTop <= nextTop; // @[src/main/scala/frontend/BPU.scala 183:14]
      end else begin
        rasTop <= _GEN_0;
      end
    end else begin
      rasTop <= _GEN_0;
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    rasStack[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rasTop = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
