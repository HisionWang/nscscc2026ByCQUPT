// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"

VL_ATTR_COLD void Vsimu_top___024root___eval_static(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_static\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__aclk__0 = vlSelfRef.aclk;
    vlSelfRef.__Vtrigprevexpr___TOP__pclk__0 = vlSelfRef.pclk;
}

VL_ATTR_COLD void Vsimu_top___024root___eval_initial__TOP(Vsimu_top___024root* vlSelf);
VL_ATTR_COLD void Vsimu_top___024root____Vm_traceActivitySetAll(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD void Vsimu_top___024root___eval_initial(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_initial\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vsimu_top___024root___eval_initial__TOP(vlSelf);
    Vsimu_top___024root____Vm_traceActivitySetAll(vlSelf);
}

VL_ATTR_COLD void Vsimu_top___024root___eval_initial__TOP(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_initial__TOP\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0U] = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2U] = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3U] = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0U] = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2U] = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3U] = 0U;
    vlSelfRef.debug0_wb_pc = 0U;
    vlSelfRef.debug0_wb_rf_wen = 0U;
    vlSelfRef.debug0_wb_rf_wnum = 0U;
    vlSelfRef.debug0_wb_rf_wdata = 0U;
}

VL_ATTR_COLD void Vsimu_top___024root___eval_final(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_final\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vsimu_top___024root___eval_phase__stl(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD void Vsimu_top___024root___eval_settle(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_settle\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("../testbench/simu_top.v", 1, "", "Settle region did not converge after 100 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
    } while (Vsimu_top___024root___eval_phase__stl(vlSelf));
}

VL_ATTR_COLD void Vsimu_top___024root___eval_triggers__stl(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_triggers__stl\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VstlTriggered
                                      [0U]) | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
    vlSelfRef.__VstlFirstIteration = 0U;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsimu_top___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
}

VL_ATTR_COLD bool Vsimu_top___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vsimu_top___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vsimu_top___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___trigger_anySet__stl\n"); );
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

extern const VlUnpacked<CData/*7:0*/, 256> Vsimu_top__ConstPool__TABLE_h65cd9ac3_0;
extern const VlUnpacked<SData/*9:0*/, 256> Vsimu_top__ConstPool__TABLE_h53d02be3_0;
extern const VlUnpacked<IData/*31:0*/, 256> Vsimu_top__ConstPool__TABLE_ha6481172_0;
extern const VlUnpacked<SData/*15:0*/, 256> Vsimu_top__ConstPool__TABLE_h2f5425a8_0;
extern const VlUnpacked<CData/*2:0*/, 512> Vsimu_top__ConstPool__TABLE_hb25a9de7_0;
extern const VlUnpacked<CData/*3:0*/, 4> Vsimu_top__ConstPool__TABLE_h19403ecc_0;
extern const VlUnpacked<CData/*2:0*/, 32> Vsimu_top__ConstPool__TABLE_h43fcfe92_0;
extern const VlUnpacked<IData/*31:0*/, 32> Vsimu_top__ConstPool__TABLE_hfff90dde_0;
extern const VlUnpacked<CData/*3:0*/, 1024> Vsimu_top__ConstPool__TABLE_hbbc23a9e_0;

VL_ATTR_COLD void Vsimu_top___024root___stl_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___stl_sequent__TOP__0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*7:0*/ __Vtableidx10;
    __Vtableidx10 = 0;
    // Body
    vlSelfRef.ram_raddr = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr;
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random_next 
        = ((0x007ffffeU & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                           << 1U)) | (1U & VL_REDXOR_32(
                                                        (0x00420000U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random))));
    vlSelfRef.ram_waddr = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr;
    vlSelfRef.ram_wdata = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata;
    vlSelfRef.num_data = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data;
    vlSelfRef.open_trace = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace;
    vlSelfRef.num_monitor = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor;
    vlSelfRef.confreg_uart_data = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data;
    vlSelfRef.led = (0x0000ffffU & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data);
    vlSelfRef.led_rg0 = (3U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data);
    vlSelfRef.led_rg1 = (3U & vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data);
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
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1 
        = (1ULL + vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt);
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1 
        = (1ULL + vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt);
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1 
        = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1 
        = (0x0000000fU & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)));
    vlSelfRef.NAND_REQ = vlSelfRef.NAND_top__DOT__NAND_DMA_REQ;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7 
        = (7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0 
        = (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1 
        = (0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                          - (IData)(1U)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 1U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
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
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr));
    vlSelfRef.NAND_top__DOT__NANDtag = ((IData)(vlSelfRef.NAND_top__DOT__nand_cmd_valid) 
                                        & (IData)(vlSelfRef.prst_));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t)) 
              & (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count))));
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
    vlSelfRef.__Vtableidx5 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value 
        = Vsimu_top__ConstPool__TABLE_h65cd9ac3_0[vlSelfRef.__Vtableidx5];
    vlSelfRef.__Vtableidx8 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value 
        = Vsimu_top__ConstPool__TABLE_h53d02be3_0[vlSelfRef.__Vtableidx8];
    __Vtableidx10 = vlSelfRef.__SYM__switch;
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data 
        = Vsimu_top__ConstPool__TABLE_ha6481172_0[__Vtableidx10];
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
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 2U) & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                      | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                         | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                            | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r)))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int = 5U;
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
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next 
        = (0x000001ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                          + (0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                            >> 0x00000010U))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bresp;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bresp;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rresp;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rresp;
    vlSelfRef.__Vtableidx4 = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level 
        = Vsimu_top__ConstPool__TABLE_h19403ecc_0[vlSelfRef.__Vtableidx4];
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast 
        = ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast) 
             << 4U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast) 
                        << 3U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                  << 2U))) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast) 
                                               << 1U) 
                                              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rid;
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
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready 
        = ((8U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready) 
                              << 2U) | (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3 
        = ((~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt))) 
           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)));
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
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
           == (7U & ((IData)(1U) + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready 
        = ((8U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready) 
                              << 2U) | (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0 
        = ((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
           | (1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))];
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0U] 
        = vlSelfRef.ram_rdata;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rdata;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg;
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4U] 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rdata;
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
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode 
        = ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
           | (3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid) 
            << 3U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                       << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
    vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2 
        = (1U & ((~ (IData)(vlSelfRef.enable_delay)) 
                 | (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel 
        = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))];
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid) 
            << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid 
        = ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0 
        = ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle 
        = (1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                  ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                 >> 8U));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count) 
              >= (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level)));
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
    vlSelfRef.simu_top__DOT__soc__DOT__m0_awready = 0U;
    if ((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full)))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_awready 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3) 
           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)));
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
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid)) 
                 | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid)) 
                 | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelfRef.aresetn)));
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 0U;
    vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp = 0U;
    if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [0U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [0U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast = 0U;
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast));
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast = 0U;
    }
    if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [1U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [1U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 1U));
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
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [2U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [2U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 2U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
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
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 2U));
    }
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 3U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 3U));
    }
    if (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma);
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma;
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0x000000ffU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu));
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
        vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu;
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
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid)
            ? 0U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid)
                     ? 1U : ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid)
                              ? 2U : 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable))));
    vlSelfRef.DAT_O = vlSelfRef.NAND_top__DOT__REG_DAT_T;
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en));
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
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready));
    vlSelfRef.ram_wen = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb) 
                         & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
            >> 3U) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready) 
            << 3U) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready) 
                       << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready)));
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb) 
           & (- (IData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rid = 
            vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                     >> 4U));
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
        vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 4U));
    }
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2));
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
    if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))) {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata 
            = vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata;
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
    } else {
        vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata = 0U;
        if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))) {
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
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data 
        = (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr)) 
            << 0x0000000dU) | (QData)((IData)((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst) 
                                                << 0x0000000bU) 
                                               | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize) 
                                                  << 8U)))));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3 
        = ((0x1fafU == (0x00001fffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                       >> 0x00000010U))) 
           | (0x1fd0U == (0x00001fffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                         >> 0x00000010U))));
    vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready) 
           & ((~ (IData)(vlSelfRef.enable_delay)) | 
              ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable))));
    vlSelfRef.write_uart_valid = vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
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
    vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit 
        = (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
            << 3U) | (((0x1fe0U == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                    >> 0x00000010U)) 
                       << 2U) | (1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
                                          | (0x1fe0U 
                                             == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                                 >> 0x00000010U)))))));
    vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask 
        = ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d)) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
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
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelfRef.ram_ren = vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en;
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
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
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
           & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
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
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                    >> 3U)));
    vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push 
        = (1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)) 
                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid)));
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
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid)) 
              | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)));
    vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push 
        = ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push) 
           & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
              & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)) 
                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
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

VL_ATTR_COLD void Vsimu_top___024root___eval_stl(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_stl\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
        Vsimu_top___024root___stl_sequent__TOP__0(vlSelf);
        Vsimu_top___024root____Vm_traceActivitySetAll(vlSelf);
    }
}

VL_ATTR_COLD bool Vsimu_top___024root___eval_phase__stl(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__stl\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    Vsimu_top___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = Vsimu_top___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        Vsimu_top___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

bool Vsimu_top___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(Vsimu_top___024root___trigger_anySet__ico(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

bool Vsimu_top___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vsimu_top___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge aclk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @(posedge pclk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsimu_top___024root____Vm_traceActivitySetAll(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root____Vm_traceActivitySetAll\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[0U] = 1U;
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.__Vm_traceActivity[3U] = 1U;
}

VL_ATTR_COLD void Vsimu_top___024root___ctor_var_reset(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___ctor_var_reset\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->aclk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10553736683680568397ull);
    vlSelf->aresetn = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8123012239402083478ull);
    vlSelf->enable_delay = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1160794749882336877ull);
    vlSelf->random_seed = VL_SCOPED_RAND_RESET_I(23, __VscopeHash, 13773829677384114469ull);
    vlSelf->ram_ren = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8576264591433151738ull);
    vlSelf->ram_raddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8066881615923512170ull);
    vlSelf->ram_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5866318891553512409ull);
    vlSelf->ram_wen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10951277381386541062ull);
    vlSelf->ram_waddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1769204096264280787ull);
    vlSelf->ram_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7107146198086373580ull);
    vlSelf->debug0_wb_pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12398450243060576145ull);
    vlSelf->debug0_wb_rf_wen = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16974311352689934620ull);
    vlSelf->debug0_wb_rf_wnum = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 6266996286683701438ull);
    vlSelf->debug0_wb_rf_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11526857186920348307ull);
    vlSelf->num_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15768264132817493213ull);
    vlSelf->open_trace = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14709927252171523125ull);
    vlSelf->num_monitor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2679016413358528058ull);
    vlSelf->confreg_uart_data = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 11429426019062420789ull);
    vlSelf->write_uart_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14505980839528714039ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelf->uart_ctr_bus, __VscopeHash, 14655298551597729910ull);
    vlSelf->uart_rx = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2399467654730215438ull);
    vlSelf->uart_tx = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1761512799854230840ull);
    vlSelf->led = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14009161575225144129ull);
    vlSelf->led_rg0 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 2772173385715782470ull);
    vlSelf->led_rg1 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4289675265055230282ull);
    vlSelf->num_csn = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5965215401399678620ull);
    vlSelf->num_a_g = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 4673557879158907287ull);
    vlSelf->__SYM__switch = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12342317781064377398ull);
    vlSelf->btn_key_col = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 7085977407902896256ull);
    vlSelf->btn_key_row = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 14107954108889949202ull);
    vlSelf->btn_step = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 6916960914189512817ull);
    vlSelf->nand_type = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12134910622213762631ull);
    vlSelf->pclk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2198342127515400097ull);
    vlSelf->prst_ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15212934672635506724ull);
    vlSelf->psel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5365422930610402651ull);
    vlSelf->penable = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10310706929790612258ull);
    vlSelf->pwrite = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3040259829508521558ull);
    vlSelf->ADDR = VL_SCOPED_RAND_RESET_I(11, __VscopeHash, 6747904215362389807ull);
    vlSelf->DAT_I = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16177331410692286093ull);
    vlSelf->DAT_O = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14308702203786341069ull);
    vlSelf->NAND_CE_o = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9876974635649895400ull);
    vlSelf->NAND_REQ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18075957614752507037ull);
    vlSelf->NAND_I = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 3860440878220427211ull);
    vlSelf->NAND_O = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4575393226079282545ull);
    vlSelf->NAND_EN_ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13130061247179607787ull);
    vlSelf->NAND_ALE = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17153214833709876038ull);
    vlSelf->NAND_CLE = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7191016492426576794ull);
    vlSelf->NAND_WR_ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8182399217641448281ull);
    vlSelf->NAND_RD_ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17583812773842426611ull);
    vlSelf->NAND_IORDY_i = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 15357473224784447358ull);
    vlSelf->nand_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16114805462091504624ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_awready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16927828232955523481ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13745627359425800976ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_bid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9079954653059011391ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_bresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 11216979843869078034ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_bvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11221100537314682085ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15326201920557240907ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_rid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17334705916178225456ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14421847813964645211ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_rresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4104755836567947486ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9875240606767168990ull);
    vlSelf->simu_top__DOT__soc__DOT__m0_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1247787541089005340ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_awready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3687202197065960315ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10105560134684193946ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17385411400132646375ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9605017455610210747ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16109091538142398122ull);
    vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12686277137047788180ull);
    vlSelf->simu_top__DOT__soc__DOT__UART_RI = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11384176404357494869ull);
    vlSelf->simu_top__DOT__soc__DOT__uart0_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14495888720869600678ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10136368515607841655ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8349315825879858686ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 555148607611371773ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18113288747454272465ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3252043356356089069ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8905769014850399889ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3922677480304306030ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6011069626503747197ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6843040091664084050ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8236025610214158062ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12553680089925386489ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10153297378776055241ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 15389211831268218576ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13173786979692612645ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12756202126266864603ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9187660570330964848ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12520630431886610100ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13303214461128356835ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5348750761730607355ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 5835284650249128023ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__io_cpu_if_resp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 178700016784473141ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag[__Vi0] = VL_SCOPED_RAND_RESET_I(22, __VscopeHash, 16845616615101399169ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5607875262009871850ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 2317472464472349726ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9990770775775553022ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1298172231534682679ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6921379033455616536ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13156228321483033725ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884544383143772734ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 16337615018769613774ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__miss_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11293675768872966069ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8491261853862604649ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT___GEN_34 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4792118188259953411ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__io_cpu_if_resp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14331373124093671808ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag[__Vi0] = VL_SCOPED_RAND_RESET_I(22, __VscopeHash, 16896700418287876728ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16633650461546134323ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9231253086181286125ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6788807417748499374ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2069171608226373782ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7202707143895801667ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16628546693600531764ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3475883926043047014ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7013510292117820166ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__miss_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6223723672679135943ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13382568961211509758ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT___GEN_34 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 313865728345180432ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__io_cpu_if_resp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14832810433983166016ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag[__Vi0] = VL_SCOPED_RAND_RESET_I(22, __VscopeHash, 4438424659504676891ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8663490983520836316ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 11179399121866857959ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4788580935168837301ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12524095403089048419ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13646158326370648923ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3471904848492733176ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17992463523202209111ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7541294523653160439ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__miss_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10647186801699216405ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 16975396550512452077ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT___GEN_34 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 3438159774023601896ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__io_cpu_if_resp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8524611379768682950ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag[__Vi0] = VL_SCOPED_RAND_RESET_I(22, __VscopeHash, 7408564089623465197ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15112063097055893382ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4477108795448289360ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6471238088296407336ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11693779369000977311ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4794232441678948339ull);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4693232607212793571ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15852488913411678464ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5684374692035586321ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__miss_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2294076306648593102ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9499182671951402908ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT___GEN_34 = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9566515200189660094ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13538039634128241592ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 11496333514271846152ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 13184580382724217862ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1 = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 12121250477108411916ull);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1 = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 17132864202369608136ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__s_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17145973255299692456ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__s_rready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4880750585313448368ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11103185713694492554ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11311734418866293831ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10164643836393862440ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random = VL_SCOPED_RAND_RESET_I(23, __VscopeHash, 8159267846320474198ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random_next = VL_SCOPED_RAND_RESET_I(23, __VscopeHash, 13370902328030387918ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17110296145552427983ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14385616890426291260ull);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_2 = 0;
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgRegularize_ha6db628c_0_5 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h63b02204__1 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hb47bec07__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h326270fe__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hefbc5fe9__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17424497049945819275ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 10124149373735250689ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10237932850173101267ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2867671912771082267ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4608460619760601191ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15687410949627517761ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 14152747819714366296ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 14886081678597616134ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3860388558117117667ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2545751464771237433ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rresp = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 14098527603259616641ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5241790395869673758ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 9732820959223312603ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 16331003716128645672ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 14778861313872163081ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 11797614840311672776ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 7083151926311430603ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 376928418723483694ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 14236437805800347080ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 4631338455614465493ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 8578007987881592187ull);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[__Vi0] = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16976115096739448346ull);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4681226223614571180ull);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[__Vi0] = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16691195969752067571ull);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14469248655351371709ull);
    }
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 17645336698902559965ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 15105640239221685038ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 6070618399667489670ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 1544041457533624590ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 4122505880340884976ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 13715278408841514634ull);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[__Vi0] = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 2498260540516031667ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 1678581212416442002ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 11144804189188133731ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 37825413098532937ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_0 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6137109075052707900ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_1 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 887135835099667982ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16760241480757839711ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16295158791645125856ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10419389564425592017ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16136805273062296141ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 4625358308748934256ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5501181994773480076ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 11094231214889458399ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15909333112394065910ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 17559585891655991385ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6985084951932246363ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8806455205421106366ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6208838344119324041ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5843222452489756829ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 15794655183972488901ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 14862498330410914678ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15060486069988004822ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15928844583431048281ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3 = 0;
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[__Vi0] = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 17380134915440038626ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 7055515453800947299ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 6905925303904916795ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4700025981829225855ull);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[__Vi0] = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5801539894269701484ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9776455973543430054ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4172199901430806221ull);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5935673020487759331ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16090218977694730824ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9515714409253895309ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2535667000292333137ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 1162289907554122328ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 363635016602723071ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 968141569847553173ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3206218380368100685ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_ack_i = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7375443048935237148ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5169002987271701574ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17125050493734174756ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 16685161469371848798ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr = VL_SCOPED_RAND_RESET_I(24, __VscopeHash, 2374489677241552623ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_clk_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8505499456555408402ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_reset_n_dma = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11545621202043077783ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5102354123701892474ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10524912355110818727ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 16930436822098004071ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 3037530009672739999ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_req = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1163965482072028270ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17640177155058541947ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_rw = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5505096275828937990ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_enab = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12781366348935353974ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_psel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17583350809057765653ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_addr = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 3942637114567748366ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datai = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15202531967212089012ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datao = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8491694337821443641ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11585576975584680392ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7434448547491244439ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6894391119660940795ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3175955083747130973ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16386555820467481431ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5816750466141437424ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 7178737256688728717ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 11071221060289732187ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 4799355746552561139ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6495168851221955676ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12863937068909306370ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8135275131113728704ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 2370950370938608191ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7606458772436226781ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3833575333448740501ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16511330713352493558ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12088593020911683686ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5968638699366115117ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13290883641595359892ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11857119470542781995ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17848381406644570083ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 8955680414665188799ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12424368804306347225ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgRegularize_h74633bcc_0_0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18363816144920701225ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2734276019662345078ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10809297824760518482ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5470651242101644996ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4035183863894730282ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11409723621126812516ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8973068530329413407ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 1507436424055913686ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8871141173677049515ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 289015545626599115ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15966007615854529137ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10513927965538396641ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 16588460760788948341ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7599205097668002918ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl = VL_SCOPED_RAND_RESET_I(24, __VscopeHash, 17096012668527828321ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16933704283221314234ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2179336014241026001ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4993046387229182658ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 5045431890926211025ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 116943426588827810ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13938889373565139136ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11511913398471138820ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8552975543157081631ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7035346926824019261ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12305477764605654033ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5259428046681379721ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10777381200809732757ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 11765915018120217654ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4455571072140052216ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7172617059279469475ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6770081537175517522ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11519416375517489661ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1490920871506696638ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8801029302201603871ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7996647904005248003ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7257074390493891218ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15388578042798896760ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3416162183850389256ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4395897533719613140ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12021549237084633162ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13991887015847362066ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13225921514884768884ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2910681093480068098ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16267763974727769642ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13135380575887690802ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1198938626190017452ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6967079178087795255ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13265444024332096269ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7076150852602361299ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 8381211453744603200ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 11115127787151986599ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5861699448611877196ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 15770936654059968811ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t = VL_SCOPED_RAND_RESET_I(10, __VscopeHash, 6062492094109896599ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9986004948820941481ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17333566112684786454ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15223407023994091078ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15455718557604836178ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9395659461183220799ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11503472903405076125ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10705782815197157891ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3264444594001833970ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3067271203909415607ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16857716322347308955ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15108249658577383927ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12363270061804959688ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7539440287907511844ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11837277255959782719ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5283647811362285517ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2204568115433717384ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7046420146198654728ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 15429782801771327325ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 5408376679121819282ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14733973563871796261ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4978241612854008829ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8736618137558247352ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 355339124321168608ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11002421957503957117ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5598936370354615463ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11149651113221155414ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17015595327770415795ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10610769835637026956ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5081545226966171082ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9920065676319613108ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17468632126624735148ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_2 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_3 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 15042610631722613809ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 2773239552770734296ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 2045284998564911479ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12854016541980304099ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9970029879656732225ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9003660013422442713ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5591672865028887339ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6441119080644013238ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 17360453368417454061ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 15437692371595817800ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8262147396270643972ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 11427337264774028948ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 363579252274990991ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16932412734456481016ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 797386418119814571ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6861917946455558643ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 475594994289443080ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17551432828149153195ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3418259972266344436ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12931098362385348738ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3479582039763620865ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12658761562556712436ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 18009529217579911166ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9246614648860350539ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8075091240309263833ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15409214940375833854ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2565458944032582891ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14481259442295075577ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4354465248853822036ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16090512599221398060ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in = VL_SCOPED_RAND_RESET_I(11, __VscopeHash, 15655704886073963136ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5464237871543380421ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5158320070764551160ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4465165486830529809ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3895143133405695158ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value = VL_SCOPED_RAND_RESET_I(10, __VscopeHash, 10898818804037852186ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 15891062890599402313ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[__Vi0] = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13787612172781734548ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17694369521533569443ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4849781221817510281ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12498113362592600449ull);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6420921334211421119ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7684280514472144675ull);
    }
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11916868420937401737ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7937285033316145489ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr_next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15288468036981179599ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8153837287001665863ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16209081875927776112ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6556812927917637741ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13864651499712439403ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 438051456422306014ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14880768704014000675ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8808166062735833848ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7604737999376501195ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data = VL_SCOPED_RAND_RESET_Q(45, __VscopeHash, 16109733597604206632ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas = VL_SCOPED_RAND_RESET_Q(45, __VscopeHash, 8070202735817439348ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15862357602090038545ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14264335704862109910ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3560795058228910035ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12689343260201806311ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8930718198666549318ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13234586719635754610ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7627353833151031165ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5273707998052478095ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10678409825712727331ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr_next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16157087696834952848ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 3385593881273303266ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4924559852257134162ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4791436275069124499ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 11975802881905399648ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1946578512077964443ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7212442310938721033ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5539276427670205880ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas = VL_SCOPED_RAND_RESET_Q(45, __VscopeHash, 8968370360043041662ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5561734091502118254ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11431601868028939642ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6767288347561178613ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6321260141953629634ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8933158948824562164ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8610650264424336115ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10428311758727551487ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 15318622654261704906ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13809774546774428358ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16715282794022106973ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7252627797398633419ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2306368351526366820ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17425633858519861994ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18248768528612428189ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3855967907739401185ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13565119126380800848ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3122328306414229186ull);
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7710520897518320063ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12757923746606213947ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17891605767080358911ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr_next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8095872217781858872ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4632286848808988482ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17531160986588317324ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8937402319980005156ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15121343424645868674ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16362321164775722913ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16558505431028808259ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18032760103710313461ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11048515730261006213ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas = VL_SCOPED_RAND_RESET_Q(45, __VscopeHash, 15297685693711509460ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3804832269582755198ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4291269334351366609ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9678191237132406479ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8268920675520665606ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3751240604746208960ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10659546402439583403ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10117390901506673801ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10018906911306853517ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9437946684476307377ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 18276688257134131836ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr_next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10516324977471321770ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8986802170699064324ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6368303463219564574ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8408237674252083578ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16889508627887282922ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1236464265832895548ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1400238852637578604ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4056863459850475309ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas = VL_SCOPED_RAND_RESET_Q(45, __VscopeHash, 2755303881476967829ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14687125058298866349ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3122866141120291405ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8876487835911138924ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7490626118842765498ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15533756864602169041ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8043264441752138680ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3846010762935753857ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4108230833098024960ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_pop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 217998667197257648ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9316193191995698523ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13696524687951238398ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11754060870976503954ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10172217084868650166ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12117299058618865495ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7628033904661176518ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14944059471395039848ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10936971822114611300ull);
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6035028227972319123ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_ren = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11026821085640339547ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wen = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 14787394869502712133ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15787943178270708603ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4152583718622628059ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr2 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10878517001045447349ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr3 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12107053086845230594ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr4 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9261154271125068118ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr5 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 293058960310451719ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr6 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14355659990114311089ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr7 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1379234161794374421ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2828063843457201025ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17733814795505211882ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2304971334992084622ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13873309999762054246ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17419823588163142339ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12410561057660874149ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16281346998561974646ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r2 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17905216664568478815ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__simu_flag = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1167276275628691704ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__io_simu = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 667602973211469132ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5963870997613747876ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__open_trace = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12247771542728538012ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_monitor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7606334334994735810ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6618643734959582428ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12313426198964686721ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5144821664693321814ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13836799881321708137ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6292831004573803770ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5545719423862605205ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3467405465315276274ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14018920099825857078ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3705684591913301868ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17850797393176557801ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4251725252808542644ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10145947883033191145ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14598142074824977650ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18101010680824869092ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 5147955734648642804ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 14325818733183259607ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12929481043275469217ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_flag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6073397681500320878ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 10655413087100422365ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state_count = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 11792069447693583691ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4322492720101803632ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4746017316729529713ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10477352400271453980ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_flag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6388104994972081916ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 6898185893652965987ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_flag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9378278520370341787ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 8516476119073054886ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__count = VL_SCOPED_RAND_RESET_I(20, __VscopeHash, 7943153450396096713ull);
    vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__scan_data = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10250921988750693925ull);
    vlSelf->NAND_top__DOT__REG_DAT_T = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11354990520469522296ull);
    vlSelf->NAND_top__DOT__nand_addr_c = VL_SCOPED_RAND_RESET_I(14, __VscopeHash, 13317680338956759125ull);
    vlSelf->NAND_top__DOT__nand_addr_r = VL_SCOPED_RAND_RESET_I(25, __VscopeHash, 5743770863198020731ull);
    vlSelf->NAND_top__DOT__nand_op_num = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9593390347271931636ull);
    vlSelf->NAND_top__DOT__nand_parameter = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13243605498831801451ull);
    vlSelf->NAND_top__DOT__nand_ce_map0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10113849908996881651ull);
    vlSelf->NAND_top__DOT__nand_ce_map1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10236616164909288700ull);
    vlSelf->NAND_top__DOT__nand_rdy_map0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6590256576826451627ull);
    vlSelf->NAND_top__DOT__nand_rdy_map1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3068336851758847297ull);
    vlSelf->NAND_top__DOT__nand_command = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17868392525763067142ull);
    vlSelf->NAND_top__DOT__nand_timing = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 7826863700401032108ull);
    vlSelf->NAND_top__DOT__addr_in_die = VL_SCOPED_RAND_RESET_Q(38, __VscopeHash, 16505788636828922662ull);
    vlSelf->NAND_top__DOT__NAND_STATE = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 5708274818920047886ull);
    vlSelf->NAND_top__DOT__NAND_OP_NUM = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8208952397814064093ull);
    vlSelf->NAND_top__DOT__WRITE_MAX_COUNT = VL_SCOPED_RAND_RESET_I(14, __VscopeHash, 2638396655864667740ull);
    vlSelf->NAND_top__DOT__READ_MAX_COUNT = VL_SCOPED_RAND_RESET_I(14, __VscopeHash, 1786405773227624832ull);
    vlSelf->NAND_top__DOT__nand_clr_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1804064776177051188ull);
    vlSelf->NAND_top__DOT__NAND_DONE = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10695700303589040951ull);
    vlSelf->NAND_top__DOT__NAND_CE_ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6253068948901484661ull);
    vlSelf->NAND_top__DOT__NANDtag = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8982429751648187462ull);
    vlSelf->NAND_top__DOT__NAND_IORDY = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11781924993506557047ull);
    vlSelf->NAND_top__DOT__HIT0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11282913513235847423ull);
    vlSelf->NAND_top__DOT__HIT1 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5708210602506712613ull);
    vlSelf->NAND_top__DOT__HIT2 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7637010513621151814ull);
    vlSelf->NAND_top__DOT__HIT3 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14261021467951985888ull);
    vlSelf->NAND_top__DOT__HIT6 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15583834704668719568ull);
    vlSelf->NAND_top__DOT__HIT7 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9354113602121426370ull);
    vlSelf->NAND_top__DOT__HIT8 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9080071420298572ull);
    vlSelf->NAND_top__DOT__HIT9 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15119775018397783741ull);
    vlSelf->NAND_top__DOT__HIT10 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4796434850288520257ull);
    vlSelf->NAND_top__DOT__HIT11 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 769122489276602386ull);
    vlSelf->NAND_top__DOT__NAND_HIT = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12315764457700105416ull);
    vlSelf->NAND_top__DOT__NAND_DMA_REQ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15184287375628395926ull);
    vlSelf->NAND_top__DOT__nand_cmd_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5323738866462638411ull);
    vlSelf->NAND_top__DOT__status = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10551661443237218263ull);
    vlSelf->NAND_top__DOT__nand_number = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13380926519071883908ull);
    vlSelf->NAND_top__DOT__ID_INFORM = VL_SCOPED_RAND_RESET_Q(48, __VscopeHash, 6759505645289183759ull);
    vlSelf->NAND_top__DOT__NAND_DAT_O_RD = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8183980853042877816ull);
    vlSelf->NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15418872888588325338ull);
    vlSelf->NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13669409142561749020ull);
    vlSelf->NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14752803180914357962ull);
    vlSelf->NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17547466241133620714ull);
    vlSelf->NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13702713688323884051ull);
    vlSelf->NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6605597592674295472ull);
    vlSelf->NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__ = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 840605283164547483ull);
    vlSelf->NAND_top__DOT__ADDR_pointer = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8660149899601205715ull);
    vlSelf->NAND_top__DOT__NAND_ADDR_COUNT = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5917076997749976614ull);
    vlSelf->NAND_top__DOT__WAIT_NUM = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5594776233400090153ull);
    vlSelf->NAND_top__DOT__HOLD_NUM = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9657900073992253146ull);
    vlSelf->NAND_top__DOT__COMMAND = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9280956643980567316ull);
    vlSelf->NAND_top__DOT__PRE_STATE = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 15456671701512008278ull);
    vlSelf->NAND_top__DOT__READ_ID_NUM = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 18206119464823133235ull);
    vlSelf->NAND_top__DOT__data_count = VL_SCOPED_RAND_RESET_I(14, __VscopeHash, 1732002134086648314ull);
    vlSelf->NAND_top__DOT__NAND_ADDR = VL_SCOPED_RAND_RESET_Q(38, __VscopeHash, 11685948337630700317ull);
    vlSelf->NAND_top__DOT__NAND_DAT_I_WR = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11206776520104546311ull);
    vlSelf->NAND_top__DOT__NAND_GO = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 21259052584345898ull);
    vlSelf->NAND_top__DOT__NAND_ACK = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10500855813149567176ull);
    vlSelf->NAND_top__DOT__DMA_OP_DONE = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3780369022246883787ull);
    vlSelf->NAND_top__DOT__ERASE_SERIAL = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11745817174058732495ull);
    vlSelf->NAND_top__DOT__now_up_half = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1287277462728933506ull);
    vlSelf->NAND_top__DOT__now_oob = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4888160966884445785ull);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num = 0;
    vlSelf->__Vtableidx2 = 0;
    vlSelf->__Vtableidx3 = 0;
    vlSelf->__Vtableidx4 = 0;
    vlSelf->__Vtableidx5 = 0;
    vlSelf->__Vtableidx8 = 0;
    vlSelf->__Vtableidx11 = 0;
    vlSelf->__Vtableidx12 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VicoTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__aclk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__pclk__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
