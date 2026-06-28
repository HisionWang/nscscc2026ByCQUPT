module MemAddrTrans(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_bits_uop_ctrl_memRead, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [3:0]  io_in_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [3:0]  io_in_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_bits_uop_isSta, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [31:0] io_in_bits_data, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_exeRes_uop_ctrl_memRead, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [3:0]  io_out_bits_exeRes_uop_lqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [3:0]  io_out_bits_exeRes_uop_sqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_exeRes_uop_isSta, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_out_bits_exeRes_data, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_out_bits_mmuRes_paddr, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_mmuReq_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_mmuReq_bits_vaddr, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [31:0] io_mmuResp_bits_paddr // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  s1_valid; // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
  reg  s1_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 29:21]
  reg [3:0] s1_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 29:21]
  reg [3:0] s1_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 29:21]
  reg  s1_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 29:21]
  reg [31:0] s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 29:21]
  reg  s2_valid; // @[src/main/scala/memory/MemAddrTrans.scala 60:28]
  reg  s2_mmu_done; // @[src/main/scala/memory/MemAddrTrans.scala 65:28]
  wire  _s2_fire_T = s2_mmu_done | io_mmuResp_valid; // @[src/main/scala/memory/MemAddrTrans.scala 69:42]
  wire  s2_fire = s2_valid & (s2_mmu_done | io_mmuResp_valid); // @[src/main/scala/memory/MemAddrTrans.scala 69:26]
  wire  s2_ready = ~s2_valid | s2_fire; // @[src/main/scala/memory/MemAddrTrans.scala 72:25]
  wire  s1_fire = s1_valid & s2_ready; // @[src/main/scala/memory/MemAddrTrans.scala 35:45]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_0 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/memory/MemAddrTrans.scala 46:23 47:14 28:25]
  wire  _GEN_1 = _T | _GEN_0; // @[src/main/scala/memory/MemAddrTrans.scala 43:26 44:14]
  reg  s2_exe_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 61:24]
  reg [3:0] s2_exe_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 61:24]
  reg [3:0] s2_exe_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 61:24]
  reg  s2_exe_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 61:24]
  reg [31:0] s2_exe_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 61:24]
  reg [31:0] s2_mmu_resp_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 66:24]
  wire  _GEN_176 = s1_fire | s2_valid; // @[src/main/scala/memory/MemAddrTrans.scala 90:19 91:19 60:28]
  wire  _GEN_177 = s1_fire ? 1'h0 : s2_mmu_done; // @[src/main/scala/memory/MemAddrTrans.scala 90:19 93:19 65:28]
  wire  _GEN_178 = s2_valid & ~s2_mmu_done & io_mmuResp_valid | _GEN_177; // @[src/main/scala/memory/MemAddrTrans.scala 98:56 99:19]
  assign io_in_ready = ~s1_valid | s1_fire; // @[src/main/scala/memory/MemAddrTrans.scala 38:28]
  assign io_out_valid = s2_valid & _s2_fire_T; // @[src/main/scala/memory/MemAddrTrans.scala 110:28]
  assign io_out_bits_exeRes_uop_ctrl_memRead = s2_exe_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 111:22]
  assign io_out_bits_exeRes_uop_lqIdx_value = s2_exe_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 111:22]
  assign io_out_bits_exeRes_uop_sqIdx_value = s2_exe_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 111:22]
  assign io_out_bits_exeRes_uop_isSta = s2_exe_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 111:22]
  assign io_out_bits_exeRes_data = s2_exe_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 111:22]
  assign io_out_bits_mmuRes_paddr = s2_mmu_done ? s2_mmu_resp_paddr : io_mmuResp_bits_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 115:28]
  assign io_mmuReq_valid = s1_valid & s2_ready; // @[src/main/scala/memory/MemAddrTrans.scala 51:36]
  assign io_mmuReq_bits_vaddr = s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 52:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
      s1_valid <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
    end else begin
      s1_valid <= _GEN_1;
    end
    if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_ctrl_memRead <= io_in_bits_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_isSta <= io_in_bits_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_data <= io_in_bits_data; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 60:28]
      s2_valid <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 60:28]
    end else if (s2_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 78:23]
      s2_valid <= s1_fire;
    end else begin
      s2_valid <= _GEN_176;
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 65:28]
      s2_mmu_done <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 65:28]
    end else if (s2_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 78:23]
      s2_mmu_done <= 1'h0;
    end else begin
      s2_mmu_done <= _GEN_178;
    end
    if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:19]
      s2_exe_data_uop_ctrl_memRead <= s1_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
    end
    if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:19]
      s2_exe_data_uop_lqIdx_value <= s1_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
    end
    if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:19]
      s2_exe_data_uop_sqIdx_value <= s1_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
    end
    if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:19]
      s2_exe_data_uop_isSta <= s1_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
    end
    if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:19]
      s2_exe_data_data <= s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
    end
    if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 78:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 98:56]
        s2_mmu_resp_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 100:19]
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_data_uop_ctrl_memRead = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_data_uop_lqIdx_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  s1_data_uop_sqIdx_value = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_data_uop_isSta = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_data_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s2_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_mmu_done = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_exe_data_uop_ctrl_memRead = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_exe_data_uop_lqIdx_value = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  s2_exe_data_uop_sqIdx_value = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  s2_exe_data_uop_isSta = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_exe_data_data = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s2_mmu_resp_paddr = _RAND_13[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
