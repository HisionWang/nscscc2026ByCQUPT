module DifftestInCore(
  input         clock,
  input         reset,
  input         io_commit_0_valid, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_pc, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_instr, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_rfWen, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [4:0]  io_commit_0_wdest, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_wdata, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_isCntInst, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_csrRstat, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_csrData, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_excpFlush, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_ertnFlush, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [5:0]  io_commit_0_csrEcode, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_trap, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_load_valid, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_load_paddr, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_load_vaddr, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input         io_commit_0_store_valid, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_store_paddr, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_store_vaddr, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_commit_0_store_data, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_1, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_2, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_3, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_4, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_5, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_6, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_7, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_8, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_9, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_10, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_11, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_12, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_13, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_14, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_15, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_16, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_17, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_18, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_19, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_20, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_21, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_22, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_23, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_24, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_25, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_26, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_27, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_28, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_29, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_30, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_regs_31, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [31:0] io_csr_estat, // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
  input  [63:0] io_csr_timer64 // @[\\src\\main\\scala\\difftest\\Difftest.scala 159:14]
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
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  wire  difftestInstrCommit_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [7:0] difftestInstrCommit_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [63:0] difftestInstrCommit_index; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [63:0] difftestInstrCommit_pc; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [31:0] difftestInstrCommit_instr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_skip; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_is_TLBFILL; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [4:0] difftestInstrCommit_TLBFILL_index; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_is_CNTinst; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [63:0] difftestInstrCommit_timer_64_value; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_wen; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [7:0] difftestInstrCommit_wdest; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [63:0] difftestInstrCommit_wdata; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestInstrCommit_csr_rstat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire [63:0] difftestInstrCommit_csr_data; // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
  wire  difftestStoreEvent_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire [7:0] difftestStoreEvent_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire [7:0] difftestStoreEvent_index; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire  difftestStoreEvent_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire [63:0] difftestStoreEvent_storePAddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire [63:0] difftestStoreEvent_storeVAddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire [63:0] difftestStoreEvent_storeData; // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
  wire  difftestLoadEvent_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire [7:0] difftestLoadEvent_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire [7:0] difftestLoadEvent_index; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire  difftestLoadEvent_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire [63:0] difftestLoadEvent_paddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire [63:0] difftestLoadEvent_vaddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
  wire  difftestExcpEvent_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire [7:0] difftestExcpEvent_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire  difftestExcpEvent_excp_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire  difftestExcpEvent_eret; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire [10:0] difftestExcpEvent_intrNo; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire [5:0] difftestExcpEvent_cause; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire [63:0] difftestExcpEvent_exceptionPC; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire [31:0] difftestExcpEvent_exceptionInst; // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
  wire  difftestTrapEvent_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire [7:0] difftestTrapEvent_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire  difftestTrapEvent_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire [7:0] difftestTrapEvent_code; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire [63:0] difftestTrapEvent_pc; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire [63:0] difftestTrapEvent_cycleCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire [63:0] difftestTrapEvent_instrCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
  wire  difftestCSRRegState_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [7:0] difftestCSRRegState_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_crmd; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_prmd; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_euen; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_ecfg; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_estat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_era; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_badv; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_eentry; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_tlbidx; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_tlbehi; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_tlbelo0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_tlbelo1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_asid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_pgdl; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_pgdh; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_save0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_save1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_save2; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_save3; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_tid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_tcfg; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_tval; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_ticlr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_llbctl; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [63:0] difftestCSRRegState_tlbrentry; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_dmw0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire [31:0] difftestCSRRegState_dmw1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
  wire  difftestGRegState_clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [7:0] difftestGRegState_coreid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_2; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_3; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_4; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_5; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_6; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_7; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_8; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_9; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_10; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_11; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_12; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_13; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_14; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_15; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_16; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_17; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_18; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_19; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_20; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_21; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_22; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_23; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_24; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_25; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_26; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_27; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_28; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_29; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_30; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  wire [63:0] difftestGRegState_gpr_31; // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
  reg  cmt_0_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_pc; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_instr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_rfWen; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [4:0] cmt_0_wdest; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_wdata; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_isCntInst; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_csrRstat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_csrData; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_excpFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_ertnFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [5:0] cmt_0_csrEcode; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_trap; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_load_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_load_paddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_load_vaddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg  cmt_0_store_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_store_paddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_store_vaddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [31:0] cmt_0_store_data; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
  reg [63:0] cmtTimer64; // @[\\src\\main\\scala\\difftest\\Difftest.scala 167:27]
  reg [63:0] cycleCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 171:25]
  reg [63:0] instrCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 172:25]
  wire [63:0] _cycleCnt_T_1 = cycleCnt + 64'h1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 173:24]
  wire [63:0] _GEN_0 = {{63'd0}, io_commit_0_valid}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 174:24]
  wire [63:0] _instrCnt_T_1 = instrCnt + _GEN_0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 174:24]
  wire  excpValids_0 = cmt_0_valid & (cmt_0_excpFlush | cmt_0_ertnFlush); // @[\\src\\main\\scala\\difftest\\Difftest.scala 215:49]
  wire  _difftestExcpEvent_io_excp_valid_T = |excpValids_0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 220:56]
  wire  trapValids_0 = cmt_0_valid & cmt_0_trap; // @[\\src\\main\\scala\\difftest\\Difftest.scala 227:49]
  DifftestInstrCommit difftestInstrCommit ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 179:37]
    .clock(difftestInstrCommit_clock),
    .coreid(difftestInstrCommit_coreid),
    .index(difftestInstrCommit_index),
    .valid(difftestInstrCommit_valid),
    .pc(difftestInstrCommit_pc),
    .instr(difftestInstrCommit_instr),
    .skip(difftestInstrCommit_skip),
    .is_TLBFILL(difftestInstrCommit_is_TLBFILL),
    .TLBFILL_index(difftestInstrCommit_TLBFILL_index),
    .is_CNTinst(difftestInstrCommit_is_CNTinst),
    .timer_64_value(difftestInstrCommit_timer_64_value),
    .wen(difftestInstrCommit_wen),
    .wdest(difftestInstrCommit_wdest),
    .wdata(difftestInstrCommit_wdata),
    .csr_rstat(difftestInstrCommit_csr_rstat),
    .csr_data(difftestInstrCommit_csr_data)
  );
  DifftestStoreEvent difftestStoreEvent ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 197:36]
    .clock(difftestStoreEvent_clock),
    .coreid(difftestStoreEvent_coreid),
    .index(difftestStoreEvent_index),
    .valid(difftestStoreEvent_valid),
    .storePAddr(difftestStoreEvent_storePAddr),
    .storeVAddr(difftestStoreEvent_storeVAddr),
    .storeData(difftestStoreEvent_storeData)
  );
  DifftestLoadEvent difftestLoadEvent ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 206:35]
    .clock(difftestLoadEvent_clock),
    .coreid(difftestLoadEvent_coreid),
    .index(difftestLoadEvent_index),
    .valid(difftestLoadEvent_valid),
    .paddr(difftestLoadEvent_paddr),
    .vaddr(difftestLoadEvent_vaddr)
  );
  DifftestExcpEvent difftestExcpEvent ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 217:33]
    .clock(difftestExcpEvent_clock),
    .coreid(difftestExcpEvent_coreid),
    .excp_valid(difftestExcpEvent_excp_valid),
    .eret(difftestExcpEvent_eret),
    .intrNo(difftestExcpEvent_intrNo),
    .cause(difftestExcpEvent_cause),
    .exceptionPC(difftestExcpEvent_exceptionPC),
    .exceptionInst(difftestExcpEvent_exceptionInst)
  );
  DifftestTrapEvent difftestTrapEvent ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 229:33]
    .clock(difftestTrapEvent_clock),
    .coreid(difftestTrapEvent_coreid),
    .valid(difftestTrapEvent_valid),
    .code(difftestTrapEvent_code),
    .pc(difftestTrapEvent_pc),
    .cycleCnt(difftestTrapEvent_cycleCnt),
    .instrCnt(difftestTrapEvent_instrCnt)
  );
  DifftestCSRRegState difftestCSRRegState ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 238:35]
    .clock(difftestCSRRegState_clock),
    .coreid(difftestCSRRegState_coreid),
    .crmd(difftestCSRRegState_crmd),
    .prmd(difftestCSRRegState_prmd),
    .euen(difftestCSRRegState_euen),
    .ecfg(difftestCSRRegState_ecfg),
    .estat(difftestCSRRegState_estat),
    .era(difftestCSRRegState_era),
    .badv(difftestCSRRegState_badv),
    .eentry(difftestCSRRegState_eentry),
    .tlbidx(difftestCSRRegState_tlbidx),
    .tlbehi(difftestCSRRegState_tlbehi),
    .tlbelo0(difftestCSRRegState_tlbelo0),
    .tlbelo1(difftestCSRRegState_tlbelo1),
    .asid(difftestCSRRegState_asid),
    .pgdl(difftestCSRRegState_pgdl),
    .pgdh(difftestCSRRegState_pgdh),
    .save0(difftestCSRRegState_save0),
    .save1(difftestCSRRegState_save1),
    .save2(difftestCSRRegState_save2),
    .save3(difftestCSRRegState_save3),
    .tid(difftestCSRRegState_tid),
    .tcfg(difftestCSRRegState_tcfg),
    .tval(difftestCSRRegState_tval),
    .ticlr(difftestCSRRegState_ticlr),
    .llbctl(difftestCSRRegState_llbctl),
    .tlbrentry(difftestCSRRegState_tlbrentry),
    .dmw0(difftestCSRRegState_dmw0),
    .dmw1(difftestCSRRegState_dmw1)
  );
  DifftestGRegState difftestGRegState ( // @[\\src\\main\\scala\\difftest\\Difftest.scala 269:33]
    .clock(difftestGRegState_clock),
    .coreid(difftestGRegState_coreid),
    .gpr_0(difftestGRegState_gpr_0),
    .gpr_1(difftestGRegState_gpr_1),
    .gpr_2(difftestGRegState_gpr_2),
    .gpr_3(difftestGRegState_gpr_3),
    .gpr_4(difftestGRegState_gpr_4),
    .gpr_5(difftestGRegState_gpr_5),
    .gpr_6(difftestGRegState_gpr_6),
    .gpr_7(difftestGRegState_gpr_7),
    .gpr_8(difftestGRegState_gpr_8),
    .gpr_9(difftestGRegState_gpr_9),
    .gpr_10(difftestGRegState_gpr_10),
    .gpr_11(difftestGRegState_gpr_11),
    .gpr_12(difftestGRegState_gpr_12),
    .gpr_13(difftestGRegState_gpr_13),
    .gpr_14(difftestGRegState_gpr_14),
    .gpr_15(difftestGRegState_gpr_15),
    .gpr_16(difftestGRegState_gpr_16),
    .gpr_17(difftestGRegState_gpr_17),
    .gpr_18(difftestGRegState_gpr_18),
    .gpr_19(difftestGRegState_gpr_19),
    .gpr_20(difftestGRegState_gpr_20),
    .gpr_21(difftestGRegState_gpr_21),
    .gpr_22(difftestGRegState_gpr_22),
    .gpr_23(difftestGRegState_gpr_23),
    .gpr_24(difftestGRegState_gpr_24),
    .gpr_25(difftestGRegState_gpr_25),
    .gpr_26(difftestGRegState_gpr_26),
    .gpr_27(difftestGRegState_gpr_27),
    .gpr_28(difftestGRegState_gpr_28),
    .gpr_29(difftestGRegState_gpr_29),
    .gpr_30(difftestGRegState_gpr_30),
    .gpr_31(difftestGRegState_gpr_31)
  );
  assign difftestInstrCommit_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 180:34]
  assign difftestInstrCommit_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 181:35]
  assign difftestInstrCommit_index = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 182:34]
  assign difftestInstrCommit_valid = cmt_0_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 183:34]
  assign difftestInstrCommit_pc = {32'h0,cmt_0_pc}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestInstrCommit_instr = cmt_0_instr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 185:34]
  assign difftestInstrCommit_skip = 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 186:33]
  assign difftestInstrCommit_is_TLBFILL = 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 187:39]
  assign difftestInstrCommit_TLBFILL_index = 5'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 188:42]
  assign difftestInstrCommit_is_CNTinst = cmt_0_isCntInst; // @[\\src\\main\\scala\\difftest\\Difftest.scala 189:39]
  assign difftestInstrCommit_timer_64_value = cmtTimer64; // @[\\src\\main\\scala\\difftest\\Difftest.scala 190:43]
  assign difftestInstrCommit_wen = cmt_0_valid & cmt_0_rfWen; // @[\\src\\main\\scala\\difftest\\Difftest.scala 191:48]
  assign difftestInstrCommit_wdest = {3'h0,cmt_0_wdest}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 192:40]
  assign difftestInstrCommit_wdata = {32'h0,cmt_0_wdata}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestInstrCommit_csr_rstat = cmt_0_valid & cmt_0_csrRstat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 194:54]
  assign difftestInstrCommit_csr_data = {32'h0,cmt_0_csrData}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestStoreEvent_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 198:33]
  assign difftestStoreEvent_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 199:34]
  assign difftestStoreEvent_index = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 200:33]
  assign difftestStoreEvent_valid = cmt_0_valid & cmt_0_store_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 201:49]
  assign difftestStoreEvent_storePAddr = {32'h0,cmt_0_store_paddr}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestStoreEvent_storeVAddr = {32'h0,cmt_0_store_vaddr}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestStoreEvent_storeData = {32'h0,cmt_0_store_data}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestLoadEvent_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 207:32]
  assign difftestLoadEvent_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 208:33]
  assign difftestLoadEvent_index = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 209:32]
  assign difftestLoadEvent_valid = cmt_0_valid & cmt_0_load_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 210:48]
  assign difftestLoadEvent_paddr = {32'h0,cmt_0_load_paddr}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestLoadEvent_vaddr = {32'h0,cmt_0_load_vaddr}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestExcpEvent_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 218:30]
  assign difftestExcpEvent_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 219:31]
  assign difftestExcpEvent_excp_valid = |excpValids_0 & cmt_0_excpFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 220:60]
  assign difftestExcpEvent_eret = _difftestExcpEvent_io_excp_valid_T & cmt_0_ertnFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 221:54]
  assign difftestExcpEvent_intrNo = io_csr_estat[12:2]; // @[\\src\\main\\scala\\difftest\\Difftest.scala 222:46]
  assign difftestExcpEvent_cause = cmt_0_csrEcode; // @[\\src\\main\\scala\\difftest\\Difftest.scala 223:30]
  assign difftestExcpEvent_exceptionPC = {32'h0,cmt_0_pc}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestExcpEvent_exceptionInst = cmt_0_instr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 225:38]
  assign difftestTrapEvent_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 230:30]
  assign difftestTrapEvent_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 231:31]
  assign difftestTrapEvent_valid = |trapValids_0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 232:51]
  assign difftestTrapEvent_code = io_regs_10[7:0]; // @[\\src\\main\\scala\\difftest\\Difftest.scala 233:93]
  assign difftestTrapEvent_pc = {32'h0,cmt_0_pc}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestTrapEvent_cycleCnt = cycleCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 235:33]
  assign difftestTrapEvent_instrCnt = instrCnt; // @[\\src\\main\\scala\\difftest\\Difftest.scala 236:33]
  assign difftestCSRRegState_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 239:32]
  assign difftestCSRRegState_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 240:33]
  assign difftestCSRRegState_crmd = 32'h8; // @[\\src\\main\\scala\\difftest\\Difftest.scala 241:31]
  assign difftestCSRRegState_prmd = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 242:31]
  assign difftestCSRRegState_euen = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 243:31]
  assign difftestCSRRegState_ecfg = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 244:31]
  assign difftestCSRRegState_estat = io_csr_estat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 245:32]
  assign difftestCSRRegState_era = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 246:30]
  assign difftestCSRRegState_badv = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 247:31]
  assign difftestCSRRegState_eentry = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 248:33]
  assign difftestCSRRegState_tlbidx = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 249:33]
  assign difftestCSRRegState_tlbehi = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 250:33]
  assign difftestCSRRegState_tlbelo0 = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 251:34]
  assign difftestCSRRegState_tlbelo1 = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 252:34]
  assign difftestCSRRegState_asid = 32'ha000000; // @[\\src\\main\\scala\\difftest\\Difftest.scala 253:31]
  assign difftestCSRRegState_pgdl = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 254:31]
  assign difftestCSRRegState_pgdh = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 255:31]
  assign difftestCSRRegState_save0 = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 256:32]
  assign difftestCSRRegState_save1 = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 257:32]
  assign difftestCSRRegState_save2 = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 258:32]
  assign difftestCSRRegState_save3 = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 259:32]
  assign difftestCSRRegState_tid = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 260:30]
  assign difftestCSRRegState_tcfg = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 261:31]
  assign difftestCSRRegState_tval = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 262:31]
  assign difftestCSRRegState_ticlr = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 263:32]
  assign difftestCSRRegState_llbctl = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 264:33]
  assign difftestCSRRegState_tlbrentry = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 265:36]
  assign difftestCSRRegState_dmw0 = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 266:31]
  assign difftestCSRRegState_dmw1 = 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 267:31]
  assign difftestGRegState_clock = clock; // @[\\src\\main\\scala\\difftest\\Difftest.scala 270:30]
  assign difftestGRegState_coreid = 8'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 271:31]
  assign difftestGRegState_gpr_0 = 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 272:30]
  assign difftestGRegState_gpr_1 = {32'h0,io_regs_1}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_2 = {32'h0,io_regs_2}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_3 = {32'h0,io_regs_3}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_4 = {32'h0,io_regs_4}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_5 = {32'h0,io_regs_5}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_6 = {32'h0,io_regs_6}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_7 = {32'h0,io_regs_7}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_8 = {32'h0,io_regs_8}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_9 = {32'h0,io_regs_9}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_10 = {32'h0,io_regs_10}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_11 = {32'h0,io_regs_11}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_12 = {32'h0,io_regs_12}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_13 = {32'h0,io_regs_13}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_14 = {32'h0,io_regs_14}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_15 = {32'h0,io_regs_15}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_16 = {32'h0,io_regs_16}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_17 = {32'h0,io_regs_17}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_18 = {32'h0,io_regs_18}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_19 = {32'h0,io_regs_19}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_20 = {32'h0,io_regs_20}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_21 = {32'h0,io_regs_21}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_22 = {32'h0,io_regs_22}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_23 = {32'h0,io_regs_23}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_24 = {32'h0,io_regs_24}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_25 = {32'h0,io_regs_25}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_26 = {32'h0,io_regs_26}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_27 = {32'h0,io_regs_27}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_28 = {32'h0,io_regs_28}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_29 = {32'h0,io_regs_29}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_30 = {32'h0,io_regs_30}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  assign difftestGRegState_gpr_31 = {32'h0,io_regs_31}; // @[\\src\\main\\scala\\difftest\\Difftest.scala 163:39]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_valid <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_valid <= io_commit_0_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_pc <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_pc <= io_commit_0_pc; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_instr <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_instr <= io_commit_0_instr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_rfWen <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_rfWen <= io_commit_0_rfWen; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_wdest <= 5'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_wdest <= io_commit_0_wdest; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_wdata <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_wdata <= io_commit_0_wdata; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_isCntInst <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_isCntInst <= io_commit_0_isCntInst; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_csrRstat <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_csrRstat <= io_commit_0_csrRstat; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_csrData <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_csrData <= io_commit_0_csrData; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_excpFlush <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_excpFlush <= io_commit_0_excpFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_ertnFlush <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_ertnFlush <= io_commit_0_ertnFlush; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_csrEcode <= 6'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_csrEcode <= io_commit_0_csrEcode; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_trap <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_trap <= io_commit_0_trap; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_load_valid <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_load_valid <= io_commit_0_load_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_load_paddr <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_load_paddr <= io_commit_0_load_paddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_load_vaddr <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_load_vaddr <= io_commit_0_load_vaddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_store_valid <= 1'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_store_valid <= io_commit_0_store_valid; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_store_paddr <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_store_paddr <= io_commit_0_store_paddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_store_vaddr <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_store_vaddr <= io_commit_0_store_vaddr; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
      cmt_0_store_data <= 32'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 166:20]
    end else begin
      cmt_0_store_data <= io_commit_0_store_data; // @[\\src\\main\\scala\\difftest\\Difftest.scala 168:7]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 167:27]
      cmtTimer64 <= 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 167:27]
    end else begin
      cmtTimer64 <= io_csr_timer64; // @[\\src\\main\\scala\\difftest\\Difftest.scala 169:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 171:25]
      cycleCnt <= 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 171:25]
    end else begin
      cycleCnt <= _cycleCnt_T_1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 173:12]
    end
    if (reset) begin // @[\\src\\main\\scala\\difftest\\Difftest.scala 172:25]
      instrCnt <= 64'h0; // @[\\src\\main\\scala\\difftest\\Difftest.scala 172:25]
    end else begin
      instrCnt <= _instrCnt_T_1; // @[\\src\\main\\scala\\difftest\\Difftest.scala 174:12]
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
  cmt_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cmt_0_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cmt_0_instr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cmt_0_rfWen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cmt_0_wdest = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  cmt_0_wdata = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cmt_0_isCntInst = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  cmt_0_csrRstat = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cmt_0_csrData = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  cmt_0_excpFlush = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cmt_0_ertnFlush = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cmt_0_csrEcode = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  cmt_0_trap = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  cmt_0_load_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cmt_0_load_paddr = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  cmt_0_load_vaddr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  cmt_0_store_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  cmt_0_store_paddr = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  cmt_0_store_vaddr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  cmt_0_store_data = _RAND_19[31:0];
  _RAND_20 = {2{`RANDOM}};
  cmtTimer64 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  cycleCnt = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  instrCnt = _RAND_22[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
