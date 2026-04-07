// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vsimu_top___024root___eval_triggers__ico(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_triggers__ico\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VicoTriggered
                                      [0U]) | (IData)((IData)(vlSelfRef.__VicoFirstIteration)));
    vlSelfRef.__VicoFirstIteration = 0U;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsimu_top___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
}

bool Vsimu_top___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

extern const VlUnpacked<IData/*31:0*/, 256> Vsimu_top__ConstPool__TABLE_ha6481172_0;
extern const VlUnpacked<SData/*15:0*/, 256> Vsimu_top__ConstPool__TABLE_h2f5425a8_0;
extern const VlUnpacked<CData/*2:0*/, 512> Vsimu_top__ConstPool__TABLE_hb25a9de7_0;
extern const VlUnpacked<CData/*3:0*/, 1024> Vsimu_top__ConstPool__TABLE_hbbc23a9e_0;

void Vsimu_top___024root___ico_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___ico_sequent__TOP__0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*7:0*/ __Vtableidx10;
    __Vtableidx10 = 0;
    // Body
    vlSelfRef.NAND_top__DOT__NANDtag = ((IData)(vlSelfRef.NAND_top__DOT__nand_cmd_valid) 
                                        & (IData)(vlSelfRef.prst_));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
               >> 2U)));
    __Vtableidx10 = vlSelfRef.__SYM__switch;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data 
        = Vsimu_top__ConstPool__TABLE_ha6481172_0[__Vtableidx10];
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable))));
    vlSelfRef.__Vtableidx12 = ((((((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                   << 3U) | ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                             << 2U)) 
                                 | (((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                     << 1U) | (7U == (IData)(vlSelfRef.btn_key_row)))) 
                                << 4U) | ((((0x0bU 
                                             == (IData)(vlSelfRef.btn_key_row)) 
                                            << 3U) 
                                           | ((0x0dU 
                                               == (IData)(vlSelfRef.btn_key_row)) 
                                              << 2U)) 
                                          | (((0x0eU 
                                               == (IData)(vlSelfRef.btn_key_row)) 
                                              << 1U) 
                                             | (1U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp 
        = Vsimu_top__ConstPool__TABLE_h2f5425a8_0[vlSelfRef.__Vtableidx12];
    vlSelfRef.__Vtableidx11 = ((((((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                   << 4U) | (((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                              << 3U) 
                                             | ((3U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                << 2U))) 
                                 | (((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                     << 1U) | (0x0000000fU 
                                               == (IData)(vlSelfRef.btn_key_row)))) 
                                << 4U) | ((((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                            << 3U) 
                                           | (4U & 
                                              (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                               >> 0x00000011U))) 
                                          | ((2U & 
                                              ((~ (0x0000000fU 
                                                   == (IData)(vlSelfRef.btn_key_row))) 
                                               << 1U)) 
                                             | (0U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state 
        = Vsimu_top__ConstPool__TABLE_hb25a9de7_0[vlSelfRef.__Vtableidx11];
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__ 
        = (1U & ((0x10000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x20000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x40000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x0000001fU)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__ 
        = (1U & ((0x00100000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x00200000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x00400000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x00000017U)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__ 
        = (1U & ((0x00001000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x00002000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x00004000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x0000000fU)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0U] 
        = vlSelfRef.ram_rdata;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.NAND_top__DOT__HIT0 = ((IData)(vlSelfRef.psel) 
                                     & (0U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT1 = ((IData)(vlSelfRef.psel) 
                                     & (4U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT10 = ((IData)(vlSelfRef.psel) 
                                      & (0x0028U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT11 = ((IData)(vlSelfRef.psel) 
                                      & (0x002cU == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT2 = ((IData)(vlSelfRef.psel) 
                                     & (8U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT3 = ((IData)(vlSelfRef.psel) 
                                     & (0x000cU == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT6 = ((IData)(vlSelfRef.psel) 
                                     & (0x0018U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT7 = ((IData)(vlSelfRef.psel) 
                                     & (0x001cU == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT8 = ((IData)(vlSelfRef.psel) 
                                     & (0x0020U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__HIT9 = ((IData)(vlSelfRef.psel) 
                                     & (0x0024U == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.NAND_top__DOT__NAND_HIT = ((IData)(vlSelfRef.penable) 
                                         & (0x0040U 
                                            == (IData)(vlSelfRef.ADDR)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable))));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 3U)));
    vlSelfRef.NAND_top__DOT__NAND_IORDY = (1U & ((0U 
                                                  == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                                                  : 
                                                 ((1U 
                                                   == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                   ? (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__)
                                                   : 
                                                  ((2U 
                                                    == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                    ? (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__)
                                                    : 
                                                   ((3U 
                                                     != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
                                                    | (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__))))));
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata = 0U;
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [0U];
    }
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [1U];
    }
    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
    }
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
    }
    vlSelfRef.ram_wen = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb) 
                         & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
    vlSelfRef.NAND_top__DOT__REG_DAT_T = (((~ (IData)(vlSelfRef.pwrite)) 
                                           & ((IData)(vlSelfRef.NAND_top__DOT__HIT0) 
                                              & (IData)(vlSelfRef.penable)))
                                           ? vlSelfRef.NAND_top__DOT__nand_command
                                           : (((~ (IData)(vlSelfRef.pwrite)) 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__HIT1) 
                                                  & (IData)(vlSelfRef.penable)))
                                               ? (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)
                                               : ((
                                                   (~ (IData)(vlSelfRef.pwrite)) 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__HIT2) 
                                                      & (IData)(vlSelfRef.penable)))
                                                   ? vlSelfRef.NAND_top__DOT__nand_addr_r
                                                   : 
                                                  (((~ (IData)(vlSelfRef.pwrite)) 
                                                    & ((IData)(vlSelfRef.NAND_top__DOT__HIT3) 
                                                       & (IData)(vlSelfRef.penable)))
                                                    ? (IData)(vlSelfRef.NAND_top__DOT__nand_timing)
                                                    : 
                                                   (((~ (IData)(vlSelfRef.pwrite)) 
                                                     & (((IData)(vlSelfRef.psel) 
                                                         & (0x0010U 
                                                            == (IData)(vlSelfRef.ADDR))) 
                                                        & (IData)(vlSelfRef.penable)))
                                                     ? (IData)(vlSelfRef.NAND_top__DOT__ID_INFORM)
                                                     : 
                                                    (((~ (IData)(vlSelfRef.pwrite)) 
                                                      & (((IData)(vlSelfRef.psel) 
                                                          & (0x0014U 
                                                             == (IData)(vlSelfRef.ADDR))) 
                                                         & (IData)(vlSelfRef.penable)))
                                                      ? 
                                                     (((IData)(vlSelfRef.NAND_top__DOT__status) 
                                                       << 0x00000010U) 
                                                      | (0x0000ffffU 
                                                         & (IData)(
                                                                   (vlSelfRef.NAND_top__DOT__ID_INFORM 
                                                                    >> 0x00000020U))))
                                                      : 
                                                     (((~ (IData)(vlSelfRef.pwrite)) 
                                                       & ((IData)(vlSelfRef.NAND_top__DOT__HIT6) 
                                                          & (IData)(vlSelfRef.penable)))
                                                       ? vlSelfRef.NAND_top__DOT__nand_parameter
                                                       : 
                                                      (((~ (IData)(vlSelfRef.pwrite)) 
                                                        & ((IData)(vlSelfRef.NAND_top__DOT__HIT7) 
                                                           & (IData)(vlSelfRef.penable)))
                                                        ? vlSelfRef.NAND_top__DOT__nand_op_num
                                                        : 
                                                       (((~ (IData)(vlSelfRef.pwrite)) 
                                                         & ((IData)(vlSelfRef.NAND_top__DOT__HIT8) 
                                                            & (IData)(vlSelfRef.penable)))
                                                         ? vlSelfRef.NAND_top__DOT__nand_ce_map0
                                                         : 
                                                        (((~ (IData)(vlSelfRef.pwrite)) 
                                                          & ((IData)(vlSelfRef.NAND_top__DOT__HIT9) 
                                                             & (IData)(vlSelfRef.penable)))
                                                          ? vlSelfRef.NAND_top__DOT__nand_ce_map1
                                                          : 
                                                         (((~ (IData)(vlSelfRef.pwrite)) 
                                                           & ((IData)(vlSelfRef.NAND_top__DOT__HIT10) 
                                                              & (IData)(vlSelfRef.penable)))
                                                           ? vlSelfRef.NAND_top__DOT__nand_rdy_map0
                                                           : 
                                                          (((~ (IData)(vlSelfRef.pwrite)) 
                                                            & ((IData)(vlSelfRef.NAND_top__DOT__HIT11) 
                                                               & (IData)(vlSelfRef.penable)))
                                                            ? vlSelfRef.NAND_top__DOT__nand_rdy_map1
                                                            : 
                                                           (((~ (IData)(vlSelfRef.pwrite)) 
                                                             & ((IData)(vlSelfRef.NAND_top__DOT__NAND_HIT) 
                                                                & (IData)(vlSelfRef.penable)))
                                                             ? vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD
                                                             : 0U)))))))))))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb) 
           & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid 
        = (((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
             ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)))
             : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                 ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid)
                 : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid)
                     : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid)))) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready 
        = (((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
             ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))))
             : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                 ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                    & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                       & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))))
                 : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                     ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                        & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))))
                     : ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                        & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))))))) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2));
    if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata 
        = ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata 
        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata 
        = ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelfRef.DAT_O = vlSelfRef.NAND_top__DOT__REG_DAT_T;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
           & (0xe000U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
           & (0xff10U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready) 
              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 1U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 2U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 3U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 3U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 4U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 4U));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid 
        = ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid 
        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid 
        = ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 1U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 2U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 3U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 4U));
    }
    vlSelfRef.write_uart_valid = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu 
        = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) 
                 | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
                       >> 2U))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state));
    vlSelfRef.__Vtableidx3 = ((((((((8U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                    & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                       & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                          >> 2U))) 
                                   | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                       >> 2U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid))) 
                                  << 4U) | (((2U & 
                                              ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                               << 1U)) 
                                             | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd)) 
                                            << 2U)) 
                                | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                                    << 1U) | (1U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                               >> 2U)))) 
                               << 5U) | ((0x00000010U 
                                          & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                             << 2U)) 
                                         | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt 
        = Vsimu_top__ConstPool__TABLE_hbbc23a9e_0[vlSelfRef.__Vtableidx3];
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelfRef.ram_ren = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
}

void Vsimu_top___024root___eval_ico(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_ico\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VicoTriggered[0U])) {
        Vsimu_top___024root___ico_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[1U] = 1U;
    }
}

bool Vsimu_top___024root___eval_phase__ico(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__ico\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    Vsimu_top___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = Vsimu_top___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        Vsimu_top___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vsimu_top___024root___eval_triggers__act(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_triggers__act\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                    ((((IData)(vlSelfRef.pclk) 
                                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__pclk__0))) 
                                                      << 1U) 
                                                     | ((IData)(vlSelfRef.aclk) 
                                                        & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__aclk__0))))));
    vlSelfRef.__Vtrigprevexpr___TOP__aclk__0 = vlSelfRef.aclk;
    vlSelfRef.__Vtrigprevexpr___TOP__pclk__0 = vlSelfRef.pclk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsimu_top___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
}

bool Vsimu_top___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vsimu_top___024unit____Vdpiimwrap_v_difftest_ExcpEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ excp_valid, CData/*0:0*/ eret, IData/*31:0*/ intrNo, IData/*31:0*/ cause, QData/*63:0*/ exceptionPC, IData/*31:0*/ exceptionInst);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_StoreEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*7:0*/ valid, QData/*63:0*/ storePAddr, QData/*63:0*/ storeVAddr, QData/*63:0*/ storeData);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_LoadEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*7:0*/ valid, QData/*63:0*/ paddr, QData/*63:0*/ vaddr);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_CSRRegState_TOP____024unit(CData/*7:0*/ coreid, QData/*63:0*/ crmd, QData/*63:0*/ prmd, QData/*63:0*/ euen, QData/*63:0*/ ecfg, QData/*63:0*/ estat, QData/*63:0*/ era, QData/*63:0*/ badv, QData/*63:0*/ eentry, QData/*63:0*/ tlbidx, QData/*63:0*/ tlbehi, QData/*63:0*/ tlbelo0, QData/*63:0*/ tlbelo1, QData/*63:0*/ asid, QData/*63:0*/ pgdl, QData/*63:0*/ pgdh, QData/*63:0*/ save0, QData/*63:0*/ save1, QData/*63:0*/ save2, QData/*63:0*/ save3, QData/*63:0*/ tid, QData/*63:0*/ tcfg, QData/*63:0*/ tval, QData/*63:0*/ ticlr, QData/*63:0*/ llbctl, QData/*63:0*/ tlbrentry, QData/*63:0*/ dmw0, QData/*63:0*/ dmw1);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_GRegState_TOP____024unit(CData/*7:0*/ coreid, QData/*63:0*/ gpr_0, QData/*63:0*/ gpr_1, QData/*63:0*/ gpr_2, QData/*63:0*/ gpr_3, QData/*63:0*/ gpr_4, QData/*63:0*/ gpr_5, QData/*63:0*/ gpr_6, QData/*63:0*/ gpr_7, QData/*63:0*/ gpr_8, QData/*63:0*/ gpr_9, QData/*63:0*/ gpr_10, QData/*63:0*/ gpr_11, QData/*63:0*/ gpr_12, QData/*63:0*/ gpr_13, QData/*63:0*/ gpr_14, QData/*63:0*/ gpr_15, QData/*63:0*/ gpr_16, QData/*63:0*/ gpr_17, QData/*63:0*/ gpr_18, QData/*63:0*/ gpr_19, QData/*63:0*/ gpr_20, QData/*63:0*/ gpr_21, QData/*63:0*/ gpr_22, QData/*63:0*/ gpr_23, QData/*63:0*/ gpr_24, QData/*63:0*/ gpr_25, QData/*63:0*/ gpr_26, QData/*63:0*/ gpr_27, QData/*63:0*/ gpr_28, QData/*63:0*/ gpr_29, QData/*63:0*/ gpr_30, QData/*63:0*/ gpr_31);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_InstrCommit_TOP____024unit(CData/*7:0*/ coreid, CData/*7:0*/ index, CData/*0:0*/ valid, QData/*63:0*/ pc, IData/*31:0*/ instr, CData/*0:0*/ skip, CData/*0:0*/ is_TLBFILL, CData/*7:0*/ TLBFILL_index, CData/*0:0*/ is_CNTinst, QData/*63:0*/ timer_64_value, CData/*0:0*/ wen, CData/*7:0*/ wdest, QData/*63:0*/ wdata, CData/*0:0*/ csr_rstat, IData/*31:0*/ csr_data);
void Vsimu_top___024unit____Vdpiimwrap_v_difftest_TrapEvent_TOP____024unit(CData/*7:0*/ coreid, CData/*0:0*/ valid, CData/*7:0*/ code, QData/*63:0*/ pc, QData/*63:0*/ cycleCnt, QData/*63:0*/ instrCnt);
extern const VlUnpacked<CData/*0:0*/, 2048> Vsimu_top__ConstPool__TABLE_h0409fe98_0;
extern const VlUnpacked<CData/*6:0*/, 32> Vsimu_top__ConstPool__TABLE_he44e85c3_0;
extern const VlUnpacked<CData/*3:0*/, 64> Vsimu_top__ConstPool__TABLE_h34e97a3e_0;
extern const VlUnpacked<CData/*3:0*/, 4> Vsimu_top__ConstPool__TABLE_h19403ecc_0;
extern const VlUnpacked<CData/*2:0*/, 32> Vsimu_top__ConstPool__TABLE_h43fcfe92_0;
extern const VlUnpacked<IData/*31:0*/, 32> Vsimu_top__ConstPool__TABLE_hfff90dde_0;
extern const VlUnpacked<CData/*7:0*/, 256> Vsimu_top__ConstPool__TABLE_h65cd9ac3_0;
extern const VlUnpacked<SData/*9:0*/, 256> Vsimu_top__ConstPool__TABLE_h53d02be3_0;

void Vsimu_top___024root___nba_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    SData/*10:0*/ __Vtableidx6;
    __Vtableidx6 = 0;
    CData/*5:0*/ __Vtableidx7;
    __Vtableidx7 = 0;
    CData/*4:0*/ __Vtableidx9;
    __Vtableidx9 = 0;
    CData/*1:0*/ __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state = 0;
    CData/*1:0*/ __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state = 0;
    CData/*1:0*/ __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state = 0;
    CData/*1:0*/ __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state = 0;
    IData/*19:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid;
    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 0;
    CData/*2:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size = 0;
    CData/*2:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid;
    __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant = 0;
    CData/*7:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r = 0;
    SData/*15:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc = 0;
    CData/*7:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd = 0;
    CData/*2:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0;
    CData/*2:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = 0;
    CData/*4:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = 0;
    CData/*2:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor = 0;
    CData/*6:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = 0;
    CData/*4:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor = 0;
    CData/*7:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = 0;
    CData/*7:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b = 0;
    SData/*9:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom = 0;
    CData/*4:0*/ __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur;
    __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur;
    __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5 = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7 = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 = 0;
    IData/*19:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count = 0;
    CData/*3:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count = 0;
    IData/*19:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count = 0;
    IData/*19:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count = 0;
    IData/*19:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count = 0;
    CData/*0:0*/ __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog;
    __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog = 0;
    CData/*1:0*/ __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr;
    __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr = 0;
    IData/*31:0*/ __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag__v0 = 0;
    IData/*31:0*/ __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag__v0 = 0;
    IData/*31:0*/ __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag__v0 = 0;
    IData/*31:0*/ __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag__v0 = 0;
    IData/*31:0*/ __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid__v0;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid__v0 = 0;
    CData/*7:0*/ __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0;
    CData/*3:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0;
    __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v0;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v0 = 0;
    CData/*2:0*/ __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16;
    __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 = 0;
    CData/*3:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16;
    __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 = 0;
    CData/*3:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17;
    __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17 = 0;
    CData/*2:0*/ __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18;
    __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 = 0;
    CData/*3:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18;
    __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v19;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v19 = 0;
    CData/*7:0*/ __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 = 0;
    CData/*3:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0;
    __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram__v0;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram__v0 = 0;
    CData/*2:0*/ __VdlyVal__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0;
    __VdlyVal__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 = 0;
    CData/*0:0*/ __VdlyDim0__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0;
    __VdlyDim0__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 = 0;
    CData/*0:0*/ __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v1;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v1 = 0;
    // Body
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_ExcpEvent_TOP____024unit(0U, 0U, 0U, 0U, 0U, 0ULL, 0U);
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_StoreEvent_TOP____024unit(0U, 0U, 0U, 0ULL, 0ULL, 0ULL);
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_LoadEvent_TOP____024unit(0U, 0U, 0U, 0ULL, 0ULL);
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_CSRRegState_TOP____024unit(0U, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL);
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_GRegState_TOP____024unit(0U, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL, 0ULL);
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0 = 0U;
    if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid) {
        Vsimu_top___024unit____Vdpiimwrap_v_difftest_InstrCommit_TOP____024unit(0U, 0U, (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid), 0ULL, 0U, 0U, 0U, 0U, 0U, 0ULL, 0U, 0U, 0ULL, 0U, 0U);
    }
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram__v0 = 0U;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t;
    __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur 
        = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur;
    __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur 
        = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur;
    __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog;
    Vsimu_top___024unit____Vdpiimwrap_v_difftest_TrapEvent_TOP____024unit(0U, 0U, 0U, 0ULL, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt);
    __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count;
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v1 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 = 0U;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state 
        = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
    __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state 
        = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state 
        = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state 
        = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v0 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 = 0U;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v19 = 0U;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom;
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count;
    __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 0U;
    if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__io_cpu_if_resp_valid) {
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag__v0 = 1U;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid__v0 = 1U;
        __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0 = 1U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__io_cpu_if_resp_valid) {
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag__v0 = 1U;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid__v0 = 1U;
        __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0 = 1U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__io_cpu_if_resp_valid) {
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag__v0 = 1U;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid__v0 = 1U;
        __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0 = 1U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__io_cpu_if_resp_valid) {
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag__v0 = 1U;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid__v0 = 1U;
        __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata;
        __VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0 = 1U;
    }
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count 
        = ((1U & ((~ (IData)(vlSelfRef.aresetn)) | 
                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count) 
                   >> 3U))) ? 0U : (0x0000000fU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count))));
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2;
    if ((1U & ((~ (IData)(vlSelfRef.aresetn)) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))) {
        __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) {
        __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur 
            = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur)));
    }
    if ((1U & ((~ (IData)(vlSelfRef.aresetn)) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)))) {
        __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) {
        __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur 
            = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur)));
    }
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read)
                                          ? 0U : ((
                                                   (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))
                                                   ? 1U
                                                   : 
                                                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier)))));
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read)
                                          ? 0U : ((
                                                   (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))
                                                   ? 1U
                                                   : 
                                                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd) 
                                                   & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
                                                      >> 3U)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r 
        = (1U & ((~ (IData)(vlSelfRef.aresetn)) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we)
                                                    ? 0U
                                                    : 
                                                   ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6) 
                                                       & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d))))));
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((
                                                   (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))
                                                   ? 1U
                                                   : 
                                                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd) 
                                                   & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
                                                      >> 2U)))));
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r 
        = (1U & ((~ (IData)(vlSelfRef.aresetn)) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we)
                                                    ? 0U
                                                    : 
                                                   ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5) 
                                                       & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d))))));
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd 
        = ((IData)(vlSelfRef.aresetn) & ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count) 
                                           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level)) 
                                          & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read))
                                          ? 0U : ((
                                                   (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))
                                                   ? 1U
                                                   : 
                                                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier)))));
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
        = ((1U & ((~ (IData)(vlSelfRef.aresetn)) | 
                  (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag))))
            ? 0U : (0x000fffffU & ((IData)(1U) + vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count)));
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
        = ((1U & ((~ (IData)(vlSelfRef.aresetn)) | 
                  (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag))))
            ? 0U : (0x000fffffU & ((IData)(1U) + vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count)));
    __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count 
        = ((1U & ((~ (IData)(vlSelfRef.aresetn)) | 
                  (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag))))
            ? 0U : (0x000fffffU & ((IData)(1U) + vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count)));
    if (vlSelfRef.aresetn) {
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count 
            = (0x000fffffU & ((IData)(1U) + vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count));
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = 0U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = 1U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b 
                = (0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                  >> 2U));
        } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable) 
                    & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b 
                = (0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b) 
                                  - (IData)(1U)));
        }
        if ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop)) 
             | (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value;
        } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable) 
                    & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t 
                = (0x000003ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t) 
                                  - (IData)(1U)));
        }
        if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
             & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid)))) {
            __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog = 1U;
        }
        if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins))) {
            __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr 
                = (3U & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr)));
        }
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr 
            = ((0xf0U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset)
                   ? 0U : (0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr) 
                                          | ((0x0000000bU 
                                              | (4U 
                                                 & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI)) 
                                                    << 2U))) 
                                             ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals))))));
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr 
            = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr)) 
               | ((((2U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                           << 1U)) | (1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                            >> 1U))) 
                   << 6U) | (((2U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                     >> 1U)) | (1U 
                                                & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                                   >> 3U))) 
                             << 4U)));
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8000U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8060U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8010U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8020U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8030U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8040U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8050U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7 
            = (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                & (0x8070U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata
                : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7);
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer 
            = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2) 
                & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3)))
                ? vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2
                : ((IData)(1U) + vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer));
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3 
            = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd 
            = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read) 
                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir))))
                ? 0U : (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                         & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))
                         ? 1U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd) 
                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
                                    >> 1U))));
    } else {
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = 1U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b = 0x9fU;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t = 0x027fU;
        __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog = 0U;
        __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3 
            = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) {
        __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 
            = (0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                              >> 3U));
        __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
        __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0 = 1U;
    }
    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant 
        = ((IData)(vlSelfRef.aresetn) & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu) 
                                             & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma)))) 
                                         & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma) 
                                             & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu))) 
                                            | ((~ (
                                                   ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu) 
                                                    & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma)) 
                                                   & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))) 
                                               & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu) 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma)) 
                                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r 
        = ((IData)(vlSelfRef.aresetn) & (((((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)) 
                                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop)) 
                                           & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we))) 
                                          | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset))
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r 
        = ((IData)(vlSelfRef.aresetn) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask)
                                          ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun) 
                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d))))));
    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) {
        __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
        __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top;
        __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0 = 1U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram
        [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom];
    if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize 
            = (7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                             >> 8U)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst 
            = (3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                             >> 0x0000000bU)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen 
            = (0x0000000fU & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                      >> 4U)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
            = (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                       >> 0x0000000dU));
    } else if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr_next;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize 
            = (7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                             >> 8U)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst 
            = (3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                             >> 0x0000000bU)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen 
            = (0x0000000fU & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                      >> 4U)));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
            = (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                       >> 0x0000000dU));
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid 
            = (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas));
    } else if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en))) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr_next;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
    __Vtableidx6 = ((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read) 
                        << 5U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd) 
                                   << 4U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read) 
                                             << 3U))) 
                      | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                          << 2U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd) 
                                     << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read)))) 
                     << 5U) | ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd) 
                                 << 4U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd) 
                                            << 3U) 
                                           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask) 
                                              << 2U))) 
                               | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd) 
                                   << 1U) | (1U & (~ (IData)(vlSelfRef.aresetn))))));
    vlSelfRef.simu_top__DOT__soc__DOT__uart0_int = 
        Vsimu_top__ConstPool__TABLE_h0409fe98_0[__Vtableidx6];
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad 
        = ((1U & (~ (IData)(vlSelfRef.aresetn))) || (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
    __Vtableidx9 = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data) 
                     << 1U) | (IData)(vlSelfRef.aresetn));
    vlSelfRef.num_a_g = Vsimu_top__ConstPool__TABLE_he44e85c3_0
        [__Vtableidx9];
    if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
         & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
            | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
    if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
         & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
            | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize 
            = (7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                             >> 8U)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst 
            = (3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                             >> 0x0000000bU)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen 
            = (0x0000000fU & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                      >> 4U)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid 
            = (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas));
    }
    if (vlSelfRef.aresetn) {
        if (((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid)) 
              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready))) {
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr 
                = (3U & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr)));
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins) 
             & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)))) {
            __VdlyVal__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 
                = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir;
            __VdlyDim0__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 
                = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr));
            __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0 = 1U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = 0U;
        } else if ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re) 
                     & (0U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                    & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = 1U;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (1U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier 
                    = (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai));
            }
        } else {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier;
        }
        __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state = 0U;
        __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state = 0U;
        __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state = 0U;
        __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state = 0U;
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = 0U;
            __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v0 = 1U;
        } else if ((2U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop)))) {
            if ((0x10U > (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count 
                    = (0x0000001fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)));
                __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 
                    = (7U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in));
                __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
                __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16 = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1;
            }
        } else if ((1U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop)))) {
            if ((0U < (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count 
                    = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count) 
                                      - (IData)(1U)));
                __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom;
                __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17 = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom 
                    = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom)));
            }
        } else if ((3U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom 
                = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom)));
            __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 
                = (7U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in));
            __VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
            __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18 = 1U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt 
                = (0x000000ffU & ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))
                                   ? ((IData)(0x16U) 
                                      + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value))
                                   : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value)));
        } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                    & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt 
                = (0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt) 
                                  - (IData)(1U)));
        }
        vlSelfRef.num_csn = ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                              ? ((0x00040000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                  ? ((0x00020000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                      ? 0xfeU : 0xfdU)
                                  : ((0x00020000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                      ? 0xfbU : 0xf7U))
                              : ((0x00040000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                  ? ((0x00020000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                      ? 0xefU : 0xdfU)
                                  : ((0x00020000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                      ? 0xbfU : 0x7fU)));
        if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data 
                = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata);
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid = 0U;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready))) {
            vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = 0U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid) {
            vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = 1U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg 
                = ((0x1fd0U == (0x00001fffU & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                               >> 0x10U)))
                    ? ((0xf030U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))
                        ? 0x01f78a40U : 0U) : ((0x00008000U 
                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                ? (
                                                   (0x00004000U 
                                                    & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                    ? 
                                                   ((0x00002000U 
                                                     & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                     ? 
                                                    ((0x00001000U 
                                                      & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                      ? 
                                                     ((0x00000800U 
                                                       & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                       ? 
                                                      ((0x00000400U 
                                                        & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                        ? 
                                                       ((0x00000200U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                         ? 
                                                        ((0x00000100U 
                                                          & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                          ? 
                                                         ((0x00000080U 
                                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                           ? 0U
                                                           : 
                                                          ((0x00000040U 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                            ? 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 0U
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 0U
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor)))))))
                                                            : 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace)))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__simu_flag)))))
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data)))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu))))))))
                                                          : 0U)
                                                         : 0U)
                                                        : 0U)
                                                       : 
                                                      ((0x00000400U 
                                                        & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                        ? 0U
                                                        : 
                                                       ((0x00000200U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                         ? 0U
                                                         : 
                                                        ((0x00000100U 
                                                          & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                          ? 0U
                                                          : 
                                                         ((0x00000080U 
                                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                           ? 
                                                          ((0x00000040U 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                            ? 0U
                                                            : 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 0U
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : 
                                                                 ((2U 
                                                                   & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                                                      << 1U)) 
                                                                  | (1U 
                                                                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)))))))))))
                                                           : 
                                                          ((0x00000040U 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                            ? 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r)))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : (IData)(vlSelfRef.__SYM__switch))))))
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data))))))
                                                            : 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data)))))
                                                             : 0U)))))))
                                                      : 
                                                     ((0x00000800U 
                                                       & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                       ? 0U
                                                       : 
                                                      ((0x00000400U 
                                                        & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                        ? 0U
                                                        : 
                                                       ((0x00000200U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                         ? 0U
                                                         : 
                                                        ((0x00000100U 
                                                          & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                          ? 0U
                                                          : 
                                                         ((0x00000080U 
                                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                           ? 0U
                                                           : 
                                                          ((0x00000040U 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                            ? 0U
                                                            : 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 0U
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 0U
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r2)))))))))))))
                                                     : 0U)
                                                    : 
                                                   ((0x00002000U 
                                                     & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                     ? 0U
                                                     : 
                                                    ((0x00001000U 
                                                      & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                      ? 0U
                                                      : 
                                                     ((0x00000800U 
                                                       & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                       ? 0U
                                                       : 
                                                      ((0x00000400U 
                                                        & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                        ? 0U
                                                        : 
                                                       ((0x00000200U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                         ? 0U
                                                         : 
                                                        ((0x00000100U 
                                                          & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                          ? 0U
                                                          : 
                                                         ((0x00000080U 
                                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                           ? 0U
                                                           : 
                                                          ((0x00000040U 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                            ? 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6)))))
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4))))))
                                                            : 
                                                           ((0x00000020U 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                             ? 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2)))))
                                                             : 
                                                            ((0x00000010U 
                                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                              ? 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1))))
                                                              : 
                                                             ((8U 
                                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                               ? 0U
                                                               : 
                                                              ((4U 
                                                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                ? 0U
                                                                : 
                                                               ((2U 
                                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                 ? 0U
                                                                 : 
                                                                ((1U 
                                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)
                                                                  ? 0U
                                                                  : vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0)))))))))))))))
                                                : 0U));
        } else if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid = 1U;
        } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid = 0U;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (4U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol 
                = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                         >> 6U));
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared 
                = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                         >> 7U));
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr 
                = (0x0000001fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai));
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready))) {
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel 
                = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel;
        }
        if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
             & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg 
                = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (2U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr 
                    = (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                             >> 6U));
            }
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset) 
             | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun = 0U;
        } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                    & (0x10U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun = 1U;
        }
        if (((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                 >> 2U) & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid))) 
               & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd))) 
              & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm))) 
             & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready = 1U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size = 0U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) {
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready = 0U;
            if ((1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                        >> 2U) & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready))))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id = 0U;
                if ((2U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr)) {
                    if ((1U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr)) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
                    }
                } else if ((1U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr)) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
                }
            } else if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu)) 
                        & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb)))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                    = (0x000000ffU & ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))
                                       ? vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32
                                       : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))
                                           ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                              >> 8U)
                                           : ((6U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))
                                               ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                                  >> 8U)
                                               : ((4U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))
                                                   ? 
                                                  (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                                   >> 0x10U)
                                                   : 
                                                  ((8U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))
                                                    ? 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                                    >> 0x18U)
                                                    : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32))))));
                if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))) {
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 0U;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr 
                    = (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                       >> 8U);
            } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans) 
                        & (0x0fU == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb)))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 1U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                    = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32);
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr 
                    = (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                       >> 8U);
            } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    if ((0U == (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb) 
                                      >> 1U)))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 1U;
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                        = (0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                          >> 8U));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
                        = (0x0eU & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                        = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32);
                }
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
            } else if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    if ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb) 
                                      >> 2U)))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 1U;
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                        = (0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                                          >> 0x10U));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
                        = (0x0dU & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
            } else if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 1U;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu 
                        = (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
                           >> 0x18U);
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
                        = (0x0bU & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
            } else if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 1U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
                        = (7U & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
            } else {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu = 0U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
                if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm))) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
                }
            }
        } else if (((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                        >> 2U) & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready))) 
                      & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid))) 
                     & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm))) 
                    & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready = 1U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size 
                = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                = (0x000fffffU & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr);
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb 
                = (0x0000000fU & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr);
            if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = 4U;
            } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = 2U;
            } else if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = 1U;
            }
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) {
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready = 0U;
            if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu 
                        = (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count));
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
                        = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count) 
                                 - (IData)(1U)));
                    vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast 
                        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size)) 
                           | (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count)));
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid 
                        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size)) 
                           | (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count)));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd 
                        = (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
            } else if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
                        = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count) 
                                 - (IData)(1U)));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                        = ((0xffffff00U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
            } else if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
                        = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count) 
                                 - (IData)(1U)));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                        = ((0xffff00ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao) 
                              << 8U));
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
            } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
                        = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count) 
                                 - (IData)(1U)));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
                        = (0x000fffffU & ((IData)(1U) 
                                          + vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                            = ((0xff00ffffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao) 
                                  << 0x00000010U));
                    } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                            = ((0xffffff00U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao));
                    }
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
            } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count))) {
                if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast = 1U;
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 1U;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 0U;
                    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                            = ((0x00ffffffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao) 
                                  << 0x00000018U));
                    } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                            = ((0xffff00ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao) 
                                  << 8U));
                    } else if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 
                            = ((0xffffff00U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32) 
                               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao));
                    }
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 1U;
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 1U;
                }
            } else {
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
                if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm))) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 0U;
                }
                if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))) {
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 0U;
                }
                __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 1U;
                if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                        >> 2U))) {
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 = 0U;
                    vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast = 0U;
                    __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 0U;
                }
            }
        } else {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
            if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))) {
                __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 0U;
            }
            if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                    >> 2U))) {
                __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast = 0U;
            }
        }
        if ((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc) 
                   | (~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc)))))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc 
                = (0x0000ffffU & ((vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                   - (IData)(1U)) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle)));
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next;
        } else {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc 
                = (0x0000ffffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc) 
                                  - (IData)(1U)));
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr = 0U;
        __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v1 = 1U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier = 0U;
        if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))) {
            if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))) {
                if (((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))) {
                    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state = 2U;
                }
            } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))) {
                __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state 
                    = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT___GEN_34;
            }
        }
        if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))) {
            if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))) {
                if (((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))) {
                    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state = 2U;
                }
            } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))) {
                __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state 
                    = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT___GEN_34;
            }
        }
        if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))) {
            if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))) {
                if (((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))) {
                    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state = 2U;
                }
            } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))) {
                __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state 
                    = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT___GEN_34;
            }
        }
        if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))) {
            if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))) {
                if (((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))) {
                    __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state = 2U;
                }
            } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))) {
                __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state 
                    = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT___GEN_34;
            }
        }
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = 0U;
        __VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v19 = 1U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt = 0U;
        vlSelfRef.num_csn = 0xffU;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr = 3U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun = 0U;
        __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready = 0U;
        __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
            = (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                       >> 0x0000000dU));
    } else if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren))) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr_next;
    }
    if ((1U & (~ (IData)(vlSelfRef.aresetn)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i = 2U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i = 2U;
        __VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram__v0 = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay 
            = (0x00ffU == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random));
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay 
            = (0xffU == (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random));
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__simu_flag = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag[0U] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid[0U] = 1U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag[0U] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid[0U] = 1U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag[0U] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid[0U] = 1U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag[0U] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid[0U] = 1U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data[0U] 
            = __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data__v0;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data[0U] 
            = __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data__v0;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data[0U] 
            = __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data__v0;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data[0U] 
            = __VdlyVal__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data__v0;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid 
        = (1U & (~ (IData)(vlSelfRef.aresetn)));
    if (__VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1U] = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t;
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur 
        = __Vdly__simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur 
        = __Vdly__simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr 
        = __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr;
    if (__VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[__VdlyDim0__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0] 
            = __VdlyVal__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v0;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram__v1) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1U] = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state 
        = __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state 
        = __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state 
        = __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state 
        = __Vdly__simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top;
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0aU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0bU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0cU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0dU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0eU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0fU] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[__VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16] 
            = __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v16;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[__VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v17] = 0U;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[__VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18] 
            = __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v18;
    }
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo__v19) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9U] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0aU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0bU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0cU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0dU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0eU] = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0x0fU] = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r;
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[__VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0] 
            = __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram__v0;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog 
        = __Vdly__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
    vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid 
        = __Vdly__simu_top__DOT__soc__DOT__apb_s_rvalid;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
    vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid 
        = __Vdly__simu_top__DOT__soc__DOT__apb_s_bvalid;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr7;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr6;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr5;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr4;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr3;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr2;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr1;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__cr0;
    if (vlSelfRef.aresetn) {
        if ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
              & (1U < (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg))) 
             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg))) {
            if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count) 
                 == (0x0000007fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg) 
                                    >> 1U)))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count)));
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = 1U;
            } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count) 
                        == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = 0U;
            } else {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count)));
            }
        } else {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = 0U;
        }
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count 
            = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int;
    } else {
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count 
            = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d 
        = (1U & ((~ (IData)(vlSelfRef.aresetn)) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d 
        = (1U & ((~ (IData)(vlSelfRef.aresetn)) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
    __Vtableidx7 = ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd) 
                      << 5U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd) 
                                 << 4U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd) 
                                           << 3U))) 
                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd) 
                        << 2U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd) 
                                   << 1U) | (1U & (~ (IData)(vlSelfRef.aresetn))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir 
        = Vsimu_top__ConstPool__TABLE_h34e97a3e_0[__Vtableidx7];
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))];
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1 
        = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d 
        = ((IData)(vlSelfRef.aresetn) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
    vlSelfRef.ram_wdata = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid;
    vlSelfRef.ram_waddr = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr_next 
        = (((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
            & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
           | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
               & ((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))) 
              | ((- (IData)((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                 & ((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                    | ((0x0000003cU & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))))));
    vlSelfRef.ram_raddr = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr_next 
        = (((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
            & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
           | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
               & ((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))) 
              | ((- (IData)((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                 & ((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                    | ((0x0000003cU & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))))));
    vlSelfRef.confreg_uart_data = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))];
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0 
        = (1U & ((~ (IData)(vlSelfRef.aresetn)) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)
                                                    ? 
                                                   ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en)) 
                                                    | (IData)(vlSelfRef.uart_tx))
                                                    : (IData)(vlSelfRef.uart_rx))));
    vlSelfRef.__Vtableidx4 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level 
        = Vsimu_top__ConstPool__TABLE_h19403ecc_0[vlSelfRef.__Vtableidx4];
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data;
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data;
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas 
            = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid 
            = (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast 
        = ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast) 
             << 4U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast) 
                        << 3U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                  << 2U))) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast) 
                                               << 1U) 
                                              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2U] 
        = ((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
            ? vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32
            : ((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 8U)
                : ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                    ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000010U)
                    : ((3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                        ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000018U)
                        : 0U))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid) 
            << 3U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                       << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc 
        = ((IData)(vlSelfRef.aresetn) && (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
                                           & (0U == 
                                              (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                                          && (1U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                               >> 7U))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r2 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r1;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt 
        = ((IData)(vlSelfRef.aresetn) ? 0ULL : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1 
        = (1ULL + vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt 
        = ((IData)(vlSelfRef.aresetn) ? 0ULL : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1 
        = (1ULL + vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt);
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 2U) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                      | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                         | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                            | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2 
        = (1U & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                 [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom] 
                 >> 1U));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3 
        = (1U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
           [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom]);
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4 
        = (1U & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                 [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom] 
                 >> 2U));
    if (vlSelfRef.aresetn) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals 
            = (0x0000000bU | (4U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI)) 
                                    << 2U)));
        if ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count)) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag = 0U;
        } else if ((1U & (((~ (IData)(vlSelfRef.btn_step)) 
                           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                          | ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                             & (IData)(vlSelfRef.btn_step))))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag = 1U;
        }
        if ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count)) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag = 0U;
        } else if ((1U & (((~ ((IData)(vlSelfRef.btn_step) 
                               >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                          | ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                             & ((IData)(vlSelfRef.btn_step) 
                                >> 1U))))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag = 1U;
        }
        if ((IData)(((vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                      >> 0x00000013U) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count) 
                                         >> 3U)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag = 0U;
        } else if ((((~ (0x0000000fU == (IData)(vlSelfRef.btn_key_row))) 
                     & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))) 
                    | ((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                       & (0x0000000fU == (IData)(vlSelfRef.btn_key_row))))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag = 1U;
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__key_count;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 1U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd;
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid)
            ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid)
                     ? 1U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid)
                              ? 2U : 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0) 
              << 1U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0) 
              << 2U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0) 
              << 3U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0) 
              << 4U));
    if (vlSelfRef.aresetn) {
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = 0U;
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = 0U;
        } else if ((2U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop)))) {
            if ((0x10U > (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count 
                    = (0x0000001fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count)));
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1;
            }
        } else if ((1U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop)))) {
            if ((0U < (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom 
                    = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom)));
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count 
                    = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count) 
                                      - (IData)(1U)));
            }
        } else if ((3U == (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we) 
                            << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop)))) {
            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom 
                = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom)));
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid = 0U;
        }
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random_next;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data 
            = (0x0000000fU & ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                               ? ((0x00040000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                   ? ((0x00020000U 
                                       & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                       ? vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data
                                       : (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                          >> 4U)) : 
                                  ((0x00020000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                    ? (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                       >> 8U) : (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                                 >> 0x0cU)))
                               : ((0x00040000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                   ? ((0x00020000U 
                                       & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                       ? (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                          >> 0x10U)
                                       : (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                          >> 0x14U))
                                   : ((0x00020000U 
                                       & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count)
                                       ? (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                          >> 0x18U)
                                       : (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                                          >> 0x1cU)))));
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count 
            = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count;
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable) {
            if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0U;
                } else if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0U;
                    } else if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) 
                                | (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b)))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in 
                            = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))
                                ? 4U : (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                         << 3U) | (
                                                   ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error) 
                                                    << 1U) 
                                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error))));
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = 1U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0U;
                    } else if ((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error)))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in 
                            = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                << 3U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error) 
                                           << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error)));
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = 1U;
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0x0eU;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 1U;
                    }
                } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 4U;
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0x0eU;
                    } else {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                    }
                } else {
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor 
                        = (1U & (VL_REDXOR_8(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                 ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity)));
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 5U;
                }
            } else if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter))) {
                            if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 3U;
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 4U;
                                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error = 0U;
                            }
                        } else {
                            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter 
                                = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter) 
                                         - (IData)(1U)));
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 2U;
                        }
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0x0eU;
                    } else {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter 
                            = ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                ? ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                    ? 7U : 6U) : ((1U 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                   ? 5U
                                                   : 4U));
                        if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 2U;
                            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0x0eU;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = 0U;
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 6U;
                        }
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                    }
                } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error 
                        = (1U & ((0x00000010U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                  ? ((0x00000020U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                      ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity)
                                      : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor))
                                  : ((0x00000020U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                      ? (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity))
                                      : (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor)))));
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 9U;
                } else {
                    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error 
                            = (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i)));
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0x0aU;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                }
            } else if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity 
                            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 8U;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                } else {
                    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7) {
                        if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                            if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift 
                                    = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) 
                                        << 7U) | (0x0000007fU 
                                                  & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                                     >> 1U)));
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift 
                                    = ((0x80U & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift)) 
                                       | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) 
                                           << 6U) | 
                                          (0x0000003fU 
                                           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                              >> 1U))));
                            }
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift 
                                = ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                    ? ((0xc0U & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift)) 
                                       | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) 
                                           << 5U) | 
                                          (0x0000001fU 
                                           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                              >> 1U))))
                                    : ((0xe0U & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift)) 
                                       | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i) 
                                           << 4U) | 
                                          (0x0000000fU 
                                           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift) 
                                              >> 1U)))));
                        }
                    }
                    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 7U;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
                }
            } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate 
                    = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7)
                        ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i)
                            ? 0U : 6U) : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate));
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1;
            } else {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0x0eU;
                if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i)) 
                     & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b)))) {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 1U;
                }
            }
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
            = vlSelfRef.random_seed;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count 
            = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__count;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift;
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 0U;
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [0U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [0U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast));
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast = 0U;
    }
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [1U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [1U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 1U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid = 0U;
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid));
    }
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 1U));
    }
    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [2U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [2U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 2U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 2U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata = 0U;
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [0U];
    }
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [1U];
    }
    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
    }
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 3U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 3U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
    }
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r;
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize 
            = (7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                             >> 8U)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst 
            = (3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                             >> 0x0000000bU)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen 
            = (0x0000000fU & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                      >> 4U)));
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid 
            = (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas));
    }
    if (vlSelfRef.aresetn) {
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid 
                = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid;
        }
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt;
        if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data 
                = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata);
        }
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r = 0U;
        } else if ((((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state)) 
                     & (7U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))) 
                    & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count) 
                       >> 3U))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r 
                = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp;
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xff00U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu 
                = ((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata 
                    << 0x00000010U) | (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata 
                                       >> 0x10U));
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xff40U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor 
                = (1U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata);
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xff30U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace 
                = (0U != vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata);
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xf040U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata;
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xf030U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata;
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xf020U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (7U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((0x00000080U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
            }
        }
        if ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count)) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r 
                = (1U & (IData)(vlSelfRef.btn_step));
        }
        if ((0x00080000U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count)) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r 
                = (1U & ((IData)(vlSelfRef.btn_step) 
                         >> 1U));
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset) 
             | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun = 0U;
        } else if ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we) 
                     & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop))) 
                    & (0x10U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun = 1U;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (2U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset 
                    = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                             >> 2U));
            }
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset = 0U;
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
             & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                       >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode))))) {
            if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0U;
                    } else {
                        if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                            if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time 
                                    = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
                                             + (1U 
                                                & (~ (IData)(vlSelfRef.uart_tx)))));
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error 
                                    = (1U & (~ (IData)(vlSelfRef.uart_tx)));
                                if ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))) {
                                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = 1U;
                                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 4U;
                                } else {
                                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = 0U;
                                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0U;
                                }
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                                    = (0x0000001fU 
                                       & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter) 
                                          - (IData)(1U)));
                            }
                        } else {
                            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = 1U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                                = ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))
                                    ? 0x0fU : 0x0dU);
                        }
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 1U;
                    }
                } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                    if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                         & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
                            != (7U & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg)))))) {
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 0U;
                        if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                            if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 7U;
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                    = (1U & VL_REDXOR_8(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak));
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 6U;
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                    = (1U & VL_REDXOR_32(
                                                         (0x0000007fU 
                                                          & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak))));
                            }
                        } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 5U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                = (1U & VL_REDXOR_32(
                                                     (0x0000003fU 
                                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak))));
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 4U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                = (1U & VL_REDXOR_32(
                                                     (0x0000001fU 
                                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak))));
                        }
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out 
                            = (0x0000007fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak) 
                                              >> 1U));
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
                            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak));
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = 0U;
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 1U;
                        if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                            if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 7U;
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                    = (1U & VL_REDXOR_8(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out));
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 6U;
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                    = (1U & VL_REDXOR_32(
                                                         (0x0000007fU 
                                                          & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out))));
                            }
                        } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 5U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                = (1U & VL_REDXOR_32(
                                                     (0x0000003fU 
                                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out))));
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 4U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
                                = (1U & VL_REDXOR_32(
                                                     (0x0000001fU 
                                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out))));
                        }
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out 
                            = (0x0000007fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out) 
                                              >> 1U));
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
                            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out));
                        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak 
                            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out;
                    }
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 1U;
                } else {
                    if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                        if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
                            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = 0U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0U;
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                                = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter) 
                                                  - (IData)(1U)));
                        }
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                            = ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))
                                ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)
                                    ? 0x1dU : 0x0dU)
                                : ((0U == (4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr)))
                                    ? 0x0dU : ((4U 
                                                == 
                                                (7U 
                                                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr)))
                                                ? 0x15U
                                                : 0x1dU)));
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 1U;
                }
            } else if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                    if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                        if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate 
                                = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)
                                    ? 6U : 4U);
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                                = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter) 
                                                  - (IData)(1U)));
                        }
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0x0fU;
                    }
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out;
                } else {
                    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp 
                        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out;
                    if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                        if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
                            if ((0U < (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter 
                                    = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter) 
                                             - (IData)(1U)));
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out 
                                    = ((0x40U & (IData)(__Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out)) 
                                       | (0x0000003fU 
                                          & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out) 
                                             >> 1U)));
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
                                    = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out));
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 2U;
                            } else if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
                                    = ((0x00000010U 
                                        & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                        ? ((1U & (~ 
                                                  ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                                   >> 5U))) 
                                           && (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor))
                                        : ((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                                  >> 5U)) 
                                           || (1U & 
                                               (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor)))));
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 3U;
                            } else {
                                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 4U;
                            }
                        } else {
                            __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                                = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter) 
                                                  - (IData)(1U)));
                        }
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0x0fU;
                    }
                }
            } else if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 0U;
                if ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter))) {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 2U;
                    } else {
                        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
                            = (0x0000001fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter) 
                                              - (IData)(1U)));
                    }
                } else {
                    __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0x0fU;
                }
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 0U;
            } else if ((1U & ((~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count))) 
                              & ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
                                   == (7U & ((IData)(1U) 
                                             + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg)))) 
                                  | (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error))) 
                                 | (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))))) {
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = 0U;
            } else {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 0U;
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 1U;
                __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 5U;
            }
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 0U;
        }
        if (((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
             & (0xf050U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata;
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = 1U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = 0U;
        __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr = 0U;
    } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
            = (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                       >> 0x0000000dU));
    } else if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr_next;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb = 0U;
    }
    if (vlSelfRef.aresetn) {
        if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid = 0U;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid = 1U;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop) {
            vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid = 0U;
        }
        if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count))) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state 
                = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state;
        }
        if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r 
                = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata;
        } else if (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2) {
            vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin = 0U;
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin = 0U;
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast = 0U;
    }
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))) {
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 2U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__miss_addr;
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        }
    } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))) {
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 2U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__miss_addr;
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        }
    } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))) {
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))) {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 2U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 1U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__miss_addr;
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
            vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
        }
    } else if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
    } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 2U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 1U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
            = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__miss_addr;
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = 0U;
    }
    if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 4U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 4U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata 
        = ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1 
        = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)));
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready 
        = ((8U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready) 
                              << 2U) | (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready 
        = ((8U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready) 
                              << 2U) | (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random_next 
        = ((0x007ffffeU & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                           << 1U)) | (1U & VL_REDXOR_32(
                                                        (0x00420000U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random))));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable))));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7 
        = (7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0 
        = (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1 
        = (0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                          - (IData)(1U)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid) 
            << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata 
        = ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata 
        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
            ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r1 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer;
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr_next 
        = (((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
           | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
               & ((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))) 
              | ((- (IData)((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                 & ((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                    | ((0x0000003cU & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))))));
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
            = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data;
    }
    vlSelfRef.num_monitor = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor;
    vlSelfRef.open_trace = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace;
    vlSelfRef.led_rg1 = (3U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data);
    vlSelfRef.led_rg0 = (3U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data);
    vlSelfRef.led = (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data);
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step0_count;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__step1_count;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3 
        = ((0x1fafU == (0x00001fffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                       >> 0x00000010U))) 
           | (0x1fd0U == (0x00001fffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                         >> 0x00000010U))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time;
    vlSelfRef.simu_top__DOT__soc__DOT__m0_awready = 0U;
    if ((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_awready 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid 
        = (((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
             ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)))
             : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                 ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid)
                 : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid)
                     : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid)))) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready 
        = (((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
             ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))))
             : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                 ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                    & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                       & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))))
                 : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                     ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                        & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))))
                     : ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                        & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))))))) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2));
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel;
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0;
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout 
        = ((1U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
            ? 0U : ((2U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                     ? 1U : ((4U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                              ? 2U : ((3U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                       ? ((0U != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                           ? 0U : 1U)
                                       : ((6U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                           ? ((1U != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                               ? 1U
                                               : 2U)
                                           : ((5U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                               ? ((2U 
                                                   != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                   ? 2U
                                                   : 0U)
                                               : ((7U 
                                                   == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                    ? 1U
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                     ? 2U
                                                     : 0U))
                                                   : 7U)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0 
        = vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
            << 3U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__timer;
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data 
        = (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr)) 
            << 0x0000000dU) | (QData)((IData)((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst) 
                                                << 0x0000000bU) 
                                               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize) 
                                                  << 8U)))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__state_count;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
            << 3U) | (((0x1fe0U == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                    >> 0x00000010U)) 
                       << 2U) | (1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
                                          | (0x1fe0U 
                                             == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                                 >> 0x00000010U)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7 
        = ((0U != (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                   [0U] | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                           [1U] | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                   [2U] | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                           [3U] | (
                                                   vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                   [4U] 
                                                   | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                      [5U] 
                                                      | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                         [6U] 
                                                         | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                            [7U] 
                                                            | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                               [8U] 
                                                               | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                  [9U] 
                                                                  | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                     [0x0aU] 
                                                                     | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                        [0x0bU] 
                                                                        | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                           [0x0cU] 
                                                                           | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                              [0x0dU] 
                                                                              | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0x0eU] 
                                                                                | vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                                                [0x0fU])))))))))))))))) 
           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count) 
              >= (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t)) 
              & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3 
        = ((~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt))) 
           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram
        [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom];
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid 
        = ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid 
        = ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid 
        = ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 1U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 2U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 3U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 
            = vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready;
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1) 
                  << 4U));
    }
    vlSelfRef.num_data = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data;
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
    if (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas = 0ULL;
    }
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel;
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid 
        = (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                 >> 3U));
    vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout 
        = ((1U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
            ? 3U : ((2U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                     ? 4U : ((4U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                              ? 5U : ((3U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                       ? ((3U != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                           ? 3U : 4U)
                                       : ((6U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                           ? ((4U != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                               ? 4U
                                               : 5U)
                                           : ((5U == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                               ? ((5U 
                                                   != (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                   ? 5U
                                                   : 3U)
                                               : ((7U 
                                                   == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                                   ? 
                                                  ((3U 
                                                    == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                    ? 4U
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                     ? 5U
                                                     : 3U))
                                                   : 7U)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1 
        = vlSelfRef.__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
    vlSelfRef.btn_key_col = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))
                              ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))
                                       ? 0x0eU : ((2U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                   ? 0x0dU
                                                   : 
                                                  ((3U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                    ? 0x0bU
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                     ? 7U
                                                     : 0U)))));
    vlSelfRef.__Vtableidx12 = ((((((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                   << 3U) | ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                             << 2U)) 
                                 | (((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                     << 1U) | (7U == (IData)(vlSelfRef.btn_key_row)))) 
                                << 4U) | ((((0x0bU 
                                             == (IData)(vlSelfRef.btn_key_row)) 
                                            << 3U) 
                                           | ((0x0dU 
                                               == (IData)(vlSelfRef.btn_key_row)) 
                                              << 2U)) 
                                          | (((0x0eU 
                                               == (IData)(vlSelfRef.btn_key_row)) 
                                              << 1U) 
                                             | (1U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp 
        = Vsimu_top__ConstPool__TABLE_h2f5425a8_0[vlSelfRef.__Vtableidx12];
    vlSelfRef.__Vtableidx11 = ((((((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                   << 4U) | (((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                              << 3U) 
                                             | ((3U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                << 2U))) 
                                 | (((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                     << 1U) | (0x0000000fU 
                                               == (IData)(vlSelfRef.btn_key_row)))) 
                                << 4U) | ((((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                            << 3U) 
                                           | (4U & 
                                              (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                               >> 0x00000011U))) 
                                          | ((2U & 
                                              ((~ (0x0000000fU 
                                                   == (IData)(vlSelfRef.btn_key_row))) 
                                               << 1U)) 
                                             | (0U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state 
        = Vsimu_top__ConstPool__TABLE_hb25a9de7_0[vlSelfRef.__Vtableidx11];
    vlSelfRef.__Vtableidx2 = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir 
        = Vsimu_top__ConstPool__TABLE_h43fcfe92_0[vlSelfRef.__Vtableidx2];
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int 
        = Vsimu_top__ConstPool__TABLE_hfff90dde_0[vlSelfRef.__Vtableidx2];
    vlSelfRef.simu_top__DOT__soc__DOT__m0_arready = 0U;
    if ((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_arready 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready));
    }
    if ((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 1U)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 1U));
    }
    if ((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 2U)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 2U));
    }
    if ((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 3U)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 3U));
    }
    if (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
         & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
            >> 4U))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 4U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 1U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 2U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 3U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 3U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 4U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0) 
              << 4U));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3) 
           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom;
    if (__VdlySet__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[__VdlyDim0__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0] 
            = __VdlyVal__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram__v0;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__io_cpu_if_resp_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
           & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
              & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT___GEN_34 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid)) 
                 | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel 
        = (((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
            & (7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
            ? 7U : (((7U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
                     & (7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)
                     : (((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
                         & (7U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
                         ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)
                         : ((2U < (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel))
                             ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)
                             : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid)) 
                 | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready) 
              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu 
        = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) 
                 | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
                       >> 2U))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)));
    if (vlSelfRef.aresetn) {
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (2U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset 
                    = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                             >> 1U));
            }
        } else {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset = 0U;
        }
        if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
                      & (7U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))))) {
            if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg 
                    = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                             >> 4U));
            }
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg 
                = (7U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                         >> 5U));
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg = 4U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg = 0U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
           == (7U & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg))));
    if (vlSelfRef.aresetn) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable 
            = ((0U != vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl) 
               & (~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc))));
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (7U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                          >> 7U)))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg 
                    = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
            }
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (1U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((0x00000080U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                    = ((0x00ff00ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl) 
                       | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                          << 8U));
            }
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (2U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((0x00000080U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                    = ((0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl) 
                       | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai) 
                          << 0x00000010U));
            }
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (0U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            if ((0x00000080U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))) {
                vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                    = ((0x00ffff00U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl) 
                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai));
            }
        }
        if (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
             & (3U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))) {
            vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr 
                = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
        }
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
            = (0x00ff00ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
            = (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
            = (0x00ffff00U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr = 3U;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelfRef.ram_ren = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr_next 
        = (((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
           | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
               & ((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))) 
              | ((- (IData)((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                 & ((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                    | ((0x0000003cU & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))))));
    if (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push) {
        vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas = 0ULL;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb) 
           & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0) 
              << 1U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0) 
              << 2U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0) 
              << 3U));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0) 
              << 4U));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready) 
            << 3U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready) 
                       << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready)));
    vlSelfRef.ram_wen = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb) 
                         & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 
        = __Vdly__simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc 
        = __Vdly__simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc;
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
            >> 3U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
           & (0xe000U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
           & (0xff10U == (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 0U;
    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [0U];
    }
    if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [1U];
    }
    vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp = 0U;
    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [0U];
    }
    if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [1U];
    }
    if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [2U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [2U];
    }
    vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid = 0U;
    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid));
    }
    if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 1U));
    }
    if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 2U));
    }
    if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 3U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = (0x1eU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = (0x1dU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = (0x1bU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = (0x17U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((0x00000010U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 4U));
        vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = (0x0fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__m0_wready = 0U;
    if ((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_wready 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready));
    }
    if ((2U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 1U));
    }
    if ((4U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 2U));
    }
    if ((8U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 3U));
    }
    if ((0x00000010U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 4U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0 
        = ((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
           | (1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode 
        = ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
           | (3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    vlSelfRef.write_uart_valid = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
               >> 2U)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
            >> 3U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelfRef.__Vtableidx3 = ((((((((8U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                    & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                       & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                          >> 2U))) 
                                   | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                       >> 2U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid))) 
                                  << 4U) | (((2U & 
                                              ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                               << 1U)) 
                                             | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd)) 
                                            << 2U)) 
                                | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                                    << 1U) | (1U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                               >> 2U)))) 
                               << 5U) | ((0x00000010U 
                                          & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                             << 2U)) 
                                         | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt 
        = Vsimu_top__ConstPool__TABLE_hbbc23a9e_0[vlSelfRef.__Vtableidx3];
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable))));
    vlSelfRef.uart_rx = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                         & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                            ^ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                               >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 3U) & ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))
                       ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0) 
                          & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                             & (2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))))
                       : (0U != (0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5 
        = (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)) 
            | ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
               & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0))))) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
              & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                 >> 2U)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next 
        = (0x000001ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                          + (0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                            >> 0x00000010U))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle 
        = (1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                  ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                 >> 8U));
    vlSelfRef.__Vtableidx5 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value 
        = Vsimu_top__ConstPool__TABLE_h65cd9ac3_0[vlSelfRef.__Vtableidx5];
    vlSelfRef.__Vtableidx8 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value 
        = Vsimu_top__ConstPool__TABLE_h53d02be3_0[vlSelfRef.__Vtableidx8];
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out 
        = ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
               >> 6U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
    if ((0x00000010U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))) {
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0 = 
            ((0x0000000cU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                             << 2U)) | ((2U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                               >> 1U)) 
                                        | (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                                 >> 3U))));
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
    } else {
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0 = 
            ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI) 
             << 1U);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol)
                      ? (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad))
                      : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad)));
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma;
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0x000000ffU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu));
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
           & (0U != (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                    >> 0x0000000eU))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_2 
        = ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
               >> 7U)) & (0U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao 
        = ((0U == (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                  >> 0x0000000eU)))
            ? (0x000000ffU & ((4U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                               ? ((2U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                   ? ((1U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                       ? ((0x00000080U 
                                           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                           ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg)
                                           : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))
                                       : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr))
                                   : ((1U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                       ? ((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
                                              << 3U) 
                                             | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r) 
                                                << 2U)) 
                                            | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
                                                << 1U) 
                                               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r))) 
                                           << 4U) | 
                                          ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                                             << 3U) 
                                            | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                                               << 2U)) 
                                           | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                                               << 1U) 
                                              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r))))
                                       : 0U)) : ((2U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                  ? 
                                                 ((1U 
                                                   & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr)
                                                   : 
                                                  ((0x00000080U 
                                                    & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                    ? 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                                    >> 0x00000010U)
                                                    : 
                                                   (0x000000c0U 
                                                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir))))
                                                  : 
                                                 ((1U 
                                                   & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                   ? 
                                                  ((0x00000080U 
                                                    & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                    ? 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                                    >> 8U)
                                                    : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier))
                                                   : 
                                                  ((0x00000080U 
                                                    & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl
                                                    : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out))))))
            : 0U);
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
            ? 0U : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab) 
           & (0U == (0x000fc000U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack 
        = ((0U == (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                  >> 0x0000000eU)))
            ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
            : (0U != (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                     >> 0x0000000eU))));
    vlSelfRef.uart_tx = (1U & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                   & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                      | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))) 
                               & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                         | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))) 
                                  & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                         & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                            | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))) 
                                     & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                         >> 4U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared) 
                                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))))));
    vlSelfRef.uart_ctr_bus[0U] = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack;
    vlSelfRef.uart_ctr_bus[1U] = (IData)((((QData)((IData)(
                                                           (0x0000000fU 
                                                            & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                                           << 0x00000020U) 
                                          | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw))));
    vlSelfRef.uart_ctr_bus[2U] = (IData)(((((QData)((IData)(
                                                            (0x0000000fU 
                                                             & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                                            << 0x00000020U) 
                                           | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw))) 
                                          >> 0x00000020U));
    vlSelfRef.uart_ctr_bus[3U] = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgRegularize_h74633bcc_0_0 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack) 
            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel)) 
           & (0U == (0x000fc000U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgRegularize_h74633bcc_0_0) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgRegularize_h74633bcc_0_0));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_2));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_2));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re) 
           & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (2U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re) 
           & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (6U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re) 
           & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (5U == (7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
}

void Vsimu_top___024root___nba_sequent__TOP__1(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__1\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __Vdly__NAND_top__DOT__nand_command;
    __Vdly__NAND_top__DOT__nand_command = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__now_up_half;
    __Vdly__NAND_top__DOT__now_up_half = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__now_oob;
    __Vdly__NAND_top__DOT__now_oob = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__NAND_CE_;
    __Vdly__NAND_top__DOT__NAND_CE_ = 0;
    CData/*7:0*/ __Vdly__NAND_top__DOT__COMMAND;
    __Vdly__NAND_top__DOT__COMMAND = 0;
    SData/*13:0*/ __Vdly__NAND_top__DOT__data_count;
    __Vdly__NAND_top__DOT__data_count = 0;
    QData/*37:0*/ __Vdly__NAND_top__DOT__NAND_ADDR;
    __Vdly__NAND_top__DOT__NAND_ADDR = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__NAND_DONE;
    __Vdly__NAND_top__DOT__NAND_DONE = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__NAND_GO;
    __Vdly__NAND_top__DOT__NAND_GO = 0;
    CData/*7:0*/ __Vdly__NAND_top__DOT__status;
    __Vdly__NAND_top__DOT__status = 0;
    CData/*7:0*/ __Vdly__NAND_top__DOT__WAIT_NUM;
    __Vdly__NAND_top__DOT__WAIT_NUM = 0;
    CData/*7:0*/ __Vdly__NAND_top__DOT__HOLD_NUM;
    __Vdly__NAND_top__DOT__HOLD_NUM = 0;
    CData/*4:0*/ __Vdly__NAND_top__DOT__PRE_STATE;
    __Vdly__NAND_top__DOT__PRE_STATE = 0;
    CData/*1:0*/ __Vdly__NAND_top__DOT__ADDR_pointer;
    __Vdly__NAND_top__DOT__ADDR_pointer = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__NAND_DMA_REQ;
    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__ERASE_SERIAL;
    __Vdly__NAND_top__DOT__ERASE_SERIAL = 0;
    IData/*31:0*/ __Vdly__NAND_top__DOT__NAND_OP_NUM;
    __Vdly__NAND_top__DOT__NAND_OP_NUM = 0;
    CData/*2:0*/ __Vdly__NAND_top__DOT__NAND_ADDR_COUNT;
    __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = 0;
    SData/*13:0*/ __Vdly__NAND_top__DOT__READ_MAX_COUNT;
    __Vdly__NAND_top__DOT__READ_MAX_COUNT = 0;
    SData/*13:0*/ __Vdly__NAND_top__DOT__WRITE_MAX_COUNT;
    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT = 0;
    CData/*0:0*/ __Vdly__NAND_top__DOT__DMA_OP_DONE;
    __Vdly__NAND_top__DOT__DMA_OP_DONE = 0;
    IData/*31:0*/ __Vdly__NAND_top__DOT__NAND_DAT_I_WR;
    __Vdly__NAND_top__DOT__NAND_DAT_I_WR = 0;
    CData/*2:0*/ __Vdly__NAND_top__DOT__READ_ID_NUM;
    __Vdly__NAND_top__DOT__READ_ID_NUM = 0;
    CData/*4:0*/ __Vdly__NAND_top__DOT__NAND_STATE;
    __Vdly__NAND_top__DOT__NAND_STATE = 0;
    // Body
    __Vdly__NAND_top__DOT__nand_command = vlSelfRef.NAND_top__DOT__nand_command;
    __Vdly__NAND_top__DOT__now_up_half = vlSelfRef.NAND_top__DOT__now_up_half;
    __Vdly__NAND_top__DOT__now_oob = vlSelfRef.NAND_top__DOT__now_oob;
    __Vdly__NAND_top__DOT__COMMAND = vlSelfRef.NAND_top__DOT__COMMAND;
    __Vdly__NAND_top__DOT__data_count = vlSelfRef.NAND_top__DOT__data_count;
    __Vdly__NAND_top__DOT__NAND_ADDR = vlSelfRef.NAND_top__DOT__NAND_ADDR;
    __Vdly__NAND_top__DOT__NAND_DONE = vlSelfRef.NAND_top__DOT__NAND_DONE;
    __Vdly__NAND_top__DOT__NAND_GO = vlSelfRef.NAND_top__DOT__NAND_GO;
    __Vdly__NAND_top__DOT__WAIT_NUM = vlSelfRef.NAND_top__DOT__WAIT_NUM;
    __Vdly__NAND_top__DOT__HOLD_NUM = vlSelfRef.NAND_top__DOT__HOLD_NUM;
    __Vdly__NAND_top__DOT__PRE_STATE = vlSelfRef.NAND_top__DOT__PRE_STATE;
    __Vdly__NAND_top__DOT__ADDR_pointer = vlSelfRef.NAND_top__DOT__ADDR_pointer;
    __Vdly__NAND_top__DOT__ERASE_SERIAL = vlSelfRef.NAND_top__DOT__ERASE_SERIAL;
    __Vdly__NAND_top__DOT__NAND_OP_NUM = vlSelfRef.NAND_top__DOT__NAND_OP_NUM;
    __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT;
    __Vdly__NAND_top__DOT__READ_MAX_COUNT = vlSelfRef.NAND_top__DOT__READ_MAX_COUNT;
    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT = vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT;
    __Vdly__NAND_top__DOT__DMA_OP_DONE = vlSelfRef.NAND_top__DOT__DMA_OP_DONE;
    __Vdly__NAND_top__DOT__NAND_DAT_I_WR = vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR;
    __Vdly__NAND_top__DOT__READ_ID_NUM = vlSelfRef.NAND_top__DOT__READ_ID_NUM;
    __Vdly__NAND_top__DOT__NAND_STATE = vlSelfRef.NAND_top__DOT__NAND_STATE;
    __Vdly__NAND_top__DOT__NAND_DMA_REQ = vlSelfRef.NAND_top__DOT__NAND_DMA_REQ;
    __Vdly__NAND_top__DOT__status = vlSelfRef.NAND_top__DOT__status;
    __Vdly__NAND_top__DOT__NAND_CE_ = vlSelfRef.NAND_top__DOT__NAND_CE_;
    if ((1U & ((~ (IData)(vlSelfRef.prst_)) | (~ (IData)(vlSelfRef.NAND_top__DOT__NANDtag))))) {
        vlSelfRef.NAND_top__DOT__NAND_ACK = 0U;
        __Vdly__NAND_top__DOT__now_up_half = 0U;
        __Vdly__NAND_top__DOT__now_oob = 0U;
        vlSelfRef.NAND_CLE = 0U;
        vlSelfRef.NAND_ALE = 0U;
        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
        vlSelfRef.NAND_WR_ = 1U;
        vlSelfRef.NAND_RD_ = 1U;
        vlSelfRef.NAND_O = 0U;
        __Vdly__NAND_top__DOT__COMMAND = 0x55U;
        __Vdly__NAND_top__DOT__data_count = 0U;
        __Vdly__NAND_top__DOT__NAND_ADDR = 0ULL;
        __Vdly__NAND_top__DOT__NAND_DONE = 0U;
        __Vdly__NAND_top__DOT__NAND_GO = 0U;
        if ((1U & (~ (IData)(vlSelfRef.prst_)))) {
            __Vdly__NAND_top__DOT__status = 0U;
            vlSelfRef.NAND_top__DOT__ID_INFORM = 0ULL;
        }
        __Vdly__NAND_top__DOT__WAIT_NUM = 0x14U;
        __Vdly__NAND_top__DOT__HOLD_NUM = 4U;
        __Vdly__NAND_top__DOT__PRE_STATE = 0U;
        __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
        __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        __Vdly__NAND_top__DOT__ERASE_SERIAL = 0U;
        __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
        vlSelfRef.NAND_EN_ = 0U;
        __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = 0U;
        __Vdly__NAND_top__DOT__READ_MAX_COUNT = 0U;
        __Vdly__NAND_top__DOT__WRITE_MAX_COUNT = 0U;
        __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
        __Vdly__NAND_top__DOT__NAND_DAT_I_WR = 0U;
        vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD = 0x12345678U;
        __Vdly__NAND_top__DOT__READ_ID_NUM = 4U;
        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
    } else if ((0x00000010U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
        if ((8U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((4U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
            } else if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                    if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x1bU;
                        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                        __Vdly__NAND_top__DOT__NAND_GO = 0U;
                    } else {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x1bU;
                    }
                } else if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x1aU;
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x1bU;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x1aU;
                }
            } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            } else if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
                if ((((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY) 
                      & (1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) 
                     & (0x60U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x17U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY) 
                            & (0xd0U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_OP_NUM 
                        = (vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                           - (IData)(1U));
                    __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                    __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                } else if ((((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY) 
                             & (1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) 
                            & (0x70U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelfRef.NAND_CLE = 0U;
                    vlSelfRef.NAND_ALE = 0U;
                    vlSelfRef.NAND_WR_ = 1U;
                    vlSelfRef.NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(3U) 
                                          + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                    vlSelfRef.NAND_EN_ = 1U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY) 
                            & (0x15U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)))) {
                    if ((1U & ((~ (IData)(vlSelfRef.NAND_top__DOT__status)) 
                               & ((0U == vlSelfRef.NAND_top__DOT__NAND_OP_NUM) 
                                  | (~ (IData)(vlSelfRef.NAND_top__DOT__ERASE_SERIAL)))))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                        __Vdly__NAND_top__DOT__NAND_ADDR = 0ULL;
                        __Vdly__NAND_top__DOT__ERASE_SERIAL = 0U;
                    } else if (((~ (IData)(vlSelfRef.NAND_top__DOT__status)) 
                                & (0U != vlSelfRef.NAND_top__DOT__NAND_OP_NUM))) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x00000800U & vlSelfRef.NAND_top__DOT__nand_parameter)
                                ? ((0x0000003ff0003fffULL 
                                    & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                   | ((QData)((IData)(
                                                      (0x00003fffU 
                                                       & ((IData)(1U) 
                                                          + (IData)(
                                                                    (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                     >> 0x0eU)))))) 
                                      << 0x0000000eU))
                                : ((((1U == (0x0000000fU 
                                             & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                >> 8U))) 
                                     | (2U == (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U)))) 
                                    | (3U == (0x0000000fU 
                                              & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 8U))))
                                    ? ((0x00000030003fffffULL 
                                        & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                       | ((QData)((IData)(
                                                          (0x00003fffU 
                                                           & ((IData)(1U) 
                                                              + (IData)(
                                                                        (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                         >> 0x16U)))))) 
                                          << 0x00000016U))
                                    : ((4U == (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U)))
                                        ? ((0x0000003c003fffffULL 
                                            & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                           | ((QData)((IData)(
                                                              (0x00000fffU 
                                                               & ((IData)(1U) 
                                                                  + (IData)(
                                                                            (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                             >> 0x16U)))))) 
                                              << 0x00000016U))
                                        : ((5U == (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U)))
                                            ? ((0x0000003c00ffffffULL 
                                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                               | ((QData)((IData)(
                                                                  (0x000003ffU 
                                                                   & ((IData)(1U) 
                                                                      + (IData)(
                                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x18U)))))) 
                                                  << 0x00000018U))
                                            : ((0x0000003001ffffffULL 
                                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                               | ((QData)((IData)(
                                                                  (0x000007ffU 
                                                                   & ((IData)(1U) 
                                                                      + (IData)(
                                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x19U)))))) 
                                                  << 0x00000019U))))));
                        __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                        __Vdly__NAND_top__DOT__COMMAND = 0x60U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                        __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                        vlSelfRef.NAND_EN_ = 0U;
                    } else {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x19U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    }
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x18U;
            }
        } else if ((4U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                    if (((0x0aU != (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                         & (0x60U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x0aU;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x17U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                        __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                            = (((((9U == (0x0000000fU 
                                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                             >> 8U))) 
                                  | (0x0aU == (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U)))) 
                                 | (0x0bU == (0x0000000fU 
                                              & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 8U)))) 
                                | (0U == (0x0000000fU 
                                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                             >> 8U))))
                                ? 2U : 3U);
                    } else if (((1U != (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                                & (0x60U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x17U;
                        __Vdly__NAND_top__DOT__COMMAND = 0xd0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                    } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                                & (0xd0U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE 
                            = ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY)
                                ? 0x17U : 0x18U);
                    }
                } else if ((0x15U != (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelfRef.NAND_CLE = 0U;
                    vlSelfRef.NAND_ALE = 0U;
                    vlSelfRef.NAND_WR_ = 1U;
                    vlSelfRef.NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x16U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(3U) 
                                          + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                    vlSelfRef.NAND_EN_ = 1U;
                } else {
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_GO = 0U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                }
            } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                     >= (0x000000ffU & ((IData)(1U) 
                                        + ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                           - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelfRef.NAND_RD_ = 1U;
                    vlSelfRef.NAND_EN_ = 1U;
                } else if (((0U != (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)) 
                            & (1U < (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelfRef.NAND_RD_ = 0U;
                    vlSelfRef.NAND_EN_ = 1U;
                } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__status = vlSelfRef.NAND_I;
                    vlSelfRef.NAND_RD_ = 1U;
                    vlSelfRef.NAND_EN_ = 1U;
                } else if ((0U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) {
                    vlSelfRef.NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    __Vdly__NAND_top__DOT__NAND_STATE 
                        = vlSelfRef.NAND_top__DOT__PRE_STATE;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                    if ((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    }
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x15U;
                } else {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelfRef.NAND_RD_ = 1U;
                    vlSelfRef.NAND_EN_ = 1U;
                }
            } else if (((0x0aU != (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x90U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x0aU;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                __Vdly__NAND_top__DOT__READ_ID_NUM 
                    = (7U & (vlSelfRef.NAND_top__DOT__nand_parameter 
                             >> 0x0000000cU));
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = 1U;
            } else if ((0x70U != (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) {
                if ((0U != (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                    vlSelfRef.NAND_EN_ = 1U;
                    if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                         > (0x000000ffU & (((IData)(1U) 
                                            + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)) 
                                           - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))))) {
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                              - (IData)(1U)));
                        vlSelfRef.NAND_RD_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                    } else if ((1U < (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) {
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                              - (IData)(1U)));
                        vlSelfRef.NAND_RD_ = 0U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                    } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) {
                        __Vdly__NAND_top__DOT__READ_ID_NUM 
                            = (7U & ((IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM) 
                                     - (IData)(1U)));
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                        vlSelfRef.NAND_RD_ = 1U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                        if ((1U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x0000ffffffffff00ULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | (IData)((IData)(vlSelfRef.NAND_I)));
                        } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x0000ffffffff00ffULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelfRef.NAND_I)) 
                                      << 8U));
                        } else if ((3U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x0000ffffff00ffffULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelfRef.NAND_I)) 
                                      << 0x00000010U));
                        } else if ((4U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x0000ffff00ffffffULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelfRef.NAND_I)) 
                                      << 0x00000018U));
                        } else if ((5U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x0000ff00ffffffffULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelfRef.NAND_I)) 
                                      << 0x00000020U));
                        } else if ((6U == (IData)(vlSelfRef.NAND_top__DOT__READ_ID_NUM))) {
                            vlSelfRef.NAND_top__DOT__ID_INFORM 
                                = ((0x000000ffffffffffULL 
                                    & vlSelfRef.NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelfRef.NAND_I)) 
                                      << 0x00000028U));
                        }
                    }
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                    __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelfRef.NAND_EN_ = 0U;
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x16U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                vlSelfRef.NAND_EN_ = 1U;
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
            }
        } else if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            } else if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
                __Vdly__NAND_top__DOT__PRE_STATE = 0x12U;
                __Vdly__NAND_top__DOT__NAND_STATE = 0x11U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x12U;
            }
        } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if (((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                 != (IData)(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT))) {
                if ((1U & ((~ (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE)) 
                           & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if ((((((IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE) 
                               & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))) 
                              & (3U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) 
                             & (2U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) 
                            & ((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                               < (0x00003fffU & ((IData)(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT) 
                                                 - (IData)(4U)))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ) 
                            & (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                    __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                    __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_DAT_I_WR 
                        = vlSelfRef.DAT_I;
                }
                if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                      > (0x000000ffU & ((IData)(1U) 
                                        + ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                           - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))))) 
                     & ((IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE) 
                        | (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_WR_ = 1U;
                } else if (((1U < (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)) 
                            & (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_WR_ = 0U;
                    if ((0U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR);
                    } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & (vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR 
                                               >> 8U));
                    } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & (vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR 
                                               >> 0x10U));
                    } else if ((3U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                        vlSelfRef.NAND_O = (vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR 
                                            >> 0x18U);
                    }
                } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)) 
                            & (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE))) {
                    __Vdly__NAND_top__DOT__ADDR_pointer 
                        = (3U & ((IData)(1U) + (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer)));
                    vlSelfRef.NAND_WR_ = 1U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                    if ((3U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                        __Vdly__NAND_top__DOT__NAND_OP_NUM 
                            = ((4U <= vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                ? (vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                   - (IData)(4U)) : 0U);
                        __Vdly__NAND_top__DOT__data_count 
                            = (0x00003fffU & ((4U == vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               ? (IData)(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT)
                                               : ((IData)(4U) 
                                                  + (IData)(vlSelfRef.NAND_top__DOT__data_count))));
                        __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                    }
                }
            } else if (((1U != (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x80U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__COMMAND = 0x10U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x10U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY)
                      ? 0x11U : 0x12U);
            } else if (((0x12U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x10U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x70U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                vlSelfRef.NAND_RD_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                vlSelfRef.NAND_EN_ = 1U;
            } else if ((0x15U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
                if (((~ (IData)(vlSelfRef.NAND_top__DOT__status)) 
                     & (0U == vlSelfRef.NAND_top__DOT__NAND_OP_NUM))) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__status))) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x13U;
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
            }
        } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                    & (0x80U != (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 0x10U;
            __Vdly__NAND_top__DOT__NAND_STATE = 1U;
            __Vdly__NAND_top__DOT__COMMAND = 0x80U;
        } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 0x10U;
            __Vdly__NAND_top__DOT__NAND_STATE = 2U;
            __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                = ((((9U == (0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                            >> 8U))) 
                     | (0x0aU == (0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 8U)))) 
                    | (0x0bU == (0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                >> 8U))))
                    ? 3U : ((((0U == (0x0000000fU & 
                                      (vlSelfRef.NAND_top__DOT__nand_parameter 
                                       >> 8U))) | (0x0cU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U)))) 
                             | (0x0dU == (0x0000000fU 
                                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                             >> 8U))))
                             ? 4U : 5U));
        } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
            __Vdly__NAND_top__DOT__data_count = 0U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__NAND_STATE = 0x11U;
            if ((0x00000800U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    if ((1U & (~ (vlSelfRef.NAND_top__DOT__nand_parameter 
                                  >> 9U)))) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x0000003fffffff00ULL 
                               & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003f800000ffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x007fffffU 
                                                   & ((IData)(
                                                              (0x00000200U 
                                                               == 
                                                               (0x00000300U 
                                                                & vlSelfRef.NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      ((0x00000300U 
                                                        == 
                                                        (0x00000300U 
                                                         & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                       & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000100U) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000010U) 
                                                     - 
                                                     (0x0000000fU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000010U) 
                                                    - 
                                                    (0x0000000fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000100U) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = (0x0000003fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x007fffffU 
                                               & ((IData)(
                                                          (0x00000200U 
                                                           == 
                                                           (0x00000300U 
                                                            & vlSelfRef.NAND_top__DOT__nand_command)))
                                                   ? 
                                                  ((IData)(2U) 
                                                   + (IData)(
                                                             (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                              >> 8U)))
                                                   : 
                                                  ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 8U))
                                                    : 
                                                   ((IData)(1U) 
                                                    + (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 8U)))))))) 
                              << 8U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x00003fffU & ((IData)((
                                                   (0x00000300U 
                                                    == 
                                                    (0x00000300U 
                                                     & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                   & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x00000100U) 
                                                  - 
                                                  (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x00000100U) 
                                                  - 
                                                  (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000010U) 
                                                    - 
                                                    (0x0000000fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000010U) 
                                                   - 
                                                   (0x0000000fU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000100U) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = (0x0000003fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x007fffffU 
                                               & ((IData)(
                                                          (0x00000200U 
                                                           == 
                                                           (0x00000300U 
                                                            & vlSelfRef.NAND_top__DOT__nand_command)))
                                                   ? 
                                                  ((IData)(2U) 
                                                   + (IData)(
                                                             (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                              >> 8U)))
                                                   : 
                                                  ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 8U))
                                                    : 
                                                   ((IData)(1U) 
                                                    + (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 8U)))))))) 
                              << 8U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x00003fffU & ((IData)((
                                                   (0x00000300U 
                                                    == 
                                                    (0x00000300U 
                                                     & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                   & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x00000100U) 
                                                  - 
                                                  (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x00000100U) 
                                                  - 
                                                  (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000010U) 
                                                    - 
                                                    (0x0000000fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000010U) 
                                                   - 
                                                   (0x0000000fU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000100U) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                }
            } else if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x00000200U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command))) 
                                              << 0x0000000dU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x000000300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x000fffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x00000010U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x00003fffU & ((IData)((0x00000300U 
                                                   == 
                                                   (0x00000300U 
                                                    & vlSelfRef.NAND_top__DOT__nand_command)))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00003fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00003fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x00000200U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00001fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00001fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x00000200U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command))) 
                                              << 0x0000000dU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x000000300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x000fffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x00000010U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x00003fffU & ((IData)((0x00000300U 
                                                   == 
                                                   (0x00000300U 
                                                    & vlSelfRef.NAND_top__DOT__nand_command)))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00003fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00003fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x00000200U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00001fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00001fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003fffffe000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x00000200U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command))) 
                                              << 0x0000000cU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x000000300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x000fffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x00000010U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x00003fffU & ((IData)((0x00000300U 
                                                   == 
                                                   (0x00000300U 
                                                    & vlSelfRef.NAND_top__DOT__nand_command)))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00001fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00001fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x00000200U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x0000007fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x0000007fU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00000fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00000fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_ADDR = 
                    ((0x0000003ffffff000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                     | (IData)((IData)(((IData)((0x00000200U 
                                                 == 
                                                 (0x00000300U 
                                                  & vlSelfRef.NAND_top__DOT__nand_command))) 
                                        << 0x0000000bU))));
                __Vdly__NAND_top__DOT__NAND_ADDR = 
                    ((0x000000300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                     | ((QData)((IData)((0x000fffffU 
                                         & ((IData)(1U) 
                                            + (IData)(
                                                      (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                       >> 0x10U)))))) 
                        << 0x00000010U));
                __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                    = (0x00003fffU & ((IData)((0x00000300U 
                                               == (0x00000300U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command)))
                                       ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x00003fffU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 0x00000010U)) 
                                              - (0x00000fffU 
                                                 & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x00003fffU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 0x00000010U)) 
                                              - (0x00000fffU 
                                                 & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                           : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                       : ((0x00000200U 
                                           & vlSelfRef.NAND_top__DOT__nand_command)
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x0000003fU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x0000003fU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x000007ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x000007ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
            }
        }
    } else if ((8U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
        if ((4U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        } else if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
            } else if ((0U != (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                     > (0x000000ffU & ((IData)(1U) 
                                       + ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                          - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_ALE = 0U;
                    vlSelfRef.NAND_WR_ = 1U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                            > (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                              - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_ALE = 1U;
                    vlSelfRef.NAND_WR_ = 1U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                            >= (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_ALE = 1U;
                    vlSelfRef.NAND_WR_ = 0U;
                    if ((3U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & (((0x0cU 
                                                 == 
                                                 (0x0000000fU 
                                                  & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                     >> 8U))) 
                                                | (0x0dU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 9U))
                                                : (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 0x10U))));
                    } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & ((((9U 
                                                  == 
                                                  (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U))) 
                                                 | (0x0aU 
                                                    == 
                                                    (0x0000000fU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 8U)))) 
                                                | (0x0bU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 9U))
                                                : (
                                                   ((0x0cU 
                                                     == 
                                                     (0x0000000fU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 8U))) 
                                                    | (0x0dU 
                                                       == 
                                                       (0x0000000fU 
                                                        & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x11U))
                                                    : 
                                                   ((0U 
                                                     == 
                                                     (0x0000000fU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 8U)))
                                                     ? (IData)(
                                                               (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                >> 0x10U))
                                                     : (IData)(
                                                               (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                >> 0x18U))))));
                    } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelfRef.NAND_O = (0x000000ffU 
                                            & ((0x14U 
                                                == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))
                                                ? (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)
                                                : (
                                                   (((9U 
                                                      == 
                                                      (0x0000000fU 
                                                       & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                          >> 8U))) 
                                                     | (0x0aU 
                                                        == 
                                                        (0x0000000fU 
                                                         & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                            >> 8U)))) 
                                                    | (0x0bU 
                                                       == 
                                                       (0x0000000fU 
                                                        & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x11U))
                                                    : 
                                                   (((0x0cU 
                                                      == 
                                                      (0x0000000fU 
                                                       & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                          >> 8U))) 
                                                     | (0x0dU 
                                                        == 
                                                        (0x0000000fU 
                                                         & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                            >> 8U))))
                                                     ? (IData)(
                                                               (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                >> 0x19U))
                                                     : 
                                                    ((0U 
                                                      == 
                                                      (0x0000000fU 
                                                       & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                          >> 8U)))
                                                      ? (IData)(
                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x18U))
                                                      : 
                                                     (0x0000000fU 
                                                      & (IData)(
                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x20U))))))));
                    }
                } else if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                             < (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)) 
                            & (0U != (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                          - (IData)(1U)));
                    vlSelfRef.NAND_ALE = 1U;
                    vlSelfRef.NAND_WR_ = 1U;
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                        = (7U & ((IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT) 
                                 - (IData)(1U)));
                    vlSelfRef.NAND_ALE = 0U;
                    vlSelfRef.NAND_WR_ = 1U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & ((IData)(2U) 
                                          + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                vlSelfRef.NAND_RD_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = vlSelfRef.NAND_top__DOT__PRE_STATE;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
                __Vdly__NAND_top__DOT__PRE_STATE = 0x0aU;
            }
        } else {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        }
    } else if ((4U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
        if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
                if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
                    if ((((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                          != (IData)(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT)) 
                         & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_)))) {
                        if ((1U & (((~ (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE)) 
                                    | ((((IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE) 
                                         & (3U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) 
                                        & (2U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM))) 
                                       & ((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                                          < (0x00003fffU 
                                             & ((IData)(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT) 
                                                - (IData)(4U)))))) 
                                   & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))))) {
                            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                        } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_HIT) 
                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ))) {
                            if (((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                                 == (0x00003fffU & 
                                     ((IData)(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT) 
                                      - (IData)(1U))))) {
                                __Vdly__NAND_top__DOT__data_count 
                                    = vlSelfRef.NAND_top__DOT__READ_MAX_COUNT;
                            }
                            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                            __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                        }
                        if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                              > (0x000000ffU & ((IData)(1U) 
                                                + ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                                   - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))))) 
                             & ((IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE) 
                                | (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT)))) {
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
                            vlSelfRef.NAND_RD_ = 1U;
                        } else if (((1U < (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)) 
                                    & ((IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE) 
                                       & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ))))) {
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
                            vlSelfRef.NAND_RD_ = 0U;
                        } else if (((1U == (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)) 
                                    & (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE))) {
                            __Vdly__NAND_top__DOT__ADDR_pointer 
                                = (3U & ((IData)(1U) 
                                         + (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer)));
                            if (((IData)(vlSelfRef.NAND_top__DOT__data_count) 
                                 != (0x00003fffU & 
                                     ((IData)(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT) 
                                      - (IData)(1U))))) {
                                __Vdly__NAND_top__DOT__data_count 
                                    = (0x00003fffU 
                                       & ((IData)(1U) 
                                          + (IData)(vlSelfRef.NAND_top__DOT__data_count)));
                            }
                            if ((0U != vlSelfRef.NAND_top__DOT__NAND_OP_NUM)) {
                                __Vdly__NAND_top__DOT__NAND_OP_NUM 
                                    = (vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                       - (IData)(1U));
                            }
                            vlSelfRef.NAND_RD_ = 1U;
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                            if ((0U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                                vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xffffff00U 
                                        & vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD) 
                                       | (IData)(vlSelfRef.NAND_I));
                            } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                                vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xffff00ffU 
                                        & vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelfRef.NAND_I) 
                                          << 8U));
                            } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                                vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xff00ffffU 
                                        & vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelfRef.NAND_I) 
                                          << 0x00000010U));
                            } else if ((3U == (IData)(vlSelfRef.NAND_top__DOT__ADDR_pointer))) {
                                vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0x00ffffffU 
                                        & vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelfRef.NAND_I) 
                                          << 0x00000018U));
                                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                            }
                        }
                    } else {
                        __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                        __Vdly__NAND_top__DOT__data_count = 0U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                        if ((0U == vlSelfRef.NAND_top__DOT__NAND_OP_NUM)) {
                            __Vdly__NAND_top__DOT__NAND_GO = 0U;
                            __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        } else {
                            __Vdly__NAND_top__DOT__NAND_GO = 1U;
                            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                        }
                    }
                } else if ((1U & ((~ (IData)(vlSelfRef.NAND_top__DOT__DMA_OP_DONE)) 
                                  & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ) 
                            & (IData)(vlSelfRef.NAND_top__DOT__NAND_HIT))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                    __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                    __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                }
            } else {
                __Vdly__NAND_top__DOT__data_count = 0U;
                __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                vlSelfRef.NAND_EN_ = 1U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 7U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                if ((0x00000800U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                        if ((1U & (~ (vlSelfRef.NAND_top__DOT__nand_parameter 
                                      >> 9U)))) {
                            __Vdly__NAND_top__DOT__NAND_ADDR 
                                = (0x0000003fffffff00ULL 
                                   & __Vdly__NAND_top__DOT__NAND_ADDR);
                            __Vdly__NAND_top__DOT__NAND_ADDR 
                                = ((0x0000003f800000ffULL 
                                    & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                   | ((QData)((IData)(
                                                      (0x007fffffU 
                                                       & ((IData)(
                                                                  (0x00000200U 
                                                                   == 
                                                                   (0x00000300U 
                                                                    & vlSelfRef.NAND_top__DOT__nand_command)))
                                                           ? 
                                                          ((IData)(2U) 
                                                           + (IData)(
                                                                     (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                      >> 8U)))
                                                           : 
                                                          ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                            ? (IData)(
                                                                      (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                       >> 8U))
                                                            : 
                                                           ((IData)(1U) 
                                                            + (IData)(
                                                                      (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                       >> 8U)))))))) 
                                      << 8U));
                            __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                                = (0x00003fffU & ((IData)(
                                                          ((0x00000300U 
                                                            == 
                                                            (0x00000300U 
                                                             & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                           & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000100U) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                                    ? 
                                                   ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                     > 
                                                     ((IData)(0x00000010U) 
                                                      - 
                                                      (0x0000000fU 
                                                       & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                     ? 
                                                    ((IData)(0x00000010U) 
                                                     - 
                                                     (0x0000000fU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                     : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                    : 
                                                   ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                     > 
                                                     ((IData)(0x00000100U) 
                                                      - 
                                                      (0x000000ffU 
                                                       & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                     ? 
                                                    ((IData)(0x00000100U) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                     : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                        }
                    } else if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x0000003fffffff00ULL 
                               & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003f800000ffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x007fffffU 
                                                   & ((IData)(
                                                              (0x00000200U 
                                                               == 
                                                               (0x00000300U 
                                                                & vlSelfRef.NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      ((0x00000300U 
                                                        == 
                                                        (0x00000300U 
                                                         & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                       & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000100U) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000010U) 
                                                     - 
                                                     (0x0000000fU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000010U) 
                                                    - 
                                                    (0x0000000fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000100U) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x0000003fffffff00ULL 
                               & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003f800000ffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x007fffffU 
                                                   & ((IData)(
                                                              (0x00000200U 
                                                               == 
                                                               (0x00000300U 
                                                                & vlSelfRef.NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelfRef.NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      ((0x00000300U 
                                                        == 
                                                        (0x00000300U 
                                                         & vlSelfRef.NAND_top__DOT__nand_command)) 
                                                       & (~ (IData)(vlSelfRef.NAND_top__DOT__now_oob))))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x00000100U) 
                                                   - 
                                                   (0x000000ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((IData)(vlSelfRef.NAND_top__DOT__now_oob)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000010U) 
                                                     - 
                                                     (0x0000000fU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000010U) 
                                                    - 
                                                    (0x0000000fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x00000100U) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x00000100U) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003fffffc000ULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x00000200U 
                                                           == 
                                                           (0x00000300U 
                                                            & vlSelfRef.NAND_top__DOT__nand_command))) 
                                                  << 0x0000000dU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x000000300000ffffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x000fffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x00000010U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      (0x00000300U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command)))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00003fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00003fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((0x00000200U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x00001fffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00001fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003fffffc000ULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x00000200U 
                                                           == 
                                                           (0x00000300U 
                                                            & vlSelfRef.NAND_top__DOT__nand_command))) 
                                                  << 0x0000000dU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x000000300000ffffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x000fffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x00000010U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      (0x00000300U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command)))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00003fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00003fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((0x00000200U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x000000ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x000000ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x00001fffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00001fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    } else {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x0000003fffffe000ULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x00000200U 
                                                           == 
                                                           (0x00000300U 
                                                            & vlSelfRef.NAND_top__DOT__nand_command))) 
                                                  << 0x0000000cU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x000000300000ffffULL 
                                & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x000fffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x00000010U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x00003fffU & ((IData)(
                                                      (0x00000300U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command)))
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00001fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x00001fffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((0x00000200U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command)
                                                   ? 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x0000007fU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x0000007fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((0x00003fffU 
                                                      & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                         >> 0x00000010U)) 
                                                     - 
                                                     (0x00000fffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x00000fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x0000003ffffff000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x00000200U 
                                                       == 
                                                       (0x00000300U 
                                                        & vlSelfRef.NAND_top__DOT__nand_command))) 
                                              << 0x0000000bU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x000000300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x000fffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x00000010U));
                    __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                        = (0x00003fffU & ((IData)((0x00000300U 
                                                   == 
                                                   (0x00000300U 
                                                    & vlSelfRef.NAND_top__DOT__nand_command)))
                                           ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00000fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x00003fffU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 0x00000010U)) 
                                                  - 
                                                  (0x00000fffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                               : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x00000200U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)
                                               ? ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x0000003fU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x0000003fU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelfRef.NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x00003fffU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 0x00000010U)) 
                                                    - 
                                                    (0x000007ffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x00003fffU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 0x00000010U)) 
                                                   - 
                                                   (0x000007ffU 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelfRef.NAND_top__DOT__NAND_OP_NUM))));
                }
            }
        } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        } else if (vlSelfRef.NAND_top__DOT__NAND_IORDY) {
            vlSelfRef.NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = 6U;
        } else {
            __Vdly__NAND_top__DOT__NAND_STATE = 4U;
        }
    } else if ((2U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
        if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
            if ((((1U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                  & (0x30U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                 | ((2U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                       >> 0x0000000bU)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY)
                      ? 3U : 4U);
            } else if (((2U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE)) 
                        & (0x30U != (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__PRE_STATE = 3U;
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__COMMAND = 0x30U;
            } else {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__PRE_STATE = 3U;
                __Vdly__NAND_top__DOT__NAND_STATE = 2U;
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                    = ((((9U == (0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                >> 8U))) 
                         | (0x0aU == (0x0000000fU & 
                                      (vlSelfRef.NAND_top__DOT__nand_parameter 
                                       >> 8U)))) | 
                        (0x0bU == (0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U))))
                        ? 3U : ((((0U == (0x0000000fU 
                                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                             >> 8U))) 
                                  | (0x0cU == (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U)))) 
                                 | (0x0dU == (0x0000000fU 
                                              & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 8U))))
                                 ? 4U : 5U));
            }
        } else if ((0U != (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
            if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                 > (0x000000ffU & ((IData)(1U) + ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                                  - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)))))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
            } else if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                        > (0x000000ffU & ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                          - (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelfRef.NAND_ALE = 1U;
                vlSelfRef.NAND_WR_ = 1U;
            } else if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                        >= (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelfRef.NAND_ALE = 1U;
                vlSelfRef.NAND_WR_ = 0U;
                if ((5U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelfRef.NAND_O = (0x000000ffU 
                                        & (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR));
                } else if ((4U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelfRef.NAND_O = (0x000000ffU 
                                        & (((0x0cU 
                                             == (0x0000000fU 
                                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                    >> 8U))) 
                                            | (0x0dU 
                                               == (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U))))
                                            ? (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)
                                            : ((0U 
                                                == 
                                                (0x0000000fU 
                                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                    >> 8U)))
                                                ? (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)
                                                : (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 8U)))));
                } else if ((3U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelfRef.NAND_O = (0x000000ffU 
                                        & ((((9U == 
                                              (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U))) 
                                             | (0x0aU 
                                                == 
                                                (0x0000000fU 
                                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                    >> 8U)))) 
                                            | (0x0bU 
                                               == (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U))))
                                            ? (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR)
                                            : (((0x0cU 
                                                 == 
                                                 (0x0000000fU 
                                                  & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                     >> 8U))) 
                                                | (0x0dU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 9U))
                                                : (
                                                   (0U 
                                                    == 
                                                    (0x0000000fU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 8U)))
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 8U))
                                                    : (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x10U))))));
                } else if ((2U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelfRef.NAND_O = (0x000000ffU 
                                        & ((((9U == 
                                              (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U))) 
                                             | (0x0aU 
                                                == 
                                                (0x0000000fU 
                                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                    >> 8U)))) 
                                            | (0x0bU 
                                               == (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U))))
                                            ? (IData)(
                                                      (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                       >> 9U))
                                            : (((0x0cU 
                                                 == 
                                                 (0x0000000fU 
                                                  & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                     >> 8U))) 
                                                | (0x0dU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 0x11U))
                                                : (
                                                   (0U 
                                                    == 
                                                    (0x0000000fU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 8U)))
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x10U))
                                                    : (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x18U))))));
                } else if ((1U == (IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelfRef.NAND_O = (0x000000ffU 
                                        & ((((9U == 
                                              (0x0000000fU 
                                               & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U))) 
                                             | (0x0aU 
                                                == 
                                                (0x0000000fU 
                                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                    >> 8U)))) 
                                            | (0x0bU 
                                               == (0x0000000fU 
                                                   & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                      >> 8U))))
                                            ? (IData)(
                                                      (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                       >> 0x11U))
                                            : (((0x0cU 
                                                 == 
                                                 (0x0000000fU 
                                                  & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                     >> 8U))) 
                                                | (0x0dU 
                                                   == 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 0x19U))
                                                : (
                                                   (0U 
                                                    == 
                                                    (0x0000000fU 
                                                     & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                        >> 8U)))
                                                    ? (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x18U))
                                                    : 
                                                   (0x0000003fU 
                                                    & (IData)(
                                                              (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                               >> 0x20U)))))));
                }
            } else if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                         < (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)) 
                        & (0U != (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelfRef.NAND_ALE = 1U;
                vlSelfRef.NAND_WR_ = 1U;
            } else {
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                    = (7U & ((IData)(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT) 
                             - (IData)(1U)));
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(2U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            }
        } else {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            vlSelfRef.NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = vlSelfRef.NAND_top__DOT__PRE_STATE;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & ((IData)(1U) 
                                                  + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            __Vdly__NAND_top__DOT__PRE_STATE = 2U;
        }
    } else if ((1U & (IData)(vlSelfRef.NAND_top__DOT__NAND_STATE))) {
        if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
             == (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
        } else if (((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                    == ((0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing)) 
                        - (IData)(1U)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelfRef.NAND_CLE = 1U;
            vlSelfRef.NAND_WR_ = 1U;
        } else if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                     < (0x000000ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing))) 
                    & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                       > (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelfRef.NAND_O = vlSelfRef.NAND_top__DOT__COMMAND;
            vlSelfRef.NAND_CLE = 1U;
            vlSelfRef.NAND_WR_ = 0U;
        } else if ((((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                     <= (IData)(vlSelfRef.NAND_top__DOT__HOLD_NUM)) 
                    & (0U != (IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelfRef.NAND_CLE = 1U;
            vlSelfRef.NAND_WR_ = 1U;
        } else if ((0U == (IData)(vlSelfRef.NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_O = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__PRE_STATE = 1U;
            if (((IData)((0U != (6U & vlSelfRef.NAND_top__DOT__nand_command))) 
                 & (((0U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)) 
                     | (1U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                    | (0x50U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((2U & vlSelfRef.NAND_top__DOT__nand_command)
                      ? 3U : 0x10U);
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            } else if (((vlSelfRef.NAND_top__DOT__nand_command 
                         >> 2U) & (0x80U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x10U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            } else if ((0x60U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x17U;
                __Vdly__NAND_top__DOT__PRE_STATE = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            } else if ((0x70U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            } else if ((0x90U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            } else if ((0xffU == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x1aU;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.NAND_top__DOT__nand_timing)));
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            }
        } else {
            vlSelfRef.NAND_CLE = 0U;
            vlSelfRef.NAND_ALE = 0U;
            vlSelfRef.NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = vlSelfRef.NAND_top__DOT__PRE_STATE;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                               & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 1U;
        }
    } else {
        __Vdly__NAND_top__DOT__HOLD_NUM = (0x000000ffU 
                                           & ((IData)(vlSelfRef.NAND_top__DOT__nand_timing) 
                                              >> 8U));
        if ((1U & vlSelfRef.NAND_top__DOT__nand_command)) {
            if (vlSelfRef.NAND_top__DOT__nand_clr_ack) {
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            }
            if ((0U == vlSelfRef.NAND_top__DOT__NAND_OP_NUM)) {
                __Vdly__NAND_top__DOT__NAND_ADDR = vlSelfRef.NAND_top__DOT__addr_in_die;
                __Vdly__NAND_top__DOT__NAND_OP_NUM 
                    = vlSelfRef.NAND_top__DOT__nand_op_num;
            }
            __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
            if ((IData)((((((0x00000202U == (0x00000202U 
                                             & vlSelfRef.NAND_top__DOT__nand_command)) 
                            & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                           & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE))) 
                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                             >> 0x0000000bU)) & ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_command 
                                                   >> 8U)) 
                                                 | (((vlSelfRef.NAND_top__DOT__nand_command 
                                                      >> 8U) 
                                                     & (IData)(
                                                               (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                                >> 8U))) 
                                                    & (IData)(vlSelfRef.NAND_top__DOT__now_up_half)))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x50U;
                vlSelfRef.NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 1U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((((vlSelfRef.NAND_top__DOT__nand_command 
                            >> 1U) & (IData)((vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                              >> 8U))) 
                          & (vlSelfRef.NAND_top__DOT__nand_parameter 
                             >> 0x0000000bU)) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 1U;
                vlSelfRef.NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half 
                    = (IData)((0x00000300U == (0x00000300U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)));
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 1U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0U;
                vlSelfRef.NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((IData)((((((0x00000204U == 
                                    (0x00000204U & vlSelfRef.NAND_top__DOT__nand_command)) 
                                   & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                                  & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE))) 
                                 & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                    >> 0x0000000bU)) 
                                & ((~ (vlSelfRef.NAND_top__DOT__nand_command 
                                       >> 8U)) | ((
                                                   (vlSelfRef.NAND_top__DOT__nand_command 
                                                    >> 8U) 
                                                   & (IData)(
                                                             (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                              >> 8U))) 
                                                  & (IData)(vlSelfRef.NAND_top__DOT__now_up_half)))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x50U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 1U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((((vlSelfRef.NAND_top__DOT__nand_command 
                            >> 2U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                          & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE))) 
                         & (vlSelfRef.NAND_top__DOT__nand_parameter 
                            >> 0x0000000bU)) & (IData)(
                                                       (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                        >> 8U)))) {
                __Vdly__NAND_top__DOT__COMMAND = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half 
                    = (IData)((0x00000300U == (0x00000300U 
                                               & vlSelfRef.NAND_top__DOT__nand_command)));
            } else if ((((((vlSelfRef.NAND_top__DOT__nand_command 
                            >> 2U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                          & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE))) 
                         & (vlSelfRef.NAND_top__DOT__nand_parameter 
                            >> 0x0000000bU)) & (~ (IData)(
                                                          (vlSelfRef.NAND_top__DOT__NAND_ADDR 
                                                           >> 8U))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 2U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x80U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 3U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x60U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__ERASE_SERIAL 
                    = (1U & (vlSelfRef.NAND_top__DOT__nand_command 
                             >> 4U));
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 5U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x90U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 6U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0xffU;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelfRef.NAND_top__DOT__nand_command 
                          >> 7U) & (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((((((((0U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND)) 
                               | (0x70U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                              | (0x80U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                             | (1U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                            | (0x50U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                           | (0x60U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                          | (0x90U == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                         | (0xffU == (IData)(vlSelfRef.NAND_top__DOT__COMMAND))) 
                        & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0x000000ffU 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelfRef.NAND_CLE = 0U;
                vlSelfRef.NAND_ALE = 0U;
                vlSelfRef.NAND_WR_ = 1U;
                vlSelfRef.NAND_RD_ = 1U;
                vlSelfRef.NAND_EN_ = 0U;
            } else {
                __Vdly__NAND_top__DOT__COMMAND = 0x55U;
                __Vdly__NAND_top__DOT__NAND_GO = (1U 
                                                  & ((~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)) 
                                                     & vlSelfRef.NAND_top__DOT__nand_command));
                if ((1U & (~ vlSelfRef.NAND_top__DOT__nand_command))) {
                    __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                }
            }
        } else {
            if (vlSelfRef.NAND_top__DOT__nand_clr_ack) {
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            }
            __Vdly__NAND_top__DOT__COMMAND = 0x55U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            vlSelfRef.NAND_WR_ = 1U;
            vlSelfRef.NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            if ((1U & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_GO)))) {
                if ((1U & vlSelfRef.NAND_top__DOT__nand_command)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = vlSelfRef.NAND_top__DOT__addr_in_die;
                    __Vdly__NAND_top__DOT__NAND_OP_NUM 
                        = vlSelfRef.NAND_top__DOT__nand_op_num;
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR = 0x0000003fffffffffULL;
                    __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
                }
            }
            __Vdly__NAND_top__DOT__NAND_GO = (1U & 
                                              ((~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)) 
                                               & vlSelfRef.NAND_top__DOT__nand_command));
        }
    }
    vlSelfRef.nand_int = ((IData)(vlSelfRef.prst_) 
                          && ((IData)(vlSelfRef.NAND_top__DOT__NAND_DONE) 
                              & (vlSelfRef.NAND_top__DOT__nand_command 
                                 >> 0x0000000dU)));
    if (vlSelfRef.prst_) {
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT10))) {
            vlSelfRef.NAND_top__DOT__nand_rdy_map0 
                = vlSelfRef.DAT_I;
        }
        vlSelfRef.NAND_top__DOT__nand_ce_map1 = (((IData)(vlSelfRef.pwrite) 
                                                  & (IData)(vlSelfRef.NAND_top__DOT__HIT9))
                                                  ? vlSelfRef.DAT_I
                                                  : 
                                                 (((IData)(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT) 
                                                   << 0x00000010U) 
                                                  | (0x0000ffffU 
                                                     & vlSelfRef.NAND_top__DOT__NAND_OP_NUM)));
        vlSelfRef.NAND_top__DOT__nand_rdy_map1 = (((IData)(vlSelfRef.pwrite) 
                                                   & (IData)(vlSelfRef.NAND_top__DOT__HIT11))
                                                   ? vlSelfRef.DAT_I
                                                   : 
                                                  (((IData)(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT) 
                                                    << 0x00000010U) 
                                                   | (0x0000ffffU 
                                                      & vlSelfRef.NAND_top__DOT__NAND_OP_NUM)));
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT8))) {
            vlSelfRef.NAND_top__DOT__nand_ce_map0 = vlSelfRef.DAT_I;
        }
        if ((0x00000800U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
            if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & 0U);
                    vlSelfRef.NAND_top__DOT__addr_in_die = 0ULL;
                } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x12U));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x0003ffffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x000001ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
                } else {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x11U));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x0001ffffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x000001ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
                }
            } else if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x10U));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x0000ffffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x000001ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
                } else {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x0fU));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x00007fffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x000001ffU 
                                                      & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
                }
            } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                             >> 0x0eU));
                vlSelfRef.NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x00003fffU 
                                         & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                        << 9U) | (QData)((IData)((0x000001ffU 
                                                  & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
            } else {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & 0U);
                vlSelfRef.NAND_top__DOT__addr_in_die = 0ULL;
            }
        } else if ((0x00000400U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
            if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x15U));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x001fffffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 0x00000010U) | (QData)((IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)));
                } else {
                    vlSelfRef.NAND_top__DOT__nand_number 
                        = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                                 >> 0x14U));
                    vlSelfRef.NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x000fffffU 
                                             & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                            << 0x00000010U) | (QData)((IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)));
                }
            } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelfRef.NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x0007ffffU 
                                         & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                        << 0x00000010U) | (QData)((IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)));
            } else {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelfRef.NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x0007ffffU 
                                         & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                        << 0x00000010U) | (QData)((IData)(
                                                          (0x00001fffU 
                                                           & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
            }
        } else if ((0x00000200U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
            if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelfRef.NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x0007ffffU 
                                         & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                        << 0x00000010U) | (QData)((IData)(
                                                          (0x00000fffU 
                                                           & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
            } else {
                vlSelfRef.NAND_top__DOT__nand_number 
                    = (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                             >> 0x12U));
                vlSelfRef.NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x0003ffffU 
                                         & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                        << 0x00000010U) | (QData)((IData)(
                                                          (0x00000fffU 
                                                           & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
            }
        } else if ((0x00000100U & vlSelfRef.NAND_top__DOT__nand_parameter)) {
            vlSelfRef.NAND_top__DOT__nand_number = 
                (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                       >> 0x11U));
            vlSelfRef.NAND_top__DOT__addr_in_die = 
                (((QData)((IData)((0x0001ffffU & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                  << 0x00000010U) | (QData)((IData)(
                                                    (0x00000fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
        } else {
            vlSelfRef.NAND_top__DOT__nand_number = 
                (3U & (vlSelfRef.NAND_top__DOT__nand_addr_r 
                       >> 0x10U));
            vlSelfRef.NAND_top__DOT__addr_in_die = 
                (((QData)((IData)((0x0000ffffU & vlSelfRef.NAND_top__DOT__nand_addr_r))) 
                  << 0x00000010U) | (QData)((IData)(
                                                    (0x00000fffU 
                                                     & (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)))));
        }
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT3))) {
            vlSelfRef.NAND_top__DOT__nand_timing = 
                ((0xff00U & (IData)(vlSelfRef.NAND_top__DOT__nand_timing)) 
                 | ((5U > (0x000000ffU & vlSelfRef.DAT_I))
                     ? 5U : (0x000000ffU & vlSelfRef.DAT_I)));
            vlSelfRef.NAND_top__DOT__nand_timing = 
                ((0x00ffU & (IData)(vlSelfRef.NAND_top__DOT__nand_timing)) 
                 | (((2U > (0x000000ffU & (vlSelfRef.DAT_I 
                                           >> 8U)))
                      ? 2U : (0x000000ffU & (vlSelfRef.DAT_I 
                                             >> 8U))) 
                    << 8U));
        }
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT7))) {
            vlSelfRef.NAND_top__DOT__nand_op_num = vlSelfRef.DAT_I;
        }
        vlSelfRef.NAND_top__DOT__nand_cmd_valid = (1U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command);
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT0))) {
            __Vdly__NAND_top__DOT__nand_command = (
                                                   (0xffff0000U 
                                                    & __Vdly__NAND_top__DOT__nand_command) 
                                                   | (0x0000ffffU 
                                                      & vlSelfRef.DAT_I));
        } else if (((IData)(vlSelfRef.NAND_top__DOT__NAND_DONE) 
                    & vlSelfRef.NAND_top__DOT__nand_command)) {
            __Vdly__NAND_top__DOT__nand_command = (0xfffffffeU 
                                                   & __Vdly__NAND_top__DOT__nand_command);
            vlSelfRef.NAND_top__DOT__nand_clr_ack = 1U;
            __Vdly__NAND_top__DOT__nand_command = (0x00000400U 
                                                   | __Vdly__NAND_top__DOT__nand_command);
        } else {
            __Vdly__NAND_top__DOT__nand_command = (
                                                   (0x0000ffffU 
                                                    & __Vdly__NAND_top__DOT__nand_command) 
                                                   | (((IData)(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ) 
                                                       << 0x0000001fU) 
                                                      | (((IData)(vlSelfRef.NAND_top__DOT__NAND_STATE) 
                                                          << 0x00000018U) 
                                                         | (((IData)(vlSelfRef.NAND_CE_o) 
                                                             << 0x00000014U) 
                                                            | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                               << 0x00000010U)))));
            if ((1U & (~ (IData)(vlSelfRef.NAND_top__DOT__NAND_DONE)))) {
                vlSelfRef.NAND_top__DOT__nand_clr_ack = 0U;
            }
        }
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT1))) {
            vlSelfRef.NAND_top__DOT__nand_addr_c = 
                (0x00003fffU & vlSelfRef.DAT_I);
        }
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT2))) {
            vlSelfRef.NAND_top__DOT__nand_addr_r = 
                (0x01ffffffU & vlSelfRef.DAT_I);
        }
        if (((IData)(vlSelfRef.pwrite) & (IData)(vlSelfRef.NAND_top__DOT__HIT6))) {
            vlSelfRef.NAND_top__DOT__nand_parameter 
                = vlSelfRef.DAT_I;
        }
    } else {
        vlSelfRef.NAND_top__DOT__nand_rdy_map0 = 0U;
        vlSelfRef.NAND_top__DOT__nand_ce_map1 = 0U;
        vlSelfRef.NAND_top__DOT__nand_rdy_map1 = 0U;
        vlSelfRef.NAND_top__DOT__nand_ce_map0 = 0U;
        vlSelfRef.NAND_top__DOT__nand_number = 0U;
        vlSelfRef.NAND_top__DOT__nand_timing = 0x0412U;
        vlSelfRef.NAND_top__DOT__nand_op_num = 0x00000800U;
        __Vdly__NAND_top__DOT__nand_command = vlSelfRef.NAND_top__DOT__NANDtag;
        vlSelfRef.NAND_top__DOT__nand_clr_ack = 1U;
        vlSelfRef.NAND_top__DOT__nand_cmd_valid = (1U 
                                                   & vlSelfRef.NAND_top__DOT__nand_command);
        vlSelfRef.NAND_top__DOT__addr_in_die = 0ULL;
        vlSelfRef.NAND_top__DOT__nand_addr_c = 0U;
        vlSelfRef.NAND_top__DOT__nand_addr_r = 0U;
        vlSelfRef.NAND_top__DOT__nand_parameter = (
                                                   (3U 
                                                    == (IData)(vlSelfRef.nand_type))
                                                    ? 0x08005100U
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelfRef.nand_type))
                                                     ? 0x08005000U
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlSelfRef.nand_type))
                                                      ? 0x02004b00U
                                                      : 0x02004c00U)));
    }
    vlSelfRef.NAND_top__DOT__now_up_half = __Vdly__NAND_top__DOT__now_up_half;
    vlSelfRef.NAND_top__DOT__now_oob = __Vdly__NAND_top__DOT__now_oob;
    vlSelfRef.NAND_top__DOT__COMMAND = __Vdly__NAND_top__DOT__COMMAND;
    vlSelfRef.NAND_top__DOT__data_count = __Vdly__NAND_top__DOT__data_count;
    vlSelfRef.NAND_top__DOT__NAND_ADDR = __Vdly__NAND_top__DOT__NAND_ADDR;
    vlSelfRef.NAND_top__DOT__NAND_GO = __Vdly__NAND_top__DOT__NAND_GO;
    vlSelfRef.NAND_top__DOT__WAIT_NUM = __Vdly__NAND_top__DOT__WAIT_NUM;
    vlSelfRef.NAND_top__DOT__HOLD_NUM = __Vdly__NAND_top__DOT__HOLD_NUM;
    vlSelfRef.NAND_top__DOT__PRE_STATE = __Vdly__NAND_top__DOT__PRE_STATE;
    vlSelfRef.NAND_top__DOT__ADDR_pointer = __Vdly__NAND_top__DOT__ADDR_pointer;
    vlSelfRef.NAND_top__DOT__ERASE_SERIAL = __Vdly__NAND_top__DOT__ERASE_SERIAL;
    vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT = __Vdly__NAND_top__DOT__NAND_ADDR_COUNT;
    vlSelfRef.NAND_top__DOT__DMA_OP_DONE = __Vdly__NAND_top__DOT__DMA_OP_DONE;
    vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR = __Vdly__NAND_top__DOT__NAND_DAT_I_WR;
    vlSelfRef.NAND_top__DOT__READ_ID_NUM = __Vdly__NAND_top__DOT__READ_ID_NUM;
    vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT = __Vdly__NAND_top__DOT__WRITE_MAX_COUNT;
    vlSelfRef.NAND_top__DOT__READ_MAX_COUNT = __Vdly__NAND_top__DOT__READ_MAX_COUNT;
    vlSelfRef.NAND_top__DOT__NAND_OP_NUM = __Vdly__NAND_top__DOT__NAND_OP_NUM;
    vlSelfRef.NAND_top__DOT__status = __Vdly__NAND_top__DOT__status;
    vlSelfRef.NAND_top__DOT__NAND_CE_ = __Vdly__NAND_top__DOT__NAND_CE_;
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__ 
        = (1U & ((0x10000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x20000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x40000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x0000001fU)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__ 
        = (1U & ((0x00100000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x00200000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x00400000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x00000017U)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__ 
        = (1U & ((0x00001000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                  : ((0x00002000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                      ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                         >> 1U) : ((0x00004000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                    ? ((IData)(vlSelfRef.NAND_IORDY_i) 
                                       >> 2U) : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x0000000fU)) 
                                                 | ((IData)(vlSelfRef.NAND_IORDY_i) 
                                                    >> 3U))))));
    vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__ 
        = ((3U != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
           | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_));
    vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__ 
        = ((2U != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
           | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_));
    vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__ 
        = ((1U != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
           | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_));
    vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__ 
        = ((0U != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
           | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_));
    vlSelfRef.NAND_top__DOT__NAND_IORDY = (1U & ((0U 
                                                  == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                  ? (IData)(vlSelfRef.NAND_IORDY_i)
                                                  : 
                                                 ((1U 
                                                   == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                   ? (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__)
                                                   : 
                                                  ((2U 
                                                    == (IData)(vlSelfRef.NAND_top__DOT__nand_number))
                                                    ? (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__)
                                                    : 
                                                   ((3U 
                                                     != (IData)(vlSelfRef.NAND_top__DOT__nand_number)) 
                                                    | (IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__))))));
    vlSelfRef.NAND_top__DOT__NAND_STATE = __Vdly__NAND_top__DOT__NAND_STATE;
    vlSelfRef.NAND_top__DOT__NAND_DONE = __Vdly__NAND_top__DOT__NAND_DONE;
    vlSelfRef.NAND_top__DOT__NAND_DMA_REQ = __Vdly__NAND_top__DOT__NAND_DMA_REQ;
    vlSelfRef.NAND_CE_o = ((((2U & (((0x01000000U & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                      ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)
                                      : ((0x02000000U 
                                          & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                          ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__)
                                          : ((0x04000000U 
                                              & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                              ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__)
                                              : ((~ 
                                                  (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                   >> 0x0000001bU)) 
                                                 | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__))))) 
                                    << 1U)) | (1U & 
                                               ((0x00010000U 
                                                 & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                                 ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)
                                                 : 
                                                ((0x00020000U 
                                                  & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                                  ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__)
                                                  : 
                                                 ((0x00040000U 
                                                   & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                                   ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__)
                                                   : 
                                                  ((~ 
                                                    (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                     >> 0x00000013U)) 
                                                   | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__))))))) 
                            << 2U) | ((2U & (((0x00000100U 
                                               & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                               ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)
                                               : ((0x00000200U 
                                                   & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                                   ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__)
                                                   : 
                                                  ((0x00000400U 
                                                    & vlSelfRef.NAND_top__DOT__nand_ce_map0)
                                                    ? (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__)
                                                    : 
                                                   ((~ 
                                                     (vlSelfRef.NAND_top__DOT__nand_ce_map0 
                                                      >> 0x0000000bU)) 
                                                    | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__))))) 
                                             << 1U)) 
                                      | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)));
    vlSelfRef.NAND_top__DOT__nand_command = __Vdly__NAND_top__DOT__nand_command;
    vlSelfRef.NAND_REQ = vlSelfRef.NAND_top__DOT__NAND_DMA_REQ;
    vlSelfRef.NAND_top__DOT__NANDtag = ((IData)(vlSelfRef.NAND_top__DOT__nand_cmd_valid) 
                                        & (IData)(vlSelfRef.prst_));
    vlSelfRef.NAND_top__DOT__REG_DAT_T = (((~ (IData)(vlSelfRef.pwrite)) 
                                           & ((IData)(vlSelfRef.NAND_top__DOT__HIT0) 
                                              & (IData)(vlSelfRef.penable)))
                                           ? vlSelfRef.NAND_top__DOT__nand_command
                                           : (((~ (IData)(vlSelfRef.pwrite)) 
                                               & ((IData)(vlSelfRef.NAND_top__DOT__HIT1) 
                                                  & (IData)(vlSelfRef.penable)))
                                               ? (IData)(vlSelfRef.NAND_top__DOT__nand_addr_c)
                                               : ((
                                                   (~ (IData)(vlSelfRef.pwrite)) 
                                                   & ((IData)(vlSelfRef.NAND_top__DOT__HIT2) 
                                                      & (IData)(vlSelfRef.penable)))
                                                   ? vlSelfRef.NAND_top__DOT__nand_addr_r
                                                   : 
                                                  (((~ (IData)(vlSelfRef.pwrite)) 
                                                    & ((IData)(vlSelfRef.NAND_top__DOT__HIT3) 
                                                       & (IData)(vlSelfRef.penable)))
                                                    ? (IData)(vlSelfRef.NAND_top__DOT__nand_timing)
                                                    : 
                                                   (((~ (IData)(vlSelfRef.pwrite)) 
                                                     & (((IData)(vlSelfRef.psel) 
                                                         & (0x0010U 
                                                            == (IData)(vlSelfRef.ADDR))) 
                                                        & (IData)(vlSelfRef.penable)))
                                                     ? (IData)(vlSelfRef.NAND_top__DOT__ID_INFORM)
                                                     : 
                                                    (((~ (IData)(vlSelfRef.pwrite)) 
                                                      & (((IData)(vlSelfRef.psel) 
                                                          & (0x0014U 
                                                             == (IData)(vlSelfRef.ADDR))) 
                                                         & (IData)(vlSelfRef.penable)))
                                                      ? 
                                                     (((IData)(vlSelfRef.NAND_top__DOT__status) 
                                                       << 0x00000010U) 
                                                      | (0x0000ffffU 
                                                         & (IData)(
                                                                   (vlSelfRef.NAND_top__DOT__ID_INFORM 
                                                                    >> 0x00000020U))))
                                                      : 
                                                     (((~ (IData)(vlSelfRef.pwrite)) 
                                                       & ((IData)(vlSelfRef.NAND_top__DOT__HIT6) 
                                                          & (IData)(vlSelfRef.penable)))
                                                       ? vlSelfRef.NAND_top__DOT__nand_parameter
                                                       : 
                                                      (((~ (IData)(vlSelfRef.pwrite)) 
                                                        & ((IData)(vlSelfRef.NAND_top__DOT__HIT7) 
                                                           & (IData)(vlSelfRef.penable)))
                                                        ? vlSelfRef.NAND_top__DOT__nand_op_num
                                                        : 
                                                       (((~ (IData)(vlSelfRef.pwrite)) 
                                                         & ((IData)(vlSelfRef.NAND_top__DOT__HIT8) 
                                                            & (IData)(vlSelfRef.penable)))
                                                         ? vlSelfRef.NAND_top__DOT__nand_ce_map0
                                                         : 
                                                        (((~ (IData)(vlSelfRef.pwrite)) 
                                                          & ((IData)(vlSelfRef.NAND_top__DOT__HIT9) 
                                                             & (IData)(vlSelfRef.penable)))
                                                          ? vlSelfRef.NAND_top__DOT__nand_ce_map1
                                                          : 
                                                         (((~ (IData)(vlSelfRef.pwrite)) 
                                                           & ((IData)(vlSelfRef.NAND_top__DOT__HIT10) 
                                                              & (IData)(vlSelfRef.penable)))
                                                           ? vlSelfRef.NAND_top__DOT__nand_rdy_map0
                                                           : 
                                                          (((~ (IData)(vlSelfRef.pwrite)) 
                                                            & ((IData)(vlSelfRef.NAND_top__DOT__HIT11) 
                                                               & (IData)(vlSelfRef.penable)))
                                                            ? vlSelfRef.NAND_top__DOT__nand_rdy_map1
                                                            : 
                                                           (((~ (IData)(vlSelfRef.pwrite)) 
                                                             & ((IData)(vlSelfRef.NAND_top__DOT__NAND_HIT) 
                                                                & (IData)(vlSelfRef.penable)))
                                                             ? vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD
                                                             : 0U)))))))))))));
    vlSelfRef.DAT_O = vlSelfRef.NAND_top__DOT__REG_DAT_T;
}
