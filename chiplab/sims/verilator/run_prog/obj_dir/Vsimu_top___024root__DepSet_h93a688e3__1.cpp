// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"
#include "Vsimu_top___024root.h"

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__9(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__9\n"); );
    // Init
    CData/*4:0*/ __Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0;
    __Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 = 0;
    IData/*31:0*/ __Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0;
    __Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 = 0;
    CData/*0:0*/ __Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0;
    __Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 = 0;
    // Body
    __Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 = 0U;
    if (vlSelf->debug0_wb_rf_wen) {
        __Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 
            = vlSelf->debug0_wb_rf_wdata;
        __Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 = 1U;
        __Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0 
            = vlSelf->debug0_wb_rf_wnum;
    }
    if (__Vdlyvset__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf[__Vdlyvdim0__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0] 
            = __Vdlyvval__simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf__v0;
    }
}

extern const VlUnpacked<CData/*2:0*/, 32> Vsimu_top__ConstPool__TABLE_hebd5b4eb_0;
extern const VlUnpacked<IData/*31:0*/, 32> Vsimu_top__ConstPool__TABLE_h2ba417e2_0;
extern const VlUnpacked<CData/*3:0*/, 1024> Vsimu_top__ConstPool__TABLE_h7dde3788_0;

VL_INLINE_OPT void Vsimu_top___024root___nba_comb__TOP__4(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_comb__TOP__4\n"); );
    // Init
    CData/*0:0*/ simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0;
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 = 0;
    CData/*4:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    SData/*9:0*/ __Vtableidx3;
    __Vtableidx3 = 0;
    // Body
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit 
        = ((((0x1fd0U == (0x1fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu_awaddr 
                                     >> 0x10U))) | 
             (0x1fafU == (0x1fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu_awaddr 
                                     >> 0x10U)))) << 3U) 
           | (((0x1fe0U == (vlSelf->simu_top__DOT__soc__DOT__cpu_awaddr 
                            >> 0x10U)) << 2U) | (1U 
                                                 & (~ (IData)(
                                                              (0U 
                                                               != 
                                                               (0xfU 
                                                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                                                                   >> 1U))))))));
    __Vtableidx1 = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir 
        = Vsimu_top__ConstPool__TABLE_hebd5b4eb_0[__Vtableidx1];
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int 
        = Vsimu_top__ConstPool__TABLE_h2ba417e2_0[__Vtableidx1];
    vlSelf->simu_top__DOT__soc__DOT__m0_awready = 0U;
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
               & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_awready 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                  >> 1U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_awready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready) 
                     >> 1U));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                  >> 2U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_awready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready) 
                     >> 2U));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                  >> 3U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_awready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready) 
                     >> 3U));
    }
    if (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
         & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
            >> 4U))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_awready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready) 
                     >> 4U));
    }
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
            & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid 
        = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
           | (IData)(simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0));
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
               >> 1U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid 
        = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
           | ((IData)(simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0) 
              << 1U));
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
               >> 2U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid 
        = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
           | ((IData)(simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0) 
              << 2U));
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
               >> 3U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid 
        = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
           | ((IData)(simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0) 
              << 3U));
    simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
               >> 4U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid 
        = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
           | ((IData)(simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc5f6e0d4__0) 
              << 4U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_ins 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awready) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awvalid)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_cpu 
        = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) 
                    | (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
                       >> 2U))));
    __Vtableidx3 = ((0xfffffe00U & ((((8U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                      << 9U) & (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast) 
                                                 << 9U) 
                                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                                   << 7U))) 
                                    | (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                        << 7U) & ((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid) 
                                                  << 9U)))) 
                    | ((0x100U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                  << 8U)) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) 
                                              << 7U) 
                                             | (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                                                 << 6U) 
                                                | ((0x20U 
                                                    & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                                       << 3U)) 
                                                   | ((0x10U 
                                                       & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                                          << 2U)) 
                                                      | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)))))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt 
        = Vsimu_top__ConstPool__TABLE_h7dde3788_0[__Vtableidx3];
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                    >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
}

VL_INLINE_OPT void Vsimu_top___024root___nba_comb__TOP__5(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_comb__TOP__5\n"); );
    // Init
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4a2e8d59__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4a2e8d59__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ed140aa__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ed140aa__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e9eac33__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e9eac33__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ea2639c__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ea2639c__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e85267a__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e85267a__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8a5529__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8a5529__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8e85ac__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8e85ac__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e883403__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e883403__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb674d7__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb674d7__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb1dea8__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb1dea8__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef5944d__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef5944d__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef94546__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef94546__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4efc3ff8__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4efc3ff8__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee02f27__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee02f27__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee59916__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee59916__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee98e5d__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee98e5d__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_h46080fd7__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_h46080fd7__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_hb92c48f2__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_hb92c48f2__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h33ffa9bf__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h33ffa9bf__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h9c86eb2c__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h9c86eb2c__0 = 0;
    CData/*0:0*/ simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h16598b99__0;
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h16598b99__0 = 0;
    // Body
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
        = ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget) 
             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq)) 
            << 0x11U) | ((0x10000U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                      >> 0xcU)) | (
                                                   (0xf800U 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                       >> 6U)) 
                                                   | ((0x400U 
                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                          >> 0xcU)) 
                                                      | (0x3ffU 
                                                         & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                             << 3U) 
                                                            | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                               >> 0x1dU)))))));
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h9c86eb2c__0 
        = ((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus) 
           == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U]));
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_hb92c48f2__0 
        = ((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                     >> 5U)) == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U]));
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h16598b99__0 
        = ((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus) 
           == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U]));
    simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h33ffa9bf__0 
        = ((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                     >> 5U)) == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U]));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
            & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h9c86eb2c__0))
            ? 3U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                     & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h16598b99__0))
                     ? 2U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                              & ((0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus) 
                                 == (IData)(vlSelf->debug0_wb_rf_wnum)))
                              ? 1U : 0U)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ld_stall 
        = (((0U != (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])) 
            & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                >> 0xbU) & ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_hb92c48f2__0) 
                            | (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h9c86eb2c__0)))) 
           | ((0U != (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])) 
              & ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                  >> 0xbU) & ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h33ffa9bf__0) 
                              | (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h16598b99__0)))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
            & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_hb92c48f2__0))
            ? 3U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                     & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h33ffa9bf__0))
                     ? 2U : (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                              & ((0x1fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
                                           >> 5U)) 
                                 == (IData)(vlSelf->debug0_wb_rf_wnum)))
                              ? 1U : 0U)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e 
        = ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U]
            : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e))
                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U]
                : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e))
                    ? vlSelf->debug0_wb_rf_wdata : 
                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer_has)
                     ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_2_buffer
                     : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[2U]))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e_self) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ld_stall) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mt)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
        = ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[2U]
            : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e))
                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[2U]
                : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e))
                    ? vlSelf->debug0_wb_rf_wdata : 
                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer_has)
                     ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__reg_1_buffer
                     : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[3U]))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result 
        = ((1U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U])
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[4U]
            : ((2U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U])
                ? 4U : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_bpu__DOT__exe_is_branch 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__is_branch));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_1_buffer 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e) 
           & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_reg_2_buffer 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e) 
           & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_h46080fd7__0 
        = ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
            >> 0x1bU) & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)) 
           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__e_to_h_bus 
              >> 0x11U));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d 
        = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ready_o) 
                 | ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[7U] 
                     >> 0xcU) | ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U] 
                                  >> 0xfU) | ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U] 
                                               >> 0xfU) 
                                              | ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[4U] 
                                                  >> 7U) 
                                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)))))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target 
        = ((IData)((0U != (0x1fb00U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU])))
            ? (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U] 
               + ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                   << 0x18U) | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[9U] 
                                >> 8U))) : (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                            + ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[9U] 
                                                << 0x18U) 
                                               | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                                                  >> 8U))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_eq_rd 
        = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
           == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
        = ((4U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U])
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U]
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u 
        = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
           < vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin)
            ? (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src1_buffer 
        = ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata1_e)) 
           & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_h46080fd7__0));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__need_alu_src2_buffer 
        = ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__forward_rdata2_e)) 
           & (IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_h46080fd7__0));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_e 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)) 
            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d)) 
           | (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_mt)) 
               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__ready_o)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild) 
            & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__data_ok)) 
               | (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num)))) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_d));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result 
        = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
           | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result);
    vlSelf->__VdfgTmp_hb5163d10__0 = ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                       ^ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result) 
                                      >> 0x1fU);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd 
        = (1U & (((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e 
                      >> 0x1fU)) & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                    >> 0x1fU)) | ((~ 
                                                   ((~ 
                                                     (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                                      >> 0x1fU)) 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e 
                                                       >> 0x1fU))) 
                                                  & ((1U 
                                                      & ((~ 
                                                          (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e 
                                                           >> 0x1fU)) 
                                                         & (~ 
                                                            (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e 
                                                             >> 0x1fU))))
                                                      ? (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u)
                                                      : 
                                                     (((IData)(1U) 
                                                       + 
                                                       (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata1_e)) 
                                                      > 
                                                      ((IData)(1U) 
                                                       + 
                                                       (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rf_rdata2_e)))))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result 
        = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
           + (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b 
              + (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____Vcellinp__u_alu__rst 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__flush_e) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req 
        = ((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset))) 
           && ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
               & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__ram_flush)) 
                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT____VdfgTmp_h1a9d3870__0))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_result 
        = ((0x80U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U])
            ? ((IData)(vlSelf->__VdfgTmp_hb5163d10__0)
                ? (1ULL + (~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul__DOT__res_temp))
                : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul__DOT__res_temp)
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul__DOT__res_temp);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken 
        = (1U & ((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[8U] 
                     >> 5U)) & (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                  >> 0x10U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_eq_rd)) 
                                | (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_eq_rd)) 
                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                       >> 0xfU)) | 
                                   (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                      >> 0xeU) & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd)) 
                                    | (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd)) 
                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                           >> 0xdU)) 
                                       | (((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                            >> 0xcU) 
                                           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u)) 
                                          | (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__rj_small_rd_u)) 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[0xaU] 
                                                 >> 0xbU)) 
                                             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT____VdfgTmp_hc75054dd__0)))))))));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4a2e8d59__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ed140aa__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (4U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e9eac33__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (8U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ea2639c__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0xcU == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e85267a__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x10U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8a5529__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x14U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8e85ac__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x18U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e883403__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x1cU == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb674d7__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x20U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb1dea8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x24U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef5944d__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x28U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef94546__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x2cU == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4efc3ff8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x30U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee02f27__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x34U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee59916__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x38U == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee98e5d__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
           & (0x3cU == (0x3cU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__cached) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__alu_result_e 
        = (((- (IData)((IData)((0U != (0x18U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U]))))) 
            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result) 
           | ((1U & ((- (IData)((1U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                       >> 5U)))) & 
                     (((~ (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result 
                           >> 0x1fU)) & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                         >> 0x1fU)) 
                      | ((~ (IData)(vlSelf->__VdfgTmp_hb5163d10__0)) 
                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__add_sub_result 
                            >> 0x1fU))))) | ((1U & 
                                              ((- (IData)(
                                                          (1U 
                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                              >> 6U)))) 
                                               & (~ (IData)(
                                                            (1ULL 
                                                             & (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a)) 
                                                                 + 
                                                                 ((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_b)) 
                                                                  + (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_cin)))) 
                                                                >> 0x20U)))))) 
                                             | (((- (IData)(
                                                            (1U 
                                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                >> 7U)))) 
                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                    & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)) 
                                                | (((~ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result) 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                     >> 8U))))) 
                                                   | (((- (IData)(
                                                                  (1U 
                                                                   & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                      >> 9U)))) 
                                                       & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__or_result) 
                                                      | (((- (IData)(
                                                                     (1U 
                                                                      & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                         >> 0xaU)))) 
                                                          & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                             ^ vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)) 
                                                         | (((- (IData)(
                                                                        (1U 
                                                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                            >> 0xeU)))) 
                                                             & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result) 
                                                            | (((- (IData)(
                                                                           (1U 
                                                                            & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                               >> 0xbU)))) 
                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                                   << 
                                                                   (0x1fU 
                                                                    & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result))) 
                                                               | (((- (IData)((IData)(
                                                                                (0U 
                                                                                != 
                                                                                (0x3000U 
                                                                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U]))))) 
                                                                   & (IData)(
                                                                             ((((QData)((IData)(
                                                                                (- (IData)(
                                                                                ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                                >> 0xdU) 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a 
                                                                                >> 0x1fU)))))) 
                                                                                << 0x20U) 
                                                                               | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__adder_a))) 
                                                                              >> 
                                                                              (0x1fU 
                                                                               & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__lui_result)))) 
                                                                  | (((- (IData)(
                                                                                (1U 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                                >> 0xfU)))) 
                                                                      & ((- (IData)(
                                                                                (1U 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                                >> 8U)))) 
                                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div_result))) 
                                                                     | (((- (IData)(
                                                                                (1U 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                                >> 0xfU)))) 
                                                                         & ((- (IData)(
                                                                                (1U 
                                                                                & (~ 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                                >> 8U))))) 
                                                                            & (IData)(
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__div_result 
                                                                                >> 0x20U)))) 
                                                                        | ((- (IData)(
                                                                                (1U 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[5U] 
                                                                                >> 0x10U)))) 
                                                                           & (((- (IData)(
                                                                                (1U 
                                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                                >> 8U)))) 
                                                                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_result)) 
                                                                              | ((- (IData)(
                                                                                (1U 
                                                                                & (~ 
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[6U] 
                                                                                >> 8U))))) 
                                                                                & (IData)(
                                                                                (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__u_alu__DOT__mul_result 
                                                                                >> 0x20U)))))))))))))))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken) 
              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target 
                 != vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U])));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_e)) 
           & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_taken) 
                  | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                     == ((IData)(4U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])))) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__is_branch)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0) 
           & ((0x100000U | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                            >> 0xcU)) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__tag_way0
              [(0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                         >> 6U))]));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0) 
           & ((0x100000U | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                            >> 0xcU)) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT__tag_way1
              [(0x3fU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__addr 
                         >> 6U))]));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__next_pc 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__excp_flush)
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_eentry
            : ((0x80U & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_write_back__DOT__m_to_w_bus_r[6U])
                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__csr_era
                : ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_brtarget)
                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__br_target
                    : ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__change_nextpc_to_seq)
                        ? ((IData)(4U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_excute__DOT__d_to_e_bus_r[1U])
                        : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__next_pc))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__0__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4a2e8d59__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__1__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ed140aa__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__2__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e9eac33__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__3__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ea2639c__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__4__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e85267a__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__5__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8a5529__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__6__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8e85ac__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__7__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e883403__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__8__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb674d7__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__9__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb1dea8__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__10__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef5944d__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__11__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef94546__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__12__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4efc3ff8__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__13__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee02f27__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__14__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee59916__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY0__BRA__15__KET____DOT__bank_way0__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee98e5d__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__0__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4a2e8d59__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__1__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ed140aa__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__2__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e9eac33__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__3__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ea2639c__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__4__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e85267a__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__5__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8a5529__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__6__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e8e85ac__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__7__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4e883403__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__8__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb674d7__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__9__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4eb1dea8__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__10__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef5944d__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__11__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ef94546__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__12__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4efc3ff8__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__13__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee02f27__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__14__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee59916__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____Vcellinp__BANK_WAY1__BRA__15__KET____DOT__bank_way1__ena 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hd2798b03__0) 
           | ((IData)(simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_h4ee98e5d__0) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state;
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = 0U;
    } else if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))) {
        if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))) {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = 0U;
        } else if (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__AXI_inst_sram_data_ok) 
                    & (0xfU == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__transfer_cnt)))) {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = 3U;
        }
    } else if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state))) {
        if (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arready) 
             & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arid)) 
                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid) 
                   & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arvalid) 
                          & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu_arid)) 
                             & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__state)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__inst_sram_req_r))))) 
                      & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_axi_bridge__DOT__rd_drop_0))))))) {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = 2U;
        }
    } else if ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__req) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__cached)) 
                & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0) 
                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0))) 
                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_tag__DOT____VdfgTmp_h407d918e__0)))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_ctrl__DOT__next_state = 1U;
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__hit 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb4b4c8b__0) 
            << 1U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__u_cache_data__DOT____VdfgTmp_hbb701e9e__0));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_addr_ok 
        = ((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reset))) 
           && ((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__drop_num))) 
               && (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_i_cache__DOT__hit))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_pre_f 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_addr_ok)) 
            & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT____VdfgTmp_h1a9d3870__0)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush 
        = ((((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f)) 
             & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_pre_f)) 
            | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__br_go)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush_from_w));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__need_buffer 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__inst_sram_data_ok) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__flush)) 
              & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__f_inst_vaild) 
                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__stall_f) 
                    & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_fetch__DOT__drop_num))))));
}

VL_INLINE_OPT void Vsimu_top___024root___nba_comb__TOP__6(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_comb__TOP__6\n"); );
    // Init
    VlWide<3>/*95:0*/ __Vtemp_1;
    VlWide<6>/*191:0*/ __Vtemp_7;
    VlWide<6>/*191:0*/ __Vtemp_9;
    VlWide<8>/*255:0*/ __Vtemp_18;
    VlWide<11>/*351:0*/ __Vtemp_26;
    VlWide<11>/*351:0*/ __Vtemp_28;
    // Body
    __Vtemp_1[1U] = (IData)((((QData)((IData)((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                                | (7U 
                                                   == 
                                                   (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                    >> 0x1aU)))
                                                ? (0xfffff000U 
                                                   & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                      << 7U))
                                                : (
                                                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi) 
                                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori) 
                                                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)))
                                                    ? 
                                                   (0xfffU 
                                                    & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                       >> 0xaU))
                                                    : 
                                                   (((- (IData)(
                                                                (1U 
                                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                    >> 0x15U)))) 
                                                     << 0xcU) 
                                                    | (0xfffU 
                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                          >> 0xaU))))))) 
                              << 0x20U) | (QData)((IData)(
                                                          (((~ 
                                                             ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                                              & ((0x1fU 
                                                                  & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                     >> 5U)) 
                                                                 == 
                                                                 (0x1fU 
                                                                  & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))) 
                                                            & ((~ 
                                                                ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                                                 & ((0x1fU 
                                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                        >> 5U)) 
                                                                    == 
                                                                    (0x1fU 
                                                                     & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))) 
                                                               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                                                  & ((0x1fU 
                                                                      & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                         >> 5U)) 
                                                                     == (IData)(vlSelf->debug0_wb_rf_wnum)))))
                                                            ? vlSelf->debug0_wb_rf_wdata
                                                            : 
                                                           ((0U 
                                                             == 
                                                             (0x1fU 
                                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                 >> 5U)))
                                                             ? 0U
                                                             : 
                                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                                                            [
                                                            (0x1fU 
                                                             & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                >> 5U))]))))));
    __Vtemp_1[2U] = (IData)(((((QData)((IData)((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                                 | (7U 
                                                    == 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)))
                                                 ? 
                                                (0xfffff000U 
                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                    << 7U))
                                                 : 
                                                (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi) 
                                                  | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori) 
                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)))
                                                  ? 
                                                 (0xfffU 
                                                  & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0xaU))
                                                  : 
                                                 (((- (IData)(
                                                              (1U 
                                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                  >> 0x15U)))) 
                                                   << 0xcU) 
                                                  | (0xfffU 
                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0xaU))))))) 
                               << 0x20U) | (QData)((IData)(
                                                           (((~ 
                                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                                                               & ((0x1fU 
                                                                   & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                      >> 5U)) 
                                                                  == 
                                                                  (0x1fU 
                                                                   & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))) 
                                                             & ((~ 
                                                                 ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                                                                  & ((0x1fU 
                                                                      & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                         >> 5U)) 
                                                                     == 
                                                                     (0x1fU 
                                                                      & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))) 
                                                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                                                                   & ((0x1fU 
                                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                          >> 5U)) 
                                                                      == (IData)(vlSelf->debug0_wb_rf_wnum)))))
                                                             ? vlSelf->debug0_wb_rf_wdata
                                                             : 
                                                            ((0U 
                                                              == 
                                                              (0x1fU 
                                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                  >> 5U)))
                                                              ? 0U
                                                              : 
                                                             vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                                                             [
                                                             (0x1fU 
                                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                 >> 5U))]))))) 
                             >> 0x20U));
    __Vtemp_7[5U] = ((0xfffffff8U & ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w) 
                                       | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w) 
                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_wu))) 
                                      << 0x10U) | (
                                                   (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2986b060__0) 
                                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w) 
                                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_wu))) 
                                                    << 0xfU) 
                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_lu12i_w) 
                                                       << 0xeU) 
                                                      | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srai_w) 
                                                           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sra_w)) 
                                                          << 0xdU) 
                                                         | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srli_w) 
                                                              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_srl_w)) 
                                                             << 0xcU) 
                                                            | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w) 
                                                                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sll_w)) 
                                                                << 0xbU) 
                                                               | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xor) 
                                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_xori)) 
                                                                   << 0xaU) 
                                                                  | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_or) 
                                                                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ori)) 
                                                                      << 9U) 
                                                                     | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_nor) 
                                                                         << 8U) 
                                                                        | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_and) 
                                                                             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_andi)) 
                                                                            << 7U) 
                                                                           | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltu) 
                                                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sltui)) 
                                                                               << 6U) 
                                                                              | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slt) 
                                                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slti)) 
                                                                                << 5U) 
                                                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_sub_w) 
                                                                                << 4U) 
                                                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_add_w) 
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
                                                                                | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0)))))))))) 
                                                                                << 3U))))))))))))))) 
                     | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__src2_is_4) 
                          | (7U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                    >> 0x1aU))) << 2U) 
                        | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__src2_is_4) 
                            << 1U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_slli_w) 
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
                                                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0)))))))))))))))));
    __Vtemp_9[5U] = ((((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w)) 
                       & ((0x16U != (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                     >> 0x1aU)) & (
                                                   (0x17U 
                                                    != 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   & ((0x14U 
                                                       != 
                                                       (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x1aU)) 
                                                      & ((0x18U 
                                                          != 
                                                          (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
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
                                                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_vaild)))))))))))))))))) 
                      << 0x16U) | ((((0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                >> 0x1aU))
                                      ? 1U : (0x1fU 
                                              & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w)
                                                  ? 
                                                 ((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                   << 0x1bU) 
                                                  | (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 5U))
                                                  : 
                                                 vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U]))) 
                                    << 0x11U) | __Vtemp_7[5U]));
    __Vtemp_18[6U] = (((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                         | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))
                         ? (((IData)((0x1ffffffffULL 
                                      & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w))))) 
                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64)) 
                            | ((IData)((0x1ffffffffULL 
                                        & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))))) 
                               & (IData)((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64 
                                          >> 0x20U))))
                         : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_data) 
                       << 0xcU) | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrrd) 
                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_csrwr) 
                                        | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_mask) 
                                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntid_w) 
                                              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w) 
                                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cpucfg))))))) 
                                    << 0xbU) | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w)
                                                   ? 3U
                                                   : 
                                                  (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu))
                                                    ? 1U
                                                    : 
                                                   (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h) 
                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu))
                                                     ? 2U
                                                     : 0U))) 
                                                 << 9U) 
                                                | ((0xffffff80U 
                                                    & ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h2986b060__0) 
                                                         | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w)) 
                                                        << 8U) 
                                                       | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_div_w) 
                                                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mod_w) 
                                                              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mul_w) 
                                                                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_mulh_w) 
                                                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                                                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h)))))) 
                                                          << 7U))) 
                                                   | ((0x7cU 
                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                          >> 3U)) 
                                                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                                                         >> 3U))))));
    __Vtemp_26[8U] = (((IData)((((QData)((IData)(((
                                                   (0x14U 
                                                    == 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   | (0x15U 
                                                      == 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                       >> 0x1aU)))
                                                   ? 
                                                  (((- (IData)(
                                                               (1U 
                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                   >> 9U)))) 
                                                    << 0x1cU) 
                                                   | ((0xffc0000U 
                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                          << 0x12U)) 
                                                      | (0x3fffcU 
                                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                            >> 8U))))
                                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                 << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs)))) 
                       << 8U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_vaild) 
                                  << 7U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ertn) 
                                             << 6U) 
                                            | (((((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall) 
                                                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break)) 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine)) 
                                                  | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int)) 
                                                 | vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U]) 
                                                << 5U) 
                                               | (0xfffffffU 
                                                  & ((0xffffff8U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__excp_ine) 
                                                         << 3U)) 
                                                     | ((0xffffffcU 
                                                         & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_break) 
                                                            << 2U)) 
                                                        | ((0xffffffeU 
                                                            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_syscall) 
                                                               << 1U)) 
                                                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int) 
                                                              >> 4U)))))))));
    __Vtemp_26[9U] = (((IData)((((QData)((IData)(((
                                                   (0x14U 
                                                    == 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   | (0x15U 
                                                      == 
                                                      (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                       >> 0x1aU)))
                                                   ? 
                                                  (((- (IData)(
                                                               (1U 
                                                                & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                   >> 9U)))) 
                                                    << 0x1cU) 
                                                   | ((0xffc0000U 
                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                          << 0x12U)) 
                                                      | (0x3fffcU 
                                                         & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                            >> 8U))))
                                                   : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                 << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs)))) 
                       >> 0x18U) | ((IData)(((((QData)((IData)(
                                                               (((0x14U 
                                                                  == 
                                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                   >> 0x1aU)) 
                                                                 | (0x15U 
                                                                    == 
                                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                     >> 0x1aU)))
                                                                 ? 
                                                                (((- (IData)(
                                                                             (1U 
                                                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                                >> 9U)))) 
                                                                  << 0x1cU) 
                                                                 | ((0xffc0000U 
                                                                     & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                        << 0x12U)) 
                                                                    | (0x3fffcU 
                                                                       & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                          >> 8U))))
                                                                 : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                               << 0x20U) 
                                              | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                             >> 0x20U)) 
                                    << 8U));
    __Vtemp_28[0xaU] = (((0x15U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                    >> 0x1aU)) << 9U) 
                        | (((0x14U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                       >> 0x1aU)) << 8U) 
                           | ((IData)(((((QData)((IData)(
                                                         (((0x14U 
                                                            == 
                                                            (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                             >> 0x1aU)) 
                                                           | (0x15U 
                                                              == 
                                                              (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                               >> 0x1aU)))
                                                           ? 
                                                          (((- (IData)(
                                                                       (1U 
                                                                        & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                           >> 9U)))) 
                                                            << 0x1cU) 
                                                           | ((0xffc0000U 
                                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                  << 0x12U)) 
                                                              | (0x3fffcU 
                                                                 & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                                    >> 8U))))
                                                           : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                         << 0x20U) 
                                        | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__jirl_offs))) 
                                       >> 0x20U)) >> 0x18U)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[0U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[0U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[2U] 
        = (((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h89f78686__0) 
                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                   == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__e_to_mt_bus_r[4U])))) 
            & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_he1182172__0) 
                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                      == (0x1fU & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_memory__DOT__mt_to_mr_bus_r[4U])))) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_hazard_unit__DOT____VdfgTmp_h92336f42__0) 
                  & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
                     == (IData)(vlSelf->debug0_wb_rf_wnum)))))
            ? vlSelf->debug0_wb_rf_wdata : ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2))
                                             ? 0U : 
                                            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__u_regfile__DOT__rf
                                            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2]));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[3U] 
        = __Vtemp_1[1U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[4U] 
        = __Vtemp_1[2U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[5U] 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__rf_raddr2) 
            << 0x1dU) | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT____VdfgTmp_h67397468__0)) 
                          << 0x1cU) | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w) 
                                         | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_w) 
                                            | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_b) 
                                               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_h) 
                                                  | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_bu) 
                                                     | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_ld_hu) 
                                                        | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b) 
                                                           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h)))))))) 
                                        << 0x1bU) | 
                                       ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_w)
                                           ? 0xfU : 
                                          ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_b)
                                            ? 1U : 
                                           ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_st_h)
                                             ? 3U : 0U))) 
                                         << 0x17U) 
                                        | __Vtemp_9[5U]))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[6U] 
        = __Vtemp_18[6U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[7U] 
        = ((0xf0000000U & ((0x20000000U & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[2U] 
                                           << 0x1dU)) 
                           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__has_int) 
                              << 0x1cU))) | ((0xfffc000U 
                                              & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                 << 4U)) 
                                             | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_mask) 
                                                 << 0xdU) 
                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__csr_we) 
                                                    << 0xcU) 
                                                   | ((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w) 
                                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))
                                                        ? 
                                                       (((IData)(
                                                                 (0x1ffffffffULL 
                                                                  & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvl_w))))) 
                                                         & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64)) 
                                                        | ((IData)(
                                                                   (0x1ffffffffULL 
                                                                    & (- (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_rdcntvh_w))))) 
                                                           & (IData)(
                                                                     (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_csr__DOT__timer_64 
                                                                      >> 0x20U))))
                                                        : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__csr_rd_data) 
                                                      >> 0x14U)))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[8U] 
        = __Vtemp_26[8U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[9U] 
        = __Vtemp_26[9U];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__d_to_e_bus[0xaU] 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__inst_cpucfg) 
            << 0x11U) | (((0x16U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                     >> 0x1aU)) << 0x10U) 
                         | (((0x17U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                        >> 0x1aU)) 
                             << 0xfU) | (((0x18U == 
                                           (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                            >> 0x1aU)) 
                                          << 0xeU) 
                                         | (((0x19U 
                                              == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                             << 0xdU) 
                                            | (((0x1aU 
                                                 == 
                                                 (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                  >> 0x1aU)) 
                                                << 0xcU) 
                                               | (((0x1bU 
                                                    == 
                                                    (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                     >> 0x1aU)) 
                                                   << 0xbU) 
                                                  | (((0x13U 
                                                       == 
                                                       (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__u_decode__DOT__f_to_d_bus_r[1U] 
                                                        >> 0x1aU)) 
                                                      << 0xaU) 
                                                     | __Vtemp_28[0xaU]))))))));
}

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__10(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__10\n"); );
    // Body
    vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 0U;
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [0U];
    }
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [1U];
    }
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [2U];
    }
    if ((8U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [3U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 0U;
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [0U];
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [1U];
    }
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [2U];
    }
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [3U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_bid = 0U;
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [0U];
    }
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [1U];
    }
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [2U];
    }
    if ((8U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [3U];
    }
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [4U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 0U;
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [0U];
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [1U];
    }
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
    }
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
    }
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
    }
}

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__11(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__11\n"); );
    // Body
    vlSelf->NAND_top__DOT__REG_DAT_T = ((((~ (IData)(vlSelf->pwrite)) 
                                          & (IData)(vlSelf->NAND_top__DOT__HIT0)) 
                                         & (IData)(vlSelf->penable))
                                         ? vlSelf->NAND_top__DOT__nand_command
                                         : ((((~ (IData)(vlSelf->pwrite)) 
                                              & (IData)(vlSelf->NAND_top__DOT__HIT1)) 
                                             & (IData)(vlSelf->penable))
                                             ? (IData)((QData)((IData)(vlSelf->NAND_top__DOT__nand_addr_c)))
                                             : ((((~ (IData)(vlSelf->pwrite)) 
                                                  & (IData)(vlSelf->NAND_top__DOT__HIT2)) 
                                                 & (IData)(vlSelf->penable))
                                                 ? vlSelf->NAND_top__DOT__nand_addr_r
                                                 : 
                                                ((((~ (IData)(vlSelf->pwrite)) 
                                                   & (IData)(vlSelf->NAND_top__DOT__HIT3)) 
                                                  & (IData)(vlSelf->penable))
                                                  ? (IData)(vlSelf->NAND_top__DOT__nand_timing)
                                                  : 
                                                 ((((~ (IData)(vlSelf->pwrite)) 
                                                    & ((IData)(vlSelf->psel) 
                                                       & (0x10U 
                                                          == (IData)(vlSelf->ADDR)))) 
                                                   & (IData)(vlSelf->penable))
                                                   ? (IData)(vlSelf->NAND_top__DOT__ID_INFORM)
                                                   : 
                                                  ((((~ (IData)(vlSelf->pwrite)) 
                                                     & ((IData)(vlSelf->psel) 
                                                        & (0x14U 
                                                           == (IData)(vlSelf->ADDR)))) 
                                                    & (IData)(vlSelf->penable))
                                                    ? 
                                                   (((IData)(vlSelf->NAND_top__DOT__status) 
                                                     << 0x10U) 
                                                    | (0xffffU 
                                                       & (IData)(
                                                                 (vlSelf->NAND_top__DOT__ID_INFORM 
                                                                  >> 0x20U))))
                                                    : 
                                                   ((((~ (IData)(vlSelf->pwrite)) 
                                                      & (IData)(vlSelf->NAND_top__DOT__HIT6)) 
                                                     & (IData)(vlSelf->penable))
                                                     ? vlSelf->NAND_top__DOT__nand_parameter
                                                     : 
                                                    ((((~ (IData)(vlSelf->pwrite)) 
                                                       & (IData)(vlSelf->NAND_top__DOT__HIT7)) 
                                                      & (IData)(vlSelf->penable))
                                                      ? vlSelf->NAND_top__DOT__nand_op_num
                                                      : 
                                                     ((((~ (IData)(vlSelf->pwrite)) 
                                                        & (IData)(vlSelf->NAND_top__DOT__HIT8)) 
                                                       & (IData)(vlSelf->penable))
                                                       ? vlSelf->NAND_top__DOT__nand_ce_map0
                                                       : 
                                                      ((((~ (IData)(vlSelf->pwrite)) 
                                                         & (IData)(vlSelf->NAND_top__DOT__HIT9)) 
                                                        & (IData)(vlSelf->penable))
                                                        ? vlSelf->NAND_top__DOT__nand_ce_map1
                                                        : 
                                                       ((((~ (IData)(vlSelf->pwrite)) 
                                                          & (IData)(vlSelf->NAND_top__DOT__HIT10)) 
                                                         & (IData)(vlSelf->penable))
                                                         ? vlSelf->NAND_top__DOT__nand_rdy_map0
                                                         : 
                                                        ((((~ (IData)(vlSelf->pwrite)) 
                                                           & (IData)(vlSelf->NAND_top__DOT__HIT11)) 
                                                          & (IData)(vlSelf->penable))
                                                          ? vlSelf->NAND_top__DOT__nand_rdy_map1
                                                          : 
                                                         ((((~ (IData)(vlSelf->pwrite)) 
                                                            & (IData)(vlSelf->NAND_top__DOT__NAND_HIT)) 
                                                           & (IData)(vlSelf->penable))
                                                           ? vlSelf->NAND_top__DOT__NAND_DAT_O_RD
                                                           : 0U)))))))))))));
    vlSelf->DAT_O = vlSelf->NAND_top__DOT__REG_DAT_T;
}

void Vsimu_top___024root___nba_sequent__TOP__0(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__1(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__2(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__3(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__4(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__5(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__6(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__7(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__8(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_sequent__TOP__2(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_sequent__TOP__3(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_sequent__TOP__5(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_sequent__TOP__4(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_comb__TOP__0(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___act_comb__TOP__1(Vsimu_top___024root* vlSelf);

void Vsimu_top___024root___eval_nba(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_nba\n"); );
    // Body
    if ((0x200ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((0x80ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__1(vlSelf);
    }
    if ((0x100ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__2(vlSelf);
    }
    if ((0x40ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__3(vlSelf);
    }
    if ((0x400ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__4(vlSelf);
    }
    if ((0x800ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__5(vlSelf);
    }
    if ((0x1000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__6(vlSelf);
        vlSelf->__Vm_traceActivity[8U] = 1U;
    }
    if ((0x2000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__7(vlSelf);
        vlSelf->__Vm_traceActivity[9U] = 1U;
        Vsimu_top___024root___nba_sequent__TOP__8(vlSelf);
    }
    if ((0x4000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__9(vlSelf);
        vlSelf->__Vm_traceActivity[0xaU] = 1U;
    }
    if ((0x2004ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_sequent__TOP__2(vlSelf);
        vlSelf->__Vm_traceActivity[0xbU] = 1U;
    }
    if ((0x2008ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_sequent__TOP__3(vlSelf);
        vlSelf->__Vm_traceActivity[0xcU] = 1U;
    }
    if ((0x2020ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_sequent__TOP__5(vlSelf);
        vlSelf->__Vm_traceActivity[0xdU] = 1U;
    }
    if ((0x2010ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_sequent__TOP__4(vlSelf);
        vlSelf->__Vm_traceActivity[0xeU] = 1U;
    }
    if ((0x2001ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_comb__TOP__4(vlSelf);
        vlSelf->__Vm_traceActivity[0xfU] = 1U;
    }
    if ((0x2002ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_comb__TOP__5(vlSelf);
        vlSelf->__Vm_traceActivity[0x10U] = 1U;
    }
    if ((0x6000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_comb__TOP__6(vlSelf);
        vlSelf->__Vm_traceActivity[0x11U] = 1U;
    }
    if ((0x2000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__10(vlSelf);
        vlSelf->__Vm_traceActivity[0x12U] = 1U;
    }
    if ((0x1000ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__11(vlSelf);
    }
    if ((0x200cULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_comb__TOP__0(vlSelf);
    }
    if ((0x2030ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___act_comb__TOP__1(vlSelf);
    }
}

void Vsimu_top___024root___eval_triggers__act(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___eval_act(Vsimu_top___024root* vlSelf);

bool Vsimu_top___024root___eval_phase__act(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<15> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vsimu_top___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vsimu_top___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vsimu_top___024root___eval_phase__nba(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vsimu_top___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__ico(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG
bool Vsimu_top___024root___eval_phase__ico(Vsimu_top___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__nba(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__act(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG

void Vsimu_top___024root___eval(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelf->__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY((0x64U < __VicoIterCount))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("../testbench/difftest.v", 101, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vsimu_top___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("../testbench/difftest.v", 101, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vsimu_top___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("../testbench/difftest.v", 101, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vsimu_top___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vsimu_top___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vsimu_top___024root___eval_debug_assertions(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->DifftestExcpEvent__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestExcpEvent.clock");}
    if (VL_UNLIKELY((vlSelf->excp_valid & 0xfeU))) {
        Verilated::overWidthError("excp_valid");}
    if (VL_UNLIKELY((vlSelf->eret & 0xfeU))) {
        Verilated::overWidthError("eret");}
    if (VL_UNLIKELY((vlSelf->DifftestTrapEvent__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestTrapEvent.clock");}
    if (VL_UNLIKELY((vlSelf->DifftestTrapEvent__02Evalid 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestTrapEvent.valid");}
    if (VL_UNLIKELY((vlSelf->code & 0xf8U))) {
        Verilated::overWidthError("code");}
    if (VL_UNLIKELY((vlSelf->DifftestStoreEvent__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestStoreEvent.clock");}
    if (VL_UNLIKELY((vlSelf->DifftestLoadEvent__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestLoadEvent.clock");}
    if (VL_UNLIKELY((vlSelf->DifftestCSRRegState__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestCSRRegState.clock");}
    if (VL_UNLIKELY((vlSelf->DifftestGRegState__02Eclock 
                     & 0xfeU))) {
        Verilated::overWidthError("DifftestGRegState.clock");}
    if (VL_UNLIKELY((vlSelf->nand_type & 0xfcU))) {
        Verilated::overWidthError("nand_type");}
    if (VL_UNLIKELY((vlSelf->pclk & 0xfeU))) {
        Verilated::overWidthError("pclk");}
    if (VL_UNLIKELY((vlSelf->prst_ & 0xfeU))) {
        Verilated::overWidthError("prst_");}
    if (VL_UNLIKELY((vlSelf->psel & 0xfeU))) {
        Verilated::overWidthError("psel");}
    if (VL_UNLIKELY((vlSelf->penable & 0xfeU))) {
        Verilated::overWidthError("penable");}
    if (VL_UNLIKELY((vlSelf->pwrite & 0xfeU))) {
        Verilated::overWidthError("pwrite");}
    if (VL_UNLIKELY((vlSelf->ADDR & 0xf800U))) {
        Verilated::overWidthError("ADDR");}
    if (VL_UNLIKELY((vlSelf->NAND_IORDY_i & 0xf0U))) {
        Verilated::overWidthError("NAND_IORDY_i");}
    if (VL_UNLIKELY((vlSelf->aclk & 0xfeU))) {
        Verilated::overWidthError("aclk");}
    if (VL_UNLIKELY((vlSelf->aresetn & 0xfeU))) {
        Verilated::overWidthError("aresetn");}
    if (VL_UNLIKELY((vlSelf->enable_delay & 0xfeU))) {
        Verilated::overWidthError("enable_delay");}
    if (VL_UNLIKELY((vlSelf->random_seed & 0xff800000U))) {
        Verilated::overWidthError("random_seed");}
    if (VL_UNLIKELY((vlSelf->uart_rx & 0xfeU))) {
        Verilated::overWidthError("uart_rx");}
    if (VL_UNLIKELY((vlSelf->uart_tx & 0xfeU))) {
        Verilated::overWidthError("uart_tx");}
    if (VL_UNLIKELY((vlSelf->btn_key_row & 0xf0U))) {
        Verilated::overWidthError("btn_key_row");}
    if (VL_UNLIKELY((vlSelf->btn_step & 0xfcU))) {
        Verilated::overWidthError("btn_step");}
}
#endif  // VL_DEBUG
