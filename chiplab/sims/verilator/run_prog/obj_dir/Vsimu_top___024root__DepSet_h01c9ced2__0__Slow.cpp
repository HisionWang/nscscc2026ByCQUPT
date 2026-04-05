// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"
#include "Vsimu_top__Syms.h"
#include "Vsimu_top___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__stl(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsimu_top___024root___eval_triggers__stl(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.set(0U, (IData)(vlSelf->__VstlFirstIteration));
    vlSelf->__VstlTriggered.set(1U, ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                                     != (IData)(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__0)));
    vlSelf->__VstlTriggered.set(2U, (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget) 
                                      != (IData)(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget__0)) 
                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq) 
                                        != (IData)(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq__0))));
    vlSelf->__VstlTriggered.set(3U, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0.neq(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0__0));
    vlSelf->__VstlTriggered.set(4U, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1.neq(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1__0));
    vlSelf->__VstlTriggered.set(5U, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0.neq(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0__0));
    vlSelf->__VstlTriggered.set(6U, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1.neq(vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1__0));
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__0 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget__0 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq__0 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0__0.assign(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way0);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1__0.assign(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT__or_tree_way1);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0__0.assign(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way0);
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1__0.assign(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_d_cache__DOT__u_cache_data__DOT__or_tree_way1);
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VstlDidInit))))) {
        vlSelf->__VstlDidInit = 1U;
        vlSelf->__VstlTriggered.set(1U, 1U);
        vlSelf->__VstlTriggered.set(2U, 1U);
        vlSelf->__VstlTriggered.set(3U, 1U);
        vlSelf->__VstlTriggered.set(4U, 1U);
        vlSelf->__VstlTriggered.set(5U, 1U);
        vlSelf->__VstlTriggered.set(6U, 1U);
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsimu_top___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
