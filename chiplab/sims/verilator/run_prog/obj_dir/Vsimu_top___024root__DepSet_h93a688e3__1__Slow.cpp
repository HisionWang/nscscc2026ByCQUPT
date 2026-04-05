// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"
#include "Vsimu_top___024root.h"

VL_ATTR_COLD void Vsimu_top___024root___eval_triggers__stl(Vsimu_top___024root* vlSelf);
VL_ATTR_COLD void Vsimu_top___024root___eval_stl(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD bool Vsimu_top___024root___eval_phase__stl(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vsimu_top___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vsimu_top___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__ico(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__act(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @([hybrid] simu_top.soc.AXI_SLAVE_MUX.wr_addr_hit)\n");
    }
    if ((2ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @([hybrid] simu_top.soc.cpu.u_excute.change_nextpc_to_brtarget or [hybrid] simu_top.soc.cpu.u_excute.change_nextpc_to_seq)\n");
    }
    if ((4ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @([hybrid] simu_top.soc.cpu.u_i_cache.u_cache_data.or_tree_way0)\n");
    }
    if ((8ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 3 is active: @([hybrid] simu_top.soc.cpu.u_i_cache.u_cache_data.or_tree_way1)\n");
    }
    if ((0x10ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 4 is active: @([hybrid] simu_top.soc.cpu.u_d_cache.u_cache_data.or_tree_way0)\n");
    }
    if ((0x20ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 5 is active: @([hybrid] simu_top.soc.cpu.u_d_cache.u_cache_data.or_tree_way1)\n");
    }
    if ((0x40ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 6 is active: @(posedge DifftestExcpEvent.clock)\n");
    }
    if ((0x80ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 7 is active: @(posedge DifftestTrapEvent.clock)\n");
    }
    if ((0x100ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 8 is active: @(posedge DifftestStoreEvent.clock)\n");
    }
    if ((0x200ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 9 is active: @(posedge DifftestLoadEvent.clock)\n");
    }
    if ((0x400ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 10 is active: @(posedge DifftestCSRRegState.clock)\n");
    }
    if ((0x800ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 11 is active: @(posedge DifftestGRegState.clock)\n");
    }
    if ((0x1000ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 12 is active: @(posedge pclk)\n");
    }
    if ((0x2000ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 13 is active: @(posedge aclk)\n");
    }
    if ((0x4000ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 14 is active: @(negedge aclk)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__nba(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @([hybrid] simu_top.soc.AXI_SLAVE_MUX.wr_addr_hit)\n");
    }
    if ((2ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @([hybrid] simu_top.soc.cpu.u_excute.change_nextpc_to_brtarget or [hybrid] simu_top.soc.cpu.u_excute.change_nextpc_to_seq)\n");
    }
    if ((4ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @([hybrid] simu_top.soc.cpu.u_i_cache.u_cache_data.or_tree_way0)\n");
    }
    if ((8ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 3 is active: @([hybrid] simu_top.soc.cpu.u_i_cache.u_cache_data.or_tree_way1)\n");
    }
    if ((0x10ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 4 is active: @([hybrid] simu_top.soc.cpu.u_d_cache.u_cache_data.or_tree_way0)\n");
    }
    if ((0x20ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 5 is active: @([hybrid] simu_top.soc.cpu.u_d_cache.u_cache_data.or_tree_way1)\n");
    }
    if ((0x40ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 6 is active: @(posedge DifftestExcpEvent.clock)\n");
    }
    if ((0x80ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 7 is active: @(posedge DifftestTrapEvent.clock)\n");
    }
    if ((0x100ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 8 is active: @(posedge DifftestStoreEvent.clock)\n");
    }
    if ((0x200ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 9 is active: @(posedge DifftestLoadEvent.clock)\n");
    }
    if ((0x400ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 10 is active: @(posedge DifftestCSRRegState.clock)\n");
    }
    if ((0x800ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 11 is active: @(posedge DifftestGRegState.clock)\n");
    }
    if ((0x1000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 12 is active: @(posedge pclk)\n");
    }
    if ((0x2000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 13 is active: @(posedge aclk)\n");
    }
    if ((0x4000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 14 is active: @(negedge aclk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsimu_top___024root___ctor_var_reset(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->DifftestExcpEvent__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestExcpEvent__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->excp_valid = VL_RAND_RESET_I(1);
    vlSelf->eret = VL_RAND_RESET_I(1);
    vlSelf->intrNo = VL_RAND_RESET_I(32);
    vlSelf->cause = VL_RAND_RESET_I(32);
    vlSelf->exceptionPC = VL_RAND_RESET_Q(64);
    vlSelf->exceptionInst = VL_RAND_RESET_I(32);
    vlSelf->DifftestTrapEvent__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestTrapEvent__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->DifftestTrapEvent__02Evalid = VL_RAND_RESET_I(1);
    vlSelf->code = VL_RAND_RESET_I(3);
    vlSelf->pc = VL_RAND_RESET_Q(64);
    vlSelf->cycleCnt = VL_RAND_RESET_Q(64);
    vlSelf->instrCnt = VL_RAND_RESET_Q(64);
    vlSelf->DifftestStoreEvent__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestStoreEvent__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->DifftestStoreEvent__02Eindex = VL_RAND_RESET_I(8);
    vlSelf->DifftestStoreEvent__02Evalid = VL_RAND_RESET_I(8);
    vlSelf->storePAddr = VL_RAND_RESET_Q(64);
    vlSelf->storeVAddr = VL_RAND_RESET_Q(64);
    vlSelf->storeData = VL_RAND_RESET_Q(64);
    vlSelf->DifftestLoadEvent__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestLoadEvent__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->DifftestLoadEvent__02Eindex = VL_RAND_RESET_I(8);
    vlSelf->DifftestLoadEvent__02Evalid = VL_RAND_RESET_I(8);
    vlSelf->paddr = VL_RAND_RESET_Q(64);
    vlSelf->vaddr = VL_RAND_RESET_Q(64);
    vlSelf->DifftestCSRRegState__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestCSRRegState__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->crmd = VL_RAND_RESET_Q(64);
    vlSelf->prmd = VL_RAND_RESET_Q(64);
    vlSelf->euen = VL_RAND_RESET_Q(64);
    vlSelf->ecfg = VL_RAND_RESET_Q(64);
    vlSelf->estat = VL_RAND_RESET_Q(64);
    vlSelf->era = VL_RAND_RESET_Q(64);
    vlSelf->badv = VL_RAND_RESET_Q(64);
    vlSelf->eentry = VL_RAND_RESET_Q(64);
    vlSelf->tlbidx = VL_RAND_RESET_Q(64);
    vlSelf->tlbehi = VL_RAND_RESET_Q(64);
    vlSelf->tlbelo0 = VL_RAND_RESET_Q(64);
    vlSelf->tlbelo1 = VL_RAND_RESET_Q(64);
    vlSelf->asid = VL_RAND_RESET_Q(64);
    vlSelf->pgdl = VL_RAND_RESET_Q(64);
    vlSelf->pgdh = VL_RAND_RESET_Q(64);
    vlSelf->save0 = VL_RAND_RESET_Q(64);
    vlSelf->save1 = VL_RAND_RESET_Q(64);
    vlSelf->save2 = VL_RAND_RESET_Q(64);
    vlSelf->save3 = VL_RAND_RESET_Q(64);
    vlSelf->tid = VL_RAND_RESET_Q(64);
    vlSelf->tcfg = VL_RAND_RESET_Q(64);
    vlSelf->tval = VL_RAND_RESET_Q(64);
    vlSelf->ticlr = VL_RAND_RESET_Q(64);
    vlSelf->llbctl = VL_RAND_RESET_Q(64);
    vlSelf->tlbrentry = VL_RAND_RESET_Q(64);
    vlSelf->dmw0 = VL_RAND_RESET_Q(64);
    vlSelf->dmw1 = VL_RAND_RESET_Q(64);
    vlSelf->DifftestGRegState__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->DifftestGRegState__02Ecoreid = VL_RAND_RESET_I(8);
    vlSelf->gpr_0 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_1 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_2 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_3 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_4 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_5 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_6 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_7 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_8 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_9 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_10 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_11 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_12 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_13 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_14 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_15 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_16 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_17 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_18 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_19 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_20 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_21 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_22 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_23 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_24 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_25 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_26 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_27 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_28 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_29 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_30 = VL_RAND_RESET_Q(64);
    vlSelf->gpr_31 = VL_RAND_RESET_Q(64);
    vlSelf->one_valid_n__02Ein = VL_RAND_RESET_I(16);
    vlSelf->out = VL_RAND_RESET_I(16);
    vlSelf->nozero = VL_RAND_RESET_I(1);
    vlSelf->nand_type = VL_RAND_RESET_I(2);
    vlSelf->pclk = VL_RAND_RESET_I(1);
    vlSelf->prst_ = VL_RAND_RESET_I(1);
    vlSelf->psel = VL_RAND_RESET_I(1);
    vlSelf->penable = VL_RAND_RESET_I(1);
    vlSelf->pwrite = VL_RAND_RESET_I(1);
    vlSelf->ADDR = VL_RAND_RESET_I(11);
    vlSelf->DAT_I = VL_RAND_RESET_I(32);
    vlSelf->DAT_O = VL_RAND_RESET_I(32);
    vlSelf->NAND_CE_o = VL_RAND_RESET_I(4);
    vlSelf->NAND_REQ = VL_RAND_RESET_I(1);
    vlSelf->NAND_I = VL_RAND_RESET_I(8);
    vlSelf->NAND_O = VL_RAND_RESET_I(8);
    vlSelf->NAND_EN_ = VL_RAND_RESET_I(1);
    vlSelf->NAND_ALE = VL_RAND_RESET_I(1);
    vlSelf->NAND_CLE = VL_RAND_RESET_I(1);
    vlSelf->NAND_WR_ = VL_RAND_RESET_I(1);
    vlSelf->NAND_RD_ = VL_RAND_RESET_I(1);
    vlSelf->NAND_IORDY_i = VL_RAND_RESET_I(4);
    vlSelf->nand_int = VL_RAND_RESET_I(1);
    vlSelf->aclk = VL_RAND_RESET_I(1);
    vlSelf->aresetn = VL_RAND_RESET_I(1);
    vlSelf->enable_delay = VL_RAND_RESET_I(1);
    vlSelf->random_seed = VL_RAND_RESET_I(23);
    vlSelf->ram_ren = VL_RAND_RESET_I(1);
    vlSelf->ram_raddr = VL_RAND_RESET_I(32);
    vlSelf->ram_rdata = VL_RAND_RESET_I(32);
    vlSelf->ram_wen = VL_RAND_RESET_I(4);
    vlSelf->ram_waddr = VL_RAND_RESET_I(32);
    vlSelf->ram_wdata = VL_RAND_RESET_I(32);
    vlSelf->debug0_wb_pc = VL_RAND_RESET_I(32);
    vlSelf->debug0_wb_rf_wen = VL_RAND_RESET_I(1);
    vlSelf->debug0_wb_rf_wnum = VL_RAND_RESET_I(5);
    vlSelf->debug0_wb_rf_wdata = VL_RAND_RESET_I(32);
    vlSelf->num_data = VL_RAND_RESET_I(32);
    vlSelf->open_trace = VL_RAND_RESET_I(1);
    vlSelf->num_monitor = VL_RAND_RESET_I(1);
    vlSelf->confreg_uart_data = VL_RAND_RESET_I(8);
    vlSelf->write_uart_valid = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(128, vlSelf->uart_ctr_bus);
    vlSelf->uart_rx = VL_RAND_RESET_I(1);
    vlSelf->uart_tx = VL_RAND_RESET_I(1);
    vlSelf->led = VL_RAND_RESET_I(16);
    vlSelf->led_rg0 = VL_RAND_RESET_I(2);
    vlSelf->led_rg1 = VL_RAND_RESET_I(2);
    vlSelf->num_csn = VL_RAND_RESET_I(8);
    vlSelf->num_a_g = VL_RAND_RESET_I(7);
    vlSelf->__SYM__switch = VL_RAND_RESET_I(8);
    vlSelf->btn_key_col = VL_RAND_RESET_I(4);
    vlSelf->btn_key_row = VL_RAND_RESET_I(4);
    vlSelf->btn_step = VL_RAND_RESET_I(2);
    vlSelf->one_valid_16__02Ein = VL_RAND_RESET_I(16);
    vlSelf->one_valid_16__02Eout_en = VL_RAND_RESET_I(4);
    vlSelf->one_valid_32__02Ein = VL_RAND_RESET_I(32);
    vlSelf->one_valid_32__02Eout_en = VL_RAND_RESET_I(5);
    vlSelf->uart_rx__en0 = 0;
    vlSelf->NAND_top__DOT__REG_DAT_T = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_addr_c = VL_RAND_RESET_I(14);
    vlSelf->NAND_top__DOT__nand_addr_r = VL_RAND_RESET_I(25);
    vlSelf->NAND_top__DOT__nand_op_num = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_parameter = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_ce_map0 = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_ce_map1 = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_rdy_map0 = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_rdy_map1 = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_command = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__nand_timing = VL_RAND_RESET_I(16);
    vlSelf->NAND_top__DOT__addr_in_die = VL_RAND_RESET_Q(38);
    vlSelf->NAND_top__DOT__NAND_STATE = VL_RAND_RESET_I(5);
    vlSelf->NAND_top__DOT__NAND_OP_NUM = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__WRITE_MAX_COUNT = VL_RAND_RESET_I(14);
    vlSelf->NAND_top__DOT__READ_MAX_COUNT = VL_RAND_RESET_I(14);
    vlSelf->NAND_top__DOT__nand_clr_ack = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_DONE = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_CE_ = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NANDtag = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_IORDY = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT0 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT1 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT2 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT3 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT6 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT7 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT8 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT9 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT10 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__HIT11 = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_HIT = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_DMA_REQ = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__nand_cmd_valid = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__status = VL_RAND_RESET_I(8);
    vlSelf->NAND_top__DOT__nand_number = VL_RAND_RESET_I(2);
    vlSelf->NAND_top__DOT__ID_INFORM = VL_RAND_RESET_Q(48);
    vlSelf->NAND_top__DOT__NAND_DAT_O_RD = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__ADDR_pointer = VL_RAND_RESET_I(2);
    vlSelf->NAND_top__DOT__NAND_ADDR_COUNT = VL_RAND_RESET_I(3);
    vlSelf->NAND_top__DOT__WAIT_NUM = VL_RAND_RESET_I(8);
    vlSelf->NAND_top__DOT__HOLD_NUM = VL_RAND_RESET_I(8);
    vlSelf->NAND_top__DOT__COMMAND = VL_RAND_RESET_I(8);
    vlSelf->NAND_top__DOT__PRE_STATE = VL_RAND_RESET_I(5);
    vlSelf->NAND_top__DOT__READ_ID_NUM = VL_RAND_RESET_I(3);
    vlSelf->NAND_top__DOT__data_count = VL_RAND_RESET_I(14);
    vlSelf->NAND_top__DOT__NAND_ADDR = VL_RAND_RESET_Q(38);
    vlSelf->NAND_top__DOT__NAND_DAT_I_WR = VL_RAND_RESET_I(32);
    vlSelf->NAND_top__DOT__NAND_GO = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__NAND_ACK = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__DMA_OP_DONE = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__ERASE_SERIAL = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__now_up_half = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT__now_oob = VL_RAND_RESET_I(1);
    vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0 = 0;
    vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu_awaddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu_awsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu_awvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu_wvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_bvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_bready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_arid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu_araddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu_arsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_arready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu_rready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_awvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_awready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_wvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_bid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__m0_bresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__m0_bvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_bready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_arvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_arready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_rid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__m0_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__m0_rresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__m0_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__m0_rready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__s0_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_s_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_awready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_arready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__UART_RI = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__uart0_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__uart0_txd_oe = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__awlen = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__arlen = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ws_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__rf_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_e = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e_self = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e = VL_RAND_RESET_I(2);
    VL_RAND_RESET_W(352, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__excp_flush = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_pre_f = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_addr_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_size = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_addr_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_wr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_addr_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_R_data_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__cached_mt = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_nocache_data_sram_req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_addr = VL_RAND_RESET_I(14);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_data = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__next_pc = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ready_o = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_m_self = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_m = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e_self_2 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__both_data_sram_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mt = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mr_self = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_mr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ld_stall = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__pgda_out = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dmw0_out = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dmw1_out = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__read_state = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_1 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_0 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__inst_sram_req_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__data_cache_sram_req_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__data_nocache_sram_req_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__write_requst_state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__wt_drop_1 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__transfer_cnt = VL_RAND_RESET_I(6);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hd78ca973__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h7f9e438b__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h2feeed37__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hf8bbfd1c__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h276d363d__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_ha0e9c401__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__cached = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__drop_num = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__drop_one = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__hit = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__replace_cache = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__true_replace_cache = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__lru = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__transfer_cnt = VL_RAND_RESET_I(4);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__j = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__tag_way0[__Vi0] = VL_RAND_RESET_I(21);
    }
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__tag_way1[__Vi0] = VL_RAND_RESET_I(21);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__lru_r = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_sel = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__hit_r = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__lru_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__cached_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_sel_r = VL_RAND_RESET_I(16);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__wea = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__wea = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__1__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__2__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__3__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__4__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__5__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__6__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__7__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__8__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__9__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__10__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__11__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__12__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__13__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__14__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__15__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__size = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__cached = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drop_num = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drop_one = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drity_new_cacheline = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__hit = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__miss = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__write_back = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__replace_cache = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__true_replace_cache = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__lru = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__saved_addr = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__wb_buffer);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__j = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__tag_way0[__Vi0] = VL_RAND_RESET_I(22);
    }
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__tag_way1[__Vi0] = VL_RAND_RESET_I(22);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__lru_r = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_hbfaab181__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_h91e0ffe6__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_he8684a95__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_sel = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__hit_r = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__lru_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_sel_r = VL_RAND_RESET_I(16);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__wea = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__dina = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__wea = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__1__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__2__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__3__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__4__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__5__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__6__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__7__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__8__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__9__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__10__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__11__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__12__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__13__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__14__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__15__KET____DOT__bank_way1__ena = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__dmw0_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__dmw1_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__addr_o_r = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s1_asid = VL_RAND_RESET_I(10);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s1_odd_page = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__r_index = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn = VL_RAND_RESET_I(19);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_va_bit12 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid = VL_RAND_RESET_I(10);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____VdfgTmp_h089c879f__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____VdfgTmp_he8e7d759__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB = VL_RAND_RESET_I(16);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn[__Vi0] = VL_RAND_RESET_I(19);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid[__Vi0] = VL_RAND_RESET_I(10);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g[__Vi0] = VL_RAND_RESET_I(1);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn0[__Vi0] = VL_RAND_RESET_I(20);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv0[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat0[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d0[__Vi0] = VL_RAND_RESET_I(1);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v0[__Vi0] = VL_RAND_RESET_I(1);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn1[__Vi0] = VL_RAND_RESET_I(20);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv1[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat1[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d1[__Vi0] = VL_RAND_RESET_I(1);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v1[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_one = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__inst_buffer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__buffer_has = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__need_buffer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__next_pc = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__adef_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__adef_f_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT____VdfgTmp_h1a9d3870__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__load_op = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_we = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_mask = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_31_26_d = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_25_22_d = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_19_15_d = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2 = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__br_br_need_reg = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(65, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__valid_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_add_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sub_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slt = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_nor = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_and = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_or = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xor = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_addi_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sll_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sra_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srl_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_wu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_wu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_wu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrrd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrwr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ertn = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cpucfg = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_tlbwr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cacop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rk_d = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rd_d = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rj_d = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__src2_is_4 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_vaild = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2edf41db__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2d5aaf1b__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2986b060__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h640d2873__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__exe_is_branch = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__taglist[__Vi0] = VL_RAND_RESET_I(22);
    }
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__tarlist[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__typelist[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__dirlist[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__valid[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__j = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(352, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src1_buffer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src2_buffer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_src1_buffer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__src1_buffer_has = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_src2_buffer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__src2_buffer_has = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_1_buffer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer_has = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_2_buffer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer_has = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____Vcellinp__u_alu__rst = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__is_branch = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_eq_rd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_hc75054dd__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div_result = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_result = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__start_i = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__state = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__alu_src1_div = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__alu_src2_div = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__op_div_todiv = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_cnt = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__div_temp = VL_RAND_RESET_Q(33);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__cnt = VL_RAND_RESET_I(6);
    VL_RAND_RESET_W(65, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__dividend);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__divisor = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__temp_op1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__temp_op2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul__DOT__res_temp = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__req_able = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__data_ok = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__valid_rst = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(210, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__drop_num = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__drop_one = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__alu_result_m = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__final_result = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_byte_half_word = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_m_excp_r = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(202, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__m_excp = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ertn = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__valid_wb = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(233, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__flush_from_w = VL_RAND_RESET_I(1);
    VL_ZERO_RESET_W(69, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT__wait_m = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__dmw0_wen = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__dmw1_wen = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__tcfg_wen = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_crmd = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_prmd = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_estat = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_era = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_eentry = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tid = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tcfg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tval = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_ticlr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save0 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save3 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_ecfg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_badv = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_dmw0 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_dmw1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbehi = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbidx = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64 = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random = VL_RAND_RESET_I(23);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random_next = VL_RAND_RESET_I(23);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h2a1b7b08__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_wlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rresp = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid = VL_RAND_RESET_I(5);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[__Vi0] = VL_RAND_RESET_I(2);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[__Vi0] = VL_RAND_RESET_I(2);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready = VL_RAND_RESET_I(5);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[__Vi0] = VL_RAND_RESET_I(5);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_0 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_1 = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_ins = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_del = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit_int = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[__Vi0] = VL_RAND_RESET_I(3);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[__Vi0] = VL_RAND_RESET_I(3);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_ack_i = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datao_cpu = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_word_trans_cpu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_cpu = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr = VL_RAND_RESET_I(24);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_clk_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_reset_n_dma = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_req = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_ack = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_rw = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_enab = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_psel = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_addr = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datai = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datao = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__we = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl = VL_RAND_RESET_I(24);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t = VL_RAND_RESET_I(10);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__max_repeat_time = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_in = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_push_pulse = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt = VL_RAND_RESET_I(9);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next = VL_RAND_RESET_I(9);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out = VL_RAND_RESET_I(7);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1 = VL_RAND_RESET_I(4);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in = VL_RAND_RESET_I(11);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1 = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value = VL_RAND_RESET_I(10);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[__Vi0] = VL_RAND_RESET_I(3);
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1 = VL_RAND_RESET_I(4);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr_next = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr_next = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push_data = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr_next = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr_next = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas = VL_RAND_RESET_Q(45);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr0 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr3 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr4 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr5 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr6 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr7 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_data = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_data = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__simu_flag = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__io_simu = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__open_trace = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_monitor = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_flag = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state_count = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp = VL_RAND_RESET_I(16);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_flag = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_flag = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__count = VL_RAND_RESET_I(20);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__scan_data = VL_RAND_RESET_I(4);
    vlSelf->one_valid_32__DOT__coder__DOT__one__DOT____Vcellinp__one__in = VL_RAND_RESET_I(4);
    vlSelf->one_valid_32__DOT__coder__DOT__two__DOT____Vcellinp__one__in = VL_RAND_RESET_I(4);
    vlSelf->__VdfgTmp_hdfe4c776__0 = 0;
    vlSelf->__VdfgTmp_ha48ccdd0__0 = 0;
    vlSelf->__VdfgTmp_hf2689f3a__0 = 0;
    vlSelf->__VdfgTmp_h7603afda__0 = 0;
    vlSelf->__VdfgTmp_h095da02a__0 = 0;
    vlSelf->__VdfgTmp_hb146e4e1__0 = 0;
    vlSelf->__VdfgTmp_h476c5c0c__0 = 0;
    vlSelf->__VdfgTmp_h47fdcd53__0 = 0;
    vlSelf->__VdfgTmp_hbd45c071__0 = 0;
    vlSelf->__VdfgTmp_ha16d735d__0 = 0;
    vlSelf->__VdfgTmp_h6e525a2d__0 = 0;
    vlSelf->__VdfgTmp_h9ba6ddcc__0 = 0;
    vlSelf->__VdfgTmp_h405c1a80__0 = 0;
    vlSelf->__VdfgTmp_h5b0b239b__0 = 0;
    vlSelf->__VdfgTmp_h3ead788f__0 = 0;
    vlSelf->__VdfgTmp_hf5775b5c__0 = 0;
    vlSelf->__VdfgTmp_hcb2f5762__0 = 0;
    vlSelf->__VdfgTmp_hb57cfd67__0 = 0;
    vlSelf->__VdfgTmp_hcd0afc6c__0 = 0;
    vlSelf->__VdfgTmp_h87dda4e7__0 = 0;
    vlSelf->__VdfgTmp_h154a16ca__0 = 0;
    vlSelf->__VdfgTmp_h6f6a7daa__0 = 0;
    vlSelf->__VdfgTmp_hc8f24e6b__0 = 0;
    vlSelf->__VdfgTmp_h651600d2__0 = 0;
    vlSelf->__VdfgTmp_hb5163d10__0 = 0;
    vlSelf->__VdfgTmp_h21a339db__0 = 0;
    vlSelf->__VdfgTmp_h21b70596__0 = 0;
    vlSelf->__VdfgTmp_h21904653__0 = 0;
    vlSelf->__VdfgTmp_h21939a4c__0 = 0;
    vlSelf->__VdfgTmp_h219c8c41__0 = 0;
    vlSelf->__VdfgTmp_h215817df__0 = 0;
    vlSelf->__VdfgTmp_h2082e20c__0 = 0;
    vlSelf->__VdfgTmp_h208e684d__0 = 0;
    vlSelf->__VdfgTmp_h208a2720__0 = 0;
    vlSelf->__VdfgTmp_h217ffaed__0 = 0;
    vlSelf->__VdfgTmp_h2179e714__0 = 0;
    vlSelf->__VdfgTmp_hd4e85eca__0 = 0;
    vlSelf->__VdfgTmp_h13c5e328__0 = 0;
    vlSelf->__VdfgTmp_h13c76457__0 = 0;
    vlSelf->__VdfgTmp_h135e48e4__0 = 0;
    vlSelf->__VdfgTmp_h1342a9e5__0 = 0;
    vlSelf->__VdfgTmp_h1346c3f9__0 = 0;
    vlSelf->__VdfgTmp_h134a7ade__0 = 0;
    vlSelf->__VdfgTmp_h13e94c22__0 = 0;
    vlSelf->__VdfgTmp_h13bce2d7__0 = 0;
    vlSelf->__VdfgTmp_h13a27bd8__0 = 0;
    vlSelf->__VdfgTmp_h1342a081__0 = 0;
    vlSelf->__VdfgTmp_h128f8c69__0 = 0;
    vlSelf->__VdfgTmp_h136b781e__0 = 0;
    vlSelf->__VdfgTmp_h13c1e028__0 = 0;
    vlSelf->__VdfgTmp_h13dce739__0 = 0;
    vlSelf->__VdfgTmp_h13d82a6b__0 = 0;
    vlSelf->__VdfgTmp_h13fc2c66__0 = 0;
    vlSelf->__VdfgTmp_h13fb7483__0 = 0;
    vlSelf->__VdfgTmp_h160b9868__0 = 0;
    vlSelf->__VdfgTmp_h1607db17__0 = 0;
    vlSelf->__VdfgTmp_h161cab63__0 = 0;
    vlSelf->__VdfgTmp_h161f6232__0 = 0;
    vlSelf->__VdfgTmp_h1374e6be__0 = 0;
    vlSelf->__VdfgTmp_h1371a2b5__0 = 0;
    vlSelf->__VdfgTmp_h134db2cf__0 = 0;
    vlSelf->__VdfgTmp_h1348cb16__0 = 0;
    vlSelf->__VdfgTmp_h13253108__0 = 0;
    vlSelf->__VdfgTmp_h1320f97f__0 = 0;
    vlSelf->__VdfgTmp_h13954943__0 = 0;
    vlSelf->__VdfgTmp_h13900b4e__0 = 0;
    vlSelf->__VdfgTmp_h36715329__0 = 0;
    vlSelf->__VdfgTmp_hcd04e225__0 = 0;
    vlSelf->__Vtableidx4 = 0;
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_1 = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_0 = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__read_state = VL_RAND_RESET_I(2);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__wt_drop_1 = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__write_requst_state = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu_bready = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__transfer_cnt = VL_RAND_RESET_I(6);
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v0 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v1 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v1 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v2 = 0;
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvlsb__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v3 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__mem__v3 = 0;
    VL_RAND_RESET_W(210, vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_prmd = VL_RAND_RESET_I(32);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc = VL_RAND_RESET_I(16);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = VL_RAND_RESET_I(5);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out = VL_RAND_RESET_I(7);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = VL_RAND_RESET_I(4);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = VL_RAND_RESET_I(5);
    vlSelf->__Vdlyvdim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0;
    vlSelf->__Vdlyvval__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = VL_RAND_RESET_I(8);
    vlSelf->__Vdlyvset__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0;
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = VL_RAND_RESET_I(4);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = VL_RAND_RESET_I(8);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b = VL_RAND_RESET_I(8);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = VL_RAND_RESET_I(5);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count = VL_RAND_RESET_I(20);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count = VL_RAND_RESET_I(4);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count = VL_RAND_RESET_I(20);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count = VL_RAND_RESET_I(20);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count = VL_RAND_RESET_I(20);
    vlSelf->__Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer = VL_RAND_RESET_I(32);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__0 = VL_RAND_RESET_I(5);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0__0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1__0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0__0[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1__0[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__VstlDidInit = 0;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__1 = VL_RAND_RESET_I(5);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget__1 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq__1 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0__1[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1__1[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0__1[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1__1[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__Vtrigprevexpr___TOP__DifftestExcpEvent__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__DifftestTrapEvent__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__DifftestStoreEvent__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__DifftestLoadEvent__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__DifftestCSRRegState__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__DifftestGRegState__02Eclock__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__pclk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__aclk__0 = VL_RAND_RESET_I(1);
    vlSelf->__VactDidInit = 0;
    for (int __Vi0 = 0; __Vi0 < 19; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
