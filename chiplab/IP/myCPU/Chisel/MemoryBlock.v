module MemoryBlock(
  input         clock,
  input         reset,
  input         io_lsEnq_req_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_lsEnq_req_bits_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_lsEnq_req_bits_isLoad, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_lsEnq_req_bits_isStore, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_lsEnq_toLsqData_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_lsEnq_toLsqData_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_lsEnq_toLsqData_ctrl_rfWen, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_lsEnq_lqFull, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_lsEnq_sqFull, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_fromExeResult_0_ready, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_fromExeResult_0_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_fromExeResult_0_bits_uop_ctrl_memRead, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_fromExeResult_0_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_fromExeResult_0_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_fromExeResult_0_bits_uop_isSta, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [31:0] io_fromExeResult_0_bits_data, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_fromExeResult_1_ready, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_fromExeResult_1_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_fromExeResult_1_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_fromExeResult_1_bits_uop_isStd, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [31:0] io_fromExeResult_1_bits_data, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_toWbResult_0_ready, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [31:0] io_toWbResult_0_bits_uop_pc, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_0_bits_uop_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_uop_ctrl_rfWen, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [9:0]  io_toWbResult_0_bits_uop_excpVec, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [6:0]  io_toWbResult_0_bits_uop_pdst, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_uop_rdValid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_0_bits_uop_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_uop_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_0_bits_uop_robIdxFull_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_0_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_0_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [31:0] io_toWbResult_0_bits_data, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_redirect_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_redirect_bits_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_0_bits_redirect_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_0_bits_redirect_bits_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_toWbResult_1_ready, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [31:0] io_toWbResult_1_bits_uop_pc, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_1_bits_uop_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [9:0]  io_toWbResult_1_bits_uop_excpVec, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [6:0]  io_toWbResult_1_bits_uop_pdst, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_1_bits_uop_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_bits_uop_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_1_bits_uop_robIdxFull_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_1_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_toWbResult_1_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_bits_redirect_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_bits_redirect_bits_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [5:0]  io_toWbResult_1_bits_redirect_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_toWbResult_1_bits_redirect_bits_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output        io_mmu_toMmu_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [31:0] io_mmu_toMmu_bits_vaddr, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  output [3:0]  io_mmu_toMmu_bits_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_mmu_fromMmu_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [31:0] io_mmu_fromMmu_bits_paddr, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_mmu_fromMmu_bits_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_robCommit_0_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_robCommit_0_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_robCommit_1_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_robCommit_1_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input         io_robCommit_2_valid, // @[src/main/scala/memory/MemoryBlock.scala 14:14]
  input  [3:0]  io_robCommit_2_sqIdx // @[src/main/scala/memory/MemoryBlock.scala 14:14]
);
  wire  loadQueue_clock; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_reset; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_enq_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [5:0] loadQueue_io_enq_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_enq_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_enq_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [31:0] loadQueue_io_enq_pc; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [6:0] loadQueue_io_enq_pdst; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_enq_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_enq_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_enq_fuType; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_addrWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_addrWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [31:0] loadQueue_io_addrWrite_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [5:0] loadQueue_io_sqOldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_sqOldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_dcacheReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_dcacheReq_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [31:0] loadQueue_io_dcacheReq_bits_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_ready; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [31:0] loadQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [9:0] loadQueue_io_outResult_bits_uop_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [6:0] loadQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_uop_rdValid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [5:0] loadQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [5:0] loadQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [31:0] loadQueue_io_outResult_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_redirect_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire [5:0] loadQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  loadQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 88:26]
  wire  storeQueue_clock; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_reset; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_enq_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [5:0] storeQueue_io_enq_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_enq_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_enq_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_enq_pc; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [6:0] storeQueue_io_enq_pdst; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_enq_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_enq_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_enq_fuType; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_addrWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_addrWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_addrWrite_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_dataWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_dataWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_dataWrite_data; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_mmuReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_mmuReq_bits_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_mmuReq_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_mmuResp_ready; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_mmuResp_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_mmuResp_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_robCommit_0_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_robCommit_0_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_robCommit_1_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_robCommit_1_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_robCommit_2_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_robCommit_2_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_dcacheReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_dcacheReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_dcacheReq_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_dcacheReq_bits_mask; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_ready; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [31:0] storeQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [9:0] storeQueue_io_outResult_bits_uop_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [6:0] storeQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [5:0] storeQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [5:0] storeQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_bits_redirect_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [5:0] storeQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire [5:0] storeQueue_io_oldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_oldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  storeQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 89:26]
  wire  addrFire = io_fromExeResult_0_ready & io_fromExeResult_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  dataFire = io_fromExeResult_1_ready & io_fromExeResult_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  LoadQueue loadQueue ( // @[src/main/scala/memory/MemoryBlock.scala 88:26]
    .clock(loadQueue_clock),
    .reset(loadQueue_reset),
    .io_enq_valid(loadQueue_io_enq_valid),
    .io_enq_robIdx_value(loadQueue_io_enq_robIdx_value),
    .io_enq_robIdx_flag(loadQueue_io_enq_robIdx_flag),
    .io_enq_sqIdx(loadQueue_io_enq_sqIdx),
    .io_enq_pc(loadQueue_io_enq_pc),
    .io_enq_pdst(loadQueue_io_enq_pdst),
    .io_enq_rfWen(loadQueue_io_enq_rfWen),
    .io_enq_lsuOp(loadQueue_io_enq_lsuOp),
    .io_enq_fuType(loadQueue_io_enq_fuType),
    .io_addrWrite_valid(loadQueue_io_addrWrite_valid),
    .io_addrWrite_idx(loadQueue_io_addrWrite_idx),
    .io_addrWrite_vaddr(loadQueue_io_addrWrite_vaddr),
    .io_sqOldestRobIdx_value(loadQueue_io_sqOldestRobIdx_value),
    .io_sqOldestRobIdx_flag(loadQueue_io_sqOldestRobIdx_flag),
    .io_sqEmpty(loadQueue_io_sqEmpty),
    .io_dcacheReq_ready(loadQueue_io_dcacheReq_ready),
    .io_dcacheReq_valid(loadQueue_io_dcacheReq_valid),
    .io_dcacheReq_bits_lqIdx(loadQueue_io_dcacheReq_bits_lqIdx),
    .io_dcacheReq_bits_vaddr(loadQueue_io_dcacheReq_bits_vaddr),
    .io_outResult_ready(loadQueue_io_outResult_ready),
    .io_outResult_valid(loadQueue_io_outResult_valid),
    .io_outResult_bits_uop_pc(loadQueue_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_ctrl_fuType(loadQueue_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_lsuOp(loadQueue_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_rfWen(loadQueue_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_excpVec(loadQueue_io_outResult_bits_uop_excpVec),
    .io_outResult_bits_uop_pdst(loadQueue_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_rdValid(loadQueue_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_robIdx_value(loadQueue_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(loadQueue_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(loadQueue_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(loadQueue_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(loadQueue_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_sqIdx_value(loadQueue_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_data(loadQueue_io_outResult_bits_data),
    .io_outResult_bits_redirect_valid(loadQueue_io_outResult_bits_redirect_valid),
    .io_outResult_bits_redirect_bits_valid(loadQueue_io_outResult_bits_redirect_bits_valid),
    .io_outResult_bits_redirect_bits_robIdx_value(loadQueue_io_outResult_bits_redirect_bits_robIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_flag(loadQueue_io_outResult_bits_redirect_bits_robIdx_flag),
    .io_full(loadQueue_io_full)
  );
  StoreQueue storeQueue ( // @[src/main/scala/memory/MemoryBlock.scala 89:26]
    .clock(storeQueue_clock),
    .reset(storeQueue_reset),
    .io_enq_valid(storeQueue_io_enq_valid),
    .io_enq_robIdx_value(storeQueue_io_enq_robIdx_value),
    .io_enq_robIdx_flag(storeQueue_io_enq_robIdx_flag),
    .io_enq_lqIdx(storeQueue_io_enq_lqIdx),
    .io_enq_pc(storeQueue_io_enq_pc),
    .io_enq_pdst(storeQueue_io_enq_pdst),
    .io_enq_rfWen(storeQueue_io_enq_rfWen),
    .io_enq_lsuOp(storeQueue_io_enq_lsuOp),
    .io_enq_fuType(storeQueue_io_enq_fuType),
    .io_addrWrite_valid(storeQueue_io_addrWrite_valid),
    .io_addrWrite_idx(storeQueue_io_addrWrite_idx),
    .io_addrWrite_vaddr(storeQueue_io_addrWrite_vaddr),
    .io_dataWrite_valid(storeQueue_io_dataWrite_valid),
    .io_dataWrite_idx(storeQueue_io_dataWrite_idx),
    .io_dataWrite_data(storeQueue_io_dataWrite_data),
    .io_mmuReq_valid(storeQueue_io_mmuReq_valid),
    .io_mmuReq_bits_vaddr(storeQueue_io_mmuReq_bits_vaddr),
    .io_mmuReq_bits_sqIdx(storeQueue_io_mmuReq_bits_sqIdx),
    .io_mmuResp_ready(storeQueue_io_mmuResp_ready),
    .io_mmuResp_valid(storeQueue_io_mmuResp_valid),
    .io_mmuResp_bits_paddr(storeQueue_io_mmuResp_bits_paddr),
    .io_mmuResp_bits_sqIdx(storeQueue_io_mmuResp_bits_sqIdx),
    .io_robCommit_0_valid(storeQueue_io_robCommit_0_valid),
    .io_robCommit_0_sqIdx(storeQueue_io_robCommit_0_sqIdx),
    .io_robCommit_1_valid(storeQueue_io_robCommit_1_valid),
    .io_robCommit_1_sqIdx(storeQueue_io_robCommit_1_sqIdx),
    .io_robCommit_2_valid(storeQueue_io_robCommit_2_valid),
    .io_robCommit_2_sqIdx(storeQueue_io_robCommit_2_sqIdx),
    .io_dcacheReq_ready(storeQueue_io_dcacheReq_ready),
    .io_dcacheReq_valid(storeQueue_io_dcacheReq_valid),
    .io_dcacheReq_bits_paddr(storeQueue_io_dcacheReq_bits_paddr),
    .io_dcacheReq_bits_data(storeQueue_io_dcacheReq_bits_data),
    .io_dcacheReq_bits_mask(storeQueue_io_dcacheReq_bits_mask),
    .io_outResult_ready(storeQueue_io_outResult_ready),
    .io_outResult_valid(storeQueue_io_outResult_valid),
    .io_outResult_bits_uop_pc(storeQueue_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_ctrl_fuType(storeQueue_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_lsuOp(storeQueue_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_excpVec(storeQueue_io_outResult_bits_uop_excpVec),
    .io_outResult_bits_uop_pdst(storeQueue_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_robIdx_value(storeQueue_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(storeQueue_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(storeQueue_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(storeQueue_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(storeQueue_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_sqIdx_value(storeQueue_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_redirect_valid(storeQueue_io_outResult_bits_redirect_valid),
    .io_outResult_bits_redirect_bits_valid(storeQueue_io_outResult_bits_redirect_bits_valid),
    .io_outResult_bits_redirect_bits_robIdx_value(storeQueue_io_outResult_bits_redirect_bits_robIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_flag(storeQueue_io_outResult_bits_redirect_bits_robIdx_flag),
    .io_oldestRobIdx_value(storeQueue_io_oldestRobIdx_value),
    .io_oldestRobIdx_flag(storeQueue_io_oldestRobIdx_flag),
    .io_sqEmpty(storeQueue_io_sqEmpty),
    .io_full(storeQueue_io_full)
  );
  assign io_lsEnq_lqFull = loadQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 112:19]
  assign io_lsEnq_sqFull = storeQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 113:19]
  assign io_fromExeResult_0_ready = 1'h1; // @[src/main/scala/memory/MemoryBlock.scala 149:29]
  assign io_fromExeResult_1_ready = 1'h1; // @[src/main/scala/memory/MemoryBlock.scala 150:29]
  assign io_toWbResult_0_valid = loadQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_pc = loadQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_ctrl_fuType = loadQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_ctrl_lsuOp = loadQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_ctrl_rfWen = loadQueue_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_excpVec = loadQueue_io_outResult_bits_uop_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_pdst = loadQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_rdValid = loadQueue_io_outResult_bits_uop_rdValid; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_robIdx_value = loadQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_robIdx_flag = loadQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_robIdxFull_value = loadQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_robIdxFull_flag = loadQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_lqIdx_value = loadQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_uop_sqIdx_value = loadQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_data = loadQueue_io_outResult_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_redirect_valid = loadQueue_io_outResult_bits_redirect_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_redirect_bits_valid = loadQueue_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_redirect_bits_robIdx_value = loadQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_0_bits_redirect_bits_robIdx_flag = loadQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign io_toWbResult_1_valid = storeQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_pc = storeQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_ctrl_fuType = storeQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_ctrl_lsuOp = storeQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_excpVec = storeQueue_io_outResult_bits_uop_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_pdst = storeQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_robIdx_value = storeQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_robIdx_flag = storeQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_robIdxFull_value = storeQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_robIdxFull_flag = storeQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_lqIdx_value = storeQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_uop_sqIdx_value = storeQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_redirect_valid = storeQueue_io_outResult_bits_redirect_valid; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_redirect_bits_valid = storeQueue_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_redirect_bits_robIdx_value = storeQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_toWbResult_1_bits_redirect_bits_robIdx_flag = storeQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
  assign io_mmu_toMmu_valid = storeQueue_io_mmuReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 169:25]
  assign io_mmu_toMmu_bits_vaddr = storeQueue_io_mmuReq_bits_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 169:25]
  assign io_mmu_toMmu_bits_sqIdx = storeQueue_io_mmuReq_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 169:25]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_enq_valid = io_lsEnq_req_valid & io_lsEnq_req_bits_isLoad; // @[src/main/scala/memory/MemoryBlock.scala 94:49]
  assign loadQueue_io_enq_robIdx_value = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 95:27]
  assign loadQueue_io_enq_robIdx_flag = io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 95:27]
  assign loadQueue_io_enq_sqIdx = io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 96:27]
  assign loadQueue_io_enq_pc = io_lsEnq_toLsqData_pc; // @[src/main/scala/memory/MemoryBlock.scala 97:27]
  assign loadQueue_io_enq_pdst = io_lsEnq_toLsqData_pdst; // @[src/main/scala/memory/MemoryBlock.scala 98:27]
  assign loadQueue_io_enq_rfWen = io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 99:27]
  assign loadQueue_io_enq_lsuOp = io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 100:27]
  assign loadQueue_io_enq_fuType = io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 101:27]
  assign loadQueue_io_addrWrite_valid = addrFire & io_fromExeResult_0_bits_uop_ctrl_memRead; // @[src/main/scala/memory/MemoryBlock.scala 135:44]
  assign loadQueue_io_addrWrite_idx = io_fromExeResult_0_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 136:32]
  assign loadQueue_io_addrWrite_vaddr = io_fromExeResult_0_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 137:32]
  assign loadQueue_io_sqOldestRobIdx_value = storeQueue_io_oldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 120:31]
  assign loadQueue_io_sqOldestRobIdx_flag = storeQueue_io_oldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 120:31]
  assign loadQueue_io_sqEmpty = storeQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 121:31]
  assign loadQueue_io_dcacheReq_ready = 1'h0; // @[src/main/scala/memory/MemoryBlock.scala 155:32]
  assign loadQueue_io_outResult_ready = io_toWbResult_0_ready; // @[src/main/scala/memory/MemoryBlock.scala 180:20]
  assign storeQueue_clock = clock;
  assign storeQueue_reset = reset;
  assign storeQueue_io_enq_valid = io_lsEnq_req_valid & io_lsEnq_req_bits_isStore; // @[src/main/scala/memory/MemoryBlock.scala 103:50]
  assign storeQueue_io_enq_robIdx_value = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 104:28]
  assign storeQueue_io_enq_robIdx_flag = io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 104:28]
  assign storeQueue_io_enq_lqIdx = io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 105:28]
  assign storeQueue_io_enq_pc = io_lsEnq_toLsqData_pc; // @[src/main/scala/memory/MemoryBlock.scala 106:28]
  assign storeQueue_io_enq_pdst = io_lsEnq_toLsqData_pdst; // @[src/main/scala/memory/MemoryBlock.scala 107:28]
  assign storeQueue_io_enq_rfWen = io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 108:28]
  assign storeQueue_io_enq_lsuOp = io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 109:28]
  assign storeQueue_io_enq_fuType = io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 110:28]
  assign storeQueue_io_addrWrite_valid = addrFire & io_fromExeResult_0_bits_uop_isSta; // @[src/main/scala/memory/MemoryBlock.scala 140:45]
  assign storeQueue_io_addrWrite_idx = io_fromExeResult_0_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 141:33]
  assign storeQueue_io_addrWrite_vaddr = io_fromExeResult_0_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 142:33]
  assign storeQueue_io_dataWrite_valid = dataFire & io_fromExeResult_1_bits_uop_isStd; // @[src/main/scala/memory/MemoryBlock.scala 145:45]
  assign storeQueue_io_dataWrite_idx = io_fromExeResult_1_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 146:33]
  assign storeQueue_io_dataWrite_data = io_fromExeResult_1_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 147:33]
  assign storeQueue_io_mmuResp_valid = io_mmu_fromMmu_valid; // @[src/main/scala/memory/MemoryBlock.scala 170:25]
  assign storeQueue_io_mmuResp_bits_paddr = io_mmu_fromMmu_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 170:25]
  assign storeQueue_io_mmuResp_bits_sqIdx = io_mmu_fromMmu_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 170:25]
  assign storeQueue_io_robCommit_0_valid = io_robCommit_0_valid; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_robCommit_0_sqIdx = io_robCommit_0_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_robCommit_1_valid = io_robCommit_1_valid; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_robCommit_1_sqIdx = io_robCommit_1_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_robCommit_2_valid = io_robCommit_2_valid; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_robCommit_2_sqIdx = io_robCommit_2_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 175:27]
  assign storeQueue_io_dcacheReq_ready = 1'h1; // @[src/main/scala/memory/MemoryBlock.scala 161:33]
  assign storeQueue_io_outResult_ready = io_toWbResult_1_ready; // @[src/main/scala/memory/MemoryBlock.scala 181:20]
endmodule
