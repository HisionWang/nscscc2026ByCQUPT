// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"

extern "C" void v_difftest_InstrCommit(char coreid, char index, svBit valid, long long pc, int instr, svBit skip, svBit is_TLBFILL, char TLBFILL_index, svBit is_CNTinst, long long timer_64_value, svBit wen, char wdest, long long wdata, svBit csr_rstat, int csr_data);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_InstrCommit_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*0:0*/ valid, QData/*63:0*/ pc, IData/*31:0*/ instr, CData/*0:0*/ skip, CData/*0:0*/ is_TLBFILL, CData/*7:0*/ TLBFILL_index, CData/*0:0*/ is_CNTinst, QData/*63:0*/ timer_64_value, CData/*0:0*/ wen, CData/*7:0*/ wdest, QData/*63:0*/ wdata, CData/*0:0*/ csr_rstat, IData/*31:0*/ csr_data) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_InstrCommit_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    char index__Vcvt;
    index__Vcvt = index;
    svBit valid__Vcvt;
    valid__Vcvt = valid;
    long long pc__Vcvt;
    pc__Vcvt = pc;
    int instr__Vcvt;
    instr__Vcvt = instr;
    svBit skip__Vcvt;
    skip__Vcvt = skip;
    svBit is_TLBFILL__Vcvt;
    is_TLBFILL__Vcvt = is_TLBFILL;
    char TLBFILL_index__Vcvt;
    TLBFILL_index__Vcvt = TLBFILL_index;
    svBit is_CNTinst__Vcvt;
    is_CNTinst__Vcvt = is_CNTinst;
    long long timer_64_value__Vcvt;
    timer_64_value__Vcvt = timer_64_value;
    svBit wen__Vcvt;
    wen__Vcvt = wen;
    char wdest__Vcvt;
    wdest__Vcvt = wdest;
    long long wdata__Vcvt;
    wdata__Vcvt = wdata;
    svBit csr_rstat__Vcvt;
    csr_rstat__Vcvt = csr_rstat;
    int csr_data__Vcvt;
    csr_data__Vcvt = csr_data;
    v_difftest_InstrCommit(coreid__Vcvt, index__Vcvt, valid__Vcvt, pc__Vcvt, instr__Vcvt, skip__Vcvt, is_TLBFILL__Vcvt, TLBFILL_index__Vcvt, is_CNTinst__Vcvt, timer_64_value__Vcvt, wen__Vcvt, wdest__Vcvt, wdata__Vcvt, csr_rstat__Vcvt, csr_data__Vcvt);
}

extern "C" void v_difftest_ExcpEvent(char coreid, char excp_valid, svBit eret, int intrNo, int cause, long long exceptionPC, int exceptionInst);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_ExcpEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ excp_valid, CData/*0:0*/ eret, IData/*31:0*/ intrNo, IData/*31:0*/ cause, QData/*63:0*/ exceptionPC, IData/*31:0*/ exceptionInst) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_ExcpEvent_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    char excp_valid__Vcvt;
    excp_valid__Vcvt = excp_valid;
    svBit eret__Vcvt;
    eret__Vcvt = eret;
    int intrNo__Vcvt;
    intrNo__Vcvt = intrNo;
    int cause__Vcvt;
    cause__Vcvt = cause;
    long long exceptionPC__Vcvt;
    exceptionPC__Vcvt = exceptionPC;
    int exceptionInst__Vcvt;
    exceptionInst__Vcvt = exceptionInst;
    v_difftest_ExcpEvent(coreid__Vcvt, excp_valid__Vcvt, eret__Vcvt, intrNo__Vcvt, cause__Vcvt, exceptionPC__Vcvt, exceptionInst__Vcvt);
}

extern "C" void v_difftest_TrapEvent(char coreid, svBit valid, char code, long long pc, long long cycleCnt, long long instrCnt);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_TrapEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*0:0*/ valid, CData/*7:0*/ code, QData/*63:0*/ pc, QData/*63:0*/ cycleCnt, QData/*63:0*/ instrCnt) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_TrapEvent_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    svBit valid__Vcvt;
    valid__Vcvt = valid;
    char code__Vcvt;
    code__Vcvt = code;
    long long pc__Vcvt;
    pc__Vcvt = pc;
    long long cycleCnt__Vcvt;
    cycleCnt__Vcvt = cycleCnt;
    long long instrCnt__Vcvt;
    instrCnt__Vcvt = instrCnt;
    v_difftest_TrapEvent(coreid__Vcvt, valid__Vcvt, code__Vcvt, pc__Vcvt, cycleCnt__Vcvt, instrCnt__Vcvt);
}

extern "C" void v_difftest_StoreEvent(char coreid, char index, char valid, long long storePAddr, long long storeVAddr, long long storeData);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_StoreEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*7:0*/ valid, QData/*63:0*/ storePAddr, QData/*63:0*/ storeVAddr, QData/*63:0*/ storeData) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_StoreEvent_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    char index__Vcvt;
    index__Vcvt = index;
    char valid__Vcvt;
    valid__Vcvt = valid;
    long long storePAddr__Vcvt;
    storePAddr__Vcvt = storePAddr;
    long long storeVAddr__Vcvt;
    storeVAddr__Vcvt = storeVAddr;
    long long storeData__Vcvt;
    storeData__Vcvt = storeData;
    v_difftest_StoreEvent(coreid__Vcvt, index__Vcvt, valid__Vcvt, storePAddr__Vcvt, storeVAddr__Vcvt, storeData__Vcvt);
}

extern "C" void v_difftest_LoadEvent(char coreid, char index, char valid, long long paddr, long long vaddr);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_LoadEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*7:0*/ valid, QData/*63:0*/ paddr, QData/*63:0*/ vaddr) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_LoadEvent_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    char index__Vcvt;
    index__Vcvt = index;
    char valid__Vcvt;
    valid__Vcvt = valid;
    long long paddr__Vcvt;
    paddr__Vcvt = paddr;
    long long vaddr__Vcvt;
    vaddr__Vcvt = vaddr;
    v_difftest_LoadEvent(coreid__Vcvt, index__Vcvt, valid__Vcvt, paddr__Vcvt, vaddr__Vcvt);
}

extern "C" void v_difftest_CSRRegState(char coreid, long long crmd, long long prmd, long long euen, long long ecfg, long long estat, long long era, long long badv, long long eentry, long long tlbidx, long long tlbehi, long long tlbelo0, long long tlbelo1, long long asid, long long pgdl, long long pgdh, long long save0, long long save1, long long save2, long long save3, long long tid, long long tcfg, long long tval, long long ticlr, long long llbctl, long long tlbrentry, long long dmw0, long long dmw1);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_CSRRegState_TOP____024unit(CData/*7:0*/ coreid, QData/*63:0*/ crmd, QData/*63:0*/ prmd, QData/*63:0*/ euen, QData/*63:0*/ ecfg, QData/*63:0*/ estat, QData/*63:0*/ era, QData/*63:0*/ badv, QData/*63:0*/ eentry, QData/*63:0*/ tlbidx, QData/*63:0*/ tlbehi, QData/*63:0*/ tlbelo0, QData/*63:0*/ tlbelo1, QData/*63:0*/ asid, QData/*63:0*/ pgdl, QData/*63:0*/ pgdh, QData/*63:0*/ save0, QData/*63:0*/ save1, QData/*63:0*/ save2, QData/*63:0*/ save3, QData/*63:0*/ tid, QData/*63:0*/ tcfg, QData/*63:0*/ tval, QData/*63:0*/ ticlr, QData/*63:0*/ llbctl, QData/*63:0*/ tlbrentry, QData/*63:0*/ dmw0, QData/*63:0*/ dmw1) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_CSRRegState_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    long long crmd__Vcvt;
    crmd__Vcvt = crmd;
    long long prmd__Vcvt;
    prmd__Vcvt = prmd;
    long long euen__Vcvt;
    euen__Vcvt = euen;
    long long ecfg__Vcvt;
    ecfg__Vcvt = ecfg;
    long long estat__Vcvt;
    estat__Vcvt = estat;
    long long era__Vcvt;
    era__Vcvt = era;
    long long badv__Vcvt;
    badv__Vcvt = badv;
    long long eentry__Vcvt;
    eentry__Vcvt = eentry;
    long long tlbidx__Vcvt;
    tlbidx__Vcvt = tlbidx;
    long long tlbehi__Vcvt;
    tlbehi__Vcvt = tlbehi;
    long long tlbelo0__Vcvt;
    tlbelo0__Vcvt = tlbelo0;
    long long tlbelo1__Vcvt;
    tlbelo1__Vcvt = tlbelo1;
    long long asid__Vcvt;
    asid__Vcvt = asid;
    long long pgdl__Vcvt;
    pgdl__Vcvt = pgdl;
    long long pgdh__Vcvt;
    pgdh__Vcvt = pgdh;
    long long save0__Vcvt;
    save0__Vcvt = save0;
    long long save1__Vcvt;
    save1__Vcvt = save1;
    long long save2__Vcvt;
    save2__Vcvt = save2;
    long long save3__Vcvt;
    save3__Vcvt = save3;
    long long tid__Vcvt;
    tid__Vcvt = tid;
    long long tcfg__Vcvt;
    tcfg__Vcvt = tcfg;
    long long tval__Vcvt;
    tval__Vcvt = tval;
    long long ticlr__Vcvt;
    ticlr__Vcvt = ticlr;
    long long llbctl__Vcvt;
    llbctl__Vcvt = llbctl;
    long long tlbrentry__Vcvt;
    tlbrentry__Vcvt = tlbrentry;
    long long dmw0__Vcvt;
    dmw0__Vcvt = dmw0;
    long long dmw1__Vcvt;
    dmw1__Vcvt = dmw1;
    v_difftest_CSRRegState(coreid__Vcvt, crmd__Vcvt, prmd__Vcvt, euen__Vcvt, ecfg__Vcvt, estat__Vcvt, era__Vcvt, badv__Vcvt, eentry__Vcvt, tlbidx__Vcvt, tlbehi__Vcvt, tlbelo0__Vcvt, tlbelo1__Vcvt, asid__Vcvt, pgdl__Vcvt, pgdh__Vcvt, save0__Vcvt, save1__Vcvt, save2__Vcvt, save3__Vcvt, tid__Vcvt, tcfg__Vcvt, tval__Vcvt, ticlr__Vcvt, llbctl__Vcvt, tlbrentry__Vcvt, dmw0__Vcvt, dmw1__Vcvt);
}

extern "C" void v_difftest_GRegState(char coreid, long long gpr_0, long long gpr_1, long long gpr_2, long long gpr_3, long long gpr_4, long long gpr_5, long long gpr_6, long long gpr_7, long long gpr_8, long long gpr_9, long long gpr_10, long long gpr_11, long long gpr_12, long long gpr_13, long long gpr_14, long long gpr_15, long long gpr_16, long long gpr_17, long long gpr_18, long long gpr_19, long long gpr_20, long long gpr_21, long long gpr_22, long long gpr_23, long long gpr_24, long long gpr_25, long long gpr_26, long long gpr_27, long long gpr_28, long long gpr_29, long long gpr_30, long long gpr_31);

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_GRegState_TOP____024unit(CData/*7:0*/ coreid, QData/*63:0*/ gpr_0, QData/*63:0*/ gpr_1, QData/*63:0*/ gpr_2, QData/*63:0*/ gpr_3, QData/*63:0*/ gpr_4, QData/*63:0*/ gpr_5, QData/*63:0*/ gpr_6, QData/*63:0*/ gpr_7, QData/*63:0*/ gpr_8, QData/*63:0*/ gpr_9, QData/*63:0*/ gpr_10, QData/*63:0*/ gpr_11, QData/*63:0*/ gpr_12, QData/*63:0*/ gpr_13, QData/*63:0*/ gpr_14, QData/*63:0*/ gpr_15, QData/*63:0*/ gpr_16, QData/*63:0*/ gpr_17, QData/*63:0*/ gpr_18, QData/*63:0*/ gpr_19, QData/*63:0*/ gpr_20, QData/*63:0*/ gpr_21, QData/*63:0*/ gpr_22, QData/*63:0*/ gpr_23, QData/*63:0*/ gpr_24, QData/*63:0*/ gpr_25, QData/*63:0*/ gpr_26, QData/*63:0*/ gpr_27, QData/*63:0*/ gpr_28, QData/*63:0*/ gpr_29, QData/*63:0*/ gpr_30, QData/*63:0*/ gpr_31) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vsimu_top___024unit____Vdpiimwrap_v_difftest_GRegState_TOP____024unit\n"); );
    // Body
    char coreid__Vcvt;
    coreid__Vcvt = coreid;
    long long gpr_0__Vcvt;
    gpr_0__Vcvt = gpr_0;
    long long gpr_1__Vcvt;
    gpr_1__Vcvt = gpr_1;
    long long gpr_2__Vcvt;
    gpr_2__Vcvt = gpr_2;
    long long gpr_3__Vcvt;
    gpr_3__Vcvt = gpr_3;
    long long gpr_4__Vcvt;
    gpr_4__Vcvt = gpr_4;
    long long gpr_5__Vcvt;
    gpr_5__Vcvt = gpr_5;
    long long gpr_6__Vcvt;
    gpr_6__Vcvt = gpr_6;
    long long gpr_7__Vcvt;
    gpr_7__Vcvt = gpr_7;
    long long gpr_8__Vcvt;
    gpr_8__Vcvt = gpr_8;
    long long gpr_9__Vcvt;
    gpr_9__Vcvt = gpr_9;
    long long gpr_10__Vcvt;
    gpr_10__Vcvt = gpr_10;
    long long gpr_11__Vcvt;
    gpr_11__Vcvt = gpr_11;
    long long gpr_12__Vcvt;
    gpr_12__Vcvt = gpr_12;
    long long gpr_13__Vcvt;
    gpr_13__Vcvt = gpr_13;
    long long gpr_14__Vcvt;
    gpr_14__Vcvt = gpr_14;
    long long gpr_15__Vcvt;
    gpr_15__Vcvt = gpr_15;
    long long gpr_16__Vcvt;
    gpr_16__Vcvt = gpr_16;
    long long gpr_17__Vcvt;
    gpr_17__Vcvt = gpr_17;
    long long gpr_18__Vcvt;
    gpr_18__Vcvt = gpr_18;
    long long gpr_19__Vcvt;
    gpr_19__Vcvt = gpr_19;
    long long gpr_20__Vcvt;
    gpr_20__Vcvt = gpr_20;
    long long gpr_21__Vcvt;
    gpr_21__Vcvt = gpr_21;
    long long gpr_22__Vcvt;
    gpr_22__Vcvt = gpr_22;
    long long gpr_23__Vcvt;
    gpr_23__Vcvt = gpr_23;
    long long gpr_24__Vcvt;
    gpr_24__Vcvt = gpr_24;
    long long gpr_25__Vcvt;
    gpr_25__Vcvt = gpr_25;
    long long gpr_26__Vcvt;
    gpr_26__Vcvt = gpr_26;
    long long gpr_27__Vcvt;
    gpr_27__Vcvt = gpr_27;
    long long gpr_28__Vcvt;
    gpr_28__Vcvt = gpr_28;
    long long gpr_29__Vcvt;
    gpr_29__Vcvt = gpr_29;
    long long gpr_30__Vcvt;
    gpr_30__Vcvt = gpr_30;
    long long gpr_31__Vcvt;
    gpr_31__Vcvt = gpr_31;
    v_difftest_GRegState(coreid__Vcvt, gpr_0__Vcvt, gpr_1__Vcvt, gpr_2__Vcvt, gpr_3__Vcvt, gpr_4__Vcvt, gpr_5__Vcvt, gpr_6__Vcvt, gpr_7__Vcvt, gpr_8__Vcvt, gpr_9__Vcvt, gpr_10__Vcvt, gpr_11__Vcvt, gpr_12__Vcvt, gpr_13__Vcvt, gpr_14__Vcvt, gpr_15__Vcvt, gpr_16__Vcvt, gpr_17__Vcvt, gpr_18__Vcvt, gpr_19__Vcvt, gpr_20__Vcvt, gpr_21__Vcvt, gpr_22__Vcvt, gpr_23__Vcvt, gpr_24__Vcvt, gpr_25__Vcvt, gpr_26__Vcvt, gpr_27__Vcvt, gpr_28__Vcvt, gpr_29__Vcvt, gpr_30__Vcvt, gpr_31__Vcvt);
}
