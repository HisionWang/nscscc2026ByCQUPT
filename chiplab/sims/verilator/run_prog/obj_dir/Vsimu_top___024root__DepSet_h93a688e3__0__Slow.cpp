// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"
#include "Vsimu_top___024root.h"

VL_ATTR_COLD void Vsimu_top___024root___eval_static(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vsimu_top___024root___eval_initial__TOP(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD void Vsimu_top___024root___eval_initial(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_initial\n"); );
    // Body
    Vsimu_top___024root___eval_initial__TOP(vlSelf);
    vlSelf->__Vm_traceActivity[5U] = 1U;
    vlSelf->__Vm_traceActivity[4U] = 1U;
    vlSelf->__Vm_traceActivity[3U] = 1U;
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__0 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__1 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit;
    vlSelf->__Vtrigprevexpr___TOP__pclk__0 = vlSelf->pclk;
    vlSelf->__Vtrigprevexpr___TOP__aclk__0 = vlSelf->aclk;
}

VL_ATTR_COLD void Vsimu_top___024root___eval_initial__TOP(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_initial__TOP\n"); );
    // Body
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid = 0U;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wdata = 0U;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wstrb = 0U;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0U] = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2U] = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3U] = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0U] = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2U] = 0U;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3U] = 0U;
    vlSelf->debug0_wb_pc = 0U;
    vlSelf->debug0_wb_rf_wen = 0U;
    vlSelf->debug0_wb_rf_wnum = 0U;
    vlSelf->debug0_wb_rf_wdata = 0U;
}

VL_ATTR_COLD void Vsimu_top___024root___eval_final(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__stl(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vsimu_top___024root___eval_phase__stl(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD void Vsimu_top___024root___eval_settle(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("/mnt/d/myCPU_new/nscscc2026ByCQUPT/chiplab/IP/APB_DEV/NAND/nand.v", 34, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vsimu_top___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__stl(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
    if ((2ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 1 is active: @([hybrid] simu_top.soc.AXI_SLAVE_MUX.wr_addr_hit)\n");
    }
}
#endif  // VL_DEBUG

extern const VlUnpacked<CData/*7:0*/, 256> Vsimu_top__ConstPool__TABLE_hc0dde5b8_0;
extern const VlUnpacked<SData/*9:0*/, 256> Vsimu_top__ConstPool__TABLE_h13b579b2_0;
extern const VlUnpacked<CData/*3:0*/, 4> Vsimu_top__ConstPool__TABLE_h9e057a56_0;
extern const VlWide<16>/*511:0*/ Vsimu_top__ConstPool__CONST_h93e1b771_0;
extern const VlUnpacked<CData/*2:0*/, 32> Vsimu_top__ConstPool__TABLE_hebd5b4eb_0;
extern const VlUnpacked<IData/*31:0*/, 32> Vsimu_top__ConstPool__TABLE_h2ba417e2_0;
extern const VlUnpacked<CData/*3:0*/, 1024> Vsimu_top__ConstPool__TABLE_h7dde3788_0;

VL_ATTR_COLD void Vsimu_top___024root___stl_sequent__TOP__0(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___stl_sequent__TOP__0\n"); );
    // Init
    SData/*9:0*/ __Vtableidx3;
    __Vtableidx3 = 0;
    // Body
    vlSelf->num_data = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_data;
    vlSelf->open_trace = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__open_trace;
    vlSelf->num_monitor = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_monitor;
    vlSelf->confreg_uart_data = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data;
    vlSelf->NAND_REQ = vlSelf->NAND_top__DOT__NAND_DMA_REQ;
    vlSelf->ram_raddr = vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_valid 
        = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
           & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
              & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                 & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_86 
        = ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
            ? 4U : ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                     ? 0U : (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___data_count_T_1 
        = (0x1fU & ((IData)(1U) + (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count)));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random_next 
        = ((0x7ffffeU & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                         << 1U)) | (1U & VL_REDXOR_32(
                                                      (0x420000U 
                                                       & vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random))));
    vlSelf->ram_waddr = vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr;
    vlSelf->ram_wdata = vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata;
    vlSelf->led = (0xffffU & vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_data);
    vlSelf->led_rg0 = (3U & vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data);
    vlSelf->led_rg1 = (3U & vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data);
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))) {
        vlSelf->btn_key_col = 0U;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((IData)(((vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                         >> 0x13U) & (~ (IData)((0xfU 
                                                 == (IData)(vlSelf->btn_key_row))))))
                ? 1U : 0U);
    } else if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))) {
        vlSelf->btn_key_col = 0xeU;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((0xfU == (IData)(vlSelf->btn_key_row))
                ? 2U : 7U);
    } else if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))) {
        vlSelf->btn_key_col = 0xdU;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((0xfU == (IData)(vlSelf->btn_key_row))
                ? 3U : 7U);
    } else if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))) {
        vlSelf->btn_key_col = 0xbU;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((0xfU == (IData)(vlSelf->btn_key_row))
                ? 4U : 7U);
    } else if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))) {
        vlSelf->btn_key_col = 7U;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((0xfU == (IData)(vlSelf->btn_key_row))
                ? 0U : 7U);
    } else {
        vlSelf->btn_key_col = 0U;
        vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state 
            = ((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state))
                ? (((vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                     >> 0x13U) & (0xfU == (IData)(vlSelf->btn_key_row)))
                    ? 0U : 7U) : 0U);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT___reg_T_1 
        = (1ULL + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reg_);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1 
        = (1ULL + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt);
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top_plus_1 
        = (0xfU & ((IData)(1U) + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_7 
        = (7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_minus_1 
        = (0xfU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                   - (IData)(1U)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16_eq_0 
        = (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top_plus_1 
        = (0xfU & ((IData)(1U) + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)));
    vlSelf->NAND_top__DOT__NANDtag = ((IData)(vlSelf->NAND_top__DOT__nand_cmd_valid) 
                                      & (IData)(vlSelf->prst_));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 1U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_req_valid 
        = ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_valid));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_4 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_valid) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_57 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_58 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_59 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_60 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_61 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_62 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_63 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_64 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_65 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_66 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_67 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_68 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_69 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_70 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_71 = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_72 = 0U;
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_57 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_58 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_59 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_60 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_61 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_62 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_63 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_64 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_65 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_66 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_67 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_68 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_69 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_70 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_71 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_72 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15;
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree
        [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_addr_pipe_0];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree
        [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_addr_pipe_0];
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
           == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr));
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
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1 
        = (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt 
           + (QData)((IData)((0x324ULL == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reg_))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7 
        = ((0U != (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                   [0U] | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                           [1U] | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                   [2U] | (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                           [3U] | (
                                                   vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
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
                                                                                [0xfU])))))))))))))))) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
    vlSelf->__VdfgTmp_hcd04e225__0 = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
        [vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom];
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t)) 
              & (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr_next 
        = (((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
            & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
           | (((- (IData)((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
               & ((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))) 
              | ((- (IData)((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                 & ((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                    | ((0x3cU & ((0xfffffffcU & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                  << 2U) 
                                                 & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                     & ((IData)(1U) 
                                        + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                           >> 2U))) 
                                    << 2U))) | (3U 
                                                & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr_next 
        = (((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
            & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
           | (((- (IData)((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
               & ((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))) 
              | ((- (IData)((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                 & ((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                    | ((0x3cU & ((0xfffffffcU & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                  << 2U) 
                                                 & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                     & ((IData)(1U) 
                                        + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                           >> 2U))) 
                                    << 2U))) | (3U 
                                                & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr_next 
        = (((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
            & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
           | (((- (IData)((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
               & ((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))) 
              | ((- (IData)((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                 & ((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                    | ((0x3cU & ((0xfffffffcU & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                  << 2U) 
                                                 & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                     & ((IData)(1U) 
                                        + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                           >> 2U))) 
                                    << 2U))) | (3U 
                                                & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr_next 
        = (((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
            & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
           | (((- (IData)((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
               & ((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                   >> 2U)) << 2U) | 
                  (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))) 
              | ((- (IData)((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                 & ((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                    | ((0x3cU & ((0xfffffffcU & (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                  << 2U) 
                                                 & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                 | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                     & ((IData)(1U) 
                                        + (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                           >> 2U))) 
                                    << 2U))) | (3U 
                                                & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))))));
    vlSelf->__Vtableidx5 = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value 
        = Vsimu_top__ConstPool__TABLE_hc0dde5b8_0[vlSelf->__Vtableidx5];
    vlSelf->__Vtableidx8 = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value 
        = Vsimu_top__ConstPool__TABLE_h13b579b2_0[vlSelf->__Vtableidx8];
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 2U) & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                         | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                            | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r)))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_push_pulse 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid 
        = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
           & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
              & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                 & ((3U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                    & (4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bresp;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bresp;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rresp;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rresp;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next 
        = (0x1ffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                     + (0xffU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                 >> 0x10U))));
    vlSelf->__Vtableidx4 = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level 
        = Vsimu_top__ConstPool__TABLE_h9e057a56_0[vlSelf->__Vtableidx4];
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
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hce37628e__0 
        = ((~ (IData)((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt)))) 
           & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                    >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready 
        = ((8U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_awready) 
                              << 2U) | (1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out 
        = ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
               >> 6U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0 
            = ((0xcU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                        << 2U)) | ((2U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 1U)) | 
                                   (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 3U))));
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_in 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
    } else {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0 
            = ((IData)(vlSelf->simu_top__DOT__soc__DOT__UART_RI) 
               << 1U);
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_in 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol)
                      ? (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad))
                      : (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad)));
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast) 
            << 4U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast) 
                       << 3U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast) 
                                  << 2U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast) 
                                             << 1U) 
                                            | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast)))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready 
        = ((8U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)) 
                  << 3U)) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_arready) 
                              << 2U) | (1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time) 
           == (7U & ((IData)(1U) + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
           == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h882fb5aa__0 
        = ((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
           | (1U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1 
        = (((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
              & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
              [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
             & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                  : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag)) 
            << 1U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                       & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                       [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
                      & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                           ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                          [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                           : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_2 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
           & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_3 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
            & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
           & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
               [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag));
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
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))];
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[2U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[3U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[5U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[6U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[7U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[8U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[9U] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xaU] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xbU] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xcU] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xdU] 
        = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xeU] 
        = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15)) 
                    << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xfU] 
        = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15)) 
                     << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14))) 
                   >> 0x20U));
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
    } else if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
    } else if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
    } else if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xfU];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU] 
            = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr) 
           == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 2U)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0U] 
        = vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bid;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2U] 
        = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3U] 
        = vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bid;
    vlSelf->uart_rx__en0 = ((2U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))) 
                            | (3U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr) 
           == ((2U & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr) 
                          >> 1U)) << 1U)) | (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0U] 
        = vlSelf->ram_rdata;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rdata;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3U] 
        = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rdata;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2U] 
        = ((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
            ? vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32
            : ((1U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 8U)
                : ((2U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                    ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x10U)
                    : ((3U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                        ? VL_SHIFTL_III(32,32,32, vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x18U)
                        : 0U))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid) 
            << 3U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid) 
                       << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)));
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid 
        = vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout 
        = ((1U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
            ? 3U : ((2U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                     ? 4U : ((4U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                              ? 5U : ((3U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                       ? ((3U != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                           ? 3U : 4U)
                                       : ((6U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                           ? ((4U != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                               ? 4U
                                               : 5U)
                                           : ((5U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                               ? ((5U 
                                                   != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                   ? 5U
                                                   : 3U)
                                               : ((7U 
                                                   == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid))
                                                   ? 
                                                  ((3U 
                                                    == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                    ? 4U
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num))
                                                     ? 5U
                                                     : 3U))
                                                   : 7U)))))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1 
        = vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid) 
            << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0 
        = (1U & ((~ (IData)(vlSelf->enable_delay)) 
                 | (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                    >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0U] 
        = vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rid;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2U] 
        = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3U] 
        = vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4U] 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rid;
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid 
        = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
           & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram
        [(1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))];
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0 
        = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_push_pulse));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_35 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
              | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_toggle 
        = (1U & (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                  ^ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                 >> 8U));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count) 
              >= (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level)));
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
    if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_6 
            = ((IData)(0x10U) + vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg);
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_5 = 0U;
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_6 = 0x1c000000U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_5 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state;
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hce37628e__0) 
           & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_hi_1 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_3) 
            << 1U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_2));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_3) 
            << 3U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_2) 
                       << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1)));
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
    vlSelf->simu_top__DOT__soc__DOT__m0_wvalid = ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
                                                  & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0) 
              << 1U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0) 
              << 2U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0) 
              << 3U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & (4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir)));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit 
        = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0) 
              << 4U));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h882fb5aa__0) 
           | ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                  >> 2U)) & (IData)(vlSelf->uart_rx__en0)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5 
        = (((~ (IData)(vlSelf->uart_rx__en0)) | ((0U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                                 & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                                    | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                                       & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0))))) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hce37628e__0));
    vlSelf->simu_top__DOT__uart_rx__out__strong__out3 
        = ((IData)(vlSelf->uart_rx__en0) & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                            ^ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                               >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__max_repeat_time 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0) 
           & ((IData)(vlSelf->uart_rx__en0) & (2U == 
                                               (3U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h882fb5aa__0) 
           | ((IData)(vlSelf->uart_rx__en0) & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                               >> 2U)));
    vlSelf->simu_top__DOT__soc__DOT__s0_wready = (1U 
                                                  & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid)) 
                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out)));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelf->aresetn)));
    vlSelf->simu_top__DOT__soc__DOT__conf_s_wready 
        = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid)) 
                 | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out) 
              & (IData)(vlSelf->aresetn)));
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_1_data 
            = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
               & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                  & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                     & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                        & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_1_data 
            = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                         ? 0U : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                  ? 0U : ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                           ? ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                               ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)
                                           : 0U))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xfU];
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_1_data 
            = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
               & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                  & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                     & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                        & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_1_data 
            = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                         ? 0U : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                  ? 0U : ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                           ? ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                               ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)
                                           : 0U))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xfU];
    }
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_1_data 
            = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
               & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                  & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                     & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                        & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_1_data 
            = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                         ? 0U : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                  ? 0U : ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                           ? ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                               ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)
                                           : 0U))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xfU];
    }
    if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_1_data 
            = ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
               & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                  & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                     & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                        & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_1_data 
            = ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                         ? 0U : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                  ? 0U : ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                           ? ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                               ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)
                                           : 0U))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_1_data 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[1U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][1U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[2U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][2U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[3U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][3U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[4U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][4U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[5U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][5U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[6U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][6U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[7U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][7U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[8U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][8U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[9U] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][9U];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xaU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xaU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xbU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xbU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xcU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xcU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xdU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xdU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xeU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xeU];
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data[0xfU] 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
            [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xfU];
    }
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid) 
            << 3U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0));
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid 
        = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout 
        = ((1U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
            ? 0U : ((2U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                     ? 1U : ((4U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                              ? 2U : ((3U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                       ? ((0U != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                           ? 0U : 1U)
                                       : ((6U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                           ? ((1U != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                               ? 1U
                                               : 2U)
                                           : ((5U == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                               ? ((2U 
                                                   != (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                   ? 2U
                                                   : 0U)
                                               : ((7U 
                                                   == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                    ? 1U
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num))
                                                     ? 2U
                                                     : 0U))
                                                   : 7U)))))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0 
        = vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout;
    if (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0xffU & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma);
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma;
    } else {
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai 
            = (0xffU & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu));
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu;
        vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
            = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr;
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_word_trans_cpu 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
           & (0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                              >> 0xeU))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hcfa3840f__0 
        = ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
               >> 7U)) & (0U == (7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao 
        = (0xffU & ((4U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                     ? ((2U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                         ? ((1U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                             ? ((0x80U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                 ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg)
                                 : (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))
                             : (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr))
                         : ((1U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                             ? (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
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
                                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r))))))))
                             : 0U)) : ((2U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                        ? ((1U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                            ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr)
                                            : ((0x80U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                                   >> 0x10U)
                                                : (0xc0U 
                                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir))))
                                        : ((1U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                            ? ((0x80U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl 
                                                   >> 8U)
                                                : (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier))
                                            : ((0x80U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                ? vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl
                                                : (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out))))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datao_cpu 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
            ? 0U : ((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                     >> 0xeU))) ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao)
                     : 0U));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab) 
           & (0U == (0xfc000U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)));
    if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arburst 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid;
        if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen = 0U;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize = 0U;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr = 0U;
        } else if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen = 0xfU;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize = 2U;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr;
        } else {
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen = 0U;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize = 0U;
            vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr = 0U;
        }
        vlSelf->simu_top__DOT__soc__DOT__m0_arvalid 
            = vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0;
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arburst = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr = 0U;
        vlSelf->simu_top__DOT__soc__DOT__m0_arvalid = 0U;
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 0U;
    vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 0U;
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [0U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 
            (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast));
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 0U;
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [0U];
    } else {
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 0U;
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [1U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 
            (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                   >> 1U));
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [1U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_rvalid = 0U;
    if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid));
    }
    if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 1U));
    }
    if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [2U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 
            (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                   >> 2U));
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [2U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 2U));
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
        vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 
            (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                   >> 3U));
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [3U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 3U));
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [3U];
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way 
        = (((IData)((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_hi_1))) 
            << 1U) | (1U & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_hi_1) 
                             | (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1)) 
                            >> 1U)));
    if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid 
            = (1U & (~ (IData)((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T)))));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid 
            = (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T));
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_18 
            = (0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T));
    } else {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid = 0U;
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_18 
            = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit;
    }
    vlSelf->DAT_O = vlSelf->NAND_top__DOT__REG_DAT_T;
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
    vlSelf->uart_rx = ((IData)(vlSelf->uart_rx__en0) 
                       & (IData)(vlSelf->simu_top__DOT__uart_rx__out__strong__out3));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier) 
            >> 3U) & ((2U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))
                       ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__max_repeat_time)
                       : (0U != (0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr)))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en));
    vlSelf->simu_top__DOT__soc__DOT__uart0_txd_oe = 
        ((IData)(vlSelf->uart_rx__en0) & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en) 
                                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)));
    vlSelf->ram_wen = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb) 
                       & (- (IData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_wready) 
            << 3U) | (((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_wready) 
                       << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__s0_wready)));
    vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb) 
           & (- (IData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel 
        = (((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
            & (7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
            ? 7U : (((7U != (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
                     & (7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
                     ? (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)
                     : (((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)) 
                         & (7U != (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))
                         ? (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)
                         : ((2U < (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel))
                             ? (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0)
                             : (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1)))));
    vlSelf->uart_ctr_bus[0U] = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack;
    vlSelf->uart_ctr_bus[1U] = (IData)((((QData)((IData)(
                                                         (0xfU 
                                                          & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                                         << 0x20U) 
                                        | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw))));
    vlSelf->uart_ctr_bus[2U] = (IData)(((((QData)((IData)(
                                                          (0xfU 
                                                           & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))) 
                                          << 0x20U) 
                                         | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw))) 
                                        >> 0x20U));
    vlSelf->uart_ctr_bus[3U] = vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
              & ((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                  >> 0xeU))) ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                  : (0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                     >> 0xeU))))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgTmp_hf971e7f2__0 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
              & (0U == (0xfc000U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data 
        = (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr)) 
            << 0xdU) | (QData)((IData)((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arburst) 
                                         << 0xbU) | 
                                        (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize) 
                                          << 8U) | 
                                         (0xf0U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen) 
                                                   << 4U)))))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0 
        = ((0x1fafU == (0x1fffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                                   >> 0x10U))) | (0x1fd0U 
                                                  == 
                                                  (0x1fffU 
                                                   & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                                                      >> 0x10U))));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rlast = 
            (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast) 
                   >> 4U));
        vlSelf->simu_top__DOT__soc__DOT__m0_rdata = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_rvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                     >> 4U));
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0));
    if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_rid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid
            [4U];
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
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
            >> 3U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_wready));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__s0_wready));
    vlSelf->uart_tx = (1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__uart0_txd_oe)) 
                             & (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                 >> 4U) | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared) 
                                           | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
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
    vlSelf->simu_top__DOT__soc__DOT__m0_wready = 0U;
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_wready 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready));
    }
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 1U));
    }
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 2U));
    }
    if ((8U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 3U));
    }
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_wready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready) 
                     >> 4U));
    }
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
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1eU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1dU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0) 
              << 1U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x1bU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0) 
              << 2U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0x17U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0) 
              << 3U));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 
        = (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog)) 
            & (4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel))) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog) 
              & (4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg))));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit 
        = ((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit)) 
           | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0) 
              << 4U));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__we 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgTmp_hf971e7f2__0) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgTmp_hf971e7f2__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0) 
            << 3U) | (((0x1fe0U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                                    >> 0x10U)) << 2U) 
                      | (1U & (~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0) 
                                  | (0x1fe0U == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                                                 >> 0x10U)))))));
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
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_del 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
              & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready))));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0));
    vlSelf->write_uart_valid = vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid;
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
    vlSelf->simu_top__DOT__soc__DOT__m0_bvalid = 0U;
    if ((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid));
    }
    if ((2U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 1U));
    }
    if ((4U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [2U];
        vlSelf->simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 2U));
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
        vlSelf->simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 3U));
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [3U];
    }
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_push 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__we) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hcfa3840f__0));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hcfa3840f__0));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re) 
           & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (6U == (7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re) 
           & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (2U == (7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re) 
           & ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                  >> 7U)) & (5U == (7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr))));
    vlSelf->__Vtableidx2 = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit;
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir 
        = Vsimu_top__ConstPool__TABLE_hebd5b4eb_0[vlSelf->__Vtableidx2];
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int 
        = Vsimu_top__ConstPool__TABLE_h2ba417e2_0[vlSelf->__Vtableidx2];
    vlSelf->simu_top__DOT__soc__DOT__m0_arready = 0U;
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_arready 
            = (1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 1U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 1U));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 2U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 2U));
    }
    if ((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
               & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
                  >> 3U)))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 3U));
    }
    if (((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
         & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit) 
            >> 4U))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_arready 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready) 
                     >> 4U));
    }
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
    vlSelf->ram_ren = ((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid) 
                       & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                          | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid) 
           & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
              | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                 >> 3U)));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT___GEN_71 
        = ((~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast) 
               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready))) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid));
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bresp = 
            vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp
            [4U];
        vlSelf->simu_top__DOT__soc__DOT__m0_bvalid 
            = (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                     >> 4U));
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bvalid) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0));
    if ((0x10U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit))) {
        vlSelf->simu_top__DOT__soc__DOT__m0_bid = vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid
            [4U];
    }
    vlSelf->simu_top__DOT__soc__DOT__m0_bready = (IData)(
                                                         ((0U 
                                                           == 
                                                           (0xcU 
                                                            & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid))) 
                                                          & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0)));
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d)) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0));
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins 
        = ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full)) 
           & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready) 
              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid)));
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
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->ram_ren) & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
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
    vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop 
        = (((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
            >> 3U) & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
    vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop 
        = ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
           & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
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
}

VL_ATTR_COLD void Vsimu_top___024root___stl_sequent__TOP__1(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___stl_sequent__TOP__1\n"); );
    // Body
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit 
        = (1U & (~ (IData)((0U != (0xfU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit) 
                                           >> 1U))))));
}

VL_ATTR_COLD void Vsimu_top___024root___stl_comb__TOP__0(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___stl_comb__TOP__0\n"); );
    // Init
    CData/*4:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
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

VL_ATTR_COLD void Vsimu_top___024root___eval_stl(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vsimu_top___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[5U] = 1U;
        vlSelf->__Vm_traceActivity[4U] = 1U;
        vlSelf->__Vm_traceActivity[3U] = 1U;
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
    if ((2ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vsimu_top___024root___stl_sequent__TOP__1(vlSelf);
        vlSelf->__Vm_traceActivity[5U] = 1U;
        vlSelf->__Vm_traceActivity[4U] = 1U;
        vlSelf->__Vm_traceActivity[3U] = 1U;
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
    if ((3ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vsimu_top___024root___stl_comb__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[5U] = 1U;
        vlSelf->__Vm_traceActivity[4U] = 1U;
        vlSelf->__Vm_traceActivity[3U] = 1U;
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

VL_ATTR_COLD void Vsimu_top___024root___eval_triggers__stl(Vsimu_top___024root* vlSelf);

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
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge pclk)\n");
    }
    if ((4ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @(posedge aclk)\n");
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
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge pclk)\n");
    }
    if ((4ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @(posedge aclk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsimu_top___024root___ctor_var_reset(Vsimu_top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___ctor_var_reset\n"); );
    // Body
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
    vlSelf->simu_top__DOT__uart_rx__out__strong__out3 = 0;
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
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wstrb = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reg_ = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT___reg_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arburst = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_arbiter_io_in_1_ready = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT___GEN_71 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_req_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way = VL_RAND_RESET_I(2);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_idx = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_4 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_2 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_3 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T = VL_RAND_RESET_I(4);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_hi_1 = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1 = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_18 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___GEN_35 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_8 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_9 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_10 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_11 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_12 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_13 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_14 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_15 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_16 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_17 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_18 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_19 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_20 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_21 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_22 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_23 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___data_count_T_1 = VL_RAND_RESET_I(5);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_42 = VL_RAND_RESET_I(3);
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_57 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_58 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_59 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_60 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_61 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_62 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_63 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_64 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_65 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_66 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_67 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_68 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_69 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_70 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_71 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_72 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___GEN_86 = VL_RAND_RESET_I(3);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_1_data = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag[__Vi0] = VL_RAND_RESET_I(18);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_1_data = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_1_data = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag[__Vi0] = VL_RAND_RESET_I(18);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_1_data = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_1_data = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag[__Vi0] = VL_RAND_RESET_I(18);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_1_data = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_1_data = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag[__Vi0] = VL_RAND_RESET_I(18);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_1_data = VL_RAND_RESET_I(18);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0[__Vi0]);
    }
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_1_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1[__Vi0]);
    }
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_1_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2[__Vi0]);
    }
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_1_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3[__Vi0]);
    }
    VL_RAND_RESET_W(512, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_1_data);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 256; ++__Vi0) {
        vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree[__Vi0] = VL_RAND_RESET_I(3);
    }
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data = VL_RAND_RESET_I(3);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__victimRespReg = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_5 = VL_RAND_RESET_I(2);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT___GEN_6 = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_pc = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_inst = VL_RAND_RESET_I(32);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___cycleCnt_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT___instrCnt_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random = VL_RAND_RESET_I(23);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random_next = VL_RAND_RESET_I(23);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h343203d2__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h758095b7__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h75ade73a__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__delay__DOT____VdfgTmp_h4b9dd77d__0 = 0;
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
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hfc587a0d__0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hd5ae529f__1 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hc31fd36f__0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_hdb504bf8__0 = VL_RAND_RESET_I(1);
    vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____Vlvbound_h363acc24__0 = VL_RAND_RESET_I(1);
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
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT____VdfgTmp_hf971e7f2__0 = 0;
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
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hcfa3840f__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h882fb5aa__0 = 0;
    vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_hce37628e__0 = 0;
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
    vlSelf->__VdfgTmp_hcd04e225__0 = 0;
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__Vfuncout = VL_RAND_RESET_I(3);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__valid = VL_RAND_RESET_I(3);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__7__pre_num = VL_RAND_RESET_I(3);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__Vfuncout = VL_RAND_RESET_I(3);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__valid = VL_RAND_RESET_I(3);
    vlSelf->__Vfunc_simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__get_num__8__pre_num = VL_RAND_RESET_I(3);
    vlSelf->__Vtableidx2 = 0;
    vlSelf->__Vtableidx4 = 0;
    vlSelf->__Vtableidx5 = 0;
    vlSelf->__Vtableidx8 = 0;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__0 = VL_RAND_RESET_I(5);
    vlSelf->__VstlDidInit = 0;
    vlSelf->__Vtrigprevexpr___TOP__simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit__1 = VL_RAND_RESET_I(5);
    vlSelf->__Vtrigprevexpr___TOP__pclk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__aclk__0 = VL_RAND_RESET_I(1);
    vlSelf->__VactDidInit = 0;
    for (int __Vi0 = 0; __Vi0 < 6; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
