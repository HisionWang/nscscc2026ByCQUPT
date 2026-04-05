// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vsimu_top__Syms.h"


void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vsimu_top___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0\n"); );
    // Init
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vsimu_top___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<3>/*95:0*/ __Vtemp_1;
    VlWide<3>/*95:0*/ __Vtemp_2;
    VlWide<7>/*223:0*/ __Vtemp_9;
    VlWide<16>/*511:0*/ __Vtemp_38;
    VlWide<16>/*511:0*/ __Vtemp_52;
    VlWide<16>/*511:0*/ __Vtemp_66;
    VlWide<7>/*223:0*/ __Vtemp_73;
    VlWide<3>/*95:0*/ __Vtemp_74;
    VlWide<8>/*255:0*/ __Vtemp_82;
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0U])) {
        bufp->chgCData(oldp+0,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0]),2);
        bufp->chgCData(oldp+1,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1]),2);
        bufp->chgCData(oldp+2,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2]),2);
        bufp->chgCData(oldp+3,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3]),2);
        bufp->chgCData(oldp+4,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4]),2);
        bufp->chgCData(oldp+5,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0]),2);
        bufp->chgCData(oldp+6,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1]),2);
        bufp->chgCData(oldp+7,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2]),2);
        bufp->chgCData(oldp+8,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3]),2);
        bufp->chgCData(oldp+9,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4]),2);
        bufp->chgIData(oldp+10,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+11,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+12,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+13,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+14,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+15,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+16,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+17,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+18,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+19,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+20,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+21,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+22,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+23,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+24,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+25,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+26,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+27,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+28,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+29,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+30,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+31,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+32,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+33,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+34,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+35,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+36,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+37,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+38,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+39,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+40,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+41,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+42,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+43,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+44,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+45,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+46,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+47,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+48,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+49,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+50,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+51,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+52,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+53,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+54,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+55,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+56,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+57,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+58,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+59,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+60,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+61,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+62,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+63,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+64,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+65,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+66,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+67,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+68,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+69,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+70,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+71,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+72,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgIData(oldp+73,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__unnamedblk1__DOT__i),32);
        bufp->chgBit(oldp+74,(((IData)(vlSelf->__VdfgTmp_hdfe4c776__0) 
                               | ((IData)(vlSelf->__VdfgTmp_ha48ccdd0__0) 
                                  | ((IData)(vlSelf->__VdfgTmp_hf2689f3a__0) 
                                     | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                          >> 0xcU) 
                                         & (((0x1000U 
                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                              ? ((0x3ffU 
                                                  & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                     >> 9U)) 
                                                 == 
                                                 (0x3ffU 
                                                  & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                     [0xcU] 
                                                     >> 9U)))
                                              : (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                 == 
                                                 vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                 [0xcU])) 
                                            & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                == 
                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                [0xcU]) 
                                               | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                               [0xcU]))) 
                                        | ((IData)(vlSelf->__VdfgTmp_h7603afda__0) 
                                           | ((IData)(vlSelf->__VdfgTmp_h095da02a__0) 
                                              | ((IData)(vlSelf->__VdfgTmp_hb146e4e1__0) 
                                                 | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                      >> 8U) 
                                                     & (((0x100U 
                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                          ? 
                                                         ((0x3ffU 
                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                              >> 9U)) 
                                                          == 
                                                          (0x3ffU 
                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                              [8U] 
                                                              >> 9U)))
                                                          : 
                                                         (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                          == 
                                                          vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                          [8U])) 
                                                        & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                            == 
                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                            [8U]) 
                                                           | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                           [8U]))) 
                                                    | ((IData)(vlSelf->__VdfgTmp_h476c5c0c__0) 
                                                       | ((IData)(vlSelf->__VdfgTmp_h47fdcd53__0) 
                                                          | ((IData)(vlSelf->__VdfgTmp_hbd45c071__0) 
                                                             | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                  >> 4U) 
                                                                 & (((0x10U 
                                                                      & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                      ? 
                                                                     ((0x3ffU 
                                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                          >> 9U)) 
                                                                      == 
                                                                      (0x3ffU 
                                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                          [4U] 
                                                                          >> 9U)))
                                                                      : 
                                                                     (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                      == 
                                                                      vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                      [4U])) 
                                                                    & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                        == 
                                                                        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                        [4U]) 
                                                                       | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                       [4U]))) 
                                                                | ((IData)(vlSelf->__VdfgTmp_hcd0afc6c__0) 
                                                                   | ((IData)(vlSelf->__VdfgTmp_h87dda4e7__0) 
                                                                      | ((IData)(vlSelf->__VdfgTmp_h154a16ca__0) 
                                                                         | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                            & (((1U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                >> 9U)) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U])) 
                                                                               & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [0U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [0U]))))))))))))))))))));
        bufp->chgCData(oldp+75,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index),4);
        bufp->chgIData(oldp+76,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index]
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index])),20);
        bufp->chgCData(oldp+77,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                  ? 0x15U : 0xcU)),6);
        bufp->chgCData(oldp+78,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index]
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index])),2);
        bufp->chgCData(oldp+79,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index]
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index])),2);
        bufp->chgBit(oldp+80,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer) 
                                      >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d1
                               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index]
                                : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d0
                               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index])));
        bufp->chgBit(oldp+81,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer) 
                                      >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index)))
                                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v1
                               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index]
                                : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v0
                               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_index])));
        bufp->chgSData(oldp+82,((((IData)(vlSelf->__VdfgTmp_hdfe4c776__0) 
                                  << 0xfU) | (((IData)(vlSelf->__VdfgTmp_ha48ccdd0__0) 
                                               << 0xeU) 
                                              | (((IData)(vlSelf->__VdfgTmp_hf2689f3a__0) 
                                                  << 0xdU) 
                                                 | ((0xfffff000U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                        & ((((0x1000U 
                                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                              ? 
                                                             ((0x3ffU 
                                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                  >> 9U)) 
                                                              == 
                                                              (0x3ffU 
                                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                  [0xcU] 
                                                                  >> 9U)))
                                                              : 
                                                             (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                              == 
                                                              vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                              [0xcU])) 
                                                            & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                == 
                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                [0xcU]) 
                                                               | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                               [0xcU])) 
                                                           << 0xcU))) 
                                                    | (((IData)(vlSelf->__VdfgTmp_h7603afda__0) 
                                                        << 0xbU) 
                                                       | (((IData)(vlSelf->__VdfgTmp_h095da02a__0) 
                                                           << 0xaU) 
                                                          | (((IData)(vlSelf->__VdfgTmp_hb146e4e1__0) 
                                                              << 9U) 
                                                             | ((0xffffff00U 
                                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                    & ((((0x100U 
                                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                          ? 
                                                                         ((0x3ffU 
                                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                              >> 9U)) 
                                                                          == 
                                                                          (0x3ffU 
                                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                              [8U] 
                                                                              >> 9U)))
                                                                          : 
                                                                         (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                          == 
                                                                          vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                          [8U])) 
                                                                        & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                            == 
                                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                            [8U]) 
                                                                           | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                           [8U])) 
                                                                       << 8U))) 
                                                                | (((IData)(vlSelf->__VdfgTmp_h476c5c0c__0) 
                                                                    << 7U) 
                                                                   | (((IData)(vlSelf->__VdfgTmp_h47fdcd53__0) 
                                                                       << 6U) 
                                                                      | (((IData)(vlSelf->__VdfgTmp_hbd45c071__0) 
                                                                          << 5U) 
                                                                         | ((0xfffffff0U 
                                                                             & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                                & ((((0x10U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                >> 9U)) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [4U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [4U])) 
                                                                                & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [4U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [4U])) 
                                                                                << 4U))) 
                                                                            | (((IData)(vlSelf->__VdfgTmp_hcd0afc6c__0) 
                                                                                << 3U) 
                                                                               | (((IData)(vlSelf->__VdfgTmp_h87dda4e7__0) 
                                                                                << 2U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h154a16ca__0) 
                                                                                << 1U) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                                & (((1U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                >> 9U)) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U])) 
                                                                                & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [0U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [0U]))))))))))))))))))),16);
        bufp->chgSData(oldp+83,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s0_odd_page_buffer),16);
        bufp->chgCData(oldp+84,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h154a16ca__0)))) 
                                       | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h87dda4e7__0)))) 
                                          | (- (IData)((IData)(vlSelf->__VdfgTmp_hcd0afc6c__0))))))),2);
        bufp->chgCData(oldp+85,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_hbd45c071__0)))) 
                                       | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h47fdcd53__0)))) 
                                          | (- (IData)((IData)(vlSelf->__VdfgTmp_h476c5c0c__0))))))),2);
        bufp->chgCData(oldp+86,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_hb146e4e1__0)))) 
                                       | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h095da02a__0)))) 
                                          | (- (IData)((IData)(vlSelf->__VdfgTmp_h7603afda__0))))))),2);
        bufp->chgCData(oldp+87,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_hf2689f3a__0)))) 
                                       | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_ha48ccdd0__0)))) 
                                          | (- (IData)((IData)(vlSelf->__VdfgTmp_hdfe4c776__0))))))),2);
        bufp->chgCData(oldp+88,((((IData)(vlSelf->__VdfgTmp_hdfe4c776__0) 
                                  << 3U) | (((IData)(vlSelf->__VdfgTmp_ha48ccdd0__0) 
                                             << 2U) 
                                            | (((IData)(vlSelf->__VdfgTmp_hf2689f3a__0) 
                                                << 1U) 
                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                   >> 0xcU) 
                                                  & (((0x1000U 
                                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                       ? 
                                                      ((0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                           >> 9U)) 
                                                       == 
                                                       (0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                           [0xcU] 
                                                           >> 9U)))
                                                       : 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                       == 
                                                       vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                       [0xcU])) 
                                                     & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                         [0xcU]) 
                                                        | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                        [0xcU]))))))),4);
        bufp->chgCData(oldp+89,((((IData)(vlSelf->__VdfgTmp_hcd0afc6c__0) 
                                  << 3U) | (((IData)(vlSelf->__VdfgTmp_h87dda4e7__0) 
                                             << 2U) 
                                            | (((IData)(vlSelf->__VdfgTmp_h154a16ca__0) 
                                                << 1U) 
                                               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                  & (((1U 
                                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                       ? 
                                                      ((0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                           >> 9U)) 
                                                       == 
                                                       (0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                           [0U] 
                                                           >> 9U)))
                                                       : 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                       == 
                                                       vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                       [0U])) 
                                                     & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                         [0U]) 
                                                        | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                        [0U]))))))),4);
        bufp->chgCData(oldp+90,((((IData)(vlSelf->__VdfgTmp_h7603afda__0) 
                                  << 3U) | (((IData)(vlSelf->__VdfgTmp_h095da02a__0) 
                                             << 2U) 
                                            | (((IData)(vlSelf->__VdfgTmp_hb146e4e1__0) 
                                                << 1U) 
                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                   >> 8U) 
                                                  & (((0x100U 
                                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                       ? 
                                                      ((0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                           >> 9U)) 
                                                       == 
                                                       (0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                           [8U] 
                                                           >> 9U)))
                                                       : 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                       == 
                                                       vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                       [8U])) 
                                                     & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                         [8U]) 
                                                        | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                        [8U]))))))),4);
        bufp->chgCData(oldp+91,((((IData)(vlSelf->__VdfgTmp_h476c5c0c__0) 
                                  << 3U) | (((IData)(vlSelf->__VdfgTmp_h47fdcd53__0) 
                                             << 2U) 
                                            | (((IData)(vlSelf->__VdfgTmp_hbd45c071__0) 
                                                << 1U) 
                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                   >> 4U) 
                                                  & (((0x10U 
                                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                       ? 
                                                      ((0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                           >> 9U)) 
                                                       == 
                                                       (0x3ffU 
                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                           [4U] 
                                                           >> 9U)))
                                                       : 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_vppn 
                                                       == 
                                                       vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                       [4U])) 
                                                     & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__s0_asid) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                         [4U]) 
                                                        | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                        [4U]))))))),4);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgBit(oldp+92,(vlSelf->NAND_top__DOT__HIT0));
        bufp->chgBit(oldp+93,(vlSelf->NAND_top__DOT__HIT1));
        bufp->chgBit(oldp+94,(vlSelf->NAND_top__DOT__HIT2));
        bufp->chgBit(oldp+95,(vlSelf->NAND_top__DOT__HIT3));
        bufp->chgBit(oldp+96,(vlSelf->NAND_top__DOT__HIT6));
        bufp->chgBit(oldp+97,(vlSelf->NAND_top__DOT__HIT7));
        bufp->chgBit(oldp+98,(vlSelf->NAND_top__DOT__HIT8));
        bufp->chgBit(oldp+99,(vlSelf->NAND_top__DOT__HIT9));
        bufp->chgBit(oldp+100,(vlSelf->NAND_top__DOT__HIT10));
        bufp->chgBit(oldp+101,(vlSelf->NAND_top__DOT__HIT11));
        bufp->chgBit(oldp+102,(vlSelf->NAND_top__DOT__NAND_HIT));
        bufp->chgCData(oldp+103,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_hd4e85eca__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h2179e714__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h217ffaed__0))))))),2);
        bufp->chgCData(oldp+104,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h208a2720__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h208e684d__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h2082e20c__0))))))),2);
        bufp->chgCData(oldp+105,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h215817df__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h219c8c41__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h21939a4c__0))))))),2);
        bufp->chgCData(oldp+106,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h21904653__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h21b70596__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h21a339db__0))))))),2);
        bufp->chgCData(oldp+107,(((3U & ((- (IData)(
                                                    (0U 
                                                     != (IData)(vlSelf->one_valid_32__DOT__coder__DOT__one__DOT____Vcellinp__one__in)))) 
                                         & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h36715329__0)))) 
                                            | ((2U 
                                                & (- (IData)((IData)(vlSelf->__VdfgTmp_h13900b4e__0)))) 
                                               | (- (IData)((IData)(vlSelf->__VdfgTmp_h13954943__0))))))) 
                                  | (((- (IData)(((IData)(vlSelf->__VdfgTmp_h134db2cf__0) 
                                                  | ((IData)(vlSelf->__VdfgTmp_h1348cb16__0) 
                                                     | ((IData)(vlSelf->__VdfgTmp_h13253108__0) 
                                                        | (IData)(vlSelf->__VdfgTmp_h1320f97f__0)))))) 
                                      & (4U | (3U & 
                                               ((1U 
                                                 & (- (IData)((IData)(vlSelf->__VdfgTmp_h13253108__0)))) 
                                                | ((2U 
                                                    & (- (IData)((IData)(vlSelf->__VdfgTmp_h1348cb16__0)))) 
                                                   | (- (IData)((IData)(vlSelf->__VdfgTmp_h134db2cf__0)))))))) 
                                     | (((- (IData)(
                                                    ((IData)(vlSelf->__VdfgTmp_h161cab63__0) 
                                                     | ((IData)(vlSelf->__VdfgTmp_h161f6232__0) 
                                                        | ((IData)(vlSelf->__VdfgTmp_h1374e6be__0) 
                                                           | (IData)(vlSelf->__VdfgTmp_h1371a2b5__0)))))) 
                                         & (8U | (3U 
                                                  & ((1U 
                                                      & (- (IData)((IData)(vlSelf->__VdfgTmp_h1374e6be__0)))) 
                                                     | ((2U 
                                                         & (- (IData)((IData)(vlSelf->__VdfgTmp_h161f6232__0)))) 
                                                        | (- (IData)((IData)(vlSelf->__VdfgTmp_h161cab63__0)))))))) 
                                        | ((- (IData)(
                                                      ((IData)(vlSelf->__VdfgTmp_h13fc2c66__0) 
                                                       | ((IData)(vlSelf->__VdfgTmp_h13fb7483__0) 
                                                          | ((IData)(vlSelf->__VdfgTmp_h160b9868__0) 
                                                             | (IData)(vlSelf->__VdfgTmp_h1607db17__0)))))) 
                                           & (0xcU 
                                              | (3U 
                                                 & ((1U 
                                                     & (- (IData)((IData)(vlSelf->__VdfgTmp_h160b9868__0)))) 
                                                    | ((2U 
                                                        & (- (IData)((IData)(vlSelf->__VdfgTmp_h13fb7483__0)))) 
                                                       | (- (IData)((IData)(vlSelf->__VdfgTmp_h13fc2c66__0)))))))))))),4);
        bufp->chgCData(oldp+108,(((3U & ((- (IData)(
                                                    (0U 
                                                     != (IData)(vlSelf->one_valid_32__DOT__coder__DOT__two__DOT____Vcellinp__one__in)))) 
                                         & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13d82a6b__0)))) 
                                            | ((2U 
                                                & (- (IData)((IData)(vlSelf->__VdfgTmp_h13dce739__0)))) 
                                               | (- (IData)((IData)(vlSelf->__VdfgTmp_h13c1e028__0))))))) 
                                  | (((- (IData)(((IData)(vlSelf->__VdfgTmp_h13a27bd8__0) 
                                                  | ((IData)(vlSelf->__VdfgTmp_h1342a081__0) 
                                                     | ((IData)(vlSelf->__VdfgTmp_h128f8c69__0) 
                                                        | (IData)(vlSelf->__VdfgTmp_h136b781e__0)))))) 
                                      & (4U | (3U & 
                                               ((1U 
                                                 & (- (IData)((IData)(vlSelf->__VdfgTmp_h128f8c69__0)))) 
                                                | ((2U 
                                                    & (- (IData)((IData)(vlSelf->__VdfgTmp_h1342a081__0)))) 
                                                   | (- (IData)((IData)(vlSelf->__VdfgTmp_h13a27bd8__0)))))))) 
                                     | (((- (IData)(
                                                    ((IData)(vlSelf->__VdfgTmp_h1346c3f9__0) 
                                                     | ((IData)(vlSelf->__VdfgTmp_h134a7ade__0) 
                                                        | ((IData)(vlSelf->__VdfgTmp_h13e94c22__0) 
                                                           | (IData)(vlSelf->__VdfgTmp_h13bce2d7__0)))))) 
                                         & (8U | (3U 
                                                  & ((1U 
                                                      & (- (IData)((IData)(vlSelf->__VdfgTmp_h13e94c22__0)))) 
                                                     | ((2U 
                                                         & (- (IData)((IData)(vlSelf->__VdfgTmp_h134a7ade__0)))) 
                                                        | (- (IData)((IData)(vlSelf->__VdfgTmp_h1346c3f9__0)))))))) 
                                        | ((- (IData)(
                                                      ((IData)(vlSelf->__VdfgTmp_h13c5e328__0) 
                                                       | ((IData)(vlSelf->__VdfgTmp_h13c76457__0) 
                                                          | ((IData)(vlSelf->__VdfgTmp_h135e48e4__0) 
                                                             | (IData)(vlSelf->__VdfgTmp_h1342a9e5__0)))))) 
                                           & (0xcU 
                                              | (3U 
                                                 & ((1U 
                                                     & (- (IData)((IData)(vlSelf->__VdfgTmp_h135e48e4__0)))) 
                                                    | ((2U 
                                                        & (- (IData)((IData)(vlSelf->__VdfgTmp_h13c76457__0)))) 
                                                       | (- (IData)((IData)(vlSelf->__VdfgTmp_h13c5e328__0)))))))))))),4);
        bufp->chgSData(oldp+109,((((IData)(vlSelf->__VdfgTmp_h13fc2c66__0) 
                                   << 0xfU) | (((IData)(vlSelf->__VdfgTmp_h13fb7483__0) 
                                                << 0xeU) 
                                               | (((IData)(vlSelf->__VdfgTmp_h160b9868__0) 
                                                   << 0xdU) 
                                                  | (((IData)(vlSelf->__VdfgTmp_h1607db17__0) 
                                                      << 0xcU) 
                                                     | (((IData)(vlSelf->__VdfgTmp_h161cab63__0) 
                                                         << 0xbU) 
                                                        | (((IData)(vlSelf->__VdfgTmp_h161f6232__0) 
                                                            << 0xaU) 
                                                           | (((IData)(vlSelf->__VdfgTmp_h1374e6be__0) 
                                                               << 9U) 
                                                              | (((IData)(vlSelf->__VdfgTmp_h1371a2b5__0) 
                                                                  << 8U) 
                                                                 | (((IData)(vlSelf->__VdfgTmp_h134db2cf__0) 
                                                                     << 7U) 
                                                                    | (((IData)(vlSelf->__VdfgTmp_h1348cb16__0) 
                                                                        << 6U) 
                                                                       | (((IData)(vlSelf->__VdfgTmp_h13253108__0) 
                                                                           << 5U) 
                                                                          | (((IData)(vlSelf->__VdfgTmp_h1320f97f__0) 
                                                                              << 4U) 
                                                                             | (IData)(vlSelf->one_valid_32__DOT__coder__DOT__one__DOT____Vcellinp__one__in)))))))))))))),16);
        bufp->chgCData(oldp+110,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h36715329__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13900b4e__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h13954943__0))))))),2);
        bufp->chgCData(oldp+111,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13253108__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h1348cb16__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h134db2cf__0))))))),2);
        bufp->chgCData(oldp+112,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h1374e6be__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h161f6232__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h161cab63__0))))))),2);
        bufp->chgCData(oldp+113,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h160b9868__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13fb7483__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h13fc2c66__0))))))),2);
        bufp->chgCData(oldp+114,((((IData)(vlSelf->__VdfgTmp_h13fc2c66__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h13fb7483__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h160b9868__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h1607db17__0))))),4);
        bufp->chgCData(oldp+115,(vlSelf->one_valid_32__DOT__coder__DOT__one__DOT____Vcellinp__one__in),4);
        bufp->chgCData(oldp+116,((((IData)(vlSelf->__VdfgTmp_h161cab63__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h161f6232__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h1374e6be__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h1371a2b5__0))))),4);
        bufp->chgCData(oldp+117,((((IData)(vlSelf->__VdfgTmp_h134db2cf__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h1348cb16__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h13253108__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h1320f97f__0))))),4);
        bufp->chgSData(oldp+118,((((IData)(vlSelf->__VdfgTmp_h13c5e328__0) 
                                   << 0xfU) | (((IData)(vlSelf->__VdfgTmp_h13c76457__0) 
                                                << 0xeU) 
                                               | (((IData)(vlSelf->__VdfgTmp_h135e48e4__0) 
                                                   << 0xdU) 
                                                  | (((IData)(vlSelf->__VdfgTmp_h1342a9e5__0) 
                                                      << 0xcU) 
                                                     | (((IData)(vlSelf->__VdfgTmp_h1346c3f9__0) 
                                                         << 0xbU) 
                                                        | (((IData)(vlSelf->__VdfgTmp_h134a7ade__0) 
                                                            << 0xaU) 
                                                           | (((IData)(vlSelf->__VdfgTmp_h13e94c22__0) 
                                                               << 9U) 
                                                              | (((IData)(vlSelf->__VdfgTmp_h13bce2d7__0) 
                                                                  << 8U) 
                                                                 | (((IData)(vlSelf->__VdfgTmp_h13a27bd8__0) 
                                                                     << 7U) 
                                                                    | (((IData)(vlSelf->__VdfgTmp_h1342a081__0) 
                                                                        << 6U) 
                                                                       | (((IData)(vlSelf->__VdfgTmp_h128f8c69__0) 
                                                                           << 5U) 
                                                                          | (((IData)(vlSelf->__VdfgTmp_h136b781e__0) 
                                                                              << 4U) 
                                                                             | (IData)(vlSelf->one_valid_32__DOT__coder__DOT__two__DOT____Vcellinp__one__in)))))))))))))),16);
        bufp->chgCData(oldp+119,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13d82a6b__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13dce739__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h13c1e028__0))))))),2);
        bufp->chgCData(oldp+120,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h128f8c69__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h1342a081__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h13a27bd8__0))))))),2);
        bufp->chgCData(oldp+121,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13e94c22__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h134a7ade__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h1346c3f9__0))))))),2);
        bufp->chgCData(oldp+122,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h135e48e4__0)))) 
                                        | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h13c76457__0)))) 
                                           | (- (IData)((IData)(vlSelf->__VdfgTmp_h13c5e328__0))))))),2);
        bufp->chgCData(oldp+123,((((IData)(vlSelf->__VdfgTmp_h13c5e328__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h13c76457__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h135e48e4__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h1342a9e5__0))))),4);
        bufp->chgCData(oldp+124,(vlSelf->one_valid_32__DOT__coder__DOT__two__DOT____Vcellinp__one__in),4);
        bufp->chgCData(oldp+125,((((IData)(vlSelf->__VdfgTmp_h1346c3f9__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h134a7ade__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h13e94c22__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h13bce2d7__0))))),4);
        bufp->chgCData(oldp+126,((((IData)(vlSelf->__VdfgTmp_h13a27bd8__0) 
                                   << 3U) | (((IData)(vlSelf->__VdfgTmp_h1342a081__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->__VdfgTmp_h128f8c69__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->__VdfgTmp_h136b781e__0))))),4);
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[1U] 
                      | vlSelf->__Vm_traceActivity[2U]) 
                     | vlSelf->__Vm_traceActivity[0xfU]))) {
        bufp->chgBit(oldp+127,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid))));
        bufp->chgBit(oldp+128,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                      >> 3U))));
        bufp->chgBit(oldp+129,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                      >> 2U))));
        bufp->chgBit(oldp+130,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_cpu));
        bufp->chgCData(oldp+131,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt),4);
        bufp->chgBit(oldp+132,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                      >> 1U))));
        bufp->chgBit(oldp+133,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                      >> 4U))));
        bufp->chgCData(oldp+134,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid),5);
        bufp->chgBit(oldp+135,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_ins));
        bufp->chgBit(oldp+136,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+137,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push));
        bufp->chgBit(oldp+138,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+139,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+140,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push));
        bufp->chgBit(oldp+141,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push));
    }
    if (VL_UNLIKELY((((vlSelf->__Vm_traceActivity[1U] 
                       | vlSelf->__Vm_traceActivity
                       [3U]) | vlSelf->__Vm_traceActivity
                      [9U]) | vlSelf->__Vm_traceActivity
                     [0x10U]))) {
        bufp->chgBit(oldp+142,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mt)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e))));
        __Vtemp_1[0U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq)) 
                                  << 0x21U) | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target)) 
                                                << 1U) 
                                               | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget)))));
        __Vtemp_1[1U] = ((((IData)(4U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U]) 
                          << 2U) | (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq)) 
                                              << 0x21U) 
                                             | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target)) 
                                                 << 1U) 
                                                | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget)))) 
                                            >> 0x20U)));
        __Vtemp_1[2U] = (((IData)(4U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U]) 
                         >> 0x1eU);
        bufp->chgWData(oldp+143,(__Vtemp_1),66);
        bufp->chgBit(oldp+146,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_addr_ok)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT____VdfgTmp_h1a9d3870__0))));
        bufp->chgBit(oldp+147,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT____VdfgTmp_h1a9d3870__0)))));
        __Vtemp_2[0U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken)) 
                                  << 0x22U) | ((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target)) 
                                               << 2U)));
        __Vtemp_2[1U] = ((0xfffffff8U & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U] 
                                          << 4U) | 
                                         ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__exe_is_branch) 
                                          << 3U))) 
                         | (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken)) 
                                      << 0x22U) | ((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target)) 
                                                   << 2U)) 
                                    >> 0x20U)));
        __Vtemp_2[2U] = (7U & ((7U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U] 
                                      >> 0x1cU)) | 
                               ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__exe_is_branch) 
                                >> 0x1dU)));
        bufp->chgWData(oldp+148,(__Vtemp_2),67);
        bufp->chgBit(oldp+151,(((((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d)) 
                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go)) 
                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w))));
        bufp->chgBit(oldp+152,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush)))));
        bufp->chgBit(oldp+153,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush) 
                                & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state)) 
                                   & (3U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))))));
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[1U] 
                      | vlSelf->__Vm_traceActivity[3U]) 
                     | vlSelf->__Vm_traceActivity[0x10U]))) {
        bufp->chgBit(oldp+154,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f));
        bufp->chgBit(oldp+155,((((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go))));
        bufp->chgBit(oldp+156,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d));
        bufp->chgBit(oldp+157,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_e));
        bufp->chgBit(oldp+158,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_pre_f));
        bufp->chgBit(oldp+159,((((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_pre_f)) 
                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go))));
        bufp->chgBit(oldp+160,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_addr_ok));
        bufp->chgBit(oldp+161,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush));
        bufp->chgBit(oldp+162,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e));
        bufp->chgBit(oldp+163,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go));
        bufp->chgBit(oldp+164,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__exe_is_branch));
        bufp->chgBit(oldp+165,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src1_buffer));
        bufp->chgBit(oldp+166,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src2_buffer));
        bufp->chgBit(oldp+167,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_1_buffer));
        bufp->chgBit(oldp+168,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_2_buffer));
        bufp->chgBit(oldp+169,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget));
        bufp->chgBit(oldp+170,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget) 
                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq))));
        bufp->chgBit(oldp+171,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq));
        bufp->chgBit(oldp+172,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____Vcellinp__u_alu__rst));
        bufp->chgBit(oldp+173,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush));
        bufp->chgBit(oldp+174,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__need_buffer));
        bufp->chgIData(oldp+175,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__next_pc),32);
        bufp->chgBit(oldp+176,((IData)((0U != (3U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__next_pc)))));
        bufp->chgBit(oldp+177,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req));
        bufp->chgCData(oldp+178,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__hit),2);
        bufp->chgBit(oldp+179,(((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0) 
                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0))) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0))));
        bufp->chgCData(oldp+180,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state),3);
        bufp->chgBit(oldp+181,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+182,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+183,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+184,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+185,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+186,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+187,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+188,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+189,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+190,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+191,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+192,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+193,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+194,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+195,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+196,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+197,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+198,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__10__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+199,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__11__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+200,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__12__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+201,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__13__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+202,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__14__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+203,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__15__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+204,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__1__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+205,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__2__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+206,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__3__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+207,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__4__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+208,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__5__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+209,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__6__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+210,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__7__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+211,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__8__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+212,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__9__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+213,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0));
        bufp->chgBit(oldp+214,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0));
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[9U]))) {
        bufp->chgBit(oldp+215,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_wlast));
        bufp->chgBit(oldp+216,(vlSelf->simu_top__DOT__soc__DOT__cpu_wready));
        bufp->chgBit(oldp+217,(vlSelf->simu_top__DOT__soc__DOT__cpu_bvalid));
        bufp->chgBit(oldp+218,(vlSelf->simu_top__DOT__soc__DOT__cpu_arready));
        bufp->chgBit(oldp+219,(vlSelf->simu_top__DOT__soc__DOT__cpu_rvalid));
        bufp->chgBit(oldp+220,(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
        bufp->chgBit(oldp+221,(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid));
        bufp->chgBit(oldp+222,(vlSelf->simu_top__DOT__soc__DOT__m0_bready));
        bufp->chgBit(oldp+223,(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
        bufp->chgBit(oldp+224,(vlSelf->simu_top__DOT__soc__DOT__m0_rready));
        bufp->chgBit(oldp+225,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid))));
        bufp->chgBit(oldp+226,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))));
        bufp->chgBit(oldp+227,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid))));
        bufp->chgBit(oldp+228,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))));
        bufp->chgBit(oldp+229,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                      >> 3U))));
        bufp->chgBit(oldp+230,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 3U))));
        bufp->chgBit(oldp+231,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                      >> 3U))));
        bufp->chgBit(oldp+232,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 3U))));
        bufp->chgBit(oldp+233,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                      >> 2U))));
        bufp->chgBit(oldp+234,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 2U))));
        bufp->chgBit(oldp+235,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                      >> 2U))));
        bufp->chgBit(oldp+236,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 2U))));
        bufp->chgBit(oldp+237,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en));
        bufp->chgCData(oldp+238,(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen),4);
        bufp->chgBit(oldp+239,((((8U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast) 
                                    & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                       >> 2U))) | (
                                                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                                    >> 2U) 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid)))));
        bufp->chgBit(oldp+240,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                      >> 1U))));
        bufp->chgBit(oldp+241,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 1U))));
        bufp->chgBit(oldp+242,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                      >> 1U))));
        bufp->chgBit(oldp+243,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 1U))));
        bufp->chgBit(oldp+244,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                      >> 4U))));
        bufp->chgBit(oldp+245,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 4U))));
        bufp->chgBit(oldp+246,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                      >> 4U))));
        bufp->chgBit(oldp+247,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 4U))));
        bufp->chgIData(oldp+248,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0]),32);
        bufp->chgIData(oldp+249,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1]),32);
        bufp->chgIData(oldp+250,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2]),32);
        bufp->chgIData(oldp+251,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3]),32);
        bufp->chgIData(oldp+252,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4]),32);
        bufp->chgCData(oldp+253,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid),5);
        bufp->chgCData(oldp+254,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready),5);
        bufp->chgCData(oldp+255,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid),5);
        bufp->chgCData(oldp+256,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready),5);
        bufp->chgBit(oldp+257,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_del));
        bufp->chgBit(oldp+258,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins));
        bufp->chgBit(oldp+259,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid) 
                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast) 
                                      & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rready))))));
        bufp->chgBit(oldp+260,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en))));
        bufp->chgBit(oldp+261,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+262,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+263,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+264,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+265,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+266,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
                                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                         >> 3U)))));
        bufp->chgBit(oldp+267,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+268,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+269,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+270,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+271,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+272,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+273,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+274,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+275,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go));
        bufp->chgBit(oldp+276,((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen))));
        bufp->chgBit(oldp+277,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8000U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+278,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8010U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+279,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8020U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+280,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8030U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+281,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8040U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+282,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8050U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+283,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8060U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+284,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0x8070U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+285,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer));
        bufp->chgBit(oldp+286,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xff00U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+287,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xff30U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+288,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xff40U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+289,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid));
        bufp->chgBit(oldp+290,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xf020U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgCData(oldp+291,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state),3);
        bufp->chgSData(oldp+292,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp),16);
        bufp->chgBit(oldp+293,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xf030U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+294,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xf040U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+295,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                                & (0xf050U == (0xffffU 
                                               & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+296,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_req));
        bufp->chgBit(oldp+297,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_addr_ok));
        bufp->chgBit(oldp+298,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arready) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arid)) 
                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid) 
                                      & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid) 
                                             & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arid)) 
                                                & ((1U 
                                                    != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state)) 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__inst_sram_req_r))))) 
                                         & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_0))))))));
        bufp->chgBit(oldp+299,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_valid));
        bufp->chgBit(oldp+300,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_ok));
        bufp->chgBit(oldp+301,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_addr_ok));
        bufp->chgBit(oldp+302,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_R_data_valid));
        bufp->chgBit(oldp+303,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hd78ca973__0) 
                                & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__wt_drop_1)))));
        bufp->chgBit(oldp+304,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_data_ok));
        bufp->chgBit(oldp+305,((((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h276d363d__0)) 
                                | ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_ha0e9c401__0)))));
        bufp->chgBit(oldp+306,((((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h2feeed37__0)) 
                                | ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hf8bbfd1c__0)))));
        bufp->chgBit(oldp+307,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_nocache_data_sram_req));
        bufp->chgBit(oldp+308,(((((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache)) 
                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h2feeed37__0)) 
                                 | ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache)) 
                                    & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hf8bbfd1c__0))) 
                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_addr_ok))));
        bufp->chgBit(oldp+309,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__data_ok));
        bufp->chgBit(oldp+310,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                 >> 0xaU) & ((~ (((
                                                   (2U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache)) 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_h2feeed37__0)) 
                                                  | ((2U 
                                                      == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache)) 
                                                     & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT____VdfgTmp_hf8bbfd1c__0))) 
                                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_addr_ok))) 
                                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__req_able)))));
        bufp->chgBit(oldp+311,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mt));
        bufp->chgBit(oldp+312,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mr_self));
        bufp->chgBit(oldp+313,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_mr));
        bufp->chgBit(oldp+314,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__req));
        bufp->chgCData(oldp+315,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__hit),2);
        bufp->chgBit(oldp+316,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__miss));
        bufp->chgBit(oldp+317,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__write_back));
        bufp->chgCData(oldp+318,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__next_state),3);
        bufp->chgBit(oldp+319,(((5U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state)) 
                                & ((0xfU == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_data_ok)))));
        bufp->chgBit(oldp+320,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__ena));
        bufp->chgCData(oldp+321,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__wea),4);
        bufp->chgBit(oldp+322,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+323,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+324,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+325,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+326,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+327,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+328,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+329,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+330,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+331,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+332,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+333,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+334,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+335,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+336,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__ena));
        bufp->chgBit(oldp+337,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__ena));
        bufp->chgCData(oldp+338,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__wea),4);
        bufp->chgBit(oldp+339,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__10__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+340,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__11__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+341,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__12__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+342,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__13__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+343,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__14__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+344,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__15__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+345,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__1__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+346,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__2__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+347,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__3__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+348,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__4__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+349,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__5__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+350,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__6__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+351,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__7__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+352,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__8__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+353,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__9__KET____DOT__bank_way1__ena));
        bufp->chgBit(oldp+354,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_he8684a95__0) 
                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_hbfaab181__0 
                                   >> 0x14U))));
        bufp->chgBit(oldp+355,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_he8684a95__0) 
                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_h91e0ffe6__0 
                                   >> 0x14U))));
        bufp->chgBit(oldp+356,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0));
        bufp->chgBit(oldp+357,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0));
        bufp->chgBit(oldp+358,(((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state)) 
                                & ((0xfU == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__transfer_cnt)) 
                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_ok)))));
        bufp->chgBit(oldp+359,(((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                    >> 0xeU)) & (IData)(
                                                        (((0x400U 
                                                           == 
                                                           (0x7c0U 
                                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])) 
                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w)) 
                                                         & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__data_ok)))))));
        bufp->chgBit(oldp+360,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__data_ok) 
                                & (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__drop_num)))));
        bufp->chgBit(oldp+361,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready))));
        bufp->chgBit(oldp+362,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready))));
        bufp->chgBit(oldp+363,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+364,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+365,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+366,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+367,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+368,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                                      | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)))));
        bufp->chgBit(oldp+369,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+370,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+371,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+372,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+373,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+374,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+375,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+376,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+377,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go));
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[3U] 
                      | vlSelf->__Vm_traceActivity[9U]) 
                     | vlSelf->__Vm_traceActivity[0x10U]))) {
        __Vtemp_9[0U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0U]))));
        __Vtemp_9[1U] = (IData)(((((QData)((IData)(
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])) 
                                   << 0x20U) | (QData)((IData)(
                                                               vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0U]))) 
                                 >> 0x20U));
        __Vtemp_9[2U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e)) 
                                  << 0x20U) | (QData)((IData)(
                                                              ((0x20000U 
                                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU])
                                                                ? 
                                                               ((1U 
                                                                 == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e)
                                                                 ? 0x1f1f0U
                                                                 : 0U)
                                                                : 
                                                               ((0x800U 
                                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U])
                                                                 ? 
                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                                                  << 0x14U) 
                                                                 | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                    >> 0xcU))
                                                                 : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e))))));
        __Vtemp_9[3U] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e)) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((0x20000U 
                                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU])
                                                                 ? 
                                                                ((1U 
                                                                  == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e)
                                                                  ? 0x1f1f0U
                                                                  : 0U)
                                                                 : 
                                                                ((0x800U 
                                                                  & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U])
                                                                  ? 
                                                                 ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                                                   << 0x14U) 
                                                                  | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                     >> 0xcU))
                                                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e))))) 
                                 >> 0x20U));
        __Vtemp_9[4U] = ((((0x2000U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U])
                            ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                               | ((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e) 
                                  & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                      << 0x14U) | (
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                   >> 0xcU))))
                            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                          << 0x10U) | ((0x8000U & (
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                                   << 3U)) 
                                       | ((0x4000U 
                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                              << 7U)) 
                                          | ((0x3000U 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                 << 3U)) 
                                             | (0xfffU 
                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                   >> 0x11U))))));
        __Vtemp_9[5U] = ((0xffff0000U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                         << 2U)) | 
                         (((0x2000U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U])
                            ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                               | ((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e) 
                                  & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                      << 0x14U) | (
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                   >> 0xcU))))
                            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                          >> 0x10U));
        __Vtemp_9[6U] = (0x3ffU & ((0xfffcU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                               << 2U)) 
                                   | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                      >> 0x1eU)));
        bufp->chgWData(oldp+378,(__Vtemp_9),202);
        bufp->chgIData(oldp+385,(((0x20000U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU])
                                   ? ((1U == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e)
                                       ? 0x1f1f0U : 0U)
                                   : ((0x800U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U])
                                       ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                           << 0x14U) 
                                          | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                             >> 0xcU))
                                       : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e))),32);
        bufp->chgIData(oldp+386,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                   & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                                  | ((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e) 
                                     & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                         << 0x14U) 
                                        | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                           >> 0xcU))))),32);
        bufp->chgIData(oldp+387,(((0x2000U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U])
                                   ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                       & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e) 
                                      | ((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e) 
                                         & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                             << 0x14U) 
                                            | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                               >> 0xcU))))
                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e)),32);
        bufp->chgIData(oldp+388,((1U & (~ (IData)((1ULL 
                                                   & (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a)) 
                                                       + 
                                                       ((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b)) 
                                                        + (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin)))) 
                                                      >> 0x20U)))))),32);
        bufp->chgQData(oldp+389,(((((QData)((IData)(
                                                    (- (IData)(
                                                               ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                 >> 0xdU) 
                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                                   >> 0x1fU)))))) 
                                    << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a))) 
                                  >> (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result))),64);
        bufp->chgIData(oldp+391,((IData)(((((QData)((IData)(
                                                            (- (IData)(
                                                                       ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                         >> 0xdU) 
                                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                                           >> 0x1fU)))))) 
                                            << 0x20U) 
                                           | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a))) 
                                          >> (0x1fU 
                                              & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)))),32);
        bufp->chgBit(oldp+392,((1U & (IData)((1ULL 
                                              & (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a)) 
                                                  + 
                                                  ((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b)) 
                                                   + (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin)))) 
                                                 >> 0x20U))))));
        bufp->chgIData(oldp+393,((((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                    >> 0x1fU) & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                 >> 7U))
                                   ? ((IData)(1U) + 
                                      (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a))
                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a)),32);
        bufp->chgIData(oldp+394,((((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result 
                                    >> 0x1fU) & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                 >> 7U))
                                   ? ((IData)(1U) + 
                                      (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result))
                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)),32);
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[3U] 
                     | vlSelf->__Vm_traceActivity[0x10U]))) {
        bufp->chgCData(oldp+395,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e),2);
        bufp->chgCData(oldp+396,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e),2);
        bufp->chgIData(oldp+397,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus),18);
        bufp->chgBit(oldp+398,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ld_stall));
        bufp->chgBit(oldp+399,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken));
        bufp->chgIData(oldp+400,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target),32);
        bufp->chgIData(oldp+401,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e),32);
        bufp->chgIData(oldp+402,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e),32);
        bufp->chgIData(oldp+403,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a),32);
        bufp->chgIData(oldp+404,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result),32);
        bufp->chgIData(oldp+405,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e),32);
        bufp->chgIData(oldp+406,(((1U == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e)
                                   ? 0x1f1f0U : 0U)),32);
        bufp->chgBit(oldp+407,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_eq_rd));
        bufp->chgBit(oldp+408,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd));
        bufp->chgBit(oldp+409,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u));
        bufp->chgIData(oldp+410,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result),32);
        bufp->chgIData(oldp+411,((1U & (((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result 
                                             >> 0x1fU)) 
                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                            >> 0x1fU)) 
                                        | ((~ (IData)(vlSelf->__VdfgTmp_hb5163d10__0)) 
                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result 
                                              >> 0x1fU))))),32);
        bufp->chgIData(oldp+412,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                  & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)),32);
        bufp->chgIData(oldp+413,((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result)),32);
        bufp->chgIData(oldp+414,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result),32);
        bufp->chgIData(oldp+415,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                  ^ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)),32);
        bufp->chgIData(oldp+416,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                  << (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result))),32);
        bufp->chgQData(oldp+417,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_result),64);
        bufp->chgIData(oldp+419,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b),32);
        bufp->chgCData(oldp+420,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                           >> 0xbU))),5);
        bufp->chgCData(oldp+421,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                           >> 5U))),5);
        bufp->chgCData(oldp+422,((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus)),5);
        bufp->chgBit(oldp+423,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                      >> 0x11U))));
        bufp->chgBit(oldp+424,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                      >> 0xaU))));
        bufp->chgBit(oldp+425,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                      >> 0x10U))));
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[4U] 
                      | vlSelf->__Vm_traceActivity[9U]) 
                     | vlSelf->__Vm_traceActivity[0xbU]))) {
        bufp->chgIData(oldp+426,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[0]),32);
        bufp->chgIData(oldp+427,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[1]),32);
        bufp->chgIData(oldp+428,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[2]),32);
        bufp->chgIData(oldp+429,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[3]),32);
        bufp->chgIData(oldp+430,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[4]),32);
        bufp->chgIData(oldp+431,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[5]),32);
        bufp->chgIData(oldp+432,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[6]),32);
        bufp->chgIData(oldp+433,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[7]),32);
        bufp->chgIData(oldp+434,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[8]),32);
        bufp->chgIData(oldp+435,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[9]),32);
        bufp->chgIData(oldp+436,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[10]),32);
        bufp->chgIData(oldp+437,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[11]),32);
        bufp->chgIData(oldp+438,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[12]),32);
        bufp->chgIData(oldp+439,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[13]),32);
        bufp->chgIData(oldp+440,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[14]),32);
        bufp->chgIData(oldp+441,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0[15]),32);
        bufp->chgIData(oldp+442,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__cached_r)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0
                                  [0xfU] : 0U)),32);
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[5U] 
                      | vlSelf->__Vm_traceActivity[9U]) 
                     | vlSelf->__Vm_traceActivity[0xcU]))) {
        bufp->chgIData(oldp+443,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[0]),32);
        bufp->chgIData(oldp+444,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[1]),32);
        bufp->chgIData(oldp+445,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[2]),32);
        bufp->chgIData(oldp+446,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[3]),32);
        bufp->chgIData(oldp+447,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[4]),32);
        bufp->chgIData(oldp+448,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[5]),32);
        bufp->chgIData(oldp+449,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[6]),32);
        bufp->chgIData(oldp+450,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[7]),32);
        bufp->chgIData(oldp+451,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[8]),32);
        bufp->chgIData(oldp+452,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[9]),32);
        bufp->chgIData(oldp+453,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[10]),32);
        bufp->chgIData(oldp+454,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[11]),32);
        bufp->chgIData(oldp+455,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[12]),32);
        bufp->chgIData(oldp+456,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[13]),32);
        bufp->chgIData(oldp+457,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[14]),32);
        bufp->chgIData(oldp+458,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1[15]),32);
        bufp->chgIData(oldp+459,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__cached_r)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1
                                  [0xfU] : 0U)),32);
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[6U] 
                      | vlSelf->__Vm_traceActivity[9U]) 
                     | vlSelf->__Vm_traceActivity[0xeU]))) {
        bufp->chgIData(oldp+460,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[0]),32);
        bufp->chgIData(oldp+461,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[1]),32);
        bufp->chgIData(oldp+462,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[2]),32);
        bufp->chgIData(oldp+463,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[3]),32);
        bufp->chgIData(oldp+464,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[4]),32);
        bufp->chgIData(oldp+465,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[5]),32);
        bufp->chgIData(oldp+466,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[6]),32);
        bufp->chgIData(oldp+467,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[7]),32);
        bufp->chgIData(oldp+468,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[8]),32);
        bufp->chgIData(oldp+469,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[9]),32);
        bufp->chgIData(oldp+470,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[10]),32);
        bufp->chgIData(oldp+471,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[11]),32);
        bufp->chgIData(oldp+472,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[12]),32);
        bufp->chgIData(oldp+473,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[13]),32);
        bufp->chgIData(oldp+474,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[14]),32);
        bufp->chgIData(oldp+475,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0[15]),32);
        bufp->chgIData(oldp+476,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0
                                  [0xfU] : 0U)),32);
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[7U] 
                      | vlSelf->__Vm_traceActivity[9U]) 
                     | vlSelf->__Vm_traceActivity[0xdU]))) {
        bufp->chgIData(oldp+477,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[0]),32);
        bufp->chgIData(oldp+478,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[1]),32);
        bufp->chgIData(oldp+479,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[2]),32);
        bufp->chgIData(oldp+480,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[3]),32);
        bufp->chgIData(oldp+481,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[4]),32);
        bufp->chgIData(oldp+482,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[5]),32);
        bufp->chgIData(oldp+483,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[6]),32);
        bufp->chgIData(oldp+484,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[7]),32);
        bufp->chgIData(oldp+485,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[8]),32);
        bufp->chgIData(oldp+486,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[9]),32);
        bufp->chgIData(oldp+487,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[10]),32);
        bufp->chgIData(oldp+488,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[11]),32);
        bufp->chgIData(oldp+489,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[12]),32);
        bufp->chgIData(oldp+490,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[13]),32);
        bufp->chgIData(oldp+491,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[14]),32);
        bufp->chgIData(oldp+492,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1[15]),32);
        bufp->chgIData(oldp+493,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1
                                  [0xfU] : 0U)),32);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[8U])) {
        bufp->chgSData(oldp+494,(vlSelf->NAND_top__DOT__nand_addr_c),14);
        bufp->chgIData(oldp+495,(vlSelf->NAND_top__DOT__nand_addr_r),25);
        bufp->chgIData(oldp+496,(vlSelf->NAND_top__DOT__nand_op_num),32);
        bufp->chgIData(oldp+497,(vlSelf->NAND_top__DOT__nand_parameter),32);
        bufp->chgIData(oldp+498,(vlSelf->NAND_top__DOT__nand_ce_map0),32);
        bufp->chgIData(oldp+499,(vlSelf->NAND_top__DOT__nand_ce_map1),32);
        bufp->chgIData(oldp+500,(vlSelf->NAND_top__DOT__nand_rdy_map0),32);
        bufp->chgIData(oldp+501,(vlSelf->NAND_top__DOT__nand_rdy_map1),32);
        bufp->chgIData(oldp+502,(vlSelf->NAND_top__DOT__nand_command),32);
        bufp->chgSData(oldp+503,(vlSelf->NAND_top__DOT__nand_timing),16);
        bufp->chgQData(oldp+504,(vlSelf->NAND_top__DOT__addr_in_die),38);
        bufp->chgCData(oldp+506,(vlSelf->NAND_top__DOT__NAND_STATE),5);
        bufp->chgIData(oldp+507,(vlSelf->NAND_top__DOT__NAND_OP_NUM),32);
        bufp->chgSData(oldp+508,(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT),14);
        bufp->chgSData(oldp+509,(vlSelf->NAND_top__DOT__READ_MAX_COUNT),14);
        bufp->chgBit(oldp+510,(vlSelf->NAND_top__DOT__nand_clr_ack));
        bufp->chgBit(oldp+511,(vlSelf->NAND_top__DOT__NAND_DONE));
        bufp->chgBit(oldp+512,(vlSelf->NAND_top__DOT__NAND_CE_));
        bufp->chgSData(oldp+513,((0x3fffU & (vlSelf->NAND_top__DOT__nand_parameter 
                                             >> 0x10U))),14);
        bufp->chgCData(oldp+514,((7U & (vlSelf->NAND_top__DOT__nand_parameter 
                                        >> 0xcU))),3);
        bufp->chgCData(oldp+515,((0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                          >> 8U))),4);
        bufp->chgBit(oldp+516,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                      >> 8U))));
        bufp->chgBit(oldp+517,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                      >> 9U))));
        bufp->chgBit(oldp+518,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                      >> 0xdU))));
        bufp->chgBit(oldp+519,(vlSelf->NAND_top__DOT__NAND_DMA_REQ));
        bufp->chgBit(oldp+520,(vlSelf->NAND_top__DOT__nand_cmd_valid));
        bufp->chgCData(oldp+521,(vlSelf->NAND_top__DOT__status),8);
        bufp->chgCData(oldp+522,(vlSelf->NAND_top__DOT__nand_number),2);
        bufp->chgQData(oldp+523,(vlSelf->NAND_top__DOT__ID_INFORM),48);
        bufp->chgIData(oldp+525,(vlSelf->NAND_top__DOT__NAND_DAT_O_RD),32);
        bufp->chgCData(oldp+526,((((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0) 
                                   << 3U) | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0) 
                                              << 2U) 
                                             | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0) 
                                                 << 1U) 
                                                | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0))))),4);
        bufp->chgCData(oldp+527,(vlSelf->NAND_top__DOT__ADDR_pointer),2);
        bufp->chgCData(oldp+528,(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT),3);
        bufp->chgCData(oldp+529,(vlSelf->NAND_top__DOT__WAIT_NUM),8);
        bufp->chgCData(oldp+530,(vlSelf->NAND_top__DOT__HOLD_NUM),8);
        bufp->chgCData(oldp+531,(vlSelf->NAND_top__DOT__COMMAND),8);
        bufp->chgCData(oldp+532,(vlSelf->NAND_top__DOT__PRE_STATE),5);
        bufp->chgCData(oldp+533,(vlSelf->NAND_top__DOT__READ_ID_NUM),3);
        bufp->chgSData(oldp+534,(vlSelf->NAND_top__DOT__data_count),14);
        bufp->chgQData(oldp+535,(vlSelf->NAND_top__DOT__NAND_ADDR),38);
        bufp->chgIData(oldp+537,(vlSelf->NAND_top__DOT__NAND_DAT_I_WR),32);
        bufp->chgBit(oldp+538,(vlSelf->NAND_top__DOT__NAND_GO));
        bufp->chgBit(oldp+539,(vlSelf->NAND_top__DOT__NAND_ACK));
        bufp->chgBit(oldp+540,(vlSelf->NAND_top__DOT__DMA_OP_DONE));
        bufp->chgBit(oldp+541,(vlSelf->NAND_top__DOT__ERASE_SERIAL));
        bufp->chgBit(oldp+542,(vlSelf->NAND_top__DOT__now_up_half));
        bufp->chgBit(oldp+543,(vlSelf->NAND_top__DOT__now_oob));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[9U])) {
        bufp->chgIData(oldp+544,(vlSelf->simu_top__DOT__soc__DOT__cpu_awaddr),32);
        bufp->chgCData(oldp+545,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__awlen))),4);
        bufp->chgCData(oldp+546,(vlSelf->simu_top__DOT__soc__DOT__cpu_awsize),3);
        bufp->chgBit(oldp+547,(vlSelf->simu_top__DOT__soc__DOT__cpu_awvalid));
        bufp->chgIData(oldp+548,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_wdata),32);
        bufp->chgCData(oldp+549,(vlSelf->simu_top__DOT__soc__DOT__cpu_wstrb),4);
        bufp->chgBit(oldp+550,(vlSelf->simu_top__DOT__soc__DOT__cpu_wvalid));
        bufp->chgBit(oldp+551,(vlSelf->simu_top__DOT__soc__DOT__cpu_bready));
        bufp->chgCData(oldp+552,(vlSelf->simu_top__DOT__soc__DOT__cpu_arid),4);
        bufp->chgIData(oldp+553,(vlSelf->simu_top__DOT__soc__DOT__cpu_araddr),32);
        bufp->chgCData(oldp+554,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__arlen))),4);
        bufp->chgCData(oldp+555,(vlSelf->simu_top__DOT__soc__DOT__cpu_arsize),3);
        bufp->chgBit(oldp+556,(vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid));
        bufp->chgCData(oldp+557,(vlSelf->simu_top__DOT__soc__DOT__m0_rid),4);
        bufp->chgBit(oldp+558,(vlSelf->simu_top__DOT__soc__DOT__m0_rlast));
        bufp->chgBit(oldp+559,(vlSelf->simu_top__DOT__soc__DOT__cpu_rready));
        bufp->chgBit(oldp+560,(vlSelf->simu_top__DOT__soc__DOT__m0_wready));
        bufp->chgBit(oldp+561,(vlSelf->simu_top__DOT__soc__DOT__m0_bvalid));
        bufp->chgBit(oldp+562,(vlSelf->simu_top__DOT__soc__DOT__m0_arready));
        bufp->chgBit(oldp+563,(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid));
        bufp->chgBit(oldp+564,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+565,(vlSelf->simu_top__DOT__soc__DOT__s0_wready));
        bufp->chgCData(oldp+566,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+567,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+568,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+569,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid),4);
        bufp->chgBit(oldp+570,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+571,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+572,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+573,(vlSelf->simu_top__DOT__soc__DOT__conf_s_wready));
        bufp->chgCData(oldp+574,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+575,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+576,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+577,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid),4);
        bufp->chgIData(oldp+578,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg),32);
        bufp->chgBit(oldp+579,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+580,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+581,(vlSelf->simu_top__DOT__soc__DOT__apb_s_awready));
        bufp->chgBit(oldp+582,(vlSelf->simu_top__DOT__soc__DOT__apb_s_wready));
        bufp->chgCData(oldp+583,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id),4);
        bufp->chgBit(oldp+584,(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid));
        bufp->chgBit(oldp+585,(vlSelf->simu_top__DOT__soc__DOT__apb_s_arready));
        bufp->chgCData(oldp+586,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id),4);
        bufp->chgIData(oldp+587,(((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                   ? vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32
                                   : ((1U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                       ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 8U)
                                       : ((2U == (3U 
                                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                           ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x10U)
                                           : ((3U == 
                                               (3U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                               ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x18U)
                                               : 0U))))),32);
        bufp->chgBit(oldp+588,(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast));
        bufp->chgBit(oldp+589,(vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid));
        bufp->chgIData(oldp+590,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+591,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+592,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgCData(oldp+593,(((IData)(vlSelf->simu_top__DOT__soc__DOT__uart0_int) 
                                  << 1U)),8);
        bufp->chgBit(oldp+594,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 1U))));
        bufp->chgBit(oldp+595,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))));
        bufp->chgBit(oldp+596,(vlSelf->simu_top__DOT__soc__DOT__uart0_int));
        bufp->chgBit(oldp+597,((IData)(((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 4U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared)) 
                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
        bufp->chgBit(oldp+598,(vlSelf->simu_top__DOT__soc__DOT__uart0_txd_oe));
        bufp->chgBit(oldp+599,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                      ^ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 3U)))));
        bufp->chgBit(oldp+600,((1U & (~ (IData)(vlSelf->uart_rx__en0)))));
        bufp->chgBit(oldp+601,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) 
                                & ((0U == (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU)))
                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                    : (0U != (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))))));
        bufp->chgIData(oldp+602,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                   ? ((0U == (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))
                                       ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao)
                                       : 0U) : 0U)),32);
        bufp->chgBit(oldp+603,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant));
        bufp->chgBit(oldp+604,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                & ((0U == (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU)))
                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                    : (0U != (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))))));
        bufp->chgBit(oldp+605,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr));
        bufp->chgBit(oldp+606,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu));
        bufp->chgBit(oldp+607,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu));
        bufp->chgIData(oldp+608,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr),20);
        bufp->chgCData(oldp+609,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu),8);
        bufp->chgCData(oldp+610,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datao_cpu),8);
        bufp->chgBit(oldp+611,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_word_trans_cpu));
        bufp->chgIData(oldp+612,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr),24);
        bufp->chgBit(oldp+613,((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                >> 0xeU)))));
        bufp->chgBit(oldp+614,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack));
        bufp->chgBit(oldp+615,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
        bufp->chgBit(oldp+616,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
                                & (0U == (0xfc000U 
                                          & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))));
        bufp->chgIData(oldp+617,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr),20);
        bufp->chgCData(oldp+618,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai),8);
        bufp->chgCData(oldp+619,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao),8);
        bufp->chgBit(oldp+620,((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                >> 0xeU)))));
        bufp->chgBit(oldp+621,(((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU))) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel))));
        bufp->chgBit(oldp+622,(((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU))) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab))));
        bufp->chgIData(oldp+623,(((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                     ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                        >> 8U) : vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr) 
                                   << 8U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai))),32);
        bufp->chgBit(oldp+624,(((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))
                                 ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                 : (0U != (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU))))));
        bufp->chgBit(oldp+625,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel));
        bufp->chgBit(oldp+626,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab));
        bufp->chgIData(oldp+627,((0xffffffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                                ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                                   >> 8U)
                                                : vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr))),24);
        bufp->chgCData(oldp+628,(((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                   >> 0xeU)))
                                   ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao)
                                   : 0U)),8);
        bufp->chgBit(oldp+629,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))));
        bufp->chgBit(oldp+630,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready));
        bufp->chgBit(oldp+631,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd));
        bufp->chgCData(oldp+632,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm),4);
        bufp->chgCData(oldp+633,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb),4);
        bufp->chgCData(oldp+634,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb),4);
        bufp->chgIData(oldp+635,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32),32);
        bufp->chgIData(oldp+636,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32),32);
        bufp->chgCData(oldp+637,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count),3);
        bufp->chgCData(oldp+638,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size),3);
        bufp->chgCData(oldp+639,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size),3);
        bufp->chgCData(oldp+640,((0xffU & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),8);
        bufp->chgBit(oldp+641,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__we));
        bufp->chgBit(oldp+642,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re));
        bufp->chgBit(oldp+643,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en));
        bufp->chgBit(oldp+644,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en));
        bufp->chgBit(oldp+645,(vlSelf->uart_rx__en0));
        bufp->chgCData(oldp+646,((7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),3);
        bufp->chgBit(oldp+647,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable));
        bufp->chgBit(oldp+648,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad));
        bufp->chgCData(oldp+649,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier),4);
        bufp->chgCData(oldp+650,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir),4);
        bufp->chgCData(oldp+651,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr),2);
        bufp->chgCData(oldp+652,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr),5);
        bufp->chgBit(oldp+653,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared));
        bufp->chgBit(oldp+654,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol));
        bufp->chgCData(oldp+655,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr),8);
        bufp->chgCData(oldp+656,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr),8);
        bufp->chgIData(oldp+657,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl),24);
        bufp->chgBit(oldp+658,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc));
        bufp->chgBit(oldp+659,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d));
        bufp->chgBit(oldp+660,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset));
        bufp->chgSData(oldp+661,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc),16);
        bufp->chgCData(oldp+662,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level),4);
        bufp->chgBit(oldp+663,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset));
        bufp->chgBit(oldp+664,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset));
        bufp->chgBit(oldp+665,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                      >> 7U))));
        bufp->chgBit(oldp+666,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 2U))));
        bufp->chgBit(oldp+667,((1U & (~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 2U)))));
        bufp->chgBit(oldp+668,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg));
        bufp->chgBit(oldp+669,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg));
        bufp->chgCData(oldp+670,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg),8);
        bufp->chgCData(oldp+671,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg),8);
        bufp->chgCData(oldp+672,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count),8);
        bufp->chgCData(oldp+673,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg),3);
        bufp->chgBit(oldp+674,((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+675,((1U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+676,((2U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+677,((3U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+678,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en));
        bufp->chgBit(oldp+679,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 3U))));
        bufp->chgBit(oldp+680,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 4U))));
        bufp->chgBit(oldp+681,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 3U))));
        bufp->chgBit(oldp+682,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 2U))));
        bufp->chgBit(oldp+683,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 1U))));
        bufp->chgBit(oldp+684,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0))));
        bufp->chgCData(oldp+685,((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
                                   << 7U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r) 
                                              << 6U) 
                                             | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
                                                 << 5U) 
                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r) 
                                                    << 4U) 
                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                                                       << 3U) 
                                                      | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                                                          << 2U) 
                                                         | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                                                             << 1U) 
                                                            | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r))))))))),8);
        bufp->chgBit(oldp+686,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
        bufp->chgBit(oldp+687,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
        bufp->chgBit(oldp+688,((1U & ((IData)(vlSelf->__VdfgTmp_hcd04e225__0) 
                                      >> 1U))));
        bufp->chgBit(oldp+689,((1U & (IData)(vlSelf->__VdfgTmp_hcd04e225__0))));
        bufp->chgBit(oldp+690,((1U & ((IData)(vlSelf->__VdfgTmp_hcd04e225__0) 
                                      >> 2U))));
        bufp->chgBit(oldp+691,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5));
        bufp->chgBit(oldp+692,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6));
        bufp->chgBit(oldp+693,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
        bufp->chgBit(oldp+694,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r));
        bufp->chgBit(oldp+695,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r));
        bufp->chgBit(oldp+696,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r));
        bufp->chgBit(oldp+697,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r));
        bufp->chgBit(oldp+698,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r));
        bufp->chgBit(oldp+699,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
        bufp->chgBit(oldp+700,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r));
        bufp->chgBit(oldp+701,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r));
        bufp->chgBit(oldp+702,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask));
        bufp->chgBit(oldp+703,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
        bufp->chgBit(oldp+704,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
        bufp->chgBit(oldp+705,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int));
        bufp->chgBit(oldp+706,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
        bufp->chgBit(oldp+707,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int));
        bufp->chgBit(oldp+708,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_push));
        bufp->chgBit(oldp+709,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop));
        bufp->chgSData(oldp+710,((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out) 
                                   << 3U) | (IData)(vlSelf->__VdfgTmp_hcd04e225__0))),11);
        bufp->chgBit(oldp+711,((0U != (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                       [0U] | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                               [1U] 
                                               | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                  [2U] 
                                                  | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                     [3U] 
                                                     | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                        [4U] 
                                                        | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                           [5U] 
                                                           | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                              [6U] 
                                                              | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                 [7U] 
                                                                 | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                    [8U] 
                                                                    | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                       [9U] 
                                                                       | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                          [0xaU] 
                                                                          | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                             [0xbU] 
                                                                             | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0xcU] 
                                                                                | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0xdU] 
                                                                                | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0xeU] 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0xfU]))))))))))))))))));
        bufp->chgCData(oldp+712,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count),5);
        bufp->chgCData(oldp+713,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count),5);
        bufp->chgCData(oldp+714,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate),3);
        bufp->chgCData(oldp+715,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate),4);
        bufp->chgSData(oldp+716,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t),10);
        bufp->chgBit(oldp+717,((1U & (~ (IData)((0U 
                                                 != (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt)))))));
        bufp->chgCData(oldp+718,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt),8);
        bufp->chgCData(oldp+719,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value),8);
        bufp->chgBit(oldp+720,((1U & ((~ (IData)(vlSelf->uart_rx__en0)) 
                                      | ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                         & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                            | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0))))))));
        bufp->chgBit(oldp+721,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__max_repeat_time));
        bufp->chgBit(oldp+722,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
        bufp->chgBit(oldp+723,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_in));
        bufp->chgBit(oldp+724,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_push_pulse));
        bufp->chgBit(oldp+725,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
        bufp->chgBit(oldp+726,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read));
        bufp->chgBit(oldp+727,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read));
        bufp->chgBit(oldp+728,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read));
        bufp->chgCData(oldp+729,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals),4);
        bufp->chgBit(oldp+730,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d));
        bufp->chgBit(oldp+731,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d));
        bufp->chgBit(oldp+732,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d));
        bufp->chgBit(oldp+733,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d));
        bufp->chgBit(oldp+734,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d));
        bufp->chgBit(oldp+735,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d));
        bufp->chgBit(oldp+736,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d));
        bufp->chgBit(oldp+737,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d));
        bufp->chgSData(oldp+738,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt),9);
        bufp->chgSData(oldp+739,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next),9);
        bufp->chgBit(oldp+740,((1U & (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                                       ^ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                                      >> 8U))));
        bufp->chgBit(oldp+741,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d));
        bufp->chgBit(oldp+742,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d));
        bufp->chgBit(oldp+743,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d));
        bufp->chgBit(oldp+744,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d));
        bufp->chgBit(oldp+745,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d));
        bufp->chgBit(oldp+746,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))));
        bufp->chgBit(oldp+747,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))));
        bufp->chgBit(oldp+748,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))));
        bufp->chgBit(oldp+749,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))));
        bufp->chgBit(oldp+750,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))));
        bufp->chgBit(oldp+751,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd));
        bufp->chgBit(oldp+752,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd));
        bufp->chgBit(oldp+753,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd));
        bufp->chgBit(oldp+754,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd));
        bufp->chgBit(oldp+755,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd));
        bufp->chgBit(oldp+756,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read));
        bufp->chgBit(oldp+757,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
        bufp->chgBit(oldp+758,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable));
        bufp->chgCData(oldp+759,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16),4);
        bufp->chgCData(oldp+760,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter),3);
        bufp->chgCData(oldp+761,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift),8);
        bufp->chgBit(oldp+762,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity));
        bufp->chgBit(oldp+763,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error));
        bufp->chgBit(oldp+764,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error));
        bufp->chgBit(oldp+765,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in));
        bufp->chgBit(oldp+766,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor));
        bufp->chgCData(oldp+767,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b),8);
        bufp->chgBit(oldp+768,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q));
        bufp->chgSData(oldp+769,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in),11);
        bufp->chgBit(oldp+770,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
        bufp->chgBit(oldp+771,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))));
        bufp->chgBit(oldp+772,((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+773,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+774,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgCData(oldp+775,((0xfU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                                          - (IData)(1U)))),4);
        bufp->chgSData(oldp+776,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value),10);
        bufp->chgCData(oldp+777,((0xffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                           >> 2U))),8);
        bufp->chgCData(oldp+778,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out),8);
        bufp->chgCData(oldp+779,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0]),3);
        bufp->chgCData(oldp+780,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1]),3);
        bufp->chgCData(oldp+781,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2]),3);
        bufp->chgCData(oldp+782,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3]),3);
        bufp->chgCData(oldp+783,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4]),3);
        bufp->chgCData(oldp+784,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5]),3);
        bufp->chgCData(oldp+785,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6]),3);
        bufp->chgCData(oldp+786,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7]),3);
        bufp->chgCData(oldp+787,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8]),3);
        bufp->chgCData(oldp+788,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9]),3);
        bufp->chgCData(oldp+789,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[10]),3);
        bufp->chgCData(oldp+790,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[11]),3);
        bufp->chgCData(oldp+791,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[12]),3);
        bufp->chgCData(oldp+792,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[13]),3);
        bufp->chgCData(oldp+793,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[14]),3);
        bufp->chgCData(oldp+794,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[15]),3);
        bufp->chgCData(oldp+795,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top),4);
        bufp->chgCData(oldp+796,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom),4);
        bufp->chgCData(oldp+797,((0xfU & ((IData)(1U) 
                                          + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)))),4);
        bufp->chgCData(oldp+798,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0U]),3);
        bufp->chgCData(oldp+799,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [1U]),3);
        bufp->chgCData(oldp+800,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [2U]),3);
        bufp->chgCData(oldp+801,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [3U]),3);
        bufp->chgCData(oldp+802,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [4U]),3);
        bufp->chgCData(oldp+803,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [5U]),3);
        bufp->chgCData(oldp+804,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [6U]),3);
        bufp->chgCData(oldp+805,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [7U]),3);
        bufp->chgCData(oldp+806,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [8U]),3);
        bufp->chgCData(oldp+807,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [9U]),3);
        bufp->chgCData(oldp+808,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xaU]),3);
        bufp->chgCData(oldp+809,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xbU]),3);
        bufp->chgCData(oldp+810,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xcU]),3);
        bufp->chgCData(oldp+811,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xdU]),3);
        bufp->chgCData(oldp+812,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xeU]),3);
        bufp->chgCData(oldp+813,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xfU]),3);
        bufp->chgCData(oldp+814,((0xffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                                           >> 3U))),8);
        bufp->chgCData(oldp+815,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+816,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+817,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+818,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+819,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+820,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+821,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+822,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+823,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+824,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+825,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+826,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+827,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+828,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+829,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+830,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[15]),8);
        bufp->chgBit(oldp+831,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en))));
        bufp->chgCData(oldp+832,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter),5);
        bufp->chgCData(oldp+833,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter),3);
        bufp->chgCData(oldp+834,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out),7);
        bufp->chgBit(oldp+835,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
        bufp->chgBit(oldp+836,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor));
        bufp->chgBit(oldp+837,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop));
        bufp->chgBit(oldp+838,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out));
        bufp->chgBit(oldp+839,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error));
        bufp->chgCData(oldp+840,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time),3);
        bufp->chgCData(oldp+841,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out),8);
        bufp->chgBit(oldp+842,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun));
        bufp->chgCData(oldp+843,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak),8);
        bufp->chgCData(oldp+844,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top),4);
        bufp->chgCData(oldp+845,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom),4);
        bufp->chgCData(oldp+846,((0xfU & ((IData)(1U) 
                                          + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)))),4);
        bufp->chgCData(oldp+847,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+848,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+849,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+850,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+851,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+852,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+853,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+854,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+855,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+856,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+857,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+858,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+859,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+860,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+861,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+862,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[15]),8);
        bufp->chgCData(oldp+863,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit),5);
        bufp->chgCData(oldp+864,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit),5);
        bufp->chgCData(oldp+865,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit),5);
        bufp->chgCData(oldp+866,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready),5);
        bufp->chgCData(oldp+867,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready),5);
        bufp->chgCData(oldp+868,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid),5);
        bufp->chgCData(oldp+869,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready),5);
        bufp->chgCData(oldp+870,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast),5);
        bufp->chgCData(oldp+871,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid),5);
        bufp->chgCData(oldp+872,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0]),4);
        bufp->chgCData(oldp+873,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1]),4);
        bufp->chgCData(oldp+874,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2]),4);
        bufp->chgCData(oldp+875,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3]),4);
        bufp->chgCData(oldp+876,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4]),4);
        bufp->chgCData(oldp+877,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0]),4);
        bufp->chgCData(oldp+878,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1]),4);
        bufp->chgCData(oldp+879,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2]),4);
        bufp->chgCData(oldp+880,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3]),4);
        bufp->chgCData(oldp+881,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4]),4);
        bufp->chgCData(oldp+882,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0),3);
        bufp->chgCData(oldp+883,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1),3);
        bufp->chgCData(oldp+884,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0),3);
        bufp->chgCData(oldp+885,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid),3);
        bufp->chgCData(oldp+886,((((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid) 
                                   << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid))),3);
        bufp->chgCData(oldp+887,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid),3);
        bufp->chgBit(oldp+888,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty));
        bufp->chgBit(oldp+889,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full));
        bufp->chgBit(oldp+890,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty));
        bufp->chgBit(oldp+891,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full));
        bufp->chgCData(oldp+892,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir),3);
        bufp->chgCData(oldp+893,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel),3);
        bufp->chgBit(oldp+894,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog));
        bufp->chgCData(oldp+895,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg),3);
        bufp->chgCData(oldp+896,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel),3);
        bufp->chgCData(oldp+897,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel),3);
        bufp->chgCData(oldp+898,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir),3);
        bufp->chgCData(oldp+899,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel),3);
        bufp->chgBit(oldp+900,((1U & (~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0) 
                                         | (0x1fe0U 
                                            == (vlSelf->simu_top__DOT__soc__DOT__cpu_araddr 
                                                >> 0x10U)))))));
        bufp->chgIData(oldp+901,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int),32);
        bufp->chgCData(oldp+902,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+903,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+904,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+905,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+906,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+907,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+908,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i),32);
        bufp->chgCData(oldp+909,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+910,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+911,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+912,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+913,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+914,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+915,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i),32);
        bufp->chgQData(oldp+916,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)) 
                                   << 0x2bU) | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize)) 
                                                 << 0x28U) 
                                                | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                    << 0x24U) 
                                                   | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                       << 4U) 
                                                      | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid))))))),45);
        bufp->chgIData(oldp+918,(((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+919,((((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                   & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                  | (((- (IData)((1U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                      & ((((IData)(1U) 
                                           + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                              >> 2U)) 
                                          << 2U) | 
                                         (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))) 
                                     | ((- (IData)(
                                                   (2U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                        & ((0xffffffc0U 
                                            & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                           | ((0x3cU 
                                               & ((0xfffffffcU 
                                                   & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                       << 2U) 
                                                      & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                  | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                          >> 2U))) 
                                                     << 2U))) 
                                              | (3U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
        bufp->chgIData(oldp+920,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                  | ((0x3cU & ((0xfffffffcU 
                                                & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                    << 2U) 
                                                   & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                                   & ((IData)(1U) 
                                                      + 
                                                      (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                       >> 2U))) 
                                                  << 2U))) 
                                     | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)))),32);
        bufp->chgCData(oldp+921,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+922,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+923,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+924,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+925,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+926,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+927,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+928,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+929,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+930,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data),45);
        bufp->chgQData(oldp+932,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+934,((IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                          >> 0xdU))),32);
        bufp->chgCData(oldp+935,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 0xbU)))),2);
        bufp->chgCData(oldp+936,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+937,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                  >> 4U)))),4);
        bufp->chgCData(oldp+938,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+939,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+940,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+941,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                   << 0xdU) | (QData)((IData)(
                                                              (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                << 0xbU) 
                                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                   << 8U) 
                                                                  | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                      << 4U) 
                                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid)))))))),45);
        bufp->chgIData(oldp+943,(((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+944,((((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                   & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                  | (((- (IData)((1U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                      & ((((IData)(1U) 
                                           + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                              >> 2U)) 
                                          << 2U) | 
                                         (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                     | ((- (IData)(
                                                   (2U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                        & ((0xffffffc0U 
                                            & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                           | ((0x3cU 
                                               & ((0xfffffffcU 
                                                   & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                       << 2U) 
                                                      & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                                  | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                          >> 2U))) 
                                                     << 2U))) 
                                              | (3U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
        bufp->chgIData(oldp+945,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                  | ((0x3cU & ((0xfffffffcU 
                                                & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                    << 2U) 
                                                   & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                   & ((IData)(1U) 
                                                      + 
                                                      (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                       >> 2U))) 
                                                  << 2U))) 
                                     | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
        bufp->chgCData(oldp+946,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+947,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+948,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+949,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+950,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+951,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+952,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+953,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgQData(oldp+954,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push_data),45);
        bufp->chgQData(oldp+956,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+958,((IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                          >> 0xdU))),32);
        bufp->chgCData(oldp+959,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 0xbU)))),2);
        bufp->chgCData(oldp+960,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+961,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                  >> 4U)))),4);
        bufp->chgCData(oldp+962,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+963,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+964,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+965,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+966,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+967,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgCData(oldp+968,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgBit(oldp+969,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+970,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid));
        bufp->chgIData(oldp+971,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr0),32);
        bufp->chgIData(oldp+972,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr1),32);
        bufp->chgIData(oldp+973,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr2),32);
        bufp->chgIData(oldp+974,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr3),32);
        bufp->chgIData(oldp+975,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr4),32);
        bufp->chgIData(oldp+976,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr5),32);
        bufp->chgIData(oldp+977,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr6),32);
        bufp->chgIData(oldp+978,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr7),32);
        bufp->chgIData(oldp+979,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_data),32);
        bufp->chgIData(oldp+980,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data),32);
        bufp->chgIData(oldp+981,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data),32);
        bufp->chgIData(oldp+982,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_data),32);
        bufp->chgIData(oldp+983,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),32);
        bufp->chgIData(oldp+984,(((2U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                         << 1U)) | 
                                  (1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))))),32);
        bufp->chgCData(oldp+985,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data),8);
        bufp->chgBit(oldp+986,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid));
        bufp->chgIData(oldp+987,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r2),32);
        bufp->chgIData(oldp+988,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__simu_flag),32);
        bufp->chgIData(oldp+989,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__io_simu),32);
        bufp->chgCData(oldp+990,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data),8);
        bufp->chgBit(oldp+991,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__open_trace));
        bufp->chgBit(oldp+992,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_monitor));
        bufp->chgBit(oldp+993,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin));
        bufp->chgBit(oldp+994,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1));
        bufp->chgBit(oldp+995,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2));
        bufp->chgBit(oldp+996,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3));
        bufp->chgBit(oldp+997,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1));
        bufp->chgBit(oldp+998,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2));
        bufp->chgIData(oldp+999,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r),32);
        bufp->chgIData(oldp+1000,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1),32);
        bufp->chgIData(oldp+1001,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2),32);
        bufp->chgIData(oldp+1002,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r1),32);
        bufp->chgIData(oldp+1003,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer),32);
        bufp->chgCData(oldp+1004,((0xffU & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata)),8);
        bufp->chgSData(oldp+1005,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),16);
        bufp->chgCData(oldp+1006,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state),3);
        bufp->chgBit(oldp+1007,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_flag));
        bufp->chgIData(oldp+1008,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count),20);
        bufp->chgCData(oldp+1009,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state_count),4);
        bufp->chgBit(oldp+1010,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                       >> 0x13U))));
        bufp->chgBit(oldp+1011,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r));
        bufp->chgBit(oldp+1012,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r));
        bufp->chgBit(oldp+1013,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_flag));
        bufp->chgIData(oldp+1014,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count),20);
        bufp->chgBit(oldp+1015,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
                                       >> 0x13U))));
        bufp->chgBit(oldp+1016,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_flag));
        bufp->chgIData(oldp+1017,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count),20);
        bufp->chgBit(oldp+1018,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
                                       >> 0x13U))));
        bufp->chgIData(oldp+1019,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__count),20);
        bufp->chgCData(oldp+1020,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__scan_data),4);
        bufp->chgCData(oldp+1021,(vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__arlen),8);
        bufp->chgCData(oldp+1022,(vlSelf->simu_top__DOT__soc__DOT____Vcellout__cpu__awlen),8);
        bufp->chgBit(oldp+1023,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset));
        bufp->chgBit(oldp+1024,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e_self));
        bufp->chgIData(oldp+1025,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U]),32);
        bufp->chgIData(oldp+1026,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U]),32);
        bufp->chgSData(oldp+1027,(((0x3e0U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U]) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2))),10);
        bufp->chgCData(oldp+1028,(((0x40U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                             >> 5U)) 
                                   | ((0x3eU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                                << 1U)) 
                                      | (1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                               >> 5U))))),7);
        bufp->chgCData(oldp+1029,(((0x40U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                             >> 5U)) 
                                   | ((0x3eU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                                << 1U)) 
                                      | (1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                               >> 5U))))),7);
        bufp->chgBit(oldp+1030,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__excp_flush));
        bufp->chgBit(oldp+1031,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                       >> 7U))));
        bufp->chgBit(oldp+1032,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild) 
                                 & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok)) 
                                    | (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num))))));
        bufp->chgIData(oldp+1033,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r),32);
        bufp->chgBit(oldp+1034,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_data_ok));
        bufp->chgBit(oldp+1035,((0U != (0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                                >> 6U)))));
        bufp->chgCData(oldp+1036,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_size),2);
        bufp->chgCData(oldp+1037,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_wstrb),4);
        bufp->chgIData(oldp+1038,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_wdata),32);
        bufp->chgBit(oldp+1039,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__data_sram_data_ok));
        bufp->chgBit(oldp+1040,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))));
        bufp->chgIData(oldp+1041,((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)),32);
        bufp->chgBit(oldp+1042,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_req));
        bufp->chgBit(oldp+1043,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_wr));
        bufp->chgIData(oldp+1044,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_cache_data_sram_addr),32);
        bufp->chgIData(oldp+1045,((((0U == (0x1fU & 
                                            VL_SHIFTL_III(9,9,32, (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt), 5U)))
                                     ? 0U : (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__wb_buffer[
                                             (((IData)(0x1fU) 
                                               + (0x1ffU 
                                                  & VL_SHIFTL_III(9,9,32, (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt), 5U))) 
                                              >> 5U)] 
                                             << ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & VL_SHIFTL_III(9,9,32, (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt), 5U))))) 
                                   | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__wb_buffer[
                                      (0xfU & (VL_SHIFTL_III(9,9,32, (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt), 5U) 
                                               >> 5U))] 
                                      >> (0x1fU & VL_SHIFTL_III(9,9,32, (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt), 5U))))),32);
        bufp->chgBit(oldp+1046,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w));
        bufp->chgBit(oldp+1047,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__cached_mt));
        bufp->chgIData(oldp+1048,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__addr_o_r),32);
        bufp->chgCData(oldp+1049,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_crmd 
                                         >> 7U))),2);
        bufp->chgSData(oldp+1050,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_addr),14);
        bufp->chgIData(oldp+1051,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_data),32);
        bufp->chgBit(oldp+1052,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                       >> 0xcU))));
        bufp->chgBit(oldp+1053,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                       >> 0xfU))));
        bufp->chgBit(oldp+1054,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                       >> 0xfU))));
        bufp->chgBit(oldp+1055,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                       >> 7U))));
        bufp->chgIData(oldp+1056,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__next_pc),32);
        bufp->chgBit(oldp+1057,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__adef_r));
        bufp->chgBit(oldp+1058,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ready_o));
        bufp->chgBit(oldp+1059,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                       >> 0x11U))));
        bufp->chgIData(oldp+1060,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U] 
                                    << 0x18U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                                 >> 8U))),32);
        bufp->chgSData(oldp+1061,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U] 
                                              >> 8U))),14);
        bufp->chgCData(oldp+1062,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)
                                    ? 0U : (0x3fU & 
                                            ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[2U] 
                                              << 1U) 
                                             | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[1U] 
                                                >> 0x1fU))))),6);
        bufp->chgBit(oldp+1063,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)) 
                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[1U] 
                                          >> 0x1eU)))));
        bufp->chgIData(oldp+1064,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)
                                    ? 0U : ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[1U] 
                                             << 2U) 
                                            | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[0U] 
                                               >> 0x1eU)))),32);
        bufp->chgSData(oldp+1065,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)
                                    ? 0U : (0x1ffU 
                                            & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[0U] 
                                               >> 0x15U)))),9);
        bufp->chgBit(oldp+1066,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)) 
                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[0U] 
                                          >> 0x14U)))));
        bufp->chgBit(oldp+1067,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)) 
                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[0U] 
                                          >> 0x13U)))));
        bufp->chgIData(oldp+1068,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle)
                                    ? 0U : (0x7ffffU 
                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT____VdfgTmp_h1051f08c__0[0U]))),19);
        bufp->chgBit(oldp+1069,(((IData)(vlSelf->__VdfgTmp_ha16d735d__0) 
                                 | ((IData)(vlSelf->__VdfgTmp_h6e525a2d__0) 
                                    | ((IData)(vlSelf->__VdfgTmp_h9ba6ddcc__0) 
                                       | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                            >> 0xcU) 
                                           & (((0x1000U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                ? (
                                                   (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                    >> 0x16U) 
                                                   == 
                                                   (0x3ffU 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                       [0xcU] 
                                                       >> 9U)))
                                                : (
                                                   (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                    >> 0xdU) 
                                                   == 
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                   [0xcU])) 
                                              & (((0x3ffU 
                                                   & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                  == 
                                                  vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                  [0xcU]) 
                                                 | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                 [0xcU]))) 
                                          | ((IData)(vlSelf->__VdfgTmp_h405c1a80__0) 
                                             | ((IData)(vlSelf->__VdfgTmp_h5b0b239b__0) 
                                                | ((IData)(vlSelf->__VdfgTmp_h3ead788f__0) 
                                                   | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                        >> 8U) 
                                                       & (((0x100U 
                                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                            ? 
                                                           ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                             >> 0x16U) 
                                                            == 
                                                            (0x3ffU 
                                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                [8U] 
                                                                >> 9U)))
                                                            : 
                                                           ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                             >> 0xdU) 
                                                            == 
                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                            [8U])) 
                                                          & (((0x3ffU 
                                                               & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                              == 
                                                              vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                              [8U]) 
                                                             | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                             [8U]))) 
                                                      | ((IData)(vlSelf->__VdfgTmp_hf5775b5c__0) 
                                                         | ((IData)(vlSelf->__VdfgTmp_hcb2f5762__0) 
                                                            | ((IData)(vlSelf->__VdfgTmp_hb57cfd67__0) 
                                                               | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                    >> 4U) 
                                                                   & (((0x10U 
                                                                        & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                        ? 
                                                                       ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                         >> 0x16U) 
                                                                        == 
                                                                        (0x3ffU 
                                                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                            [4U] 
                                                                            >> 9U)))
                                                                        : 
                                                                       ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                         >> 0xdU) 
                                                                        == 
                                                                        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                        [4U])) 
                                                                      & (((0x3ffU 
                                                                           & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                          == 
                                                                          vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                          [4U]) 
                                                                         | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                         [4U]))) 
                                                                  | ((IData)(vlSelf->__VdfgTmp_h6f6a7daa__0) 
                                                                     | ((IData)(vlSelf->__VdfgTmp_hc8f24e6b__0) 
                                                                        | ((IData)(vlSelf->__VdfgTmp_h651600d2__0) 
                                                                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                              & (((1U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0x16U) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0xdU) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U])) 
                                                                                & (((0x3ffU 
                                                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [0U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [0U]))))))))))))))))))));
        bufp->chgCData(oldp+1070,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index),5);
        bufp->chgIData(oldp+1071,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_eentry),32);
        bufp->chgIData(oldp+1072,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_era),32);
        bufp->chgBit(oldp+1073,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int));
        bufp->chgIData(oldp+1074,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tid),32);
        bufp->chgQData(oldp+1075,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64),64);
        bufp->chgCData(oldp+1077,((0x1fU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64))),5);
        bufp->chgSData(oldp+1078,((0x3ffU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid)),10);
        bufp->chgCData(oldp+1079,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_estat 
                                            >> 0x10U))),6);
        bufp->chgIData(oldp+1080,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbidx),32);
        bufp->chgIData(oldp+1081,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbehi),32);
        bufp->chgIData(oldp+1082,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0),32);
        bufp->chgIData(oldp+1083,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1),32);
        bufp->chgCData(oldp+1084,((3U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_crmd)),2);
        bufp->chgCData(oldp+1085,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__pgda_out),2);
        bufp->chgIData(oldp+1086,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dmw0_out),32);
        bufp->chgIData(oldp+1087,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dmw1_out),32);
        bufp->chgIData(oldp+1088,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[0U]),32);
        bufp->chgBit(oldp+1089,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                       >> 8U))));
        bufp->chgCData(oldp+1090,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__read_state),2);
        bufp->chgCData(oldp+1091,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_1),3);
        bufp->chgCData(oldp+1092,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_0),3);
        bufp->chgBit(oldp+1093,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__inst_sram_req_r));
        bufp->chgBit(oldp+1094,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__data_cache_sram_req_r));
        bufp->chgBit(oldp+1095,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__data_nocache_sram_req_r));
        bufp->chgCData(oldp+1096,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__r_iscache),2);
        bufp->chgCData(oldp+1097,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__write_requst_state),3);
        bufp->chgCData(oldp+1098,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__wt_drop_1),3);
        bufp->chgCData(oldp+1099,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__transfer_cnt),6);
        bufp->chgCData(oldp+1100,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__w_iscache),2);
        bufp->chgIData(oldp+1101,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                   >> 0xaU)),22);
        bufp->chgCData(oldp+1102,((0xffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                            >> 2U))),8);
        bufp->chgCData(oldp+1103,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset)
                                    ? 0U : (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__taglist
                                              [(0xffU 
                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                   >> 2U))] 
                                              == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                  >> 0xaU)) 
                                             & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__valid
                                             [(0xffU 
                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                  >> 2U))])
                                             ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__typelist
                                            [(0xffU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                 >> 2U))]
                                             : 0U))),2);
        bufp->chgIData(oldp+1104,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset)
                                    ? 0U : (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__taglist
                                              [(0xffU 
                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                   >> 2U))] 
                                              == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                  >> 0xaU)) 
                                             & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__valid
                                             [(0xffU 
                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                  >> 2U))])
                                             ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__tarlist
                                            [(0xffU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                 >> 2U))]
                                             : 0U))),32);
        bufp->chgBit(oldp+1105,(((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset))) 
                                 && (1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__dirlist
                                           [(0xffU 
                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                >> 2U))] 
                                           >> 1U)))));
        bufp->chgBit(oldp+1106,(((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset))) 
                                 && ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__taglist
                                      [(0xffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                 >> 2U))] 
                                      == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                          >> 0xaU)) 
                                     & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__valid
                                     [(0xffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_r 
                                                >> 2U))]))));
        bufp->chgIData(oldp+1107,((0x7fffffffU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])),32);
        bufp->chgIData(oldp+1108,((0x1fffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U] 
                                                >> 0xaU))),22);
        bufp->chgCData(oldp+1109,((0xffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U] 
                                            >> 2U))),8);
        bufp->chgIData(oldp+1110,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__i),32);
        bufp->chgIData(oldp+1111,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__u_bb__DOT__j),32);
        bufp->chgBit(oldp+1112,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__dmw0_wen));
        bufp->chgBit(oldp+1113,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__dmw1_wen));
        bufp->chgBit(oldp+1114,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x400U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1115,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0U == (0x3fff00U 
                                                   & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1116,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x100U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1117,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x500U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1118,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x600U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1119,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0xc00U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1120,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x3000U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1121,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x3100U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1122,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x3200U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1123,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x3300U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1124,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x4000U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1125,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__tcfg_wen));
        bufp->chgBit(oldp+1126,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x4200U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1127,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x4400U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1128,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x700U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1129,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x1100U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1130,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x1000U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1131,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x1800U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1132,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x1200U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgBit(oldp+1133,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                  >> 7U) & (0x1300U 
                                            == (0x3fff00U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U])))));
        bufp->chgIData(oldp+1134,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_crmd),32);
        bufp->chgIData(oldp+1135,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_prmd),32);
        bufp->chgIData(oldp+1136,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_estat),32);
        bufp->chgIData(oldp+1137,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tcfg),32);
        bufp->chgIData(oldp+1138,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tval),32);
        bufp->chgIData(oldp+1139,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_ticlr),32);
        bufp->chgIData(oldp+1140,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save0),32);
        bufp->chgIData(oldp+1141,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save1),32);
        bufp->chgIData(oldp+1142,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_save2),32);
        bufp->chgIData(oldp+1143,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_ecfg),32);
        bufp->chgIData(oldp+1144,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_badv),32);
        bufp->chgIData(oldp+1145,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_dmw0),32);
        bufp->chgIData(oldp+1146,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_dmw1),32);
        bufp->chgIData(oldp+1147,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid),32);
        bufp->chgBit(oldp+1148,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_en));
        bufp->chgBit(oldp+1149,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wr));
        bufp->chgCData(oldp+1150,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__size),2);
        bufp->chgCData(oldp+1151,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wstrb),4);
        bufp->chgIData(oldp+1152,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr),32);
        bufp->chgBit(oldp+1153,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__cached));
        bufp->chgIData(oldp+1154,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__wdata),32);
        bufp->chgBit(oldp+1155,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drop_num));
        bufp->chgBit(oldp+1156,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w) 
                                 & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state)) 
                                    & (6U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state))))));
        bufp->chgBit(oldp+1157,(((6U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drop_num))));
        bufp->chgBit(oldp+1158,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__drity_new_cacheline));
        if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__lru_r) {
            __Vtemp_38[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg;
            __Vtemp_38[0xeU] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg)) 
                                         << 0x20U) 
                                        | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg))));
            __Vtemp_38[0xfU] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg)) 
                                          << 0x20U) 
                                         | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg))) 
                                        >> 0x20U));
        } else {
            __Vtemp_38[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg;
            __Vtemp_38[0xeU] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg)) 
                                         << 0x20U) 
                                        | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg))));
            __Vtemp_38[0xfU] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg)) 
                                          << 0x20U) 
                                         | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg))) 
                                        >> 0x20U));
        }
        bufp->chgWData(oldp+1159,(__Vtemp_38),512);
        bufp->chgWData(oldp+1175,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg),512);
        bufp->chgIData(oldp+1191,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__lru)
                                    ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_h91e0ffe6__0 
                                        << 0xcU) | 
                                       (0xfc0U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr))
                                    : ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_hbfaab181__0 
                                        << 0xcU) | 
                                       (0xfc0U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr)))),32);
        bufp->chgBit(oldp+1192,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__replace_cache));
        bufp->chgBit(oldp+1193,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__true_replace_cache));
        bufp->chgBit(oldp+1194,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__lru));
        bufp->chgCData(oldp+1195,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__state),3);
        bufp->chgCData(oldp+1196,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__transfer_cnt),4);
        bufp->chgIData(oldp+1197,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__saved_addr),32);
        bufp->chgWData(oldp+1198,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_ctrl__DOT__wb_buffer),512);
        bufp->chgIData(oldp+1214,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[0]),32);
        bufp->chgIData(oldp+1215,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[1]),32);
        bufp->chgIData(oldp+1216,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[2]),32);
        bufp->chgIData(oldp+1217,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[3]),32);
        bufp->chgIData(oldp+1218,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[4]),32);
        bufp->chgIData(oldp+1219,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[5]),32);
        bufp->chgIData(oldp+1220,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[6]),32);
        bufp->chgIData(oldp+1221,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[7]),32);
        bufp->chgIData(oldp+1222,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[8]),32);
        bufp->chgIData(oldp+1223,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[9]),32);
        bufp->chgIData(oldp+1224,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[10]),32);
        bufp->chgIData(oldp+1225,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[11]),32);
        bufp->chgIData(oldp+1226,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[12]),32);
        bufp->chgIData(oldp+1227,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[13]),32);
        bufp->chgIData(oldp+1228,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[14]),32);
        bufp->chgIData(oldp+1229,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way0[15]),32);
        bufp->chgIData(oldp+1230,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[0]),32);
        bufp->chgIData(oldp+1231,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[1]),32);
        bufp->chgIData(oldp+1232,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[2]),32);
        bufp->chgIData(oldp+1233,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[3]),32);
        bufp->chgIData(oldp+1234,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[4]),32);
        bufp->chgIData(oldp+1235,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[5]),32);
        bufp->chgIData(oldp+1236,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[6]),32);
        bufp->chgIData(oldp+1237,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[7]),32);
        bufp->chgIData(oldp+1238,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[8]),32);
        bufp->chgIData(oldp+1239,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[9]),32);
        bufp->chgIData(oldp+1240,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[10]),32);
        bufp->chgIData(oldp+1241,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[11]),32);
        bufp->chgIData(oldp+1242,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[12]),32);
        bufp->chgIData(oldp+1243,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[13]),32);
        bufp->chgIData(oldp+1244,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[14]),32);
        bufp->chgIData(oldp+1245,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_mux_way1[15]),32);
        __Vtemp_52[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg;
        __Vtemp_52[0xeU] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg)) 
                                     << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg))));
        __Vtemp_52[0xfU] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg)) 
                                      << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg))) 
                                    >> 0x20U));
        bufp->chgWData(oldp+1246,(__Vtemp_52),512);
        __Vtemp_66[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg;
        __Vtemp_66[0xeU] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg)) 
                                     << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg))));
        __Vtemp_66[0xfU] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg)) 
                                      << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg))) 
                                    >> 0x20U));
        bufp->chgWData(oldp+1262,(__Vtemp_66),512);
        bufp->chgCData(oldp+1278,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr 
                                            >> 6U))),6);
        bufp->chgIData(oldp+1279,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr 
                                   >> 0xcU)),20);
        bufp->chgCData(oldp+1280,((0x3fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr)),6);
        bufp->chgSData(oldp+1281,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_sel),16);
        bufp->chgCData(oldp+1282,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__hit_r),2);
        bufp->chgBit(oldp+1283,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__lru_r));
        bufp->chgBit(oldp+1284,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r));
        bufp->chgSData(oldp+1285,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__bank_sel_r),16);
        bufp->chgIData(oldp+1286,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[0]),32);
        bufp->chgIData(oldp+1287,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[1]),32);
        bufp->chgIData(oldp+1288,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[2]),32);
        bufp->chgIData(oldp+1289,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[3]),32);
        bufp->chgIData(oldp+1290,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[4]),32);
        bufp->chgIData(oldp+1291,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[5]),32);
        bufp->chgIData(oldp+1292,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[6]),32);
        bufp->chgIData(oldp+1293,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[7]),32);
        bufp->chgIData(oldp+1294,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[8]),32);
        bufp->chgIData(oldp+1295,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[9]),32);
        bufp->chgIData(oldp+1296,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[10]),32);
        bufp->chgIData(oldp+1297,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[11]),32);
        bufp->chgIData(oldp+1298,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[12]),32);
        bufp->chgIData(oldp+1299,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[13]),32);
        bufp->chgIData(oldp+1300,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[14]),32);
        bufp->chgIData(oldp+1301,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way0[15]),32);
        bufp->chgIData(oldp+1302,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[0]),32);
        bufp->chgIData(oldp+1303,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[1]),32);
        bufp->chgIData(oldp+1304,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[2]),32);
        bufp->chgIData(oldp+1305,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[3]),32);
        bufp->chgIData(oldp+1306,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[4]),32);
        bufp->chgIData(oldp+1307,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[5]),32);
        bufp->chgIData(oldp+1308,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[6]),32);
        bufp->chgIData(oldp+1309,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[7]),32);
        bufp->chgIData(oldp+1310,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[8]),32);
        bufp->chgIData(oldp+1311,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[9]),32);
        bufp->chgIData(oldp+1312,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[10]),32);
        bufp->chgIData(oldp+1313,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[11]),32);
        bufp->chgIData(oldp+1314,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[12]),32);
        bufp->chgIData(oldp+1315,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[13]),32);
        bufp->chgIData(oldp+1316,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[14]),32);
        bufp->chgIData(oldp+1317,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__rdata_way1[15]),32);
        bufp->chgIData(oldp+1318,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr 
                                            >> 6U))),32);
        bufp->chgIData(oldp+1319,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1320,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1321,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1322,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1323,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1324,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1325,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1326,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1327,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1328,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1329,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1330,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1331,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1332,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1333,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1334,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1335,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1336,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1337,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1338,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1339,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1340,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1341,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1342,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1343,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1344,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1345,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1346,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1347,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1348,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1349,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__dina),32);
        bufp->chgIData(oldp+1350,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1351,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1352,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1353,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1354,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1355,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1356,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1357,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1358,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1359,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1360,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1361,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1362,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1363,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1364,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1365,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1366,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgCData(oldp+1367,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr 
                                           >> 2U))),4);
        bufp->chgIData(oldp+1368,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__i),32);
        bufp->chgIData(oldp+1369,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__j),32);
        bufp->chgQData(oldp+1370,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT__lru_r),64);
        bufp->chgIData(oldp+1372,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_h91e0ffe6__0 
                                    << 0xcU) | (0xfc0U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr))),32);
        bufp->chgIData(oldp+1373,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_tag__DOT____VdfgTmp_hbfaab181__0 
                                    << 0xcU) | (0xfc0U 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__addr))),32);
        bufp->chgIData(oldp+1374,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U]),32);
        bufp->chgIData(oldp+1375,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[0U]),32);
        bufp->chgSData(oldp+1376,(((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w) 
                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w) 
                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_wu))) 
                                    << 0xdU) | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2986b060__0) 
                                                  | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w) 
                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_wu))) 
                                                 << 0xcU) 
                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                                    << 0xbU) 
                                                   | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w) 
                                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sra_w)) 
                                                       << 0xaU) 
                                                      | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w) 
                                                           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srl_w)) 
                                                          << 9U) 
                                                         | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w) 
                                                              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sll_w)) 
                                                             << 8U) 
                                                            | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xor) 
                                                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)) 
                                                                << 7U) 
                                                               | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_or) 
                                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori)) 
                                                                   << 6U) 
                                                                  | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_nor) 
                                                                      << 5U) 
                                                                     | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_and) 
                                                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi)) 
                                                                         << 4U) 
                                                                        | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltu) 
                                                                             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui)) 
                                                                            << 3U) 
                                                                           | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slt) 
                                                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti)) 
                                                                               << 2U) 
                                                                              | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sub_w) 
                                                                                << 1U) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_add_w) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_addi_w) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h) 
                                                                                | ((0x13U 
                                                                                == 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                                >> 0x1aU)) 
                                                                                | ((0x15U 
                                                                                == 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                                >> 0x1aU)) 
                                                                                | ((7U 
                                                                                == 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                                >> 0x1aU)) 
                                                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0)))))))))))))))))))))))),14);
        bufp->chgBit(oldp+1377,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__src2_is_4) 
                                 | (7U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU)))));
        bufp->chgBit(oldp+1378,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w) 
                                  | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w) 
                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w))) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_addi_w) 
                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                          | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                             | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h) 
                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                                   | ((7U 
                                                       == 
                                                       (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x1aU)) 
                                                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti) 
                                                         | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui) 
                                                            | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi) 
                                                               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori) 
                                                                  | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori) 
                                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0))))))))))))))));
        bufp->chgBit(oldp+1379,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0))));
        bufp->chgBit(oldp+1380,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrrd) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrwr) 
                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_mask) 
                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w) 
                                          | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w) 
                                             | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cpucfg)))))))));
        bufp->chgIData(oldp+1381,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))
                                    ? (((IData)((0x1ffffffffULL 
                                                 & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w))))) 
                                        & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64)) 
                                       | ((IData)((0x1ffffffffULL 
                                                   & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))))) 
                                          & (IData)(
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64 
                                                     >> 0x20U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_data)),32);
        bufp->chgSData(oldp+1382,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 0xaU))),14);
        bufp->chgBit(oldp+1383,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_we));
        bufp->chgBit(oldp+1384,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_mask));
        bufp->chgBit(oldp+1385,((0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1386,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w)) 
                                 & ((0x16U != (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                               >> 0x1aU)) 
                                    & ((0x17U != (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                       & ((0x14U != 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                          & ((0x18U 
                                              != (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                             & ((0x19U 
                                                 != 
                                                 (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                                & ((0x1aU 
                                                    != 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   & ((0x1bU 
                                                       != 
                                                       (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x1aU)) 
                                                      & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b)) 
                                                         & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h)) 
                                                            & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall)) 
                                                               & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ertn)) 
                                                                  & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break)) 
                                                                     & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cacop)) 
                                                                        & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_tlbwr)) 
                                                                           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine)) 
                                                                              & ((~ 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U]) 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_vaild))))))))))))))))))));
        bufp->chgBit(oldp+1387,(((0x16U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                 | ((0x17U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                               >> 0x1aU)) 
                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                       | ((0x18U == 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                          | ((0x19U 
                                              == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                             | ((0x1aU 
                                                 == 
                                                 (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                                | ((0x1bU 
                                                    == 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h) 
                                                         | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_we))))))))))));
        bufp->chgCData(oldp+1388,(((0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 0x1aU))
                                    ? 1U : (0x1fU & 
                                            ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w)
                                              ? ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  << 0x1bU) 
                                                 | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                    >> 5U))
                                              : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])))),5);
        bufp->chgIData(oldp+1389,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                    | (7U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 0x1aU)))
                                    ? (0xfffff000U 
                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                          << 7U)) : 
                                   (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi) 
                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori) 
                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)))
                                     ? (0xfffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0xaU))
                                     : (((- (IData)(
                                                    (1U 
                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x15U)))) 
                                         << 0xcU) | 
                                        (0xfffU & (
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                   >> 0xaU)))))),32);
        bufp->chgIData(oldp+1390,((((0x14U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                               >> 0x1aU)) 
                                    | (0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                 >> 0x1aU)))
                                    ? (((- (IData)(
                                                   (1U 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                       >> 9U)))) 
                                        << 0x1cU) | 
                                       ((0xffc0000U 
                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            << 0x12U)) 
                                        | (0x3fffcU 
                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 8U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs)),32);
        bufp->chgIData(oldp+1391,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs),32);
        bufp->chgCData(oldp+1392,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w)
                                    ? 0xfU : ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b)
                                               ? 1U
                                               : ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h)
                                                   ? 3U
                                                   : 0U)))),4);
        bufp->chgBit(oldp+1393,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h) 
                                          | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu) 
                                             | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu) 
                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h))))))))));
        bufp->chgCData(oldp+1394,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                   >> 0x1aU)),6);
        bufp->chgCData(oldp+1395,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x16U))),4);
        bufp->chgCData(oldp+1396,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                         >> 0x14U))),2);
        bufp->chgCData(oldp+1397,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0xfU))),5);
        bufp->chgCData(oldp+1398,((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])),5);
        bufp->chgCData(oldp+1399,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 5U))),5);
        bufp->chgCData(oldp+1400,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0xaU))),5);
        bufp->chgSData(oldp+1401,((0xfffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                             >> 0xaU))),12);
        bufp->chgIData(oldp+1402,((0xfffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                               >> 5U))),20);
        bufp->chgSData(oldp+1403,((0xffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 0xaU))),16);
        bufp->chgIData(oldp+1404,(((0x3ff0000U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  << 0x10U)) 
                                   | (0xffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                 >> 0xaU)))),26);
        bufp->chgQData(oldp+1405,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_31_26_d),64);
        bufp->chgSData(oldp+1407,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_25_22_d),16);
        bufp->chgCData(oldp+1408,((((3U == (3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x14U))) 
                                    << 3U) | (((2U 
                                                == 
                                                (3U 
                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                    >> 0x14U))) 
                                               << 2U) 
                                              | (((1U 
                                                   == 
                                                   (3U 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                       >> 0x14U))) 
                                                  << 1U) 
                                                 | (0U 
                                                    == 
                                                    (3U 
                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x14U))))))),4);
        bufp->chgIData(oldp+1409,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__op_19_15_d),32);
        bufp->chgCData(oldp+1410,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2),5);
        bufp->chgWData(oldp+1411,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r),65);
        bufp->chgBit(oldp+1414,((1U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U])));
        bufp->chgBit(oldp+1415,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__valid_d));
        bufp->chgBit(oldp+1416,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_add_w));
        bufp->chgBit(oldp+1417,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sub_w));
        bufp->chgBit(oldp+1418,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slt));
        bufp->chgBit(oldp+1419,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltu));
        bufp->chgBit(oldp+1420,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_nor));
        bufp->chgBit(oldp+1421,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_and));
        bufp->chgBit(oldp+1422,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_or));
        bufp->chgBit(oldp+1423,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xor));
        bufp->chgBit(oldp+1424,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w));
        bufp->chgBit(oldp+1425,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w));
        bufp->chgBit(oldp+1426,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w));
        bufp->chgBit(oldp+1427,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_addi_w));
        bufp->chgBit(oldp+1428,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w));
        bufp->chgBit(oldp+1429,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w));
        bufp->chgBit(oldp+1430,((0x13U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1431,((0x14U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1432,((0x16U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1433,((0x17U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1434,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w));
        bufp->chgBit(oldp+1435,((7U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                        >> 0x1aU))));
        bufp->chgBit(oldp+1436,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti));
        bufp->chgBit(oldp+1437,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui));
        bufp->chgBit(oldp+1438,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi));
        bufp->chgBit(oldp+1439,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori));
        bufp->chgBit(oldp+1440,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori));
        bufp->chgBit(oldp+1441,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sll_w));
        bufp->chgBit(oldp+1442,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sra_w));
        bufp->chgBit(oldp+1443,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srl_w));
        bufp->chgBit(oldp+1444,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_w));
        bufp->chgBit(oldp+1445,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_wu));
        bufp->chgBit(oldp+1446,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w));
        bufp->chgBit(oldp+1447,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_wu));
        bufp->chgBit(oldp+1448,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w));
        bufp->chgBit(oldp+1449,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w));
        bufp->chgBit(oldp+1450,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_wu));
        bufp->chgBit(oldp+1451,((0x18U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1452,((0x19U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1453,((0x1aU == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1454,((0x1bU == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU))));
        bufp->chgBit(oldp+1455,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b));
        bufp->chgBit(oldp+1456,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h));
        bufp->chgBit(oldp+1457,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu));
        bufp->chgBit(oldp+1458,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu));
        bufp->chgBit(oldp+1459,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b));
        bufp->chgBit(oldp+1460,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h));
        bufp->chgBit(oldp+1461,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrrd));
        bufp->chgBit(oldp+1462,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrwr));
        bufp->chgBit(oldp+1463,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall));
        bufp->chgBit(oldp+1464,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ertn));
        bufp->chgBit(oldp+1465,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break));
        bufp->chgBit(oldp+1466,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w));
        bufp->chgBit(oldp+1467,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w));
        bufp->chgBit(oldp+1468,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w));
        bufp->chgBit(oldp+1469,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cpucfg));
        bufp->chgBit(oldp+1470,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2edf41db__0) 
                                 & (IData)(((0x2800U 
                                             == (0x7c00U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])) 
                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2d5aaf1b__0))))));
        bufp->chgBit(oldp+1471,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2edf41db__0) 
                                 & (IData)(((0x2c00U 
                                             == (0x7c00U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])) 
                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2d5aaf1b__0))))));
        bufp->chgBit(oldp+1472,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_tlbwr));
        bufp->chgBit(oldp+1473,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2edf41db__0) 
                                 & (IData)(((0x3400U 
                                             == (0x7c00U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])) 
                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2d5aaf1b__0))))));
        bufp->chgBit(oldp+1474,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h640d2873__0) 
                                 & (0x98000U == (0xf8000U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])))));
        bufp->chgCData(oldp+1475,((7U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[0U])),3);
        bufp->chgCData(oldp+1476,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[0U] 
                                         >> 3U))),2);
        bufp->chgBit(oldp+1477,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cacop));
        bufp->chgIData(oldp+1478,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rk_d),32);
        bufp->chgIData(oldp+1479,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rd_d),32);
        bufp->chgIData(oldp+1480,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rj_d),32);
        bufp->chgCData(oldp+1481,(((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2986b060__0) 
                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w)) 
                                    << 1U) | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_w) 
                                              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w) 
                                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w) 
                                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w) 
                                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h)))))))),2);
        bufp->chgCData(oldp+1482,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w)
                                    ? 3U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu))
                                             ? 1U : 
                                            (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h) 
                                              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu))
                                              ? 2U : 0U)))),2);
        bufp->chgBit(oldp+1483,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w) 
                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w)))));
        bufp->chgBit(oldp+1484,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_addi_w) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                          | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h) 
                                             | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti) 
                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui) 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0))))))))));
        bufp->chgBit(oldp+1485,(((0x13U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                 | ((0x16U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                               >> 0x1aU)) 
                                    | ((0x17U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                       | ((0x18U == 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                          | ((0x19U 
                                              == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                             | ((0x1aU 
                                                 == 
                                                 (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                                | (0x1bU 
                                                   == 
                                                   (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                    >> 0x1aU))))))))));
        bufp->chgBit(oldp+1486,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                 | (7U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                           >> 0x1aU)))));
        bufp->chgBit(oldp+1487,(((0x14U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                 | (0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 0x1aU)))));
        bufp->chgBit(oldp+1488,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__src2_is_4));
        bufp->chgBit(oldp+1489,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi) 
                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori) 
                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)))));
        bufp->chgBit(oldp+1490,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))));
        bufp->chgIData(oldp+1491,((((IData)((0x1ffffffffULL 
                                             & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w))))) 
                                    & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64)) 
                                   | ((IData)((0x1ffffffffULL 
                                               & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))))) 
                                      & (IData)((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64 
                                                 >> 0x20U))))),32);
        bufp->chgBit(oldp+1492,((((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall) 
                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine)) 
                                  | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int)) 
                                 | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U])));
        bufp->chgSData(oldp+1493,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine) 
                                    << 7U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break) 
                                               << 6U) 
                                              | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall) 
                                                  << 5U) 
                                                 | ((2U 
                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U] 
                                                        << 1U)) 
                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int)))))),9);
        bufp->chgBit(oldp+1494,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_vaild));
        bufp->chgBit(oldp+1495,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine));
        bufp->chgBit(oldp+1496,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xfU))));
        bufp->chgIData(oldp+1497,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U]),32);
        bufp->chgIData(oldp+1498,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[4U]),32);
        bufp->chgSData(oldp+1499,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                              >> 3U))),14);
        bufp->chgIData(oldp+1500,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[3U]),32);
        bufp->chgIData(oldp+1501,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[2U]),32);
        bufp->chgBit(oldp+1502,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 2U))));
        bufp->chgBit(oldp+1503,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 1U))));
        bufp->chgBit(oldp+1504,((1U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U])));
        bufp->chgCData(oldp+1505,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                           >> 0x17U))),4);
        bufp->chgBit(oldp+1506,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0x1bU))));
        bufp->chgBit(oldp+1507,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0x1cU))));
        bufp->chgCData(oldp+1508,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                            >> 2U))),5);
        bufp->chgCData(oldp+1509,((0x1fU & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                             << 3U) 
                                            | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                               >> 0x1dU)))),5);
        bufp->chgCData(oldp+1510,((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                            >> 0x11U))),5);
        bufp->chgBit(oldp+1511,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0x16U))));
        bufp->chgBit(oldp+1512,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                       >> 7U))));
        bufp->chgWData(oldp+1513,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r),352);
        bufp->chgCData(oldp+1524,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                         >> 7U))),2);
        bufp->chgCData(oldp+1525,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                         >> 9U))),2);
        bufp->chgIData(oldp+1526,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                    << 0x14U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                 >> 0xcU))),32);
        bufp->chgSData(oldp+1527,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                              >> 0xeU))),14);
        bufp->chgBit(oldp+1528,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                       >> 0xbU))));
        bufp->chgBit(oldp+1529,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                       >> 0xdU))));
        bufp->chgBit(oldp+1530,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                       >> 5U))));
        bufp->chgSData(oldp+1531,((0x1ffU & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                              << 4U) 
                                             | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                                                >> 0x1cU)))),9);
        bufp->chgBit(oldp+1532,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                       >> 6U))));
        bufp->chgBit(oldp+1533,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                       >> 7U))));
        bufp->chgBit(oldp+1534,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0x11U))));
        bufp->chgIData(oldp+1535,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0U]),32);
        bufp->chgIData(oldp+1536,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_src1_buffer),32);
        bufp->chgBit(oldp+1537,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__src1_buffer_has));
        bufp->chgIData(oldp+1538,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_src2_buffer),32);
        bufp->chgBit(oldp+1539,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__src2_buffer_has));
        bufp->chgIData(oldp+1540,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer),32);
        bufp->chgBit(oldp+1541,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer_has));
        bufp->chgIData(oldp+1542,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer),32);
        bufp->chgBit(oldp+1543,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer_has));
        bufp->chgBit(oldp+1544,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0x10U))));
        bufp->chgBit(oldp+1545,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xfU))));
        bufp->chgBit(oldp+1546,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xeU))));
        bufp->chgBit(oldp+1547,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xdU))));
        bufp->chgBit(oldp+1548,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xcU))));
        bufp->chgBit(oldp+1549,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xbU))));
        bufp->chgBit(oldp+1550,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xaU))));
        bufp->chgBit(oldp+1551,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 9U))));
        bufp->chgBit(oldp+1552,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 8U))));
        bufp->chgIData(oldp+1553,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                    << 0x18U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[9U] 
                                                 >> 8U))),32);
        bufp->chgIData(oldp+1554,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[9U] 
                                    << 0x18U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                                 >> 8U))),32);
        bufp->chgBit(oldp+1555,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__is_branch));
        bufp->chgIData(oldp+1556,(((IData)(4U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])),32);
        bufp->chgBit(oldp+1557,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 3U))));
        bufp->chgBit(oldp+1558,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 4U))));
        bufp->chgBit(oldp+1559,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 5U))));
        bufp->chgBit(oldp+1560,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 6U))));
        bufp->chgBit(oldp+1561,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 7U))));
        bufp->chgBit(oldp+1562,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 8U))));
        bufp->chgBit(oldp+1563,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 9U))));
        bufp->chgBit(oldp+1564,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xaU))));
        bufp->chgBit(oldp+1565,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xbU))));
        bufp->chgBit(oldp+1566,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xcU))));
        bufp->chgBit(oldp+1567,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xdU))));
        bufp->chgBit(oldp+1568,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0xeU))));
        bufp->chgBit(oldp+1569,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 0x10U))));
        bufp->chgQData(oldp+1570,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div_result),64);
        bufp->chgBit(oldp+1572,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin));
        bufp->chgBit(oldp+1573,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__start_i));
        bufp->chgCData(oldp+1574,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__state),2);
        bufp->chgIData(oldp+1575,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__alu_src1_div),32);
        bufp->chgIData(oldp+1576,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__alu_src2_div),32);
        bufp->chgBit(oldp+1577,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__op_div_todiv));
        bufp->chgBit(oldp+1578,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_cnt));
        bufp->chgBit(oldp+1579,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                       >> 8U))));
        bufp->chgQData(oldp+1580,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__div_temp),33);
        bufp->chgCData(oldp+1582,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__cnt),6);
        bufp->chgWData(oldp+1583,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__dividend),65);
        bufp->chgIData(oldp+1586,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__divisor),32);
        bufp->chgIData(oldp+1587,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__temp_op1),32);
        bufp->chgIData(oldp+1588,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div__DOT__temp_op2),32);
        bufp->chgQData(oldp+1589,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul__DOT__res_temp),64);
        bufp->chgBit(oldp+1591,(((0U == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r) 
                                 | (0x1bfffffcU == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r))));
        bufp->chgCData(oldp+1592,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num),3);
        bufp->chgBit(oldp+1593,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok) 
                                 & (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num)))));
        bufp->chgIData(oldp+1594,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__inst_buffer),32);
        bufp->chgBit(oldp+1595,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__buffer_has));
        bufp->chgIData(oldp+1596,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r),32);
        bufp->chgBit(oldp+1597,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__adef_f_r));
        bufp->chgBit(oldp+1598,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok));
        bufp->chgBit(oldp+1599,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild));
        bufp->chgCData(oldp+1600,((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])),5);
        bufp->chgCData(oldp+1601,((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])),5);
        bufp->chgBit(oldp+1602,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                       >> 5U))));
        bufp->chgBit(oldp+1603,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                       >> 5U))));
        bufp->chgBit(oldp+1604,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                       >> 0xbU))));
        bufp->chgBit(oldp+1605,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                       >> 0xbU))));
        bufp->chgCData(oldp+1606,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset)
                                    ? 0U : 2U)),2);
        bufp->chgIData(oldp+1607,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr),32);
        bufp->chgBit(oldp+1608,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__cached));
        bufp->chgBit(oldp+1609,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__drop_num));
        bufp->chgBit(oldp+1610,(((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state)) 
                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__drop_num))));
        bufp->chgWData(oldp+1611,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg),512);
        bufp->chgBit(oldp+1627,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__replace_cache));
        bufp->chgBit(oldp+1628,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__true_replace_cache));
        bufp->chgBit(oldp+1629,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__lru));
        bufp->chgCData(oldp+1630,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state),3);
        bufp->chgCData(oldp+1631,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__transfer_cnt),4);
        bufp->chgIData(oldp+1632,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[0]),32);
        bufp->chgIData(oldp+1633,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[1]),32);
        bufp->chgIData(oldp+1634,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[2]),32);
        bufp->chgIData(oldp+1635,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[3]),32);
        bufp->chgIData(oldp+1636,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[4]),32);
        bufp->chgIData(oldp+1637,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[5]),32);
        bufp->chgIData(oldp+1638,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[6]),32);
        bufp->chgIData(oldp+1639,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[7]),32);
        bufp->chgIData(oldp+1640,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[8]),32);
        bufp->chgIData(oldp+1641,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[9]),32);
        bufp->chgIData(oldp+1642,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[10]),32);
        bufp->chgIData(oldp+1643,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[11]),32);
        bufp->chgIData(oldp+1644,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[12]),32);
        bufp->chgIData(oldp+1645,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[13]),32);
        bufp->chgIData(oldp+1646,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[14]),32);
        bufp->chgIData(oldp+1647,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way0[15]),32);
        bufp->chgIData(oldp+1648,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[0]),32);
        bufp->chgIData(oldp+1649,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[1]),32);
        bufp->chgIData(oldp+1650,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[2]),32);
        bufp->chgIData(oldp+1651,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[3]),32);
        bufp->chgIData(oldp+1652,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[4]),32);
        bufp->chgIData(oldp+1653,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[5]),32);
        bufp->chgIData(oldp+1654,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[6]),32);
        bufp->chgIData(oldp+1655,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[7]),32);
        bufp->chgIData(oldp+1656,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[8]),32);
        bufp->chgIData(oldp+1657,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[9]),32);
        bufp->chgIData(oldp+1658,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[10]),32);
        bufp->chgIData(oldp+1659,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[11]),32);
        bufp->chgIData(oldp+1660,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[12]),32);
        bufp->chgIData(oldp+1661,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[13]),32);
        bufp->chgIData(oldp+1662,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[14]),32);
        bufp->chgIData(oldp+1663,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_mux_way1[15]),32);
        bufp->chgCData(oldp+1664,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                                            >> 6U))),6);
        bufp->chgIData(oldp+1665,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                                   >> 0xcU)),20);
        bufp->chgCData(oldp+1666,((0x3fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)),6);
        bufp->chgSData(oldp+1667,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_sel),16);
        bufp->chgCData(oldp+1668,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__hit_r),2);
        bufp->chgBit(oldp+1669,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__lru_r));
        bufp->chgBit(oldp+1670,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__cached_r));
        bufp->chgSData(oldp+1671,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__bank_sel_r),16);
        bufp->chgIData(oldp+1672,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[0]),32);
        bufp->chgIData(oldp+1673,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[1]),32);
        bufp->chgIData(oldp+1674,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[2]),32);
        bufp->chgIData(oldp+1675,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[3]),32);
        bufp->chgIData(oldp+1676,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[4]),32);
        bufp->chgIData(oldp+1677,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[5]),32);
        bufp->chgIData(oldp+1678,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[6]),32);
        bufp->chgIData(oldp+1679,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[7]),32);
        bufp->chgIData(oldp+1680,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[8]),32);
        bufp->chgIData(oldp+1681,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[9]),32);
        bufp->chgIData(oldp+1682,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[10]),32);
        bufp->chgIData(oldp+1683,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[11]),32);
        bufp->chgIData(oldp+1684,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[12]),32);
        bufp->chgIData(oldp+1685,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[13]),32);
        bufp->chgIData(oldp+1686,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[14]),32);
        bufp->chgIData(oldp+1687,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way0[15]),32);
        bufp->chgIData(oldp+1688,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[0]),32);
        bufp->chgIData(oldp+1689,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[1]),32);
        bufp->chgIData(oldp+1690,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[2]),32);
        bufp->chgIData(oldp+1691,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[3]),32);
        bufp->chgIData(oldp+1692,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[4]),32);
        bufp->chgIData(oldp+1693,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[5]),32);
        bufp->chgIData(oldp+1694,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[6]),32);
        bufp->chgIData(oldp+1695,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[7]),32);
        bufp->chgIData(oldp+1696,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[8]),32);
        bufp->chgIData(oldp+1697,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[9]),32);
        bufp->chgIData(oldp+1698,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[10]),32);
        bufp->chgIData(oldp+1699,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[11]),32);
        bufp->chgIData(oldp+1700,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[12]),32);
        bufp->chgIData(oldp+1701,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[13]),32);
        bufp->chgIData(oldp+1702,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[14]),32);
        bufp->chgIData(oldp+1703,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__rdata_way1[15]),32);
        bufp->chgCData(oldp+1704,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__wea),4);
        bufp->chgIData(oldp+1705,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                                            >> 6U))),32);
        bufp->chgIData(oldp+1706,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0U]),32);
        bufp->chgIData(oldp+1707,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__0__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1708,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xaU]),32);
        bufp->chgIData(oldp+1709,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__10__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1710,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xbU]),32);
        bufp->chgIData(oldp+1711,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__11__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1712,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xcU]),32);
        bufp->chgIData(oldp+1713,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__12__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1714,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xdU]),32);
        bufp->chgIData(oldp+1715,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__13__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1716,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xeU]),32);
        bufp->chgIData(oldp+1717,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__14__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1718,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[0xfU]),32);
        bufp->chgIData(oldp+1719,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__15__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1720,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[1U]),32);
        bufp->chgIData(oldp+1721,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__1__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1722,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[2U]),32);
        bufp->chgIData(oldp+1723,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__2__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1724,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[3U]),32);
        bufp->chgIData(oldp+1725,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__3__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1726,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[4U]),32);
        bufp->chgIData(oldp+1727,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__4__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1728,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[5U]),32);
        bufp->chgIData(oldp+1729,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__5__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1730,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[6U]),32);
        bufp->chgIData(oldp+1731,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__6__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1732,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[7U]),32);
        bufp->chgIData(oldp+1733,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__7__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1734,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[8U]),32);
        bufp->chgIData(oldp+1735,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__8__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgIData(oldp+1736,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__cacheline_new_reg[9U]),32);
        bufp->chgIData(oldp+1737,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY0__BRA__9__KET____DOT__bank_way0__DOT__douta_reg),32);
        bufp->chgCData(oldp+1738,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__wea),4);
        bufp->chgIData(oldp+1739,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__0__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1740,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__10__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1741,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__11__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1742,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__12__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1743,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__13__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1744,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__14__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1745,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__15__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1746,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__1__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1747,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__2__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1748,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__3__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1749,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__4__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1750,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__5__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1751,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__6__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1752,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__7__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1753,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__8__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgIData(oldp+1754,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__BANK_WAY1__BRA__9__KET____DOT__bank_way1__DOT__douta_reg),32);
        bufp->chgCData(oldp+1755,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                                           >> 2U))),4);
        bufp->chgIData(oldp+1756,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__i),32);
        bufp->chgIData(oldp+1757,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__j),32);
        bufp->chgQData(oldp+1758,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__lru_r),64);
        bufp->chgBit(oldp+1760,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                       >> 9U))));
        bufp->chgBit(oldp+1761,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                       >> 8U))));
        bufp->chgBit(oldp+1762,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                       >> 7U))));
        bufp->chgSData(oldp+1763,((0x1ffU & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                              << 2U) 
                                             | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[5U] 
                                                >> 0x1eU)))),9);
        bufp->chgBit(oldp+1764,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                       >> 0xeU))));
        bufp->chgIData(oldp+1765,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[1U]),32);
        bufp->chgBit(oldp+1766,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__req_able));
        bufp->chgSData(oldp+1767,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[5U] 
                                              >> 0x10U))),14);
        bufp->chgIData(oldp+1768,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[5U] 
                                    << 0x10U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                                 >> 0x10U))),32);
        bufp->chgIData(oldp+1769,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[0U]),32);
        bufp->chgIData(oldp+1770,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[0U]),32);
        bufp->chgBit(oldp+1771,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__valid_rst));
        bufp->chgBit(oldp+1772,((1U & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                        >> 7U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt)))));
        bufp->chgSData(oldp+1773,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt) 
                                    << 9U) | (0x1ffU 
                                              & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                                  << 2U) 
                                                 | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[5U] 
                                                    >> 0x1eU))))),16);
        __Vtemp_73[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[0U];
        __Vtemp_73[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[1U];
        __Vtemp_73[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U];
        __Vtemp_73[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[3U];
        __Vtemp_73[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U];
        __Vtemp_73[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[5U];
        __Vtemp_73[6U] = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__cached_mt) 
                           << 0x11U) | ((0x18000U & 
                                         (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                          << 7U)) | 
                                        ((0x4000U & 
                                          ((0xffffc000U 
                                            & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U] 
                                               << 7U)) 
                                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt) 
                                              << 0xeU))) 
                                         | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt) 
                                             << 7U) 
                                            | (0x7fU 
                                               & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[6U])))));
        bufp->chgWData(oldp+1774,(__Vtemp_73),210);
        bufp->chgWData(oldp+1781,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r),210);
        bufp->chgCData(oldp+1788,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__drop_num),3);
        bufp->chgBit(oldp+1789,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                       >> 0xaU))));
        bufp->chgCData(oldp+1790,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                           >> 6U))),4);
        bufp->chgIData(oldp+1791,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[3U]),32);
        bufp->chgIData(oldp+1792,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[1U]),32);
        bufp->chgBit(oldp+1793,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                       >> 0x10U))));
        bufp->chgBit(oldp+1794,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                       >> 0xfU))));
        bufp->chgBit(oldp+1795,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                       >> 0xeU))));
        bufp->chgIData(oldp+1796,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                                    << 0x10U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                                 >> 0x10U))),32);
        bufp->chgSData(oldp+1797,((0x3fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                                              >> 0x10U))),14);
        bufp->chgCData(oldp+1798,((((3U == (3U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U])) 
                                    << 3U) | (((2U 
                                                == 
                                                (3U 
                                                 & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U])) 
                                               << 2U) 
                                              | (((1U 
                                                   == 
                                                   (3U 
                                                    & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U])) 
                                                  << 1U) 
                                                 | (0U 
                                                    == 
                                                    (3U 
                                                     & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U])))))),4);
        bufp->chgBit(oldp+1799,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_m_excp_r));
        bufp->chgWData(oldp+1800,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r),202);
        bufp->chgCData(oldp+1807,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                         >> 0xcU))),2);
        bufp->chgCData(oldp+1808,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                         >> 0xcU))),2);
        bufp->chgBit(oldp+1809,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                       >> 0xaU))));
        bufp->chgCData(oldp+1810,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                           >> 6U))),4);
        bufp->chgIData(oldp+1811,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[3U]),32);
        bufp->chgSData(oldp+1812,((0xffffU & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                               << 2U) 
                                              | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                                                 >> 0x1eU)))),16);
        bufp->chgBit(oldp+1813,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                       >> 0xeU))));
        bufp->chgBit(oldp+1814,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__ale_excp_mt));
        bufp->chgCData(oldp+1815,((3U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U])),2);
        bufp->chgCData(oldp+1816,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                   >> 0x1cU)),4);
        bufp->chgCData(oldp+1817,((0xfU & ((1U & ((- (IData)(
                                                             (9U 
                                                              == 
                                                              (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                               >> 0x1cU)))) 
                                                  | (- (IData)(
                                                               (0xbU 
                                                                == 
                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                 >> 0x1cU)))))) 
                                           | ((- (IData)(
                                                         ((8U 
                                                           != 
                                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                            >> 0x1cU)) 
                                                          & (~ 
                                                             ((9U 
                                                               == 
                                                               (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                >> 0x1cU)) 
                                                              | ((0xaU 
                                                                  == 
                                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                   >> 0x1cU)) 
                                                                 | (0xbU 
                                                                    == 
                                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                     >> 0x1cU)))))))) 
                                              & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                  << 4U) 
                                                 | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                    >> 0x1cU)))))),4);
        bufp->chgBit(oldp+1818,((8U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                        >> 0x1cU))));
        bufp->chgBit(oldp+1819,((9U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                        >> 0x1cU))));
        bufp->chgBit(oldp+1820,((0xaU == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                          >> 0x1cU))));
        bufp->chgBit(oldp+1821,((0xbU == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                          >> 0x1cU))));
        bufp->chgBit(oldp+1822,(((8U != (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                         >> 0x1cU)) 
                                 & (~ ((9U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                               >> 0x1cU)) 
                                       | ((0xaU == 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                            >> 0x1cU)) 
                                          | (0xbU == 
                                             (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                              >> 0x1cU))))))));
        bufp->chgBit(oldp+1823,((1U & (~ ((0xbU == 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                            >> 0x1cU)) 
                                          | (0xaU == 
                                             (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                              >> 0x1cU)))))));
        bufp->chgBit(oldp+1824,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__dmw0_en));
        bufp->chgBit(oldp+1825,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__dmw1_en));
        bufp->chgBit(oldp+1826,(((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__pgda_out)) 
                                 & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__dmw0_en)) 
                                    & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____VdfgTmp_h089c879f__0)) 
                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____VdfgTmp_he8e7d759__0))))));
        bufp->chgBit(oldp+1827,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                       >> 0xcU))));
        bufp->chgIData(oldp+1828,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                   >> 0xdU)),19);
        bufp->chgCData(oldp+1829,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB) 
                                          >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                    ? 0x15U : 0xcU)),6);
        bufp->chgIData(oldp+1830,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                          >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn0
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ppn1
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index])),20);
        bufp->chgIData(oldp+1831,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbehi 
                                   >> 0xdU)),19);
        bufp->chgBit(oldp+1832,((1U & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 
                                        & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1) 
                                       >> 6U))));
        bufp->chgCData(oldp+1833,((0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbidx 
                                            >> 0x18U))),6);
        bufp->chgBit(oldp+1834,((1U & ((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbidx 
                                           >> 0x1fU)) 
                                       | (0x3fU == 
                                          (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_estat 
                                            >> 0x10U)))))));
        bufp->chgBit(oldp+1835,((1U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0)));
        bufp->chgBit(oldp+1836,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 
                                       >> 1U))));
        bufp->chgCData(oldp+1837,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 
                                         >> 4U))),2);
        bufp->chgCData(oldp+1838,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 
                                         >> 2U))),2);
        bufp->chgIData(oldp+1839,((0xfffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo0 
                                               >> 8U))),20);
        bufp->chgBit(oldp+1840,((1U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1)));
        bufp->chgBit(oldp+1841,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1 
                                       >> 1U))));
        bufp->chgCData(oldp+1842,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1 
                                         >> 4U))),2);
        bufp->chgCData(oldp+1843,((3U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1 
                                         >> 2U))),2);
        bufp->chgIData(oldp+1844,((0xfffffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_tlbelo1 
                                               >> 8U))),20);
        bufp->chgCData(oldp+1845,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                          >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv1
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_plv0
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index])),2);
        bufp->chgBit(oldp+1846,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_d0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index])));
        bufp->chgBit(oldp+1847,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                        >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_v0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index])));
        bufp->chgBit(oldp+1848,((1U & ((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                              >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                        ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat1
                                       [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                        : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat0
                                       [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]))));
        bufp->chgCData(oldp+1849,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index),4);
        bufp->chgCData(oldp+1850,(((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer) 
                                          >> (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index)))
                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat1
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index]
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_mat0
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT____Vcellout__u_tlb__s1_index])),2);
        bufp->chgSData(oldp+1851,((((IData)(vlSelf->__VdfgTmp_ha16d735d__0) 
                                    << 0xfU) | (((IData)(vlSelf->__VdfgTmp_h6e525a2d__0) 
                                                 << 0xeU) 
                                                | (((IData)(vlSelf->__VdfgTmp_h9ba6ddcc__0) 
                                                    << 0xdU) 
                                                   | ((0xfffff000U 
                                                       & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                          & ((((0x1000U 
                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                ? 
                                                               ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                 >> 0x16U) 
                                                                == 
                                                                (0x3ffU 
                                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                    [0xcU] 
                                                                    >> 9U)))
                                                                : 
                                                               ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                 >> 0xdU) 
                                                                == 
                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                [0xcU])) 
                                                              & (((0x3ffU 
                                                                   & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                  == 
                                                                  vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                  [0xcU]) 
                                                                 | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                 [0xcU])) 
                                                             << 0xcU))) 
                                                      | (((IData)(vlSelf->__VdfgTmp_h405c1a80__0) 
                                                          << 0xbU) 
                                                         | (((IData)(vlSelf->__VdfgTmp_h5b0b239b__0) 
                                                             << 0xaU) 
                                                            | (((IData)(vlSelf->__VdfgTmp_h3ead788f__0) 
                                                                << 9U) 
                                                               | ((0xffffff00U 
                                                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                      & ((((0x100U 
                                                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                            ? 
                                                                           ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                             >> 0x16U) 
                                                                            == 
                                                                            (0x3ffU 
                                                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [8U] 
                                                                                >> 9U)))
                                                                            : 
                                                                           ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                             >> 0xdU) 
                                                                            == 
                                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                            [8U])) 
                                                                          & (((0x3ffU 
                                                                               & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                              == 
                                                                              vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                              [8U]) 
                                                                             | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                             [8U])) 
                                                                         << 8U))) 
                                                                  | (((IData)(vlSelf->__VdfgTmp_hf5775b5c__0) 
                                                                      << 7U) 
                                                                     | (((IData)(vlSelf->__VdfgTmp_hcb2f5762__0) 
                                                                         << 6U) 
                                                                        | (((IData)(vlSelf->__VdfgTmp_hb57cfd67__0) 
                                                                            << 5U) 
                                                                           | ((0xfffffff0U 
                                                                               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                                & ((((0x10U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0x16U) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [4U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0xdU) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [4U])) 
                                                                                & (((0x3ffU 
                                                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [4U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [4U])) 
                                                                                << 4U))) 
                                                                              | (((IData)(vlSelf->__VdfgTmp_h6f6a7daa__0) 
                                                                                << 3U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_hc8f24e6b__0) 
                                                                                << 2U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h651600d2__0) 
                                                                                << 1U) 
                                                                                | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                                                & (((1U 
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                                                 ? 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0x16U) 
                                                                                == 
                                                                                (0x3ffU 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U] 
                                                                                >> 9U)))
                                                                                 : 
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                                                >> 0xdU) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                                                [0U])) 
                                                                                & (((0x3ffU 
                                                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                                                == 
                                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                                                [0U]) 
                                                                                | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                                                [0U]))))))))))))))))))),16);
        bufp->chgSData(oldp+1852,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__s1_odd_page_buffer),16);
        bufp->chgCData(oldp+1853,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h651600d2__0)))) 
                                         | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_hc8f24e6b__0)))) 
                                            | (- (IData)((IData)(vlSelf->__VdfgTmp_h6f6a7daa__0))))))),2);
        bufp->chgCData(oldp+1854,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_hb57cfd67__0)))) 
                                         | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_hcb2f5762__0)))) 
                                            | (- (IData)((IData)(vlSelf->__VdfgTmp_hf5775b5c__0))))))),2);
        bufp->chgCData(oldp+1855,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h3ead788f__0)))) 
                                         | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h5b0b239b__0)))) 
                                            | (- (IData)((IData)(vlSelf->__VdfgTmp_h405c1a80__0))))))),2);
        bufp->chgCData(oldp+1856,((3U & ((1U & (- (IData)((IData)(vlSelf->__VdfgTmp_h9ba6ddcc__0)))) 
                                         | ((2U & (- (IData)((IData)(vlSelf->__VdfgTmp_h6e525a2d__0)))) 
                                            | (- (IData)((IData)(vlSelf->__VdfgTmp_ha16d735d__0))))))),2);
        bufp->chgCData(oldp+1857,((((IData)(vlSelf->__VdfgTmp_ha16d735d__0) 
                                    << 3U) | (((IData)(vlSelf->__VdfgTmp_h6e525a2d__0) 
                                               << 2U) 
                                              | (((IData)(vlSelf->__VdfgTmp_h9ba6ddcc__0) 
                                                  << 1U) 
                                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                     >> 0xcU) 
                                                    & (((0x1000U 
                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                         ? 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0x16U) 
                                                         == 
                                                         (0x3ffU 
                                                          & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                             [0xcU] 
                                                             >> 9U)))
                                                         : 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0xdU) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                         [0xcU])) 
                                                       & (((0x3ffU 
                                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                           == 
                                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                           [0xcU]) 
                                                          | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                          [0xcU]))))))),4);
        bufp->chgCData(oldp+1858,((((IData)(vlSelf->__VdfgTmp_h6f6a7daa__0) 
                                    << 3U) | (((IData)(vlSelf->__VdfgTmp_hc8f24e6b__0) 
                                               << 2U) 
                                              | (((IData)(vlSelf->__VdfgTmp_h651600d2__0) 
                                                  << 1U) 
                                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                    & (((1U 
                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                         ? 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0x16U) 
                                                         == 
                                                         (0x3ffU 
                                                          & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                             [0U] 
                                                             >> 9U)))
                                                         : 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0xdU) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                         [0U])) 
                                                       & (((0x3ffU 
                                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                           == 
                                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                           [0U]) 
                                                          | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                          [0U]))))))),4);
        bufp->chgCData(oldp+1859,((((IData)(vlSelf->__VdfgTmp_h405c1a80__0) 
                                    << 3U) | (((IData)(vlSelf->__VdfgTmp_h5b0b239b__0) 
                                               << 2U) 
                                              | (((IData)(vlSelf->__VdfgTmp_h3ead788f__0) 
                                                  << 1U) 
                                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                     >> 8U) 
                                                    & (((0x100U 
                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                         ? 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0x16U) 
                                                         == 
                                                         (0x3ffU 
                                                          & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                             [8U] 
                                                             >> 9U)))
                                                         : 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0xdU) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                         [8U])) 
                                                       & (((0x3ffU 
                                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                           == 
                                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                           [8U]) 
                                                          | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                          [8U]))))))),4);
        bufp->chgCData(oldp+1860,((((IData)(vlSelf->__VdfgTmp_hf5775b5c__0) 
                                    << 3U) | (((IData)(vlSelf->__VdfgTmp_hcb2f5762__0) 
                                               << 2U) 
                                              | (((IData)(vlSelf->__VdfgTmp_hb57cfd67__0) 
                                                  << 1U) 
                                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_e) 
                                                     >> 4U) 
                                                    & (((0x10U 
                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_ps4MB))
                                                         ? 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0x16U) 
                                                         == 
                                                         (0x3ffU 
                                                          & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                             [4U] 
                                                             >> 9U)))
                                                         : 
                                                        ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U] 
                                                          >> 0xdU) 
                                                         == 
                                                         vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_vppn
                                                         [4U])) 
                                                       & (((0x3ffU 
                                                            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_asid) 
                                                           == 
                                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_asid
                                                           [4U]) 
                                                          | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_mmu__DOT__u_tlb__DOT__tlb_g
                                                          [4U]))))))),4);
        bufp->chgBit(oldp+1861,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[2U] 
                                       >> 5U))));
        bufp->chgBit(oldp+1862,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[2U] 
                                       >> 6U))));
        bufp->chgIData(oldp+1863,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[3U] 
                                    << 0x19U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[2U] 
                                                 >> 7U))),32);
        bufp->chgIData(oldp+1864,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                    << 0x19U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[3U] 
                                                 >> 7U))),32);
        bufp->chgBit(oldp+1865,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__valid_wb));
        bufp->chgWData(oldp+1866,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r),233);
        bufp->chgBit(oldp+1874,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__int_handle));
        bufp->chgBit(oldp+1875,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U] 
                                       >> 0x16U))));
        bufp->chgBit(oldp+1876,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__excp_flush) 
                                       | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                          >> 7U)))));
        bufp->chgBit(oldp+1877,((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                       >> 6U))));
        bufp->chgSData(oldp+1878,((0xffffU & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                               << 0xaU) 
                                              | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[5U] 
                                                 >> 0x16U)))),16);
        bufp->chgIData(oldp+1879,(((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[7U] 
                                    << 0x17U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U] 
                                                 >> 9U))),32);
        bufp->chgBit(oldp+1880,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable)))));
        bufp->chgBit(oldp+1881,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable));
        bufp->chgBit(oldp+1882,((1U & vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random)));
        bufp->chgBit(oldp+1883,((1U & ((vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 1U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable)))));
        bufp->chgBit(oldp+1884,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable));
        bufp->chgBit(oldp+1885,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 1U))));
        bufp->chgBit(oldp+1886,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 2U))));
        bufp->chgBit(oldp+1887,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay));
        bufp->chgBit(oldp+1888,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 3U))));
        bufp->chgIData(oldp+1889,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random),23);
        bufp->chgIData(oldp+1890,(((0x7ffffeU & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                 << 1U)) 
                                   | (1U & VL_REDXOR_32(
                                                        (0x420000U 
                                                         & vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random))))),23);
        bufp->chgBit(oldp+1891,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay));
        bufp->chgBit(oldp+1892,((1U & ((vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 4U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable)))));
        bufp->chgBit(oldp+1893,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable));
        bufp->chgBit(oldp+1894,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 4U))));
        bufp->chgQData(oldp+1895,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)) 
                                    << 0x2bU) | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize)) 
                                                  << 0x28U) 
                                                 | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                     << 0x24U) 
                                                    | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                        << 4U) 
                                                       | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid))))))),45);
        bufp->chgIData(oldp+1897,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+1898,(((((IData)(1U) + 
                                     (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+1899,((((- (IData)((0U 
                                                == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                    & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                   | (((- (IData)((1U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                       & ((((IData)(1U) 
                                            + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                               >> 2U)) 
                                           << 2U) | 
                                          (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))) 
                                      | ((- (IData)(
                                                    (2U 
                                                     == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                         & ((0xffffffc0U 
                                             & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                            | ((0x3cU 
                                                & ((0xfffffffcU 
                                                    & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                        << 2U) 
                                                       & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                           >> 2U))) 
                                                      << 2U))) 
                                               | (3U 
                                                  & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
        bufp->chgIData(oldp+1900,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                   | ((0x3cU & ((0xfffffffcU 
                                                 & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                     << 2U) 
                                                    & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                                    & ((IData)(1U) 
                                                       + 
                                                       (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                        >> 2U))) 
                                                   << 2U))) 
                                      | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)))),32);
        bufp->chgCData(oldp+1901,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+1902,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1903,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1904,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+1905,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+1906,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+1907,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+1908,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+1909,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+1910,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+1912,((IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                           >> 0xdU))),32);
        bufp->chgCData(oldp+1913,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 0xbU)))),2);
        bufp->chgCData(oldp+1914,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+1915,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                   >> 4U)))),4);
        bufp->chgCData(oldp+1916,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1917,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+1918,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+1919,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                    << 0xdU) | (QData)((IData)(
                                                               (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                 << 0xbU) 
                                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                    << 8U) 
                                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                       << 4U) 
                                                                      | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid)))))))),45);
        bufp->chgIData(oldp+1921,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+1922,(((((IData)(1U) + 
                                     (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+1923,((((- (IData)((0U 
                                                == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                    & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                   | (((- (IData)((1U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                       & ((((IData)(1U) 
                                            + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                               >> 2U)) 
                                           << 2U) | 
                                          (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                      | ((- (IData)(
                                                    (2U 
                                                     == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                         & ((0xffffffc0U 
                                             & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                            | ((0x3cU 
                                                & ((0xfffffffcU 
                                                    & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                        << 2U) 
                                                       & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                           >> 2U))) 
                                                      << 2U))) 
                                               | (3U 
                                                  & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
        bufp->chgIData(oldp+1924,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                   | ((0x3cU & ((0xfffffffcU 
                                                 & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                     << 2U) 
                                                    & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                    & ((IData)(1U) 
                                                       + 
                                                       (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                        >> 2U))) 
                                                   << 2U))) 
                                      | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
        bufp->chgCData(oldp+1925,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+1926,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1927,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1928,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+1929,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+1930,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+1931,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+1932,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgQData(oldp+1933,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+1935,((IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                           >> 0xdU))),32);
        bufp->chgCData(oldp+1936,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 0xbU)))),2);
        bufp->chgCData(oldp+1937,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+1938,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                   >> 4U)))),4);
        bufp->chgCData(oldp+1939,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1940,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+1941,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+1942,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+1943,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+1944,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgCData(oldp+1945,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgIData(oldp+1946,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgBit(oldp+1947,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+1948,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0xaU])) {
        bufp->chgIData(oldp+1949,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[0]),32);
        bufp->chgIData(oldp+1950,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[1]),32);
        bufp->chgIData(oldp+1951,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[2]),32);
        bufp->chgIData(oldp+1952,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[3]),32);
        bufp->chgIData(oldp+1953,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[4]),32);
        bufp->chgIData(oldp+1954,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[5]),32);
        bufp->chgIData(oldp+1955,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[6]),32);
        bufp->chgIData(oldp+1956,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[7]),32);
        bufp->chgIData(oldp+1957,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[8]),32);
        bufp->chgIData(oldp+1958,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[9]),32);
        bufp->chgIData(oldp+1959,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[10]),32);
        bufp->chgIData(oldp+1960,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[11]),32);
        bufp->chgIData(oldp+1961,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[12]),32);
        bufp->chgIData(oldp+1962,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[13]),32);
        bufp->chgIData(oldp+1963,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[14]),32);
        bufp->chgIData(oldp+1964,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[15]),32);
        bufp->chgIData(oldp+1965,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[16]),32);
        bufp->chgIData(oldp+1966,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[17]),32);
        bufp->chgIData(oldp+1967,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[18]),32);
        bufp->chgIData(oldp+1968,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[19]),32);
        bufp->chgIData(oldp+1969,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[20]),32);
        bufp->chgIData(oldp+1970,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[21]),32);
        bufp->chgIData(oldp+1971,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[22]),32);
        bufp->chgIData(oldp+1972,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[23]),32);
        bufp->chgIData(oldp+1973,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[24]),32);
        bufp->chgIData(oldp+1974,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[25]),32);
        bufp->chgIData(oldp+1975,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[26]),32);
        bufp->chgIData(oldp+1976,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[27]),32);
        bufp->chgIData(oldp+1977,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[28]),32);
        bufp->chgIData(oldp+1978,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[29]),32);
        bufp->chgIData(oldp+1979,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[30]),32);
        bufp->chgIData(oldp+1980,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[31]),32);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0x11U])) {
        bufp->chgWData(oldp+1981,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus),352);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0x12U])) {
        bufp->chgCData(oldp+1992,(vlSelf->simu_top__DOT__soc__DOT__m0_bid),4);
        bufp->chgCData(oldp+1993,(vlSelf->simu_top__DOT__soc__DOT__m0_bresp),2);
        bufp->chgCData(oldp+1994,(vlSelf->simu_top__DOT__soc__DOT__m0_rresp),2);
    }
    bufp->chgBit(oldp+1995,(vlSelf->aclk));
    bufp->chgBit(oldp+1996,(vlSelf->aresetn));
    bufp->chgBit(oldp+1997,(vlSelf->enable_delay));
    bufp->chgIData(oldp+1998,(vlSelf->random_seed),23);
    bufp->chgBit(oldp+1999,(vlSelf->ram_ren));
    bufp->chgIData(oldp+2000,(vlSelf->ram_raddr),32);
    bufp->chgIData(oldp+2001,(vlSelf->ram_rdata),32);
    bufp->chgCData(oldp+2002,(vlSelf->ram_wen),4);
    bufp->chgIData(oldp+2003,(vlSelf->ram_waddr),32);
    bufp->chgIData(oldp+2004,(vlSelf->ram_wdata),32);
    bufp->chgIData(oldp+2005,(vlSelf->debug0_wb_pc),32);
    bufp->chgBit(oldp+2006,(vlSelf->debug0_wb_rf_wen));
    bufp->chgCData(oldp+2007,(vlSelf->debug0_wb_rf_wnum),5);
    bufp->chgIData(oldp+2008,(vlSelf->debug0_wb_rf_wdata),32);
    bufp->chgIData(oldp+2009,(vlSelf->num_data),32);
    bufp->chgBit(oldp+2010,(vlSelf->open_trace));
    bufp->chgBit(oldp+2011,(vlSelf->num_monitor));
    bufp->chgCData(oldp+2012,(vlSelf->confreg_uart_data),8);
    bufp->chgBit(oldp+2013,(vlSelf->write_uart_valid));
    bufp->chgWData(oldp+2014,(vlSelf->uart_ctr_bus),128);
    bufp->chgBit(oldp+2018,(vlSelf->uart_rx));
    bufp->chgBit(oldp+2019,(vlSelf->uart_tx));
    bufp->chgSData(oldp+2020,(vlSelf->led),16);
    bufp->chgCData(oldp+2021,(vlSelf->led_rg0),2);
    bufp->chgCData(oldp+2022,(vlSelf->led_rg1),2);
    bufp->chgCData(oldp+2023,(vlSelf->num_csn),8);
    bufp->chgCData(oldp+2024,(vlSelf->num_a_g),7);
    bufp->chgCData(oldp+2025,(vlSelf->btn_key_col),4);
    bufp->chgCData(oldp+2026,(vlSelf->btn_key_row),4);
    bufp->chgCData(oldp+2027,(vlSelf->btn_step),2);
    bufp->chgBit(oldp+2028,(vlSelf->DifftestExcpEvent__02Eclock));
    bufp->chgCData(oldp+2029,(vlSelf->DifftestExcpEvent__02Ecoreid),8);
    bufp->chgBit(oldp+2030,(vlSelf->excp_valid));
    bufp->chgBit(oldp+2031,(vlSelf->eret));
    bufp->chgIData(oldp+2032,(vlSelf->intrNo),32);
    bufp->chgIData(oldp+2033,(vlSelf->cause),32);
    bufp->chgQData(oldp+2034,(vlSelf->exceptionPC),64);
    bufp->chgIData(oldp+2036,(vlSelf->exceptionInst),32);
    bufp->chgBit(oldp+2037,(vlSelf->DifftestTrapEvent__02Eclock));
    bufp->chgCData(oldp+2038,(vlSelf->DifftestTrapEvent__02Ecoreid),8);
    bufp->chgBit(oldp+2039,(vlSelf->DifftestTrapEvent__02Evalid));
    bufp->chgCData(oldp+2040,(vlSelf->code),3);
    bufp->chgQData(oldp+2041,(vlSelf->pc),64);
    bufp->chgQData(oldp+2043,(vlSelf->cycleCnt),64);
    bufp->chgQData(oldp+2045,(vlSelf->instrCnt),64);
    bufp->chgBit(oldp+2047,(vlSelf->DifftestStoreEvent__02Eclock));
    bufp->chgCData(oldp+2048,(vlSelf->DifftestStoreEvent__02Ecoreid),8);
    bufp->chgCData(oldp+2049,(vlSelf->DifftestStoreEvent__02Eindex),8);
    bufp->chgCData(oldp+2050,(vlSelf->DifftestStoreEvent__02Evalid),8);
    bufp->chgQData(oldp+2051,(vlSelf->storePAddr),64);
    bufp->chgQData(oldp+2053,(vlSelf->storeVAddr),64);
    bufp->chgQData(oldp+2055,(vlSelf->storeData),64);
    bufp->chgBit(oldp+2057,(vlSelf->DifftestLoadEvent__02Eclock));
    bufp->chgCData(oldp+2058,(vlSelf->DifftestLoadEvent__02Ecoreid),8);
    bufp->chgCData(oldp+2059,(vlSelf->DifftestLoadEvent__02Eindex),8);
    bufp->chgCData(oldp+2060,(vlSelf->DifftestLoadEvent__02Evalid),8);
    bufp->chgQData(oldp+2061,(vlSelf->paddr),64);
    bufp->chgQData(oldp+2063,(vlSelf->vaddr),64);
    bufp->chgBit(oldp+2065,(vlSelf->DifftestCSRRegState__02Eclock));
    bufp->chgCData(oldp+2066,(vlSelf->DifftestCSRRegState__02Ecoreid),8);
    bufp->chgQData(oldp+2067,(vlSelf->crmd),64);
    bufp->chgQData(oldp+2069,(vlSelf->prmd),64);
    bufp->chgQData(oldp+2071,(vlSelf->euen),64);
    bufp->chgQData(oldp+2073,(vlSelf->ecfg),64);
    bufp->chgQData(oldp+2075,(vlSelf->estat),64);
    bufp->chgQData(oldp+2077,(vlSelf->era),64);
    bufp->chgQData(oldp+2079,(vlSelf->badv),64);
    bufp->chgQData(oldp+2081,(vlSelf->eentry),64);
    bufp->chgQData(oldp+2083,(vlSelf->tlbidx),64);
    bufp->chgQData(oldp+2085,(vlSelf->tlbehi),64);
    bufp->chgQData(oldp+2087,(vlSelf->tlbelo0),64);
    bufp->chgQData(oldp+2089,(vlSelf->tlbelo1),64);
    bufp->chgQData(oldp+2091,(vlSelf->asid),64);
    bufp->chgQData(oldp+2093,(vlSelf->pgdl),64);
    bufp->chgQData(oldp+2095,(vlSelf->pgdh),64);
    bufp->chgQData(oldp+2097,(vlSelf->save0),64);
    bufp->chgQData(oldp+2099,(vlSelf->save1),64);
    bufp->chgQData(oldp+2101,(vlSelf->save2),64);
    bufp->chgQData(oldp+2103,(vlSelf->save3),64);
    bufp->chgQData(oldp+2105,(vlSelf->tid),64);
    bufp->chgQData(oldp+2107,(vlSelf->tcfg),64);
    bufp->chgQData(oldp+2109,(vlSelf->tval),64);
    bufp->chgQData(oldp+2111,(vlSelf->ticlr),64);
    bufp->chgQData(oldp+2113,(vlSelf->llbctl),64);
    bufp->chgQData(oldp+2115,(vlSelf->tlbrentry),64);
    bufp->chgQData(oldp+2117,(vlSelf->dmw0),64);
    bufp->chgQData(oldp+2119,(vlSelf->dmw1),64);
    bufp->chgBit(oldp+2121,(vlSelf->DifftestGRegState__02Eclock));
    bufp->chgCData(oldp+2122,(vlSelf->DifftestGRegState__02Ecoreid),8);
    bufp->chgQData(oldp+2123,(vlSelf->gpr_0),64);
    bufp->chgQData(oldp+2125,(vlSelf->gpr_1),64);
    bufp->chgQData(oldp+2127,(vlSelf->gpr_2),64);
    bufp->chgQData(oldp+2129,(vlSelf->gpr_3),64);
    bufp->chgQData(oldp+2131,(vlSelf->gpr_4),64);
    bufp->chgQData(oldp+2133,(vlSelf->gpr_5),64);
    bufp->chgQData(oldp+2135,(vlSelf->gpr_6),64);
    bufp->chgQData(oldp+2137,(vlSelf->gpr_7),64);
    bufp->chgQData(oldp+2139,(vlSelf->gpr_8),64);
    bufp->chgQData(oldp+2141,(vlSelf->gpr_9),64);
    bufp->chgQData(oldp+2143,(vlSelf->gpr_10),64);
    bufp->chgQData(oldp+2145,(vlSelf->gpr_11),64);
    bufp->chgQData(oldp+2147,(vlSelf->gpr_12),64);
    bufp->chgQData(oldp+2149,(vlSelf->gpr_13),64);
    bufp->chgQData(oldp+2151,(vlSelf->gpr_14),64);
    bufp->chgQData(oldp+2153,(vlSelf->gpr_15),64);
    bufp->chgQData(oldp+2155,(vlSelf->gpr_16),64);
    bufp->chgQData(oldp+2157,(vlSelf->gpr_17),64);
    bufp->chgQData(oldp+2159,(vlSelf->gpr_18),64);
    bufp->chgQData(oldp+2161,(vlSelf->gpr_19),64);
    bufp->chgQData(oldp+2163,(vlSelf->gpr_20),64);
    bufp->chgQData(oldp+2165,(vlSelf->gpr_21),64);
    bufp->chgQData(oldp+2167,(vlSelf->gpr_22),64);
    bufp->chgQData(oldp+2169,(vlSelf->gpr_23),64);
    bufp->chgQData(oldp+2171,(vlSelf->gpr_24),64);
    bufp->chgQData(oldp+2173,(vlSelf->gpr_25),64);
    bufp->chgQData(oldp+2175,(vlSelf->gpr_26),64);
    bufp->chgQData(oldp+2177,(vlSelf->gpr_27),64);
    bufp->chgQData(oldp+2179,(vlSelf->gpr_28),64);
    bufp->chgQData(oldp+2181,(vlSelf->gpr_29),64);
    bufp->chgQData(oldp+2183,(vlSelf->gpr_30),64);
    bufp->chgQData(oldp+2185,(vlSelf->gpr_31),64);
    bufp->chgSData(oldp+2187,(vlSelf->one_valid_n__02Ein),16);
    bufp->chgSData(oldp+2188,(vlSelf->out),16);
    bufp->chgBit(oldp+2189,(vlSelf->nozero));
    bufp->chgSData(oldp+2190,(vlSelf->one_valid_16__02Ein),16);
    bufp->chgCData(oldp+2191,(vlSelf->one_valid_16__02Eout_en),4);
    bufp->chgIData(oldp+2192,(vlSelf->one_valid_32__02Ein),32);
    bufp->chgCData(oldp+2193,(vlSelf->one_valid_32__02Eout_en),5);
    bufp->chgCData(oldp+2194,(vlSelf->nand_type),2);
    bufp->chgBit(oldp+2195,(vlSelf->pclk));
    bufp->chgBit(oldp+2196,(vlSelf->prst_));
    bufp->chgBit(oldp+2197,(vlSelf->pwrite));
    bufp->chgBit(oldp+2198,(vlSelf->psel));
    bufp->chgBit(oldp+2199,(vlSelf->penable));
    bufp->chgSData(oldp+2200,(vlSelf->ADDR),11);
    bufp->chgIData(oldp+2201,(vlSelf->DAT_I),32);
    bufp->chgIData(oldp+2202,(vlSelf->DAT_O),32);
    bufp->chgCData(oldp+2203,(vlSelf->NAND_CE_o),4);
    bufp->chgBit(oldp+2204,(vlSelf->NAND_REQ));
    bufp->chgCData(oldp+2205,(vlSelf->NAND_I),8);
    bufp->chgCData(oldp+2206,(vlSelf->NAND_O),8);
    bufp->chgBit(oldp+2207,(vlSelf->NAND_EN_));
    bufp->chgBit(oldp+2208,(vlSelf->NAND_ALE));
    bufp->chgBit(oldp+2209,(vlSelf->NAND_CLE));
    bufp->chgBit(oldp+2210,(vlSelf->NAND_WR_));
    bufp->chgBit(oldp+2211,(vlSelf->NAND_RD_));
    bufp->chgCData(oldp+2212,(vlSelf->NAND_IORDY_i),4);
    bufp->chgBit(oldp+2213,(vlSelf->nand_int));
    bufp->chgIData(oldp+2214,(vlSelf->NAND_top__DOT__REG_DAT_T),32);
    bufp->chgBit(oldp+2215,(((IData)(vlSelf->psel) 
                             & (0x40U == (IData)(vlSelf->ADDR)))));
    bufp->chgBit(oldp+2216,(vlSelf->NAND_top__DOT__NANDtag));
    bufp->chgBit(oldp+2217,(vlSelf->NAND_top__DOT__NAND_IORDY));
    bufp->chgBit(oldp+2218,(((IData)(vlSelf->psel) 
                             & (0x10U == (IData)(vlSelf->ADDR)))));
    bufp->chgBit(oldp+2219,(((IData)(vlSelf->psel) 
                             & (0x14U == (IData)(vlSelf->ADDR)))));
    bufp->chgCData(oldp+2220,((((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0) 
                                << 3U) | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0) 
                                            << 1U) 
                                           | (1U & (IData)(vlSelf->NAND_IORDY_i)))))),4);
    bufp->chgSData(oldp+2221,((((IData)(vlSelf->__VdfgTmp_h21a339db__0) 
                                << 0xfU) | (((IData)(vlSelf->__VdfgTmp_h21b70596__0) 
                                             << 0xeU) 
                                            | (((IData)(vlSelf->__VdfgTmp_h21904653__0) 
                                                << 0xdU) 
                                               | ((0x1000U 
                                                   & (((~ (IData)(
                                                                  (0U 
                                                                   != 
                                                                   (0xfffU 
                                                                    & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                                       << 0xcU) 
                                                      & (IData)(vlSelf->one_valid_16__02Ein))) 
                                                  | (((IData)(vlSelf->__VdfgTmp_h21939a4c__0) 
                                                      << 0xbU) 
                                                     | (((IData)(vlSelf->__VdfgTmp_h219c8c41__0) 
                                                         << 0xaU) 
                                                        | (((IData)(vlSelf->__VdfgTmp_h215817df__0) 
                                                            << 9U) 
                                                           | ((0x100U 
                                                               & (((~ (IData)(
                                                                              (0U 
                                                                               != 
                                                                               (0xffU 
                                                                                & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                                                   << 8U) 
                                                                  & (IData)(vlSelf->one_valid_16__02Ein))) 
                                                              | (((IData)(vlSelf->__VdfgTmp_h2082e20c__0) 
                                                                  << 7U) 
                                                                 | (((IData)(vlSelf->__VdfgTmp_h208e684d__0) 
                                                                     << 6U) 
                                                                    | (((IData)(vlSelf->__VdfgTmp_h208a2720__0) 
                                                                        << 5U) 
                                                                       | ((0x10U 
                                                                           & (((~ (IData)(
                                                                                (0U 
                                                                                != 
                                                                                (0xfU 
                                                                                & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                                                               << 4U) 
                                                                              & (IData)(vlSelf->one_valid_16__02Ein))) 
                                                                          | (((IData)(vlSelf->__VdfgTmp_h217ffaed__0) 
                                                                              << 3U) 
                                                                             | (((IData)(vlSelf->__VdfgTmp_h2179e714__0) 
                                                                                << 2U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_hd4e85eca__0) 
                                                                                << 1U) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->one_valid_16__02Ein)))))))))))))))))),16);
    bufp->chgCData(oldp+2222,((((IData)(vlSelf->__VdfgTmp_h21a339db__0) 
                                << 3U) | (((IData)(vlSelf->__VdfgTmp_h21b70596__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->__VdfgTmp_h21904653__0) 
                                            << 1U) 
                                           | (1U & 
                                              ((~ (IData)(
                                                          (0U 
                                                           != 
                                                           (0xfffU 
                                                            & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                               & ((IData)(vlSelf->one_valid_16__02Ein) 
                                                  >> 0xcU))))))),4);
    bufp->chgCData(oldp+2223,((((IData)(vlSelf->__VdfgTmp_h217ffaed__0) 
                                << 3U) | (((IData)(vlSelf->__VdfgTmp_h2179e714__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->__VdfgTmp_hd4e85eca__0) 
                                            << 1U) 
                                           | (1U & (IData)(vlSelf->one_valid_16__02Ein)))))),4);
    bufp->chgCData(oldp+2224,((((IData)(vlSelf->__VdfgTmp_h21939a4c__0) 
                                << 3U) | (((IData)(vlSelf->__VdfgTmp_h219c8c41__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->__VdfgTmp_h215817df__0) 
                                            << 1U) 
                                           | (1U & 
                                              ((~ (IData)(
                                                          (0U 
                                                           != 
                                                           (0xffU 
                                                            & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                               & ((IData)(vlSelf->one_valid_16__02Ein) 
                                                  >> 8U))))))),4);
    bufp->chgCData(oldp+2225,((((IData)(vlSelf->__VdfgTmp_h2082e20c__0) 
                                << 3U) | (((IData)(vlSelf->__VdfgTmp_h208e684d__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->__VdfgTmp_h208a2720__0) 
                                            << 1U) 
                                           | (1U & 
                                              ((~ (IData)(
                                                          (0U 
                                                           != 
                                                           (0xfU 
                                                            & (IData)(vlSelf->one_valid_16__02Ein))))) 
                                               & ((IData)(vlSelf->one_valid_16__02Ein) 
                                                  >> 4U))))))),4);
    bufp->chgIData(oldp+2226,((((IData)(vlSelf->__VdfgTmp_h13c5e328__0) 
                                << 0x1fU) | (((IData)(vlSelf->__VdfgTmp_h13c76457__0) 
                                              << 0x1eU) 
                                             | (((IData)(vlSelf->__VdfgTmp_h135e48e4__0) 
                                                 << 0x1dU) 
                                                | (((IData)(vlSelf->__VdfgTmp_h1342a9e5__0) 
                                                    << 0x1cU) 
                                                   | (((IData)(vlSelf->__VdfgTmp_h1346c3f9__0) 
                                                       << 0x1bU) 
                                                      | (((IData)(vlSelf->__VdfgTmp_h134a7ade__0) 
                                                          << 0x1aU) 
                                                         | (((IData)(vlSelf->__VdfgTmp_h13e94c22__0) 
                                                             << 0x19U) 
                                                            | (((IData)(vlSelf->__VdfgTmp_h13bce2d7__0) 
                                                                << 0x18U) 
                                                               | (((IData)(vlSelf->__VdfgTmp_h13a27bd8__0) 
                                                                   << 0x17U) 
                                                                  | (((IData)(vlSelf->__VdfgTmp_h1342a081__0) 
                                                                      << 0x16U) 
                                                                     | (((IData)(vlSelf->__VdfgTmp_h128f8c69__0) 
                                                                         << 0x15U) 
                                                                        | (((IData)(vlSelf->__VdfgTmp_h136b781e__0) 
                                                                            << 0x14U) 
                                                                           | (((IData)(vlSelf->__VdfgTmp_h13c1e028__0) 
                                                                               << 0x13U) 
                                                                              | (((IData)(vlSelf->__VdfgTmp_h13dce739__0) 
                                                                                << 0x12U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h13d82a6b__0) 
                                                                                << 0x11U) 
                                                                                | ((0x10000U 
                                                                                & (((~ (IData)(
                                                                                (0U 
                                                                                != 
                                                                                (0xffffU 
                                                                                & vlSelf->one_valid_32__02Ein)))) 
                                                                                << 0x10U) 
                                                                                & vlSelf->one_valid_32__02Ein)) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h13fc2c66__0) 
                                                                                << 0xfU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h13fb7483__0) 
                                                                                << 0xeU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h160b9868__0) 
                                                                                << 0xdU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h1607db17__0) 
                                                                                << 0xcU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h161cab63__0) 
                                                                                << 0xbU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h161f6232__0) 
                                                                                << 0xaU) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h1374e6be__0) 
                                                                                << 9U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h1371a2b5__0) 
                                                                                << 8U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h134db2cf__0) 
                                                                                << 7U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h1348cb16__0) 
                                                                                << 6U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h13253108__0) 
                                                                                << 5U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_h1320f97f__0) 
                                                                                << 4U) 
                                                                                | (IData)(vlSelf->one_valid_32__DOT__coder__DOT__one__DOT____Vcellinp__one__in)))))))))))))))))))))))))))))),32);
    bufp->chgCData(oldp+2227,(vlSelf->__SYM__switch),8);
    bufp->chgBit(oldp+2228,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awready) 
                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h2a1b7b08__0))));
    bufp->chgIData(oldp+2229,(vlSelf->simu_top__DOT__soc__DOT__m0_rdata),32);
    bufp->chgBit(oldp+2230,(vlSelf->simu_top__DOT__soc__DOT__m0_awready));
    bufp->chgBit(oldp+2231,((1U & (~ (IData)(vlSelf->aresetn)))));
    bufp->chgBit(oldp+2232,((1U & ((IData)(vlSelf->uart_rx__en0)
                                    ? ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en)) 
                                       | (IData)(vlSelf->uart_tx))
                                    : (IData)(vlSelf->uart_rx)))));
    bufp->chgCData(oldp+2233,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit),5);
    bufp->chgCData(oldp+2234,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir),3);
    bufp->chgIData(oldp+2235,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int),32);
    bufp->chgBit(oldp+2236,((1U & ((~ (IData)(vlSelf->aresetn)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))));
    bufp->chgIData(oldp+2237,(vlSelf->__SYM__switch),32);
    bufp->chgIData(oldp+2238,(((0x8000U & ((IData)(vlSelf->__SYM__switch) 
                                           << 8U)) 
                               | ((0x2000U & ((IData)(vlSelf->__SYM__switch) 
                                              << 7U)) 
                                  | ((0x800U & ((IData)(vlSelf->__SYM__switch) 
                                                << 6U)) 
                                     | ((0x200U & ((IData)(vlSelf->__SYM__switch) 
                                                   << 5U)) 
                                        | ((0x80U & 
                                            ((IData)(vlSelf->__SYM__switch) 
                                             << 4U)) 
                                           | ((0x20U 
                                               & ((IData)(vlSelf->__SYM__switch) 
                                                  << 3U)) 
                                              | ((8U 
                                                  & ((IData)(vlSelf->__SYM__switch) 
                                                     << 2U)) 
                                                 | (2U 
                                                    & ((IData)(vlSelf->__SYM__switch) 
                                                       << 1U)))))))))),32);
    bufp->chgBit(oldp+2239,(((~ (IData)((0xfU == (IData)(vlSelf->btn_key_row)))) 
                             & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    bufp->chgBit(oldp+2240,(((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                             & (0xfU == (IData)(vlSelf->btn_key_row)))));
    bufp->chgBit(oldp+2241,(((~ (IData)(vlSelf->btn_step)) 
                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r))));
    bufp->chgBit(oldp+2242,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                   & (IData)(vlSelf->btn_step)))));
    bufp->chgBit(oldp+2243,(((~ ((IData)(vlSelf->btn_step) 
                                 >> 1U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))));
    bufp->chgBit(oldp+2244,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                             & ((IData)(vlSelf->btn_step) 
                                >> 1U))));
    bufp->chgCData(oldp+2245,((0xfU & (- (IData)((IData)(vlSelf->debug0_wb_rf_wen))))),4);
    bufp->chgCData(oldp+2246,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                & ((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                             >> 5U)) 
                                   == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))
                                ? 4U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                         & ((0x1fU 
                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                >> 5U)) 
                                            == (0x1fU 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))
                                         ? 2U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                                  & ((0x1fU 
                                                      & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                         >> 5U)) 
                                                     == (IData)(vlSelf->debug0_wb_rf_wnum)))
                                                  ? 1U
                                                  : 0U)))),3);
    bufp->chgCData(oldp+2247,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                   == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))
                                ? 4U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                         & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                            == (0x1fU 
                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))
                                         ? 2U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                                  & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                                     == (IData)(vlSelf->debug0_wb_rf_wnum)))
                                                  ? 1U
                                                  : 0U)))),3);
    bufp->chgQData(oldp+2248,((((QData)((IData)(vlSelf->debug0_wb_rf_wdata)) 
                                << 6U) | (QData)((IData)(
                                                         (((IData)(vlSelf->debug0_wb_rf_wen) 
                                                           << 5U) 
                                                          | (IData)(vlSelf->debug0_wb_rf_wnum)))))),38);
    __Vtemp_74[0U] = (IData)((((QData)((IData)(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild)
                                                 ? 
                                                ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__buffer_has)
                                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__inst_buffer
                                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__rdata)
                                                 : 0U))) 
                               << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r))));
    __Vtemp_74[1U] = (IData)(((((QData)((IData)(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild)
                                                  ? 
                                                 ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__buffer_has)
                                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__inst_buffer
                                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__rdata)
                                                  : 0U))) 
                                << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__pc_f_r))) 
                              >> 0x20U));
    __Vtemp_74[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__adef_f_r;
    bufp->chgWData(oldp+2250,(__Vtemp_74),65);
    __Vtemp_82[0U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[1U])) 
                               << 0x20U) | (QData)((IData)(
                                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[0U]))));
    __Vtemp_82[1U] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[1U])) 
                                << 0x20U) | (QData)((IData)(
                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[0U]))) 
                              >> 0x20U));
    __Vtemp_82[2U] = (((IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m)) 
                                 << 0x20U) | (QData)((IData)(
                                                             vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U])))) 
                       << 7U) | ((0x40U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                           >> 5U)) 
                                 | (0x3fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])));
    __Vtemp_82[3U] = (((IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m)) 
                                 << 0x20U) | (QData)((IData)(
                                                             vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U])))) 
                       >> 0x19U) | ((IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m)) 
                                               << 0x20U) 
                                              | (QData)((IData)(
                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U]))) 
                                             >> 0x20U)) 
                                    << 7U));
    __Vtemp_82[4U] = (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                        << 0x18U) | (0xffff80U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                                  >> 8U))) 
                      | ((IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m)) 
                                    << 0x20U) | (QData)((IData)(
                                                                vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U]))) 
                                  >> 0x20U)) >> 0x19U));
    __Vtemp_82[5U] = ((0x7fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                                >> 8U)) | ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                            << 0x18U) 
                                           | (0xffff80U 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[5U] 
                                                 >> 8U))));
    __Vtemp_82[6U] = ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U] 
                       << 9U) | ((0x7fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                           >> 8U)) 
                                 | (0x180U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[6U] 
                                              >> 8U))));
    __Vtemp_82[7U] = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U] 
                      >> 0x17U);
    bufp->chgWData(oldp+2253,(__Vtemp_82),233);
    bufp->chgCData(oldp+2261,((((IData)(vlSelf->debug0_wb_rf_wnum) 
                                << 1U) | (IData)(vlSelf->debug0_wb_rf_wen))),6);
    bufp->chgIData(oldp+2262,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__rdata),32);
    bufp->chgIData(oldp+2263,(((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__hit_r))
                                ? ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r)
                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0
                                   [0xfU] : 0U) : (
                                                   (2U 
                                                    & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__hit_r))
                                                    ? 
                                                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__cached_r)
                                                     ? 
                                                    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1
                                                    [0xfU]
                                                     : 0U)
                                                    : 0U))),32);
    bufp->chgIData(oldp+2264,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__both_data_sram_rdata),32);
    bufp->chgQData(oldp+2265,((QData)((IData)(vlSelf->debug0_wb_pc))),64);
    bufp->chgBit(oldp+2267,((0U != (0xfU & (- (IData)((IData)(vlSelf->debug0_wb_rf_wen)))))));
    bufp->chgCData(oldp+2268,(vlSelf->debug0_wb_rf_wnum),8);
    bufp->chgQData(oldp+2269,((QData)((IData)(vlSelf->debug0_wb_rf_wdata))),64);
    bufp->chgIData(oldp+2271,((((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                    & ((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                 >> 5U)) 
                                       == (0x1fU & 
                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))) 
                                & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                       & ((0x1fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 5U)) 
                                          == (0x1fU 
                                              & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))) 
                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                      & ((0x1fU & (
                                                   vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                   >> 5U)) 
                                         == (IData)(vlSelf->debug0_wb_rf_wnum)))))
                                ? vlSelf->debug0_wb_rf_wdata
                                : ((0U == (0x1fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 5U)))
                                    ? 0U : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                                   [(0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                              >> 5U))]))),32);
    bufp->chgIData(oldp+2272,((((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                    & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                       == (0x1fU & 
                                           vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))) 
                                & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                       & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                          == (0x1fU 
                                              & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))) 
                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                         == (IData)(vlSelf->debug0_wb_rf_wnum)))))
                                ? vlSelf->debug0_wb_rf_wdata
                                : ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2))
                                    ? 0U : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2]))),32);
    bufp->chgIData(oldp+2273,(((0U == (0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                >> 5U)))
                                ? 0U : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                               [(0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                          >> 5U))])),32);
    bufp->chgIData(oldp+2274,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2))
                                ? 0U : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2])),32);
    bufp->chgIData(oldp+2275,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild)
                                ? ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__buffer_has)
                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__inst_buffer
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__rdata)
                                : 0U)),32);
    bufp->chgIData(oldp+2276,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mem_result_m),32);
    bufp->chgBit(oldp+2277,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid) 
                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awready))));
    bufp->chgBit(oldp+2278,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                             & (IData)(vlSelf->ram_ren))));
    bufp->chgBit(oldp+2279,((1U & ((~ (IData)(vlSelf->aresetn)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)))));
}

void Vsimu_top___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_cleanup\n"); );
    // Init
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[4U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[5U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[6U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[7U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[8U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[9U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xaU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xbU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xcU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xdU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xeU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0xfU] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0x10U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0x11U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[0x12U] = 0U;
}
