// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"
#include "Vsimu_top___024root.h"

extern const VlUnpacked<CData/*3:0*/, 1024> Vsimu_top__ConstPool__TABLE_h7dde3788_0;

VL_INLINE_OPT void Vsimu_top___024root___ico_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___ico_sequent__TOP__0\n"); );
    // Init
    SData/*9:0*/ __Vtableidx3;
    __Vtableidx3 = 0;
    // Body
    vlSelf->NAND_top__DOT__NANDtag = ((IData)(vlSelf->NAND_top__DOT__nand_cmd_valid) 
                                      & (IData)(vlSelf->prst_));
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp 
        = (((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
            & (0xeU == (IData)(vlSelf->btn_key_row)))
            ? 1U : (((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                     & (0xdU == (IData)(vlSelf->btn_key_row)))
                     ? 0x10U : (((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                 & (0xbU == (IData)(vlSelf->btn_key_row)))
                                 ? 0x100U : (((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                              & (7U 
                                                 == (IData)(vlSelf->btn_key_row)))
                                              ? 0x1000U
                                              : (((2U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                  & (0xeU 
                                                     == (IData)(vlSelf->btn_key_row)))
                                                  ? 2U
                                                  : 
                                                 (((2U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                   & (0xdU 
                                                      == (IData)(vlSelf->btn_key_row)))
                                                   ? 0x20U
                                                   : 
                                                  (((2U 
                                                     == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                    & (0xbU 
                                                       == (IData)(vlSelf->btn_key_row)))
                                                    ? 0x200U
                                                    : 
                                                   (((2U 
                                                      == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                     & (7U 
                                                        == (IData)(vlSelf->btn_key_row)))
                                                     ? 0x2000U
                                                     : 
                                                    (((3U 
                                                       == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                      & (0xeU 
                                                         == (IData)(vlSelf->btn_key_row)))
                                                      ? 4U
                                                      : 
                                                     (((3U 
                                                        == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                       & (0xdU 
                                                          == (IData)(vlSelf->btn_key_row)))
                                                       ? 0x40U
                                                       : 
                                                      (((3U 
                                                         == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                        & (0xbU 
                                                           == (IData)(vlSelf->btn_key_row)))
                                                        ? 0x400U
                                                        : 
                                                       (((3U 
                                                          == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                         & (7U 
                                                            == (IData)(vlSelf->btn_key_row)))
                                                         ? 0x4000U
                                                         : 
                                                        (((4U 
                                                           == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                          & (0xeU 
                                                             == (IData)(vlSelf->btn_key_row)))
                                                          ? 8U
                                                          : 
                                                         (((4U 
                                                            == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                           & (0xdU 
                                                              == (IData)(vlSelf->btn_key_row)))
                                                           ? 0x80U
                                                           : 
                                                          (((4U 
                                                             == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                            & (0xbU 
                                                               == (IData)(vlSelf->btn_key_row)))
                                                            ? 0x800U
                                                            : 
                                                           (((4U 
                                                              == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                                                             & (7U 
                                                                == (IData)(vlSelf->btn_key_row)))
                                                             ? 0x8000U
                                                             : 0U))))))))))))))));
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
        = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
            ? ((IData)(((vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                         >> 0x13U) & (~ (IData)((0xfU 
                                                 == (IData)(vlSelf->btn_key_row))))))
                ? 1U : 0U) : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                               ? ((0xfU == (IData)(vlSelf->btn_key_row))
                                   ? 2U : 7U) : ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                  ? 
                                                 ((0xfU 
                                                   == (IData)(vlSelf->btn_key_row))
                                                   ? 3U
                                                   : 7U)
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                   ? 
                                                  ((0xfU 
                                                    == (IData)(vlSelf->btn_key_row))
                                                    ? 4U
                                                    : 7U)
                                                   : 
                                                  ((4U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                    ? 
                                                   ((0xfU 
                                                     == (IData)(vlSelf->btn_key_row))
                                                     ? 0U
                                                     : 7U)
                                                    : 
                                                   ((7U 
                                                     == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                                                     ? 
                                                    (((vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                                       >> 0x13U) 
                                                      & (0xfU 
                                                         == (IData)(vlSelf->btn_key_row)))
                                                      ? 0U
                                                      : 7U)
                                                     : 0U))))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_arbiter_io_in_1_ready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awready) 
           & ((~ (IData)(vlSelf->enable_delay)) | (
                                                   (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                    >> 1U) 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable))));
    vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0 = 
        (1U & ((0x10000000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x20000000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x40000000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0x1fU)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0 = 
        (1U & ((0x100000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x200000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x400000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0x17U)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0 = 
        (1U & ((0x1000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x2000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x4000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0xfU)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelf->aresetn)));
    vlSelf->NAND_top__DOT__HIT0 = ((IData)(vlSelf->psel) 
                                   & (0U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT1 = ((IData)(vlSelf->psel) 
                                   & (4U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT2 = ((IData)(vlSelf->psel) 
                                   & (8U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT3 = ((IData)(vlSelf->psel) 
                                   & (0xcU == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT6 = ((IData)(vlSelf->psel) 
                                   & (0x18U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT7 = ((IData)(vlSelf->psel) 
                                   & (0x1cU == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT8 = ((IData)(vlSelf->psel) 
                                   & (0x20U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT9 = ((IData)(vlSelf->psel) 
                                   & (0x24U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT10 = ((IData)(vlSelf->psel) 
                                    & (0x28U == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__HIT11 = ((IData)(vlSelf->psel) 
                                    & (0x2cU == (IData)(vlSelf->ADDR)));
    vlSelf->NAND_top__DOT__NAND_HIT = ((IData)(vlSelf->penable) 
                                       & (0x40U == (IData)(vlSelf->ADDR)));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | ((vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                     >> 4U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelf->aresetn)));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 2U)));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0U] 
        = vlSelf->ram_rdata;
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 3U)));
    vlSelf->NAND_top__DOT__NAND_IORDY = (1U & ((0U 
                                                == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                ? (IData)(vlSelf->NAND_IORDY_i)
                                                : (
                                                   (1U 
                                                    == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                    ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0)
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                     ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0)
                                                     : 
                                                    ((3U 
                                                      != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
                                                     | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0))))));
    vlSelf->ram_wen = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb) 
                       & (- (IData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
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
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0));
    vlSelf->simu_top__DOT__soc__DOT__m0_wvalid = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
                                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0));
    vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb) 
           & (- (IData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0));
    vlSelf->simu_top__DOT__soc__DOT__m0_bready = (IData)(
                                                         ((0U 
                                                           == 
                                                           (0xcU 
                                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid))) 
                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0));
    vlSelf->simu_top__DOT__soc__DOT__m0_arvalid = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid) 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0));
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
    vlSelf->simu_top__DOT__soc__DOT__m0_rready = ((IData)(
                                                          (((0U 
                                                             == 
                                                             (0xcU 
                                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                                            & (2U 
                                                               == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) 
                                                           & ((0U 
                                                               != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                                              & (1U 
                                                                 != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))) 
                                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelf->DAT_O = vlSelf->NAND_top__DOT__REG_DAT_T;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT___GEN_71 
        = ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready))) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_del 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
              & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid 
        = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit) 
              >> 1U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid 
        = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0) 
              << 1U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit) 
              >> 2U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid 
        = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0) 
              << 2U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit) 
              >> 3U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid 
        = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0) 
              << 3U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit) 
              >> 4U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid 
        = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0) 
              << 4U));
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer 
        = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
           & (0xe000U == (0xffffU & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid 
        = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
           & (0xff10U == (0xffffU & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 1U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 2U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((8U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 3U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 4U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 1U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0) 
              << 1U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 2U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0) 
              << 2U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 3U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0) 
              << 3U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
            & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
               >> 4U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid 
        = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0) 
              << 4U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 1U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 2U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 3U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 4U));
    }
    if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid 
            = (0U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata 
            = ((0U == (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                             >> 2U))) ? vlSelf->simu_top__DOT__soc__DOT__m0_rdata
                : 0U);
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata = 0U;
    }
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
            >> 3U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_wready));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__s0_wready));
    vlSelf->write_uart_valid = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
            >> 3U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_cpu 
        = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr) 
                 | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd) 
                    | (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)) 
                       >> 2U))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                    >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)));
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
    vlSelf->ram_ren = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
                       & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_42 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid)
            ? (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                & (IData)(((0U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                           & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast))))
                ? 3U : (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
            : (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_8 
        = ((0U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_9 
        = ((1U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_10 
        = ((2U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_11 
        = ((3U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_12 
        = ((4U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_13 
        = ((5U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_14 
        = ((6U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_15 
        = ((7U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_16 
        = ((8U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_17 
        = ((9U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_18 
        = ((0xaU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_19 
        = ((0xbU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_20 
        = ((0xcU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_21 
        = ((0xdU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_22 
        = ((0xeU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_23 
        = ((0xfU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->ram_ren) & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
}

void Vsimu_top___024root___eval_ico(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vsimu_top___024root___ico_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
}

void Vsimu_top___024root___eval_triggers__ico(Vsimu_top___024root* vlSelf);

bool Vsimu_top___024root___eval_phase__ico(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vsimu_top___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        Vsimu_top___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

extern const VlUnpacked<CData/*2:0*/, 32> Vsimu_top__ConstPool__TABLE_hebd5b4eb_0;
extern const VlUnpacked<IData/*31:0*/, 32> Vsimu_top__ConstPool__TABLE_h2ba417e2_0;

VL_INLINE_OPT void Vsimu_top___024root___act_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___act_sequent__TOP__0\n"); );
    // Init
    CData/*4:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit 
        = (1U & (~ (IData)((0U != (0xfU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                                           >> 1U))))));
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
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_arbiter_io_in_1_ready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_awready) 
           & ((~ (IData)(vlSelf->enable_delay)) | (
                                                   (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                    >> 1U) 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable))));
}

void Vsimu_top___024root___eval_act(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_act\n"); );
    // Body
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        Vsimu_top___024root___act_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
    }
}

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__1(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__1\n"); );
    // Init
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
    __Vdly__NAND_top__DOT__nand_command = vlSelf->NAND_top__DOT__nand_command;
    __Vdly__NAND_top__DOT__NAND_STATE = vlSelf->NAND_top__DOT__NAND_STATE;
    __Vdly__NAND_top__DOT__READ_ID_NUM = vlSelf->NAND_top__DOT__READ_ID_NUM;
    __Vdly__NAND_top__DOT__NAND_DAT_I_WR = vlSelf->NAND_top__DOT__NAND_DAT_I_WR;
    __Vdly__NAND_top__DOT__DMA_OP_DONE = vlSelf->NAND_top__DOT__DMA_OP_DONE;
    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT = vlSelf->NAND_top__DOT__WRITE_MAX_COUNT;
    __Vdly__NAND_top__DOT__READ_MAX_COUNT = vlSelf->NAND_top__DOT__READ_MAX_COUNT;
    __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = vlSelf->NAND_top__DOT__NAND_ADDR_COUNT;
    __Vdly__NAND_top__DOT__NAND_OP_NUM = vlSelf->NAND_top__DOT__NAND_OP_NUM;
    __Vdly__NAND_top__DOT__ERASE_SERIAL = vlSelf->NAND_top__DOT__ERASE_SERIAL;
    __Vdly__NAND_top__DOT__ADDR_pointer = vlSelf->NAND_top__DOT__ADDR_pointer;
    __Vdly__NAND_top__DOT__PRE_STATE = vlSelf->NAND_top__DOT__PRE_STATE;
    __Vdly__NAND_top__DOT__HOLD_NUM = vlSelf->NAND_top__DOT__HOLD_NUM;
    __Vdly__NAND_top__DOT__WAIT_NUM = vlSelf->NAND_top__DOT__WAIT_NUM;
    __Vdly__NAND_top__DOT__NAND_GO = vlSelf->NAND_top__DOT__NAND_GO;
    __Vdly__NAND_top__DOT__NAND_DONE = vlSelf->NAND_top__DOT__NAND_DONE;
    __Vdly__NAND_top__DOT__NAND_ADDR = vlSelf->NAND_top__DOT__NAND_ADDR;
    __Vdly__NAND_top__DOT__data_count = vlSelf->NAND_top__DOT__data_count;
    __Vdly__NAND_top__DOT__COMMAND = vlSelf->NAND_top__DOT__COMMAND;
    __Vdly__NAND_top__DOT__now_oob = vlSelf->NAND_top__DOT__now_oob;
    __Vdly__NAND_top__DOT__now_up_half = vlSelf->NAND_top__DOT__now_up_half;
    __Vdly__NAND_top__DOT__NAND_DMA_REQ = vlSelf->NAND_top__DOT__NAND_DMA_REQ;
    __Vdly__NAND_top__DOT__status = vlSelf->NAND_top__DOT__status;
    __Vdly__NAND_top__DOT__NAND_CE_ = vlSelf->NAND_top__DOT__NAND_CE_;
    if ((1U & ((~ (IData)(vlSelf->prst_)) | (~ (IData)(vlSelf->NAND_top__DOT__NANDtag))))) {
        vlSelf->NAND_top__DOT__NAND_ACK = 0U;
        __Vdly__NAND_top__DOT__now_up_half = 0U;
        __Vdly__NAND_top__DOT__now_oob = 0U;
        vlSelf->NAND_CLE = 0U;
        vlSelf->NAND_ALE = 0U;
        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
        vlSelf->NAND_WR_ = 1U;
        vlSelf->NAND_RD_ = 1U;
        vlSelf->NAND_O = 0U;
        __Vdly__NAND_top__DOT__COMMAND = 0x55U;
        __Vdly__NAND_top__DOT__data_count = 0U;
        __Vdly__NAND_top__DOT__NAND_ADDR = 0ULL;
        __Vdly__NAND_top__DOT__NAND_DONE = 0U;
        __Vdly__NAND_top__DOT__NAND_GO = 0U;
        if ((1U & (~ (IData)(vlSelf->prst_)))) {
            __Vdly__NAND_top__DOT__status = 0U;
            vlSelf->NAND_top__DOT__ID_INFORM = 0ULL;
        }
        __Vdly__NAND_top__DOT__WAIT_NUM = 0x14U;
        __Vdly__NAND_top__DOT__HOLD_NUM = 4U;
        __Vdly__NAND_top__DOT__PRE_STATE = 0U;
        __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
        __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        __Vdly__NAND_top__DOT__ERASE_SERIAL = 0U;
        __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
        vlSelf->NAND_EN_ = 0U;
        __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = 0U;
        __Vdly__NAND_top__DOT__READ_MAX_COUNT = 0U;
        __Vdly__NAND_top__DOT__WRITE_MAX_COUNT = 0U;
        __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
        __Vdly__NAND_top__DOT__NAND_DAT_I_WR = 0U;
        vlSelf->NAND_top__DOT__NAND_DAT_O_RD = 0x12345678U;
        __Vdly__NAND_top__DOT__READ_ID_NUM = 4U;
        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
    } else if ((0x10U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
        if ((8U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((4U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
            } else if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                    if (vlSelf->NAND_top__DOT__NAND_IORDY) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x1bU;
                        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                        __Vdly__NAND_top__DOT__NAND_GO = 0U;
                    } else {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x1bU;
                    }
                } else if (vlSelf->NAND_top__DOT__NAND_IORDY) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x1aU;
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x1bU;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x1aU;
                }
            } else if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            } else if (vlSelf->NAND_top__DOT__NAND_IORDY) {
                if ((((IData)(vlSelf->NAND_top__DOT__NAND_IORDY) 
                      & (1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) 
                     & (0x60U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x17U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                } else if (((IData)(vlSelf->NAND_top__DOT__NAND_IORDY) 
                            & (0xd0U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_OP_NUM 
                        = (vlSelf->NAND_top__DOT__NAND_OP_NUM 
                           - (IData)(1U));
                    __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                    __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                } else if ((((IData)(vlSelf->NAND_top__DOT__NAND_IORDY) 
                             & (1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) 
                            & (0x70U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelf->NAND_CLE = 0U;
                    vlSelf->NAND_ALE = 0U;
                    vlSelf->NAND_WR_ = 1U;
                    vlSelf->NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(3U) + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                    vlSelf->NAND_EN_ = 1U;
                } else if (((IData)(vlSelf->NAND_top__DOT__NAND_IORDY) 
                            & (0x15U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)))) {
                    if ((1U & ((~ (IData)(vlSelf->NAND_top__DOT__status)) 
                               & ((0U == vlSelf->NAND_top__DOT__NAND_OP_NUM) 
                                  | (~ (IData)(vlSelf->NAND_top__DOT__ERASE_SERIAL)))))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                        __Vdly__NAND_top__DOT__NAND_ADDR = 0ULL;
                        __Vdly__NAND_top__DOT__ERASE_SERIAL = 0U;
                    } else if (((~ (IData)(vlSelf->NAND_top__DOT__status)) 
                                & (0U != vlSelf->NAND_top__DOT__NAND_OP_NUM))) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x800U & vlSelf->NAND_top__DOT__nand_parameter)
                                ? ((0x3ff0003fffULL 
                                    & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                   | ((QData)((IData)(
                                                      (0x3fffU 
                                                       & ((IData)(1U) 
                                                          + (IData)(
                                                                    (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                     >> 0xeU)))))) 
                                      << 0xeU)) : (
                                                   (((1U 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->NAND_top__DOT__nand_parameter 
                                                          >> 8U))) 
                                                     | (2U 
                                                        == 
                                                        (0xfU 
                                                         & (vlSelf->NAND_top__DOT__nand_parameter 
                                                            >> 8U)))) 
                                                    | (3U 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? 
                                                   ((0x30003fffffULL 
                                                     & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                                    | ((QData)((IData)(
                                                                       (0x3fffU 
                                                                        & ((IData)(1U) 
                                                                           + (IData)(
                                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x16U)))))) 
                                                       << 0x16U))
                                                    : 
                                                   ((4U 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U)))
                                                     ? 
                                                    ((0x3c003fffffULL 
                                                      & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                                     | ((QData)((IData)(
                                                                        (0xfffU 
                                                                         & ((IData)(1U) 
                                                                            + (IData)(
                                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x16U)))))) 
                                                        << 0x16U))
                                                     : 
                                                    ((5U 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->NAND_top__DOT__nand_parameter 
                                                          >> 8U)))
                                                      ? 
                                                     ((0x3c00ffffffULL 
                                                       & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                                      | ((QData)((IData)(
                                                                         (0x3ffU 
                                                                          & ((IData)(1U) 
                                                                             + (IData)(
                                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x18U)))))) 
                                                         << 0x18U))
                                                      : 
                                                     ((0x3001ffffffULL 
                                                       & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                                      | ((QData)((IData)(
                                                                         (0x7ffU 
                                                                          & ((IData)(1U) 
                                                                             + (IData)(
                                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                                >> 0x19U)))))) 
                                                         << 0x19U))))));
                        __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x18U;
                        __Vdly__NAND_top__DOT__COMMAND = 0x60U;
                        __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                        __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                        vlSelf->NAND_EN_ = 0U;
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
        } else if ((4U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                    if (((0xaU != (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                         & (0x60U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 0xaU;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x17U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                        __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                            = (((((9U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 8U))) 
                                  | (0xaU == (0xfU 
                                              & (vlSelf->NAND_top__DOT__nand_parameter 
                                                 >> 8U)))) 
                                 | (0xbU == (0xfU & 
                                             (vlSelf->NAND_top__DOT__nand_parameter 
                                              >> 8U)))) 
                                | (0U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 8U))))
                                ? 2U : 3U);
                    } else if (((1U != (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                                & (0x60U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                        __Vdly__NAND_top__DOT__PRE_STATE = 0x17U;
                        __Vdly__NAND_top__DOT__COMMAND = 0xd0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                    } else if (((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                                & (0xd0U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                        __Vdly__NAND_top__DOT__NAND_STATE 
                            = ((IData)(vlSelf->NAND_top__DOT__NAND_IORDY)
                                ? 0x17U : 0x18U);
                    }
                } else if ((0x15U != (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelf->NAND_CLE = 0U;
                    vlSelf->NAND_ALE = 0U;
                    vlSelf->NAND_WR_ = 1U;
                    vlSelf->NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x16U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(3U) + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                    vlSelf->NAND_EN_ = 1U;
                } else {
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_GO = 0U;
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                }
            } else if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                     >= (0xffU & ((IData)(1U) + ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                                 - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelf->NAND_RD_ = 1U;
                    vlSelf->NAND_EN_ = 1U;
                } else if (((0U != (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)) 
                            & (1U < (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelf->NAND_RD_ = 0U;
                    vlSelf->NAND_EN_ = 1U;
                } else if ((1U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    __Vdly__NAND_top__DOT__status = vlSelf->NAND_I;
                    vlSelf->NAND_RD_ = 1U;
                    vlSelf->NAND_EN_ = 1U;
                } else if ((0U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) {
                    vlSelf->NAND_RD_ = 1U;
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    __Vdly__NAND_top__DOT__NAND_STATE 
                        = vlSelf->NAND_top__DOT__PRE_STATE;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                    if ((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
                        __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    }
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x15U;
                } else {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                    vlSelf->NAND_RD_ = 1U;
                    vlSelf->NAND_EN_ = 1U;
                }
            } else if (((0xaU != (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x90U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0xaU;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                __Vdly__NAND_top__DOT__READ_ID_NUM 
                    = (7U & (vlSelf->NAND_top__DOT__nand_parameter 
                             >> 0xcU));
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT = 1U;
            } else if ((0x70U != (IData)(vlSelf->NAND_top__DOT__COMMAND))) {
                if ((0U != (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                    vlSelf->NAND_EN_ = 1U;
                    if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                         > (0xffU & (((IData)(1U) + (IData)(vlSelf->NAND_top__DOT__nand_timing)) 
                                     - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))))) {
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                        - (IData)(1U)));
                        vlSelf->NAND_RD_ = 1U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                    } else if ((1U < (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) {
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                        - (IData)(1U)));
                        vlSelf->NAND_RD_ = 0U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                    } else if ((1U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) {
                        __Vdly__NAND_top__DOT__READ_ID_NUM 
                            = (7U & ((IData)(vlSelf->NAND_top__DOT__READ_ID_NUM) 
                                     - (IData)(1U)));
                        __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                        vlSelf->NAND_RD_ = 1U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                        if ((1U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xffffffffff00ULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | (IData)((IData)(vlSelf->NAND_I)));
                        } else if ((2U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xffffffff00ffULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelf->NAND_I)) 
                                      << 8U));
                        } else if ((3U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xffffff00ffffULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelf->NAND_I)) 
                                      << 0x10U));
                        } else if ((4U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xffff00ffffffULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelf->NAND_I)) 
                                      << 0x18U));
                        } else if ((5U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xff00ffffffffULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelf->NAND_I)) 
                                      << 0x20U));
                        } else if ((6U == (IData)(vlSelf->NAND_top__DOT__READ_ID_NUM))) {
                            vlSelf->NAND_top__DOT__ID_INFORM 
                                = ((0xffffffffffULL 
                                    & vlSelf->NAND_top__DOT__ID_INFORM) 
                                   | ((QData)((IData)(vlSelf->NAND_I)) 
                                      << 0x28U));
                        }
                    }
                } else {
                    __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                    __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                    __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                    __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                    vlSelf->NAND_EN_ = 0U;
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x16U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x14U;
                vlSelf->NAND_EN_ = 1U;
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
            }
        } else if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            } else if (vlSelf->NAND_top__DOT__NAND_IORDY) {
                __Vdly__NAND_top__DOT__PRE_STATE = 0x12U;
                __Vdly__NAND_top__DOT__NAND_STATE = 0x11U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x12U;
            }
        } else if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if (((IData)(vlSelf->NAND_top__DOT__data_count) 
                 != (IData)(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT))) {
                if ((1U & ((~ (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE)) 
                           & (~ (IData)(vlSelf->NAND_top__DOT__NAND_HIT))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if ((((((IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE) 
                               & (~ (IData)(vlSelf->NAND_top__DOT__NAND_HIT))) 
                              & (3U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) 
                             & (2U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) 
                            & ((IData)(vlSelf->NAND_top__DOT__data_count) 
                               < (0x3fffU & ((IData)(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT) 
                                             - (IData)(4U)))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if (((IData)(vlSelf->NAND_top__DOT__NAND_DMA_REQ) 
                            & (IData)(vlSelf->NAND_top__DOT__NAND_HIT))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                    __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                    __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_DAT_I_WR 
                        = vlSelf->DAT_I;
                }
                if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                      > (0xffU & ((IData)(1U) + ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                                 - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))))) 
                     & ((IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE) 
                        | (IData)(vlSelf->NAND_top__DOT__NAND_HIT)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_WR_ = 1U;
                } else if (((1U < (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)) 
                            & (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_WR_ = 0U;
                    if ((0U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                        vlSelf->NAND_O = (0xffU & vlSelf->NAND_top__DOT__NAND_DAT_I_WR);
                    } else if ((1U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                        vlSelf->NAND_O = (0xffU & (vlSelf->NAND_top__DOT__NAND_DAT_I_WR 
                                                   >> 8U));
                    } else if ((2U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                        vlSelf->NAND_O = (0xffU & (vlSelf->NAND_top__DOT__NAND_DAT_I_WR 
                                                   >> 0x10U));
                    } else if ((3U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                        vlSelf->NAND_O = (vlSelf->NAND_top__DOT__NAND_DAT_I_WR 
                                          >> 0x18U);
                    }
                } else if (((1U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)) 
                            & (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE))) {
                    __Vdly__NAND_top__DOT__ADDR_pointer 
                        = (3U & ((IData)(1U) + (IData)(vlSelf->NAND_top__DOT__ADDR_pointer)));
                    vlSelf->NAND_WR_ = 1U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                    if ((3U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                        __Vdly__NAND_top__DOT__NAND_OP_NUM 
                            = ((4U <= vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                ? (vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                   - (IData)(4U)) : 0U);
                        __Vdly__NAND_top__DOT__data_count 
                            = (0x3fffU & ((4U == vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           ? (IData)(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT)
                                           : ((IData)(4U) 
                                              + (IData)(vlSelf->NAND_top__DOT__data_count))));
                        __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                    }
                }
            } else if (((1U != (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x80U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__COMMAND = 0x10U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            } else if (((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x10U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((IData)(vlSelf->NAND_top__DOT__NAND_IORDY)
                      ? 0x11U : 0x12U);
            } else if (((0x12U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x10U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            } else if (((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x70U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                vlSelf->NAND_RD_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0x11U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                vlSelf->NAND_EN_ = 1U;
            } else if ((0x15U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
                if (((~ (IData)(vlSelf->NAND_top__DOT__status)) 
                     & (0U == vlSelf->NAND_top__DOT__NAND_OP_NUM))) {
                    __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                    __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                } else if ((1U & (IData)(vlSelf->NAND_top__DOT__status))) {
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
        } else if (((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                    & (0x80U != (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 0x10U;
            __Vdly__NAND_top__DOT__NAND_STATE = 1U;
            __Vdly__NAND_top__DOT__COMMAND = 0x80U;
        } else if ((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 0x10U;
            __Vdly__NAND_top__DOT__NAND_STATE = 2U;
            __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                = ((((9U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                     >> 8U))) | (0xaU 
                                                 == 
                                                 (0xfU 
                                                  & (vlSelf->NAND_top__DOT__nand_parameter 
                                                     >> 8U)))) 
                    | (0xbU == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                        >> 8U)))) ? 3U
                    : ((((0U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                         >> 8U))) | 
                         (0xcU == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                           >> 8U)))) 
                        | (0xdU == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                            >> 8U))))
                        ? 4U : 5U));
        } else if ((2U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
            __Vdly__NAND_top__DOT__data_count = 0U;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__NAND_STATE = 0x11U;
            if ((0x800U & vlSelf->NAND_top__DOT__nand_parameter)) {
                if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    if ((1U & (~ (vlSelf->NAND_top__DOT__nand_parameter 
                                  >> 9U)))) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x3fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x7fffffU 
                                                   & ((IData)(
                                                              (0x200U 
                                                               == 
                                                               (0x300U 
                                                                & vlSelf->NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                            = (0x3fffU & ((IData)((
                                                   (0x300U 
                                                    == 
                                                    (0x300U 
                                                     & vlSelf->NAND_top__DOT__nand_command)) 
                                                   & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x10U) 
                                                    - 
                                                    (0xfU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x10U) 
                                                   - 
                                                   (0xfU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x100U) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x100U) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = (0x3fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x7fffffU 
                                               & ((IData)(
                                                          (0x200U 
                                                           == 
                                                           (0x300U 
                                                            & vlSelf->NAND_top__DOT__nand_command)))
                                                   ? 
                                                  ((IData)(2U) 
                                                   + (IData)(
                                                             (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                              >> 8U)))
                                                   : 
                                                  ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 8U))
                                                    : 
                                                   ((IData)(1U) 
                                                    + (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 8U)))))))) 
                              << 8U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x3fffU & ((IData)(((0x300U 
                                                == 
                                                (0x300U 
                                                 & vlSelf->NAND_top__DOT__nand_command)) 
                                               & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((IData)(0x100U) 
                                              - (0xffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((IData)(0x100U) 
                                              - (0xffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x10U) 
                                                  - 
                                                  (0xfU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x10U) 
                                                  - 
                                                  (0xfU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = (0x3fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0x7fffffU 
                                               & ((IData)(
                                                          (0x200U 
                                                           == 
                                                           (0x300U 
                                                            & vlSelf->NAND_top__DOT__nand_command)))
                                                   ? 
                                                  ((IData)(2U) 
                                                   + (IData)(
                                                             (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                              >> 8U)))
                                                   : 
                                                  ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 8U))
                                                    : 
                                                   ((IData)(1U) 
                                                    + (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 8U)))))))) 
                              << 8U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x3fffU & ((IData)(((0x300U 
                                                == 
                                                (0x300U 
                                                 & vlSelf->NAND_top__DOT__nand_command)) 
                                               & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((IData)(0x100U) 
                                              - (0xffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((IData)(0x100U) 
                                              - (0xffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x10U) 
                                                  - 
                                                  (0xfU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x10U) 
                                                  - 
                                                  (0xfU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                }
            } else if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
                if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x200U 
                                                       == 
                                                       (0x300U 
                                                        & vlSelf->NAND_top__DOT__nand_command))) 
                                              << 0xdU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0xfffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x10U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x3fffU & ((IData)((0x300U 
                                               == (0x300U 
                                                   & vlSelf->NAND_top__DOT__nand_command)))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((0x200U & vlSelf->NAND_top__DOT__nand_command)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x200U 
                                                       == 
                                                       (0x300U 
                                                        & vlSelf->NAND_top__DOT__nand_command))) 
                                              << 0xdU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0xfffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x10U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x3fffU & ((IData)((0x300U 
                                               == (0x300U 
                                                   & vlSelf->NAND_top__DOT__nand_command)))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((0x200U & vlSelf->NAND_top__DOT__nand_command)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3fffffe000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x200U 
                                                       == 
                                                       (0x300U 
                                                        & vlSelf->NAND_top__DOT__nand_command))) 
                                              << 0xcU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0xfffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x10U));
                    __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                        = (0x3fffU & ((IData)((0x300U 
                                               == (0x300U 
                                                   & vlSelf->NAND_top__DOT__nand_command)))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x1fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x1fffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((0x200U & vlSelf->NAND_top__DOT__nand_command)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x7fU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x7fU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xfffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0xfffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_ADDR = 
                    ((0x3ffffff000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                     | (IData)((IData)(((IData)((0x200U 
                                                 == 
                                                 (0x300U 
                                                  & vlSelf->NAND_top__DOT__nand_command))) 
                                        << 0xbU))));
                __Vdly__NAND_top__DOT__NAND_ADDR = 
                    ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                     | ((QData)((IData)((0xfffffU & 
                                         ((IData)(1U) 
                                          + (IData)(
                                                    (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                     >> 0x10U)))))) 
                        << 0x10U));
                __Vdly__NAND_top__DOT__WRITE_MAX_COUNT 
                    = (0x3fffU & ((IData)((0x300U == 
                                           (0x300U 
                                            & vlSelf->NAND_top__DOT__nand_command)))
                                   ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                       > ((0x3fffU 
                                           & (vlSelf->NAND_top__DOT__nand_parameter 
                                              >> 0x10U)) 
                                          - (0xfffU 
                                             & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                       ? ((0x3fffU 
                                           & (vlSelf->NAND_top__DOT__nand_parameter 
                                              >> 0x10U)) 
                                          - (0xfffU 
                                             & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                       : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                   : ((0x200U & vlSelf->NAND_top__DOT__nand_command)
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x3fU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x7ffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0x7ffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
            }
        }
    } else if ((8U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
        if ((4U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        } else if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
            } else if ((0U != (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                     > (0xffU & ((IData)(1U) + ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                                - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_ALE = 0U;
                    vlSelf->NAND_WR_ = 1U;
                } else if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                            > (0xffU & ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                        - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_ALE = 1U;
                    vlSelf->NAND_WR_ = 1U;
                } else if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                            >= (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_ALE = 1U;
                    vlSelf->NAND_WR_ = 0U;
                    if ((3U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelf->NAND_O = (0xffU & (
                                                   ((0xcU 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U))) 
                                                    | (0xdU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 9U))
                                                    : (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 0x10U))));
                    } else if ((2U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelf->NAND_O = (0xffU & (
                                                   (((9U 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->NAND_top__DOT__nand_parameter 
                                                          >> 8U))) 
                                                     | (0xaU 
                                                        == 
                                                        (0xfU 
                                                         & (vlSelf->NAND_top__DOT__nand_parameter 
                                                            >> 8U)))) 
                                                    | (0xbU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 9U))
                                                    : 
                                                   (((0xcU 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->NAND_top__DOT__nand_parameter 
                                                          >> 8U))) 
                                                     | (0xdU 
                                                        == 
                                                        (0xfU 
                                                         & (vlSelf->NAND_top__DOT__nand_parameter 
                                                            >> 8U))))
                                                     ? (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x11U))
                                                     : 
                                                    ((0U 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->NAND_top__DOT__nand_parameter 
                                                          >> 8U)))
                                                      ? (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U))
                                                      : (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x18U))))));
                    } else if ((1U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                        vlSelf->NAND_O = (0xffU & (
                                                   (0x14U 
                                                    == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))
                                                    ? (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)
                                                    : 
                                                   ((((9U 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))) 
                                                      | (0xaU 
                                                         == 
                                                         (0xfU 
                                                          & (vlSelf->NAND_top__DOT__nand_parameter 
                                                             >> 8U)))) 
                                                     | (0xbU 
                                                        == 
                                                        (0xfU 
                                                         & (vlSelf->NAND_top__DOT__nand_parameter 
                                                            >> 8U))))
                                                     ? (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x11U))
                                                     : 
                                                    (((0xcU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))) 
                                                      | (0xdU 
                                                         == 
                                                         (0xfU 
                                                          & (vlSelf->NAND_top__DOT__nand_parameter 
                                                             >> 8U))))
                                                      ? (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x19U))
                                                      : 
                                                     ((0U 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U)))
                                                       ? (IData)(
                                                                 (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                  >> 0x18U))
                                                       : 
                                                      (0xfU 
                                                       & (IData)(
                                                                 (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                  >> 0x20U))))))));
                    }
                } else if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                             < (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)) 
                            & (0U != (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)))) {
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                    - (IData)(1U)));
                    vlSelf->NAND_ALE = 1U;
                    vlSelf->NAND_WR_ = 1U;
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                        = (7U & ((IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT) 
                                 - (IData)(1U)));
                    vlSelf->NAND_ALE = 0U;
                    vlSelf->NAND_WR_ = 1U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & ((IData)(2U) + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                }
            } else {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                vlSelf->NAND_RD_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = vlSelf->NAND_top__DOT__PRE_STATE;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
                __Vdly__NAND_top__DOT__PRE_STATE = 0xaU;
            }
        } else {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        }
    } else if ((4U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
        if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
                if (vlSelf->NAND_top__DOT__NAND_IORDY) {
                    if ((((IData)(vlSelf->NAND_top__DOT__data_count) 
                          != (IData)(vlSelf->NAND_top__DOT__READ_MAX_COUNT)) 
                         & (~ (IData)(vlSelf->NAND_top__DOT__NAND_CE_)))) {
                        if ((1U & (((~ (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE)) 
                                    | ((((IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE) 
                                         & (3U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) 
                                        & (2U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM))) 
                                       & ((IData)(vlSelf->NAND_top__DOT__data_count) 
                                          < (0x3fffU 
                                             & ((IData)(vlSelf->NAND_top__DOT__READ_MAX_COUNT) 
                                                - (IData)(4U)))))) 
                                   & (~ (IData)(vlSelf->NAND_top__DOT__NAND_HIT))))) {
                            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                        } else if (((IData)(vlSelf->NAND_top__DOT__NAND_HIT) 
                                    & (IData)(vlSelf->NAND_top__DOT__NAND_DMA_REQ))) {
                            if (((IData)(vlSelf->NAND_top__DOT__data_count) 
                                 == (0x3fffU & ((IData)(vlSelf->NAND_top__DOT__READ_MAX_COUNT) 
                                                - (IData)(1U))))) {
                                __Vdly__NAND_top__DOT__data_count 
                                    = vlSelf->NAND_top__DOT__READ_MAX_COUNT;
                            }
                            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                            __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                        }
                        if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                              > (0xffU & ((IData)(1U) 
                                          + ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                             - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))))) 
                             & ((IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE) 
                                | (IData)(vlSelf->NAND_top__DOT__NAND_HIT)))) {
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                            - (IData)(1U)));
                            vlSelf->NAND_RD_ = 1U;
                        } else if (((1U < (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)) 
                                    & ((IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE) 
                                       & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DMA_REQ))))) {
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0xffU & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                            - (IData)(1U)));
                            vlSelf->NAND_RD_ = 0U;
                        } else if (((1U == (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)) 
                                    & (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE))) {
                            __Vdly__NAND_top__DOT__ADDR_pointer 
                                = (3U & ((IData)(1U) 
                                         + (IData)(vlSelf->NAND_top__DOT__ADDR_pointer)));
                            if (((IData)(vlSelf->NAND_top__DOT__data_count) 
                                 != (0x3fffU & ((IData)(vlSelf->NAND_top__DOT__READ_MAX_COUNT) 
                                                - (IData)(1U))))) {
                                __Vdly__NAND_top__DOT__data_count 
                                    = (0x3fffU & ((IData)(1U) 
                                                  + (IData)(vlSelf->NAND_top__DOT__data_count)));
                            }
                            if ((0U != vlSelf->NAND_top__DOT__NAND_OP_NUM)) {
                                __Vdly__NAND_top__DOT__NAND_OP_NUM 
                                    = (vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                       - (IData)(1U));
                            }
                            vlSelf->NAND_RD_ = 1U;
                            __Vdly__NAND_top__DOT__WAIT_NUM 
                                = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                            if ((0U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                                vlSelf->NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xffffff00U 
                                        & vlSelf->NAND_top__DOT__NAND_DAT_O_RD) 
                                       | (IData)(vlSelf->NAND_I));
                            } else if ((1U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                                vlSelf->NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xffff00ffU 
                                        & vlSelf->NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelf->NAND_I) 
                                          << 8U));
                            } else if ((2U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                                vlSelf->NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xff00ffffU 
                                        & vlSelf->NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelf->NAND_I) 
                                          << 0x10U));
                            } else if ((3U == (IData)(vlSelf->NAND_top__DOT__ADDR_pointer))) {
                                vlSelf->NAND_top__DOT__NAND_DAT_O_RD 
                                    = ((0xffffffU & vlSelf->NAND_top__DOT__NAND_DAT_O_RD) 
                                       | ((IData)(vlSelf->NAND_I) 
                                          << 0x18U));
                                __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
                            }
                        }
                    } else {
                        __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                        __Vdly__NAND_top__DOT__data_count = 0U;
                        __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                        __Vdly__NAND_top__DOT__WAIT_NUM 
                            = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                        if ((0U == vlSelf->NAND_top__DOT__NAND_OP_NUM)) {
                            __Vdly__NAND_top__DOT__NAND_GO = 0U;
                            __Vdly__NAND_top__DOT__NAND_DONE = 1U;
                            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                        } else {
                            __Vdly__NAND_top__DOT__NAND_GO = 1U;
                            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                        }
                    }
                } else if ((1U & ((~ (IData)(vlSelf->NAND_top__DOT__DMA_OP_DONE)) 
                                  & (~ (IData)(vlSelf->NAND_top__DOT__NAND_HIT))))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 1U;
                } else if (((IData)(vlSelf->NAND_top__DOT__NAND_DMA_REQ) 
                            & (IData)(vlSelf->NAND_top__DOT__NAND_HIT))) {
                    __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
                    __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                    __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                    __Vdly__NAND_top__DOT__WAIT_NUM 
                        = (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                }
            } else {
                __Vdly__NAND_top__DOT__data_count = 0U;
                __Vdly__NAND_top__DOT__ADDR_pointer = 0U;
                vlSelf->NAND_EN_ = 1U;
                __Vdly__NAND_top__DOT__DMA_OP_DONE = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 7U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                if ((0x800U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
                        if ((1U & (~ (vlSelf->NAND_top__DOT__nand_parameter 
                                      >> 9U)))) {
                            __Vdly__NAND_top__DOT__NAND_ADDR 
                                = (0x3fffffff00ULL 
                                   & __Vdly__NAND_top__DOT__NAND_ADDR);
                            __Vdly__NAND_top__DOT__NAND_ADDR 
                                = ((0x3f800000ffULL 
                                    & __Vdly__NAND_top__DOT__NAND_ADDR) 
                                   | ((QData)((IData)(
                                                      (0x7fffffU 
                                                       & ((IData)(
                                                                  (0x200U 
                                                                   == 
                                                                   (0x300U 
                                                                    & vlSelf->NAND_top__DOT__nand_command)))
                                                           ? 
                                                          ((IData)(2U) 
                                                           + (IData)(
                                                                     (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                      >> 8U)))
                                                           : 
                                                          ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                            ? (IData)(
                                                                      (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                       >> 8U))
                                                            : 
                                                           ((IData)(1U) 
                                                            + (IData)(
                                                                      (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                       >> 8U)))))))) 
                                      << 8U));
                            __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                                = (0x3fffU & ((IData)(
                                                      ((0x300U 
                                                        == 
                                                        (0x300U 
                                                         & vlSelf->NAND_top__DOT__nand_command)) 
                                                       & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x100U) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x100U) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                                   ? 
                                                  ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x10U) 
                                                     - 
                                                     (0xfU 
                                                      & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x10U) 
                                                    - 
                                                    (0xfU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                                   : 
                                                  ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                    > 
                                                    ((IData)(0x100U) 
                                                     - 
                                                     (0xffU 
                                                      & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                    ? 
                                                   ((IData)(0x100U) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                    : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                        }
                    } else if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x3fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x7fffffU 
                                                   & ((IData)(
                                                              (0x200U 
                                                               == 
                                                               (0x300U 
                                                                & vlSelf->NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x3fffU & ((IData)((
                                                   (0x300U 
                                                    == 
                                                    (0x300U 
                                                     & vlSelf->NAND_top__DOT__nand_command)) 
                                                   & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x10U) 
                                                    - 
                                                    (0xfU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x10U) 
                                                   - 
                                                   (0xfU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x100U) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x100U) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = (0x3fffffff00ULL & __Vdly__NAND_top__DOT__NAND_ADDR);
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3f800000ffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0x7fffffU 
                                                   & ((IData)(
                                                              (0x200U 
                                                               == 
                                                               (0x300U 
                                                                & vlSelf->NAND_top__DOT__nand_command)))
                                                       ? 
                                                      ((IData)(2U) 
                                                       + (IData)(
                                                                 (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                  >> 8U)))
                                                       : 
                                                      ((IData)(vlSelf->NAND_top__DOT__now_up_half)
                                                        ? (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U))
                                                        : 
                                                       ((IData)(1U) 
                                                        + (IData)(
                                                                  (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                   >> 8U)))))))) 
                                  << 8U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x3fffU & ((IData)((
                                                   (0x300U 
                                                    == 
                                                    (0x300U 
                                                     & vlSelf->NAND_top__DOT__nand_command)) 
                                                   & (~ (IData)(vlSelf->NAND_top__DOT__now_oob))))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((IData)(0x100U) 
                                                  - 
                                                  (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((IData)(vlSelf->NAND_top__DOT__now_oob)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x10U) 
                                                    - 
                                                    (0xfU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x10U) 
                                                   - 
                                                   (0xfU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((IData)(0x100U) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((IData)(0x100U) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x200U 
                                                           == 
                                                           (0x300U 
                                                            & vlSelf->NAND_top__DOT__nand_command))) 
                                                  << 0xdU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0xfffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x10U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x3fffU & ((IData)((0x300U 
                                                   == 
                                                   (0x300U 
                                                    & vlSelf->NAND_top__DOT__nand_command)))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x200U 
                                               & vlSelf->NAND_top__DOT__nand_command)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0x1fffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0x1fffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3fffffc000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x200U 
                                                           == 
                                                           (0x300U 
                                                            & vlSelf->NAND_top__DOT__nand_command))) 
                                                  << 0xdU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0xfffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x10U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x3fffU & ((IData)((0x300U 
                                                   == 
                                                   (0x300U 
                                                    & vlSelf->NAND_top__DOT__nand_command)))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x200U 
                                               & vlSelf->NAND_top__DOT__nand_command)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0xffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0xffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0x1fffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0x1fffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    } else {
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x3fffffe000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | (IData)((IData)(((IData)(
                                                          (0x200U 
                                                           == 
                                                           (0x300U 
                                                            & vlSelf->NAND_top__DOT__nand_command))) 
                                                  << 0xcU))));
                        __Vdly__NAND_top__DOT__NAND_ADDR 
                            = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                               | ((QData)((IData)((0xfffffU 
                                                   & ((IData)(1U) 
                                                      + (IData)(
                                                                (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                 >> 0x10U)))))) 
                                  << 0x10U));
                        __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                            = (0x3fffU & ((IData)((0x300U 
                                                   == 
                                                   (0x300U 
                                                    & vlSelf->NAND_top__DOT__nand_command)))
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x1fffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((0x200U 
                                               & vlSelf->NAND_top__DOT__nand_command)
                                               ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0x7fU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0x7fU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                               : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                                   > 
                                                   ((0x3fffU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 0x10U)) 
                                                    - 
                                                    (0xfffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                                   ? 
                                                  ((0x3fffU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 0x10U)) 
                                                   - 
                                                   (0xfffU 
                                                    & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                                   : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                    }
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x3ffffff000ULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | (IData)((IData)(((IData)(
                                                      (0x200U 
                                                       == 
                                                       (0x300U 
                                                        & vlSelf->NAND_top__DOT__nand_command))) 
                                              << 0xbU))));
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = ((0x300000ffffULL & __Vdly__NAND_top__DOT__NAND_ADDR) 
                           | ((QData)((IData)((0xfffffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                             >> 0x10U)))))) 
                              << 0x10U));
                    __Vdly__NAND_top__DOT__READ_MAX_COUNT 
                        = (0x3fffU & ((IData)((0x300U 
                                               == (0x300U 
                                                   & vlSelf->NAND_top__DOT__nand_command)))
                                       ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                           > ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0xfffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                           ? ((0x3fffU 
                                               & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 0x10U)) 
                                              - (0xfffU 
                                                 & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                           : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                       : ((0x200U & vlSelf->NAND_top__DOT__nand_command)
                                           ? ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x3fU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM)
                                           : ((vlSelf->NAND_top__DOT__NAND_OP_NUM 
                                               > ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x7ffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR))))
                                               ? ((0x3fffU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 0x10U)) 
                                                  - 
                                                  (0x7ffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)))
                                               : vlSelf->NAND_top__DOT__NAND_OP_NUM))));
                }
            }
        } else if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__NAND_DMA_REQ = 0U;
        } else if (vlSelf->NAND_top__DOT__NAND_IORDY) {
            vlSelf->NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = 6U;
        } else {
            __Vdly__NAND_top__DOT__NAND_STATE = 4U;
        }
    } else if ((2U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
        if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
            if ((((1U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                  & (0x30U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                 | ((2U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                    & (vlSelf->NAND_top__DOT__nand_parameter 
                       >> 0xbU)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((IData)(vlSelf->NAND_top__DOT__NAND_IORDY)
                      ? 3U : 4U);
            } else if (((2U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE)) 
                        & (0x30U != (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__PRE_STATE = 3U;
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__COMMAND = 0x30U;
            } else {
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__PRE_STATE = 3U;
                __Vdly__NAND_top__DOT__NAND_STATE = 2U;
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                    = ((((9U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                         >> 8U))) | 
                         (0xaU == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                           >> 8U)))) 
                        | (0xbU == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                            >> 8U))))
                        ? 3U : ((((0U == (0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                                  >> 8U))) 
                                  | (0xcU == (0xfU 
                                              & (vlSelf->NAND_top__DOT__nand_parameter 
                                                 >> 8U)))) 
                                 | (0xdU == (0xfU & 
                                             (vlSelf->NAND_top__DOT__nand_parameter 
                                              >> 8U))))
                                 ? 4U : 5U));
            }
        } else if ((0U != (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
            if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                 > (0xffU & ((IData)(1U) + ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                            - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)))))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
            } else if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                        > (0xffU & ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                    - (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelf->NAND_ALE = 1U;
                vlSelf->NAND_WR_ = 1U;
            } else if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                        >= (IData)(vlSelf->NAND_top__DOT__HOLD_NUM))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelf->NAND_ALE = 1U;
                vlSelf->NAND_WR_ = 0U;
                if ((5U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelf->NAND_O = (0xffU & (IData)(vlSelf->NAND_top__DOT__NAND_ADDR));
                } else if ((4U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelf->NAND_O = (0xffU & (((0xcU 
                                                 == 
                                                 (0xfU 
                                                  & (vlSelf->NAND_top__DOT__nand_parameter 
                                                     >> 8U))) 
                                                | (0xdU 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)
                                                : (
                                                   (0U 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 8U)))
                                                    ? (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)
                                                    : (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 8U)))));
                } else if ((3U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelf->NAND_O = (0xffU & ((((9U 
                                                  == 
                                                  (0xfU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 8U))) 
                                                 | (0xaU 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 8U)))) 
                                                | (0xbU 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(vlSelf->NAND_top__DOT__NAND_ADDR)
                                                : (
                                                   ((0xcU 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U))) 
                                                    | (0xdU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 9U))
                                                    : 
                                                   ((0U 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U)))
                                                     ? (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 8U))
                                                     : (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x10U))))));
                } else if ((2U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelf->NAND_O = (0xffU & ((((9U 
                                                  == 
                                                  (0xfU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 8U))) 
                                                 | (0xaU 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 8U)))) 
                                                | (0xbU 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                           >> 9U))
                                                : (
                                                   ((0xcU 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U))) 
                                                    | (0xdU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 0x11U))
                                                    : 
                                                   ((0U 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U)))
                                                     ? (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x10U))
                                                     : (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x18U))))));
                } else if ((1U == (IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT))) {
                    vlSelf->NAND_O = (0xffU & ((((9U 
                                                  == 
                                                  (0xfU 
                                                   & (vlSelf->NAND_top__DOT__nand_parameter 
                                                      >> 8U))) 
                                                 | (0xaU 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->NAND_top__DOT__nand_parameter 
                                                        >> 8U)))) 
                                                | (0xbU 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->NAND_top__DOT__nand_parameter 
                                                       >> 8U))))
                                                ? (IData)(
                                                          (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                           >> 0x11U))
                                                : (
                                                   ((0xcU 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U))) 
                                                    | (0xdU 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->NAND_top__DOT__nand_parameter 
                                                           >> 8U))))
                                                    ? (IData)(
                                                              (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                               >> 0x19U))
                                                    : 
                                                   ((0U 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->NAND_top__DOT__nand_parameter 
                                                         >> 8U)))
                                                     ? (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x18U))
                                                     : 
                                                    (0x3fU 
                                                     & (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 0x20U)))))));
                }
            } else if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                         < (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)) 
                        & (0U != (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)))) {
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                      - (IData)(1U)));
                vlSelf->NAND_ALE = 1U;
                vlSelf->NAND_WR_ = 1U;
            } else {
                __Vdly__NAND_top__DOT__NAND_ADDR_COUNT 
                    = (7U & ((IData)(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT) 
                             - (IData)(1U)));
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(2U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            }
        } else {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_WR_ = 1U;
            vlSelf->NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = vlSelf->NAND_top__DOT__PRE_STATE;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & ((IData)(1U) 
                                                  + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            __Vdly__NAND_top__DOT__PRE_STATE = 2U;
        }
    } else if ((1U & (IData)(vlSelf->NAND_top__DOT__NAND_STATE))) {
        if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
             == (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_WR_ = 1U;
        } else if (((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                    == ((0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing)) 
                        - (IData)(1U)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelf->NAND_CLE = 1U;
            vlSelf->NAND_WR_ = 1U;
        } else if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                     < (0xffU & (IData)(vlSelf->NAND_top__DOT__nand_timing))) 
                    & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                       > (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelf->NAND_O = vlSelf->NAND_top__DOT__COMMAND;
            vlSelf->NAND_CLE = 1U;
            vlSelf->NAND_WR_ = 0U;
        } else if ((((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                     <= (IData)(vlSelf->NAND_top__DOT__HOLD_NUM)) 
                    & (0U != (IData)(vlSelf->NAND_top__DOT__WAIT_NUM)))) {
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & ((IData)(vlSelf->NAND_top__DOT__WAIT_NUM) 
                                                  - (IData)(1U)));
            vlSelf->NAND_CLE = 1U;
            vlSelf->NAND_WR_ = 1U;
        } else if ((0U == (IData)(vlSelf->NAND_top__DOT__PRE_STATE))) {
            __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_WR_ = 1U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_O = 0U;
            __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            __Vdly__NAND_top__DOT__PRE_STATE = 1U;
            if (((IData)((0U != (6U & vlSelf->NAND_top__DOT__nand_command))) 
                 & (((0U == (IData)(vlSelf->NAND_top__DOT__COMMAND)) 
                     | (1U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                    | (0x50U == (IData)(vlSelf->NAND_top__DOT__COMMAND))))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 
                    ((2U & vlSelf->NAND_top__DOT__nand_command)
                      ? 3U : 0x10U);
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            } else if (((vlSelf->NAND_top__DOT__nand_command 
                         >> 2U) & (0x80U == (IData)(vlSelf->NAND_top__DOT__COMMAND)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x10U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            } else if ((0x60U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x17U;
                __Vdly__NAND_top__DOT__PRE_STATE = 1U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            } else if ((0x70U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x15U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            } else if ((0x90U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x14U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            } else if ((0xffU == (IData)(vlSelf->NAND_top__DOT__COMMAND))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 0x1aU;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelf->NAND_top__DOT__nand_timing)));
            } else {
                __Vdly__NAND_top__DOT__NAND_STATE = 0U;
                __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
                __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
                __Vdly__NAND_top__DOT__NAND_DONE = 1U;
            }
        } else {
            vlSelf->NAND_CLE = 0U;
            vlSelf->NAND_ALE = 0U;
            vlSelf->NAND_WR_ = 1U;
            __Vdly__NAND_top__DOT__NAND_GO = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = vlSelf->NAND_top__DOT__PRE_STATE;
            __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                               & (IData)(vlSelf->NAND_top__DOT__nand_timing));
            __Vdly__NAND_top__DOT__PRE_STATE = 1U;
        }
    } else {
        __Vdly__NAND_top__DOT__HOLD_NUM = (0xffU & 
                                           ((IData)(vlSelf->NAND_top__DOT__nand_timing) 
                                            >> 8U));
        if ((1U & vlSelf->NAND_top__DOT__nand_command)) {
            if (vlSelf->NAND_top__DOT__nand_clr_ack) {
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            }
            if ((0U == vlSelf->NAND_top__DOT__NAND_OP_NUM)) {
                __Vdly__NAND_top__DOT__NAND_ADDR = vlSelf->NAND_top__DOT__addr_in_die;
                __Vdly__NAND_top__DOT__NAND_OP_NUM 
                    = vlSelf->NAND_top__DOT__nand_op_num;
            }
            __Vdly__NAND_top__DOT__DMA_OP_DONE = 0U;
            if ((IData)((((((0x202U == (0x202U & vlSelf->NAND_top__DOT__nand_command)) 
                            & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                           & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE))) 
                          & (vlSelf->NAND_top__DOT__nand_parameter 
                             >> 0xbU)) & ((~ (vlSelf->NAND_top__DOT__nand_command 
                                              >> 8U)) 
                                          | (((vlSelf->NAND_top__DOT__nand_command 
                                               >> 8U) 
                                              & (IData)(
                                                        (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                         >> 8U))) 
                                             & (IData)(vlSelf->NAND_top__DOT__now_up_half)))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x50U;
                vlSelf->NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 1U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((((vlSelf->NAND_top__DOT__nand_command 
                            >> 1U) & (IData)((vlSelf->NAND_top__DOT__NAND_ADDR 
                                              >> 8U))) 
                          & (vlSelf->NAND_top__DOT__nand_parameter 
                             >> 0xbU)) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 1U;
                vlSelf->NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half 
                    = (IData)((0x300U == (0x300U & vlSelf->NAND_top__DOT__nand_command)));
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 1U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0U;
                vlSelf->NAND_EN_ = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((IData)((((((0x204U == (0x204U 
                                               & vlSelf->NAND_top__DOT__nand_command)) 
                                   & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                                  & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE))) 
                                 & (vlSelf->NAND_top__DOT__nand_parameter 
                                    >> 0xbU)) & ((~ 
                                                  (vlSelf->NAND_top__DOT__nand_command 
                                                   >> 8U)) 
                                                 | (((vlSelf->NAND_top__DOT__nand_command 
                                                      >> 8U) 
                                                     & (IData)(
                                                               (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                                >> 8U))) 
                                                    & (IData)(vlSelf->NAND_top__DOT__now_up_half)))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x50U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 1U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((((vlSelf->NAND_top__DOT__nand_command 
                            >> 2U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                          & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE))) 
                         & (vlSelf->NAND_top__DOT__nand_parameter 
                            >> 0xbU)) & (IData)((vlSelf->NAND_top__DOT__NAND_ADDR 
                                                 >> 8U)))) {
                __Vdly__NAND_top__DOT__COMMAND = 1U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half 
                    = (IData)((0x300U == (0x300U & vlSelf->NAND_top__DOT__nand_command)));
            } else if ((((((vlSelf->NAND_top__DOT__nand_command 
                            >> 2U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                          & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE))) 
                         & (vlSelf->NAND_top__DOT__nand_parameter 
                            >> 0xbU)) & (~ (IData)(
                                                   (vlSelf->NAND_top__DOT__NAND_ADDR 
                                                    >> 8U))))) {
                __Vdly__NAND_top__DOT__COMMAND = 0U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__now_oob = 0U;
                __Vdly__NAND_top__DOT__now_up_half = 0U;
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 2U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x80U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 3U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x60U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
                __Vdly__NAND_top__DOT__ERASE_SERIAL 
                    = (1U & (vlSelf->NAND_top__DOT__nand_command 
                             >> 4U));
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 5U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x90U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 6U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0xffU;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((vlSelf->NAND_top__DOT__nand_command 
                          >> 7U) & (IData)(vlSelf->NAND_top__DOT__NAND_GO)) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__COMMAND = 0x70U;
                __Vdly__NAND_top__DOT__NAND_GO = 0U;
            } else if ((((((((((0U == (IData)(vlSelf->NAND_top__DOT__COMMAND)) 
                               | (0x70U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                              | (0x80U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                             | (1U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                            | (0x50U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                           | (0x60U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                          | (0x90U == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                         | (0xffU == (IData)(vlSelf->NAND_top__DOT__COMMAND))) 
                        & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                __Vdly__NAND_top__DOT__NAND_STATE = 1U;
                __Vdly__NAND_top__DOT__PRE_STATE = 0U;
                __Vdly__NAND_top__DOT__WAIT_NUM = (0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing));
                __Vdly__NAND_top__DOT__NAND_CE_ = 0U;
                vlSelf->NAND_CLE = 0U;
                vlSelf->NAND_ALE = 0U;
                vlSelf->NAND_WR_ = 1U;
                vlSelf->NAND_RD_ = 1U;
                vlSelf->NAND_EN_ = 0U;
            } else {
                __Vdly__NAND_top__DOT__COMMAND = 0x55U;
                __Vdly__NAND_top__DOT__NAND_GO = (1U 
                                                  & ((~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)) 
                                                     & vlSelf->NAND_top__DOT__nand_command));
                if ((1U & (~ vlSelf->NAND_top__DOT__nand_command))) {
                    __Vdly__NAND_top__DOT__NAND_DONE = 0U;
                }
            }
        } else {
            if (vlSelf->NAND_top__DOT__nand_clr_ack) {
                __Vdly__NAND_top__DOT__NAND_DONE = 0U;
            }
            __Vdly__NAND_top__DOT__COMMAND = 0x55U;
            __Vdly__NAND_top__DOT__NAND_CE_ = 1U;
            vlSelf->NAND_WR_ = 1U;
            vlSelf->NAND_RD_ = 1U;
            __Vdly__NAND_top__DOT__NAND_STATE = 0U;
            if ((1U & (~ (IData)(vlSelf->NAND_top__DOT__NAND_GO)))) {
                if ((1U & vlSelf->NAND_top__DOT__nand_command)) {
                    __Vdly__NAND_top__DOT__NAND_ADDR 
                        = vlSelf->NAND_top__DOT__addr_in_die;
                    __Vdly__NAND_top__DOT__NAND_OP_NUM 
                        = vlSelf->NAND_top__DOT__nand_op_num;
                } else {
                    __Vdly__NAND_top__DOT__NAND_ADDR = 0x3fffffffffULL;
                    __Vdly__NAND_top__DOT__NAND_OP_NUM = 0U;
                }
            }
            __Vdly__NAND_top__DOT__NAND_GO = (1U & 
                                              ((~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)) 
                                               & vlSelf->NAND_top__DOT__nand_command));
        }
    }
    vlSelf->nand_int = ((IData)(vlSelf->prst_) && ((IData)(vlSelf->NAND_top__DOT__NAND_DONE) 
                                                   & (vlSelf->NAND_top__DOT__nand_command 
                                                      >> 0xdU)));
    if (vlSelf->prst_) {
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT10))) {
            vlSelf->NAND_top__DOT__nand_rdy_map0 = vlSelf->DAT_I;
        }
        vlSelf->NAND_top__DOT__nand_rdy_map1 = (((IData)(vlSelf->pwrite) 
                                                 & (IData)(vlSelf->NAND_top__DOT__HIT11))
                                                 ? vlSelf->DAT_I
                                                 : 
                                                (((IData)(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT) 
                                                  << 0x10U) 
                                                 | (0xffffU 
                                                    & vlSelf->NAND_top__DOT__NAND_OP_NUM)));
        vlSelf->NAND_top__DOT__nand_ce_map1 = (((IData)(vlSelf->pwrite) 
                                                & (IData)(vlSelf->NAND_top__DOT__HIT9))
                                                ? vlSelf->DAT_I
                                                : (
                                                   ((IData)(vlSelf->NAND_top__DOT__READ_MAX_COUNT) 
                                                    << 0x10U) 
                                                   | (0xffffU 
                                                      & vlSelf->NAND_top__DOT__NAND_OP_NUM)));
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT8))) {
            vlSelf->NAND_top__DOT__nand_ce_map0 = vlSelf->DAT_I;
        }
        if ((0x800U & vlSelf->NAND_top__DOT__nand_parameter)) {
            if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
                if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & 0U);
                    vlSelf->NAND_top__DOT__addr_in_die = 0ULL;
                } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0x12U));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x3ffffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x1ffU 
                                                      & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
                } else {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0x11U));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x1ffffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x1ffU 
                                                      & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
                }
            } else if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0x10U));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0xffffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x1ffU 
                                                      & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
                } else {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0xfU));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x7fffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 9U) | (QData)((IData)(
                                                     (0x1ffU 
                                                      & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
                }
            } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                             >> 0xeU));
                vlSelf->NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x3fffU & vlSelf->NAND_top__DOT__nand_addr_r))) 
                        << 9U) | (QData)((IData)((0x1ffU 
                                                  & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
            } else {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & 0U);
                vlSelf->NAND_top__DOT__addr_in_die = 0ULL;
            }
        } else if ((0x400U & vlSelf->NAND_top__DOT__nand_parameter)) {
            if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
                if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0x15U));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0x1fffffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 0x10U) | (QData)((IData)(vlSelf->NAND_top__DOT__nand_addr_c)));
                } else {
                    vlSelf->NAND_top__DOT__nand_number 
                        = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                                 >> 0x14U));
                    vlSelf->NAND_top__DOT__addr_in_die 
                        = (((QData)((IData)((0xfffffU 
                                             & vlSelf->NAND_top__DOT__nand_addr_r))) 
                            << 0x10U) | (QData)((IData)(vlSelf->NAND_top__DOT__nand_addr_c)));
                }
            } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelf->NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x7ffffU & vlSelf->NAND_top__DOT__nand_addr_r))) 
                        << 0x10U) | (QData)((IData)(vlSelf->NAND_top__DOT__nand_addr_c)));
            } else {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelf->NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x7ffffU & vlSelf->NAND_top__DOT__nand_addr_r))) 
                        << 0x10U) | (QData)((IData)(
                                                    (0x1fffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
            }
        } else if ((0x200U & vlSelf->NAND_top__DOT__nand_parameter)) {
            if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                             >> 0x13U));
                vlSelf->NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x7ffffU & vlSelf->NAND_top__DOT__nand_addr_r))) 
                        << 0x10U) | (QData)((IData)(
                                                    (0xfffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
            } else {
                vlSelf->NAND_top__DOT__nand_number 
                    = (3U & (vlSelf->NAND_top__DOT__nand_addr_r 
                             >> 0x12U));
                vlSelf->NAND_top__DOT__addr_in_die 
                    = (((QData)((IData)((0x3ffffU & vlSelf->NAND_top__DOT__nand_addr_r))) 
                        << 0x10U) | (QData)((IData)(
                                                    (0xfffU 
                                                     & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
            }
        } else if ((0x100U & vlSelf->NAND_top__DOT__nand_parameter)) {
            vlSelf->NAND_top__DOT__nand_number = (3U 
                                                  & (vlSelf->NAND_top__DOT__nand_addr_r 
                                                     >> 0x11U));
            vlSelf->NAND_top__DOT__addr_in_die = (((QData)((IData)(
                                                                   (0x1ffffU 
                                                                    & vlSelf->NAND_top__DOT__nand_addr_r))) 
                                                   << 0x10U) 
                                                  | (QData)((IData)(
                                                                    (0xfffU 
                                                                     & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
        } else {
            vlSelf->NAND_top__DOT__nand_number = (3U 
                                                  & (vlSelf->NAND_top__DOT__nand_addr_r 
                                                     >> 0x10U));
            vlSelf->NAND_top__DOT__addr_in_die = (((QData)((IData)(
                                                                   (0xffffU 
                                                                    & vlSelf->NAND_top__DOT__nand_addr_r))) 
                                                   << 0x10U) 
                                                  | (QData)((IData)(
                                                                    (0xfffU 
                                                                     & (IData)(vlSelf->NAND_top__DOT__nand_addr_c)))));
        }
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT3))) {
            vlSelf->NAND_top__DOT__nand_timing = ((0xff00U 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing)) 
                                                  | ((5U 
                                                      > 
                                                      (0xffU 
                                                       & vlSelf->DAT_I))
                                                      ? 5U
                                                      : 
                                                     (0xffU 
                                                      & vlSelf->DAT_I)));
            vlSelf->NAND_top__DOT__nand_timing = ((0xffU 
                                                   & (IData)(vlSelf->NAND_top__DOT__nand_timing)) 
                                                  | (((2U 
                                                       > 
                                                       (0xffU 
                                                        & (vlSelf->DAT_I 
                                                           >> 8U)))
                                                       ? 2U
                                                       : 
                                                      (0xffU 
                                                       & (vlSelf->DAT_I 
                                                          >> 8U))) 
                                                     << 8U));
        }
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT7))) {
            vlSelf->NAND_top__DOT__nand_op_num = vlSelf->DAT_I;
        }
        vlSelf->NAND_top__DOT__nand_cmd_valid = (1U 
                                                 & vlSelf->NAND_top__DOT__nand_command);
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT0))) {
            __Vdly__NAND_top__DOT__nand_command = (
                                                   (0xffff0000U 
                                                    & __Vdly__NAND_top__DOT__nand_command) 
                                                   | (0xffffU 
                                                      & vlSelf->DAT_I));
        } else if (((IData)(vlSelf->NAND_top__DOT__NAND_DONE) 
                    & vlSelf->NAND_top__DOT__nand_command)) {
            __Vdly__NAND_top__DOT__nand_command = (0xfffffffeU 
                                                   & __Vdly__NAND_top__DOT__nand_command);
            vlSelf->NAND_top__DOT__nand_clr_ack = 1U;
            __Vdly__NAND_top__DOT__nand_command = (0x400U 
                                                   | __Vdly__NAND_top__DOT__nand_command);
        } else {
            __Vdly__NAND_top__DOT__nand_command = (
                                                   (0xffffU 
                                                    & __Vdly__NAND_top__DOT__nand_command) 
                                                   | (((IData)(vlSelf->NAND_top__DOT__NAND_DMA_REQ) 
                                                       << 0x1fU) 
                                                      | (((IData)(vlSelf->NAND_top__DOT__NAND_STATE) 
                                                          << 0x18U) 
                                                         | (((IData)(vlSelf->NAND_CE_o) 
                                                             << 0x14U) 
                                                            | ((IData)(vlSelf->NAND_IORDY_i) 
                                                               << 0x10U)))));
            if ((1U & (~ (IData)(vlSelf->NAND_top__DOT__NAND_DONE)))) {
                vlSelf->NAND_top__DOT__nand_clr_ack = 0U;
            }
        }
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT1))) {
            vlSelf->NAND_top__DOT__nand_addr_c = (0x3fffU 
                                                  & vlSelf->DAT_I);
        }
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT2))) {
            vlSelf->NAND_top__DOT__nand_addr_r = (0x1ffffffU 
                                                  & vlSelf->DAT_I);
        }
        if (((IData)(vlSelf->pwrite) & (IData)(vlSelf->NAND_top__DOT__HIT6))) {
            vlSelf->NAND_top__DOT__nand_parameter = vlSelf->DAT_I;
        }
    } else {
        vlSelf->NAND_top__DOT__nand_rdy_map0 = 0U;
        vlSelf->NAND_top__DOT__nand_rdy_map1 = 0U;
        vlSelf->NAND_top__DOT__nand_ce_map1 = 0U;
        vlSelf->NAND_top__DOT__nand_ce_map0 = 0U;
        vlSelf->NAND_top__DOT__nand_number = 0U;
        vlSelf->NAND_top__DOT__nand_timing = 0x412U;
        vlSelf->NAND_top__DOT__nand_op_num = 0x800U;
        __Vdly__NAND_top__DOT__nand_command = vlSelf->NAND_top__DOT__NANDtag;
        vlSelf->NAND_top__DOT__nand_clr_ack = 1U;
        vlSelf->NAND_top__DOT__nand_cmd_valid = (1U 
                                                 & vlSelf->NAND_top__DOT__nand_command);
        vlSelf->NAND_top__DOT__addr_in_die = 0ULL;
        vlSelf->NAND_top__DOT__nand_addr_c = 0U;
        vlSelf->NAND_top__DOT__nand_addr_r = 0U;
        vlSelf->NAND_top__DOT__nand_parameter = ((3U 
                                                  == (IData)(vlSelf->nand_type))
                                                  ? 0x8005100U
                                                  : 
                                                 ((2U 
                                                   == (IData)(vlSelf->nand_type))
                                                   ? 0x8005000U
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlSelf->nand_type))
                                                    ? 0x2004b00U
                                                    : 0x2004c00U)));
    }
    vlSelf->NAND_top__DOT__now_up_half = __Vdly__NAND_top__DOT__now_up_half;
    vlSelf->NAND_top__DOT__now_oob = __Vdly__NAND_top__DOT__now_oob;
    vlSelf->NAND_top__DOT__COMMAND = __Vdly__NAND_top__DOT__COMMAND;
    vlSelf->NAND_top__DOT__data_count = __Vdly__NAND_top__DOT__data_count;
    vlSelf->NAND_top__DOT__NAND_ADDR = __Vdly__NAND_top__DOT__NAND_ADDR;
    vlSelf->NAND_top__DOT__NAND_GO = __Vdly__NAND_top__DOT__NAND_GO;
    vlSelf->NAND_top__DOT__WAIT_NUM = __Vdly__NAND_top__DOT__WAIT_NUM;
    vlSelf->NAND_top__DOT__HOLD_NUM = __Vdly__NAND_top__DOT__HOLD_NUM;
    vlSelf->NAND_top__DOT__PRE_STATE = __Vdly__NAND_top__DOT__PRE_STATE;
    vlSelf->NAND_top__DOT__ADDR_pointer = __Vdly__NAND_top__DOT__ADDR_pointer;
    vlSelf->NAND_top__DOT__ERASE_SERIAL = __Vdly__NAND_top__DOT__ERASE_SERIAL;
    vlSelf->NAND_top__DOT__NAND_ADDR_COUNT = __Vdly__NAND_top__DOT__NAND_ADDR_COUNT;
    vlSelf->NAND_top__DOT__DMA_OP_DONE = __Vdly__NAND_top__DOT__DMA_OP_DONE;
    vlSelf->NAND_top__DOT__NAND_DAT_I_WR = __Vdly__NAND_top__DOT__NAND_DAT_I_WR;
    vlSelf->NAND_top__DOT__READ_ID_NUM = __Vdly__NAND_top__DOT__READ_ID_NUM;
    vlSelf->NAND_top__DOT__WRITE_MAX_COUNT = __Vdly__NAND_top__DOT__WRITE_MAX_COUNT;
    vlSelf->NAND_top__DOT__READ_MAX_COUNT = __Vdly__NAND_top__DOT__READ_MAX_COUNT;
    vlSelf->NAND_top__DOT__NAND_OP_NUM = __Vdly__NAND_top__DOT__NAND_OP_NUM;
    vlSelf->NAND_top__DOT__status = __Vdly__NAND_top__DOT__status;
    vlSelf->NAND_top__DOT__NAND_CE_ = __Vdly__NAND_top__DOT__NAND_CE_;
    vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0 = 
        (1U & ((0x10000000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x20000000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x40000000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0x1fU)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0 = 
        (1U & ((0x100000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x200000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x400000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0x17U)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0 = 
        (1U & ((0x1000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                ? (IData)(vlSelf->NAND_IORDY_i) : (
                                                   (0x2000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? 
                                                   ((IData)(vlSelf->NAND_IORDY_i) 
                                                    >> 1U)
                                                    : 
                                                   ((0x4000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? 
                                                    ((IData)(vlSelf->NAND_IORDY_i) 
                                                     >> 2U)
                                                     : 
                                                    ((~ 
                                                      (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                       >> 0xfU)) 
                                                     | ((IData)(vlSelf->NAND_IORDY_i) 
                                                        >> 3U))))));
    vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0 = 
        ((0U != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
         | (IData)(vlSelf->NAND_top__DOT__NAND_CE_));
    vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0 = 
        ((1U != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
         | (IData)(vlSelf->NAND_top__DOT__NAND_CE_));
    vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0 = 
        ((2U != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
         | (IData)(vlSelf->NAND_top__DOT__NAND_CE_));
    vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0 = 
        ((3U != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
         | (IData)(vlSelf->NAND_top__DOT__NAND_CE_));
    vlSelf->NAND_top__DOT__NAND_IORDY = (1U & ((0U 
                                                == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                ? (IData)(vlSelf->NAND_IORDY_i)
                                                : (
                                                   (1U 
                                                    == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                    ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0)
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelf->NAND_top__DOT__nand_number))
                                                     ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0)
                                                     : 
                                                    ((3U 
                                                      != (IData)(vlSelf->NAND_top__DOT__nand_number)) 
                                                     | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0))))));
    vlSelf->NAND_top__DOT__NAND_STATE = __Vdly__NAND_top__DOT__NAND_STATE;
    vlSelf->NAND_top__DOT__NAND_DONE = __Vdly__NAND_top__DOT__NAND_DONE;
    vlSelf->NAND_top__DOT__NAND_DMA_REQ = __Vdly__NAND_top__DOT__NAND_DMA_REQ;
    vlSelf->NAND_CE_o = ((8U & (((0x1000000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                                  ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0)
                                  : ((0x2000000U & vlSelf->NAND_top__DOT__nand_ce_map0)
                                      ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0)
                                      : ((0x4000000U 
                                          & vlSelf->NAND_top__DOT__nand_ce_map0)
                                          ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0)
                                          : ((~ (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                 >> 0x1bU)) 
                                             | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0))))) 
                                << 3U)) | ((4U & ((
                                                   (0x10000U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0)
                                                    : 
                                                   ((0x20000U 
                                                     & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                     ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0)
                                                     : 
                                                    ((0x40000U 
                                                      & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                      ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0)
                                                      : 
                                                     ((~ 
                                                       (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                        >> 0x13U)) 
                                                      | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0))))) 
                                                  << 2U)) 
                                           | ((2U & 
                                               (((0x100U 
                                                  & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                  ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0)
                                                  : 
                                                 ((0x200U 
                                                   & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                   ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0)
                                                   : 
                                                  ((0x400U 
                                                    & vlSelf->NAND_top__DOT__nand_ce_map0)
                                                    ? (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0)
                                                    : 
                                                   ((~ 
                                                     (vlSelf->NAND_top__DOT__nand_ce_map0 
                                                      >> 0xbU)) 
                                                    | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0))))) 
                                                << 1U)) 
                                              | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0))));
    vlSelf->NAND_top__DOT__nand_command = __Vdly__NAND_top__DOT__nand_command;
    vlSelf->NAND_REQ = vlSelf->NAND_top__DOT__NAND_DMA_REQ;
    vlSelf->NAND_top__DOT__NANDtag = ((IData)(vlSelf->NAND_top__DOT__nand_cmd_valid) 
                                      & (IData)(vlSelf->prst_));
}

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__2(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__2\n"); );
    // Init
    SData/*9:0*/ __Vtableidx3;
    __Vtableidx3 = 0;
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
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [3U];
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [3U];
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
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [2U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rid = 0U;
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [0U];
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [1U];
    }
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [2U];
    }
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [3U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [3U];
    }
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [4U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_bready = (IData)(
                                                         ((0U 
                                                           == 
                                                           (0xcU 
                                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid))) 
                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0)));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [4U];
    }
    if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid 
            = (0U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata 
            = ((0U == (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                             >> 2U))) ? vlSelf->simu_top__DOT__soc__DOT__m0_rdata
                : 0U);
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata = 0U;
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rready = ((IData)(
                                                          (((0U 
                                                             == 
                                                             (0xcU 
                                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                                            & (2U 
                                                               == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) 
                                                           & ((0U 
                                                               != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                                              & (1U 
                                                                 != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))) 
                                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 1U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 2U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((8U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 3U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
        = (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready));
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_bready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready 
            = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1) 
                  << 4U));
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_42 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid)
            ? (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                & (IData)(((0U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                           & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast))))
                ? 3U : (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
            : (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_8 
        = ((0U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_9 
        = ((1U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_10 
        = ((2U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_11 
        = ((3U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_12 
        = ((4U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_13 
        = ((5U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_14 
        = ((6U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_15 
        = ((7U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_16 
        = ((8U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_17 
        = ((9U == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_18 
        = ((0xaU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_19 
        = ((0xbU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_20 
        = ((0xcU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_21 
        = ((0xdU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_22 
        = ((0xeU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_23 
        = ((0xfU == (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)))
            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata
            : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 1U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 2U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 3U));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
        = (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1 
            = vlSelf->simu_top__DOT__soc__DOT__m0_rready;
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready 
            = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)) 
               | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h4bcda73f__1) 
                  << 4U));
    }
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
            >> 3U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelf->ram_ren = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
                       & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
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
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->ram_ren) & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
}

VL_INLINE_OPT void Vsimu_top___024root___nba_sequent__TOP__3(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___nba_sequent__TOP__3\n"); );
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

void Vsimu_top___024root___eval_nba(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_nba\n"); );
    // Body
    if ((4ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[3U] = 1U;
    }
    if ((2ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__1(vlSelf);
        vlSelf->__Vm_traceActivity[4U] = 1U;
    }
    if ((4ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__2(vlSelf);
        vlSelf->__Vm_traceActivity[5U] = 1U;
    }
    if ((2ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vsimu_top___024root___nba_sequent__TOP__3(vlSelf);
    }
}

void Vsimu_top___024root___eval_triggers__act(Vsimu_top___024root* vlSelf);

bool Vsimu_top___024root___eval_phase__act(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<3> __VpreTriggered;
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
            VL_FATAL_MT("/mnt/d/myCPU_new/nscscc2026ByCQUPT/chiplab/IP/APB_DEV/NAND/nand.v", 34, "", "Input combinational region did not converge.");
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
            VL_FATAL_MT("/mnt/d/myCPU_new/nscscc2026ByCQUPT/chiplab/IP/APB_DEV/NAND/nand.v", 34, "", "NBA region did not converge.");
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
                VL_FATAL_MT("/mnt/d/myCPU_new/nscscc2026ByCQUPT/chiplab/IP/APB_DEV/NAND/nand.v", 34, "", "Active region did not converge.");
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
