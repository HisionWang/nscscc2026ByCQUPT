module Writeback(
  input         clock,
  input         reset,
  output        io_InExeResults_0_ready, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_0_bits_uop_pc, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_0_bits_uop_inst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_0_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [9:0]  io_InExeResults_0_bits_uop_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_0_bits_uop_imm, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [13:0] io_InExeResults_0_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_0_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_0_bits_uop_ldst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_0_bits_uop_lrs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_0_bits_uop_lrs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_0_bits_uop_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_0_bits_uop_prs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_0_bits_uop_prs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_0_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_rdValid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [5:0]  io_InExeResults_0_bits_uop_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_0_bits_uop_robIdxFull, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_lqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_0_bits_uop_sqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_0_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_0_bits_uop_isSta, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_0_bits_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_InExeResults_1_ready, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_1_bits_uop_pc, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_1_bits_uop_inst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_1_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [9:0]  io_InExeResults_1_bits_uop_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_1_bits_uop_imm, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [13:0] io_InExeResults_1_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_1_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_1_bits_uop_ldst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_1_bits_uop_lrs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_1_bits_uop_lrs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_1_bits_uop_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_1_bits_uop_prs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_1_bits_uop_prs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_1_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_rdValid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [5:0]  io_InExeResults_1_bits_uop_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_1_bits_uop_robIdxFull, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_lqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_1_bits_uop_sqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_1_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_1_bits_uop_isSta, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_1_bits_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_InExeResults_2_ready, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_2_bits_uop_pc, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_2_bits_uop_inst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_2_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [9:0]  io_InExeResults_2_bits_uop_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_2_bits_uop_imm, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [13:0] io_InExeResults_2_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_2_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_2_bits_uop_ldst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_2_bits_uop_lrs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [4:0]  io_InExeResults_2_bits_uop_lrs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_2_bits_uop_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_2_bits_uop_prs1, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_2_bits_uop_prs2, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_2_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_rdValid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [5:0]  io_InExeResults_2_bits_uop_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [6:0]  io_InExeResults_2_bits_uop_robIdxFull, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_lqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [3:0]  io_InExeResults_2_bits_uop_sqIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [2:0]  io_InExeResults_2_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_uop_isSta, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [31:0] io_InExeResults_2_bits_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input         io_InExeResults_2_bits_redirect_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  input  [5:0]  io_InExeResults_2_bits_redirect_bits_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_rfWritePorts_0_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_rfWritePorts_0_addr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_rfWritePorts_0_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_rfWritePorts_1_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_rfWritePorts_1_addr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_rfWritePorts_1_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_rfWritePorts_2_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_rfWritePorts_2_addr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_rfWritePorts_2_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_rfWritePorts_3_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_rfWritePorts_3_addr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_rfWritePorts_3_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_rfWritePorts_4_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_rfWritePorts_4_addr, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_rfWritePorts_4_data, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_wakeupPorts_0_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_wakeupPorts_1_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_wakeupPorts_2_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [6:0]  io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_0_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [5:0]  io_toRObResults_0_bits_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_toRObResults_0_bits_rfdata, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [9:0]  io_toRObResults_0_bits_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_0_bits_isBypass, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_1_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [5:0]  io_toRObResults_1_bits_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_toRObResults_1_bits_rfdata, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [9:0]  io_toRObResults_1_bits_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_1_bits_isBypass, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_2_valid, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [5:0]  io_toRObResults_2_bits_robIdx, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [31:0] io_toRObResults_2_bits_rfdata, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output [9:0]  io_toRObResults_2_bits_excpVec, // @[src/main/scala/backend/execute/Writeback.scala 28:14]
  output        io_toRObResults_2_bits_isBypass // @[src/main/scala/backend/execute/Writeback.scala 28:14]
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
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
`endif // RANDOMIZE_REG_INIT
  reg  stgValid_0; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
  reg  stgValid_1; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
  reg  stgValid_2; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
  reg [31:0] stgData_0_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_0_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_0_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [9:0] stgData_0_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_0_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [13:0] stgData_0_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_0_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_0_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_0_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_0_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_0_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_0_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_0_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_0_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_0_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_0_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_0_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_0_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_uop_isStd; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_0_data; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_redirect_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_0_redirect_bits_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_0_redirect_bits_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_1_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_1_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_1_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [9:0] stgData_1_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_1_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [13:0] stgData_1_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_1_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_1_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_1_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_1_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_1_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_1_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_1_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_1_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_1_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_1_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_1_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_1_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_uop_isStd; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_1_data; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_redirect_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_1_redirect_bits_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_1_redirect_bits_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_2_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_2_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_2_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [9:0] stgData_2_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_2_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [13:0] stgData_2_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_2_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_2_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_2_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [4:0] stgData_2_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_2_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_2_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_2_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_2_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_2_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [6:0] stgData_2_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [3:0] stgData_2_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [2:0] stgData_2_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_uop_isStd; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [31:0] stgData_2_data; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_redirect_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg  stgData_2_redirect_bits_valid; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  reg [5:0] stgData_2_redirect_bits_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 55:21]
  wire  stgReady = ~stgValid_0 | stgValid_0; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  wire  inFire = io_InExeResults_0_valid & stgReady; // @[src/main/scala/backend/execute/Writeback.scala 65:43]
  wire  _GEN_0 = stgValid_0 ? 1'h0 : stgValid_0; // @[src/main/scala/backend/execute/Writeback.scala 76:25 77:19 54:25]
  wire  _GEN_1 = inFire | _GEN_0; // @[src/main/scala/backend/execute/Writeback.scala 73:24 74:19]
  wire  stgReady_1 = ~stgValid_1 | stgValid_1; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  wire  inFire_1 = io_InExeResults_1_valid & stgReady_1; // @[src/main/scala/backend/execute/Writeback.scala 65:43]
  wire  _GEN_107 = stgValid_1 ? 1'h0 : stgValid_1; // @[src/main/scala/backend/execute/Writeback.scala 76:25 77:19 54:25]
  wire  _GEN_108 = inFire_1 | _GEN_107; // @[src/main/scala/backend/execute/Writeback.scala 73:24 74:19]
  wire  stgReady_2 = ~stgValid_2 | stgValid_2; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  wire  inFire_2 = io_InExeResults_2_valid & stgReady_2; // @[src/main/scala/backend/execute/Writeback.scala 65:43]
  wire  _GEN_214 = stgValid_2 ? 1'h0 : stgValid_2; // @[src/main/scala/backend/execute/Writeback.scala 76:25 77:19 54:25]
  wire  _GEN_215 = inFire_2 | _GEN_214; // @[src/main/scala/backend/execute/Writeback.scala 73:24 74:19]
  assign io_InExeResults_0_ready = ~stgValid_0 | stgValid_0; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  assign io_InExeResults_1_ready = ~stgValid_1 | stgValid_1; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  assign io_InExeResults_2_ready = ~stgValid_2 | stgValid_2; // @[src/main/scala/backend/execute/Writeback.scala 63:33]
  assign io_rfWritePorts_0_valid = stgValid_0 & stgData_0_uop_ctrl_rfWen & stgData_0_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_rfWritePorts_0_addr = stgData_0_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 96:30]
  assign io_rfWritePorts_0_data = stgData_0_data; // @[src/main/scala/backend/execute/Writeback.scala 97:30]
  assign io_rfWritePorts_1_valid = stgValid_1 & stgData_1_uop_ctrl_rfWen & stgData_1_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_rfWritePorts_1_addr = stgData_1_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 96:30]
  assign io_rfWritePorts_1_data = stgData_1_data; // @[src/main/scala/backend/execute/Writeback.scala 97:30]
  assign io_rfWritePorts_2_valid = stgValid_2 & stgData_2_uop_ctrl_rfWen & stgData_2_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_rfWritePorts_2_addr = stgData_2_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 96:30]
  assign io_rfWritePorts_2_data = stgData_2_data; // @[src/main/scala/backend/execute/Writeback.scala 97:30]
  assign io_rfWritePorts_3_valid = 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 114:30]
  assign io_rfWritePorts_3_addr = 7'h0; // @[src/main/scala/backend/execute/Writeback.scala 115:30]
  assign io_rfWritePorts_3_data = 32'h0; // @[src/main/scala/backend/execute/Writeback.scala 116:30]
  assign io_rfWritePorts_4_valid = 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 114:30]
  assign io_rfWritePorts_4_addr = 7'h0; // @[src/main/scala/backend/execute/Writeback.scala 115:30]
  assign io_rfWritePorts_4_data = 32'h0; // @[src/main/scala/backend/execute/Writeback.scala 116:30]
  assign io_wakeupPorts_0_valid = stgValid_0 & stgData_0_uop_ctrl_rfWen & stgData_0_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_wakeupPorts_0_bits_pdst = stgData_0_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 101:33]
  assign io_wakeupPorts_1_valid = stgValid_1 & stgData_1_uop_ctrl_rfWen & stgData_1_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_wakeupPorts_1_bits_pdst = stgData_1_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 101:33]
  assign io_wakeupPorts_2_valid = stgValid_2 & stgData_2_uop_ctrl_rfWen & stgData_2_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 92:49]
  assign io_wakeupPorts_2_bits_pdst = stgData_2_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 101:33]
  assign io_toRObResults_0_valid = stgValid_0; // @[src/main/scala/backend/execute/Writeback.scala 104:30]
  assign io_toRObResults_0_bits_robIdx = stgData_0_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 107:38]
  assign io_toRObResults_0_bits_rfdata = stgData_0_data; // @[src/main/scala/backend/execute/Writeback.scala 108:38]
  assign io_toRObResults_0_bits_excpVec = 10'h0; // @[src/main/scala/backend/execute/Writeback.scala 105:38]
  assign io_toRObResults_0_bits_isBypass = 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 106:39]
  assign io_toRObResults_1_valid = stgValid_1; // @[src/main/scala/backend/execute/Writeback.scala 104:30]
  assign io_toRObResults_1_bits_robIdx = stgData_1_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 107:38]
  assign io_toRObResults_1_bits_rfdata = stgData_1_data; // @[src/main/scala/backend/execute/Writeback.scala 108:38]
  assign io_toRObResults_1_bits_excpVec = 10'h0; // @[src/main/scala/backend/execute/Writeback.scala 105:38]
  assign io_toRObResults_1_bits_isBypass = 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 106:39]
  assign io_toRObResults_2_valid = stgValid_2; // @[src/main/scala/backend/execute/Writeback.scala 104:30]
  assign io_toRObResults_2_bits_robIdx = stgData_2_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 107:38]
  assign io_toRObResults_2_bits_rfdata = stgData_2_data; // @[src/main/scala/backend/execute/Writeback.scala 108:38]
  assign io_toRObResults_2_bits_excpVec = 10'h0; // @[src/main/scala/backend/execute/Writeback.scala 105:38]
  assign io_toRObResults_2_bits_isBypass = 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 106:39]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/execute/Writeback.scala 54:25]
      stgValid_0 <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
    end else begin
      stgValid_0 <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Writeback.scala 54:25]
      stgValid_1 <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
    end else begin
      stgValid_1 <= _GEN_108;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Writeback.scala 54:25]
      stgValid_2 <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 54:25]
    end else begin
      stgValid_2 <= _GEN_215;
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pc <= io_InExeResults_0_bits_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_inst <= io_InExeResults_0_bits_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_fuType <= io_InExeResults_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_aluOp <= io_InExeResults_0_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_bruOp <= io_InExeResults_0_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_lsuOp <= io_InExeResults_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_csrOp <= io_InExeResults_0_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_mulOp <= io_InExeResults_0_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_divOp <= io_InExeResults_0_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_src1Type <= io_InExeResults_0_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_src2Type <= io_InExeResults_0_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_immType <= io_InExeResults_0_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_rfWen <= io_InExeResults_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_memRead <= io_InExeResults_0_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_memWrite <= io_InExeResults_0_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_csrWen <= io_InExeResults_0_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_isBranch <= io_InExeResults_0_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_isJump <= io_InExeResults_0_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ctrl_isPriv <= io_InExeResults_0_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_excpVec <= io_InExeResults_0_bits_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_imm <= io_InExeResults_0_bits_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_csrAddress <= io_InExeResults_0_bits_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_valid <= io_InExeResults_0_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_isBr <= io_InExeResults_0_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_isJal <= io_InExeResults_0_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_isJalr <= io_InExeResults_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_isCall <= io_InExeResults_0_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_isRet <= io_InExeResults_0_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdInfo_jumpTarget <= io_InExeResults_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_ldst <= io_InExeResults_0_bits_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_lrs1 <= io_InExeResults_0_bits_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_lrs2 <= io_InExeResults_0_bits_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_pdst <= io_InExeResults_0_bits_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_prs1 <= io_InExeResults_0_bits_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_prs2 <= io_InExeResults_0_bits_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_oldPdst <= io_InExeResults_0_bits_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_rs1Valid <= io_InExeResults_0_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_rs2Valid <= io_InExeResults_0_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_rdValid <= io_InExeResults_0_bits_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_robIdx <= io_InExeResults_0_bits_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_robIdxFull <= io_InExeResults_0_bits_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_lqIdx <= io_InExeResults_0_bits_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_sqIdx <= io_InExeResults_0_bits_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_issueQueue <= io_InExeResults_0_bits_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_prs1Busy <= io_InExeResults_0_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_prs2Busy <= io_InExeResults_0_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_isSta <= io_InExeResults_0_bits_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_data <= io_InExeResults_0_bits_data; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_redirect_valid <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_redirect_bits_valid <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_0_redirect_bits_robIdx <= 6'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pc <= io_InExeResults_1_bits_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_inst <= io_InExeResults_1_bits_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_fuType <= io_InExeResults_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_aluOp <= io_InExeResults_1_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_bruOp <= io_InExeResults_1_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_lsuOp <= io_InExeResults_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_csrOp <= io_InExeResults_1_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_mulOp <= io_InExeResults_1_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_divOp <= io_InExeResults_1_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_src1Type <= io_InExeResults_1_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_src2Type <= io_InExeResults_1_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_immType <= io_InExeResults_1_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_rfWen <= io_InExeResults_1_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_memRead <= io_InExeResults_1_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_memWrite <= io_InExeResults_1_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_csrWen <= io_InExeResults_1_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_isBranch <= io_InExeResults_1_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_isJump <= io_InExeResults_1_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ctrl_isPriv <= io_InExeResults_1_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_excpVec <= io_InExeResults_1_bits_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_imm <= io_InExeResults_1_bits_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_csrAddress <= io_InExeResults_1_bits_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_valid <= io_InExeResults_1_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_isBr <= io_InExeResults_1_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_isJal <= io_InExeResults_1_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_isJalr <= io_InExeResults_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_isCall <= io_InExeResults_1_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_isRet <= io_InExeResults_1_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdInfo_jumpTarget <= io_InExeResults_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_ldst <= io_InExeResults_1_bits_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_lrs1 <= io_InExeResults_1_bits_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_lrs2 <= io_InExeResults_1_bits_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_pdst <= io_InExeResults_1_bits_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_prs1 <= io_InExeResults_1_bits_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_prs2 <= io_InExeResults_1_bits_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_oldPdst <= io_InExeResults_1_bits_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_rs1Valid <= io_InExeResults_1_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_rs2Valid <= io_InExeResults_1_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_rdValid <= io_InExeResults_1_bits_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_robIdx <= io_InExeResults_1_bits_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_robIdxFull <= io_InExeResults_1_bits_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_lqIdx <= io_InExeResults_1_bits_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_sqIdx <= io_InExeResults_1_bits_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_issueQueue <= io_InExeResults_1_bits_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_prs1Busy <= io_InExeResults_1_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_prs2Busy <= io_InExeResults_1_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_isSta <= io_InExeResults_1_bits_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_data <= io_InExeResults_1_bits_data; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_redirect_valid <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_redirect_bits_valid <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_1) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_1_redirect_bits_robIdx <= 6'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pc <= io_InExeResults_2_bits_uop_pc; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_inst <= io_InExeResults_2_bits_uop_inst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_fuType <= io_InExeResults_2_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_aluOp <= io_InExeResults_2_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_bruOp <= io_InExeResults_2_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_lsuOp <= io_InExeResults_2_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_csrOp <= io_InExeResults_2_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_mulOp <= io_InExeResults_2_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_divOp <= io_InExeResults_2_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_src1Type <= io_InExeResults_2_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_src2Type <= io_InExeResults_2_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_immType <= io_InExeResults_2_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_rfWen <= io_InExeResults_2_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_memRead <= io_InExeResults_2_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_memWrite <= io_InExeResults_2_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_csrWen <= io_InExeResults_2_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_isBranch <= io_InExeResults_2_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_isJump <= io_InExeResults_2_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ctrl_isPriv <= io_InExeResults_2_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_excpVec <= io_InExeResults_2_bits_uop_excpVec; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_imm <= io_InExeResults_2_bits_uop_imm; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_csrAddress <= io_InExeResults_2_bits_uop_csrAddress; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_valid <= io_InExeResults_2_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_isBr <= io_InExeResults_2_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_isJal <= io_InExeResults_2_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_isJalr <= io_InExeResults_2_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_isCall <= io_InExeResults_2_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_isRet <= io_InExeResults_2_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdInfo_jumpTarget <= io_InExeResults_2_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_ldst <= io_InExeResults_2_bits_uop_ldst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_lrs1 <= io_InExeResults_2_bits_uop_lrs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_lrs2 <= io_InExeResults_2_bits_uop_lrs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_pdst <= io_InExeResults_2_bits_uop_pdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_prs1 <= io_InExeResults_2_bits_uop_prs1; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_prs2 <= io_InExeResults_2_bits_uop_prs2; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_oldPdst <= io_InExeResults_2_bits_uop_oldPdst; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_rs1Valid <= io_InExeResults_2_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_rs2Valid <= io_InExeResults_2_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_rdValid <= io_InExeResults_2_bits_uop_rdValid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_robIdx <= io_InExeResults_2_bits_uop_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_robIdxFull <= io_InExeResults_2_bits_uop_robIdxFull; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_lqIdx <= io_InExeResults_2_bits_uop_lqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_sqIdx <= io_InExeResults_2_bits_uop_sqIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_issueQueue <= io_InExeResults_2_bits_uop_issueQueue; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_prs1Busy <= io_InExeResults_2_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_prs2Busy <= io_InExeResults_2_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_isSta <= io_InExeResults_2_bits_uop_isSta; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_data <= io_InExeResults_2_bits_data; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_redirect_valid <= io_InExeResults_2_bits_redirect_valid; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
    end
    stgData_2_redirect_bits_valid <= inFire_2 | stgData_2_redirect_bits_valid; // @[src/main/scala/backend/execute/Writeback.scala 73:24 75:19 55:21]
    if (inFire_2) begin // @[src/main/scala/backend/execute/Writeback.scala 73:24]
      stgData_2_redirect_bits_robIdx <= io_InExeResults_2_bits_redirect_bits_robIdx; // @[src/main/scala/backend/execute/Writeback.scala 75:19]
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
  stgValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stgValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stgValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  stgData_0_uop_pc = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stgData_0_uop_inst = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stgData_0_uop_ctrl_fuType = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  stgData_0_uop_ctrl_aluOp = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_uop_ctrl_bruOp = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_uop_ctrl_lsuOp = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_uop_ctrl_csrOp = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_uop_ctrl_mulOp = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_uop_ctrl_divOp = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_uop_ctrl_src1Type = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_uop_ctrl_src2Type = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_uop_ctrl_immType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_uop_ctrl_rfWen = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_uop_ctrl_memRead = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_uop_ctrl_memWrite = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_uop_ctrl_csrWen = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_uop_ctrl_isBranch = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_uop_ctrl_isJump = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_uop_ctrl_isPriv = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_uop_excpVec = _RAND_22[9:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_uop_imm = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_uop_csrAddress = _RAND_24[13:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_isBr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_isJal = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_isJalr = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_isCall = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_isRet = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_uop_pdInfo_jumpTarget = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_uop_ldst = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_uop_lrs1 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_uop_lrs2 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_uop_pdst = _RAND_35[6:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_uop_prs1 = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_uop_prs2 = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_uop_oldPdst = _RAND_38[6:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_uop_rs1Valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_uop_rs2Valid = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_uop_rdValid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_uop_robIdx = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_0_uop_robIdxFull = _RAND_43[6:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_0_uop_lqIdx = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_0_uop_sqIdx = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_0_uop_issueQueue = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_0_uop_prs1Busy = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_0_uop_prs2Busy = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_0_uop_isSta = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_0_uop_isStd = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_0_data = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_0_redirect_valid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_0_redirect_bits_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_0_redirect_bits_robIdx = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_uop_pc = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_uop_inst = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_uop_ctrl_fuType = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_uop_ctrl_aluOp = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_uop_ctrl_bruOp = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_uop_ctrl_lsuOp = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_uop_ctrl_csrOp = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_uop_ctrl_mulOp = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_uop_ctrl_divOp = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_uop_ctrl_src1Type = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_uop_ctrl_src2Type = _RAND_65[2:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_uop_ctrl_immType = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_uop_ctrl_rfWen = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_uop_ctrl_memRead = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_uop_ctrl_memWrite = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_uop_ctrl_csrWen = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_uop_ctrl_isBranch = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_uop_ctrl_isJump = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_uop_ctrl_isPriv = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_uop_excpVec = _RAND_74[9:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_uop_imm = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_uop_csrAddress = _RAND_76[13:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_valid = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_isBr = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_isJal = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_isJalr = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_isCall = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_isRet = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_1_uop_pdInfo_jumpTarget = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_1_uop_ldst = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_1_uop_lrs1 = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_1_uop_lrs2 = _RAND_86[4:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_1_uop_pdst = _RAND_87[6:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_1_uop_prs1 = _RAND_88[6:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_1_uop_prs2 = _RAND_89[6:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_1_uop_oldPdst = _RAND_90[6:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_1_uop_rs1Valid = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_1_uop_rs2Valid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_1_uop_rdValid = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_1_uop_robIdx = _RAND_94[5:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_1_uop_robIdxFull = _RAND_95[6:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_1_uop_lqIdx = _RAND_96[3:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_1_uop_sqIdx = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_1_uop_issueQueue = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_1_uop_prs1Busy = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_1_uop_prs2Busy = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_1_uop_isSta = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_1_uop_isStd = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_1_data = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_1_redirect_valid = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_1_redirect_bits_valid = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_1_redirect_bits_robIdx = _RAND_106[5:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_uop_pc = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_uop_inst = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_uop_ctrl_fuType = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_uop_ctrl_aluOp = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_uop_ctrl_bruOp = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_uop_ctrl_lsuOp = _RAND_112[3:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_uop_ctrl_csrOp = _RAND_113[2:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_uop_ctrl_mulOp = _RAND_114[2:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_2_uop_ctrl_divOp = _RAND_115[2:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_2_uop_ctrl_src1Type = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_2_uop_ctrl_src2Type = _RAND_117[2:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_2_uop_ctrl_immType = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_2_uop_ctrl_rfWen = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_2_uop_ctrl_memRead = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  stgData_2_uop_ctrl_memWrite = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  stgData_2_uop_ctrl_csrWen = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  stgData_2_uop_ctrl_isBranch = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  stgData_2_uop_ctrl_isJump = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  stgData_2_uop_ctrl_isPriv = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  stgData_2_uop_excpVec = _RAND_126[9:0];
  _RAND_127 = {1{`RANDOM}};
  stgData_2_uop_imm = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  stgData_2_uop_csrAddress = _RAND_128[13:0];
  _RAND_129 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_isBr = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_isJal = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_isJalr = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_isCall = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_isRet = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  stgData_2_uop_pdInfo_jumpTarget = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  stgData_2_uop_ldst = _RAND_136[4:0];
  _RAND_137 = {1{`RANDOM}};
  stgData_2_uop_lrs1 = _RAND_137[4:0];
  _RAND_138 = {1{`RANDOM}};
  stgData_2_uop_lrs2 = _RAND_138[4:0];
  _RAND_139 = {1{`RANDOM}};
  stgData_2_uop_pdst = _RAND_139[6:0];
  _RAND_140 = {1{`RANDOM}};
  stgData_2_uop_prs1 = _RAND_140[6:0];
  _RAND_141 = {1{`RANDOM}};
  stgData_2_uop_prs2 = _RAND_141[6:0];
  _RAND_142 = {1{`RANDOM}};
  stgData_2_uop_oldPdst = _RAND_142[6:0];
  _RAND_143 = {1{`RANDOM}};
  stgData_2_uop_rs1Valid = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  stgData_2_uop_rs2Valid = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  stgData_2_uop_rdValid = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  stgData_2_uop_robIdx = _RAND_146[5:0];
  _RAND_147 = {1{`RANDOM}};
  stgData_2_uop_robIdxFull = _RAND_147[6:0];
  _RAND_148 = {1{`RANDOM}};
  stgData_2_uop_lqIdx = _RAND_148[3:0];
  _RAND_149 = {1{`RANDOM}};
  stgData_2_uop_sqIdx = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  stgData_2_uop_issueQueue = _RAND_150[2:0];
  _RAND_151 = {1{`RANDOM}};
  stgData_2_uop_prs1Busy = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  stgData_2_uop_prs2Busy = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  stgData_2_uop_isSta = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  stgData_2_uop_isStd = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  stgData_2_data = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  stgData_2_redirect_valid = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  stgData_2_redirect_bits_valid = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  stgData_2_redirect_bits_robIdx = _RAND_158[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
