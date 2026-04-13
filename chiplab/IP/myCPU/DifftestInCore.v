module DifftestInCore(
  input         clock,
  input         reset,
  input         io_inst_valid_diff, // @[src/main/scala/difftest/Difftest.scala 156:14]
  input  [63:0] io_debug0_wb_pc // @[src/main/scala/difftest/Difftest.scala 156:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  difftestInstrCommit_clock; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [7:0] difftestInstrCommit_coreid; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [7:0] difftestInstrCommit_index; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_valid; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [63:0] difftestInstrCommit_pc; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [31:0] difftestInstrCommit_instr; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_skip; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_is_TLBFILL; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [4:0] difftestInstrCommit_TLBFILL_index; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_is_CNTinst; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [63:0] difftestInstrCommit_timer_64_value; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_wen; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [7:0] difftestInstrCommit_wdest; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [63:0] difftestInstrCommit_wdata; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestInstrCommit_csr_rstat; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire [63:0] difftestInstrCommit_csr_data; // @[src/main/scala/difftest/Difftest.scala 279:35]
  wire  difftestExcpEvent_clock; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire [7:0] difftestExcpEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire  difftestExcpEvent_excp_valid; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire  difftestExcpEvent_eret; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire [10:0] difftestExcpEvent_intrNo; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire [5:0] difftestExcpEvent_cause; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire [63:0] difftestExcpEvent_exceptionPC; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire [31:0] difftestExcpEvent_exceptionInst; // @[src/main/scala/difftest/Difftest.scala 298:33]
  wire  difftestTrapEvent_clock; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire [7:0] difftestTrapEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire  difftestTrapEvent_valid; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire [7:0] difftestTrapEvent_code; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire [63:0] difftestTrapEvent_pc; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire [63:0] difftestTrapEvent_cycleCnt; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire [63:0] difftestTrapEvent_instrCnt; // @[src/main/scala/difftest/Difftest.scala 308:33]
  wire  difftestStoreEvent_clock; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire [7:0] difftestStoreEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire [7:0] difftestStoreEvent_index; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire  difftestStoreEvent_valid; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire [63:0] difftestStoreEvent_storePAddr; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire [63:0] difftestStoreEvent_storeVAddr; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire [63:0] difftestStoreEvent_storeData; // @[src/main/scala/difftest/Difftest.scala 317:34]
  wire  difftestLoadEvent_clock; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire [7:0] difftestLoadEvent_coreid; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire [7:0] difftestLoadEvent_index; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire  difftestLoadEvent_valid; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire [63:0] difftestLoadEvent_paddr; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire [63:0] difftestLoadEvent_vaddr; // @[src/main/scala/difftest/Difftest.scala 326:33]
  wire  difftestCSRRegState_clock; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [7:0] difftestCSRRegState_coreid; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_crmd; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_prmd; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_euen; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_ecfg; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_estat; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_era; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_badv; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_eentry; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_tlbidx; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_tlbehi; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_tlbelo0; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_tlbelo1; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_asid; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_pgdl; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_pgdh; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_save0; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_save1; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_save2; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_save3; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_tid; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_tcfg; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_tval; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_ticlr; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_llbctl; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [63:0] difftestCSRRegState_tlbrentry; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_dmw0; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire [31:0] difftestCSRRegState_dmw1; // @[src/main/scala/difftest/Difftest.scala 334:35]
  wire  difftestGRegState_clock; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [7:0] difftestGRegState_coreid; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_0; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_1; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_2; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_3; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_4; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_5; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_6; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_7; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_8; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_9; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_10; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_11; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_12; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_13; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_14; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_15; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_16; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_17; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_18; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_19; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_20; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_21; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_22; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_23; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_24; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_25; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_26; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_27; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_28; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_29; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_30; // @[src/main/scala/difftest/Difftest.scala 365:33]
  wire [63:0] difftestGRegState_gpr_31; // @[src/main/scala/difftest/Difftest.scala 365:33]
  reg  cmt_valid; // @[src/main/scala/difftest/Difftest.scala 215:26]
  reg [63:0] cmt_pc; // @[src/main/scala/difftest/Difftest.scala 231:23]
  reg [63:0] cycleCnt; // @[src/main/scala/difftest/Difftest.scala 242:25]
  reg [63:0] instrCnt; // @[src/main/scala/difftest/Difftest.scala 243:25]
  wire [63:0] _cycleCnt_T_1 = cycleCnt + 64'h1; // @[src/main/scala/difftest/Difftest.scala 273:28]
  wire [63:0] _GEN_26 = {{63'd0}, io_inst_valid_diff}; // @[src/main/scala/difftest/Difftest.scala 274:28]
  wire [63:0] _instrCnt_T_1 = instrCnt + _GEN_26; // @[src/main/scala/difftest/Difftest.scala 274:28]
  DifftestInstrCommit difftestInstrCommit ( // @[src/main/scala/difftest/Difftest.scala 279:35]
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
  DifftestExcpEvent difftestExcpEvent ( // @[src/main/scala/difftest/Difftest.scala 298:33]
    .clock(difftestExcpEvent_clock),
    .coreid(difftestExcpEvent_coreid),
    .excp_valid(difftestExcpEvent_excp_valid),
    .eret(difftestExcpEvent_eret),
    .intrNo(difftestExcpEvent_intrNo),
    .cause(difftestExcpEvent_cause),
    .exceptionPC(difftestExcpEvent_exceptionPC),
    .exceptionInst(difftestExcpEvent_exceptionInst)
  );
  DifftestTrapEvent difftestTrapEvent ( // @[src/main/scala/difftest/Difftest.scala 308:33]
    .clock(difftestTrapEvent_clock),
    .coreid(difftestTrapEvent_coreid),
    .valid(difftestTrapEvent_valid),
    .code(difftestTrapEvent_code),
    .pc(difftestTrapEvent_pc),
    .cycleCnt(difftestTrapEvent_cycleCnt),
    .instrCnt(difftestTrapEvent_instrCnt)
  );
  DifftestStoreEvent difftestStoreEvent ( // @[src/main/scala/difftest/Difftest.scala 317:34]
    .clock(difftestStoreEvent_clock),
    .coreid(difftestStoreEvent_coreid),
    .index(difftestStoreEvent_index),
    .valid(difftestStoreEvent_valid),
    .storePAddr(difftestStoreEvent_storePAddr),
    .storeVAddr(difftestStoreEvent_storeVAddr),
    .storeData(difftestStoreEvent_storeData)
  );
  DifftestLoadEvent difftestLoadEvent ( // @[src/main/scala/difftest/Difftest.scala 326:33]
    .clock(difftestLoadEvent_clock),
    .coreid(difftestLoadEvent_coreid),
    .index(difftestLoadEvent_index),
    .valid(difftestLoadEvent_valid),
    .paddr(difftestLoadEvent_paddr),
    .vaddr(difftestLoadEvent_vaddr)
  );
  DifftestCSRRegState difftestCSRRegState ( // @[src/main/scala/difftest/Difftest.scala 334:35]
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
  DifftestGRegState difftestGRegState ( // @[src/main/scala/difftest/Difftest.scala 365:33]
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
  assign difftestInstrCommit_clock = clock; // @[src/main/scala/difftest/Difftest.scala 281:32]
  assign difftestInstrCommit_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 282:33]
  assign difftestInstrCommit_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 283:32]
  assign difftestInstrCommit_valid = cmt_valid; // @[src/main/scala/difftest/Difftest.scala 284:32]
  assign difftestInstrCommit_pc = cmt_pc; // @[src/main/scala/difftest/Difftest.scala 285:29]
  assign difftestInstrCommit_instr = 32'h0; // @[src/main/scala/difftest/Difftest.scala 286:32]
  assign difftestInstrCommit_skip = 1'h0; // @[src/main/scala/difftest/Difftest.scala 287:31]
  assign difftestInstrCommit_is_TLBFILL = 1'h0; // @[src/main/scala/difftest/Difftest.scala 288:37]
  assign difftestInstrCommit_TLBFILL_index = 5'h0; // @[src/main/scala/difftest/Difftest.scala 289:40]
  assign difftestInstrCommit_is_CNTinst = 1'h0; // @[src/main/scala/difftest/Difftest.scala 290:37]
  assign difftestInstrCommit_timer_64_value = 64'h0; // @[src/main/scala/difftest/Difftest.scala 291:41]
  assign difftestInstrCommit_wen = 1'h0; // @[src/main/scala/difftest/Difftest.scala 292:30]
  assign difftestInstrCommit_wdest = 8'h0; // @[src/main/scala/difftest/Difftest.scala 293:32]
  assign difftestInstrCommit_wdata = 64'h0; // @[src/main/scala/difftest/Difftest.scala 294:32]
  assign difftestInstrCommit_csr_rstat = 1'h0; // @[src/main/scala/difftest/Difftest.scala 295:36]
  assign difftestInstrCommit_csr_data = 64'h0; // @[src/main/scala/difftest/Difftest.scala 296:35]
  assign difftestExcpEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 299:30]
  assign difftestExcpEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 300:31]
  assign difftestExcpEvent_excp_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 301:35]
  assign difftestExcpEvent_eret = 1'h0; // @[src/main/scala/difftest/Difftest.scala 302:29]
  assign difftestExcpEvent_intrNo = 11'h0; // @[src/main/scala/difftest/Difftest.scala 303:53]
  assign difftestExcpEvent_cause = 6'h0; // @[src/main/scala/difftest/Difftest.scala 304:30]
  assign difftestExcpEvent_exceptionPC = cmt_pc; // @[src/main/scala/difftest/Difftest.scala 305:36]
  assign difftestExcpEvent_exceptionInst = 32'h0; // @[src/main/scala/difftest/Difftest.scala 306:38]
  assign difftestTrapEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 309:30]
  assign difftestTrapEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 310:31]
  assign difftestTrapEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 311:30]
  assign difftestTrapEvent_code = 8'h0; // @[src/main/scala/difftest/Difftest.scala 312:29]
  assign difftestTrapEvent_pc = cmt_pc; // @[src/main/scala/difftest/Difftest.scala 313:27]
  assign difftestTrapEvent_cycleCnt = cycleCnt; // @[src/main/scala/difftest/Difftest.scala 314:33]
  assign difftestTrapEvent_instrCnt = instrCnt; // @[src/main/scala/difftest/Difftest.scala 315:33]
  assign difftestStoreEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 318:31]
  assign difftestStoreEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 319:32]
  assign difftestStoreEvent_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 320:31]
  assign difftestStoreEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 321:31]
  assign difftestStoreEvent_storePAddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 322:36]
  assign difftestStoreEvent_storeVAddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 323:36]
  assign difftestStoreEvent_storeData = 64'h0; // @[src/main/scala/difftest/Difftest.scala 324:35]
  assign difftestLoadEvent_clock = clock; // @[src/main/scala/difftest/Difftest.scala 327:30]
  assign difftestLoadEvent_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 328:31]
  assign difftestLoadEvent_index = 8'h0; // @[src/main/scala/difftest/Difftest.scala 329:30]
  assign difftestLoadEvent_valid = 1'h0; // @[src/main/scala/difftest/Difftest.scala 330:30]
  assign difftestLoadEvent_paddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 331:30]
  assign difftestLoadEvent_vaddr = 64'h0; // @[src/main/scala/difftest/Difftest.scala 332:30]
  assign difftestCSRRegState_clock = clock; // @[src/main/scala/difftest/Difftest.scala 335:32]
  assign difftestCSRRegState_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 336:33]
  assign difftestCSRRegState_crmd = 32'h0; // @[src/main/scala/difftest/Difftest.scala 337:31]
  assign difftestCSRRegState_prmd = 32'h0; // @[src/main/scala/difftest/Difftest.scala 338:31]
  assign difftestCSRRegState_euen = 32'h0; // @[src/main/scala/difftest/Difftest.scala 339:31]
  assign difftestCSRRegState_ecfg = 32'h0; // @[src/main/scala/difftest/Difftest.scala 340:31]
  assign difftestCSRRegState_estat = 32'h0; // @[src/main/scala/difftest/Difftest.scala 341:32]
  assign difftestCSRRegState_era = 64'h0; // @[src/main/scala/difftest/Difftest.scala 342:30]
  assign difftestCSRRegState_badv = 64'h0; // @[src/main/scala/difftest/Difftest.scala 343:31]
  assign difftestCSRRegState_eentry = 64'h0; // @[src/main/scala/difftest/Difftest.scala 344:33]
  assign difftestCSRRegState_tlbidx = 32'h0; // @[src/main/scala/difftest/Difftest.scala 345:33]
  assign difftestCSRRegState_tlbehi = 64'h0; // @[src/main/scala/difftest/Difftest.scala 346:33]
  assign difftestCSRRegState_tlbelo0 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 347:34]
  assign difftestCSRRegState_tlbelo1 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 348:34]
  assign difftestCSRRegState_asid = 32'h0; // @[src/main/scala/difftest/Difftest.scala 349:31]
  assign difftestCSRRegState_pgdl = 64'h0; // @[src/main/scala/difftest/Difftest.scala 350:31]
  assign difftestCSRRegState_pgdh = 64'h0; // @[src/main/scala/difftest/Difftest.scala 351:31]
  assign difftestCSRRegState_save0 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 352:32]
  assign difftestCSRRegState_save1 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 353:32]
  assign difftestCSRRegState_save2 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 354:32]
  assign difftestCSRRegState_save3 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 355:32]
  assign difftestCSRRegState_tid = 64'h0; // @[src/main/scala/difftest/Difftest.scala 356:30]
  assign difftestCSRRegState_tcfg = 32'h0; // @[src/main/scala/difftest/Difftest.scala 357:31]
  assign difftestCSRRegState_tval = 64'h0; // @[src/main/scala/difftest/Difftest.scala 358:31]
  assign difftestCSRRegState_ticlr = 32'h0; // @[src/main/scala/difftest/Difftest.scala 359:32]
  assign difftestCSRRegState_llbctl = 32'h0; // @[src/main/scala/difftest/Difftest.scala 360:33]
  assign difftestCSRRegState_tlbrentry = 64'h0; // @[src/main/scala/difftest/Difftest.scala 361:36]
  assign difftestCSRRegState_dmw0 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 362:31]
  assign difftestCSRRegState_dmw1 = 32'h0; // @[src/main/scala/difftest/Difftest.scala 363:31]
  assign difftestGRegState_clock = clock; // @[src/main/scala/difftest/Difftest.scala 366:30]
  assign difftestGRegState_coreid = 8'h0; // @[src/main/scala/difftest/Difftest.scala 367:31]
  assign difftestGRegState_gpr_0 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 368:30]
  assign difftestGRegState_gpr_1 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 369:30]
  assign difftestGRegState_gpr_2 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 370:30]
  assign difftestGRegState_gpr_3 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 371:30]
  assign difftestGRegState_gpr_4 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 372:30]
  assign difftestGRegState_gpr_5 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 373:30]
  assign difftestGRegState_gpr_6 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 374:30]
  assign difftestGRegState_gpr_7 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 375:30]
  assign difftestGRegState_gpr_8 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 376:30]
  assign difftestGRegState_gpr_9 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 377:30]
  assign difftestGRegState_gpr_10 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 378:31]
  assign difftestGRegState_gpr_11 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 379:31]
  assign difftestGRegState_gpr_12 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 380:31]
  assign difftestGRegState_gpr_13 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 381:31]
  assign difftestGRegState_gpr_14 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 382:31]
  assign difftestGRegState_gpr_15 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 383:31]
  assign difftestGRegState_gpr_16 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 384:31]
  assign difftestGRegState_gpr_17 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 385:31]
  assign difftestGRegState_gpr_18 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 386:31]
  assign difftestGRegState_gpr_19 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 387:31]
  assign difftestGRegState_gpr_20 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 388:31]
  assign difftestGRegState_gpr_21 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 389:31]
  assign difftestGRegState_gpr_22 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 390:31]
  assign difftestGRegState_gpr_23 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 391:31]
  assign difftestGRegState_gpr_24 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 392:31]
  assign difftestGRegState_gpr_25 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 393:31]
  assign difftestGRegState_gpr_26 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 394:31]
  assign difftestGRegState_gpr_27 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 395:31]
  assign difftestGRegState_gpr_28 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 396:31]
  assign difftestGRegState_gpr_29 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 397:31]
  assign difftestGRegState_gpr_30 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 398:31]
  assign difftestGRegState_gpr_31 = 64'h0; // @[src/main/scala/difftest/Difftest.scala 399:31]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 215:26]
      cmt_valid <= 1'h0; // @[src/main/scala/difftest/Difftest.scala 215:26]
    end else begin
      cmt_valid <= io_inst_valid_diff;
    end
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 231:23]
      cmt_pc <= 64'h0; // @[src/main/scala/difftest/Difftest.scala 231:23]
    end else begin
      cmt_pc <= io_debug0_wb_pc;
    end
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 242:25]
      cycleCnt <= 64'h0; // @[src/main/scala/difftest/Difftest.scala 242:25]
    end else begin
      cycleCnt <= _cycleCnt_T_1;
    end
    if (reset) begin // @[src/main/scala/difftest/Difftest.scala 243:25]
      instrCnt <= 64'h0; // @[src/main/scala/difftest/Difftest.scala 243:25]
    end else begin
      instrCnt <= _instrCnt_T_1;
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
  cmt_valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  cmt_pc = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  cycleCnt = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  instrCnt = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
