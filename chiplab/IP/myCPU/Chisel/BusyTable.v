module BusyTable(
  input        clock,
  input        reset,
  input  [5:0] io_readReq_0, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_readReq_1, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_readReq_2, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_readReq_3, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_readReq_4, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_readReq_5, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_0, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_1, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_2, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_3, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_4, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  output       io_readResp_5, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input        io_allocReq_0_valid, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_allocReq_0_bits, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input        io_allocReq_1_valid, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_allocReq_1_bits, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input        io_allocReq_2_valid, // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
  input  [5:0] io_allocReq_2_bits // @[src/main/scala/backend/dispatch/BusyTable.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] table_; // @[src/main/scala/backend/dispatch/BusyTable.scala 29:22]
  wire [63:0] _allocSetMask_T = 64'h1 << io_allocReq_0_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _allocSetMask_T_2 = io_allocReq_0_valid ? _allocSetMask_T : 64'h0; // @[src/main/scala/backend/dispatch/BusyTable.scala 42:8]
  wire [63:0] _allocSetMask_T_3 = 64'h1 << io_allocReq_1_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _allocSetMask_T_5 = io_allocReq_1_valid ? _allocSetMask_T_3 : 64'h0; // @[src/main/scala/backend/dispatch/BusyTable.scala 42:8]
  wire [63:0] _allocSetMask_T_6 = 64'h1 << io_allocReq_2_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _allocSetMask_T_8 = io_allocReq_2_valid ? _allocSetMask_T_6 : 64'h0; // @[src/main/scala/backend/dispatch/BusyTable.scala 42:8]
  wire [63:0] _allocSetMask_T_9 = _allocSetMask_T_2 | _allocSetMask_T_5; // @[src/main/scala/backend/dispatch/BusyTable.scala 43:14]
  wire [63:0] allocSetMask = _allocSetMask_T_9 | _allocSetMask_T_8; // @[src/main/scala/backend/dispatch/BusyTable.scala 43:14]
  wire [63:0] _table_T_2 = table_ | allocSetMask; // @[src/main/scala/backend/dispatch/BusyTable.scala 49:45]
  wire [63:0] _table_T_4 = _table_T_2 & 64'hfffffffffffffffe; // @[src/main/scala/backend/dispatch/BusyTable.scala 49:61]
  wire  allocBypass = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_0 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_0 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_0; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_0_T = table_ >> io_readReq_0; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  wire  allocBypass_1 = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_1 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_1 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_1; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_1_T = table_ >> io_readReq_1; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  wire  allocBypass_2 = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_2 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_2 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_2; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_2_T = table_ >> io_readReq_2; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  wire  allocBypass_3 = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_3 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_3 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_3; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_3_T = table_ >> io_readReq_3; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  wire  allocBypass_4 = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_4 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_4 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_4; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_4_T = table_ >> io_readReq_4; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  wire  allocBypass_5 = io_allocReq_0_valid & io_allocReq_0_bits == io_readReq_5 | io_allocReq_1_valid &
    io_allocReq_1_bits == io_readReq_5 | io_allocReq_2_valid & io_allocReq_2_bits == io_readReq_5; // @[src/main/scala/backend/dispatch/BusyTable.scala 56:90]
  wire [63:0] _io_readResp_5_T = table_ >> io_readReq_5; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:28]
  assign io_readResp_0 = _io_readResp_0_T[0] | allocBypass; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  assign io_readResp_1 = _io_readResp_1_T[0] | allocBypass_1; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  assign io_readResp_2 = _io_readResp_2_T[0] | allocBypass_2; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  assign io_readResp_3 = _io_readResp_3_T[0] | allocBypass_3; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  assign io_readResp_4 = _io_readResp_4_T[0] | allocBypass_4; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  assign io_readResp_5 = _io_readResp_5_T[0] | allocBypass_5; // @[src/main/scala/backend/dispatch/BusyTable.scala 57:44]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/dispatch/BusyTable.scala 29:22]
      table_ <= 64'h0; // @[src/main/scala/backend/dispatch/BusyTable.scala 29:22]
    end else begin
      table_ <= _table_T_4; // @[src/main/scala/backend/dispatch/BusyTable.scala 49:9]
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
  _RAND_0 = {2{`RANDOM}};
  table_ = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
