// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_fst_c.h"
#include "Vsimu_top__Syms.h"


void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vsimu_top___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0\n"); );
    // Body
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    Vsimu_top___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

extern const VlWide<16>/*511:0*/ Vsimu_top__ConstPool__CONST_h93e1b771_0;

void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0_sub_0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
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
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[0U]))) {
        bufp->chgBit(oldp+0,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid))));
        bufp->chgBit(oldp+1,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid))));
        bufp->chgBit(oldp+2,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 3U))));
        bufp->chgBit(oldp+3,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                    >> 3U))));
        bufp->chgBit(oldp+4,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 2U))));
        bufp->chgBit(oldp+5,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                    >> 2U))));
        bufp->chgBit(oldp+6,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 1U))));
        bufp->chgBit(oldp+7,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                    >> 1U))));
        bufp->chgBit(oldp+8,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                    >> 4U))));
        bufp->chgBit(oldp+9,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                    >> 4U))));
        bufp->chgCData(oldp+10,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0]),2);
        bufp->chgCData(oldp+11,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1]),2);
        bufp->chgCData(oldp+12,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2]),2);
        bufp->chgCData(oldp+13,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3]),2);
        bufp->chgCData(oldp+14,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4]),2);
        bufp->chgCData(oldp+15,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0]),2);
        bufp->chgCData(oldp+16,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1]),2);
        bufp->chgCData(oldp+17,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2]),2);
        bufp->chgCData(oldp+18,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3]),2);
        bufp->chgCData(oldp+19,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4]),2);
        bufp->chgCData(oldp+20,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid),5);
        bufp->chgCData(oldp+21,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid),5);
        bufp->chgCData(oldp+22,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir),3);
        bufp->chgIData(oldp+23,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int),32);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[1U]))) {
        bufp->chgBit(oldp+24,(vlSelfRef.NAND_top__DOT__HIT0));
        bufp->chgBit(oldp+25,(vlSelfRef.NAND_top__DOT__HIT1));
        bufp->chgBit(oldp+26,(vlSelfRef.NAND_top__DOT__HIT2));
        bufp->chgBit(oldp+27,(vlSelfRef.NAND_top__DOT__HIT3));
        bufp->chgBit(oldp+28,(vlSelfRef.NAND_top__DOT__HIT6));
        bufp->chgBit(oldp+29,(vlSelfRef.NAND_top__DOT__HIT7));
        bufp->chgBit(oldp+30,(vlSelfRef.NAND_top__DOT__HIT8));
        bufp->chgBit(oldp+31,(vlSelfRef.NAND_top__DOT__HIT9));
        bufp->chgBit(oldp+32,(vlSelfRef.NAND_top__DOT__HIT10));
        bufp->chgBit(oldp+33,(vlSelfRef.NAND_top__DOT__HIT11));
        bufp->chgBit(oldp+34,(vlSelfRef.NAND_top__DOT__NAND_HIT));
        bufp->chgIData(oldp+35,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data),32);
    }
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[1U] 
                      | vlSelfRef.__Vm_traceActivity
                      [2U])))) {
        bufp->chgBit(oldp+36,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__axi_master_aw_awready));
        bufp->chgBit(oldp+37,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready));
        bufp->chgBit(oldp+38,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid));
        bufp->chgBit(oldp+39,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_arready));
        bufp->chgIData(oldp+40,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata),32);
        bufp->chgBit(oldp+41,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid));
        bufp->chgBit(oldp+42,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_bready));
        bufp->chgBit(oldp+43,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
        bufp->chgBit(oldp+44,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready));
        bufp->chgBit(oldp+45,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))));
        bufp->chgBit(oldp+46,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid))));
        bufp->chgBit(oldp+47,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))));
        bufp->chgBit(oldp+48,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                     >> 3U))));
        bufp->chgBit(oldp+49,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 3U))));
        bufp->chgBit(oldp+50,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 3U))));
        bufp->chgBit(oldp+51,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                     >> 2U))));
        bufp->chgBit(oldp+52,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 2U))));
        bufp->chgBit(oldp+53,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 2U))));
        bufp->chgBit(oldp+54,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren));
        bufp->chgCData(oldp+55,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen),4);
        bufp->chgBit(oldp+56,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu));
        bufp->chgBit(oldp+57,((((8U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                   & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 2U))) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                                   >> 2U) 
                                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid)))));
        bufp->chgCData(oldp+58,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt),4);
        bufp->chgBit(oldp+59,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                     >> 1U))));
        bufp->chgBit(oldp+60,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 1U))));
        bufp->chgBit(oldp+61,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 1U))));
        bufp->chgBit(oldp+62,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                     >> 4U))));
        bufp->chgBit(oldp+63,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 4U))));
        bufp->chgBit(oldp+64,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 4U))));
        bufp->chgIData(oldp+65,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0]),32);
        bufp->chgIData(oldp+66,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1]),32);
        bufp->chgIData(oldp+67,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2]),32);
        bufp->chgIData(oldp+68,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3]),32);
        bufp->chgIData(oldp+69,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4]),32);
        bufp->chgCData(oldp+70,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready),5);
        bufp->chgCData(oldp+71,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid),5);
        bufp->chgCData(oldp+72,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready),5);
        bufp->chgBit(oldp+73,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins));
        bufp->chgBit(oldp+74,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
                               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
                                  & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast) 
                                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready))))));
        bufp->chgBit(oldp+75,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren))));
        bufp->chgBit(oldp+76,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+77,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+78,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+79,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+80,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+81,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
                                     | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                        >> 3U)))));
        bufp->chgBit(oldp+82,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+83,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+84,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+85,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+86,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+87,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
                               & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
                                  | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+88,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+89,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+90,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+91,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+92,((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen))));
        bufp->chgBit(oldp+93,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8000U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+94,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8010U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+95,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8020U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+96,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8030U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+97,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8040U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+98,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8050U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+99,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8060U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+100,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0x8070U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+101,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer));
        bufp->chgBit(oldp+102,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xff00U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+103,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xff30U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+104,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xff40U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+105,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid));
        bufp->chgBit(oldp+106,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf020U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgCData(oldp+107,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state),3);
        bufp->chgSData(oldp+108,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp),16);
        bufp->chgBit(oldp+109,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf030U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+110,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf040U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+111,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf050U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+112,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_arready))));
        bufp->chgBit(oldp+113,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                                & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))))));
        bufp->chgCData(oldp+114,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                                : 0U))
                                   : 0U)),4);
        bufp->chgIData(oldp+115,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                                : 0U))
                                   : 0U)),32);
        bufp->chgCData(oldp+116,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                                : 0U))
                                   : 0U)),2);
        bufp->chgBit(oldp+117,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                  & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                                & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U))))));
        bufp->chgBit(oldp+118,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                 & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U))))));
        bufp->chgCData(oldp+119,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                                : 0U))
                                   : 0U)),4);
        bufp->chgCData(oldp+120,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                                : 0U))
                                   : 0U)),2);
        bufp->chgBit(oldp+121,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                                 & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                                & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U))))));
        bufp->chgBit(oldp+122,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                                & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                      & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                         & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready)))))));
        bufp->chgCData(oldp+123,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                                    : 0U)))
                                   : 0U)),4);
        bufp->chgIData(oldp+124,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                                    : 0U)))
                                   : 0U)),32);
        bufp->chgCData(oldp+125,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                                    : 0U)))
                                   : 0U)),2);
        bufp->chgBit(oldp+126,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                  & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                                & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgBit(oldp+127,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                 & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U))) 
                                   & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgCData(oldp+128,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                                    : 0U)))
                                   : 0U)),4);
        bufp->chgCData(oldp+129,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                                    : 0U)))
                                   : 0U)),2);
        bufp->chgBit(oldp+130,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                                 & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                                & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U))) 
                                   & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))))));
        bufp->chgBit(oldp+131,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                                & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                      & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                         & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))))))));
        bufp->chgCData(oldp+132,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                                     : 0U))))
                                   : 0U)),4);
        bufp->chgIData(oldp+133,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                                     : 0U))))
                                   : 0U)),32);
        bufp->chgCData(oldp+134,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                                     : 0U))))
                                   : 0U)),2);
        bufp->chgBit(oldp+135,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                  & (0x0cU == (0x0cU 
                                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                                & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                  >> 2U))) 
                                    & (1U != (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))) 
                                   & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgBit(oldp+136,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                 & (0x0cU == (0x0cU 
                                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                  >> 2U))) 
                                    & (1U != (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))) 
                                   & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))))));
        bufp->chgCData(oldp+137,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                                     : 0U))))
                                   : 0U)),4);
        bufp->chgCData(oldp+138,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                   ? ((0U == (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                       ? 0U : ((1U 
                                                == 
                                                (3U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                    >> 2U)))
                                                ? 0U
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                        >> 2U)))
                                                    ? 0U
                                                    : 
                                                   ((3U 
                                                     == 
                                                     (3U 
                                                      & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                         >> 2U)))
                                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                                     : 0U))))
                                   : 0U)),2);
        bufp->chgBit(oldp+139,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                                 & (0x0cU == (0x0cU 
                                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                                & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                  >> 2U))) 
                                    & (1U != (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))) 
                                   & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))))));
        bufp->chgIData(oldp+140,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_data_rdata),32);
        bufp->chgBit(oldp+141,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                                 & (0U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
        bufp->chgBit(oldp+142,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_data_rvalid));
        bufp->chgBit(oldp+143,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready))));
        bufp->chgBit(oldp+144,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en))));
        bufp->chgBit(oldp+145,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+146,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+147,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+148,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+149,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+150,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                                      | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)))));
        bufp->chgBit(oldp+151,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en));
        bufp->chgBit(oldp+152,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+153,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+154,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+155,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+156,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+157,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+158,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
        bufp->chgBit(oldp+159,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+160,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+161,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en));
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[2U]))) {
        bufp->chgCData(oldp+162,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid),4);
        bufp->chgCData(oldp+163,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp),2);
        bufp->chgBit(oldp+164,((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                             >> 2U)))));
        bufp->chgIData(oldp+165,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_araddr),32);
        bufp->chgCData(oldp+166,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arlen))),4);
        bufp->chgCData(oldp+167,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arsize),3);
        bufp->chgCData(oldp+168,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arburst),2);
        bufp->chgBit(oldp+169,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid));
        bufp->chgCData(oldp+170,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid),4);
        bufp->chgCData(oldp+171,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp),2);
        bufp->chgBit(oldp+172,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast));
        bufp->chgBit(oldp+173,((IData)((((0U == (0x0cU 
                                                 & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid))) 
                                         & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) 
                                        & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & (1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)))))));
        bufp->chgBit(oldp+174,(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready));
        bufp->chgBit(oldp+175,(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready));
        bufp->chgBit(oldp+176,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid));
        bufp->chgBit(oldp+177,(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready));
        bufp->chgBit(oldp+178,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid));
        bufp->chgBit(oldp+179,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+180,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready));
        bufp->chgCData(oldp+181,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+182,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+183,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+184,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid),4);
        bufp->chgBit(oldp+185,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+186,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+187,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+188,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready));
        bufp->chgCData(oldp+189,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+190,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+191,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+192,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid),4);
        bufp->chgIData(oldp+193,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg),32);
        bufp->chgBit(oldp+194,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+195,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+196,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready));
        bufp->chgBit(oldp+197,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready));
        bufp->chgCData(oldp+198,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id),4);
        bufp->chgBit(oldp+199,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid));
        bufp->chgBit(oldp+200,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready));
        bufp->chgCData(oldp+201,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id),4);
        bufp->chgIData(oldp+202,(((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32
                                   : ((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                       ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 8U)
                                       : ((2U == (3U 
                                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                           ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000010U)
                                           : ((3U == 
                                               (3U 
                                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                               ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000018U)
                                               : 0U))))),32);
        bufp->chgBit(oldp+203,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast));
        bufp->chgBit(oldp+204,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid));
        bufp->chgIData(oldp+205,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+206,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+207,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgCData(oldp+208,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int) 
                                  << 1U)),8);
        bufp->chgBit(oldp+209,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 1U))));
        bufp->chgBit(oldp+210,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))));
        bufp->chgBit(oldp+211,(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int));
        bufp->chgBit(oldp+212,((IData)(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared)) 
                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
        bufp->chgBit(oldp+213,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))));
        bufp->chgBit(oldp+214,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                      ^ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 3U)))));
        bufp->chgBit(oldp+215,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
        bufp->chgBit(oldp+216,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
        bufp->chgIData(oldp+217,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao)
                                   : 0U)),32);
        bufp->chgBit(oldp+218,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant));
        bufp->chgBit(oldp+219,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
        bufp->chgBit(oldp+220,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr));
        bufp->chgBit(oldp+221,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu));
        bufp->chgBit(oldp+222,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu));
        bufp->chgIData(oldp+223,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr),20);
        bufp->chgCData(oldp+224,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu),8);
        bufp->chgCData(oldp+225,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao),8);
        bufp->chgBit(oldp+226,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans));
        bufp->chgIData(oldp+227,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr),24);
        bufp->chgBit(oldp+228,((0U == (0x0000003fU 
                                       & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                          >> 0x0000000eU)))));
        bufp->chgBit(oldp+229,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack));
        bufp->chgBit(oldp+230,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
        bufp->chgBit(oldp+231,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
                                & (0U == (0x000fc000U 
                                          & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))));
        bufp->chgIData(oldp+232,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr),20);
        bufp->chgCData(oldp+233,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai),8);
        bufp->chgCData(oldp+234,((0x000000ffU & ((4U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                  ? 
                                                 ((2U 
                                                   & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                   ? 
                                                  ((1U 
                                                    & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                    ? 
                                                   ((0x00000080U 
                                                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr))
                                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg)
                                                     : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg))
                                                    : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr))
                                                   : 
                                                  ((1U 
                                                    & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                                    ? 
                                                   ((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
                                                        << 3U) 
                                                       | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r) 
                                                          << 2U)) 
                                                      | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
                                                          << 1U) 
                                                         | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r))) 
                                                     << 4U) 
                                                    | ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                                                         << 3U) 
                                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                                                           << 2U)) 
                                                       | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                                                           << 1U) 
                                                          | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r))))
                                                    : 0U))
                                                  : 
                                                 ((2U 
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
                                                     : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out))))))),8);
        bufp->chgBit(oldp+235,((0U != (0x0000003fU 
                                       & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                          >> 0x0000000eU)))));
        bufp->chgBit(oldp+236,(((0U != (0x0000003fU 
                                        & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                           >> 0x0000000eU))) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel))));
        bufp->chgBit(oldp+237,(((0U != (0x0000003fU 
                                        & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                           >> 0x0000000eU))) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab))));
        bufp->chgIData(oldp+238,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                     ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                        >> 8U) : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr) 
                                   << 8U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai))),32);
        bufp->chgBit(oldp+239,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack));
        bufp->chgBit(oldp+240,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel));
        bufp->chgBit(oldp+241,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab));
        bufp->chgIData(oldp+242,((0x00ffffffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                                  ? 
                                                 (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                                  >> 8U)
                                                  : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr))),24);
        bufp->chgCData(oldp+243,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao),8);
        bufp->chgBit(oldp+244,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))));
        bufp->chgBit(oldp+245,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready));
        bufp->chgBit(oldp+246,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd));
        bufp->chgCData(oldp+247,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm),4);
        bufp->chgCData(oldp+248,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb),4);
        bufp->chgCData(oldp+249,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb),4);
        bufp->chgIData(oldp+250,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32),32);
        bufp->chgIData(oldp+251,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32),32);
        bufp->chgCData(oldp+252,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count),3);
        bufp->chgCData(oldp+253,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size),3);
        bufp->chgCData(oldp+254,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size),3);
        bufp->chgCData(oldp+255,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),8);
        bufp->chgBit(oldp+256,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we));
        bufp->chgBit(oldp+257,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re));
        bufp->chgBit(oldp+258,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en));
        bufp->chgBit(oldp+259,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en));
        bufp->chgBit(oldp+260,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode));
        bufp->chgCData(oldp+261,((7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),3);
        bufp->chgBit(oldp+262,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable));
        bufp->chgBit(oldp+263,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad));
        bufp->chgCData(oldp+264,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier),4);
        bufp->chgCData(oldp+265,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir),4);
        bufp->chgCData(oldp+266,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr),2);
        bufp->chgCData(oldp+267,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr),5);
        bufp->chgBit(oldp+268,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared));
        bufp->chgBit(oldp+269,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol));
        bufp->chgCData(oldp+270,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr),8);
        bufp->chgCData(oldp+271,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr),8);
        bufp->chgIData(oldp+272,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl),24);
        bufp->chgBit(oldp+273,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc));
        bufp->chgBit(oldp+274,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d));
        bufp->chgBit(oldp+275,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset));
        bufp->chgSData(oldp+276,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc),16);
        bufp->chgCData(oldp+277,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level),4);
        bufp->chgBit(oldp+278,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset));
        bufp->chgBit(oldp+279,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset));
        bufp->chgBit(oldp+280,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                      >> 7U))));
        bufp->chgBit(oldp+281,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 2U))));
        bufp->chgBit(oldp+282,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 2U)))));
        bufp->chgBit(oldp+283,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg));
        bufp->chgBit(oldp+284,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg));
        bufp->chgCData(oldp+285,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg),8);
        bufp->chgCData(oldp+286,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg),8);
        bufp->chgCData(oldp+287,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count),8);
        bufp->chgCData(oldp+288,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg),3);
        bufp->chgBit(oldp+289,((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+290,((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+291,((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+292,((3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+293,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                                | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                       >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
        bufp->chgBit(oldp+294,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 3U))));
        bufp->chgBit(oldp+295,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 4U))));
        bufp->chgBit(oldp+296,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 3U))));
        bufp->chgBit(oldp+297,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 2U))));
        bufp->chgBit(oldp+298,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 1U))));
        bufp->chgBit(oldp+299,((1U & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0))));
        bufp->chgCData(oldp+300,(((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
                                      << 3U) | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r) 
                                                << 2U)) 
                                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r) 
                                        << 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r))) 
                                   << 4U) | ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r) 
                                               << 3U) 
                                              | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r) 
                                                 << 2U)) 
                                             | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r) 
                                                 << 1U) 
                                                | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r))))),8);
        bufp->chgBit(oldp+301,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
        bufp->chgBit(oldp+302,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
        bufp->chgBit(oldp+303,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2));
        bufp->chgBit(oldp+304,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3));
        bufp->chgBit(oldp+305,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4));
        bufp->chgBit(oldp+306,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5));
        bufp->chgBit(oldp+307,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6));
        bufp->chgBit(oldp+308,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
        bufp->chgBit(oldp+309,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r));
        bufp->chgBit(oldp+310,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r));
        bufp->chgBit(oldp+311,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r));
        bufp->chgBit(oldp+312,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r));
        bufp->chgBit(oldp+313,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r));
        bufp->chgBit(oldp+314,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
        bufp->chgBit(oldp+315,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r));
        bufp->chgBit(oldp+316,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r));
        bufp->chgBit(oldp+317,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask));
        bufp->chgBit(oldp+318,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
        bufp->chgBit(oldp+319,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
        bufp->chgBit(oldp+320,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int));
        bufp->chgBit(oldp+321,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
        bufp->chgBit(oldp+322,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int));
        bufp->chgBit(oldp+323,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we));
        bufp->chgBit(oldp+324,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop));
        bufp->chgSData(oldp+325,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out) 
                                   << 3U) | vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                  [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom])),11);
        bufp->chgBit(oldp+326,((0U != (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                       [0U] | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                               [1U] 
                                               | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                  [2U] 
                                                  | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                                     [3U] 
                                                     | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
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
                                                                                [0x0fU]))))))))))))))))));
        bufp->chgCData(oldp+327,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count),5);
        bufp->chgCData(oldp+328,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count),5);
        bufp->chgCData(oldp+329,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate),3);
        bufp->chgCData(oldp+330,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate),4);
        bufp->chgSData(oldp+331,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t),10);
        bufp->chgBit(oldp+332,((1U & (~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt))))));
        bufp->chgCData(oldp+333,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt),8);
        bufp->chgCData(oldp+334,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value),8);
        bufp->chgBit(oldp+335,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)) 
                                      | ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                         & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                            | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0))))))));
        bufp->chgBit(oldp+336,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                   & (2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))))));
        bufp->chgBit(oldp+337,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
        bufp->chgBit(oldp+338,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i));
        bufp->chgBit(oldp+339,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we));
        bufp->chgBit(oldp+340,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
        bufp->chgBit(oldp+341,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read));
        bufp->chgBit(oldp+342,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read));
        bufp->chgBit(oldp+343,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read));
        bufp->chgCData(oldp+344,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals),4);
        bufp->chgBit(oldp+345,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d));
        bufp->chgBit(oldp+346,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d));
        bufp->chgBit(oldp+347,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d));
        bufp->chgBit(oldp+348,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d));
        bufp->chgBit(oldp+349,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d));
        bufp->chgBit(oldp+350,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d));
        bufp->chgBit(oldp+351,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d));
        bufp->chgBit(oldp+352,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d));
        bufp->chgSData(oldp+353,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt),9);
        bufp->chgSData(oldp+354,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next),9);
        bufp->chgBit(oldp+355,((1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                                       ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                                      >> 8U))));
        bufp->chgBit(oldp+356,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d));
        bufp->chgBit(oldp+357,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d));
        bufp->chgBit(oldp+358,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d));
        bufp->chgBit(oldp+359,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d));
        bufp->chgBit(oldp+360,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d));
        bufp->chgBit(oldp+361,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))));
        bufp->chgBit(oldp+362,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))));
        bufp->chgBit(oldp+363,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))));
        bufp->chgBit(oldp+364,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))));
        bufp->chgBit(oldp+365,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))));
        bufp->chgBit(oldp+366,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd));
        bufp->chgBit(oldp+367,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd));
        bufp->chgBit(oldp+368,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd));
        bufp->chgBit(oldp+369,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd));
        bufp->chgBit(oldp+370,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd));
        bufp->chgBit(oldp+371,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read));
        bufp->chgBit(oldp+372,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
        bufp->chgBit(oldp+373,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable));
        bufp->chgCData(oldp+374,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16),4);
        bufp->chgCData(oldp+375,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter),3);
        bufp->chgCData(oldp+376,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift),8);
        bufp->chgBit(oldp+377,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity));
        bufp->chgBit(oldp+378,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error));
        bufp->chgBit(oldp+379,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error));
        bufp->chgBit(oldp+380,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in));
        bufp->chgBit(oldp+381,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor));
        bufp->chgCData(oldp+382,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b),8);
        bufp->chgBit(oldp+383,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q));
        bufp->chgSData(oldp+384,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in),11);
        bufp->chgBit(oldp+385,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
        bufp->chgBit(oldp+386,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))));
        bufp->chgBit(oldp+387,((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+388,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+389,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgCData(oldp+390,((0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                                                 - (IData)(1U)))),4);
        bufp->chgSData(oldp+391,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value),10);
        bufp->chgCData(oldp+392,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                                 >> 2U))),8);
        bufp->chgCData(oldp+393,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out),8);
        bufp->chgCData(oldp+394,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0]),3);
        bufp->chgCData(oldp+395,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1]),3);
        bufp->chgCData(oldp+396,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2]),3);
        bufp->chgCData(oldp+397,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3]),3);
        bufp->chgCData(oldp+398,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4]),3);
        bufp->chgCData(oldp+399,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5]),3);
        bufp->chgCData(oldp+400,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6]),3);
        bufp->chgCData(oldp+401,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7]),3);
        bufp->chgCData(oldp+402,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8]),3);
        bufp->chgCData(oldp+403,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9]),3);
        bufp->chgCData(oldp+404,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[10]),3);
        bufp->chgCData(oldp+405,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[11]),3);
        bufp->chgCData(oldp+406,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[12]),3);
        bufp->chgCData(oldp+407,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[13]),3);
        bufp->chgCData(oldp+408,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[14]),3);
        bufp->chgCData(oldp+409,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[15]),3);
        bufp->chgCData(oldp+410,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top),4);
        bufp->chgCData(oldp+411,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom),4);
        bufp->chgCData(oldp+412,((0x0000000fU & ((IData)(1U) 
                                                 + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)))),4);
        bufp->chgCData(oldp+413,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0U]),3);
        bufp->chgCData(oldp+414,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [1U]),3);
        bufp->chgCData(oldp+415,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [2U]),3);
        bufp->chgCData(oldp+416,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [3U]),3);
        bufp->chgCData(oldp+417,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [4U]),3);
        bufp->chgCData(oldp+418,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [5U]),3);
        bufp->chgCData(oldp+419,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [6U]),3);
        bufp->chgCData(oldp+420,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [7U]),3);
        bufp->chgCData(oldp+421,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [8U]),3);
        bufp->chgCData(oldp+422,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [9U]),3);
        bufp->chgCData(oldp+423,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0aU]),3);
        bufp->chgCData(oldp+424,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0bU]),3);
        bufp->chgCData(oldp+425,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0cU]),3);
        bufp->chgCData(oldp+426,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0dU]),3);
        bufp->chgCData(oldp+427,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0eU]),3);
        bufp->chgCData(oldp+428,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0fU]),3);
        bufp->chgCData(oldp+429,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                                                 >> 3U))),8);
        bufp->chgCData(oldp+430,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+431,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+432,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+433,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+434,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+435,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+436,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+437,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+438,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+439,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+440,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+441,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+442,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+443,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+444,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+445,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[15]),8);
        bufp->chgBit(oldp+446,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                                   | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                          >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode))))));
        bufp->chgCData(oldp+447,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter),5);
        bufp->chgCData(oldp+448,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter),3);
        bufp->chgCData(oldp+449,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out),7);
        bufp->chgBit(oldp+450,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
        bufp->chgBit(oldp+451,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor));
        bufp->chgBit(oldp+452,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop));
        bufp->chgBit(oldp+453,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out));
        bufp->chgBit(oldp+454,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error));
        bufp->chgCData(oldp+455,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time),3);
        bufp->chgCData(oldp+456,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out),8);
        bufp->chgBit(oldp+457,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun));
        bufp->chgCData(oldp+458,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak),8);
        bufp->chgCData(oldp+459,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top),4);
        bufp->chgCData(oldp+460,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom),4);
        bufp->chgCData(oldp+461,((0x0000000fU & ((IData)(1U) 
                                                 + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)))),4);
        bufp->chgCData(oldp+462,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+463,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+464,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+465,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+466,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+467,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+468,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+469,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+470,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+471,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+472,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+473,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+474,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+475,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+476,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+477,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[15]),8);
        bufp->chgCData(oldp+478,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit),5);
        bufp->chgCData(oldp+479,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit),5);
        bufp->chgCData(oldp+480,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit),5);
        bufp->chgCData(oldp+481,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready),5);
        bufp->chgCData(oldp+482,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready),5);
        bufp->chgCData(oldp+483,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid),5);
        bufp->chgCData(oldp+484,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready),5);
        bufp->chgCData(oldp+485,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast),5);
        bufp->chgCData(oldp+486,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid),5);
        bufp->chgCData(oldp+487,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0]),4);
        bufp->chgCData(oldp+488,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1]),4);
        bufp->chgCData(oldp+489,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2]),4);
        bufp->chgCData(oldp+490,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3]),4);
        bufp->chgCData(oldp+491,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4]),4);
        bufp->chgCData(oldp+492,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0]),4);
        bufp->chgCData(oldp+493,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1]),4);
        bufp->chgCData(oldp+494,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2]),4);
        bufp->chgCData(oldp+495,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3]),4);
        bufp->chgCData(oldp+496,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4]),4);
        bufp->chgCData(oldp+497,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0),3);
        bufp->chgCData(oldp+498,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1),3);
        bufp->chgCData(oldp+499,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0),3);
        bufp->chgCData(oldp+500,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                                        >> 3U))),3);
        bufp->chgCData(oldp+501,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                                   << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid))),3);
        bufp->chgCData(oldp+502,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                                        >> 3U))),3);
        bufp->chgBit(oldp+503,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty));
        bufp->chgBit(oldp+504,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full));
        bufp->chgBit(oldp+505,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty));
        bufp->chgBit(oldp+506,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full));
        bufp->chgCData(oldp+507,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir),3);
        bufp->chgCData(oldp+508,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel),3);
        bufp->chgBit(oldp+509,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog));
        bufp->chgCData(oldp+510,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg),3);
        bufp->chgCData(oldp+511,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel),3);
        bufp->chgCData(oldp+512,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel),3);
        bufp->chgCData(oldp+513,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir),3);
        bufp->chgCData(oldp+514,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel),3);
        bufp->chgBit(oldp+515,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
                                         | (0x1fe0U 
                                            == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_araddr 
                                                >> 0x00000010U)))))));
        bufp->chgIData(oldp+516,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int),32);
        bufp->chgCData(oldp+517,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+518,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+519,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+520,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+521,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+522,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+523,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i),32);
        bufp->chgCData(oldp+524,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+525,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+526,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+527,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+528,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+529,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+530,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i),32);
        bufp->chgQData(oldp+531,((((QData)((IData)(
                                                   (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst) 
                                                     << 7U) 
                                                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize) 
                                                        << 4U) 
                                                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                   << 0x00000024U) 
                                  | (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                      << 4U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid))))),45);
        bufp->chgIData(oldp+533,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+534,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                   & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                  | (((- (IData)((1U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                      & ((((IData)(1U) 
                                           + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                              >> 2U)) 
                                          << 2U) | 
                                         (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))) 
                                     | ((- (IData)(
                                                   (2U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                        & ((0xffffffc0U 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                           | ((0x0000003cU 
                                               & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                       >> 2U)) 
                                                   | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                          >> 2U)))) 
                                                  << 2U)) 
                                              | (3U 
                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
        bufp->chgIData(oldp+535,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                                  | ((0x0000003cU & 
                                      ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)))),32);
        bufp->chgCData(oldp+536,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+537,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+538,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+539,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+540,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+541,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+542,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+543,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+544,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+545,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data),45);
        bufp->chgQData(oldp+547,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+549,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+550,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+551,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+552,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+553,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+554,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+555,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+556,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                   << 0x0000000dU) 
                                  | (QData)((IData)(
                                                    ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst) 
                                                       << 0x0000000bU) 
                                                      | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize) 
                                                         << 8U)) 
                                                     | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                         << 4U) 
                                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid))))))),45);
        bufp->chgIData(oldp+558,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+559,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                   & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                  | (((- (IData)((1U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                      & ((((IData)(1U) 
                                           + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                              >> 2U)) 
                                          << 2U) | 
                                         (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                     | ((- (IData)(
                                                   (2U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                        & ((0xffffffc0U 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                           | ((0x0000003cU 
                                               & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                       >> 2U)) 
                                                   | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                          >> 2U)))) 
                                                  << 2U)) 
                                              | (3U 
                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
        bufp->chgIData(oldp+560,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                                  | ((0x0000003cU & 
                                      ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
        bufp->chgCData(oldp+561,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+562,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+563,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+564,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+565,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+566,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+567,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+568,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+569,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+570,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+572,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+573,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+574,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+575,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+576,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+577,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+578,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+579,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+580,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+581,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgBit(oldp+582,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go));
        bufp->chgCData(oldp+583,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgBit(oldp+584,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+585,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid));
        bufp->chgIData(oldp+586,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0),32);
        bufp->chgIData(oldp+587,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1),32);
        bufp->chgIData(oldp+588,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2),32);
        bufp->chgIData(oldp+589,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3),32);
        bufp->chgIData(oldp+590,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4),32);
        bufp->chgIData(oldp+591,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5),32);
        bufp->chgIData(oldp+592,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6),32);
        bufp->chgIData(oldp+593,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7),32);
        bufp->chgIData(oldp+594,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data),32);
        bufp->chgIData(oldp+595,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data),32);
        bufp->chgIData(oldp+596,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data),32);
        bufp->chgIData(oldp+597,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data),32);
        bufp->chgIData(oldp+598,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),32);
        bufp->chgIData(oldp+599,(((2U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                         << 1U)) | 
                                  (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))))),32);
        bufp->chgCData(oldp+600,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data),8);
        bufp->chgBit(oldp+601,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid));
        bufp->chgIData(oldp+602,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r2),32);
        bufp->chgIData(oldp+603,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__simu_flag),32);
        bufp->chgIData(oldp+604,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu),32);
        bufp->chgCData(oldp+605,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data),8);
        bufp->chgBit(oldp+606,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace));
        bufp->chgBit(oldp+607,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor));
        bufp->chgBit(oldp+608,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin));
        bufp->chgBit(oldp+609,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1));
        bufp->chgBit(oldp+610,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2));
        bufp->chgBit(oldp+611,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3));
        bufp->chgBit(oldp+612,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1));
        bufp->chgBit(oldp+613,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2));
        bufp->chgIData(oldp+614,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r),32);
        bufp->chgIData(oldp+615,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1),32);
        bufp->chgIData(oldp+616,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2),32);
        bufp->chgIData(oldp+617,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r1),32);
        bufp->chgIData(oldp+618,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer),32);
        bufp->chgCData(oldp+619,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata)),8);
        bufp->chgSData(oldp+620,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),16);
        bufp->chgCData(oldp+621,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state),3);
        bufp->chgBit(oldp+622,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag));
        bufp->chgIData(oldp+623,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count),20);
        bufp->chgCData(oldp+624,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count),4);
        bufp->chgBit(oldp+625,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                      >> 0x00000013U))));
        bufp->chgBit(oldp+626,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r));
        bufp->chgBit(oldp+627,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r));
        bufp->chgBit(oldp+628,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag));
        bufp->chgIData(oldp+629,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count),20);
        bufp->chgBit(oldp+630,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
                                      >> 0x00000013U))));
        bufp->chgBit(oldp+631,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag));
        bufp->chgIData(oldp+632,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count),20);
        bufp->chgBit(oldp+633,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
                                      >> 0x00000013U))));
        bufp->chgIData(oldp+634,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count),20);
        bufp->chgCData(oldp+635,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data),4);
        bufp->chgCData(oldp+636,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arlen),8);
        bufp->chgIData(oldp+637,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+638,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0x0fU
                                            : 0U))),8);
        bufp->chgCData(oldp+639,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+640,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid),2);
        bufp->chgBit(oldp+641,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))));
        bufp->chgIData(oldp+642,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg),32);
        bufp->chgBit(oldp+643,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_req_valid));
        VL_SHIFTR_WWI(512,512,10, __Vtemp_1, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                       >> 2U)), 5U)));
        bufp->chgIData(oldp+644,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                   ? __Vtemp_1[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_2, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(1U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgIData(oldp+645,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                   ? __Vtemp_2[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_3, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgIData(oldp+646,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                   ? __Vtemp_3[0U] : 0U)),32);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_4, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgIData(oldp+647,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                   ? __Vtemp_4[0U] : 0U)),32);
        bufp->chgIData(oldp+648,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr
                                   : 0U)),32);
        bufp->chgBit(oldp+649,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid));
        bufp->chgBit(oldp+650,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid) 
                                & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state)))));
        bufp->chgBit(oldp+651,((0x0000000000000324ULL 
                                == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__reg_)));
        bufp->chgQData(oldp+652,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__reg_),64);
        bufp->chgCData(oldp+654,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                        >> 2U))),2);
        bufp->chgBit(oldp+655,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid));
        bufp->chgCData(oldp+656,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                        >> 2U))),2);
        bufp->chgBit(oldp+657,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid)))));
        bufp->chgBit(oldp+658,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid));
        bufp->chgQData(oldp+659,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_pc),64);
        bufp->chgIData(oldp+661,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_inst),32);
        bufp->chgQData(oldp+662,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt),64);
        bufp->chgQData(oldp+664,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt),64);
        bufp->chgBit(oldp+666,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_valid));
        bufp->chgCData(oldp+667,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state),2);
        bufp->chgBit(oldp+668,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid));
        bufp->chgCData(oldp+669,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_idx),8);
        bufp->chgBit(oldp+670,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+671,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+672,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+673,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+674,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+675,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        bufp->chgBit(oldp+676,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
        bufp->chgIData(oldp+677,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U)),18);
        if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
            __Vtemp_5[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0U];
            __Vtemp_5[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][1U];
            __Vtemp_5[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][2U];
            __Vtemp_5[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][3U];
            __Vtemp_5[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][4U];
            __Vtemp_5[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][5U];
            __Vtemp_5[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][6U];
            __Vtemp_5[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][7U];
            __Vtemp_5[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][8U];
            __Vtemp_5[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][9U];
            __Vtemp_5[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000aU];
            __Vtemp_5[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000bU];
            __Vtemp_5[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000cU];
            __Vtemp_5[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000dU];
            __Vtemp_5[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000eU];
            __Vtemp_5[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0][0x0000000fU];
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
            __Vtemp_5[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_5[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_5[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_5[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_5[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_5[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        }
        bufp->chgWData(oldp+678,(__Vtemp_5),512);
        if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
            __Vtemp_6[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0U];
            __Vtemp_6[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][1U];
            __Vtemp_6[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][2U];
            __Vtemp_6[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][3U];
            __Vtemp_6[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][4U];
            __Vtemp_6[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][5U];
            __Vtemp_6[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][6U];
            __Vtemp_6[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][7U];
            __Vtemp_6[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][8U];
            __Vtemp_6[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][9U];
            __Vtemp_6[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000aU];
            __Vtemp_6[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000bU];
            __Vtemp_6[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000cU];
            __Vtemp_6[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000dU];
            __Vtemp_6[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000eU];
            __Vtemp_6[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0][0x0000000fU];
        } else {
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
            __Vtemp_6[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_6[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_6[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_6[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_6[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_6[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        }
        bufp->chgWData(oldp+694,(__Vtemp_6),512);
        if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
            __Vtemp_7[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0U];
            __Vtemp_7[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][1U];
            __Vtemp_7[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][2U];
            __Vtemp_7[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][3U];
            __Vtemp_7[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][4U];
            __Vtemp_7[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][5U];
            __Vtemp_7[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][6U];
            __Vtemp_7[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][7U];
            __Vtemp_7[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][8U];
            __Vtemp_7[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][9U];
            __Vtemp_7[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000aU];
            __Vtemp_7[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000bU];
            __Vtemp_7[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000cU];
            __Vtemp_7[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000dU];
            __Vtemp_7[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000eU];
            __Vtemp_7[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0][0x0000000fU];
        } else {
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
            __Vtemp_7[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_7[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_7[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_7[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_7[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_7[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        }
        bufp->chgWData(oldp+710,(__Vtemp_7),512);
        if (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) {
            __Vtemp_8[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0U];
            __Vtemp_8[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][1U];
            __Vtemp_8[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][2U];
            __Vtemp_8[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][3U];
            __Vtemp_8[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][4U];
            __Vtemp_8[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][5U];
            __Vtemp_8[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][6U];
            __Vtemp_8[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][7U];
            __Vtemp_8[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][8U];
            __Vtemp_8[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][9U];
            __Vtemp_8[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000aU];
            __Vtemp_8[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000bU];
            __Vtemp_8[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000cU];
            __Vtemp_8[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000dU];
            __Vtemp_8[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000eU];
            __Vtemp_8[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0][0x0000000fU];
        } else {
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
            __Vtemp_8[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_8[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_8[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_8[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_8[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_8[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        }
        bufp->chgWData(oldp+726,(__Vtemp_8),512);
        bufp->chgBit(oldp+742,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid));
        bufp->chgIData(oldp+743,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_addr),32);
        bufp->chgIData(oldp+744,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag),18);
        bufp->chgCData(oldp+745,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__victimRespReg),2);
        bufp->chgBit(oldp+746,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid));
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
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
            __Vtemp_18[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_18[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_18[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_18[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_18[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_18[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        } else if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
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
            __Vtemp_18[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_18[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_18[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_18[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_18[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_18[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        } else if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
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
            __Vtemp_18[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_18[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_18[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_18[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_18[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_18[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        } else if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
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
            __Vtemp_18[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_18[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_18[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_18[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_18[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_18[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        } else if ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) {
            __Vtemp_18[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0U];
            __Vtemp_18[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[1U];
            __Vtemp_18[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[2U];
            __Vtemp_18[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[3U];
            __Vtemp_18[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[4U];
            __Vtemp_18[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[5U];
            __Vtemp_18[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[6U];
            __Vtemp_18[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[7U];
            __Vtemp_18[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[8U];
            __Vtemp_18[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[9U];
            __Vtemp_18[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000aU];
            __Vtemp_18[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000bU];
            __Vtemp_18[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000cU];
            __Vtemp_18[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000dU];
            __Vtemp_18[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000eU];
            __Vtemp_18[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT___io_data_write_data_T[0x0000000fU];
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
            __Vtemp_18[0x0000000aU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000aU];
            __Vtemp_18[0x0000000bU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000bU];
            __Vtemp_18[0x0000000cU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000cU];
            __Vtemp_18[0x0000000dU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000dU];
            __Vtemp_18[0x0000000eU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000eU];
            __Vtemp_18[0x0000000fU] = Vsimu_top__ConstPool__CONST_h93e1b771_0[0x0000000fU];
        }
        bufp->chgWData(oldp+747,(__Vtemp_18),512);
        bufp->chgCData(oldp+763,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx)
                                               : 0U)))))),8);
        bufp->chgIData(oldp+764,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((4U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                               : 0U)))))),18);
        bufp->chgBit(oldp+765,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid));
        bufp->chgCData(oldp+766,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way),2);
        bufp->chgBit(oldp+767,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_valid));
        bufp->chgCData(oldp+768,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx),8);
        bufp->chgCData(oldp+769,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way),2);
        bufp->chgBit(oldp+770,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+771,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((0U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+772,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+773,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((1U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+774,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+775,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgBit(oldp+776,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                         & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
        bufp->chgIData(oldp+777,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                             ? 0U : 
                                            ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? ((3U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                  ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                  : 0U)
                                              : 0U))))),18);
        bufp->chgWData(oldp+778,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data),512);
        bufp->chgBit(oldp+794,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_en_pipe_0));
        bufp->chgCData(oldp+795,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+796,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+812,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_en_pipe_0));
        bufp->chgWData(oldp+813,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0]),512);
        if ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_20[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_20[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_20[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_20[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_20[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_20[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_20[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_20[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_20[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_20[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_20[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000aU];
            __Vtemp_20[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000bU];
            __Vtemp_20[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000cU];
            __Vtemp_20[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000dU];
            __Vtemp_20[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000eU];
            __Vtemp_20[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000fU];
        } else {
            __Vtemp_20[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0U];
            __Vtemp_20[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][1U];
            __Vtemp_20[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][2U];
            __Vtemp_20[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][3U];
            __Vtemp_20[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][4U];
            __Vtemp_20[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][5U];
            __Vtemp_20[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][6U];
            __Vtemp_20[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][7U];
            __Vtemp_20[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][8U];
            __Vtemp_20[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][9U];
            __Vtemp_20[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000aU];
            __Vtemp_20[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000bU];
            __Vtemp_20[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000cU];
            __Vtemp_20[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000dU];
            __Vtemp_20[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000eU];
            __Vtemp_20[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0][0x0000000fU];
        }
        bufp->chgWData(oldp+829,(__Vtemp_20),512);
        bufp->chgBit(oldp+845,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_en_pipe_0));
        bufp->chgCData(oldp+846,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+847,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+863,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_en_pipe_0));
        bufp->chgWData(oldp+864,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0]),512);
        if ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_22[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_22[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_22[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_22[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_22[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_22[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_22[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_22[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_22[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_22[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_22[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000aU];
            __Vtemp_22[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000bU];
            __Vtemp_22[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000cU];
            __Vtemp_22[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000dU];
            __Vtemp_22[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000eU];
            __Vtemp_22[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000fU];
        } else {
            __Vtemp_22[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0U];
            __Vtemp_22[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][1U];
            __Vtemp_22[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][2U];
            __Vtemp_22[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][3U];
            __Vtemp_22[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][4U];
            __Vtemp_22[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][5U];
            __Vtemp_22[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][6U];
            __Vtemp_22[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][7U];
            __Vtemp_22[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][8U];
            __Vtemp_22[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][9U];
            __Vtemp_22[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000aU];
            __Vtemp_22[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000bU];
            __Vtemp_22[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000cU];
            __Vtemp_22[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000dU];
            __Vtemp_22[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000eU];
            __Vtemp_22[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0][0x0000000fU];
        }
        bufp->chgWData(oldp+880,(__Vtemp_22),512);
        bufp->chgBit(oldp+896,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_en_pipe_0));
        bufp->chgCData(oldp+897,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+898,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+914,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_en_pipe_0));
        bufp->chgWData(oldp+915,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0]),512);
        if ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_24[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_24[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_24[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_24[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_24[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_24[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_24[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_24[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_24[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_24[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_24[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000aU];
            __Vtemp_24[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000bU];
            __Vtemp_24[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000cU];
            __Vtemp_24[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000dU];
            __Vtemp_24[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000eU];
            __Vtemp_24[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000fU];
        } else {
            __Vtemp_24[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0U];
            __Vtemp_24[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][1U];
            __Vtemp_24[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][2U];
            __Vtemp_24[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][3U];
            __Vtemp_24[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][4U];
            __Vtemp_24[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][5U];
            __Vtemp_24[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][6U];
            __Vtemp_24[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][7U];
            __Vtemp_24[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][8U];
            __Vtemp_24[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][9U];
            __Vtemp_24[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000aU];
            __Vtemp_24[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000bU];
            __Vtemp_24[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000cU];
            __Vtemp_24[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000dU];
            __Vtemp_24[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000eU];
            __Vtemp_24[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0][0x0000000fU];
        }
        bufp->chgWData(oldp+931,(__Vtemp_24),512);
        bufp->chgBit(oldp+947,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_en_pipe_0));
        bufp->chgCData(oldp+948,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0),8);
        bufp->chgWData(oldp+949,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0]),512);
        bufp->chgBit(oldp+965,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_en_pipe_0));
        bufp->chgWData(oldp+966,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0]),512);
        if ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))) {
            __Vtemp_26[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0U];
            __Vtemp_26[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[1U];
            __Vtemp_26[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[2U];
            __Vtemp_26[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[3U];
            __Vtemp_26[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[4U];
            __Vtemp_26[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[5U];
            __Vtemp_26[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[6U];
            __Vtemp_26[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[7U];
            __Vtemp_26[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[8U];
            __Vtemp_26[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[9U];
            __Vtemp_26[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000aU];
            __Vtemp_26[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000bU];
            __Vtemp_26[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000cU];
            __Vtemp_26[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000dU];
            __Vtemp_26[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000eU];
            __Vtemp_26[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data[0x0000000fU];
        } else {
            __Vtemp_26[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0U];
            __Vtemp_26[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][1U];
            __Vtemp_26[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][2U];
            __Vtemp_26[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][3U];
            __Vtemp_26[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][4U];
            __Vtemp_26[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][5U];
            __Vtemp_26[6U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][6U];
            __Vtemp_26[7U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][7U];
            __Vtemp_26[8U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][8U];
            __Vtemp_26[9U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][9U];
            __Vtemp_26[0x0000000aU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000aU];
            __Vtemp_26[0x0000000bU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000bU];
            __Vtemp_26[0x0000000cU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000cU];
            __Vtemp_26[0x0000000dU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000dU];
            __Vtemp_26[0x0000000eU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000eU];
            __Vtemp_26[0x0000000fU] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0][0x0000000fU];
        }
        bufp->chgWData(oldp+982,(__Vtemp_26),512);
        bufp->chgBit(oldp+998,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_valid));
        bufp->chgIData(oldp+999,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_addr),32);
        bufp->chgCData(oldp+1000,((0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                                  >> 6U))),8);
        bufp->chgIData(oldp+1001,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                   >> 0x0000000eU)),18);
        bufp->chgBit(oldp+1002,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid));
        bufp->chgIData(oldp+1003,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr),32);
        bufp->chgBit(oldp+1004,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit));
        bufp->chgWData(oldp+1005,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data),512);
        bufp->chgBit(oldp+1021,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                     [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1022,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                     [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1023,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                     [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1024,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                                  & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                                 & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                      ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                     [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                      : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
        bufp->chgBit(oldp+1025,((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T))));
        bufp->chgCData(oldp+1026,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T) 
                                         >> 2U))),2);
        bufp->chgCData(oldp+1027,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1),2);
        bufp->chgCData(oldp+1028,((0x0000000fU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U))),4);
        bufp->chgSData(oldp+1029,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                               (0x0000000fU 
                                                                & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                                   >> 2U)), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_27, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                       >> 2U)), 5U)));
        bufp->chgWData(oldp+1030,(__Vtemp_27),512);
        bufp->chgCData(oldp+1046,((0x0000000fU & ((IData)(1U) 
                                                  + 
                                                  (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U)))),4);
        bufp->chgSData(oldp+1047,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                               (0x0000000fU 
                                                                & ((IData)(1U) 
                                                                   + 
                                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                                    >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_28, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(1U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgWData(oldp+1048,(__Vtemp_28),512);
        bufp->chgCData(oldp+1064,((0x0000000fU & ((IData)(2U) 
                                                  + 
                                                  (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U)))),4);
        bufp->chgSData(oldp+1065,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                               (0x0000000fU 
                                                                & ((IData)(2U) 
                                                                   + 
                                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                                    >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_29, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgWData(oldp+1066,(__Vtemp_29),512);
        bufp->chgCData(oldp+1082,((0x0000000fU & ((IData)(3U) 
                                                  + 
                                                  (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U)))),4);
        bufp->chgSData(oldp+1083,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                               (0x0000000fU 
                                                                & ((IData)(3U) 
                                                                   + 
                                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                                    >> 2U))), 5U))),10);
        VL_SHIFTR_WWI(512,512,10, __Vtemp_30, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                      (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                   (0x0000000fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                        >> 2U))), 5U)));
        bufp->chgWData(oldp+1084,(__Vtemp_30),512);
        bufp->chgBit(oldp+1100,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_en_pipe_0));
        bufp->chgCData(oldp+1101,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0),8);
        bufp->chgBit(oldp+1102,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1103,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1104,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1105,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (0U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1106,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1107,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1108,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1109,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1110,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1111,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1112,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1113,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1114,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1115,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (1U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1116,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1117,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1118,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1119,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1120,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((1U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1121,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1122,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1123,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1124,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1125,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (2U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1126,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1127,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1128,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1129,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1130,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((2U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0])),18);
        bufp->chgBit(oldp+1131,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_en_pipe_0));
        bufp->chgBit(oldp+1132,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
        bufp->chgBit(oldp+1133,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_en_pipe_0));
        bufp->chgBit(oldp+1134,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0]));
        bufp->chgBit(oldp+1135,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                  ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                              & (3U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                                  : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0])));
        bufp->chgBit(oldp+1136,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_en_pipe_0));
        bufp->chgIData(oldp+1137,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
        bufp->chgBit(oldp+1138,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_en_pipe_0));
        bufp->chgIData(oldp+1139,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0]),18);
        bufp->chgIData(oldp+1140,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                    ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                        ? 0U : ((1U 
                                                 == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((3U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                    : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0])),18);
        bufp->chgCData(oldp+1141,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state),3);
        bufp->chgIData(oldp+1142,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr),32);
        bufp->chgCData(oldp+1143,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx),8);
        bufp->chgIData(oldp+1144,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag),18);
        bufp->chgCData(oldp+1145,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way),2);
        bufp->chgIData(oldp+1146,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0),32);
        bufp->chgIData(oldp+1147,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1),32);
        bufp->chgIData(oldp+1148,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2),32);
        bufp->chgIData(oldp+1149,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3),32);
        bufp->chgIData(oldp+1150,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4),32);
        bufp->chgIData(oldp+1151,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5),32);
        bufp->chgIData(oldp+1152,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6),32);
        bufp->chgIData(oldp+1153,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7),32);
        bufp->chgIData(oldp+1154,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8),32);
        bufp->chgIData(oldp+1155,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9),32);
        bufp->chgIData(oldp+1156,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10),32);
        bufp->chgIData(oldp+1157,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11),32);
        bufp->chgIData(oldp+1158,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12),32);
        bufp->chgIData(oldp+1159,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13),32);
        bufp->chgIData(oldp+1160,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14),32);
        bufp->chgIData(oldp+1161,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15),32);
        bufp->chgCData(oldp+1162,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count),5);
        __Vtemp_36[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0;
        __Vtemp_36[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1;
        __Vtemp_36[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2;
        __Vtemp_36[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3;
        __Vtemp_36[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4;
        __Vtemp_36[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5;
        __Vtemp_36[6U] = (IData)((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                                   << 0x00000020U) 
                                  | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))));
        __Vtemp_36[7U] = (IData)(((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                                    << 0x00000020U) 
                                   | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))) 
                                  >> 0x00000020U));
        bufp->chgWData(oldp+1163,(__Vtemp_36),256);
        bufp->chgBit(oldp+1171,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_en_pipe_0));
        bufp->chgCData(oldp+1172,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_addr_pipe_0),8);
        bufp->chgCData(oldp+1173,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data),3);
        bufp->chgBit(oldp+1174,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_en_pipe_0));
        bufp->chgCData(oldp+1175,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_addr_pipe_0),8);
        bufp->chgCData(oldp+1176,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data),3);
        bufp->chgCData(oldp+1177,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                    ? (6U | (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                                   >> 2U)))
                                    : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                        ? (4U | (1U 
                                                 & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                                    >> 2U)))
                                        : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                            ? (1U | 
                                               (2U 
                                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data)))
                                            : ((3U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                                ? (2U 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data))
                                                : 0U))))),3);
        bufp->chgBit(oldp+1178,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data))));
        bufp->chgBit(oldp+1179,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                       >> 1U))));
        bufp->chgBit(oldp+1180,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                       >> 2U))));
        bufp->chgBit(oldp+1181,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable)))));
        bufp->chgBit(oldp+1182,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable));
        bufp->chgBit(oldp+1183,((1U & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random)));
        bufp->chgBit(oldp+1184,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable)))));
        bufp->chgBit(oldp+1185,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable));
        bufp->chgBit(oldp+1186,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 1U))));
        bufp->chgBit(oldp+1187,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 2U))));
        bufp->chgBit(oldp+1188,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay));
        bufp->chgBit(oldp+1189,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 3U))));
        bufp->chgIData(oldp+1190,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random),23);
        bufp->chgIData(oldp+1191,(((0x007ffffeU & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                   << 1U)) 
                                   | (1U & VL_REDXOR_32(
                                                        (0x00420000U 
                                                         & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random))))),23);
        bufp->chgBit(oldp+1192,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay));
        bufp->chgBit(oldp+1193,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                        >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable)))));
        bufp->chgBit(oldp+1194,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable));
        bufp->chgBit(oldp+1195,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 4U))));
        bufp->chgQData(oldp+1196,((((QData)((IData)(
                                                    (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst) 
                                                      << 7U) 
                                                     | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize) 
                                                         << 4U) 
                                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                    << 0x00000024U) 
                                   | (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                       << 4U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid))))),45);
        bufp->chgIData(oldp+1198,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+1199,(((((IData)(1U) + 
                                     (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+1200,((((- (IData)((0U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                    & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                   | (((- (IData)((1U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                       & ((((IData)(1U) 
                                            + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                               >> 2U)) 
                                           << 2U) | 
                                          (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))) 
                                      | ((- (IData)(
                                                    (2U 
                                                     == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                         & ((0xffffffc0U 
                                             & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                            | ((0x0000003cU 
                                                & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                     & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                        >> 2U)) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                           >> 2U)))) 
                                                   << 2U)) 
                                               | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
        bufp->chgIData(oldp+1201,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                   | ((0x0000003cU 
                                       & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                            & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                               >> 2U)) 
                                           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                              & ((IData)(1U) 
                                                 + 
                                                 (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                  >> 2U)))) 
                                          << 2U)) | 
                                      (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)))),32);
        bufp->chgCData(oldp+1202,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+1203,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1204,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+1205,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+1206,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+1207,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+1208,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+1209,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+1210,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+1211,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+1213,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                           >> 0x0000000dU))),32);
        bufp->chgCData(oldp+1214,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+1215,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+1216,((0x0000000fU & (IData)(
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                          >> 4U)))),4);
        bufp->chgCData(oldp+1217,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1218,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+1219,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+1220,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                    << 0x0000000dU) 
                                   | (QData)((IData)(
                                                     ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst) 
                                                        << 0x0000000bU) 
                                                       | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize) 
                                                          << 8U)) 
                                                      | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                          << 4U) 
                                                         | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid))))))),45);
        bufp->chgIData(oldp+1222,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+1223,(((((IData)(1U) + 
                                     (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                      >> 2U)) << 2U) 
                                   | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+1224,((((- (IData)((0U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                    & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                   | (((- (IData)((1U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                       & ((((IData)(1U) 
                                            + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                               >> 2U)) 
                                           << 2U) | 
                                          (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                      | ((- (IData)(
                                                    (2U 
                                                     == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                         & ((0xffffffc0U 
                                             & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                            | ((0x0000003cU 
                                                & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                     & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                        >> 2U)) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                           >> 2U)))) 
                                                   << 2U)) 
                                               | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
        bufp->chgIData(oldp+1225,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                   | ((0x0000003cU 
                                       & ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                            & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                               >> 2U)) 
                                           | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                              & ((IData)(1U) 
                                                 + 
                                                 (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                  >> 2U)))) 
                                          << 2U)) | 
                                      (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
        bufp->chgCData(oldp+1226,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+1227,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1228,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+1229,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+1230,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+1231,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+1232,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+1233,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+1234,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+1235,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+1237,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                           >> 0x0000000dU))),32);
        bufp->chgCData(oldp+1238,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+1239,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+1240,((0x0000000fU & (IData)(
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                          >> 4U)))),4);
        bufp->chgCData(oldp+1241,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                 >> 8U)))),3);
        bufp->chgBit(oldp+1242,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+1243,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+1244,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgCData(oldp+1245,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+1246,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgBit(oldp+1247,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go));
        bufp->chgCData(oldp+1248,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgIData(oldp+1249,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgBit(oldp+1250,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+1251,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid));
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[3U]))) {
        bufp->chgSData(oldp+1252,(vlSelfRef.NAND_top__DOT__nand_addr_c),14);
        bufp->chgIData(oldp+1253,(vlSelfRef.NAND_top__DOT__nand_addr_r),25);
        bufp->chgIData(oldp+1254,(vlSelfRef.NAND_top__DOT__nand_op_num),32);
        bufp->chgIData(oldp+1255,(vlSelfRef.NAND_top__DOT__nand_parameter),32);
        bufp->chgIData(oldp+1256,(vlSelfRef.NAND_top__DOT__nand_ce_map0),32);
        bufp->chgIData(oldp+1257,(vlSelfRef.NAND_top__DOT__nand_ce_map1),32);
        bufp->chgIData(oldp+1258,(vlSelfRef.NAND_top__DOT__nand_rdy_map0),32);
        bufp->chgIData(oldp+1259,(vlSelfRef.NAND_top__DOT__nand_rdy_map1),32);
        bufp->chgIData(oldp+1260,(vlSelfRef.NAND_top__DOT__nand_command),32);
        bufp->chgSData(oldp+1261,(vlSelfRef.NAND_top__DOT__nand_timing),16);
        bufp->chgQData(oldp+1262,(vlSelfRef.NAND_top__DOT__addr_in_die),38);
        bufp->chgCData(oldp+1264,(vlSelfRef.NAND_top__DOT__NAND_STATE),5);
        bufp->chgIData(oldp+1265,(vlSelfRef.NAND_top__DOT__NAND_OP_NUM),32);
        bufp->chgSData(oldp+1266,(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT),14);
        bufp->chgSData(oldp+1267,(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT),14);
        bufp->chgBit(oldp+1268,(vlSelfRef.NAND_top__DOT__nand_clr_ack));
        bufp->chgBit(oldp+1269,(vlSelfRef.NAND_top__DOT__NAND_DONE));
        bufp->chgBit(oldp+1270,(vlSelfRef.NAND_top__DOT__NAND_CE_));
        bufp->chgSData(oldp+1271,((0x00003fffU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 0x00000010U))),14);
        bufp->chgCData(oldp+1272,((7U & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                         >> 0x0000000cU))),3);
        bufp->chgCData(oldp+1273,((0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                  >> 8U))),4);
        bufp->chgBit(oldp+1274,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                       >> 8U))));
        bufp->chgBit(oldp+1275,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                       >> 9U))));
        bufp->chgBit(oldp+1276,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                       >> 0x0000000dU))));
        bufp->chgBit(oldp+1277,(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ));
        bufp->chgBit(oldp+1278,(vlSelfRef.NAND_top__DOT__nand_cmd_valid));
        bufp->chgCData(oldp+1279,(vlSelfRef.NAND_top__DOT__status),8);
        bufp->chgCData(oldp+1280,(vlSelfRef.NAND_top__DOT__nand_number),2);
        bufp->chgQData(oldp+1281,(vlSelfRef.NAND_top__DOT__ID_INFORM),48);
        bufp->chgIData(oldp+1283,(vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD),32);
        bufp->chgCData(oldp+1284,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__) 
                                     << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__) 
                                               << 2U)) 
                                   | (((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__) 
                                       << 1U) | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)))),4);
        bufp->chgCData(oldp+1285,(vlSelfRef.NAND_top__DOT__ADDR_pointer),2);
        bufp->chgCData(oldp+1286,(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT),3);
        bufp->chgCData(oldp+1287,(vlSelfRef.NAND_top__DOT__WAIT_NUM),8);
        bufp->chgCData(oldp+1288,(vlSelfRef.NAND_top__DOT__HOLD_NUM),8);
        bufp->chgCData(oldp+1289,(vlSelfRef.NAND_top__DOT__COMMAND),8);
        bufp->chgCData(oldp+1290,(vlSelfRef.NAND_top__DOT__PRE_STATE),5);
        bufp->chgCData(oldp+1291,(vlSelfRef.NAND_top__DOT__READ_ID_NUM),3);
        bufp->chgSData(oldp+1292,(vlSelfRef.NAND_top__DOT__data_count),14);
        bufp->chgQData(oldp+1293,(vlSelfRef.NAND_top__DOT__NAND_ADDR),38);
        bufp->chgIData(oldp+1295,(vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR),32);
        bufp->chgBit(oldp+1296,(vlSelfRef.NAND_top__DOT__NAND_GO));
        bufp->chgBit(oldp+1297,(vlSelfRef.NAND_top__DOT__NAND_ACK));
        bufp->chgBit(oldp+1298,(vlSelfRef.NAND_top__DOT__DMA_OP_DONE));
        bufp->chgBit(oldp+1299,(vlSelfRef.NAND_top__DOT__ERASE_SERIAL));
        bufp->chgBit(oldp+1300,(vlSelfRef.NAND_top__DOT__now_up_half));
        bufp->chgBit(oldp+1301,(vlSelfRef.NAND_top__DOT__now_oob));
    }
    bufp->chgBit(oldp+1302,(vlSelfRef.aclk));
    bufp->chgBit(oldp+1303,(vlSelfRef.aresetn));
    bufp->chgBit(oldp+1304,(vlSelfRef.enable_delay));
    bufp->chgIData(oldp+1305,(vlSelfRef.random_seed),23);
    bufp->chgBit(oldp+1306,(vlSelfRef.ram_ren));
    bufp->chgIData(oldp+1307,(vlSelfRef.ram_raddr),32);
    bufp->chgIData(oldp+1308,(vlSelfRef.ram_rdata),32);
    bufp->chgCData(oldp+1309,(vlSelfRef.ram_wen),4);
    bufp->chgIData(oldp+1310,(vlSelfRef.ram_waddr),32);
    bufp->chgIData(oldp+1311,(vlSelfRef.ram_wdata),32);
    bufp->chgIData(oldp+1312,(vlSelfRef.debug0_wb_pc),32);
    bufp->chgBit(oldp+1313,(vlSelfRef.debug0_wb_rf_wen));
    bufp->chgCData(oldp+1314,(vlSelfRef.debug0_wb_rf_wnum),5);
    bufp->chgIData(oldp+1315,(vlSelfRef.debug0_wb_rf_wdata),32);
    bufp->chgIData(oldp+1316,(vlSelfRef.num_data),32);
    bufp->chgBit(oldp+1317,(vlSelfRef.open_trace));
    bufp->chgBit(oldp+1318,(vlSelfRef.num_monitor));
    bufp->chgCData(oldp+1319,(vlSelfRef.confreg_uart_data),8);
    bufp->chgBit(oldp+1320,(vlSelfRef.write_uart_valid));
    bufp->chgWData(oldp+1321,(vlSelfRef.uart_ctr_bus),128);
    bufp->chgBit(oldp+1325,(vlSelfRef.uart_rx));
    bufp->chgBit(oldp+1326,(vlSelfRef.uart_tx));
    bufp->chgSData(oldp+1327,(vlSelfRef.led),16);
    bufp->chgCData(oldp+1328,(vlSelfRef.led_rg0),2);
    bufp->chgCData(oldp+1329,(vlSelfRef.led_rg1),2);
    bufp->chgCData(oldp+1330,(vlSelfRef.num_csn),8);
    bufp->chgCData(oldp+1331,(vlSelfRef.num_a_g),7);
    bufp->chgCData(oldp+1332,(vlSelfRef.btn_key_col),4);
    bufp->chgCData(oldp+1333,(vlSelfRef.btn_key_row),4);
    bufp->chgCData(oldp+1334,(vlSelfRef.btn_step),2);
    bufp->chgCData(oldp+1335,(vlSelfRef.nand_type),2);
    bufp->chgBit(oldp+1336,(vlSelfRef.pclk));
    bufp->chgBit(oldp+1337,(vlSelfRef.prst_));
    bufp->chgBit(oldp+1338,(vlSelfRef.pwrite));
    bufp->chgBit(oldp+1339,(vlSelfRef.psel));
    bufp->chgBit(oldp+1340,(vlSelfRef.penable));
    bufp->chgSData(oldp+1341,(vlSelfRef.ADDR),11);
    bufp->chgIData(oldp+1342,(vlSelfRef.DAT_I),32);
    bufp->chgIData(oldp+1343,(vlSelfRef.DAT_O),32);
    bufp->chgCData(oldp+1344,(vlSelfRef.NAND_CE_o),4);
    bufp->chgBit(oldp+1345,(vlSelfRef.NAND_REQ));
    bufp->chgCData(oldp+1346,(vlSelfRef.NAND_I),8);
    bufp->chgCData(oldp+1347,(vlSelfRef.NAND_O),8);
    bufp->chgBit(oldp+1348,(vlSelfRef.NAND_EN_));
    bufp->chgBit(oldp+1349,(vlSelfRef.NAND_ALE));
    bufp->chgBit(oldp+1350,(vlSelfRef.NAND_CLE));
    bufp->chgBit(oldp+1351,(vlSelfRef.NAND_WR_));
    bufp->chgBit(oldp+1352,(vlSelfRef.NAND_RD_));
    bufp->chgCData(oldp+1353,(vlSelfRef.NAND_IORDY_i),4);
    bufp->chgBit(oldp+1354,(vlSelfRef.nand_int));
    bufp->chgIData(oldp+1355,(vlSelfRef.NAND_top__DOT__REG_DAT_T),32);
    bufp->chgBit(oldp+1356,(((IData)(vlSelfRef.psel) 
                             & (0x0040U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgBit(oldp+1357,(vlSelfRef.NAND_top__DOT__NANDtag));
    bufp->chgBit(oldp+1358,(vlSelfRef.NAND_top__DOT__NAND_IORDY));
    bufp->chgBit(oldp+1359,(((IData)(vlSelfRef.psel) 
                             & (0x0010U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgBit(oldp+1360,(((IData)(vlSelfRef.psel) 
                             & (0x0014U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgCData(oldp+1361,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__) 
                                 << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__) 
                                           << 2U)) 
                               | (((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__) 
                                   << 1U) | (1U & (IData)(vlSelfRef.NAND_IORDY_i))))),4);
    bufp->chgCData(oldp+1362,(vlSelfRef.__SYM__switch),8);
    bufp->chgBit(oldp+1363,((1U & (~ (IData)(vlSelfRef.aresetn)))));
    bufp->chgBit(oldp+1364,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)
                                    ? ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en)) 
                                       | (IData)(vlSelfRef.uart_tx))
                                    : (IData)(vlSelfRef.uart_rx)))));
    bufp->chgBit(oldp+1365,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))));
    bufp->chgIData(oldp+1366,(vlSelfRef.__SYM__switch),32);
    bufp->chgBit(oldp+1367,(((~ (0x0000000fU == (IData)(vlSelfRef.btn_key_row))) 
                             & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    bufp->chgBit(oldp+1368,(((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                             & (0x0000000fU == (IData)(vlSelfRef.btn_key_row)))));
    bufp->chgBit(oldp+1369,(((~ (IData)(vlSelfRef.btn_step)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r))));
    bufp->chgBit(oldp+1370,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                   & (IData)(vlSelfRef.btn_step)))));
    bufp->chgBit(oldp+1371,(((~ ((IData)(vlSelfRef.btn_step) 
                                 >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))));
    bufp->chgBit(oldp+1372,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                             & ((IData)(vlSelfRef.btn_step) 
                                >> 1U))));
    bufp->chgBit(oldp+1373,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)))));
}

void Vsimu_top___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_cleanup\n"); );
    // Body
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
}
