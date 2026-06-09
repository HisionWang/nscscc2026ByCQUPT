module IBF(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_instrs_0, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_instrs_1, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_instrs_2, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_instrs_3, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pcs_0, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pcs_1, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pcs_2, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pcs_3, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_0_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pdInfo_0_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_1_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pdInfo_1_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_2_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pdInfo_2_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_pdInfo_3_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  input  [31:0] io_in_bits_pdInfo_3_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_enqMask_0, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_enqMask_1, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_enqMask_2, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_enqMask_3, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_mmu_error_excpTlbRefill, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_mmu_error_excpTlbPif, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_in_bits_mmu_error_excpTlbPpi, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_out_0_ready, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_0_bits_instr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_exception_excpTlbPif, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_0_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_out_1_ready, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_1_bits_instr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_exception_excpTlbPif, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_1_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_out_2_ready, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_2_bits_instr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 13:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_exception_excpTlbRefill, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_exception_excpTlbPif, // @[src/main/scala/frontend/IBF.scala 13:14]
  output        io_out_2_bits_exception_excpTlbPpi, // @[src/main/scala/frontend/IBF.scala 13:14]
  input         io_flush // @[src/main/scala/frontend/IBF.scala 13:14]
);
  wire  queue_clock; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_reset; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_0_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_0_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_0_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_1_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_1_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_1_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_2_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_2_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_2_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_3_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_3_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_0_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_0_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_0_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_1_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_1_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_1_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_ready; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_2_bits_instr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_2_bits_pc; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [31:0] queue_io_deq_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_deq_2_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_empty; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_full; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [4:0] queue_io_count; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire  queue_io_flush; // @[src/main/scala/frontend/IBF.scala 27:21]
  wire [1:0] _io_in_ready_T = queue_io_enq_0_ready + queue_io_enq_1_ready; // @[src/main/scala/frontend/IBF.scala 63:27]
  wire [1:0] _io_in_ready_T_2 = queue_io_enq_2_ready + queue_io_enq_3_ready; // @[src/main/scala/frontend/IBF.scala 63:27]
  wire [2:0] _io_in_ready_T_4 = _io_in_ready_T + _io_in_ready_T_2; // @[src/main/scala/frontend/IBF.scala 63:27]
  wire [1:0] _io_in_ready_T_6 = io_in_bits_enqMask_0 + io_in_bits_enqMask_1; // @[src/main/scala/frontend/IBF.scala 63:66]
  wire [1:0] _io_in_ready_T_8 = io_in_bits_enqMask_2 + io_in_bits_enqMask_3; // @[src/main/scala/frontend/IBF.scala 63:66]
  wire [2:0] _io_in_ready_T_10 = _io_in_ready_T_6 + _io_in_ready_T_8; // @[src/main/scala/frontend/IBF.scala 63:66]
  wire  deqReadyMask_1 = io_out_1_ready & io_out_0_ready; // @[src/main/scala/frontend/IBF.scala 92:40]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_2 = ~reset; // @[src/main/scala/frontend/IBF.scala 111:11]
  wire  _T_11 = io_out_0_ready & io_out_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_14 = io_out_1_ready & io_out_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_17 = io_out_2_ready & io_out_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  CircularQueue queue ( // @[src/main/scala/frontend/IBF.scala 27:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_0_ready(queue_io_enq_0_ready),
    .io_enq_0_valid(queue_io_enq_0_valid),
    .io_enq_0_bits_instr(queue_io_enq_0_bits_instr),
    .io_enq_0_bits_pc(queue_io_enq_0_bits_pc),
    .io_enq_0_bits_pdInfo_valid(queue_io_enq_0_bits_pdInfo_valid),
    .io_enq_0_bits_pdInfo_isBr(queue_io_enq_0_bits_pdInfo_isBr),
    .io_enq_0_bits_pdInfo_isJal(queue_io_enq_0_bits_pdInfo_isJal),
    .io_enq_0_bits_pdInfo_isJalr(queue_io_enq_0_bits_pdInfo_isJalr),
    .io_enq_0_bits_pdInfo_isCall(queue_io_enq_0_bits_pdInfo_isCall),
    .io_enq_0_bits_pdInfo_isRet(queue_io_enq_0_bits_pdInfo_isRet),
    .io_enq_0_bits_pdInfo_jumpTarget(queue_io_enq_0_bits_pdInfo_jumpTarget),
    .io_enq_0_bits_exception_excpTlbRefill(queue_io_enq_0_bits_exception_excpTlbRefill),
    .io_enq_0_bits_exception_excpTlbPif(queue_io_enq_0_bits_exception_excpTlbPif),
    .io_enq_0_bits_exception_excpTlbPpi(queue_io_enq_0_bits_exception_excpTlbPpi),
    .io_enq_1_ready(queue_io_enq_1_ready),
    .io_enq_1_valid(queue_io_enq_1_valid),
    .io_enq_1_bits_instr(queue_io_enq_1_bits_instr),
    .io_enq_1_bits_pc(queue_io_enq_1_bits_pc),
    .io_enq_1_bits_pdInfo_valid(queue_io_enq_1_bits_pdInfo_valid),
    .io_enq_1_bits_pdInfo_isBr(queue_io_enq_1_bits_pdInfo_isBr),
    .io_enq_1_bits_pdInfo_isJal(queue_io_enq_1_bits_pdInfo_isJal),
    .io_enq_1_bits_pdInfo_isJalr(queue_io_enq_1_bits_pdInfo_isJalr),
    .io_enq_1_bits_pdInfo_isCall(queue_io_enq_1_bits_pdInfo_isCall),
    .io_enq_1_bits_pdInfo_isRet(queue_io_enq_1_bits_pdInfo_isRet),
    .io_enq_1_bits_pdInfo_jumpTarget(queue_io_enq_1_bits_pdInfo_jumpTarget),
    .io_enq_1_bits_exception_excpTlbRefill(queue_io_enq_1_bits_exception_excpTlbRefill),
    .io_enq_1_bits_exception_excpTlbPif(queue_io_enq_1_bits_exception_excpTlbPif),
    .io_enq_1_bits_exception_excpTlbPpi(queue_io_enq_1_bits_exception_excpTlbPpi),
    .io_enq_2_ready(queue_io_enq_2_ready),
    .io_enq_2_valid(queue_io_enq_2_valid),
    .io_enq_2_bits_instr(queue_io_enq_2_bits_instr),
    .io_enq_2_bits_pc(queue_io_enq_2_bits_pc),
    .io_enq_2_bits_pdInfo_valid(queue_io_enq_2_bits_pdInfo_valid),
    .io_enq_2_bits_pdInfo_isBr(queue_io_enq_2_bits_pdInfo_isBr),
    .io_enq_2_bits_pdInfo_isJal(queue_io_enq_2_bits_pdInfo_isJal),
    .io_enq_2_bits_pdInfo_isJalr(queue_io_enq_2_bits_pdInfo_isJalr),
    .io_enq_2_bits_pdInfo_isCall(queue_io_enq_2_bits_pdInfo_isCall),
    .io_enq_2_bits_pdInfo_isRet(queue_io_enq_2_bits_pdInfo_isRet),
    .io_enq_2_bits_pdInfo_jumpTarget(queue_io_enq_2_bits_pdInfo_jumpTarget),
    .io_enq_2_bits_exception_excpTlbRefill(queue_io_enq_2_bits_exception_excpTlbRefill),
    .io_enq_2_bits_exception_excpTlbPif(queue_io_enq_2_bits_exception_excpTlbPif),
    .io_enq_2_bits_exception_excpTlbPpi(queue_io_enq_2_bits_exception_excpTlbPpi),
    .io_enq_3_ready(queue_io_enq_3_ready),
    .io_enq_3_valid(queue_io_enq_3_valid),
    .io_enq_3_bits_instr(queue_io_enq_3_bits_instr),
    .io_enq_3_bits_pc(queue_io_enq_3_bits_pc),
    .io_enq_3_bits_pdInfo_valid(queue_io_enq_3_bits_pdInfo_valid),
    .io_enq_3_bits_pdInfo_isBr(queue_io_enq_3_bits_pdInfo_isBr),
    .io_enq_3_bits_pdInfo_isJal(queue_io_enq_3_bits_pdInfo_isJal),
    .io_enq_3_bits_pdInfo_isJalr(queue_io_enq_3_bits_pdInfo_isJalr),
    .io_enq_3_bits_pdInfo_isCall(queue_io_enq_3_bits_pdInfo_isCall),
    .io_enq_3_bits_pdInfo_isRet(queue_io_enq_3_bits_pdInfo_isRet),
    .io_enq_3_bits_pdInfo_jumpTarget(queue_io_enq_3_bits_pdInfo_jumpTarget),
    .io_enq_3_bits_exception_excpTlbRefill(queue_io_enq_3_bits_exception_excpTlbRefill),
    .io_enq_3_bits_exception_excpTlbPif(queue_io_enq_3_bits_exception_excpTlbPif),
    .io_enq_3_bits_exception_excpTlbPpi(queue_io_enq_3_bits_exception_excpTlbPpi),
    .io_deq_0_ready(queue_io_deq_0_ready),
    .io_deq_0_valid(queue_io_deq_0_valid),
    .io_deq_0_bits_instr(queue_io_deq_0_bits_instr),
    .io_deq_0_bits_pc(queue_io_deq_0_bits_pc),
    .io_deq_0_bits_pdInfo_valid(queue_io_deq_0_bits_pdInfo_valid),
    .io_deq_0_bits_pdInfo_isBr(queue_io_deq_0_bits_pdInfo_isBr),
    .io_deq_0_bits_pdInfo_isJal(queue_io_deq_0_bits_pdInfo_isJal),
    .io_deq_0_bits_pdInfo_isJalr(queue_io_deq_0_bits_pdInfo_isJalr),
    .io_deq_0_bits_pdInfo_isCall(queue_io_deq_0_bits_pdInfo_isCall),
    .io_deq_0_bits_pdInfo_isRet(queue_io_deq_0_bits_pdInfo_isRet),
    .io_deq_0_bits_pdInfo_jumpTarget(queue_io_deq_0_bits_pdInfo_jumpTarget),
    .io_deq_0_bits_exception_excpTlbRefill(queue_io_deq_0_bits_exception_excpTlbRefill),
    .io_deq_0_bits_exception_excpTlbPif(queue_io_deq_0_bits_exception_excpTlbPif),
    .io_deq_0_bits_exception_excpTlbPpi(queue_io_deq_0_bits_exception_excpTlbPpi),
    .io_deq_1_ready(queue_io_deq_1_ready),
    .io_deq_1_valid(queue_io_deq_1_valid),
    .io_deq_1_bits_instr(queue_io_deq_1_bits_instr),
    .io_deq_1_bits_pc(queue_io_deq_1_bits_pc),
    .io_deq_1_bits_pdInfo_valid(queue_io_deq_1_bits_pdInfo_valid),
    .io_deq_1_bits_pdInfo_isBr(queue_io_deq_1_bits_pdInfo_isBr),
    .io_deq_1_bits_pdInfo_isJal(queue_io_deq_1_bits_pdInfo_isJal),
    .io_deq_1_bits_pdInfo_isJalr(queue_io_deq_1_bits_pdInfo_isJalr),
    .io_deq_1_bits_pdInfo_isCall(queue_io_deq_1_bits_pdInfo_isCall),
    .io_deq_1_bits_pdInfo_isRet(queue_io_deq_1_bits_pdInfo_isRet),
    .io_deq_1_bits_pdInfo_jumpTarget(queue_io_deq_1_bits_pdInfo_jumpTarget),
    .io_deq_1_bits_exception_excpTlbRefill(queue_io_deq_1_bits_exception_excpTlbRefill),
    .io_deq_1_bits_exception_excpTlbPif(queue_io_deq_1_bits_exception_excpTlbPif),
    .io_deq_1_bits_exception_excpTlbPpi(queue_io_deq_1_bits_exception_excpTlbPpi),
    .io_deq_2_ready(queue_io_deq_2_ready),
    .io_deq_2_valid(queue_io_deq_2_valid),
    .io_deq_2_bits_instr(queue_io_deq_2_bits_instr),
    .io_deq_2_bits_pc(queue_io_deq_2_bits_pc),
    .io_deq_2_bits_pdInfo_valid(queue_io_deq_2_bits_pdInfo_valid),
    .io_deq_2_bits_pdInfo_isBr(queue_io_deq_2_bits_pdInfo_isBr),
    .io_deq_2_bits_pdInfo_isJal(queue_io_deq_2_bits_pdInfo_isJal),
    .io_deq_2_bits_pdInfo_isJalr(queue_io_deq_2_bits_pdInfo_isJalr),
    .io_deq_2_bits_pdInfo_isCall(queue_io_deq_2_bits_pdInfo_isCall),
    .io_deq_2_bits_pdInfo_isRet(queue_io_deq_2_bits_pdInfo_isRet),
    .io_deq_2_bits_pdInfo_jumpTarget(queue_io_deq_2_bits_pdInfo_jumpTarget),
    .io_deq_2_bits_exception_excpTlbRefill(queue_io_deq_2_bits_exception_excpTlbRefill),
    .io_deq_2_bits_exception_excpTlbPif(queue_io_deq_2_bits_exception_excpTlbPif),
    .io_deq_2_bits_exception_excpTlbPpi(queue_io_deq_2_bits_exception_excpTlbPpi),
    .io_empty(queue_io_empty),
    .io_full(queue_io_full),
    .io_count(queue_io_count),
    .io_flush(queue_io_flush)
  );
  assign io_in_ready = _io_in_ready_T_4 >= _io_in_ready_T_10; // @[src/main/scala/frontend/IBF.scala 63:55]
  assign io_out_0_valid = queue_io_deq_0_valid; // @[src/main/scala/frontend/IBF.scala 71:21]
  assign io_out_0_bits_instr = queue_io_deq_0_bits_instr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pc = queue_io_deq_0_bits_pc; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_valid = queue_io_deq_0_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_isBr = queue_io_deq_0_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_isJal = queue_io_deq_0_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_isJalr = queue_io_deq_0_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_isCall = queue_io_deq_0_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_isRet = queue_io_deq_0_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_pdInfo_jumpTarget = queue_io_deq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_exception_excpTlbRefill = queue_io_deq_0_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_exception_excpTlbPif = queue_io_deq_0_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_0_bits_exception_excpTlbPpi = queue_io_deq_0_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_valid = queue_io_deq_1_valid; // @[src/main/scala/frontend/IBF.scala 71:21]
  assign io_out_1_bits_instr = queue_io_deq_1_bits_instr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pc = queue_io_deq_1_bits_pc; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_valid = queue_io_deq_1_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_isBr = queue_io_deq_1_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_isJal = queue_io_deq_1_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_isJalr = queue_io_deq_1_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_isCall = queue_io_deq_1_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_isRet = queue_io_deq_1_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_pdInfo_jumpTarget = queue_io_deq_1_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_exception_excpTlbRefill = queue_io_deq_1_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_exception_excpTlbPif = queue_io_deq_1_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_1_bits_exception_excpTlbPpi = queue_io_deq_1_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_valid = queue_io_deq_2_valid; // @[src/main/scala/frontend/IBF.scala 71:21]
  assign io_out_2_bits_instr = queue_io_deq_2_bits_instr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pc = queue_io_deq_2_bits_pc; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_valid = queue_io_deq_2_bits_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_isBr = queue_io_deq_2_bits_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_isJal = queue_io_deq_2_bits_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_isJalr = queue_io_deq_2_bits_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_isCall = queue_io_deq_2_bits_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_isRet = queue_io_deq_2_bits_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_pdInfo_jumpTarget = queue_io_deq_2_bits_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_exception_excpTlbRefill = queue_io_deq_2_bits_exception_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_exception_excpTlbPif = queue_io_deq_2_bits_exception_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign io_out_2_bits_exception_excpTlbPpi = queue_io_deq_2_bits_exception_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 72:20]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_0_valid = io_in_valid & io_in_bits_enqMask_0 & io_in_ready; // @[src/main/scala/frontend/IBF.scala 40:69]
  assign queue_io_enq_0_bits_instr = io_in_bits_instrs_0; // @[src/main/scala/frontend/IBF.scala 45:34]
  assign queue_io_enq_0_bits_pc = io_in_bits_pcs_0; // @[src/main/scala/frontend/IBF.scala 46:31]
  assign queue_io_enq_0_bits_pdInfo_valid = io_in_bits_pdInfo_0_valid; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_isBr = io_in_bits_pdInfo_0_isBr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_isJal = io_in_bits_pdInfo_0_isJal; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_isJalr = io_in_bits_pdInfo_0_isJalr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_isCall = io_in_bits_pdInfo_0_isCall; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_isRet = io_in_bits_pdInfo_0_isRet; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_pdInfo_jumpTarget = io_in_bits_pdInfo_0_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_0_bits_exception_excpTlbRefill = io_in_bits_mmu_error_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_0_bits_exception_excpTlbPif = io_in_bits_mmu_error_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_0_bits_exception_excpTlbPpi = io_in_bits_mmu_error_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_1_valid = io_in_valid & io_in_bits_enqMask_1 & io_in_ready; // @[src/main/scala/frontend/IBF.scala 40:69]
  assign queue_io_enq_1_bits_instr = io_in_bits_instrs_1; // @[src/main/scala/frontend/IBF.scala 45:34]
  assign queue_io_enq_1_bits_pc = io_in_bits_pcs_1; // @[src/main/scala/frontend/IBF.scala 46:31]
  assign queue_io_enq_1_bits_pdInfo_valid = io_in_bits_pdInfo_1_valid; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_isBr = io_in_bits_pdInfo_1_isBr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_isJal = io_in_bits_pdInfo_1_isJal; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_isJalr = io_in_bits_pdInfo_1_isJalr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_isCall = io_in_bits_pdInfo_1_isCall; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_isRet = io_in_bits_pdInfo_1_isRet; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_pdInfo_jumpTarget = io_in_bits_pdInfo_1_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_1_bits_exception_excpTlbRefill = io_in_bits_mmu_error_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_1_bits_exception_excpTlbPif = io_in_bits_mmu_error_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_1_bits_exception_excpTlbPpi = io_in_bits_mmu_error_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_2_valid = io_in_valid & io_in_bits_enqMask_2 & io_in_ready; // @[src/main/scala/frontend/IBF.scala 40:69]
  assign queue_io_enq_2_bits_instr = io_in_bits_instrs_2; // @[src/main/scala/frontend/IBF.scala 45:34]
  assign queue_io_enq_2_bits_pc = io_in_bits_pcs_2; // @[src/main/scala/frontend/IBF.scala 46:31]
  assign queue_io_enq_2_bits_pdInfo_valid = io_in_bits_pdInfo_2_valid; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_isBr = io_in_bits_pdInfo_2_isBr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_isJal = io_in_bits_pdInfo_2_isJal; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_isJalr = io_in_bits_pdInfo_2_isJalr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_isCall = io_in_bits_pdInfo_2_isCall; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_isRet = io_in_bits_pdInfo_2_isRet; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_pdInfo_jumpTarget = io_in_bits_pdInfo_2_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_2_bits_exception_excpTlbRefill = io_in_bits_mmu_error_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_2_bits_exception_excpTlbPif = io_in_bits_mmu_error_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_2_bits_exception_excpTlbPpi = io_in_bits_mmu_error_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_3_valid = io_in_valid & io_in_bits_enqMask_3 & io_in_ready; // @[src/main/scala/frontend/IBF.scala 40:69]
  assign queue_io_enq_3_bits_instr = io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:34]
  assign queue_io_enq_3_bits_pc = io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:31]
  assign queue_io_enq_3_bits_pdInfo_valid = io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_isBr = io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_isJal = io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_isJalr = io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_isCall = io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_isRet = io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_pdInfo_jumpTarget = io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:35]
  assign queue_io_enq_3_bits_exception_excpTlbRefill = io_in_bits_mmu_error_excpTlbRefill; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_3_bits_exception_excpTlbPif = io_in_bits_mmu_error_excpTlbPif; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_enq_3_bits_exception_excpTlbPpi = io_in_bits_mmu_error_excpTlbPpi; // @[src/main/scala/frontend/IBF.scala 50:38]
  assign queue_io_deq_0_ready = io_out_0_ready; // @[src/main/scala/frontend/IBF.scala 88:26 89:19]
  assign queue_io_deq_1_ready = io_out_1_ready & io_out_0_ready; // @[src/main/scala/frontend/IBF.scala 92:40]
  assign queue_io_deq_2_ready = io_out_2_ready & deqReadyMask_1; // @[src/main/scala/frontend/IBF.scala 92:40]
  assign queue_io_flush = io_flush; // @[src/main/scala/frontend/IBF.scala 35:18]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue] Enqueue: %d instructions, queue count=%d\n",_io_in_ready_T_10,
            queue_io_count); // @[src/main/scala/frontend/IBF.scala 111:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & io_in_bits_enqMask_0 & _T_2) begin
          $fwrite(32'h80000002,"  Instr[0]: pc=0x%x, instr=0x%x\n",io_in_bits_pcs_0,io_in_bits_instrs_0); // @[src/main/scala/frontend/IBF.scala 116:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & io_in_bits_enqMask_1 & _T_2) begin
          $fwrite(32'h80000002,"  Instr[1]: pc=0x%x, instr=0x%x\n",io_in_bits_pcs_1,io_in_bits_instrs_1); // @[src/main/scala/frontend/IBF.scala 116:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & io_in_bits_enqMask_2 & _T_2) begin
          $fwrite(32'h80000002,"  Instr[2]: pc=0x%x, instr=0x%x\n",io_in_bits_pcs_2,io_in_bits_instrs_2); // @[src/main/scala/frontend/IBF.scala 116:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & io_in_bits_enqMask_3 & _T_2) begin
          $fwrite(32'h80000002,"  Instr[3]: pc=0x%x, instr=0x%x\n",io_in_bits_pcs_3,io_in_bits_instrs_3); // @[src/main/scala/frontend/IBF.scala 116:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & _T_2) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue] Dequeue[0]: pc=0x%x, instr=0x%x\n",io_out_0_bits_pc,
            io_out_0_bits_instr); // @[src/main/scala/frontend/IBF.scala 125:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_14 & _T_2) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue] Dequeue[1]: pc=0x%x, instr=0x%x\n",io_out_1_bits_pc,
            io_out_1_bits_instr); // @[src/main/scala/frontend/IBF.scala 125:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_17 & _T_2) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue] Dequeue[2]: pc=0x%x, instr=0x%x\n",io_out_2_bits_pc,
            io_out_2_bits_instr); // @[src/main/scala/frontend/IBF.scala 125:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue Status] count=%d, empty=%d, full=%d\n",queue_io_count,queue_io_empty,
            queue_io_full); // @[src/main/scala/frontend/IBF.scala 131:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_flush & _T_2) begin
          $fwrite(32'h80000002,"[IBF-CircularQueue] Buffer flushed due to redirect\n"); // @[src/main/scala/frontend/IBF.scala 134:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
