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

extern const VlWide<16>/*511:0*/ Vsimu_top__ConstPool__CONST_h93e1b771_0;

void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<16>/*511:0*/ __Vtemp_1;
    VlWide<16>/*511:0*/ __Vtemp_2;
    VlWide<16>/*511:0*/ __Vtemp_3;
    VlWide<16>/*511:0*/ __Vtemp_4;
    VlWide<16>/*511:0*/ __Vtemp_5;
    VlWide<16>/*511:0*/ __Vtemp_6;
    VlWide<16>/*511:0*/ __Vtemp_7;
    VlWide<16>/*511:0*/ __Vtemp_8;
    VlWide<16>/*511:0*/ __Vtemp_18;
    VlWide<16>/*511:0*/ __Vtemp_20;
    VlWide<16>/*511:0*/ __Vtemp_22;
    VlWide<16>/*511:0*/ __Vtemp_24;
    VlWide<16>/*511:0*/ __Vtemp_26;
    VlWide<16>/*511:0*/ __Vtemp_27;
    VlWide<16>/*511:0*/ __Vtemp_28;
    VlWide<16>/*511:0*/ __Vtemp_29;
    VlWide<16>/*511:0*/ __Vtemp_30;
    VlWide<8>/*255:0*/ __Vtemp_36;
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0U])) {
        bufp->chgIData(oldp+0,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wdata),32);
        bufp->chgCData(oldp+1,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wstrb),4);
        bufp->chgBit(oldp+2,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_data_wlast));
        bufp->chgBit(oldp+3,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid))));
        bufp->chgBit(oldp+4,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 3U))));
        bufp->chgBit(oldp+5,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 2U))));
        bufp->chgBit(oldp+6,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 1U))));
        bufp->chgBit(oldp+7,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 4U))));
        bufp->chgCData(oldp+8,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0]),2);
        bufp->chgCData(oldp+9,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1]),2);
        bufp->chgCData(oldp+10,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2]),2);
        bufp->chgCData(oldp+11,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3]),2);
        bufp->chgCData(oldp+12,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4]),2);
        bufp->chgCData(oldp+13,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0]),2);
        bufp->chgCData(oldp+14,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1]),2);
        bufp->chgCData(oldp+15,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2]),2);
        bufp->chgCData(oldp+16,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3]),2);
        bufp->chgCData(oldp+17,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4]),2);
        bufp->chgCData(oldp+18,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid),5);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgBit(oldp+19,(vlSelf->NAND_top__DOT__HIT0));
        bufp->chgBit(oldp+20,(vlSelf->NAND_top__DOT__HIT1));
        bufp->chgBit(oldp+21,(vlSelf->NAND_top__DOT__HIT2));
        bufp->chgBit(oldp+22,(vlSelf->NAND_top__DOT__HIT3));
        bufp->chgBit(oldp+23,(vlSelf->NAND_top__DOT__HIT6));
        bufp->chgBit(oldp+24,(vlSelf->NAND_top__DOT__HIT7));
        bufp->chgBit(oldp+25,(vlSelf->NAND_top__DOT__HIT8));
        bufp->chgBit(oldp+26,(vlSelf->NAND_top__DOT__HIT9));
        bufp->chgBit(oldp+27,(vlSelf->NAND_top__DOT__HIT10));
        bufp->chgBit(oldp+28,(vlSelf->NAND_top__DOT__HIT11));
        bufp->chgBit(oldp+29,(vlSelf->NAND_top__DOT__NAND_HIT));
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[3U]))) {
        bufp->chgBit(oldp+30,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready));
        bufp->chgBit(oldp+31,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid));
        bufp->chgBit(oldp+32,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready));
        bufp->chgBit(oldp+33,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid));
        bufp->chgBit(oldp+34,(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid));
        bufp->chgBit(oldp+35,(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid));
        bufp->chgBit(oldp+36,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid))));
        bufp->chgBit(oldp+37,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid))));
        bufp->chgBit(oldp+38,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                     >> 3U))));
        bufp->chgBit(oldp+39,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 3U))));
        bufp->chgBit(oldp+40,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                     >> 2U))));
        bufp->chgBit(oldp+41,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 2U))));
        bufp->chgCData(oldp+42,(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen),4);
        bufp->chgBit(oldp+43,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_cpu));
        bufp->chgBit(oldp+44,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                     >> 1U))));
        bufp->chgBit(oldp+45,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 1U))));
        bufp->chgBit(oldp+46,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                     >> 4U))));
        bufp->chgBit(oldp+47,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 4U))));
        bufp->chgIData(oldp+48,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0]),32);
        bufp->chgIData(oldp+49,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1]),32);
        bufp->chgIData(oldp+50,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2]),32);
        bufp->chgIData(oldp+51,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3]),32);
        bufp->chgIData(oldp+52,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4]),32);
        bufp->chgCData(oldp+53,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid),5);
        bufp->chgCData(oldp+54,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid),5);
        bufp->chgBit(oldp+55,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_dir_del));
        bufp->chgBit(oldp+56,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins));
        bufp->chgBit(oldp+57,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+58,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+59,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+60,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+61,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+62,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+63,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+64,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go));
        bufp->chgBit(oldp+65,((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen))));
        bufp->chgBit(oldp+66,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8000U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+67,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8010U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+68,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8020U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+69,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8030U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+70,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8040U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+71,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8050U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+72,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8060U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+73,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0x8070U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+74,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer));
        bufp->chgBit(oldp+75,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xff00U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+76,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xff30U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+77,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xff40U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+78,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid));
        bufp->chgBit(oldp+79,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xf020U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgCData(oldp+80,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__next_state),3);
        bufp->chgSData(oldp+81,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp),16);
        bufp->chgBit(oldp+82,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xf030U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+83,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xf040U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+84,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_s_ram_wen)) 
                               & (0xf050U == (0xffffU 
                                              & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+85,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid)) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready))));
        bufp->chgBit(oldp+86,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                               & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                  & ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                     & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready))))));
        bufp->chgBit(oldp+87,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid)) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_ready))));
        bufp->chgBit(oldp+88,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                               & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                  & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                     & ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                        & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready)))))));
        bufp->chgBit(oldp+89,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                               & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                  & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                     & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                        & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                           & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_w_wready))))))));
        bufp->chgBit(oldp+90,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arvalid) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_arready))));
        bufp->chgBit(oldp+91,(((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wvalid) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_wready))));
        bufp->chgBit(oldp+92,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+93,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+94,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+95,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+96,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+97,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+98,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+99,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go));
    }
    if (VL_UNLIKELY(((vlSelf->__Vm_traceActivity[1U] 
                      | vlSelf->__Vm_traceActivity[3U]) 
                     | vlSelf->__Vm_traceActivity[5U]))) {
        bufp->chgBit(oldp+100,((((8U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast) 
                                    & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                       >> 2U))) | (
                                                   ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                                    >> 2U) 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid)))));
        bufp->chgBit(oldp+101,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
                                & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid) 
                                   & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast) 
                                      & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rready))))));
        bufp->chgBit(oldp+102,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en))));
        bufp->chgBit(oldp+103,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+104,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
                                      | ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                         >> 3U)))));
        bufp->chgBit(oldp+105,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+106,(((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgCData(oldp+107,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)
                                                : 0U))
                                   : 0U)),4);
        bufp->chgIData(oldp+108,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? vlSelf->simu_top__DOT__soc__DOT__m0_rdata
                                                : 0U))
                                   : 0U)),32);
        bufp->chgCData(oldp+109,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rresp)
                                                : 0U))
                                   : 0U)),2);
        bufp->chgBit(oldp+110,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                & ((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & (IData)(((4U == 
                                               (0xcU 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast)))))));
        bufp->chgBit(oldp+111,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                 & (4U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)))) 
                                & (0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U))))));
        bufp->chgCData(oldp+112,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)
                                                : 0U))
                                   : 0U)),4);
        bufp->chgCData(oldp+113,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bresp)
                                                : 0U))
                                   : 0U)),2);
        bufp->chgBit(oldp+114,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid) 
                                 & (4U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)))) 
                                & (0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U))))));
        bufp->chgCData(oldp+115,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)
                                                    : 0U)))
                                   : 0U)),4);
        bufp->chgIData(oldp+116,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? vlSelf->simu_top__DOT__soc__DOT__m0_rdata
                                                    : 0U)))
                                   : 0U)),32);
        bufp->chgCData(oldp+117,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rresp)
                                                    : 0U)))
                                   : 0U)),2);
        bufp->chgBit(oldp+118,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                & ((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & ((1U != (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U))) 
                                      & (IData)(((8U 
                                                  == 
                                                  (0xcU 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                                 & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast))))))));
        bufp->chgBit(oldp+119,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                 & (8U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)))) 
                                & ((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & (1U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgCData(oldp+120,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)
                                                    : 0U)))
                                   : 0U)),4);
        bufp->chgCData(oldp+121,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bresp)
                                                    : 0U)))
                                   : 0U)),2);
        bufp->chgBit(oldp+122,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid) 
                                 & (8U == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)))) 
                                & ((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U))) 
                                   & (1U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))))));
        bufp->chgCData(oldp+123,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)
                                                     : 0U))))
                                   : 0U)),4);
        bufp->chgIData(oldp+124,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? vlSelf->simu_top__DOT__soc__DOT__m0_rdata
                                                     : 0U))))
                                   : 0U)),32);
        bufp->chgCData(oldp+125,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rresp)
                                                     : 0U))))
                                   : 0U)),2);
        bufp->chgBit(oldp+126,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                & ((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & ((1U != (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U))) 
                                      & ((2U != (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U))) 
                                         & (IData)(
                                                   ((0xcU 
                                                     == 
                                                     (0xcU 
                                                      & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                                    & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast)))))))));
        bufp->chgBit(oldp+127,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                 & (0xcU == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid)))) 
                                & (((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                  >> 2U))) 
                                    & (1U != (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))) 
                                   & (2U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgCData(oldp+128,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)
                                                     : 0U))))
                                   : 0U)),4);
        bufp->chgCData(oldp+129,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bresp)
                                                     : 0U))))
                                   : 0U)),2);
        bufp->chgBit(oldp+130,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_b_data_bvalid) 
                                 & (0xcU == (0xcU & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid)))) 
                                & (((0U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                  >> 2U))) 
                                    & (1U != (3U & 
                                              ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))) 
                                   & (2U != (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))))));
        bufp->chgBit(oldp+131,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar_io_out_r_data_rvalid) 
                                & (IData)(((0U == (0xcU 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                           & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rlast))))));
        bufp->chgBit(oldp+132,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+133,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                                      | (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)))));
        bufp->chgBit(oldp+134,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+135,(((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop))));
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[5U]))) {
        bufp->chgIData(oldp+136,(vlSelf->simu_top__DOT__soc__DOT__m0_rdata),32);
        bufp->chgBit(oldp+137,(vlSelf->simu_top__DOT__soc__DOT__m0_bready));
        bufp->chgBit(oldp+138,(vlSelf->simu_top__DOT__soc__DOT__m0_rready));
        bufp->chgBit(oldp+139,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))));
        bufp->chgBit(oldp+140,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))));
        bufp->chgBit(oldp+141,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 3U))));
        bufp->chgBit(oldp+142,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 3U))));
        bufp->chgBit(oldp+143,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 2U))));
        bufp->chgBit(oldp+144,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 2U))));
        bufp->chgBit(oldp+145,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_en));
        bufp->chgCData(oldp+146,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt),4);
        bufp->chgBit(oldp+147,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 1U))));
        bufp->chgBit(oldp+148,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 1U))));
        bufp->chgBit(oldp+149,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 4U))));
        bufp->chgBit(oldp+150,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 4U))));
        bufp->chgCData(oldp+151,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready),5);
        bufp->chgCData(oldp+152,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready),5);
        bufp->chgBit(oldp+153,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+154,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+155,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+156,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+157,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgIData(oldp+158,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rdata),32);
        bufp->chgBit(oldp+159,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_axi_r_in_rvalid));
        bufp->chgBit(oldp+160,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+161,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+162,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+163,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+164,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
        bufp->chgCData(oldp+165,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_hit),5);
        bufp->chgCData(oldp+166,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir),3);
        bufp->chgIData(oldp+167,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int),32);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[3U])) {
        bufp->chgIData(oldp+168,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr),32);
        bufp->chgCData(oldp+169,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen))),4);
        bufp->chgCData(oldp+170,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arsize),3);
        bufp->chgCData(oldp+171,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arburst),2);
        bufp->chgBit(oldp+172,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid));
        bufp->chgBit(oldp+173,(vlSelf->simu_top__DOT__soc__DOT__m0_rlast));
        bufp->chgBit(oldp+174,(vlSelf->simu_top__DOT__soc__DOT__m0_wready));
        bufp->chgBit(oldp+175,(vlSelf->simu_top__DOT__soc__DOT__m0_bvalid));
        bufp->chgBit(oldp+176,(vlSelf->simu_top__DOT__soc__DOT__m0_arready));
        bufp->chgBit(oldp+177,(vlSelf->simu_top__DOT__soc__DOT__m0_rvalid));
        bufp->chgBit(oldp+178,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+179,(vlSelf->simu_top__DOT__soc__DOT__s0_wready));
        bufp->chgCData(oldp+180,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+181,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+182,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+183,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid),4);
        bufp->chgBit(oldp+184,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+185,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+186,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+187,(vlSelf->simu_top__DOT__soc__DOT__conf_s_wready));
        bufp->chgCData(oldp+188,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+189,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+190,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+191,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid),4);
        bufp->chgIData(oldp+192,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg),32);
        bufp->chgBit(oldp+193,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+194,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+195,(vlSelf->simu_top__DOT__soc__DOT__apb_s_awready));
        bufp->chgBit(oldp+196,(vlSelf->simu_top__DOT__soc__DOT__apb_s_wready));
        bufp->chgCData(oldp+197,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id),4);
        bufp->chgBit(oldp+198,(vlSelf->simu_top__DOT__soc__DOT__apb_s_bvalid));
        bufp->chgBit(oldp+199,(vlSelf->simu_top__DOT__soc__DOT__apb_s_arready));
        bufp->chgCData(oldp+200,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id),4);
        bufp->chgIData(oldp+201,(((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
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
        bufp->chgBit(oldp+202,(vlSelf->simu_top__DOT__soc__DOT__apb_s_rlast));
        bufp->chgBit(oldp+203,(vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid));
        bufp->chgIData(oldp+204,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+205,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+206,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgCData(oldp+207,(((IData)(vlSelf->simu_top__DOT__soc__DOT__uart0_int) 
                                  << 1U)),8);
        bufp->chgBit(oldp+208,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 1U))));
        bufp->chgBit(oldp+209,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))));
        bufp->chgBit(oldp+210,(vlSelf->simu_top__DOT__soc__DOT__uart0_int));
        bufp->chgBit(oldp+211,((IData)(((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 4U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared)) 
                                        | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
        bufp->chgBit(oldp+212,(vlSelf->simu_top__DOT__soc__DOT__uart0_txd_oe));
        bufp->chgBit(oldp+213,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                      ^ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 3U)))));
        bufp->chgBit(oldp+214,((1U & (~ (IData)(vlSelf->uart_rx__en0)))));
        bufp->chgBit(oldp+215,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) 
                                & ((0U == (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU)))
                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                    : (0U != (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))))));
        bufp->chgIData(oldp+216,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                   ? ((0U == (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))
                                       ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao)
                                       : 0U) : 0U)),32);
        bufp->chgBit(oldp+217,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant));
        bufp->chgBit(oldp+218,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                & ((0U == (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU)))
                                    ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                    : (0U != (0x3fU 
                                              & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))))));
        bufp->chgBit(oldp+219,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr));
        bufp->chgBit(oldp+220,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu));
        bufp->chgBit(oldp+221,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu));
        bufp->chgIData(oldp+222,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr),20);
        bufp->chgCData(oldp+223,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu),8);
        bufp->chgCData(oldp+224,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datao_cpu),8);
        bufp->chgBit(oldp+225,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_word_trans_cpu));
        bufp->chgIData(oldp+226,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr),24);
        bufp->chgBit(oldp+227,((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                >> 0xeU)))));
        bufp->chgBit(oldp+228,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack));
        bufp->chgBit(oldp+229,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
        bufp->chgBit(oldp+230,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
                                & (0U == (0xfc000U 
                                          & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))));
        bufp->chgIData(oldp+231,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr),20);
        bufp->chgCData(oldp+232,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai),8);
        bufp->chgCData(oldp+233,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao),8);
        bufp->chgBit(oldp+234,((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                >> 0xeU)))));
        bufp->chgBit(oldp+235,(((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU))) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel))));
        bufp->chgBit(oldp+236,(((0U != (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU))) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab))));
        bufp->chgIData(oldp+237,(((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                     ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                        >> 8U) : vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr) 
                                   << 8U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai))),32);
        bufp->chgBit(oldp+238,(((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                 >> 0xeU)))
                                 ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack)
                                 : (0U != (0x3fU & 
                                           (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                            >> 0xeU))))));
        bufp->chgBit(oldp+239,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel));
        bufp->chgBit(oldp+240,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab));
        bufp->chgIData(oldp+241,((0xffffffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                                ? (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                                   >> 8U)
                                                : vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr))),24);
        bufp->chgCData(oldp+242,(((0U == (0x3fU & (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                   >> 0xeU)))
                                   ? (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datao)
                                   : 0U)),8);
        bufp->chgBit(oldp+243,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))));
        bufp->chgBit(oldp+244,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready));
        bufp->chgBit(oldp+245,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd));
        bufp->chgCData(oldp+246,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm),4);
        bufp->chgCData(oldp+247,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb),4);
        bufp->chgCData(oldp+248,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb),4);
        bufp->chgIData(oldp+249,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32),32);
        bufp->chgIData(oldp+250,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32),32);
        bufp->chgCData(oldp+251,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count),3);
        bufp->chgCData(oldp+252,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size),3);
        bufp->chgCData(oldp+253,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size),3);
        bufp->chgCData(oldp+254,((0xffU & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),8);
        bufp->chgBit(oldp+255,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__we));
        bufp->chgBit(oldp+256,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__re));
        bufp->chgBit(oldp+257,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en));
        bufp->chgBit(oldp+258,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en));
        bufp->chgBit(oldp+259,(vlSelf->uart_rx__en0));
        bufp->chgCData(oldp+260,((7U & vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),3);
        bufp->chgBit(oldp+261,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable));
        bufp->chgBit(oldp+262,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad));
        bufp->chgCData(oldp+263,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier),4);
        bufp->chgCData(oldp+264,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir),4);
        bufp->chgCData(oldp+265,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr),2);
        bufp->chgCData(oldp+266,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr),5);
        bufp->chgBit(oldp+267,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared));
        bufp->chgBit(oldp+268,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol));
        bufp->chgCData(oldp+269,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr),8);
        bufp->chgCData(oldp+270,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr),8);
        bufp->chgIData(oldp+271,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl),24);
        bufp->chgBit(oldp+272,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc));
        bufp->chgBit(oldp+273,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d));
        bufp->chgBit(oldp+274,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset));
        bufp->chgSData(oldp+275,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc),16);
        bufp->chgCData(oldp+276,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level),4);
        bufp->chgBit(oldp+277,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset));
        bufp->chgBit(oldp+278,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset));
        bufp->chgBit(oldp+279,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                      >> 7U))));
        bufp->chgBit(oldp+280,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 2U))));
        bufp->chgBit(oldp+281,((1U & (~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 2U)))));
        bufp->chgBit(oldp+282,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg));
        bufp->chgBit(oldp+283,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg));
        bufp->chgCData(oldp+284,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg),8);
        bufp->chgCData(oldp+285,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg),8);
        bufp->chgCData(oldp+286,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count),8);
        bufp->chgCData(oldp+287,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg),3);
        bufp->chgBit(oldp+288,((0U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+289,((1U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+290,((2U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+291,((3U == (3U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+292,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en));
        bufp->chgBit(oldp+293,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 3U))));
        bufp->chgBit(oldp+294,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 4U))));
        bufp->chgBit(oldp+295,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 3U))));
        bufp->chgBit(oldp+296,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 2U))));
        bufp->chgBit(oldp+297,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0) 
                                      >> 1U))));
        bufp->chgBit(oldp+298,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgTmp_h704d72b7__0))));
        bufp->chgCData(oldp+299,((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
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
        bufp->chgBit(oldp+300,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
        bufp->chgBit(oldp+301,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
        bufp->chgBit(oldp+302,((1U & ((IData)(vlSelf->__VdfgTmp_hcd04e225__0) 
                                      >> 1U))));
        bufp->chgBit(oldp+303,((1U & (IData)(vlSelf->__VdfgTmp_hcd04e225__0))));
        bufp->chgBit(oldp+304,((1U & ((IData)(vlSelf->__VdfgTmp_hcd04e225__0) 
                                      >> 2U))));
        bufp->chgBit(oldp+305,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5));
        bufp->chgBit(oldp+306,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6));
        bufp->chgBit(oldp+307,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
        bufp->chgBit(oldp+308,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r));
        bufp->chgBit(oldp+309,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r));
        bufp->chgBit(oldp+310,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r));
        bufp->chgBit(oldp+311,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r));
        bufp->chgBit(oldp+312,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r));
        bufp->chgBit(oldp+313,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
        bufp->chgBit(oldp+314,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r));
        bufp->chgBit(oldp+315,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r));
        bufp->chgBit(oldp+316,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask));
        bufp->chgBit(oldp+317,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
        bufp->chgBit(oldp+318,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
        bufp->chgBit(oldp+319,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int));
        bufp->chgBit(oldp+320,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
        bufp->chgBit(oldp+321,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int));
        bufp->chgBit(oldp+322,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_push));
        bufp->chgBit(oldp+323,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop));
        bufp->chgSData(oldp+324,((((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out) 
                                   << 3U) | (IData)(vlSelf->__VdfgTmp_hcd04e225__0))),11);
        bufp->chgBit(oldp+325,((0U != (vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
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
        bufp->chgCData(oldp+326,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count),5);
        bufp->chgCData(oldp+327,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count),5);
        bufp->chgCData(oldp+328,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate),3);
        bufp->chgCData(oldp+329,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate),4);
        bufp->chgSData(oldp+330,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t),10);
        bufp->chgBit(oldp+331,((1U & (~ (IData)((0U 
                                                 != (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt)))))));
        bufp->chgCData(oldp+332,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt),8);
        bufp->chgCData(oldp+333,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value),8);
        bufp->chgBit(oldp+334,((1U & ((~ (IData)(vlSelf->uart_rx__en0)) 
                                      | ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                         & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                            | ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                               & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgTmp_hd44064a6__0))))))));
        bufp->chgBit(oldp+335,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__max_repeat_time));
        bufp->chgBit(oldp+336,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
        bufp->chgBit(oldp+337,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_in));
        bufp->chgBit(oldp+338,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_push_pulse));
        bufp->chgBit(oldp+339,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
        bufp->chgBit(oldp+340,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read));
        bufp->chgBit(oldp+341,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read));
        bufp->chgBit(oldp+342,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read));
        bufp->chgCData(oldp+343,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals),4);
        bufp->chgBit(oldp+344,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d));
        bufp->chgBit(oldp+345,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d));
        bufp->chgBit(oldp+346,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d));
        bufp->chgBit(oldp+347,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d));
        bufp->chgBit(oldp+348,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d));
        bufp->chgBit(oldp+349,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d));
        bufp->chgBit(oldp+350,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d));
        bufp->chgBit(oldp+351,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d));
        bufp->chgSData(oldp+352,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt),9);
        bufp->chgSData(oldp+353,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next),9);
        bufp->chgBit(oldp+354,((1U & (((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                                       ^ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                                      >> 8U))));
        bufp->chgBit(oldp+355,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d));
        bufp->chgBit(oldp+356,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d));
        bufp->chgBit(oldp+357,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d));
        bufp->chgBit(oldp+358,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d));
        bufp->chgBit(oldp+359,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d));
        bufp->chgBit(oldp+360,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))));
        bufp->chgBit(oldp+361,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))));
        bufp->chgBit(oldp+362,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))));
        bufp->chgBit(oldp+363,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))));
        bufp->chgBit(oldp+364,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))));
        bufp->chgBit(oldp+365,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd));
        bufp->chgBit(oldp+366,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd));
        bufp->chgBit(oldp+367,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd));
        bufp->chgBit(oldp+368,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd));
        bufp->chgBit(oldp+369,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd));
        bufp->chgBit(oldp+370,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read));
        bufp->chgBit(oldp+371,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
        bufp->chgBit(oldp+372,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable));
        bufp->chgCData(oldp+373,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16),4);
        bufp->chgCData(oldp+374,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter),3);
        bufp->chgCData(oldp+375,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift),8);
        bufp->chgBit(oldp+376,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity));
        bufp->chgBit(oldp+377,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error));
        bufp->chgBit(oldp+378,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error));
        bufp->chgBit(oldp+379,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in));
        bufp->chgBit(oldp+380,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor));
        bufp->chgCData(oldp+381,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b),8);
        bufp->chgBit(oldp+382,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q));
        bufp->chgSData(oldp+383,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in),11);
        bufp->chgBit(oldp+384,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
        bufp->chgBit(oldp+385,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))));
        bufp->chgBit(oldp+386,((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+387,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+388,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgCData(oldp+389,((0xfU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                                          - (IData)(1U)))),4);
        bufp->chgSData(oldp+390,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value),10);
        bufp->chgCData(oldp+391,((0xffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                           >> 2U))),8);
        bufp->chgCData(oldp+392,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out),8);
        bufp->chgCData(oldp+393,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0]),3);
        bufp->chgCData(oldp+394,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1]),3);
        bufp->chgCData(oldp+395,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2]),3);
        bufp->chgCData(oldp+396,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3]),3);
        bufp->chgCData(oldp+397,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4]),3);
        bufp->chgCData(oldp+398,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5]),3);
        bufp->chgCData(oldp+399,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6]),3);
        bufp->chgCData(oldp+400,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7]),3);
        bufp->chgCData(oldp+401,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8]),3);
        bufp->chgCData(oldp+402,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9]),3);
        bufp->chgCData(oldp+403,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[10]),3);
        bufp->chgCData(oldp+404,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[11]),3);
        bufp->chgCData(oldp+405,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[12]),3);
        bufp->chgCData(oldp+406,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[13]),3);
        bufp->chgCData(oldp+407,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[14]),3);
        bufp->chgCData(oldp+408,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[15]),3);
        bufp->chgCData(oldp+409,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top),4);
        bufp->chgCData(oldp+410,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom),4);
        bufp->chgCData(oldp+411,((0xfU & ((IData)(1U) 
                                          + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)))),4);
        bufp->chgCData(oldp+412,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0U]),3);
        bufp->chgCData(oldp+413,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [1U]),3);
        bufp->chgCData(oldp+414,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [2U]),3);
        bufp->chgCData(oldp+415,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [3U]),3);
        bufp->chgCData(oldp+416,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [4U]),3);
        bufp->chgCData(oldp+417,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [5U]),3);
        bufp->chgCData(oldp+418,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [6U]),3);
        bufp->chgCData(oldp+419,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [7U]),3);
        bufp->chgCData(oldp+420,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [8U]),3);
        bufp->chgCData(oldp+421,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [9U]),3);
        bufp->chgCData(oldp+422,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xaU]),3);
        bufp->chgCData(oldp+423,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xbU]),3);
        bufp->chgCData(oldp+424,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xcU]),3);
        bufp->chgCData(oldp+425,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xdU]),3);
        bufp->chgCData(oldp+426,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xeU]),3);
        bufp->chgCData(oldp+427,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0xfU]),3);
        bufp->chgCData(oldp+428,((0xffU & ((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                                           >> 3U))),8);
        bufp->chgCData(oldp+429,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+430,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+431,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+432,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+433,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+434,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+435,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+436,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+437,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+438,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+439,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+440,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+441,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+442,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+443,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+444,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[15]),8);
        bufp->chgBit(oldp+445,(((IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_en))));
        bufp->chgCData(oldp+446,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter),5);
        bufp->chgCData(oldp+447,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter),3);
        bufp->chgCData(oldp+448,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out),7);
        bufp->chgBit(oldp+449,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
        bufp->chgBit(oldp+450,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor));
        bufp->chgBit(oldp+451,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop));
        bufp->chgBit(oldp+452,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out));
        bufp->chgBit(oldp+453,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error));
        bufp->chgCData(oldp+454,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time),3);
        bufp->chgCData(oldp+455,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out),8);
        bufp->chgBit(oldp+456,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun));
        bufp->chgCData(oldp+457,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak),8);
        bufp->chgCData(oldp+458,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top),4);
        bufp->chgCData(oldp+459,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom),4);
        bufp->chgCData(oldp+460,((0xfU & ((IData)(1U) 
                                          + (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)))),4);
        bufp->chgCData(oldp+461,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+462,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+463,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+464,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+465,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+466,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+467,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+468,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+469,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+470,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+471,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+472,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+473,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+474,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+475,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+476,(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[15]),8);
        bufp->chgCData(oldp+477,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit),5);
        bufp->chgCData(oldp+478,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit),5);
        bufp->chgCData(oldp+479,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit),5);
        bufp->chgCData(oldp+480,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready),5);
        bufp->chgCData(oldp+481,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready),5);
        bufp->chgCData(oldp+482,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid),5);
        bufp->chgCData(oldp+483,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready),5);
        bufp->chgCData(oldp+484,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast),5);
        bufp->chgCData(oldp+485,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid),5);
        bufp->chgCData(oldp+486,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0]),4);
        bufp->chgCData(oldp+487,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1]),4);
        bufp->chgCData(oldp+488,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2]),4);
        bufp->chgCData(oldp+489,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3]),4);
        bufp->chgCData(oldp+490,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4]),4);
        bufp->chgCData(oldp+491,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0]),4);
        bufp->chgCData(oldp+492,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1]),4);
        bufp->chgCData(oldp+493,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2]),4);
        bufp->chgCData(oldp+494,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3]),4);
        bufp->chgCData(oldp+495,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4]),4);
        bufp->chgCData(oldp+496,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0),3);
        bufp->chgCData(oldp+497,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1),3);
        bufp->chgCData(oldp+498,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0),3);
        bufp->chgCData(oldp+499,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid),3);
        bufp->chgCData(oldp+500,((((IData)(vlSelf->simu_top__DOT__soc__DOT__apb_s_rvalid) 
                                   << 2U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid))),3);
        bufp->chgCData(oldp+501,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid),3);
        bufp->chgBit(oldp+502,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty));
        bufp->chgBit(oldp+503,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full));
        bufp->chgBit(oldp+504,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty));
        bufp->chgBit(oldp+505,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full));
        bufp->chgCData(oldp+506,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir),3);
        bufp->chgCData(oldp+507,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel),3);
        bufp->chgBit(oldp+508,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog));
        bufp->chgCData(oldp+509,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg),3);
        bufp->chgCData(oldp+510,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel),3);
        bufp->chgCData(oldp+511,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel),3);
        bufp->chgCData(oldp+512,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir),3);
        bufp->chgCData(oldp+513,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel),3);
        bufp->chgBit(oldp+514,((1U & (~ ((IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgTmp_h58d65b4b__0) 
                                         | (0x1fe0U 
                                            == (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_araddr 
                                                >> 0x10U)))))));
        bufp->chgIData(oldp+515,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int),32);
        bufp->chgCData(oldp+516,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+517,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+518,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+519,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+520,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+521,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+522,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i),32);
        bufp->chgCData(oldp+523,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+524,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+525,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+526,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+527,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+528,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+529,(vlSelf->simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i),32);
        bufp->chgQData(oldp+530,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)) 
                                   << 0x2bU) | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize)) 
                                                 << 0x28U) 
                                                | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                    << 0x24U) 
                                                   | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                       << 4U) 
                                                      | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid))))))),45);
        bufp->chgIData(oldp+532,(((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+533,((((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
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
        bufp->chgIData(oldp+534,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
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
        bufp->chgCData(oldp+535,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+536,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+537,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+538,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+539,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+540,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+541,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+542,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+543,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+544,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data),45);
        bufp->chgQData(oldp+546,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+548,((IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                          >> 0xdU))),32);
        bufp->chgCData(oldp+549,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 0xbU)))),2);
        bufp->chgCData(oldp+550,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+551,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                  >> 4U)))),4);
        bufp->chgCData(oldp+552,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+553,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+554,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+555,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                   << 0xdU) | (QData)((IData)(
                                                              (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                << 0xbU) 
                                                               | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                   << 8U) 
                                                                  | (((IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                      << 4U) 
                                                                     | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid)))))))),45);
        bufp->chgIData(oldp+557,(((((IData)(1U) + (vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+558,((((- (IData)((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
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
        bufp->chgIData(oldp+559,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
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
        bufp->chgCData(oldp+560,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+561,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+562,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+563,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+564,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+565,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+566,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+567,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+568,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+569,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+571,((IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                          >> 0xdU))),32);
        bufp->chgCData(oldp+572,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 0xbU)))),2);
        bufp->chgCData(oldp+573,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+574,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                  >> 4U)))),4);
        bufp->chgCData(oldp+575,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+576,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+577,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+578,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+579,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+580,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgCData(oldp+581,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgBit(oldp+582,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+583,(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid));
        bufp->chgIData(oldp+584,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr0),32);
        bufp->chgIData(oldp+585,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr1),32);
        bufp->chgIData(oldp+586,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr2),32);
        bufp->chgIData(oldp+587,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr3),32);
        bufp->chgIData(oldp+588,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr4),32);
        bufp->chgIData(oldp+589,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr5),32);
        bufp->chgIData(oldp+590,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr6),32);
        bufp->chgIData(oldp+591,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__cr7),32);
        bufp->chgIData(oldp+592,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_data),32);
        bufp->chgIData(oldp+593,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data),32);
        bufp->chgIData(oldp+594,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data),32);
        bufp->chgIData(oldp+595,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_data),32);
        bufp->chgIData(oldp+596,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),32);
        bufp->chgIData(oldp+597,(((2U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                         << 1U)) | 
                                  (1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))))),32);
        bufp->chgCData(oldp+598,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data),8);
        bufp->chgBit(oldp+599,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid));
        bufp->chgIData(oldp+600,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r2),32);
        bufp->chgIData(oldp+601,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__simu_flag),32);
        bufp->chgIData(oldp+602,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__io_simu),32);
        bufp->chgCData(oldp+603,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data),8);
        bufp->chgBit(oldp+604,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__open_trace));
        bufp->chgBit(oldp+605,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__num_monitor));
        bufp->chgBit(oldp+606,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin));
        bufp->chgBit(oldp+607,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1));
        bufp->chgBit(oldp+608,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2));
        bufp->chgBit(oldp+609,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3));
        bufp->chgBit(oldp+610,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1));
        bufp->chgBit(oldp+611,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2));
        bufp->chgIData(oldp+612,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r),32);
        bufp->chgIData(oldp+613,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1),32);
        bufp->chgIData(oldp+614,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2),32);
        bufp->chgIData(oldp+615,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer_r1),32);
        bufp->chgIData(oldp+616,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__timer),32);
        bufp->chgCData(oldp+617,((0xffU & vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata)),8);
        bufp->chgSData(oldp+618,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),16);
        bufp->chgCData(oldp+619,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state),3);
        bufp->chgBit(oldp+620,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_flag));
        bufp->chgIData(oldp+621,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count),20);
        bufp->chgCData(oldp+622,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state_count),4);
        bufp->chgBit(oldp+623,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                      >> 0x13U))));
        bufp->chgBit(oldp+624,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r));
        bufp->chgBit(oldp+625,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r));
        bufp->chgBit(oldp+626,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_flag));
        bufp->chgIData(oldp+627,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count),20);
        bufp->chgBit(oldp+628,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
                                      >> 0x13U))));
        bufp->chgBit(oldp+629,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_flag));
        bufp->chgIData(oldp+630,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count),20);
        bufp->chgBit(oldp+631,((1U & (vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
                                      >> 0x13U))));
        bufp->chgIData(oldp+632,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__count),20);
        bufp->chgCData(oldp+633,(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__scan_data),4);
        bufp->chgCData(oldp+634,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_out_bits_arlen),8);
        bufp->chgIData(oldp+635,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+636,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0xfU : 0U))),8);
        bufp->chgCData(oldp+637,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+638,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid),2);
        bufp->chgBit(oldp+639,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid));
        bufp->chgBit(oldp+640,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))));
        bufp->chgIData(oldp+641,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg),32);
        bufp->chgBit(oldp+642,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_req_valid));
        VL_SHIFTR_WWI(512,512,10, __Vtemp_1, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U)), 5U)));
        bufp->chgIData(oldp+643,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid)
                                   ? __Vtemp_1[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_2, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(1U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgIData(oldp+644,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid)
                                   ? __Vtemp_2[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_3, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(2U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgIData(oldp+645,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid)
                                   ? __Vtemp_3[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_4, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(3U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgIData(oldp+646,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid)
                                   ? __Vtemp_4[0U] : 0U)),32);
        bufp->chgIData(oldp+647,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr
                                   : 0U)),32);
        bufp->chgBit(oldp+648,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid));
        bufp->chgBit(oldp+649,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_cpu_resp_valid) 
                                & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state)))));
        bufp->chgBit(oldp+650,((0x324ULL == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reg_)));
        bufp->chgQData(oldp+651,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__reg_),64);
        bufp->chgBit(oldp+653,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid));
        bufp->chgBit(oldp+654,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid)))));
        bufp->chgBit(oldp+655,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__ar_arbiter_io_in_0_valid)))));
        bufp->chgBit(oldp+656,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid));
        bufp->chgQData(oldp+657,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_pc),64);
        bufp->chgIData(oldp+659,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_inst),32);
        bufp->chgQData(oldp+660,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt),64);
        bufp->chgQData(oldp+662,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt),64);
        bufp->chgBit(oldp+664,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_valid));
        bufp->chgCData(oldp+665,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state),2);
        bufp->chgBit(oldp+666,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid));
        bufp->chgCData(oldp+667,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_idx),8);
        bufp->chgBit(oldp+668,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+669,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+670,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+671,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+672,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+673,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+674,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+675,(((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        if (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
            __Vtemp_5[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0U];
            __Vtemp_5[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][1U];
            __Vtemp_5[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][2U];
            __Vtemp_5[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][3U];
            __Vtemp_5[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][4U];
            __Vtemp_5[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][5U];
            __Vtemp_5[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][6U];
            __Vtemp_5[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][7U];
            __Vtemp_5[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][8U];
            __Vtemp_5[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][9U];
            __Vtemp_5[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xaU];
            __Vtemp_5[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xbU];
            __Vtemp_5[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xcU];
            __Vtemp_5[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xdU];
            __Vtemp_5[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xeU];
            __Vtemp_5[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0xfU];
            __Vtemp_6[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0U];
            __Vtemp_6[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][1U];
            __Vtemp_6[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][2U];
            __Vtemp_6[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][3U];
            __Vtemp_6[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][4U];
            __Vtemp_6[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][5U];
            __Vtemp_6[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][6U];
            __Vtemp_6[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][7U];
            __Vtemp_6[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][8U];
            __Vtemp_6[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][9U];
            __Vtemp_6[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xaU];
            __Vtemp_6[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xbU];
            __Vtemp_6[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xcU];
            __Vtemp_6[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xdU];
            __Vtemp_6[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xeU];
            __Vtemp_6[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0xfU];
            __Vtemp_7[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0U];
            __Vtemp_7[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][1U];
            __Vtemp_7[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][2U];
            __Vtemp_7[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][3U];
            __Vtemp_7[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][4U];
            __Vtemp_7[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][5U];
            __Vtemp_7[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][6U];
            __Vtemp_7[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][7U];
            __Vtemp_7[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][8U];
            __Vtemp_7[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][9U];
            __Vtemp_7[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xaU];
            __Vtemp_7[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xbU];
            __Vtemp_7[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xcU];
            __Vtemp_7[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xdU];
            __Vtemp_7[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xeU];
            __Vtemp_7[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0xfU];
            __Vtemp_8[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0U];
            __Vtemp_8[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][1U];
            __Vtemp_8[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][2U];
            __Vtemp_8[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][3U];
            __Vtemp_8[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][4U];
            __Vtemp_8[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][5U];
            __Vtemp_8[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][6U];
            __Vtemp_8[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][7U];
            __Vtemp_8[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][8U];
            __Vtemp_8[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][9U];
            __Vtemp_8[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xaU];
            __Vtemp_8[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xbU];
            __Vtemp_8[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xcU];
            __Vtemp_8[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xdU];
            __Vtemp_8[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xeU];
            __Vtemp_8[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0xfU];
        } else {
            __Vtemp_5[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_5[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_5[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_5[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_5[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_5[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_5[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_5[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_5[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_5[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_5[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_5[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_5[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_5[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_5[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_5[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
            __Vtemp_6[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_6[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_6[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_6[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_6[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_6[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_6[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_6[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_6[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_6[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_6[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_6[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_6[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_6[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_6[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_6[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
            __Vtemp_7[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_7[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_7[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_7[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_7[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_7[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_7[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_7[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_7[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_7[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_7[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_7[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_7[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_7[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_7[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_7[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
            __Vtemp_8[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_8[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_8[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_8[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_8[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_8[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_8[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_8[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_8[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_8[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_8[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_8[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_8[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_8[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_8[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_8[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        }
        bufp->chgWData(oldp+676,(__Vtemp_5),512);
        bufp->chgWData(oldp+692,(__Vtemp_6),512);
        bufp->chgWData(oldp+708,(__Vtemp_7),512);
        bufp->chgWData(oldp+724,(__Vtemp_8),512);
        bufp->chgBit(oldp+740,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid));
        bufp->chgIData(oldp+741,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_addr),32);
        bufp->chgIData(oldp+742,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag),18);
        bufp->chgCData(oldp+743,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__victimRespReg),2);
        bufp->chgBit(oldp+744,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid));
        if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_18[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_18[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_18[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_18[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_18[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_18[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_18[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_18[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_18[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_18[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_18[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_18[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_18[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_18[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_18[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        } else if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_18[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_18[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_18[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_18[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_18[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_18[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_18[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_18[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_18[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_18[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_18[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_18[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_18[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_18[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_18[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        } else if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_18[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_18[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_18[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_18[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_18[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_18[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_18[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_18[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_18[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_18[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_18[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_18[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_18[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_18[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_18[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        } else if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_18[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_18[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_18[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_18[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_18[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_18[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_18[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_18[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_18[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_18[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_18[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_18[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_18[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_18[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_18[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        } else if ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0U];
            __Vtemp_18[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[1U];
            __Vtemp_18[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[2U];
            __Vtemp_18[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[3U];
            __Vtemp_18[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[4U];
            __Vtemp_18[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[5U];
            __Vtemp_18[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[6U];
            __Vtemp_18[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[7U];
            __Vtemp_18[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[8U];
            __Vtemp_18[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[9U];
            __Vtemp_18[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xaU];
            __Vtemp_18[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xbU];
            __Vtemp_18[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xcU];
            __Vtemp_18[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xdU];
            __Vtemp_18[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xeU];
            __Vtemp_18[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0xfU];
        } else {
            __Vtemp_18[0U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0U];
            __Vtemp_18[1U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[1U];
            __Vtemp_18[2U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[2U];
            __Vtemp_18[3U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[3U];
            __Vtemp_18[4U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[4U];
            __Vtemp_18[5U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[5U];
            __Vtemp_18[6U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[6U];
            __Vtemp_18[7U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[7U];
            __Vtemp_18[8U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[8U];
            __Vtemp_18[9U] = Vsimu_top__ConstPool__CONST_h93e1b771_0[9U];
            __Vtemp_18[0xaU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xaU];
            __Vtemp_18[0xbU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xbU];
            __Vtemp_18[0xcU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xcU];
            __Vtemp_18[0xdU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xdU];
            __Vtemp_18[0xeU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xeU];
            __Vtemp_18[0xfU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0xfU];
        }
        bufp->chgWData(oldp+745,(__Vtemp_18),512);
        bufp->chgCData(oldp+761,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx)
                                               : 0U)))))),8);
        bufp->chgIData(oldp+762,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((4U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)))))),18);
        bufp->chgBit(oldp+763,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid));
        bufp->chgCData(oldp+764,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way),2);
        bufp->chgBit(oldp+765,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_valid));
        bufp->chgCData(oldp+766,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx),8);
        bufp->chgCData(oldp+767,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way),2);
        bufp->chgBit(oldp+768,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+769,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((0U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+770,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+771,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((1U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+772,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+773,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+774,(((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+775,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((3U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgWData(oldp+776,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data),512);
        bufp->chgBit(oldp+792,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_en_pipe_0));
        bufp->chgCData(oldp+793,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+794,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+810,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_en_pipe_0));
        bufp->chgWData(oldp+811,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0]),512);
        if ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_20[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_20[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_20[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_20[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_20[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_20[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_20[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_20[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_20[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_20[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_20[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
            __Vtemp_20[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
            __Vtemp_20[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
            __Vtemp_20[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
            __Vtemp_20[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
            __Vtemp_20[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
        } else {
            __Vtemp_20[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0U];
            __Vtemp_20[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][1U];
            __Vtemp_20[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][2U];
            __Vtemp_20[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][3U];
            __Vtemp_20[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][4U];
            __Vtemp_20[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][5U];
            __Vtemp_20[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][6U];
            __Vtemp_20[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][7U];
            __Vtemp_20[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][8U];
            __Vtemp_20[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][9U];
            __Vtemp_20[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xaU];
            __Vtemp_20[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xbU];
            __Vtemp_20[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xcU];
            __Vtemp_20[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xdU];
            __Vtemp_20[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xeU];
            __Vtemp_20[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0xfU];
        }
        bufp->chgWData(oldp+827,(__Vtemp_20),512);
        bufp->chgBit(oldp+843,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_en_pipe_0));
        bufp->chgCData(oldp+844,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+845,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+861,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_en_pipe_0));
        bufp->chgWData(oldp+862,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0]),512);
        if ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_22[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_22[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_22[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_22[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_22[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_22[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_22[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_22[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_22[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_22[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_22[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
            __Vtemp_22[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
            __Vtemp_22[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
            __Vtemp_22[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
            __Vtemp_22[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
            __Vtemp_22[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
        } else {
            __Vtemp_22[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0U];
            __Vtemp_22[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][1U];
            __Vtemp_22[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][2U];
            __Vtemp_22[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][3U];
            __Vtemp_22[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][4U];
            __Vtemp_22[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][5U];
            __Vtemp_22[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][6U];
            __Vtemp_22[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][7U];
            __Vtemp_22[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][8U];
            __Vtemp_22[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][9U];
            __Vtemp_22[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xaU];
            __Vtemp_22[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xbU];
            __Vtemp_22[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xcU];
            __Vtemp_22[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xdU];
            __Vtemp_22[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xeU];
            __Vtemp_22[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0xfU];
        }
        bufp->chgWData(oldp+878,(__Vtemp_22),512);
        bufp->chgBit(oldp+894,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_en_pipe_0));
        bufp->chgCData(oldp+895,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+896,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+912,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_en_pipe_0));
        bufp->chgWData(oldp+913,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0]),512);
        if ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_24[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_24[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_24[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_24[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_24[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_24[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_24[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_24[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_24[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_24[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_24[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
            __Vtemp_24[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
            __Vtemp_24[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
            __Vtemp_24[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
            __Vtemp_24[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
            __Vtemp_24[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
        } else {
            __Vtemp_24[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0U];
            __Vtemp_24[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][1U];
            __Vtemp_24[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][2U];
            __Vtemp_24[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][3U];
            __Vtemp_24[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][4U];
            __Vtemp_24[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][5U];
            __Vtemp_24[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][6U];
            __Vtemp_24[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][7U];
            __Vtemp_24[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][8U];
            __Vtemp_24[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][9U];
            __Vtemp_24[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xaU];
            __Vtemp_24[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xbU];
            __Vtemp_24[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xcU];
            __Vtemp_24[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xdU];
            __Vtemp_24[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xeU];
            __Vtemp_24[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0xfU];
        }
        bufp->chgWData(oldp+929,(__Vtemp_24),512);
        bufp->chgBit(oldp+945,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_en_pipe_0));
        bufp->chgCData(oldp+946,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+947,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+963,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_en_pipe_0));
        bufp->chgWData(oldp+964,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0]),512);
        if ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_26[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_26[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_26[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_26[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_26[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_26[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_26[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_26[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_26[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_26[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_26[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xaU];
            __Vtemp_26[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xbU];
            __Vtemp_26[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xcU];
            __Vtemp_26[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xdU];
            __Vtemp_26[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xeU];
            __Vtemp_26[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0xfU];
        } else {
            __Vtemp_26[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0U];
            __Vtemp_26[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][1U];
            __Vtemp_26[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][2U];
            __Vtemp_26[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][3U];
            __Vtemp_26[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][4U];
            __Vtemp_26[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][5U];
            __Vtemp_26[6U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][6U];
            __Vtemp_26[7U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][7U];
            __Vtemp_26[8U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][8U];
            __Vtemp_26[9U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][9U];
            __Vtemp_26[0xaU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xaU];
            __Vtemp_26[0xbU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xbU];
            __Vtemp_26[0xcU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xcU];
            __Vtemp_26[0xdU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xdU];
            __Vtemp_26[0xeU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xeU];
            __Vtemp_26[0xfU] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0xfU];
        }
        bufp->chgWData(oldp+980,(__Vtemp_26),512);
        bufp->chgBit(oldp+996,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_valid));
        bufp->chgIData(oldp+997,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_addr),32);
        bufp->chgCData(oldp+998,((0xffU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                           >> 6U))),8);
        bufp->chgIData(oldp+999,((vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                  >> 0xeU)),18);
        bufp->chgBit(oldp+1000,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid));
        bufp->chgIData(oldp+1001,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr),32);
        bufp->chgBit(oldp+1002,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit));
        bufp->chgWData(oldp+1003,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data),512);
        bufp->chgBit(oldp+1019,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                     [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1020,((((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                     [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1021,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_2));
        bufp->chgBit(oldp+1022,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__tag_hits_3));
        bufp->chgBit(oldp+1023,((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T))));
        bufp->chgCData(oldp+1024,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_hi_1),2);
        bufp->chgCData(oldp+1025,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1),2);
        bufp->chgCData(oldp+1026,((0xfU & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                           >> 2U))),4);
        bufp->chgSData(oldp+1027,((0x3ffU & VL_SHIFTL_III(10,10,32, 
                                                          (0xfU 
                                                           & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                              >> 2U)), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_27, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U)), 5U)));
        bufp->chgWData(oldp+1028,(__Vtemp_27),512);
        bufp->chgCData(oldp+1044,((0xfU & ((IData)(1U) 
                                           + (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                              >> 2U)))),4);
        bufp->chgSData(oldp+1045,((0x3ffU & VL_SHIFTL_III(10,10,32, 
                                                          (0xfU 
                                                           & ((IData)(1U) 
                                                              + 
                                                              (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                               >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_28, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(1U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgWData(oldp+1046,(__Vtemp_28),512);
        bufp->chgCData(oldp+1062,((0xfU & ((IData)(2U) 
                                           + (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                              >> 2U)))),4);
        bufp->chgSData(oldp+1063,((0x3ffU & VL_SHIFTL_III(10,10,32, 
                                                          (0xfU 
                                                           & ((IData)(2U) 
                                                              + 
                                                              (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                               >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_29, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(2U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgWData(oldp+1064,(__Vtemp_29),512);
        bufp->chgCData(oldp+1080,((0xfU & ((IData)(3U) 
                                           + (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                              >> 2U)))),4);
        bufp->chgSData(oldp+1081,((0x3ffU & VL_SHIFTL_III(10,10,32, 
                                                          (0xfU 
                                                           & ((IData)(3U) 
                                                              + 
                                                              (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                               >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_30, vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x3ffU & VL_SHIFTL_III(10,10,32, 
                                              (0xfU 
                                               & ((IData)(3U) 
                                                  + 
                                                  (vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U))), 5U)));
        bufp->chgWData(oldp+1082,(__Vtemp_30),512);
        bufp->chgBit(oldp+1098,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_en_pipe_0));
        bufp->chgCData(oldp+1099,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0),8);
        bufp->chgBit(oldp+1100,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1101,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1102,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1103,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (0U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1104,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1105,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1106,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1107,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1108,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1109,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1110,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1111,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1112,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1113,(((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (1U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1114,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1115,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1116,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1117,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1118,(((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((1U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1119,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1120,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1121,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1122,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1123,(((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (2U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1124,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1125,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1126,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1127,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1128,(((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((2U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1129,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1130,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1131,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1132,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1133,(((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (3U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                 [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1134,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1135,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1136,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1137,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1138,(((3U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((3U 
                                                    == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                   [vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0])),18);
        bufp->chgCData(oldp+1139,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state),3);
        bufp->chgIData(oldp+1140,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr),32);
        bufp->chgCData(oldp+1141,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx),8);
        bufp->chgIData(oldp+1142,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag),18);
        bufp->chgCData(oldp+1143,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way),2);
        bufp->chgIData(oldp+1144,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0),32);
        bufp->chgIData(oldp+1145,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1),32);
        bufp->chgIData(oldp+1146,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2),32);
        bufp->chgIData(oldp+1147,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3),32);
        bufp->chgIData(oldp+1148,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4),32);
        bufp->chgIData(oldp+1149,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5),32);
        bufp->chgIData(oldp+1150,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6),32);
        bufp->chgIData(oldp+1151,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7),32);
        bufp->chgIData(oldp+1152,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8),32);
        bufp->chgIData(oldp+1153,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9),32);
        bufp->chgIData(oldp+1154,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10),32);
        bufp->chgIData(oldp+1155,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11),32);
        bufp->chgIData(oldp+1156,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12),32);
        bufp->chgIData(oldp+1157,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13),32);
        bufp->chgIData(oldp+1158,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14),32);
        bufp->chgIData(oldp+1159,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15),32);
        bufp->chgCData(oldp+1160,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count),5);
        __Vtemp_36[0U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0;
        __Vtemp_36[1U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1;
        __Vtemp_36[2U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2;
        __Vtemp_36[3U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3;
        __Vtemp_36[4U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4;
        __Vtemp_36[5U] = vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5;
        __Vtemp_36[6U] = (IData)((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                                   << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))));
        __Vtemp_36[7U] = (IData)(((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                                    << 0x20U) | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))) 
                                  >> 0x20U));
        bufp->chgWData(oldp+1161,(__Vtemp_36),256);
        bufp->chgBit(oldp+1169,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_en_pipe_0));
        bufp->chgCData(oldp+1170,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_addr_pipe_0),8);
        bufp->chgCData(oldp+1171,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data),3);
        bufp->chgBit(oldp+1172,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_en_pipe_0));
        bufp->chgCData(oldp+1173,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_addr_pipe_0),8);
        bufp->chgCData(oldp+1174,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data),3);
        bufp->chgCData(oldp+1175,(((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                    ? (6U | (1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                                   >> 2U)))
                                    : ((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                        ? (4U | (1U 
                                                 & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                                    >> 2U)))
                                        : ((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                            ? (1U | 
                                               (2U 
                                                & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data)))
                                            : ((3U 
                                                == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                                ? (2U 
                                                   & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data))
                                                : 0U))))),3);
        bufp->chgBit(oldp+1176,((1U & (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data))));
        bufp->chgBit(oldp+1177,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                       >> 1U))));
        bufp->chgBit(oldp+1178,((1U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                       >> 2U))));
        bufp->chgBit(oldp+1179,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable)))));
        bufp->chgBit(oldp+1180,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable));
        bufp->chgBit(oldp+1181,((1U & vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random)));
        bufp->chgBit(oldp+1182,((1U & ((vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 1U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable)))));
        bufp->chgBit(oldp+1183,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable));
        bufp->chgBit(oldp+1184,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 1U))));
        bufp->chgBit(oldp+1185,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 2U))));
        bufp->chgBit(oldp+1186,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay));
        bufp->chgBit(oldp+1187,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 3U))));
        bufp->chgIData(oldp+1188,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random),23);
        bufp->chgIData(oldp+1189,(((0x7ffffeU & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                 << 1U)) 
                                   | (1U & VL_REDXOR_32(
                                                        (0x420000U 
                                                         & vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random))))),23);
        bufp->chgBit(oldp+1190,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay));
        bufp->chgBit(oldp+1191,((1U & ((vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 4U) | (IData)(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable)))));
        bufp->chgBit(oldp+1192,(vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable));
        bufp->chgBit(oldp+1193,((1U & (vlSelf->simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 4U))));
        bufp->chgQData(oldp+1194,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)) 
                                    << 0x2bU) | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize)) 
                                                  << 0x28U) 
                                                 | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                     << 0x24U) 
                                                    | (((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                        << 4U) 
                                                       | (QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid))))))),45);
        bufp->chgIData(oldp+1196,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+1197,(((((IData)(1U) + 
                                     (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+1198,((((- (IData)((0U 
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
        bufp->chgIData(oldp+1199,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
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
        bufp->chgCData(oldp+1200,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+1201,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1202,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1203,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+1204,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+1205,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+1206,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+1207,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+1208,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+1209,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+1211,((IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                           >> 0xdU))),32);
        bufp->chgCData(oldp+1212,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 0xbU)))),2);
        bufp->chgCData(oldp+1213,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+1214,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                   >> 4U)))),4);
        bufp->chgCData(oldp+1215,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1216,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+1217,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+1218,((((QData)((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                    << 0xdU) | (QData)((IData)(
                                                               (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                 << 0xbU) 
                                                                | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                    << 8U) 
                                                                   | (((IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                       << 4U) 
                                                                      | (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid)))))))),45);
        bufp->chgIData(oldp+1220,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+1221,(((((IData)(1U) + 
                                     (vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+1222,((((- (IData)((0U 
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
        bufp->chgIData(oldp+1223,(((0xffffffc0U & vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
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
        bufp->chgCData(oldp+1224,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+1225,((0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1226,((1U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1227,((2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+1228,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+1229,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+1230,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+1231,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+1232,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+1233,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+1235,((IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                           >> 0xdU))),32);
        bufp->chgCData(oldp+1236,((3U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 0xbU)))),2);
        bufp->chgCData(oldp+1237,((0xfU & (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+1238,((0xfU & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                   >> 4U)))),4);
        bufp->chgCData(oldp+1239,((7U & (IData)((vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1240,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+1241,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+1242,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+1243,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+1244,((1U & (~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgCData(oldp+1245,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgIData(oldp+1246,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgBit(oldp+1247,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+1248,(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[4U])) {
        bufp->chgSData(oldp+1249,(vlSelf->NAND_top__DOT__nand_addr_c),14);
        bufp->chgIData(oldp+1250,(vlSelf->NAND_top__DOT__nand_addr_r),25);
        bufp->chgIData(oldp+1251,(vlSelf->NAND_top__DOT__nand_op_num),32);
        bufp->chgIData(oldp+1252,(vlSelf->NAND_top__DOT__nand_parameter),32);
        bufp->chgIData(oldp+1253,(vlSelf->NAND_top__DOT__nand_ce_map0),32);
        bufp->chgIData(oldp+1254,(vlSelf->NAND_top__DOT__nand_ce_map1),32);
        bufp->chgIData(oldp+1255,(vlSelf->NAND_top__DOT__nand_rdy_map0),32);
        bufp->chgIData(oldp+1256,(vlSelf->NAND_top__DOT__nand_rdy_map1),32);
        bufp->chgIData(oldp+1257,(vlSelf->NAND_top__DOT__nand_command),32);
        bufp->chgSData(oldp+1258,(vlSelf->NAND_top__DOT__nand_timing),16);
        bufp->chgQData(oldp+1259,(vlSelf->NAND_top__DOT__addr_in_die),38);
        bufp->chgCData(oldp+1261,(vlSelf->NAND_top__DOT__NAND_STATE),5);
        bufp->chgIData(oldp+1262,(vlSelf->NAND_top__DOT__NAND_OP_NUM),32);
        bufp->chgSData(oldp+1263,(vlSelf->NAND_top__DOT__WRITE_MAX_COUNT),14);
        bufp->chgSData(oldp+1264,(vlSelf->NAND_top__DOT__READ_MAX_COUNT),14);
        bufp->chgBit(oldp+1265,(vlSelf->NAND_top__DOT__nand_clr_ack));
        bufp->chgBit(oldp+1266,(vlSelf->NAND_top__DOT__NAND_DONE));
        bufp->chgBit(oldp+1267,(vlSelf->NAND_top__DOT__NAND_CE_));
        bufp->chgSData(oldp+1268,((0x3fffU & (vlSelf->NAND_top__DOT__nand_parameter 
                                              >> 0x10U))),14);
        bufp->chgCData(oldp+1269,((7U & (vlSelf->NAND_top__DOT__nand_parameter 
                                         >> 0xcU))),3);
        bufp->chgCData(oldp+1270,((0xfU & (vlSelf->NAND_top__DOT__nand_parameter 
                                           >> 8U))),4);
        bufp->chgBit(oldp+1271,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                       >> 8U))));
        bufp->chgBit(oldp+1272,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                       >> 9U))));
        bufp->chgBit(oldp+1273,((1U & (vlSelf->NAND_top__DOT__nand_command 
                                       >> 0xdU))));
        bufp->chgBit(oldp+1274,(vlSelf->NAND_top__DOT__NAND_DMA_REQ));
        bufp->chgBit(oldp+1275,(vlSelf->NAND_top__DOT__nand_cmd_valid));
        bufp->chgCData(oldp+1276,(vlSelf->NAND_top__DOT__status),8);
        bufp->chgCData(oldp+1277,(vlSelf->NAND_top__DOT__nand_number),2);
        bufp->chgQData(oldp+1278,(vlSelf->NAND_top__DOT__ID_INFORM),48);
        bufp->chgIData(oldp+1280,(vlSelf->NAND_top__DOT__NAND_DAT_O_RD),32);
        bufp->chgCData(oldp+1281,((((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hdee97012__0) 
                                    << 3U) | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1fdf66ec__0) 
                                               << 2U) 
                                              | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hda4dca10__0) 
                                                  << 1U) 
                                                 | (IData)(vlSelf->NAND_top__DOT____VdfgTmp_h1f93f44c__0))))),4);
        bufp->chgCData(oldp+1282,(vlSelf->NAND_top__DOT__ADDR_pointer),2);
        bufp->chgCData(oldp+1283,(vlSelf->NAND_top__DOT__NAND_ADDR_COUNT),3);
        bufp->chgCData(oldp+1284,(vlSelf->NAND_top__DOT__WAIT_NUM),8);
        bufp->chgCData(oldp+1285,(vlSelf->NAND_top__DOT__HOLD_NUM),8);
        bufp->chgCData(oldp+1286,(vlSelf->NAND_top__DOT__COMMAND),8);
        bufp->chgCData(oldp+1287,(vlSelf->NAND_top__DOT__PRE_STATE),5);
        bufp->chgCData(oldp+1288,(vlSelf->NAND_top__DOT__READ_ID_NUM),3);
        bufp->chgSData(oldp+1289,(vlSelf->NAND_top__DOT__data_count),14);
        bufp->chgQData(oldp+1290,(vlSelf->NAND_top__DOT__NAND_ADDR),38);
        bufp->chgIData(oldp+1292,(vlSelf->NAND_top__DOT__NAND_DAT_I_WR),32);
        bufp->chgBit(oldp+1293,(vlSelf->NAND_top__DOT__NAND_GO));
        bufp->chgBit(oldp+1294,(vlSelf->NAND_top__DOT__NAND_ACK));
        bufp->chgBit(oldp+1295,(vlSelf->NAND_top__DOT__DMA_OP_DONE));
        bufp->chgBit(oldp+1296,(vlSelf->NAND_top__DOT__ERASE_SERIAL));
        bufp->chgBit(oldp+1297,(vlSelf->NAND_top__DOT__now_up_half));
        bufp->chgBit(oldp+1298,(vlSelf->NAND_top__DOT__now_oob));
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[5U])) {
        bufp->chgCData(oldp+1299,(vlSelf->simu_top__DOT__soc__DOT__m0_bid),4);
        bufp->chgCData(oldp+1300,(vlSelf->simu_top__DOT__soc__DOT__m0_bresp),2);
        bufp->chgBit(oldp+1301,((0U == (3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                              >> 2U)))));
        bufp->chgCData(oldp+1302,(vlSelf->simu_top__DOT__soc__DOT__m0_rid),4);
        bufp->chgCData(oldp+1303,(vlSelf->simu_top__DOT__soc__DOT__m0_rresp),2);
        bufp->chgCData(oldp+1304,((3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid) 
                                         >> 2U))),2);
        bufp->chgCData(oldp+1305,((3U & ((IData)(vlSelf->simu_top__DOT__soc__DOT__m0_bid) 
                                         >> 2U))),2);
    }
    bufp->chgBit(oldp+1306,(vlSelf->aclk));
    bufp->chgBit(oldp+1307,(vlSelf->aresetn));
    bufp->chgBit(oldp+1308,(vlSelf->enable_delay));
    bufp->chgIData(oldp+1309,(vlSelf->random_seed),23);
    bufp->chgBit(oldp+1310,(vlSelf->ram_ren));
    bufp->chgIData(oldp+1311,(vlSelf->ram_raddr),32);
    bufp->chgIData(oldp+1312,(vlSelf->ram_rdata),32);
    bufp->chgCData(oldp+1313,(vlSelf->ram_wen),4);
    bufp->chgIData(oldp+1314,(vlSelf->ram_waddr),32);
    bufp->chgIData(oldp+1315,(vlSelf->ram_wdata),32);
    bufp->chgIData(oldp+1316,(vlSelf->debug0_wb_pc),32);
    bufp->chgBit(oldp+1317,(vlSelf->debug0_wb_rf_wen));
    bufp->chgCData(oldp+1318,(vlSelf->debug0_wb_rf_wnum),5);
    bufp->chgIData(oldp+1319,(vlSelf->debug0_wb_rf_wdata),32);
    bufp->chgIData(oldp+1320,(vlSelf->num_data),32);
    bufp->chgBit(oldp+1321,(vlSelf->open_trace));
    bufp->chgBit(oldp+1322,(vlSelf->num_monitor));
    bufp->chgCData(oldp+1323,(vlSelf->confreg_uart_data),8);
    bufp->chgBit(oldp+1324,(vlSelf->write_uart_valid));
    bufp->chgWData(oldp+1325,(vlSelf->uart_ctr_bus),128);
    bufp->chgBit(oldp+1329,(vlSelf->uart_rx));
    bufp->chgBit(oldp+1330,(vlSelf->uart_tx));
    bufp->chgSData(oldp+1331,(vlSelf->led),16);
    bufp->chgCData(oldp+1332,(vlSelf->led_rg0),2);
    bufp->chgCData(oldp+1333,(vlSelf->led_rg1),2);
    bufp->chgCData(oldp+1334,(vlSelf->num_csn),8);
    bufp->chgCData(oldp+1335,(vlSelf->num_a_g),7);
    bufp->chgCData(oldp+1336,(vlSelf->btn_key_col),4);
    bufp->chgCData(oldp+1337,(vlSelf->btn_key_row),4);
    bufp->chgCData(oldp+1338,(vlSelf->btn_step),2);
    bufp->chgCData(oldp+1339,(vlSelf->nand_type),2);
    bufp->chgBit(oldp+1340,(vlSelf->pclk));
    bufp->chgBit(oldp+1341,(vlSelf->prst_));
    bufp->chgBit(oldp+1342,(vlSelf->pwrite));
    bufp->chgBit(oldp+1343,(vlSelf->psel));
    bufp->chgBit(oldp+1344,(vlSelf->penable));
    bufp->chgSData(oldp+1345,(vlSelf->ADDR),11);
    bufp->chgIData(oldp+1346,(vlSelf->DAT_I),32);
    bufp->chgIData(oldp+1347,(vlSelf->DAT_O),32);
    bufp->chgCData(oldp+1348,(vlSelf->NAND_CE_o),4);
    bufp->chgBit(oldp+1349,(vlSelf->NAND_REQ));
    bufp->chgCData(oldp+1350,(vlSelf->NAND_I),8);
    bufp->chgCData(oldp+1351,(vlSelf->NAND_O),8);
    bufp->chgBit(oldp+1352,(vlSelf->NAND_EN_));
    bufp->chgBit(oldp+1353,(vlSelf->NAND_ALE));
    bufp->chgBit(oldp+1354,(vlSelf->NAND_CLE));
    bufp->chgBit(oldp+1355,(vlSelf->NAND_WR_));
    bufp->chgBit(oldp+1356,(vlSelf->NAND_RD_));
    bufp->chgCData(oldp+1357,(vlSelf->NAND_IORDY_i),4);
    bufp->chgBit(oldp+1358,(vlSelf->nand_int));
    bufp->chgIData(oldp+1359,(vlSelf->NAND_top__DOT__REG_DAT_T),32);
    bufp->chgBit(oldp+1360,(((IData)(vlSelf->psel) 
                             & (0x40U == (IData)(vlSelf->ADDR)))));
    bufp->chgBit(oldp+1361,(vlSelf->NAND_top__DOT__NANDtag));
    bufp->chgBit(oldp+1362,(vlSelf->NAND_top__DOT__NAND_IORDY));
    bufp->chgBit(oldp+1363,(((IData)(vlSelf->psel) 
                             & (0x10U == (IData)(vlSelf->ADDR)))));
    bufp->chgBit(oldp+1364,(((IData)(vlSelf->psel) 
                             & (0x14U == (IData)(vlSelf->ADDR)))));
    bufp->chgCData(oldp+1365,((((IData)(vlSelf->NAND_top__DOT____VdfgTmp_hc546cbe1__0) 
                                << 3U) | (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_heedab63f__0) 
                                           << 2U) | 
                                          (((IData)(vlSelf->NAND_top__DOT____VdfgTmp_ha1106bbf__0) 
                                            << 1U) 
                                           | (1U & (IData)(vlSelf->NAND_IORDY_i)))))),4);
    bufp->chgCData(oldp+1366,(vlSelf->__SYM__switch),8);
    bufp->chgBit(oldp+1367,(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_arbiter_io_in_1_ready));
    bufp->chgBit(oldp+1368,((IData)((((0U == (0xcU 
                                              & (IData)(vlSelf->simu_top__DOT__soc__DOT__m0_rid))) 
                                      & (2U == (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) 
                                     & ((0U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & (1U != (IData)(vlSelf->simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)))))));
    bufp->chgBit(oldp+1369,(vlSelf->simu_top__DOT__soc__DOT__m0_awready));
    bufp->chgBit(oldp+1370,((1U & (~ (IData)(vlSelf->aresetn)))));
    bufp->chgBit(oldp+1371,((1U & ((IData)(vlSelf->uart_rx__en0)
                                    ? ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__rx_en)) 
                                       | (IData)(vlSelf->uart_tx))
                                    : (IData)(vlSelf->uart_rx)))));
    bufp->chgBit(oldp+1372,((1U & ((~ (IData)(vlSelf->aresetn)) 
                                   | (IData)(vlSelf->simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))));
    bufp->chgIData(oldp+1373,(vlSelf->__SYM__switch),32);
    bufp->chgIData(oldp+1374,(((0x8000U & ((IData)(vlSelf->__SYM__switch) 
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
    bufp->chgBit(oldp+1375,(((~ (IData)((0xfU == (IData)(vlSelf->btn_key_row)))) 
                             & (0U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    bufp->chgBit(oldp+1376,(((7U == (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                             & (0xfU == (IData)(vlSelf->btn_key_row)))));
    bufp->chgBit(oldp+1377,(((~ (IData)(vlSelf->btn_step)) 
                             & (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r))));
    bufp->chgBit(oldp+1378,((1U & ((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                   & (IData)(vlSelf->btn_step)))));
    bufp->chgBit(oldp+1379,(((~ ((IData)(vlSelf->btn_step) 
                                 >> 1U)) & (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))));
    bufp->chgBit(oldp+1380,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                             & ((IData)(vlSelf->btn_step) 
                                >> 1U))));
    bufp->chgBit(oldp+1381,(((~ (IData)(vlSelf->simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                             & (IData)(vlSelf->ram_ren))));
    bufp->chgBit(oldp+1382,((1U & ((~ (IData)(vlSelf->aresetn)) 
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
}
