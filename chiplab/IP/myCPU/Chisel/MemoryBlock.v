module MemoryBlock(
  input         clock,
  input         reset,
  input         io_lsEnq_req_valid, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_lsEnq_req_bits_isLoad, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_lsEnq_req_bits_isStore, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  output        io_lsEnq_lqFull, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  output        io_lsEnq_sqFull, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  output        io_fromMemResult_0_ready, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_fromMemResult_0_valid, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_fromMemResult_0_bits_uop_ctrl_memRead, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_lqIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_sqIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_fromMemResult_0_bits_uop_isSta, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [31:0] io_fromMemResult_0_bits_data, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  output        io_fromMemResult_1_ready, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_fromMemResult_1_valid, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [3:0]  io_fromMemResult_1_bits_uop_sqIdx_value, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input         io_fromMemResult_1_bits_uop_isStd, // @[src/main/scala/mem/MemoryBlock.scala 31:14]
  input  [31:0] io_fromMemResult_1_bits_data // @[src/main/scala/mem/MemoryBlock.scala 31:14]
);
  wire  loadQueue_clock; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire  loadQueue_reset; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire  loadQueue_io_enqValid; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [5:0] loadQueue_io_enqRobIdx; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [3:0] loadQueue_io_enqSqIdx; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [31:0] loadQueue_io_enqPc; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [6:0] loadQueue_io_enqPdst; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire  loadQueue_io_addrWriteValid; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [3:0] loadQueue_io_addrWriteIdx; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire [31:0] loadQueue_io_addrWriteVaddr; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire  loadQueue_io_full; // @[src/main/scala/mem/MemoryBlock.scala 87:26]
  wire  storeQueue_clock; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  storeQueue_reset; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  storeQueue_io_enqValid; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [5:0] storeQueue_io_enqRobIdx; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [3:0] storeQueue_io_enqLqIdx; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [31:0] storeQueue_io_enqPc; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  storeQueue_io_addrWriteValid; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [3:0] storeQueue_io_addrWriteIdx; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [31:0] storeQueue_io_addrWriteVaddr; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [3:0] storeQueue_io_addrWriteLsuOp; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  storeQueue_io_dataWriteValid; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [3:0] storeQueue_io_dataWriteIdx; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire [31:0] storeQueue_io_dataWriteData; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  storeQueue_io_full; // @[src/main/scala/mem/MemoryBlock.scala 88:26]
  wire  addrFire = io_fromMemResult_0_ready & io_fromMemResult_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_1 = io_fromMemResult_0_bits_uop_isSta ? io_fromMemResult_0_bits_uop_sqIdx_value : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 146:32 156:32 159:36]
  wire [31:0] _GEN_2 = io_fromMemResult_0_bits_uop_isSta ? io_fromMemResult_0_bits_data : 32'h0; // @[src/main/scala/mem/MemoryBlock.scala 147:32 156:32 160:36]
  wire [3:0] _GEN_3 = io_fromMemResult_0_bits_uop_isSta ? io_fromMemResult_0_bits_uop_ctrl_lsuOp : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 148:32 156:32 161:36]
  wire [3:0] _GEN_5 = io_fromMemResult_0_bits_uop_ctrl_memRead ? io_fromMemResult_0_bits_uop_lqIdx_value : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 142:31 151:32 154:35]
  wire [31:0] _GEN_6 = io_fromMemResult_0_bits_uop_ctrl_memRead ? io_fromMemResult_0_bits_data : 32'h0; // @[src/main/scala/mem/MemoryBlock.scala 143:31 151:32 155:35]
  wire  _GEN_7 = io_fromMemResult_0_bits_uop_ctrl_memRead ? 1'h0 : io_fromMemResult_0_bits_uop_isSta; // @[src/main/scala/mem/MemoryBlock.scala 145:32 151:32]
  wire [3:0] _GEN_8 = io_fromMemResult_0_bits_uop_ctrl_memRead ? 4'h0 : _GEN_1; // @[src/main/scala/mem/MemoryBlock.scala 146:32 151:32]
  wire [31:0] _GEN_9 = io_fromMemResult_0_bits_uop_ctrl_memRead ? 32'h0 : _GEN_2; // @[src/main/scala/mem/MemoryBlock.scala 147:32 151:32]
  wire [3:0] _GEN_10 = io_fromMemResult_0_bits_uop_ctrl_memRead ? 4'h0 : _GEN_3; // @[src/main/scala/mem/MemoryBlock.scala 148:32 151:32]
  wire  dataFire = io_fromMemResult_1_ready & io_fromMemResult_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  LoadQueue loadQueue ( // @[src/main/scala/mem/MemoryBlock.scala 87:26]
    .clock(loadQueue_clock),
    .reset(loadQueue_reset),
    .io_enqValid(loadQueue_io_enqValid),
    .io_enqRobIdx(loadQueue_io_enqRobIdx),
    .io_enqSqIdx(loadQueue_io_enqSqIdx),
    .io_enqPc(loadQueue_io_enqPc),
    .io_enqPdst(loadQueue_io_enqPdst),
    .io_addrWriteValid(loadQueue_io_addrWriteValid),
    .io_addrWriteIdx(loadQueue_io_addrWriteIdx),
    .io_addrWriteVaddr(loadQueue_io_addrWriteVaddr),
    .io_full(loadQueue_io_full)
  );
  StoreQueue storeQueue ( // @[src/main/scala/mem/MemoryBlock.scala 88:26]
    .clock(storeQueue_clock),
    .reset(storeQueue_reset),
    .io_enqValid(storeQueue_io_enqValid),
    .io_enqRobIdx(storeQueue_io_enqRobIdx),
    .io_enqLqIdx(storeQueue_io_enqLqIdx),
    .io_enqPc(storeQueue_io_enqPc),
    .io_addrWriteValid(storeQueue_io_addrWriteValid),
    .io_addrWriteIdx(storeQueue_io_addrWriteIdx),
    .io_addrWriteVaddr(storeQueue_io_addrWriteVaddr),
    .io_addrWriteLsuOp(storeQueue_io_addrWriteLsuOp),
    .io_dataWriteValid(storeQueue_io_dataWriteValid),
    .io_dataWriteIdx(storeQueue_io_dataWriteIdx),
    .io_dataWriteData(storeQueue_io_dataWriteData),
    .io_full(storeQueue_io_full)
  );
  assign io_lsEnq_lqFull = loadQueue_io_full; // @[src/main/scala/mem/MemoryBlock.scala 116:19]
  assign io_lsEnq_sqFull = storeQueue_io_full; // @[src/main/scala/mem/MemoryBlock.scala 117:19]
  assign io_fromMemResult_0_ready = 1'h1; // @[src/main/scala/mem/MemoryBlock.scala 181:29]
  assign io_fromMemResult_1_ready = 1'h1; // @[src/main/scala/mem/MemoryBlock.scala 182:29]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_enqValid = io_lsEnq_req_valid & io_lsEnq_req_bits_isLoad; // @[src/main/scala/mem/MemoryBlock.scala 102:48]
  assign loadQueue_io_enqRobIdx = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/mem/MemoryBlock.scala 103:26]
  assign loadQueue_io_enqSqIdx = io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/mem/MemoryBlock.scala 104:26]
  assign loadQueue_io_enqPc = io_lsEnq_toLsqData_pc; // @[src/main/scala/mem/MemoryBlock.scala 105:26]
  assign loadQueue_io_enqPdst = io_lsEnq_toLsqData_pdst; // @[src/main/scala/mem/MemoryBlock.scala 106:26]
  assign loadQueue_io_addrWriteValid = addrFire & io_fromMemResult_0_bits_uop_ctrl_memRead; // @[src/main/scala/mem/MemoryBlock.scala 150:18 141:31]
  assign loadQueue_io_addrWriteIdx = addrFire ? _GEN_5 : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 150:18 142:31]
  assign loadQueue_io_addrWriteVaddr = addrFire ? _GEN_6 : 32'h0; // @[src/main/scala/mem/MemoryBlock.scala 150:18 143:31]
  assign storeQueue_clock = clock;
  assign storeQueue_reset = reset;
  assign storeQueue_io_enqValid = io_lsEnq_req_valid & io_lsEnq_req_bits_isStore; // @[src/main/scala/mem/MemoryBlock.scala 109:49]
  assign storeQueue_io_enqRobIdx = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/mem/MemoryBlock.scala 110:27]
  assign storeQueue_io_enqLqIdx = io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/mem/MemoryBlock.scala 111:27]
  assign storeQueue_io_enqPc = io_lsEnq_toLsqData_pc; // @[src/main/scala/mem/MemoryBlock.scala 112:27]
  assign storeQueue_io_addrWriteValid = addrFire & _GEN_7; // @[src/main/scala/mem/MemoryBlock.scala 150:18 145:32]
  assign storeQueue_io_addrWriteIdx = addrFire ? _GEN_8 : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 150:18 146:32]
  assign storeQueue_io_addrWriteVaddr = addrFire ? _GEN_9 : 32'h0; // @[src/main/scala/mem/MemoryBlock.scala 150:18 147:32]
  assign storeQueue_io_addrWriteLsuOp = addrFire ? _GEN_10 : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 150:18 148:32]
  assign storeQueue_io_dataWriteValid = dataFire & io_fromMemResult_1_bits_uop_isStd; // @[src/main/scala/mem/MemoryBlock.scala 174:17]
  assign storeQueue_io_dataWriteIdx = dataFire & io_fromMemResult_1_bits_uop_isStd ?
    io_fromMemResult_1_bits_uop_sqIdx_value : 4'h0; // @[src/main/scala/mem/MemoryBlock.scala 171:32 174:35 176:34]
  assign storeQueue_io_dataWriteData = dataFire & io_fromMemResult_1_bits_uop_isStd ? io_fromMemResult_1_bits_data : 32'h0
    ; // @[src/main/scala/mem/MemoryBlock.scala 172:32 174:35 177:34]
endmodule
